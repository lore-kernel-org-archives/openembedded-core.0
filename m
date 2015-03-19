Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD746013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 02:14:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2J2Eofi024329
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 19:14:50 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Mar 2015 19:14:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Mar 2015 19:14:49 -0700
Message-ID: <ed5c921caf1a88c6a177ac3802fc4008d28a575f.1426731250.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1426731250.git.liezhi.yang@windriver.com>
References: <cover.1426731250.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sanity.bbclass: vmdk and live can't be built together
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Mar 2015 02:14:51 -0000
Content-Type: text/plain

Both vmdk and live use syslinux, but they have different/conflicted
configurations, the main conflictions are:

                    vmdk                live
SYSLINUX_ROOT       root=/dev/sda2      root=/dev/ram0
SYSLINUX_LABELS     boot                boot install
INITRD              No                  yes

So it would make the boot menu strange and vmdk can't be boot, we need
add a few extra vars to fix the problem such as SYSLINUX_ROOT_VMDK
SYSLINUX_ROOT_LIVE, but that needs a lot of changes in the code, so just
add a sanity checking for it.

[YOCTO #6889]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 31b99d4..cca39c9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -819,6 +819,10 @@ def check_sanity_everybuild(status, d):
         with open(checkfile, "w") as f:
             f.write(tmpdir)
 
+    # Check vmdk and live can't be built together.
+    if 'vmdk' in d.getVar('IMAGE_FSTYPES', True) and 'live' in d.getVar('IMAGE_FSTYPES', True):
+        status.addresult("Error, IMAGE_FSTYPES vmdk and live can't be built together\n")
+
 def check_sanity(sanity_data):
     import subprocess
 
-- 
1.7.9.5



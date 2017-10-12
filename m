Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B5B2871AB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 07:37:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9C7bZkQ001916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Oct 2017 00:37:35 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 12 Oct 2017 00:37:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 12 Oct 2017 03:37:33 -0400
Message-ID: <1507793853-140841-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] archiver: preserve sysroot paths in configured mode for multilib
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
X-List-Received-Date: Thu, 12 Oct 2017 07:37:34 -0000
Content-Type: text/plain

In the following commit, the archiver expanded RECIPE_SYSROOT
to preserve sysroot paths in configured mode:
...
commit aa2240657b015d46e9ba4bcb6264709a82313d83
Author: Ross Burton <ross.burton@intel.com>
Date:   Tue Jun 6 15:23:18 2017 +0100

    archiver: preserve sysroot paths in configured mode
...

In meta/conf/multilib.conf, it overrides the variables
of STAGING_DIR_HOST, STAGING_DIR_TARGET and RECIPE_SYSROOT
with "${WORKDIR}/${MLPREFIX}recipe-sysroot".

So the archiver should also expand STAGING_DIR_HOST and
STAGING_DIR_TARGET to preserve sysroot paths in configured mode for
multilib.

[YOCTO #11584]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/archiver.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 18c5b96..ec80ad4 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -223,6 +223,8 @@ python do_ar_configured() {
     import shutil
 
     # Forcibly expand the sysroot paths as we're about to change WORKDIR
+    d.setVar('STAGING_DIR_HOST', d.getVar('STAGING_DIR_HOST'))
+    d.setVar('STAGING_DIR_TARGET', d.getVar('STAGING_DIR_TARGET'))
     d.setVar('RECIPE_SYSROOT', d.getVar('RECIPE_SYSROOT'))
     d.setVar('RECIPE_SYSROOT_NATIVE', d.getVar('RECIPE_SYSROOT_NATIVE'))
 
-- 
1.8.3.1



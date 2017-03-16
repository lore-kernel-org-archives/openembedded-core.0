Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 672EB73133
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 10:13:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2GADVFi020204
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 03:13:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 03:13:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 03:13:24 -0700
Message-ID: <4a4f309af98bf85673e7d1d457674382fa46d340.1489657029.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1489657029.git.liezhi.yang@windriver.com>
References: <cover.1489657029.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] runqemu: improve when no machine specified
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
X-List-Received-Date: Thu, 16 Mar 2017 10:13:32 -0000
Content-Type: text/plain

Fixed:
$ runqemu core-image-minimal
[snip]
Exception: FSTYPE is NULL!
[snip]

Get DEPLOY_DIR_IMAGE from "bitbake -e" to make it work.

[YOCTO #10471]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index c5fa88e..add48e6 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -443,6 +443,12 @@ class BaseConfig(object):
                         self.set("DEPLOY_DIR_IMAGE", p)
             self.check_arg_machine(unknown_arg)
 
+        if not (self.get('MACHINE') or self.get('DEPLOY_DIR_IMAGE')):
+            self.load_bitbake_env()
+            s = re.search('^DEPLOY_DIR_IMAGE="(.*)"', self.bitbake_e, re.M)
+            if s:
+                self.set("DEPLOY_DIR_IMAGE", s.group(1))
+
     def check_kvm(self):
         """Check kvm and kvm-host"""
         if not (self.kvm_enabled or self.vhost_enabled):
-- 
2.9.0



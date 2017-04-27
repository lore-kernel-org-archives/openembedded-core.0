Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E004865C8F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 20:36:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 27 Apr 2017 13:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,385,1488873600"; d="scan'208";a="850564000"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2017 13:36:40 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 13:36:23 -0700
Message-Id: <20170427203623.32130-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] selftest/runtime-test: Split the config values
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
X-List-Received-Date: Thu, 27 Apr 2017 20:36:42 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Split the configuration values (common and specific) so it is easier to read
what goes into the config file. Also the specific configurations are
set in every loop so these do not append on each iteration.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/runtime-test.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index e498d046cff..13a4c03a155 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -203,11 +203,12 @@ postinst-delayed-t \
         rootfs_pkg = 'postinst-at-rootfs'
         boot_pkg = 'postinst-delayed-a'
         #Step 1
-        features = 'MACHINE = "qemux86"\n'
-        features += 'CORE_IMAGE_EXTRA_INSTALL += "%s %s "\n'% (rootfs_pkg, boot_pkg)
-        features += 'IMAGE_FEATURES += "ssh-server-openssh"\n'
+        common_features = 'MACHINE = "qemux86"\n'
+        common_features += 'CORE_IMAGE_EXTRA_INSTALL += "%s %s "\n'% (rootfs_pkg, boot_pkg)
+        common_features += 'IMAGE_FEATURES += "ssh-server-openssh"\n'
         for init_manager in ("sysvinit", "systemd"):
             #for sysvinit no extra configuration is needed,
+            features = ''
             if (init_manager is "systemd"):
                 features += 'DISTRO_FEATURES_append = " systemd"\n'
                 features += 'VIRTUAL-RUNTIME_init_manager = "systemd"\n'
@@ -217,7 +218,7 @@ postinst-delayed-t \
                             "package_deb package_rpm package_ipk",
                             "package_ipk package_deb package_rpm"):
                 features += 'PACKAGE_CLASSES = "%s"\n' % classes
-                self.write_config(features)
+                self.write_config(common_features + features)
 
                 #Step 2
                 bitbake('core-image-minimal')
-- 
2.12.0



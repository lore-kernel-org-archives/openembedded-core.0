Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E23297739D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 23:27:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 24 Feb 2016 15:27:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,495,1449561600"; d="scan'208";a="894055329"
Received: from bitbang.jf.intel.com ([10.7.199.90])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 15:27:44 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 15:27:42 -0800
Message-Id: <1456356462-9073-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] populate_sdk_ext: Add images to SDK_INSTALL_TARGETS
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
X-List-Received-Date: Wed, 24 Feb 2016 23:27:48 -0000

When running ext-sdk-prepare.py during sdk installation a check is done to
make sure no tasks would run that aren't provided by the "leaf" recipes
specified in SDK_INSTALL_TARGETS.

However sometimes an image recipe can cause other images to be created
such as an initramfs. So make sure those additional images are
recognized by ext-sdk-prepare.py and don't flag an error.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index a6badb8..9e2fc61 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -40,12 +40,17 @@ def get_sdk_install_targets(d):
     if d.getVar('SDK_EXT_TYPE', True) != 'minimal':
         sdk_install_targets = d.getVar('SDK_TARGETS', True)
 
+        depd = d.getVar('BB_TASKDEPDATA', False)
+        for v in depd.itervalues():
+            if v[1] == 'do_image_complete':
+                if v[0] not in sdk_install_targets:
+                    sdk_install_targets += ' {}'.format(v[0])
+
     if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1':
         sdk_install_targets += ' meta-world-pkgdata:do_allpackagedata'
 
     return sdk_install_targets
 
-SDK_INSTALL_TARGETS = "${@get_sdk_install_targets(d)}"
 OE_INIT_ENV_SCRIPT ?= "oe-init-build-env"
 
 # The files from COREBASE that you want preserved in the COREBASE copied
@@ -344,12 +349,15 @@ SDK_POST_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_postinst}"
 
 SDK_POSTPROCESS_COMMAND_prepend_task-populate-sdk-ext = "copy_buildsystem; install_tools; "
 
+SDK_INSTALL_TARGETS = ""
 fakeroot python do_populate_sdk_ext() {
     # FIXME hopefully we can remove this restriction at some point, but uninative
     # currently forces this upon us
     if d.getVar('SDK_ARCH', True) != d.getVar('BUILD_ARCH', True):
         bb.fatal('The extensible SDK can currently only be built for the same architecture as the machine being built on - SDK_ARCH is set to %s (likely via setting SDKMACHINE) which is different from the architecture of the build machine (%s). Unable to continue.' % (d.getVar('SDK_ARCH', True), d.getVar('BUILD_ARCH', True)))
 
+    d.setVar('SDK_INSTALL_TARGETS', get_sdk_install_targets(d))
+
     bb.build.exec_func("do_populate_sdk", d)
 }
 
-- 
2.5.0



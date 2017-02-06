Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id A1EE171A54
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 21:43:15 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id A8BC4AD0031F; Mon,  6 Feb 2017 22:42:13 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 22:41:56 +0100
Message-Id: <1486417316-29986-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] kernel-module-split: Allow custom suffix for package names
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
X-List-Received-Date: Mon, 06 Feb 2017 21:43:16 -0000

This makes it possible to restore the behaviour changed by commit 78cde87
"kernel-module-split: Append KERNEL_VERSION string to kernel module name".

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 v2: rebased due to conflict with commit 87d03ff

 meta/classes/kernel-module-split.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index db332e5..ba9cc15 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -33,6 +33,7 @@ PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
 KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
 
 KERNEL_MODULE_PACKAGE_PREFIX ?= ""
+KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
 KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
 
 python split_kernel_module_packages () {
@@ -131,7 +132,8 @@ python split_kernel_module_packages () {
     module_regex = '^(.*)\.k?o$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
-    module_pattern = module_pattern_prefix + 'kernel-module-%s-' + d.getVar("KERNEL_VERSION")
+    module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
+    module_pattern = module_pattern_prefix + 'kernel-module-%s' + module_pattern_suffix
 
     postinst = d.getVar('pkg_postinst_modules')
     postrm = d.getVar('pkg_postrm_modules')
-- 
2.7.4



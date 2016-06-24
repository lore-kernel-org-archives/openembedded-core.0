Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D3AF460017
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 23:43:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jun 2016 16:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,523,1459839600"; d="scan'208";a="724697500"
Received: from unknown (HELO luv-build.sc.intel.com) ([172.25.110.25])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 16:43:25 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 16:42:28 -0700
Message-Id: <1466811748-31237-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Cc: Megha Dey <megha.dey@intel.com>
Subject: [PATCH] kernel-module-split.bbclass: add a prefix for module package name pattern
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
X-List-Received-Date: Fri, 24 Jun 2016 23:43:26 -0000

When splitting kernel modules into individual packages, such packages take
their names from the module name. This is OK under most of the circumstances.
However, it may lead to package naming collisions if there exists two
modules with the same name.

Situations like this can occur when building testing modules. For instance,
there exists testing versions of the modules for non-volatile memory that
are built with different linker options but bear the same module name. If
one wants to package such modules, it is be good to be able to name
packages differently. This can be done by prefixing the package name with
a KERNEL_MODULE_PACKAGE_PREFIX that can be set by the recipes that inherit
from module.bbclass.

Cc: Megha Dey <megha.dey@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 meta/classes/kernel-module-split.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index e1a70e6..ed42d2b 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -30,6 +30,8 @@ PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
 
 KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
 
+KERNEL_MODULE_PACKAGE_PREFIX ?= ""
+
 python split_kernel_module_packages () {
     import re
 
@@ -181,7 +183,9 @@ python split_kernel_module_packages () {
 
     module_deps = parse_depmod()
     module_regex = '^(.*)\.k?o$'
-    module_pattern = 'kernel-module-%s'
+
+    module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX', True)
+    module_pattern = module_pattern_prefix + 'kernel-module-%s'
 
     postinst = d.getVar('pkg_postinst_modules', True)
     postrm = d.getVar('pkg_postrm_modules', True)
-- 
2.8.1



Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 087C36017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 09:00:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Oct 2014 02:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,645,1406617200"; d="scan'208";a="609154550"
Received: from rebeccas-ilbpg2.png.intel.com ([10.88.227.41])
	by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2014 02:00:57 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Oct 2014 17:00:18 +0800
Message-Id: <1412326818-32462-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1412326818-32462-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1412326818-32462-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [daisy] [PATCH 1/1] lttng-modules: Update to version 2.4.2
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
X-List-Received-Date: Fri, 03 Oct 2014 09:00:59 -0000

lttng-modules breaks when building with kernel 3.10.43.
This updates lttng-modules for 2.4.2 and it will also
fixes the build failure with kernel 3.10.43.

Fixes for [YOCTO #6788]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb |   38 ----------------------
 meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb |   38 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
deleted file mode 100644
index aa01a8d..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SECTION = "devel"
-SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
-DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
-                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
-                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
-
-DEPENDS = "virtual/kernel"
-
-inherit module
-
-SRCREV = "fb2c37799306d16fb590aebee6fad8be431264b7"
-PV = "2.4.0"
-
-# lttng currently blacklists arm with gcc-4.8
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
-
-SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.4 \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-           file://bio-bvec-iter.patch"
-
-export INSTALL_MOD_DIR="kernel/lttng-modules"
-export KERNEL_SRC="${STAGING_KERNEL_DIR}"
-
-
-S = "${WORKDIR}/git"
-
-do_install_append() {
-	# Delete empty directories to avoid QA failures if no modules were built
-	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
-}
-
-python do_package_prepend() {
-    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules')):
-        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN', True))
-}
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
new file mode 100644
index 0000000..1967631
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
@@ -0,0 +1,38 @@
+SECTION = "devel"
+SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
+DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
+                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
+                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
+
+DEPENDS = "virtual/kernel"
+
+inherit module
+
+SRCREV = "85016adfb21268836df48dfb5cda106391e72fd1"
+PV = "2.4.2"
+
+# lttng currently blacklists arm with gcc-4.8
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
+
+SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.4 \
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
+           "
+
+export INSTALL_MOD_DIR="kernel/lttng-modules"
+export KERNEL_SRC="${STAGING_KERNEL_DIR}"
+
+
+S = "${WORKDIR}/git"
+
+do_install_append() {
+	# Delete empty directories to avoid QA failures if no modules were built
+	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
+}
+
+python do_package_prepend() {
+    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules')):
+        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN', True))
+}
+
-- 
1.7.9.5



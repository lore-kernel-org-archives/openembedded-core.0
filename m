Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB93600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 15:37:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1JFbdIp019861
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Feb 2018 07:37:39 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 19 Feb 2018 07:37:22 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 19 Feb 2018 10:37:37 -0500
Message-ID: <1519054657-4616-2-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1519054657-4616-1-git-send-email-bruce.ashfield@windriver.com>
References: <1519054657-4616-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] make-mod-scripts: change how some kernel module tools are built
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
X-List-Received-Date: Mon, 19 Feb 2018 15:37:39 -0000
Content-Type: text/plain

From: Joe Slater <jslater@windriver.com>

Remove do_make_scripts() from module-base.bbclass and put
functionality in a recipe.  This will build the scripts only
once instead of each time an external module is built.

[YOCTO #12228]

Signed-off-by: Joe Slater <jslater@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

v2: added the LIC_FILES_CHECKSUM

 meta/classes/module-base.bbclass                   | 12 +++-------
 meta/classes/module.bbclass                        |  4 ----
 .../make-mod-scripts/make-mod-scripts_1.0.bb       | 26 ++++++++++++++++++++++
 3 files changed, 29 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb

diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index f851b851639a..27bd69ff33bf 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -1,7 +1,8 @@
 inherit kernel-arch
 
-# This is instead of DEPENDS = "virtual/kernel"
-do_configure[depends] += "virtual/kernel:do_compile_kernelmodules"
+# We do the dependency this way because the output is not preserved
+# in sstate, so we must force do_compile to run (once).
+do_configure[depends] += "make-mod-scripts:do_compile"
 
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
@@ -18,10 +19,3 @@ KERNEL_OBJECT_SUFFIX = ".ko"
 # kernel modules are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# Function to ensure the kernel scripts are created. Expected to
-# be called before do_compile. See module.bbclass for an example.
-do_make_scripts() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
-	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
-}
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 78d1b21dbd83..e34496024434 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,9 +1,5 @@
 inherit module-base kernel-module-split pkgconfig
 
-addtask make_scripts after do_prepare_recipe_sysroot before do_configure
-do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
-
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 MODULES_INSTALL_TARGET ?= "modules_install"
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
new file mode 100644
index 000000000000..845b409452dc
--- /dev/null
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Build tools needed by external modules"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+inherit kernel-arch
+inherit pkgconfig
+
+S = "${WORKDIR}"
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
+
+# Build some host tools under work-shared.  CC, LD, and AR are probably
+# not used, but this is the historical way of invoking "make scripts".
+#
+do_configure() {
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
+}
+
+
+# There is no reason to build this on its own.
+#
+EXCLUDE_FROM_WORLD = "1"
+
-- 
2.5.0



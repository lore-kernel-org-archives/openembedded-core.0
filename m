Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 554A87870F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:59:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0QDxbbr011525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 26 Jan 2018 05:59:37 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 26 Jan 2018 05:59:36 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jan 2018 08:59:23 -0500
Message-ID: <f277f872c728ed18709c58e88e26a3fc81f23663.1516973739.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1516973739.git.bruce.ashfield@windriver.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH 12/12] make-mod-scripts: change how some kernel module tools are built
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
X-List-Received-Date: Fri, 26 Jan 2018 13:59:37 -0000
Content-Type: text/plain

From: Joe Slater <jslater@windriver.com>

Remove do_make_scripts() from module-base.bbclass and put
functionality in a recipe.  This will build the scripts only
once instead of each time an external module is built.

[YOCTO #12228]

Signed-off-by: Joe Slater <jslater@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/module-base.bbclass                   | 12 +++--------
 meta/classes/module.bbclass                        |  4 ----
 .../make-mod-scripts/make-mod-scripts_1.0.bb       | 24 ++++++++++++++++++++++
 3 files changed, 27 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb

diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 6fe77c01b7ed..d6762a7dffd8 100644
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
index 000000000000..6645c873f015
--- /dev/null
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Build tools needed by external modules"
+LICENSE = "GPLv2"
+
+inherit kernel-arch
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



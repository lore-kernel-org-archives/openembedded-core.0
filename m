Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00354783BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 17:13:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6LHDHIF016825
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 10:13:18 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Jul 2017 10:13:17 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jul 2017 10:13:17 -0700
Message-ID: <1500657197-10664-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] modules: move creation of some module related tools
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
X-List-Received-Date: Fri, 21 Jul 2017 17:13:19 -0000
Content-Type: text/plain

Move creation of tools needed by module building recipes into
kernel.bbclass but invoke the task only from the module recipes.
Without this change, one module recipe can fail trying to use the
tools while another is (re-)building them.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/kernel.bbclass      | 15 +++++++++++++++
 meta/classes/module-base.bbclass | 10 ++--------
 meta/classes/module.bbclass      |  4 ----
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7670c71..131387e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -280,6 +280,11 @@ kernel_do_compile() {
 
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+
+	# build modpost, etc
+	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
+
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 
@@ -296,6 +301,16 @@ do_compile_kernelmodules() {
 }
 addtask compile_kernelmodules after do_compile before do_strip
 
+# Task to ensure the kernel scripts are created. Expected to be invoked
+# only by module building recipes. See module.bbclass for an example.
+do_make_scripts() {
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
+	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
+}
+addtask make_scripts after do_compile_kernelmodules
+do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
+
 kernel_do_install() {
 	#
 	# First install the modules
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 6fe77c0..c1fe191 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -1,7 +1,8 @@
 inherit kernel-arch
 
 # This is instead of DEPENDS = "virtual/kernel"
-do_configure[depends] += "virtual/kernel:do_compile_kernelmodules"
+# do_make_scripts() used to be in here, but is now in kernel.bbclass
+do_configure[depends] += "virtual/kernel:do_make_scripts"
 
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
index 391776d..e344960 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,9 +1,5 @@
 inherit module-base kernel-module-split pkgconfig
 
-addtask make_scripts after do_prepare_recipe_sysroot before do_compile
-do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
-
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 MODULES_INSTALL_TARGET ?= "modules_install"
-- 
2.7.4



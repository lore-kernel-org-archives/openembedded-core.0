Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id CC48B72B9A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 11:55:55 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id x13so14405384wgg.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 03:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QqaRKcGiKyWRkiDOCk6aU3Fcr4VE97NQZTxA+4kB0l4=;
	b=bqFWmeXrWxw62L/9L8js8vsSopXjqgNHGRrNRgvvmUvfMw1WzIAQgpm/NikqKktAxT
	4II0Nd2HZliGRynRMYtGZNrDLdlO6nNypTG+zQmLHKvxOcn31+W/n2URwbefFHMl7y34
	buV0hvvklPAIdS1iAQDh/sQ3b9JWC1Lzg5c1xANYcjUxpAm+pesI6MXEL2GXvpgghKKh
	wWlYqcVTQvxLGAj1AEk9hZFmgSdxfbr5n6a01LuEOhH11nXEiWnjw4yAKggvJFECK0ls
	D7X67Q6mWd4kr6aaAwDQycNcLB+y2AhGROujBdORNm5BedPsXFpUITbiywt/X+9tewdU
	UNPQ==
X-Gm-Message-State: ALoCoQllWSIEDxYidihPgcPQQ3xfHpid5RJuFd0vBmNWZODhrCX5tzL+4MvbT42C2V/7xsx4bqL5
X-Received: by 10.181.29.198 with SMTP id jy6mr25776109wid.0.1421322955684;
	Thu, 15 Jan 2015 03:55:55 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id vh8sm1798509wjc.12.2015.01.15.03.55.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 03:55:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 11:54:15 +0000
Message-Id: <1421322860-12652-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
References: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
Cc: dvhart@linux.intel.com
Subject: [PATCH 3/8] kernel: move source and build output to work-shared
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
X-List-Received-Date: Thu, 15 Jan 2015 11:55:58 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

commit 3b3f7e785e279 [kernel: Rearrange for 1.8] began the process of
moving the kernel source and build artefacts out of sstate control and
into a shared location.

This changed triggered some workflow issues, as well as bugs related
to the kernel source containing build output, and hence being dirty and
breaking kernel rebuilds.

To solve these issues, and to make it clear that the kernel is not under
sstate control, we move the source and build outputs to:

  work-shared/MACHINE/kernel-source
  work-shared/MACHINE/kernel-build-artifacts

Where kernel-build-artifacts is the kernel build output and
kernel-source is kept "pristine". The build-artifacts contain everything
that is required to build external modules against the kernel source,
and includes the defconfig, the kernel-abiversion, System.map files and
output from "make scripts".

External module builds should either pass O= on the command line, or
set KBUILD_OUTPUT to point to the build-artifacts. module-base.bbclass
takes care of setting KBUILD_OUTPUT, so most existing external module
recipes are transparently adapted to the new source/build layout.

recipes that depend on the kernel source must have a depedency on the
do_shared_workdir task:

 do_configure[depends] += "virtual/kernel:do_shared_workdir"

With this dependency added, the STAGING_KERNEL_DIR will be populated and
available to the rest of the build.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/kernel-module-split.bbclass         |    2 +-
 meta/classes/kernel.bbclass                      |   30 +++++++++++++---------
 meta/classes/module-base.bbclass                 |   12 +++++++--
 meta/classes/module.bbclass                      |    2 ++
 meta/conf/bitbake.conf                           |    3 ++-
 meta/recipes-kernel/linux/kernel-devsrc.bb       |   14 +++++++---
 meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb |    2 +-
 meta/recipes-kernel/perf/perf.bb                 |    2 +-
 8 files changed, 46 insertions(+), 21 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 9a95b72..2d43b51 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -70,7 +70,7 @@ python split_kernel_module_packages () {
         m = kerverrexp.match(kernelver)
         if m:
             kernelver_stripped = m.group(1)
-        staging_kernel_dir = d.getVar("STAGING_KERNEL_DIR", True)
+        staging_kernel_dir = d.getVar("STAGING_KERNEL_BUILDDIR", True)
         system_map_file = "%s/boot/System.map-%s" % (dvar, kernelver)
         if not os.path.exists(system_map_file):
             system_map_file = "%s/System.map-%s" % (staging_kernel_dir, kernelver)
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 78c8c7c..a60de8c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -230,28 +230,33 @@ kernel_do_install() {
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
+}
+do_install[prefuncs] += "package_get_auto_pr"
 
-	#
-	# Support for external module building - create a minimal copy of the
-	# kernel source tree.
-	#
-	kerneldir=${D}${KERNEL_SRC_PATH}
+addtask shared_workdir after do_compile before do_install
+
+do_shared_workdir () {
+	cd ${B}
+
+	kerneldir=${STAGING_KERNEL_BUILDDIR}
 	install -d $kerneldir
-	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}
-	ln -sf ${KERNEL_SRC_PATH} "${D}/lib/modules/${KERNEL_VERSION}/build"
 
 	#
 	# Store the kernel version in sysroots for module-base.bbclass
 	#
 
 	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
-	
+
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
 	cp Module.symvers $kerneldir/
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+
+	# We can also copy over all the generated files and avoid special cases
+	# like version.h, but we've opted to keep this small until file creep starts
+	# to happen
 	if [ -e include/linux/version.h ]; then
 		mkdir -p $kerneldir/include/linux
 		cp include/linux/version.h $kerneldir/include/linux/version.h
@@ -273,10 +278,11 @@ kernel_do_install() {
 		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
 	fi
 }
-do_install[prefuncs] += "package_get_auto_pr"
 
-python sysroot_stage_all () {
-    oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
+# We have an empty sysroot_stage_all to keep the default routine from
+# package.bbclass from expanding the kernel source into the sysroot and
+# colliding with linux-firmware files
+sysroot_stage_all () {
 }
 
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"
@@ -467,7 +473,7 @@ kernel_do_deploy() {
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 do_deploy[prefuncs] += "package_get_auto_pr"
 
-addtask deploy before do_build after do_install
+addtask deploy after do_populate_sysroot
 
 EXPORT_FUNCTIONS do_deploy
 
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 9537ba9..3eb2e92 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -3,16 +3,24 @@ inherit kernel-arch
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
-export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
+# This points to the build artefacts from the main kernel build
+# such as .config and System.map
+# Confusingly it is not the module build output (which is ${B}) but
+# we didn't pick the name.
+export KBUILD_OUTPUT = "${STAGING_KERNEL_BUILDDIR}"
+
+export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
 KERNEL_OBJECT_SUFFIX = ".ko"
 
 # kernel modules are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
 # Function to ensure the kernel scripts are created. Expected to
 # be called before do_compile. See module.bbclass for an exmaple.
 do_make_scripts() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
 	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           -C ${STAGING_KERNEL_DIR} scripts
+	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
 }
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 5cb8623..a03cc74 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -14,6 +14,7 @@ module_do_compile() {
 		   KERNEL_VERSION=${KERNEL_VERSION}    \
 		   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 		   AR="${KERNEL_AR}" \
+	           O=${STAGING_KERNEL_BUILDDIR} \
 		   ${MAKE_TARGETS}
 }
 
@@ -21,6 +22,7 @@ module_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" \
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
+	           O=${STAGING_KERNEL_BUILDDIR} \
 	           modules_install
 }
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7902bd7..d22e9e8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -395,7 +395,8 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 ##################################################################
 
 OLDEST_KERNEL = "2.6.32"
-STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/usr/src/kernel"
+STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
+STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
 
 ##################################################################
 # Specific image creation and rootfs population info.
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index dbb3a5c..a7395c4 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -15,7 +15,7 @@ inherit module-base
 
 # We need the kernel to be staged (unpacked, patched and configured) before
 # we can grab the source and make the kernel-devsrc package
-do_install[depends] += "virtual/kernel:do_populate_sysroot"
+do_install[depends] += "virtual/kernel:do_shared_workdir"
 # Need the source, not just the output of populate_sysroot
 do_install[depends] += "virtual/kernel:do_configure"
 
@@ -30,7 +30,8 @@ do_populate_sysroot[noexec] = "1"
 # Define where the kernel headers are installed on the target as well as where
 # they are staged.
 KERNEL_SRC_PATH = "/usr/src/kernel"
-S = "${STAGING_DIR_TARGET}/${KERNEL_SRC_PATH}"
+S = "${STAGING_KERNEL_DIR}"
+B = "${STAGING_KERNEL_BUILDDIR}"
 
 KERNEL_VERSION = "${@get_kernelversion_headers('${S}')}"
 
@@ -45,8 +46,15 @@ do_install() {
         # We can keep this copy simple and take everything, since a we'll clean up any build
         # artifacts afterwards, and the extra i/o is not significant
         #
+        cd ${B}
+        find . -type d -name '.git*' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
         cd ${S}
         find . -type d -name '.git*' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
+
+        # Explicitly set KBUILD_OUTPUT to ensure that the image directory is cleaned and not
+        # The main build artifacts. We clean the directory to avoid QA errors on mismatched
+        # architecture (since scripts and helpers are native format).
+        KBUILD_OUTPUT="$kerneldir"
         oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts
 
         # As of Linux kernel version 3.0.1, the clean target removes
@@ -54,7 +62,7 @@ do_install() {
         # KBUILD_LDFLAGS_MODULE, making it required to build external modules.
         if [ ${ARCH} = "powerpc" ]; then
                 mkdir -p $kerneldir/arch/powerpc/lib/
-                cp ${S}/arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
+                cp ${B}/arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
         fi
 }
 # Ensure we don't race against "make scripts" during cpio
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
index 55df07f..6ec83d0 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
                     file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 DEPENDS = "virtual/kernel"
-do_configure[depends] += "virtual/kernel:do_install"
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
 inherit module
 
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index a42aa73..d2c9805 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -32,7 +32,7 @@ DEPENDS = " \
     bison flex \
 "
 
-do_configure[depends] += "virtual/kernel:do_install"
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
 PROVIDES = "virtual/perf"
 
-- 
1.7.10.4



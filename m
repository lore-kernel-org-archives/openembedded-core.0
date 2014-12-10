Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 963C9724C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:34:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAYCpQ005441
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:34:12 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:34:12 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 05:34:02 -0500
Message-ID: <761ca8766dfd2e4e5fa19b49f1602768c4a24f69.1418207154.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418207154.git.bruce.ashfield@windriver.com>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] kernel: Rearrange for 1.8
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
X-List-Received-Date: Wed, 10 Dec 2014 10:34:16 -0000
Content-Type: text/plain

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In 1.8 we want to streamline the kernel build process. Basically we
currently have multiple copies of the kernel source floating around
and the copying/compression/decompression is painful.

Lets assume we have a kernel source per machine since in most cases
this is true (and we have a sysroot per machine anyway). Basically,
instead of extracting a source into WORKDIR, then copying to a sysroot,
we now set S to point straight at STAGING_DIR_KERNEL.

Anything using kernel source can then just point at it and use:

do_configure[depends] += "virtual/kernel:do_patch"

to depend on the kernel source being present. Note this is different
behaviour to DEPENDS += "virtual/kernel" which equates to
do_configure[depends] += "virtual/kernel:do_populate_sysroot".

Once we do this, we no longer need the copy operation in
do_populate_sysroot, in fact there is nothing to do there (yay).

The remaining part of the challenge is to kill off the horrible
do_install. This patch splits it off to a different class, the idea here
is to have a separate recipe which depends on the virtual/kernel:do_patch
and just installs and packages the source needed to build modules on
target into a specific package.

Right now this code is proof of concept. It builds kernels and kernel
modules. perf blows up in do_package with issues on finding the kernel
version which can probably be fixed by adding back the right bit of do_install,
and adding a dependency of do_package[depends] += "virtual/kernel:do_install"
to perf. The whole thing needs a good write up, the corner cases testing
and probably a good dose of cleanup to the remaining code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-yocto.bbclass      |  2 -
 meta/classes/kernel.bbclass            | 91 ++--------------------------------
 meta/classes/linux-kernel-base.bbclass | 13 ++++-
 meta/recipes-kernel/perf/perf.bb       | 12 ++---
 4 files changed, 20 insertions(+), 98 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index c3e24943bbaf..45bdc9670afe 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -1,5 +1,3 @@
-S = "${WORKDIR}/linux"
-
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_kernel_link_vmlinux do_kernel_configme do_validate_branches do_kernel_configcheck do_kernel_checkout do_patch"
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index fa06c3aae6f3..0d335a589121 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -3,6 +3,8 @@ inherit linux-kernel-base kernel-module-split
 PROVIDES += "virtual/kernel"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
 
+S = "${STAGING_DIR_TARGET}/${KERNEL_SRC_PATH}"
+
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -55,7 +57,7 @@ KERNEL_IMAGEDEST = "boot"
 #
 export CMDLINE_CONSOLE = "console=${@d.getVar("KERNEL_CONSOLE",1) or "ttyS0"}"
 
-KERNEL_VERSION = "${@get_kernelversion('${B}')}"
+KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
 
 KERNEL_LOCALVERSION ?= ""
 
@@ -221,93 +223,6 @@ kernel_do_install() {
 	#
 
 	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
-
-	#
-	# Store kernel image name to allow use during image generation
-	#
-
-	echo "${KERNEL_IMAGE_BASE_NAME}" >$kerneldir/kernel-image-name
-
-	#
-	# Copy the entire source tree. In case an external build directory is
-	# used, copy the build directory over first, then copy over the source
-	# dir. This ensures the original Makefiles are used and not the
-	# redirecting Makefiles in the build directory.
-	#
-	find . -depth -not -name "*.cmd" -not -name "*.o" -not -name "*.so.dbg" -not -name "*.so" -not -path "./Documentation*" -not -path "./source*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
-	cp .config $kerneldir
-	if [ "${S}" != "${B}" ]; then
-		pwd="$PWD"
-		cd "${S}"
-		find . -depth -not -path "./Documentation*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
-		cd "$pwd"
-	fi
-
-	# Test to ensure that the output file and image type are not actually
-	# the same file. If hardlinking is used, they will be the same, and there's
-	# no need to install.
-	! [ ${KERNEL_OUTPUT} -ef $kerneldir/${KERNEL_IMAGETYPE} ] && install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
-	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
-
-	# Dummy Makefile so the clean below works
-        mkdir $kerneldir/Documentation
-        touch $kerneldir/Documentation/Makefile
-
-	#
-	# Clean and remove files not needed for building modules.
-	# Some distributions go through a lot more trouble to strip out
-	# unecessary headers, for now, we just prune the obvious bits.
-	#
-	# We don't want to leave host-arch binaries in /sysroots, so
-	# we clean the scripts dir while leaving the generated config
-	# and include files.
-	#
-	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts 
-
-	# hide directories that shouldn't have their .c, s and S files deleted
-	for d in tools scripts lib; do
-		mv $kerneldir/$d $kerneldir/.$d
-	done
-
-	# delete .c, .s and .S files, unless we hid a directory as .<dir>. This technique is 
-	# much faster than find -prune and -exec
-	find $kerneldir -not -path '*/\.*' -type f -name "*.[csS]" -delete
-
-	# put the hidden dirs back
-	for d in tools scripts lib; do
-		mv $kerneldir/.$d $kerneldir/$d
-	done
-
-	# As of Linux kernel version 3.0.1, the clean target removes
-	# arch/powerpc/lib/crtsavres.o which is present in
-	# KBUILD_LDFLAGS_MODULE, making it required to build external modules.
-	if [ ${ARCH} = "powerpc" ]; then
-		cp -l arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
-	fi
-
-	# Necessary for building modules like compat-wireless.
-	if [ -f include/generated/bounds.h ]; then
-		cp -l include/generated/bounds.h $kerneldir/include/generated/bounds.h
-	fi
-	if [ -d arch/${ARCH}/include/generated ]; then
-		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
-		cp -flR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
-	fi
-
-	# Remove the following binaries which cause strip or arch QA errors
-	# during do_package for cross-compiled platforms
-	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
-	           arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
-		   scripts/kconfig/conf.o scripts/kconfig/kxgettext.o"
-	for entry in $bin_files; do
-		rm -f $kerneldir/$entry
-	done
-
-	# kernels <2.6.30 don't have $kerneldir/tools directory so we check if it exists before calling sed
-	if [ -f $kerneldir/tools/perf/Makefile ]; then
-		# Fix SLANG_INC for slang.h
-		sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
-	fi
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-kernel-base.bbclass
index 4f2b0a4a9844..89ce71605c00 100644
--- a/meta/classes/linux-kernel-base.bbclass
+++ b/meta/classes/linux-kernel-base.bbclass
@@ -1,5 +1,5 @@
 # parse kernel ABI version out of <linux/version.h>
-def get_kernelversion(p):
+def get_kernelversion_headers(p):
     import re
 
     fn = p + '/include/linux/utsrelease.h'
@@ -9,7 +9,6 @@ def get_kernelversion(p):
     if not os.path.isfile(fn):
         fn = p + '/include/linux/version.h'
 
-    import re
     try:
         f = open(fn, 'r')
     except IOError:
@@ -24,6 +23,16 @@ def get_kernelversion(p):
             return m.group(1)
     return None
 
+
+def get_kernelversion_file(p):
+    fn = p + '/kernel-abiversion'
+
+    try:
+        with open(fn, 'r') as f:
+            return f.readlines()[0].strip()
+    except IOError:
+        return None
+
 def linux_module_packages(s, d):
 	suffix = ""
 	return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 3771cdb3e9dd..d375e246ce30 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -22,7 +22,7 @@ TUI_DEPENDS = "${@perf_feature_enabled('perf-tui', 'libnewt slang', '',d)}"
 SCRIPTING_DEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl python', '',d)}"
 LIBUNWIND_DEPENDS = "${@perf_feature_enabled('perf-libunwind', 'libunwind', '',d)}"
 
-DEPENDS = "virtual/kernel \
+DEPENDS = " \
     virtual/${MLPREFIX}libc \
     ${MLPREFIX}elfutils \
     ${MLPREFIX}binutils \
@@ -32,6 +32,8 @@ DEPENDS = "virtual/kernel \
     bison flex \
 "
 
+do_configure[depends] += "virtual/kernel:do_patch"
+
 PROVIDES = "virtual/perf"
 
 inherit linux-kernel-base kernel-arch pythonnative
@@ -46,7 +48,7 @@ export HOST_SYS
 #kernel 3.1+ supports WERROR to disable warnings as errors
 export WERROR = "0"
 
-do_populate_lic[depends] += "virtual/kernel:do_populate_sysroot"
+do_populate_lic[depends] += "virtual/kernel:do_patch"
 
 # needed for building the tools/perf Perl binding
 inherit perlnative cpan-base
@@ -56,9 +58,7 @@ export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}
 export PERL_LIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
 export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
 
-S = "${STAGING_KERNEL_DIR}"
-# The source should be ready after the do_unpack
-do_unpack[depends] += "virtual/kernel:do_populate_sysroot"
+inherit kernelsrc
 
 B = "${WORKDIR}/${BPN}-${PV}"
 
@@ -157,7 +157,7 @@ do_configure_prepend () {
 }
 
 python do_package_prepend() {
-    bb.data.setVar('PKGV', get_kernelversion('${S}').split("-")[0], d)
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.1.0



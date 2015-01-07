Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A9D8871440
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 12:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t07CQ6j5031751; Wed, 7 Jan 2015 12:26:06 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zI94vuXoAlj2; Wed,  7 Jan 2015 12:26:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t07CPqGO031742
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 7 Jan 2015 12:26:03 GMT
Message-ID: <1420633589.25779.69.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 07 Jan 2015 12:26:29 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: RFC: Further kernel build process changes?
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
X-List-Received-Date: Wed, 07 Jan 2015 12:26:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm hearing (somewhat justified) complaints that the recent kernel
changes have destablised builds. Part of the question is whether the
recent changes are as clear to users as they could be, we're also
running into some problems due to mixing kernel source and build
artefacts in some places and not in others.

At this point I think it may be worth looking at making some more
invasive but decisive changes, specifically that:

STAGING_KERNEL_DIR moves 
   from sysroots/MACHINE/usr/src/kernel
   to work-shared/MACHINE/kernel-source

This is to make it clearer that the source here is not under the control
of sstate. The reasons why we don't want it under the control of sstate
are in other emails.

The second change would be to split the kernel source into two:

work-shared/MACHINE/kernel-source
work-shared/MACHINE/kernel-build

where kernel-build is the kernel build output and kernel-source is kept
"pristine".

This means the defconfig, the kernel-abiversion, System.map files and
output from "make scripts" would be in kernel-build.

External module builds do work in this configuration *if* you pass in
the correct options e.g.:

make -C work-shared/MACHINE/kernel-source O=work-shared/MACHINE/kernel-build M=${S}

I've put together a quick proof of concept of this below.

There are two other things up for discussion. There is of confusion  on
how the kernel source gets into STAGING_KERNEL_DIR in the first place.
We've added in "munging" code which does this in kernel.bbclass,
linux-yocto also has its share of "crazy" mess in this regard.

We could wipe the slate clean and require that people put a parameter
against the element in SRC_URI that represents the kernel indicating it
should be directly extracted to STAGING_KERNEL_DIR. There is a bitbake
issue with being unable to override the extraction directory at present
but that can be fixed. The upside is that it would be clean, relatively
clear and allow  fragile code to be dropped. The downside is it means
tweaking all kernel recipes.

The second issue is that of the dependency to populate
STAGING_KERNEL_DIR which is now a "depends flag on do_install". The
intent is to have kernelsrc.bbclass do this, looking at the things there
(such as setting S=), I suspect it may not be fit for purpose. We could
adjust the class to check for a variable and set up the dependency if
its set.

Anyhow, this does need thought and discussion but I'm putting it here as
a start to that, and to let people like Bruce see and experiment with
the code below.

Cheers,

Richard

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
index 5cabc2c..b1a1ccf 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -249,6 +249,10 @@ kernel_do_install() {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	if [ -e include/linux/version.h ]; then
+		mkdir -p $kerneldir/include/linux
+		cp include/linux/version.h $kerneldir/include/linux/version.h
+	fi
 
 	# As of Linux kernel version 3.0.1, the clean target removes
 	# arch/powerpc/lib/crtsavres.o which is present in
@@ -268,6 +272,45 @@ kernel_do_install() {
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
+addtask do_shared_workdir after do_compile before do_install
+
+do_shared_workdir () {
+	cd ${B}
+
+	kerneldir=${STAGING_KERNEL_BUILDDIR}
+	install -d $kerneldir
+
+	#
+	# Store the kernel version in sysroots for module-base.bbclass
+	#
+
+	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
+	
+	# Copy files required for module builds
+	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
+	cp Module.symvers $kerneldir/
+	cp .config $kerneldir/
+	mkdir -p $kerneldir/include/config
+	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+
+	# As of Linux kernel version 3.0.1, the clean target removes
+	# arch/powerpc/lib/crtsavres.o which is present in
+	# KBUILD_LDFLAGS_MODULE, making it required to build external modules.
+	if [ ${ARCH} = "powerpc" ]; then
+		mkdir -p $kerneldir/arch/powerpc/lib/
+		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
+	fi
+
+	mkdir -p $kerneldir/include/generated/
+	cp -fR include/generated/* $kerneldir/include/generated/
+
+	if [ -d arch/${ARCH}/include/generated ]; then
+		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
+		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
+	fi
+}
+
+
 python sysroot_stage_all () {
     oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
 }
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 9537ba9..c34eee7 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -3,16 +3,18 @@ inherit kernel-arch
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
-export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
+export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
 KERNEL_OBJECT_SUFFIX = ".ko"
 
 # kernel modules are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+do_configure[depends] += "virtual/kernel:do_install"
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
index ad6f7af..4f466d7 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -13,6 +13,7 @@ module_do_compile() {
 		   KERNEL_VERSION=${KERNEL_VERSION}    \
 		   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 		   AR="${KERNEL_AR}" \
+	           O=${STAGING_KERNEL_BUILDDIR} \
 		   ${MAKE_TARGETS}
 }
 
@@ -21,6 +22,7 @@ module_do_install() {
 	oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" \
 	           KERNEL_SRC=${STAGING_KERNEL_DIR} \
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
+	           O=${STAGING_KERNEL_BUILDDIR} \
 	           modules_install
 }
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 362d6b6..b1135c2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -394,7 +394,8 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 ##################################################################
 
 OLDEST_KERNEL = "2.6.32"
-STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/usr/src/kernel"
+STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
+STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build"
 
 ##################################################################
 # Specific image creation and rootfs population info.
diff --git a/meta/recipes-kernel/lttng/lttng-modules/sepbuild.patch b/meta/recipes-kernel/lttng/lttng-modules/sepbuild.patch
new file mode 100644
index 0000000..1b46558
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/sepbuild.patch
@@ -0,0 +1,17 @@
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -67,10 +67,10 @@ else # KERNELRELEASE
+ 	CFLAGS = $(EXTCFLAGS)
+ 
+ default:
+-	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules
++	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) O=$(O) modules
+ 
+ modules_install:
+-	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules_install
++	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) O=$(O) modules_install
+ 
+ clean:
+ 	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) clean
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
index 55df07f..58a4196 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.5 \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
            file://Fix-noargs-probes-should-calculate-alignment-and-eve.patch \
            file://Update-kvm-instrumentation-compile-on-3.17-rc1.patch \
+           file://sepbuild.patch \
            "
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"



Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 545E56F5B9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 18:16:02 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 06 Mar 2014 10:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,602,1389772800"; d="scan'208";a="345991264"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Mar 2014 10:16:03 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 5F7506A4007;
	Thu,  6 Mar 2014 10:15:51 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 20:15:54 +0200
Message-Id: <2adce7a20be3b0ab03029cfe1a62a67bee285bd5.1394128875.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394128875.git.stefanx.stanacar@intel.com>
References: <cover.1394128875.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1394128875.git.stefanx.stanacar@intel.com>
References: <cover.1394128875.git.stefanx.stanacar@intel.com>
Cc: dvhart@linux.intel.com
Subject: [PATCH 1/3] recipes-bsp: Add gummiboot and gnu-efi recipes
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
X-List-Received-Date: Thu, 06 Mar 2014 18:16:02 -0000

gummiboot is  is a simple UEFI boot manager (not a boot loader ;-) )

These recipes are imported from meta-intel with these changes:
 - drop PR and update configure options
 - gummiboot was upgraded to latest version

A couple of notes:
 - If you wish you can install the gummiboot package on the target and
use 'gummiboot install' to add the payload to the ESP (see gummiboot --help,
just make sure the ESP partition has the boot flag on as gummiboot won't accept it
otherwise). However the point of this recipe is to be used by bootimg.bbclass and
generate images with gummiboot instead of grub-efi.
 - You need a kernel which has CONFIG_EFI_STUB=y at least
 - The default linux-yocto kernel config does not enable that, easiest way
to enable is to build with KERNEL_FEATURES_append = " cfg/efi-ext" in local.conf

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 .../gnu-efi/gnu-efi/parallel-make-archives.patch   | 48 ++++++++++++++++++++++
 .../gnu-efi/gnu-efi/parallel-make.patch            | 22 ++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb           | 33 +++++++++++++++
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        | 25 +++++++++++
 4 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make.patch
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
 create mode 100644 meta/recipes-bsp/gummiboot/gummiboot_git.bb

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
new file mode 100644
index 0000000..e5b47c1
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
@@ -0,0 +1,48 @@
+Fix parallel make failure for archives
+
+Upstream-Status: Pending
+
+The lib and gnuefi makefiles were using the lib.a() form which compiles
+and ar's as a pair instead of compiling all and then ar'ing which can
+parallelize better. This was resulting in build failures on larger values
+of -j.
+
+See http://www.chemie.fu-berlin.de/chemnet/use/info/make/make_toc.html#TOC105
+for details.
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+---
+---
+ gnuefi/Makefile |    3 ++-
+ lib/Makefile    |    3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+Index: gnu-efi-3.0/lib/Makefile
+===================================================================
+--- gnu-efi-3.0.orig/lib/Makefile
++++ gnu-efi-3.0/lib/Makefile
+@@ -66,7 +66,8 @@ all: libsubdirs libefi.a
+ libsubdirs:
+ 	for sdir in $(SUBDIRS); do mkdir -p $$sdir; done
+ 
+-libefi.a: $(patsubst %,libefi.a(%),$(OBJS))
++libefi.a: $(OBJS)
++	$(AR) rv $@ $(OBJS)
+ 
+ clean:
+ 	rm -f libefi.a *~ $(OBJS) */*.o
+Index: gnu-efi-3.0/gnuefi/Makefile
+===================================================================
+--- gnu-efi-3.0.orig/gnuefi/Makefile
++++ gnu-efi-3.0/gnuefi/Makefile
+@@ -51,7 +51,8 @@ TARGETS	= crt0-efi-$(ARCH).o libgnuefi.a
+ 
+ all:	$(TARGETS)
+ 
+-libgnuefi.a: $(patsubst %,libgnuefi.a(%),$(OBJS))
++libgnuefi.a: $(OBJS)
++	$(AR) rv $@ $(OBJS)
+ 
+ clean:
+ 	rm -f $(TARGETS) *~ *.o $(OBJS)
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make.patch
new file mode 100644
index 0000000..27c94e8
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make.patch
@@ -0,0 +1,22 @@
+Fix parallel make failure
+
+Upstream-Status: Submitted [Maintainer directly]
+
+Add a missing dependency which resulted in a race leading to failure
+on larger values of -j.
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+
+Index: gnu-efi-3.0/Makefile
+===================================================================
+--- gnu-efi-3.0.orig/Makefile
++++ gnu-efi-3.0/Makefile
+@@ -42,6 +42,8 @@ include $(SRCDIR)/Make.defaults
+ 
+ SUBDIRS = lib gnuefi inc apps
+ 
++gnuefi: lib
++
+ all:	check_gcc $(SUBDIRS)
+ 
+ $(SUBDIRS):
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
new file mode 100644
index 0000000..0dbdba2
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Libraries for producing EFI binaries"
+HOMEPAGE = "http://sourceforge.net/projects/gnu-efi/"
+SECTION = "devel"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=5fb358a180f484b285b0d99acdc29666"
+
+SRC_URI = "http://downloads.sourceforge.net/gnu-efi/gnu-efi_3.0u.orig.tar.gz \
+           file://parallel-make.patch \
+           file://parallel-make-archives.patch \
+          "
+SRC_URI[md5sum] = "d15d3c700e79a1e2938544d73edc572d"
+SRC_URI[sha256sum] = "3c0d450d5829204ca05dcb3b2aae772e52c379b7c7e09146759c6315606f934e"
+
+COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
+
+S = "${WORKDIR}/gnu-efi-3.0"
+
+def gnu_efi_arch(d):
+    import re
+    tarch = d.getVar("TARGET_ARCH", True)
+    if re.match("i[3456789]86", tarch):
+        return "ia32"
+    return tarch
+
+EXTRA_OEMAKE = "'ARCH=${@gnu_efi_arch(d)}' 'CC=${CC}' 'AS=${AS}' 'LD=${LD}' 'AR=${AR}' \
+                'RANLIB=${RANLIB}' 'OBJCOPY=${OBJCOPY}' 'PREFIX=${prefix}'\
+                "
+
+do_install() {
+        oe_runmake install INSTALLROOT="${D}"
+}
+
+FILES_${PN} += "${libdir}/*.lds"
diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
new file mode 100644
index 0000000..b55064f
--- /dev/null
+++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Gummiboot is a simple UEFI boot manager which executes configured EFI images."
+HOMEPAGE = "http://freedesktop.org/wiki/Software/gummiboot"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "gnu-efi util-linux"
+
+inherit autotools
+inherit deploy
+
+PV = "43+git${SRCPV}"
+SRCREV = "4062c51075ba054d4949c714fe06123f9ad3097d"
+SRC_URI = "git://anongit.freedesktop.org/gummiboot"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF = "--disable-manpages --with-efi-includedir=${STAGING_INCDIR} \
+                --with-efi-ldsdir=${STAGING_LIBDIR} \
+                --with-efi-libdir=${STAGING_LIBDIR}"
+
+do_deploy () {
+        install ${S}/gummiboot*.efi ${DEPLOYDIR}/
+}
+addtask deploy before do_build after do_compile
-- 
1.8.5.3



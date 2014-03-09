Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B14BC6F619
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Mar 2014 16:05:01 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Mar 2014 09:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,618,1389772800"; d="scan'208";a="416711250"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 09 Mar 2014 09:04:34 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 587586A4007;
	Sun,  9 Mar 2014 09:04:22 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Mar 2014 18:04:27 +0200
Message-Id: <18878d187894b67a630c098be3759e222108e545.1394379902.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394379900.git.stefanx.stanacar@intel.com>
References: <cover.1394379900.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1394379900.git.stefanx.stanacar@intel.com>
References: <cover.1394379900.git.stefanx.stanacar@intel.com>
Cc: dvhart@linux.intel.com
Subject: [PATCH 1/4] recipes-bsp: add gnu-efi recipe
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
X-List-Received-Date: Sun, 09 Mar 2014 16:05:01 -0000

gnu-efi is required by gummiboot.
Imported from meta-intel, PR dropped, no new version available.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 .../gnu-efi/gnu-efi/parallel-make-archives.patch   | 48 ++++++++++++++++++++++
 .../gnu-efi/gnu-efi/parallel-make.patch            | 22 ++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb           | 33 +++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make.patch
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb

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
-- 
1.8.5.3



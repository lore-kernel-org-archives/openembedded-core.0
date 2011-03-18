Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q0cV4-00005r-Mx
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 17:26:07 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Mar 2011 09:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,205,1299484800"; d="scan'208";a="668756710"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2011 09:24:17 -0700
Message-Id: <9c41d034df42b02cfd12da9644e1dac65135d07f.1300465259.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1300465259.git.nitin.a.kamble@intel.com>
References: <cover.1300465259.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 15 Mar 2011 13:18:04 -0700
Date: Fri, 18 Mar 2011  9:24:17 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 7/7] util-linux: Setup for GPLv2 Recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Mar 2011 16:26:07 -0000

From: Saul Wold <sgw@linux.intel.com>

 * add task to remove the GPLv3 lscpu code
 * Add patch to remove the reference to lscpu in Makfiles

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../util-linux-2.17.2/remove-lscpu.patch           |  101 ++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux.inc        |   14 +--
 meta/recipes-core/util-linux/util-linux_2.17.2.bb  |   31 ++++++-
 3 files changed, 137 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch

diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch b/meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch
new file mode 100644
index 0000000..200dc2c
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch
@@ -0,0 +1,101 @@
+Take out lscpu stuff from the code
+
+2011/03/17
+Saul Wold <saul.wold@intel.com>
+Nitin A Kamble <nitin.a.kamble@intel.com>
+
+Index: util-linux-ng-2.17.2/sys-utils/Makefile.am
+===================================================================
+--- util-linux-ng-2.17.2.orig/sys-utils/Makefile.am
++++ util-linux-ng-2.17.2/sys-utils/Makefile.am
+@@ -11,11 +11,11 @@ dist_man_MANS = flock.1 ipcrm.1 ipcs.1 i
+ if LINUX
+ bin_PROGRAMS += dmesg
+ sbin_PROGRAMS += ctrlaltdel
+-usrbin_exec_PROGRAMS += cytune setarch lscpu
++usrbin_exec_PROGRAMS += cytune setarch
+ usrsbin_exec_PROGRAMS += ldattach tunelp rtcwake
+ 
+ dist_man_MANS += dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
+-		ldattach.8 lscpu.1 tunelp.8 rtcwake.8
++		ldattach.8 tunelp.8 rtcwake.8
+ endif
+ 
+ cytune_SOURCES = cytune.c cyclades.h
+Index: util-linux-ng-2.17.2/sys-utils/Makefile.in
+===================================================================
+--- util-linux-ng-2.17.2.orig/sys-utils/Makefile.in
++++ util-linux-ng-2.17.2/sys-utils/Makefile.in
+@@ -47,10 +47,10 @@ usrsbin_exec_PROGRAMS = readprofile$(EXE
+ 	$(am__EXEEXT_10)
+ @LINUX_TRUE@am__append_1 = dmesg
+ @LINUX_TRUE@am__append_2 = ctrlaltdel
+-@LINUX_TRUE@am__append_3 = cytune setarch lscpu
++@LINUX_TRUE@am__append_3 = cytune setarch
+ @LINUX_TRUE@am__append_4 = ldattach tunelp rtcwake
+ @LINUX_TRUE@am__append_5 = dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
+-@LINUX_TRUE@		ldattach.8 lscpu.1 tunelp.8 rtcwake.8
++@LINUX_TRUE@		ldattach.8 tunelp.8 rtcwake.8
+ 
+ @BUILD_FALLOCATE_TRUE@am__append_6 = fallocate
+ @BUILD_FALLOCATE_TRUE@am__append_7 = fallocate.1
+@@ -100,7 +100,7 @@ am__installdirs = "$(DESTDIR)$(bindir)" 
+ @BUILD_PIVOT_ROOT_TRUE@am__EXEEXT_4 = pivot_root$(EXEEXT)
+ @BUILD_SWITCH_ROOT_TRUE@am__EXEEXT_5 = switch_root$(EXEEXT)
+ @LINUX_TRUE@am__EXEEXT_6 = cytune$(EXEEXT) setarch$(EXEEXT) \
+-@LINUX_TRUE@	lscpu$(EXEEXT)
++@LINUX_TRUE@
+ @BUILD_FALLOCATE_TRUE@am__EXEEXT_7 = fallocate$(EXEEXT)
+ @BUILD_UNSHARE_TRUE@am__EXEEXT_8 = unshare$(EXEEXT)
+ @LINUX_TRUE@am__EXEEXT_9 = ldattach$(EXEEXT) tunelp$(EXEEXT) \
+@@ -141,9 +141,6 @@ ipcs_LDADD = $(LDADD)
+ ldattach_SOURCES = ldattach.c
+ ldattach_OBJECTS = ldattach.$(OBJEXT)
+ ldattach_LDADD = $(LDADD)
+-lscpu_SOURCES = lscpu.c
+-lscpu_OBJECTS = lscpu.$(OBJEXT)
+-lscpu_LDADD = $(LDADD)
+ pivot_root_SOURCES = pivot_root.c
+ pivot_root_OBJECTS = pivot_root.$(OBJEXT)
+ pivot_root_LDADD = $(LDADD)
+@@ -201,11 +198,11 @@ AM_V_GEN = $(am__v_GEN_$(V))
+ am__v_GEN_ = $(am__v_GEN_$(AM_DEFAULT_VERBOSITY))
+ am__v_GEN_0 = @echo "  GEN   " $@;
+ SOURCES = arch.c ctrlaltdel.c $(cytune_SOURCES) dmesg.c fallocate.c \
+-	flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c lscpu.c pivot_root.c \
++	flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c pivot_root.c \
+ 	rdev.c readprofile.c renice.c rtcwake.c setarch.c setsid.c \
+ 	switch_root.c $(tunelp_SOURCES) unshare.c
+ DIST_SOURCES = arch.c ctrlaltdel.c $(cytune_SOURCES) dmesg.c \
+-	fallocate.c flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c lscpu.c \
++	fallocate.c flock.c ipcmk.c ipcrm.c ipcs.c ldattach.c \
+ 	pivot_root.c rdev.c readprofile.c renice.c rtcwake.c setarch.c \
+ 	setsid.c switch_root.c $(tunelp_SOURCES) unshare.c
+ INFO_DEPS = $(srcdir)/ipc.info
+@@ -248,7 +245,7 @@ NROFF = nroff
+ MANS = $(dist_man_MANS) $(man_MANS)
+ am__dist_noinst_DATA_DIST = flock.1 ipcrm.1 ipcs.1 ipcmk.1 renice.1 \
+ 	setsid.1 readprofile.1 dmesg.1 ctrlaltdel.8 cytune.8 setarch.8 \
+-	ldattach.8 lscpu.1 tunelp.8 rtcwake.8 fallocate.1 pivot_root.8 \
++	ldattach.8 tunelp.8 rtcwake.8 fallocate.1 pivot_root.8 \
+ 	switch_root.8 unshare.1 arch.1 rdev.8
+ DATA = $(dist_noinst_DATA)
+ ETAGS = etags
+@@ -678,9 +675,6 @@ ipcs$(EXEEXT): $(ipcs_OBJECTS) $(ipcs_DE
+ ldattach$(EXEEXT): $(ldattach_OBJECTS) $(ldattach_DEPENDENCIES) 
+ 	@rm -f ldattach$(EXEEXT)
+ 	$(AM_V_CCLD)$(LINK) $(ldattach_OBJECTS) $(ldattach_LDADD) $(LIBS)
+-lscpu$(EXEEXT): $(lscpu_OBJECTS) $(lscpu_DEPENDENCIES) 
+-	@rm -f lscpu$(EXEEXT)
+-	$(AM_V_CCLD)$(LINK) $(lscpu_OBJECTS) $(lscpu_LDADD) $(LIBS)
+ pivot_root$(EXEEXT): $(pivot_root_OBJECTS) $(pivot_root_DEPENDENCIES) 
+ 	@rm -f pivot_root$(EXEEXT)
+ 	$(AM_V_CCLD)$(LINK) $(pivot_root_OBJECTS) $(pivot_root_LDADD) $(LIBS)
+@@ -728,7 +722,6 @@ distclean-compile:
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ipcrm.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ipcs.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ldattach.Po@am__quote@
+-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/lscpu.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/pivot_root.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/rdev.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/readprofile.Po@am__quote@
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 6f8bcb3..861747d 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -5,9 +5,7 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-# note that `lscpu' is under GPLv3+
 LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
-LICENSE_util-linux-lscpu = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://README.licensing;md5=1530e36fe1304d4535513de90a290df9 \
                     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
@@ -27,11 +25,11 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${MAJOR_VERSION}/u
            file://make_include \
            "
 
-PACKAGES =+ "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-swaponoff \
-                    util-linux-losetup util-linux-umount util-linux-mount util-linux-readprofile \
-                    util-linux-libblkid util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
-                    util-linux-lscpu util-linux-uuidgen \
-                   "
+PACKAGES =+ "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
+             util-linux-swaponoff util-linux-losetup util-linux-umount \
+             util-linux-mount util-linux-readprofile util-linux-libblkid \
+             util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
+             util-linux-uuidgen util-linux-lscpu"
 
 S = "${WORKDIR}/util-linux-ng-${PV}"
 
@@ -49,13 +47,13 @@ FILES_util-linux-losetup = "${base_sbindir}/losetup.${PN}"
 FILES_util-linux-mount = "${base_bindir}/mount.${PN}"
 FILES_util-linux-umount = "${base_bindir}/umount.${PN}"
 FILES_util-linux-readprofile = "${base_sbindir}/readprofile"
-FILES_util-linux-lscpu = "${bindir}/lscpu"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 
 FILES_util-linux-libblkid = "${libdir}/libblkid.so.*"
 FILES_util-linux-libblkid-dev = "${libdir}/libblkid.so ${libdir}/libblkid.a ${libdir}/libblkid.la ${includedir}/blkid"
 FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
 FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${libdir}/libuuid.a ${libdir}/libuuid.la ${includedir}/uuid"
+FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile "
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup"
diff --git a/meta/recipes-core/util-linux/util-linux_2.17.2.bb b/meta/recipes-core/util-linux/util-linux_2.17.2.bb
index 190a9e3..f6bdfd4 100644
--- a/meta/recipes-core/util-linux/util-linux_2.17.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.17.2.bb
@@ -1,6 +1,9 @@
 MAJOR_VERSION = "2.17"
+PR = "r7"
 require util-linux.inc
-PR = "r6"
+
+# note that `lscpu' is under GPLv3+
+LICENSE_util-linux-lscpu = "GPLv3+"
 
 SRC_URI += "file://uclibc-compile.patch \
 	          file://util-linux-ng-replace-siginterrupt.patch \
@@ -9,6 +12,32 @@ SRC_URI += "file://uclibc-compile.patch \
 SRC_URI[md5sum] = "4635725a3eef1c57090bac8ea5e082e6"
 SRC_URI[sha256sum] = "c9ae801b6a5ab20b7749a278a8bf6830ef53adc5e8b7eb0ac1a9f410c774118f"
 
+# Only lscpu part is gplv3; rest of the code is not, 
+# so take out the lscpu parts while running non-gplv3 build.
+python () {
+    d.setVar("REMOVELSCPU", "no")
+    if (d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1:
+        # avoid GPLv3 
+        d.setVar("REMOVELSCPU", "yes")
+        packages = (d.getVar("PACKAGES", False) or "").split()
+        if "util-linux-lscpu" in packages:
+            packages.remove("util-linux-lscpu")
+        d.setVar("PACKAGES", " ".join(packages))
+
+        src_uri = (d.getVar("SRC_URI", False) or "").split()
+        src_uri.append("file://remove-lscpu.patch")
+        d.setVar("SRC_URI", " ".join(src_uri))
+}       
+
+do_remove_lscpu() {
+    if [ "x${REMOVELSCPU}" = "xyes" ]; then
+         rm -f sys-utils/lscpu.c sys-utils/lscpu.1
+         rm -rf tests/ts/lscpu tests/expected/lscpu
+    fi
+}
+
+addtask remove_lscpu before do_configure after do_patch
+
 # fallocate is glibc 2.10, fallocate64 is glibc 2.11
 # we need to disable it for older versions
 EXTRA_OECONF += "ac_cv_func_fallocate=no"
-- 
1.7.3.4




Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q0A0L-0005ZI-Dd
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 11:00:29 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Mar 2011 02:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,198,1299484800"; d="scan'208";a="668232588"
Received: from unknown (HELO localhost) ([10.255.12.145])
	by fmsmga002.fm.intel.com with ESMTP; 17 Mar 2011 02:58:43 -0700
Message-Id: <e13762b10af724def4290582b53f8072eaa8de9f.1300355683.git.sgw@linux.intel.com>
In-Reply-To: <cover.1300355683.git.sgw@linux.intel.com>
References: <cover.1300355683.git.sgw@linux.intel.com>
Old-Date: Tue, 15 Mar 2011 13:18:04 -0700
Date: Thu, 17 Mar 2011  2:58:43 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 1/7] util-linux: Setup for GPLv2 Recipe
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
X-List-Received-Date: Thu, 17 Mar 2011 10:00:29 -0000

From: Saul Wold <sgw@linux.intel.com>

 * add task to remove the GPLv3 lscpu code
 * Add patch to remove the reference to lscpu in Makfiles

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |    5 +---
 meta/recipes-core/util-linux/util-linux_2.17.2.bb |    9 +++++++-
 meta/recipes-core/util-linux/util-linux_gplv2.bb  |   24 +++++++++++++++++++++
 3 files changed, 33 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux_gplv2.bb

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 6f8bcb3..446c8e4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -5,9 +5,7 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-# note that `lscpu' is under GPLv3+
 LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
-LICENSE_util-linux-lscpu = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://README.licensing;md5=1530e36fe1304d4535513de90a290df9 \
                     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
@@ -30,7 +28,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${MAJOR_VERSION}/u
 PACKAGES =+ "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-swaponoff \
                     util-linux-losetup util-linux-umount util-linux-mount util-linux-readprofile \
                     util-linux-libblkid util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
-                    util-linux-lscpu util-linux-uuidgen \
+                    util-linux-uuidgen \
                    "
 
 S = "${WORKDIR}/util-linux-ng-${PV}"
@@ -49,7 +47,6 @@ FILES_util-linux-losetup = "${base_sbindir}/losetup.${PN}"
 FILES_util-linux-mount = "${base_bindir}/mount.${PN}"
 FILES_util-linux-umount = "${base_bindir}/umount.${PN}"
 FILES_util-linux-readprofile = "${base_sbindir}/readprofile"
-FILES_util-linux-lscpu = "${bindir}/lscpu"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 
 FILES_util-linux-libblkid = "${libdir}/libblkid.so.*"
diff --git a/meta/recipes-core/util-linux/util-linux_2.17.2.bb b/meta/recipes-core/util-linux/util-linux_2.17.2.bb
index 190a9e3..b1f5b13 100644
--- a/meta/recipes-core/util-linux/util-linux_2.17.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.17.2.bb
@@ -1,6 +1,9 @@
 MAJOR_VERSION = "2.17"
 require util-linux.inc
-PR = "r6"
+PR = "r7"
+
+# note that `lscpu' is under GPLv3+
+LICENSE_util-linux-lscpu = "GPLv3+"
 
 SRC_URI += "file://uclibc-compile.patch \
 	          file://util-linux-ng-replace-siginterrupt.patch \
@@ -9,6 +12,10 @@ SRC_URI += "file://uclibc-compile.patch \
 SRC_URI[md5sum] = "4635725a3eef1c57090bac8ea5e082e6"
 SRC_URI[sha256sum] = "c9ae801b6a5ab20b7749a278a8bf6830ef53adc5e8b7eb0ac1a9f410c774118f"
 
+PACKAGES =+ " util-linux-lscp "
+
+FILES_util-linux-lscpu = "${bindir}/lscpu"
+
 # fallocate is glibc 2.10, fallocate64 is glibc 2.11
 # we need to disable it for older versions
 EXTRA_OECONF += "ac_cv_func_fallocate=no"
diff --git a/meta/recipes-core/util-linux/util-linux_gplv2.bb b/meta/recipes-core/util-linux/util-linux_gplv2.bb
new file mode 100644
index 0000000..c711fac
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux_gplv2.bb
@@ -0,0 +1,24 @@
+MAJOR_VERSION = "2.17"
+PV = "2.17.1"
+
+require util-linux.inc
+PR = "r1"
+
+SRC_URI += "file://uclibc-compile.patch \
+	          file://util-linux-ng-replace-siginterrupt.patch \
+                  file://util-linux-ng-2.16-mount_lock_path.patch \
+                  file://remove-lscpu.patch"
+
+do_remove_lscpu() {
+	rm -f sys-utils/lscpu.c
+	rm -f sys-utils/lscpu.1
+}
+addtask remove_lscpu before do_configure after do_patch
+
+SRC_URI[md5sum] = "4635725a3eef1c57090bac8ea5e082e6"
+SRC_URI[sha256sum] = "c9ae801b6a5ab20b7749a278a8bf6830ef53adc5e8b7eb0ac1a9f410c774118f"
+
+# fallocate is glibc 2.10, fallocate64 is glibc 2.11
+# we need to disable it for older versions
+EXTRA_OECONF += "ac_cv_func_fallocate=no"
+EXTRA_OECONF_virtclass-native += "--disable-fallocate --disable-use-tty-group"
-- 
1.7.1.1




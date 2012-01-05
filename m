Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rigxx-0001EK-1h
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:38:21 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 22:30:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94663898"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:30:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:30:31 -0800
Message-Id: <03eb311cf1f5065c8332f21b2dd7400cf4799eec.1325744640.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/28] util-linux: move libraries to base_libdir
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
X-List-Received-Date: Thu, 05 Jan 2012 06:38:21 -0000

From: Scott Garman <scott.a.garman@intel.com>

Various util-linux programs in base_sbindir (/sbin) linked to libraries
located under exec_prefix (/usr). Since this is not safe, move these
libraries from libdir (/usr/lib) to base_libdir (/lib).

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |   20 +++++++++++---------
 meta/recipes-core/util-linux/util-linux_2.20.1.bb |    2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 5445f4f..6e568a4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,7 +17,6 @@ inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
 DEPENDS_virtclass-native = " lzo-native"
 
-
 SRC_URI = "ftp://ftp.infradead.org/pub/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
            file://MCONFIG \
            file://swapargs.h \
@@ -30,11 +29,14 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mount util-linux-readprofile util-linux-libblkid \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
-	     util-linux-chkdupexe util-linux-mkfs util-linux-mcookie"
+             util-linux-chkdupexe util-linux-mkfs util-linux-mcookie"
 
-EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elvtune --enable-init --enable-kill --enable-last \
- --enable-mesg --enable-partx --enable-raw --enable-rdev --enable-reset \
-  --disable-login-utils --enable-write --enable-arch --enable-mount --with-fsprobe=builtin --enable-libuuid --enable-libblkid --enable-fsck"
+EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
+                --disable-makeinstall-chown --enable-elvtune --enable-init \
+                --enable-kill --enable-last --enable-mesg --enable-partx \
+                --enable-raw --enable-rdev --enable-reset --disable-login-utils \
+                --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
+                --enable-libuuid --enable-libblkid --enable-fsck"
 
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
@@ -50,10 +52,10 @@ FILES_util-linux-umount = "${base_bindir}/umount.${PN}"
 FILES_util-linux-readprofile = "${base_sbindir}/readprofile.${PN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 
-FILES_util-linux-libblkid = "${libdir}/libblkid.so.*"
-FILES_util-linux-libblkid-dev = "${libdir}/libblkid.so ${libdir}/libblkid.a ${libdir}/libblkid.la ${includedir}/blkid"
-FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
-FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${libdir}/libuuid.a ${libdir}/libuuid.la ${includedir}/uuid"
+FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
+FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.a ${base_libdir}/libblkid.la ${includedir}/blkid"
+FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
+FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid.a ${base_libdir}/libuuid.la ${includedir}/uuid"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 FILES_util-linux-fsck = "${base_sbindir}/fsck*"
diff --git a/meta/recipes-core/util-linux/util-linux_2.20.1.bb b/meta/recipes-core/util-linux/util-linux_2.20.1.bb
index a569131..aa2c6ff 100644
--- a/meta/recipes-core/util-linux/util-linux_2.20.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.20.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.20"
-PR = "r0"
+PR = "r1"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.6.4




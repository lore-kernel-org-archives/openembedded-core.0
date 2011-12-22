Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddc2-0005NT-8K
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233760"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:39 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:20 -0800
Message-Id: <08dd90d92873ebb364dacdeb44a922d1824d01d8.1324540323.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/26] util-linux: move libraries to base_libdir
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:53 -0000

From: Scott Garman <scott.a.garman@intel.com>

Various util-linux programs in base_sbindir (/sbin) linked to libraries
located under exec_prefix (/usr). Since this is not safe, move these
libraries from libdir (/usr/lib) to base_libdir (/lib).

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |   20 +++++++++++---------
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index acc4a39..0ed6775 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,7 +17,6 @@ inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
 DEPENDS_virtclass-native = " lzo-native"
 
-
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
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
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 82040ef..f012907 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r12"
+PR = "r13"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.6.4




Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RiI5E-0001ZO-Ja
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 05:04:12 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id D9CEA30227
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2012 22:56:47 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 19:56:53 -0800
Message-Id: <45fe78157535d824f80a41fbb4165567fa71854a.1325649220.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325649220.git.scott.a.garman@intel.com>
References: <cover.1325649220.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1325649220.git.scott.a.garman@intel.com>
References: <cover.1325649220.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: D9CEA30227.B7E55
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 3/7] util-linux: move libraries to base_libdir
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
X-List-Received-Date: Wed, 04 Jan 2012 04:04:12 -0000

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
1.7.5.4




Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SiC8M-0007hP-76
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 00:15:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2012 15:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115173278"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jun 2012 15:04:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 15:00:54 -0700
Message-Id: <0ec2a46d48409ae85c982fb73ce799e0bf4d77f2.1340402353.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/17] uclibc: Fix packaging to match the new package order
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
X-List-Received-Date: Fri, 22 Jun 2012 22:15:21 -0000

From: Khem Raj <raj.khem@gmail.com>

This gets rid of some phony rdepends on uclibc-dev
being reported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc |   28 +++++++++++++++-------------
 1 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 6769279..4dae303 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -13,7 +13,7 @@ SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
 file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
-INC_PR = "r7"
+INC_PR = "r8"
 
 require uclibc-config.inc
 STAGINGCC = "gcc-cross-intermediate"
@@ -50,7 +50,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 # Ensure the uclibc-dev package is processed before uclibc-staticdev to allow
 # *_nonshared.a libraries to be packaged in the uclibc-dev package.
-PACKAGES = "${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN} ${PN}-doc ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt"
+PACKAGES = "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
 
 FILES_uclibc-libcrypt = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
 FILES_uclibc-libintl = "${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so"
@@ -62,34 +62,36 @@ FILES_uclibc-libutil = "${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so
 FILES_uclibc-libpthread = "${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so"
 FILES_uclibc-librt = "${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so"
 
+FILES_ldd = "${bindir}/ldd"
+FILES_uclibc-utils = "${bindir} ${sbindir}"
+FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
+FILES_uclibc-gconv = "${libdir}/gconv"
+FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
+FILES_uclibc-argp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
+FILES_uclibc-backtrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
+
 # The last line (gdb and lib1) is for uclinux-uclibc builds
 uclibc_baselibs = "${base_libdir}/ld*.so.* ${base_libdir}/ld*.so \
                    ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
                    ${libdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
                   "
-FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
-               ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
-FILES_ldd = "${bindir}/ldd"
-FILES_${PN}-dev_append = "\
+FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
+FILES_${PN}-dev += "\
         ${libdir}/lib*.so \
         ${libdir}/*_nonshared.a \
         ${libdir}/[S]*crt[1in].o \
         ${libdir}/crtreloc*.o \
         ${includedir}/*.h ${includedir}/*/*.h \
        "
-FILES_uclibc-utils = "${bindir} ${sbindir}"
-FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
-FILES_uclibc-gconv = "${libdir}/gconv"
-FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
-FILES_uclibc-argp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
-FILES_uclibc-backtrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
+FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
+               ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
 
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 # uclibc does not really have libsegfault but then using the one from glibc is also not
 # going to work. So we pretend that we have it to make bitbake not pull other recipes
 # to satisfy this dependency for the images/tasks
 
-RPROVIDES_uclibc += "libsegfault rtld(GNU_HASH)"
+RPROVIDES_${PN} += "libsegfault rtld(GNU_HASH)"
 
 SRC_URI = "\
         http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
-- 
1.7.7.6




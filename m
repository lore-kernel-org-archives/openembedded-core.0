Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VU-0002Xg-3A
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:56:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:48:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113486039"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:48:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:47 -0800
Message-Id: <daff80c595616de10f32e74e2881e851707c7ff9.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
Subject: [PATCH 08/14] gnupg: Add gplv2 version 1.4.7
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
X-List-Received-Date: Thu, 02 Feb 2012 23:56:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnupg/gnupg-1.4.7/long-long-thumb.patch        |   12 +++
 .../gnupg/gnupg-1.4.7/mips_gcc4.4.patch            |   42 +++++++++
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   92 ++++++++++++++++++++
 3 files changed, 146 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/long-long-thumb.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/mips_gcc4.4.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg_1.4.7.bb

diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/long-long-thumb.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/long-long-thumb.patch
new file mode 100644
index 0000000..dd4ec73
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/long-long-thumb.patch
@@ -0,0 +1,12 @@
+--- gnupg/mpi/longlong.h~      2006-02-14 10:09:55.000000000 +0000
++++ gnupg/mpi/longlong.h       2008-10-27 13:11:09.000000000 +0000
+@@ -181,7 +181,7 @@
+ /***************************************
+  **************  ARM  ******************
+  ***************************************/
+-#if defined (__arm__) && W_TYPE_SIZE == 32
++#if defined (__arm__) && W_TYPE_SIZE == 32 && !defined(__thumb__)
+ #define add_ssaaaa(sh, sl, ah, al, bh, bl) \
+   __asm__ ("adds %1, %4, %5\n"                                          \
+          "adc  %0, %2, %3"                                            \
+
diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/mips_gcc4.4.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/mips_gcc4.4.patch
new file mode 100644
index 0000000..b101a5b
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/mips_gcc4.4.patch
@@ -0,0 +1,42 @@
+Index: gnupg-1.4.10/mpi/longlong.h
+===================================================================
+--- gnupg-1.4.10.orig/mpi/longlong.h	2008-12-11 17:39:43.000000000 +0100
++++ gnupg-1.4.10/mpi/longlong.h	2010-03-27 14:27:53.000000000 +0100
+@@ -706,18 +706,35 @@
+ #endif /* __m88110__ */
+ #endif /* __m88000__ */
+ 
++/* Test for gcc >= maj.min, as per __GNUC_PREREQ in glibc */
++#if defined (__GNUC__) && defined (__GNUC_MINOR__)
++#define __GNUC_PREREQ(maj, min) \
++	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
++#else
++#define __GNUC_PREREQ(maj, min)  0
++#endif
++
+ /***************************************
+  **************  MIPS  *****************
+  ***************************************/
+ #if defined (__mips__) && W_TYPE_SIZE == 32
+-#if __GNUC__ > 2 || __GNUC_MINOR__ >= 7
++#if __GNUC_PREREQ (4,4)
++#define umul_ppmm(w1, w0, u, v) \
++  do {                                                                 \
++	UDItype __ll = (UDItype)(u) * (v);                                 \
++	w1 = __ll >> 32;                                                   \
++	w0 = __ll;                                                         \
++  } while (0)
++#endif
++#if !defined (umul_ppmm) && __GNUC_PREREQ (2,7)
+ #define umul_ppmm(w1, w0, u, v) \
+   __asm__ ("multu %2,%3"                                                \
+ 	   : "=l" ((USItype)(w0)),                                      \
+ 	     "=h" ((USItype)(w1))                                       \
+ 	   : "d" ((USItype)(u)),                                        \
+ 	     "d" ((USItype)(v)))
+-#else
++#endif
++#if !defined (umul_ppmm)
+ #define umul_ppmm(w1, w0, u, v) \
+   __asm__ ("multu %2,%3 \n" \
+ 	   "mflo %0 \n"     \
diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
new file mode 100644
index 0000000..daea5aa
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -0,0 +1,92 @@
+DESCRIPTION = "gnupg - GNU privacy guard"
+HOMEPAGE = "http://www.gnupg.org/"
+DEPENDS = "zlib bzip2 readline"
+SECTION = "console/utils"
+
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5="
+
+PR = "r4"
+
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
+           file://long-long-thumb.patch \
+           file://mips_gcc4.4.patch"
+
+SRC_URI[md5sum] = "dcf7ed712997888d616e029637bfc303"
+SRC_URI[sha256sum] = "a2907f4432d67894e425e48ae85785dd60ecb01658c9682bcd96f5e91043bb38"
+
+S = "${WORKDIR}/gnupg-${PV}"
+
+inherit autotools gettext
+
+#   --with-egd-socket=NAME  use NAME for the EGD socket
+#   --with-photo-viewer=FIXED_VIEWER  set a fixed photo ID viewer
+#   --with-included-zlib    use the zlib code included here
+#   --with-capabilities     use linux capabilities default=no
+#   --with-mailprog=NAME    use "NAME -t" for mail transport
+#   --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
+#   --without-libiconv-prefix     don't search for libiconv in includedir and libdir
+#   --with-included-gettext use the GNU gettext library included here
+#   --with-libintl-prefix[=DIR]  search for libintl in DIR/include and DIR/lib
+#   --without-libintl-prefix     don't search for libintl in includedir and libdir
+#   --without-readline      do not support fancy command line editing
+#   --with-included-regex   use the included GNU regex library
+#   --with-zlib=DIR         use libz in DIR
+#   --with-bzip2=DIR        look for bzip2 in DIR
+#   --enable-static-rnd=egd|unix|linux|auto
+#   --disable-dev-random    disable the use of dev random
+#   --disable-asm           do not use assembler modules
+#   --enable-m-guard        enable memory guard facility
+#   --enable-selinux-support
+#                           enable SELinux support
+#   --disable-card-support  disable OpenPGP card support
+#   --disable-gnupg-iconv   disable the new iconv code
+#   --enable-backsigs       enable the experimental backsigs code
+#   --enable-minimal        build the smallest gpg binary possible
+#   --disable-rsa           disable the RSA public key algorithm
+#   --disable-idea          disable the IDEA cipher
+#   --disable-cast5         disable the CAST5 cipher
+#   --disable-blowfish      disable the BLOWFISH cipher
+#   --disable-aes           disable the AES, AES192, and AES256 ciphers
+#   --disable-twofish       disable the TWOFISH cipher
+#   --disable-sha256        disable the SHA-256 digest
+#   --disable-sha512        disable the SHA-384 and SHA-512 digests
+#   --disable-bzip2         disable the BZIP2 compression algorithm
+#   --disable-exec          disable all external program execution
+#   --disable-photo-viewers disable photo ID viewers
+#   --disable-keyserver-helpers  disable all external keyserver support
+#   --disable-ldap          disable LDAP keyserver interface
+#   --disable-hkp           disable HKP keyserver interface
+#   --disable-http          disable HTTP key fetching interface
+#   --disable-finger        disable Finger key fetching interface
+#   --disable-mailto        disable email keyserver interface
+#   --disable-keyserver-path disable the exec-path option for keyserver helpers
+#   --enable-key-cache=SIZE Set key cache to SIZE (default 4096)
+#   --disable-largefile     omit support for large files
+#   --disable-dns-srv       disable the use of DNS SRV in HKP and HTTP
+#   --disable-nls           do not use Native Language Support
+#   --disable-regex         do not handle regular expressions in trust sigs
+
+EXTRA_OECONF = "--disable-ldap \
+		--with-zlib=${STAGING_LIBDIR}/.. \
+		--with-bzip2=${STAGING_LIBDIR}/.. \
+		--disable-selinux-support \
+                --with-readline=${STAGING_LIBDIR}/.. \
+                ac_cv_sys_symbol_underscore=yes"
+
+do_install () {
+	autotools_do_install
+	install -d ${D}${docdir}/${PN}
+	mv ${D}${datadir}/${PN}/* ${D}/${docdir}/${PN}/ || :
+	mv ${D}${prefix}/doc/* ${D}/${docdir}/${PN}/ || :
+}
+
+# split out gpgv from main package
+RDEPENDS_${PN} = "gpgv"
+PACKAGES =+ "gpgv"
+FILES_gpgv = "${bindir}/gpgv"
+
+# Exclude debug files from the main packages
+FILES_${PN} = "${bindir}/* ${datadir}/${PN} ${libexecdir}/${PN}/*"
+FILES_${PN}-dbg += "${libexecdir}/${PN}/.debug"
-- 
1.7.6.5




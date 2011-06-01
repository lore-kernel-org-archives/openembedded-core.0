Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerq-00042u-Mu
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203823"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:49 -0700
Message-Id: <2ba21f918bf0dbbc775471b17cefce8ae3b97143.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/32] gnutls: update to 2.12.5
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:23 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnutls/gnutls-2.10.4/configure-fix.patch       |   66 -------------------
 .../gnutls/gnutls-2.12.5/configure-fix.patch       |   67 ++++++++++++++++++++
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 meta/recipes-support/gnutls/gnutls.inc             |    6 +-
 meta/recipes-support/gnutls/gnutls_2.10.4.bb       |   10 ---
 meta/recipes-support/gnutls/gnutls_2.12.5.bb       |    9 +++
 7 files changed, 79 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patch
 rename meta/recipes-support/gnutls/{gnutls-2.10.4 => gnutls-2.12.5}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.10.4 => gnutls-2.12.5}/gnutls-texinfo-euro.patch (100%)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_2.10.4.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_2.12.5.bb

diff --git a/meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch b/meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch
deleted file mode 100644
index 2ce3f55..0000000
--- a/meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-Upstream-Status: Inappropriate [distribution]
-
-rebased from original configure_madness.patch
-
-libtasn1 provides an .pc file in upstream,
-and a libgcrypt.pc is added in libgcrypt recipe,
-so use Requires.private for these two.
-
-against 2.8.6
-
-07/02/2010 - qhe
-
----
-diff --git a/lib/configure.ac b/lib/configure.ac
-index 80d3375..1a486f7 100644
---- a/lib/configure.ac
-+++ b/lib/configure.ac
-@@ -81,8 +81,8 @@ fi
- 
- lgl_INIT
- 
--LIBGNUTLS_LIBS="-L${libdir} -lgnutls $LIBS"
--LIBGNUTLS_CFLAGS="-I${includedir}"
-+LIBGNUTLS_LIBS="-lgnutls $LIBS"
-+LIBGNUTLS_CFLAGS=""
- AC_SUBST(LIBGNUTLS_LIBS)
- AC_SUBST(LIBGNUTLS_CFLAGS)
- 
-diff --git a/lib/gnutls.pc.in b/lib/gnutls.pc.in
-index 3b01c17..de31469 100644
---- a/lib/gnutls.pc.in
-+++ b/lib/gnutls.pc.in
-@@ -20,6 +20,6 @@ Name: GnuTLS
- Description: Transport Security Layer implementation for the GNU system
- URL: http://www.gnu.org/software/gnutls/
- Version: @VERSION@
-+Requires.private: libgcrypt, libtasn1
- Libs: -L${libdir} -lgnutls
--Libs.private: @LIBGNUTLS_LIBS@ @LTLIBTASN1@
- Cflags: -I${includedir}
-diff --git a/libextra/configure.ac b/libextra/configure.ac
-index c08e73f..3313886 100644
---- a/libextra/configure.ac
-+++ b/libextra/configure.ac
-@@ -40,8 +40,8 @@ LIBGNUTLS_EXTRA_HOOKS
- 
- xgl_INIT
- 
--LIBGNUTLS_EXTRA_LIBS="-L${libdir} -lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
--LIBGNUTLS_EXTRA_CFLAGS="-I${includedir}"
-+LIBGNUTLS_EXTRA_LIBS="-lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
-+LIBGNUTLS_EXTRA_CFLAGS=""
- AC_SUBST(LIBGNUTLS_EXTRA_LIBS)
- AC_SUBST(LIBGNUTLS_EXTRA_CFLAGS)
- 
-diff --git a/libextra/gnutls-extra.pc.in b/libextra/gnutls-extra.pc.in
-index 9e7b8f6..e228ec9 100644
---- a/libextra/gnutls-extra.pc.in
-+++ b/libextra/gnutls-extra.pc.in
-@@ -21,5 +21,5 @@ URL: http://www.gnu.org/software/gnutls/
- Requires: gnutls
- Version: @VERSION@
- Libs: -L${libdir} -lgnutls-extra
--Libs.private: @LIBGNUTLS_EXTRA_LIBS@
-+Libs.private: -llzo2
- Cflags: -I${includedir}
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patch b/meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patch
new file mode 100644
index 0000000..e6f9785
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patch
@@ -0,0 +1,67 @@
+Upstream-Status: Inappropriate [distribution]
+
+rebased from original configure_madness.patch
+
+libtasn1 provides an .pc file in upstream,
+and a libgcrypt.pc is added in libgcrypt recipe,
+so use Requires.private for these two.
+
+against 2.8.6
+
+07/02/2010 - qhe
+
+---
+Index: gnutls-2.12.5/lib/configure.ac
+===================================================================
+--- gnutls-2.12.5.orig/lib/configure.ac	2011-05-11 00:05:33.000000000 -0700
++++ gnutls-2.12.5/lib/configure.ac	2011-05-25 19:45:23.721180103 -0700
+@@ -96,8 +96,8 @@
+ dnl for pakchois
+ AC_LIB_HAVE_LINKFLAGS(dl,, [#include <dlfcn.h>], [dlclose (0);])
+ 
+-LIBGNUTLS_LIBS="-L${libdir} -lgnutls $LIBS"
+-LIBGNUTLS_CFLAGS="-I${includedir}"
++LIBGNUTLS_LIBS="-lgnutls $LIBS"
++LIBGNUTLS_CFLAGS=""
+ AC_SUBST(LIBGNUTLS_LIBS)
+ AC_SUBST(LIBGNUTLS_CFLAGS)
+ 
+Index: gnutls-2.12.5/lib/gnutls.pc.in
+===================================================================
+--- gnutls-2.12.5.orig/lib/gnutls.pc.in	2011-04-23 08:00:07.000000000 -0700
++++ gnutls-2.12.5/lib/gnutls.pc.in	2011-05-25 19:50:11.926102288 -0700
+@@ -19,7 +19,6 @@
+ Description: Transport Security Layer implementation for the GNU system
+ URL: http://www.gnu.org/software/gnutls/
+ Version: @VERSION@
++Requires.private: libgcrypt, libtasn1
+ Libs: -L${libdir} -lgnutls
+-Libs.private: @LTLIBGCRYPT@ @NETTLE_LIBS@
+-@GNUTLS_REQUIRES_PRIVATE@
+ Cflags: -I${includedir}
+Index: gnutls-2.12.5/libextra/configure.ac
+===================================================================
+--- gnutls-2.12.5.orig/libextra/configure.ac	2011-05-11 00:05:31.000000000 -0700
++++ gnutls-2.12.5/libextra/configure.ac	2011-05-25 19:45:23.722186801 -0700
+@@ -41,8 +41,8 @@
+ 
+ xgl_INIT
+ 
+-LIBGNUTLS_EXTRA_LIBS="-L${libdir} -lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
+-LIBGNUTLS_EXTRA_CFLAGS="-I${includedir}"
++LIBGNUTLS_EXTRA_LIBS="-lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
++LIBGNUTLS_EXTRA_CFLAGS=""
+ AC_SUBST(LIBGNUTLS_EXTRA_LIBS)
+ AC_SUBST(LIBGNUTLS_EXTRA_CFLAGS)
+ 
+Index: gnutls-2.12.5/libextra/gnutls-extra.pc.in
+===================================================================
+--- gnutls-2.12.5.orig/libextra/gnutls-extra.pc.in	2011-04-07 17:30:45.000000000 -0700
++++ gnutls-2.12.5/libextra/gnutls-extra.pc.in	2011-05-25 19:45:23.722186801 -0700
+@@ -22,5 +22,5 @@
+ Requires: gnutls
+ Version: @VERSION@
+ Libs: -L${libdir} -lgnutls-extra
+-Libs.private: @LIBGNUTLS_EXTRA_LIBS@
++Libs.private: -llzo2
+ Cflags: -I${includedir}
diff --git a/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-openssl.patch b/meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-openssl.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-openssl.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-openssl.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-texinfo-euro.patch b/meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-texinfo-euro.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-texinfo-euro.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-texinfo-euro.patch
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index fd77af4..9f8d81b 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -21,9 +21,9 @@ inherit autotools binconfig pkgconfig gettext
 
 EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
               --with-libtasn1-prefix=${STAGING_DIR_HOST}${prefix} \
-              --with-libgcrypt-prefix=${STAGING_DIR_HOST}${prefix} \
-              --with-libz-prefix=${STAGING_DIR_HOST}${prefix} --with-lzo --disable-guile"
-
+              --with-libgcrypt --with-libgcrypt-prefix=${STAGING_DIR_HOST}${prefix} \
+              --with-lzo --disable-guile \
+              "
 do_configure_prepend() {
 	for dir in . lib libextra; do
 		rm ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
diff --git a/meta/recipes-support/gnutls/gnutls_2.10.4.bb b/meta/recipes-support/gnutls/gnutls_2.10.4.bb
deleted file mode 100644
index cc2fa27..0000000
--- a/meta/recipes-support/gnutls/gnutls_2.10.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require gnutls.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://gnutls-openssl.patch \
-            file://gnutls-texinfo-euro.patch \
-            file://configure-fix.patch"
-
-SRC_URI[md5sum] = "4e1517084018a8b1fdc96daabea40528"
-SRC_URI[sha256sum] = "b8bfe36450fe671e99db5ff1e44e6b65fda8a79cacd9e77d550eff7da3745fc8"
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.5.bb b/meta/recipes-support/gnutls/gnutls_2.12.5.bb
new file mode 100644
index 0000000..b27a065
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls_2.12.5.bb
@@ -0,0 +1,9 @@
+require gnutls.inc
+
+PR = "r0"
+
+SRC_URI += "file://gnutls-openssl.patch \
+            file://configure-fix.patch"
+
+SRC_URI[md5sum] = "2d0bd5ae11534074fcd78da6ea384e64"
+SRC_URI[sha256sum] = "bf263880f327ac34a561d8e66b5a729cbe33eea56728bfed3406ff2898448b60"
-- 
1.7.3.4




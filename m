Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 50D1F72732
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 05:10:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBN5A41a021592
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 21:10:04 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 22 Dec 2014 21:10:04 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Dec 2014 13:09:54 +0800
Message-ID: <f0392c4d3fef6da03ad2394c2959ff7d04aa08f8.1419309149.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419309149.git.hongxu.jia@windriver.com>
References: <cover.1419309149.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] libxml2: upgrade to 2.9.2
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
X-List-Received-Date: Tue, 23 Dec 2014 05:10:06 -0000
Content-Type: text/plain

- Rebase python-sitepackages-dir.patch to 2.9.2

- Drop libxml2-CVE-2014-3660.patch which has been merged to 2.9.2.

- Add configure.ac-fix-cross-compiling-warning.patch to fix cross
  compilation failure.

- Tweak do_configure_prepend, use configure.ac to instead of configure.in

- Add cmake files to ${PN}-dev

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  6 +--
 .../configure.ac-fix-cross-compiling-warning.patch | 45 ++++++++++++++++++++++
 .../libxml/libxml2/python-sitepackages-dir.patch   | 17 ++++++--
 .../libxml/{libxml2_2.9.1.bb => libxml2_2.9.2.bb}  |  4 +-
 4 files changed, 63 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/configure.ac-fix-cross-compiling-warning.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.1.bb => libxml2_2.9.2.bb} (62%)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index c729c19..1314bbf 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -21,7 +21,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml2-CVE-2014-0191-fix.patch \
            file://python-sitepackages-dir.patch \
            file://libxml-m4-use-pkgconfig.patch \
-           file://libxml2-CVE-2014-3660.patch \
+           file://configure.ac-fix-cross-compiling-warning.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
@@ -34,7 +34,7 @@ RDEPENDS_${PN}-ptest_append_libc-glibc += "glibc-gconv-ebcdic-us glibc-gconv-ibm
 
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
 do_configure_prepend () {
-	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
+	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.ac
 }
 
 do_configure_prepend_class-nativesdk () {
@@ -66,7 +66,7 @@ PACKAGES += "${PN}-utils ${PN}-python"
 
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
-FILES_${PN}-dev += "${libdir}/xml2Conf.sh"
+FILES_${PN}-dev += "${libdir}/xml2Conf.sh ${libdir}/cmake/*"
 FILES_${PN}-utils += "${bindir}/*"
 FILES_${PN}-python += "${PYTHON_SITEPACKAGES_DIR}"
 
diff --git a/meta/recipes-core/libxml/libxml2/configure.ac-fix-cross-compiling-warning.patch b/meta/recipes-core/libxml/libxml2/configure.ac-fix-cross-compiling-warning.patch
new file mode 100644
index 0000000..2f8079b
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/configure.ac-fix-cross-compiling-warning.patch
@@ -0,0 +1,45 @@
+configure.ac: fix cross compiling warning
+
+There is a warning while cross compiling which triggered a
+failure by do_qa_configure
+...
+|configure:12652: checking for gzread in -lz
+|configure:12677: mips-poky-linux-gcc  -meb -mabi=32 -mhard-float
+ -L/lib conftest.c -lz   >&5
+|ld: warning: library search path "/lib" is unsafe for cross-compilation
+...
+
+While do the lib checking, do not add '-L${Z_DIR}/lib' to LDFLAGS could fix it.
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9a90600..0bac8a4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -391,8 +391,6 @@ if test "$with_zlib" = "no"; then
+     echo "Disabling compression support"
+ else
+     AC_CHECK_HEADERS(zlib.h,
+-        [SAVE_LDFLAGS="${LDFLAGS}"
+-	 LDFLAGS="-L${Z_DIR}/lib"
+ 	AC_CHECK_LIB(z, gzread,[
+ 	    AC_DEFINE([HAVE_LIBZ], [1], [Have compression library])
+ 	    WITH_ZLIB=1
+@@ -406,8 +404,7 @@ else
+ 		esac]
+ 	    else
+ 		Z_LIBS="-lz"
+-	    fi])
+-	 LDFLAGS="${SAVE_LDFLAGS}"])
++	    fi]))
+ fi
+ 
+ AC_SUBST(Z_CFLAGS)
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch b/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch
index a697ddf..e83c832 100644
--- a/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch
+++ b/meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch
@@ -4,12 +4,18 @@ The python binary used when building for nativesdk doesn't give us the
 correct path here so we need to be able to specify it ourselves.
 
 Upstream-Status: Inappropriate [config]
-
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
---- a/configure.in
-+++ b/configure.in
-@@ -743,7 +743,8 @@ dnl
+Rebase to 2.9.2
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -813,7 +813,8 @@ dnl
  
  PYTHON_VERSION=
  PYTHON_INCLUDES=
@@ -19,3 +25,6 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
  PYTHON_TESTS=
  pythondir=
  if test "$with_python" != "no" ; then
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.1.bb b/meta/recipes-core/libxml/libxml2_2.9.2.bb
similarity index 62%
rename from meta/recipes-core/libxml/libxml2_2.9.1.bb
rename to meta/recipes-core/libxml/libxml2_2.9.2.bb
index 0b6ac5d..f0cfa59 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.2.bb
@@ -2,7 +2,7 @@ require libxml2.inc
 
 SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar"
 
-SRC_URI[libtar.md5sum] = "9c0cfef285d5c4a5c80d00904ddab380"
-SRC_URI[libtar.sha256sum] = "fd3c64cb66f2c4ea27e934d275904d92cec494a8e8405613780cbc8a71680fdb"
+SRC_URI[libtar.md5sum] = "9e6a9aca9d155737868b3dc5fd82f788"
+SRC_URI[libtar.sha256sum] = "5178c30b151d044aefb1b08bf54c3003a0ac55c59c866763997529d60770d5bc"
 SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
-- 
1.9.1



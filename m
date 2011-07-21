Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjmXm-0007hB-Aa
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 08:16:01 +0200
Received: by gxk3 with SMTP id 3so494524gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 23:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=rvFuANEgfR/qiP4Nbkp6IoZr2AtXv/2PkGPNyG3QB4g=;
	b=XG1XLsGvPWoKJwXIDNc7ubaNAc7a8rHnkg7LeKY3szsxrINqFSFCzVzxx/+LF1Favm
	wZDu2bcrYMr5O4tl2Kt4liGImxN7ZzAUr88xHf1feQIRuMcb/bhTXj8QCyhIg6KWvT14
	gs7g1rIgKmbnMIbkdkBlfKj0VHA1zR/BHocK4=
Received: by 10.101.155.21 with SMTP id h21mr8715909ano.146.1311228622561;
	Wed, 20 Jul 2011 23:10:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f14sm1398877icm.3.2011.07.20.23.10.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 23:10:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:10:12 -0700
Message-Id: <1311228617-29732-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 1/6] mesa-xlib, mesa-dri: Probe for newlocale() before using it.
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
X-List-Received-Date: Thu, 21 Jul 2011 06:16:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri/uclibc.patch |   40 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb    |    6 ++-
 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb   |    5 ++-
 3 files changed, 48 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri/uclibc.patch

diff --git a/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch b/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch
new file mode 100644
index 0000000..bb5af44
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch
@@ -0,0 +1,40 @@
+Index: Mesa-7.10.2/src/mesa/main/imports.c
+===================================================================
+--- Mesa-7.10.2.orig/src/mesa/main/imports.c	2011-03-01 12:57:29.000000000 -0800
++++ Mesa-7.10.2/src/mesa/main/imports.c	2011-07-20 19:08:49.441785510 -0700
+@@ -757,7 +757,7 @@
+ float
+ _mesa_strtof( const char *s, char **end )
+ {
+-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined (HAVE_NEWLOCALE)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+Index: Mesa-7.10.2/src/glsl/strtod.c
+===================================================================
+--- Mesa-7.10.2.orig/src/glsl/strtod.c	2011-01-03 16:45:51.000000000 -0800
++++ Mesa-7.10.2/src/glsl/strtod.c	2011-07-20 19:10:21.441785488 -0700
+@@ -44,7 +44,7 @@
+ double
+ glsl_strtod(const char *s, char **end)
+ {
+-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && defined (HAVE_NEWLOCALE)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+Index: Mesa-7.10.2/configure.ac
+===================================================================
+--- Mesa-7.10.2.orig/configure.ac	2011-07-20 19:09:02.000000000 -0700
++++ Mesa-7.10.2/configure.ac	2011-07-20 19:09:57.121785492 -0700
+@@ -450,6 +450,9 @@
+ dnl See if posix_memalign is available
+ AC_CHECK_FUNC([posix_memalign], [DEFINES="$DEFINES -DHAVE_POSIX_MEMALIGN"])
+ 
++dnl See if newlocale is available
++AC_CHECK_FUNCS_ONCE(newlocale)
++
+ dnl SELinux awareness.
+ AC_ARG_ENABLE([selinux],
+     [AS_HELP_STRING([--enable-selinux],
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
index c7bd974..aac7a1c 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
@@ -8,10 +8,12 @@ LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat
 
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native python-native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
-           file://crossfix.patch"
+           file://crossfix.patch \
+           file://uclibc.patch \
+          "
 
 SRC_URI[md5sum] = "f5de82852f1243f42cc004039e10b771"
 SRC_URI[sha256sum] = "8ced2678ce11cf30804694a92ea3ca6b82f158ae8995bdc626c7e85aac71c7c1"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
index b77df2c..511103d 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
@@ -1,6 +1,9 @@
 include mesa-common.inc
 
+FILESPATH =. "${FILE_DIRNAME}/mesa-dri:"
+
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
+           file://uclibc.patch \
            "
 
 SRC_URI[md5sum] = "f5de82852f1243f42cc004039e10b771"
@@ -14,6 +17,6 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF += "--with-driver=xlib"
-- 
1.7.4.1




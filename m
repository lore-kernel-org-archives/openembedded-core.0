Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJbS-00043l-9O
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:37:34 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Rs5ZY1+UNW1A1E0iWiB77dYFXHsRqtaplE6AdGXvTqQ=;
	b=nn2WmukgRuE0/FgyEGC7VPF8ZgFzzOGsCk1ZoW+1R51fw9qOHT5H6Tbp3jWGorYOeK
	P0m3Y398kwjpfmoWbCpRe0tXDadrwWLwLVCcPZLbupC/QX2yOjvMygdcoi+LkbGUzsOn
	zVlWVyhOVgCpRplWQkAqE46exGjo2vIo+/G5w=
Received: by 10.204.134.85 with SMTP id i21mr2326211bkt.100.1318505512772;
	Thu, 13 Oct 2011 04:31:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm3265994bkn.7.2011.10.13.04.31.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:31:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:27 +0200
Message-Id: <63f988f0e7a80dce702e2150266448f4f8be914d.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 09/20] mesa-7.11: move shared DEPENDS, SRC_URI, checksums and do_configure_prepend to shared .inc file
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
X-List-Received-Date: Thu, 13 Oct 2011 11:37:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-7.11.inc     |   14 ++++++++++++++
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb  |   17 +----------------
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb |   16 +---------------
 3 files changed, 16 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-7.11.inc

diff --git a/meta/recipes-graphics/mesa/mesa-7.11.inc b/meta/recipes-graphics/mesa/mesa-7.11.inc
new file mode 100644
index 0000000..746b764
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-7.11.inc
@@ -0,0 +1,14 @@
+DEPENDS += "mesa-dri-glsl-native"
+
+SRC_URI += "file://uclibc.patch \
+            file://crossfix.patch \
+           "
+SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
+SRC_URI[sha256sum] = "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5f17a5b1c80dd7acf"
+
+do_configure_prepend() {
+  #check for python not python2, because python-native does not stage python2 binary/link
+  sed -i 's/AC_CHECK_PROGS(\[PYTHON2\], \[python2 python\])/AC_CHECK_PROGS(\[PYTHON2\], \[python python\])/g' ${S}/configure.ac
+  # We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
+  sed -i "s#\./builtin_compiler#${STAGING_BINDIR_NATIVE}/glsl/builtin_compiler#g" ${S}/src/glsl/Makefile
+}
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
index 5f14346..90873aa 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -1,22 +1,14 @@
 include mesa-common.inc
+include mesa-${PV}.inc
 
 PROTO_DEPS = "xf86driproto glproto dri2proto"
 LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat \
             libxml2-native"
 
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native python-native"
-DEPENDS += "mesa-dri-glsl-native"
 
 PR = "${INC_PR}.0"
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
-           file://crossfix.patch \
-           file://uclibc.patch \
-          "
-
-SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
-SRC_URI[sha256sum] = "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5f17a5b1c80dd7acf"
-
 # most of our targets do not have DRI so will use mesa-xlib
 DEFAULT_PREFERENCE = "-1"
 
@@ -37,10 +29,3 @@ COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 PACKAGES_DYNAMIC = "mesa-dri-driver-*"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
-
-do_configure_prepend() {
-	#check for python not python2, because python-native does not stage python2 binary/link
-	sed -i 's/AC_CHECK_PROGS(\[PYTHON2\], \[python2 python\])/AC_CHECK_PROGS(\[PYTHON2\], \[python python\])/g' ${S}/configure.ac
-	# We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
-	sed -i "s#\./builtin_compiler#${STAGING_BINDIR_NATIVE}/glsl/builtin_compiler#g" ${S}/src/glsl/Makefile
-}
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
index 1e0d821..44719a0 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
@@ -1,11 +1,5 @@
 include mesa-common.inc
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
-           file://uclibc.patch \
-           "
-
-SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
-SRC_URI[sha256sum] = "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5f17a5b1c80dd7acf"
+include mesa-${PV}.inc
 
 PROTO_DEPS = "xf86driproto glproto"
 LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-native"
@@ -15,11 +9,3 @@ DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"
 PR = "${INC_PR}.0"
 
 EXTRA_OECONF += "--with-driver=xlib --without-gallium-drivers"
-
-do_configure_prepend() {
-	#check for python not python2, because python-native does not stage python2 binary/link
-	sed -i 's/AC_CHECK_PROGS(\[PYTHON2\], \[python2 python\])/AC_CHECK_PROGS(\[PYTHON2\], \[python python\])/g' ${S}/configure.ac
-	# We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
-	sed -i "s#\./builtin_compiler#${STAGING_BINDIR_NATIVE}/glsl/builtin_compiler#g" ${S}/src/glsl/Makefile
-}
-
-- 
1.7.7




Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id C0C4A6B34B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:35 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b47so186803eek.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=lSh2PALOtd5jorKmnPEVM/HGbiVvFq4RRlG5ur8F+V0=;
	b=HzZvVXwdaZkeFP+ANKkvTQ0B6Clzjjr7DhDUUvAbRTrtG5kQNG9uC34pHZw88AmodV
	Oit7AhcVde+xXdigqwJyZoA3xav7kdHySqzgoWpC8m+7ot29LIogyEOgiu099ZAHBBAc
	6UMpcgOci4uOGbMEaIrXC0P38l9fMVVFD7364n3cCwJvvvZhUBoAs3LlA0BwRHOSoKV3
	+y9ItUdcR6PvK4Hot5mhgvqaXfm2rrPcrHXLwcA6bYk93j0ZRKD91S4vs/HI4NtLtgd1
	8F/VU6Npt6Y7+pEVi7Q0xOZX3seRY0/zADljUA8frCwgIQ3AoaBINDX1DaMzTvXQYu3a
	7hmQ==
X-Received: by 10.14.1.70 with SMTP id 46mr37447717eec.82.1374667356188;
	Wed, 24 Jul 2013 05:02:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm65677596eeu.2.2013.07.24.05.02.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:35 +0200
Message-Id: <d6e4efe49dafb6f75ffb35eefcba638afb146ed0.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 13/18] python-imaging: add PACKAGECONFIG for lcms
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:36 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../allow.to.disable.some.features.patch           | 65 ++++++++++++++++++++++
 .../python/python-imaging_1.1.7.bb                 | 10 +++-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch

diff --git a/meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch b/meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
new file mode 100644
index 0000000..4960ed4
--- /dev/null
+++ b/meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
@@ -0,0 +1,65 @@
+At least lcms wasn't deterministicly detected from sysroot.
+
+This will allow to export LCMS_ENABLED=False when lcms isn't in PACKAGECONFIG.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr Imaging-1.1.7.orig/setup.py Imaging-1.1.7/setup.py
+--- Imaging-1.1.7.orig/setup.py	2013-07-22 10:17:02.081457075 +0200
++++ Imaging-1.1.7/setup.py	2013-07-22 13:10:09.029707492 +0200
+@@ -39,6 +39,12 @@
+ TIFF_ROOT = None
+ FREETYPE_ROOT =  os.environ['STAGING_LIBDIR'], os.environ['STAGING_INCDIR']
+ LCMS_ROOT = None
++TCL_ENABLED = os.getenv('TCL_ENABLED', "True")
++JPEG_ENABLED = os.getenv('JPEG_ENABLED', "True")
++ZLIB_ENABLED = os.getenv('ZLIB_ENABLED', "True")
++TIFF_ENABLED = os.getenv('TIFF_ENABLED', "True")
++FREETYPE_ENABLED = os.getenv('FREETYPE_ENABLED', "True")
++LCMS_ENABLED = os.getenv('LCMS_ENABLED', "True")
+ 
+ # FIXME: add mechanism to explicitly *disable* the use of a library
+ 
+@@ -220,22 +226,22 @@
+             zlib = jpeg = tiff = freetype = tcl = tk = lcms = None
+         feature = feature()
+ 
+-        if find_include_file(self, "zlib.h"):
++        if ZLIB_ENABLED == 'True' and find_include_file(self, "zlib.h"):
+             if find_library_file(self, "z"):
+                 feature.zlib = "z"
+             elif sys.platform == "win32" and find_library_file(self, "zlib"):
+                 feature.zlib = "zlib" # alternative name
+ 
+-        if find_include_file(self, "jpeglib.h"):
++        if JPEG_ENABLED == 'True' and find_include_file(self, "jpeglib.h"):
+             if find_library_file(self, "jpeg"):
+                 feature.jpeg = "jpeg"
+             elif sys.platform == "win32" and find_library_file(self, "libjpeg"):
+                 feature.jpeg = "libjpeg" # alternative name
+ 
+-        if find_library_file(self, "tiff"):
++        if TIFF_ENABLED == 'True' and find_library_file(self, "tiff"):
+             feature.tiff = "tiff"
+ 
+-        if find_library_file(self, "freetype"):
++        if FREETYPE_ENABLED == 'True' and find_library_file(self, "freetype"):
+             # look for freetype2 include files
+             freetype_version = 0
+             for dir in self.compiler.include_dirs:
+@@ -256,11 +262,11 @@
+                 if dir:
+                     add_directory(self.compiler.include_dirs, dir, 0)
+ 
+-        if find_include_file(self, "lcms.h"):
++        if LCMS_ENABLED == 'True' and find_include_file(self, "lcms.h"):
+             if find_library_file(self, "lcms"):
+                 feature.lcms = "lcms"
+ 
+-        if _tkinter and find_include_file(self, "tk.h"):
++        if TCL_ENABLED == 'True' and _tkinter and find_include_file(self, "tk.h"):
+             # the library names may vary somewhat (e.g. tcl84 or tcl8.4)
+             version = TCL_VERSION[0] + TCL_VERSION[2]
+             if find_library_file(self, "tcl" + version):
diff --git a/meta/recipes-devtools/python/python-imaging_1.1.7.bb b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
index de0e975..e100358 100644
--- a/meta/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -7,23 +7,31 @@ SRCNAME = "Imaging"
 PR = "r5"
 
 SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
-           file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch"
+           file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch \
+           file://allow.to.disable.some.features.patch"
 
 SRC_URI[md5sum] = "fc14a54e1ce02a0225be8854bfba478e"
 SRC_URI[sha256sum] = "895bc7c2498c8e1f9b99938f1a40dc86b3f149741f105cf7c7bd2e0725405211"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
+# There isn't enable/disable option, and lcms is in meta-oe, at least make it explicit when enabled
+# setup.py already has FIXME: add mechanism to explicitly *disable* the use of a library
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lcms] = ",,lcms"
+
 inherit distutils
 
 do_compile() {
     export STAGING_LIBDIR=${STAGING_LIBDIR}
     export STAGING_INCDIR=${STAGING_INCDIR}
+    export LCMS_ENABLED=${@base_contains('PACKAGECONFIG', 'lcms', 'True', 'False', d)}
     distutils_do_compile
 }
 
 do_install() {
     export STAGING_LIBDIR=${STAGING_LIBDIR}
     export STAGING_INCDIR=${STAGING_INCDIR}
+    export LCMS_ENABLED=${@base_contains('PACKAGECONFIG', 'lcms', 'True', 'False', d)}
     distutils_do_install
     install -d ${D}${datadir}/doc/${BPN}/html/
     install -m 0644 ${S}/README ${D}${datadir}/doc/${BPN}/
-- 
1.8.3.2



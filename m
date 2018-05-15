Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA5374FB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 10:06:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="39942561"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2018 18:06:42 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 3BF6F4B3ED60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 18:06:37 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 15 May 2018 18:06:40 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 May 2018 18:05:59 +0800
Message-ID: <20180515100559.4146-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: 3BF6F4B3ED60.A19A1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] fontconfig: 2.12.6 -> 2.13.0
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
X-List-Received-Date: Tue, 15 May 2018 10:06:43 -0000
Content-Type: text/plain

  1) Upgrade fontconfig from 2.12.6 to 2.13.0.

  2) Deleted 0001-src-fcxml.c-avoid-double-free-of-filename.patch because it has been fixed in new version.

  3) Modify revert-static-pkgconfig.patch for new version.

  4) Modify the LIC_FILES_CHKSUM for src/fccache.c has been changed in new version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...src-fcxml.c-avoid-double-free-of-filename.patch | 28 ----------------
 .../fontconfig/revert-static-pkgconfig.patch       | 39 +++++++++++++++-------
 .../{fontconfig_2.12.6.bb => fontconfig_2.13.0.bb} | 13 ++++----
 3 files changed, 33 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.12.6.bb => fontconfig_2.13.0.bb} (84%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch
deleted file mode 100644
index 3ca9fde..0000000
--- a/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a163c81ac430cdc292add200f3e6a0c048be4d7e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 11 Oct 2017 17:40:09 +0300
-Subject: [PATCH] src/fcxml.c: avoid double free() of filename
-
-It's also freed after bail1, so no need to do it here.
-
-Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=103221]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/fcxml.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/fcxml.c b/src/fcxml.c
-index 19ce96a..edb6054 100644
---- a/src/fcxml.c
-+++ b/src/fcxml.c
-@@ -3398,7 +3398,6 @@ FcConfigParseAndLoad (FcConfig	    *config,
- 
-     fd = FcOpen ((char *) filename, O_RDONLY);
-     if (fd == -1) {
--	FcStrFree (filename);
- 	goto bail1;
-     }
- 
--- 
-2.14.1
-
diff --git a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
index fca1e65..d9d65d8 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
+++ b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
@@ -1,20 +1,35 @@
-Revert part of http://cgit.freedesktop.org/fontconfig/commit/fontconfig.pc.in?id=338ffe6b886ad4ba86ff471cb59c4a5e5ffbe408
-We really dont do static linking so its not going to cause issues for us but as such this is harming us by adding absolute
-paths into -I options into fontconfig.pc which is them prepended with sysroot when read back by cross pkg-config and
-we end up with -I <sysroot>/<sysroot>/usr/include/fontconfig in CFLAGS of clients which depend on it. one such example
-is matchbox-panel-2 and it was working fine with gcc < 5 because it tolerated non-existing paths in -I flags but gcc-5
-gently refuses and rightly so.
+From 96501ced292dc14743f45f1fd5bfcbce22aa3cc3 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Sun, 13 May 2018 15:41:11 +0900
+Subject: [PATCH] Revert part of
+ http://cgit.freedesktop.org/fontconfig/commit/fontconfig.pc.in?id=338ffe6b886ad4ba86ff471cb59c4a5e5ffbe408
+ We really dont do static linking so its not going to cause issues for us but
+ as such this is harming us by adding absolute paths into -I options into
+ fontconfig.pc which is them prepended with sysroot when read back by cross
+ pkg-config and we end up with -I <sysroot>/<sysroot>/usr/include/fontconfig
+ in CFLAGS of clients which depend on it. one such example is matchbox-panel-2
+ and it was working fine with gcc < 5 because it tolerated non-existing paths
+ in -I flags but gcc-5 gently refuses and rightly so.
 
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: fontconfig-2.11.93/fontconfig.pc.in
-===================================================================
---- fontconfig-2.11.93.orig/fontconfig.pc.in
-+++ fontconfig-2.11.93/fontconfig.pc.in
+Update for 2.13.0.
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ fontconfig.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fontconfig.pc.in b/fontconfig.pc.in
+index 61b35fb..5bc9bab 100644
+--- a/fontconfig.pc.in
++++ b/fontconfig.pc.in
 @@ -15,4 +15,4 @@ Requires: @PKGCONFIG_REQUIRES@
  Requires.private: @PKGCONFIG_REQUIRES_PRIVATELY@
  Libs: -L${libdir} -lfontconfig
- Libs.private: @EXPAT_LIBS@ @FREETYPE_LIBS@ @ICONV_LIBS@ @LIBXML2_LIBS@
--Cflags: -I${includedir} @EXPAT_CFLAGS@ @FREETYPE_CFLAGS@ @ICONV_CFLAGS@ @LIBXML2_CFLAGS@
+ Libs.private: @ICONV_LIBS@ @PKG_EXPAT_LIBS@
+-Cflags: -I${includedir} @ICONV_CFLAGS@ @PKG_EXPAT_CFLAGS@
 +Cflags: -I${includedir}
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.13.0.bb
similarity index 84%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.13.0.bb
index d4cbce8..9bfb596 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.13.0.bb
@@ -14,19 +14,18 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 LICENSE = "MIT-style & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
                     file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
-                    file://src/fccache.c;beginline=1367;endline=1382;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
+                    file://src/fccache.c;beginline=1367;endline=1382;md5=fd720b34453ea047ba69bdf9a1cabb8e"
 
 SECTION = "libs"
 
-DEPENDS = "expat freetype zlib gperf-native"
+DEPENDS = "expat freetype zlib gperf-native e2fsprogs"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
-           file://0001-src-fcxml.c-avoid-double-free-of-filename.patch \
            "
 
-SRC_URI[md5sum] = "00e748c67fad11e7057a71ed385e8bdb"
-SRC_URI[sha256sum] = "064b9ebf060c9e77011733ac9dc0e2ce92870b574cca2405e11f5353a683c334"
+SRC_URI[md5sum] = "4d1533f05f5260fdee33950c895cc6c9"
+SRC_URI[sha256sum] = "a6ca290637d8b2c4e1dd40549b179202977593f7481ec83ddfb1765ad90037ba"
 
 UPSTREAM_CHECK_REGEX = "fontconfig-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
@@ -36,7 +35,7 @@ do_configure_prepend() {
 }
 
 PACKAGES =+ "fontconfig-utils"
-FILES_${PN} =+ "${datadir}/xml/*"
+FILES_${PN} =+ "${datadir}/xml/* ${datadir}/gettext/*"
 FILES_fontconfig-utils = "${bindir}/*"
 
 # Work around past breakage in debian.bbclass
@@ -45,7 +44,7 @@ RREPLACES_fontconfig-utils = "libfontconfig-utils"
 RCONFLICTS_fontconfig-utils = "libfontconfig-utils"
 DEBIAN_NOAUTONAME_fontconfig-utils = "1"
 
-inherit autotools pkgconfig relative_symlinks
+inherit autotools pkgconfig relative_symlinks gettext
 
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 
-- 
2.7.4





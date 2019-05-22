Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CDD577D8EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 10:58:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4588kx1NN7z60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 12:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558522729;
	bh=XpX9I/6VgbbpwfzmMd5hCpjQECgXzuQI0gNDJ+r3Ub4=;
	h=From:To:Subject:Date:From;
	b=m3INGdu2DtQv7bDNkHhjOv84a20KY6SQZ1wc1NLBaq5Dn5XYxtN97rT1RNQPNEyH0
	dEImpues+W+i3v+QGq5LwjUJTmBDqQus4KHKMWEEhY+LChnhcGiTF5F6pgaOayQwuc
	eu2ANuAdoBwkgIHCyAsZsbaoGM9qhX4PzaYSGtISyeQU5O2eIKBOzdLzLFqKsJ9BPu
	4gLeDJ6EAFTlsTyTqHU/xmLlteQA13h4wj7EhP2ImgyTjmlWvVi+kkBvF7AMvPxeSo
	cyQPGNi9HaL9poYBB5U3X7nmpYZ8BoUmikz3CKoCyREuOkjDCXAbp1uc/v9ot4ai3N
	YOrFkW60MzOxRAuRYZbh/BkHBN2Fuh55FAFU75MiQ3q20q+Sn3KNqm4O5/q0B+wqh6
	2oB6u0wxZhLo6lJp/+HBnyat4qvlp0EZ2c3Lirwn4NdJfuprc8R7AIyrOLucf5lLPr
	sHitRHMskDfD9O50D0hqLLDfNC4VGEiftHmINRpTAM3pNxqsie99aCOiYzNfSCE5g9
	EY/Yw0PRCQzuU4hJWCPXTkvcE9IQXkkBsM53r36/DEZHnMez7mnT+R9plnFtfMx5xT
	jtFASi5gXqC025hDVVwQrgTXCKZAi7XSBnS6SH0iOJVuUv1dWNaU2yjQyzsxse5ORo
	5STfwGpvn32YsEXnz5Kiyf+k=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 13:58:47 +0300
Message-Id: <20190522105847.6512-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] librsvg: Replace workaround for old host systems with upstream fix
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
X-List-Received-Date: Wed, 22 May 2019 10:58:49 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...t-Bsymbolic-fixes-configure-on-macOS.patch | 35 +++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.40.20.bb |  8 ++---
 2 files changed, 38 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch b/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch
new file mode 100644
index 0000000000..954bb60880
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch
@@ -0,0 +1,35 @@
+From b99891e31eb6ce550e7e1cb2ca592095b3050a93 Mon Sep 17 00:00:00 2001
+From: Brion Vibber <brion@pobox.com>
+Date: Sun, 25 Feb 2018 18:42:36 -0800
+Subject: Auto-detect -Bsymbolic, fixes configure on macOS
+
+The -Bsymbolic linker option is ELF-specific, and was breaking
+configure on macOS unless --disable-Bsymbolic was explicitly passed.
+
+Switching the behavior from requiring -Bsymbolic to be available
+by default to just warning and continuing on without.
+
+Fixes https://gitlab.gnome.org/GNOME/librsvg/issues/211
+
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 15b26b2d..9f8dce29 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -216,7 +216,7 @@ AM_CONDITIONAL([ENABLE_PIXBUF_LOADER],[test "$enable_pixbuf_loader" = "yes"])
+ AC_ARG_ENABLE([Bsymbolic],
+   [AS_HELP_STRING([--disable-Bsymbolic],
+                   [disable linking with -Bsymbolic])],
+-  [],[enable_Bsymbolic=yes])
++  [enable_Bsymbolic=no],[enable_Bsymbolic=auto])
+ 
+ BSYMBOLIC_LDFLAG=
+ if test "$enable_Bsymbolic" != "no"; then
+-- 
+2.20.1
+
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
index e376d52ef3..6a798e6a91 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
@@ -14,17 +14,15 @@ BBCLASSEXTEND = "native"
 
 inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspection
 
-SRC_URI += "file://gtk-option.patch"
+SRC_URI += "file://gtk-option.patch \
+            file://0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch \
+"
 
 SRC_URI[archive.md5sum] = "4949d313b0c5d9161a5c259104af5568"
 SRC_URI[archive.sha256sum] = "cff4dd3c3b78bfe99d8fcfad3b8ba1eee3289a0823c0e118d78106be6b84c92b"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
-# The older ld (2.22) on the host (Centos 6.5) doesn't have the
-# -Bsymbolic-functions option, we can disable it for native.
-EXTRA_OECONF_append_class-native = " --enable-Bsymbolic=auto"
-
 PACKAGECONFIG ??= "gdkpixbuf"
 # The gdk-pixbuf loader
 PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader,gdk-pixbuf-native"
-- 
2.17.1



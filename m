Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3349B6C7FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 22:45:09 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id ex4so4926759wid.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 14:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MEUocoMT7yYvz7QSq8FMtjhS3CJx0Biqz9ixW8minI8=;
	b=h6H3pHJ7VYAVpfqfvyD1/agmOt5AJojuLU3ZEXtr+W2zmt7OwNxp+j0kK0SOmEE+e3
	Uqemm3TZNWBdgXQYFfmzs4wHAbLMF0SVgMCkVfUds6rv88f/W7xWWcqoDFx2rFba+11O
	vIUpHYlv+E4+qflQ6TS18SBTodADJB0j1eDwK4Jmcnl/daxfUn0rKJbCV7S6isMcJc2O
	/xlOGlkwIzwtvNx0M/rh3Mx/oqh0+LpVUwCFyB0GSoJegvnanufo0GBJFjqtLTgWgXyf
	zCWB79C7a9xCpD+5hBP39JneklMsmNBYZOljwp7kc0iwioqKAE2/W/oEmgOnpdZQHUpe
	UYGQ==
X-Gm-Message-State: ALoCoQkBUS3krULAi1hQUD7qCLRu3W9wItTEN3hTBGQvnv6RQwOQen/q64/yjgyxWGSfwkE7uCJw
X-Received: by 10.194.80.137 with SMTP id r9mr108403wjx.88.1390257909763;
	Mon, 20 Jan 2014 14:45:09 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id uc9sm5733776wib.2.2014.01.20.14.45.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 14:45:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 22:45:01 +0000
Message-Id: <1390257902-31739-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1390257902-31739-1-git-send-email-ross.burton@intel.com>
References: <1390257902-31739-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] gdk-pixbuf: don't forcibly disable GIO sniffing, use PACKAGECONFIG.
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
X-List-Received-Date: Mon, 20 Jan 2014 22:45:09 -0000

There's a configure option for GIO sniffing so don't use a patch to disable it.
Instead use a PACKAGECONFIG for this and default to off, as using GIO for
sniffing means a hard dependency on shared-mime-info.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gdk-pixbuf/gdk-pixbuf/configure_fix.patch      |   21 --------------------
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb |    4 +++-
 2 files changed, 3 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/configure_fix.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/configure_fix.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/configure_fix.patch
deleted file mode 100644
index b141690..0000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/configure_fix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-can sniff check buillds and runs an C binary, which breaks configure in
-cross-compile environ.
-This patch simple disables it.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: gdk-pixbuf-2.22.1/configure.ac
-===================================================================
---- gdk-pixbuf-2.22.1.orig/configure.ac	2010-11-25 16:26:41.000000000 +0800
-+++ gdk-pixbuf-2.22.1/configure.ac	2010-11-25 16:29:22.000000000 +0800
-@@ -99,6 +99,8 @@
- AC_MSG_CHECKING([for native Win32])
- LIB_EXE_MACHINE_FLAG=X86
- EXE_MANIFEST_ARCHITECTURE=X86
-+dnl disable can sniff check in cross compile
-+gio_can_sniff=no
- case "$host" in
-   *-*-mingw*)
-     os_win32=yes
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
index dd1f27f..4c4d207 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
@@ -15,7 +15,6 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
-           file://configure_fix.patch \
            file://extending-libinstall-dependencies.patch \
            "
 
@@ -29,6 +28,9 @@ LIBV = "2.10.0"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG_class-native = ""
+
+# Use GIO to sniff image format instead of trying all loaders
+PACKAGECONFIG[gio-sniff] = "--enable-gio-sniffing,--disable-gio-sniffing,,shared-mime-info"
 PACKAGECONFIG[x11] = "--with-x11,--without-x11,virtual/libx11"
 
 EXTRA_OECONF = "\
-- 
1.7.10.4



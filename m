Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4B89571C24
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:53 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id u143so3179464oif.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8GSf0cqtAxVYlHi17HMf7PJjPzAq8CO7i91phTLyBLg=;
	b=ps5/yloOCbLKFtgNuPMkosqrpgTNEE+pLBj0x3tsBay8oX7XOlZx99bWTm033mSkLW
	ejjG/219henZF1vgL7Kngv9Ul4t9V66An+znm4n7xI1yianpmiExHeGLqpg9OAGp5nvD
	8KobFxVayA5UVhaj2vWAjeHx+pKPpbwMN9KtyhJWdo/tjWFFI3JaENGPtXFurrIcb0p3
	Tmib6oPMCLflTtgkXV0yID47wmvcC9mTwEtOdDhLCLhRriZeu3v52YJluzDuAfK24eri
	swEm03SuidKVAmEm3rSfNY6BUBUtHxdZTsamqDGAbgyBAn9mAqd7G2I5nhLO+OEHZ8hy
	RO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8GSf0cqtAxVYlHi17HMf7PJjPzAq8CO7i91phTLyBLg=;
	b=pjePUIcAlzSxj6ODOSjquYhf402HKAuv13ML+jIsjHNMsRiuBmbKUQ/lw+AjGDerbY
	ogkOVGrStvjevJ81/noGSyWmiaos1MYDnGyZZsj5A1IFNhNPJjNtmXtRcuqjea5r41SY
	2+IKykzhZ+o25SSGom1GcJHddM9N+t7KRSlHVgYJka519gU7OO4OEQBdgNBJAtiCrFQ1
	ny9jFDhX4RAUzFM/UV0adeagDC/oN/rbPQxiMA/umv+4cYFR32gETdIiX+LDvswR6XF0
	avbNtHiK81BSD2w4qjvVjvMSTpCNP3s5wcu3w7TTZN1vUEsO2kWyPzIXsV9AjemmCxLt
	lrxA==
X-Gm-Message-State: AIkVDXIvHW/xSFUREp/zCBePzqhsJxVn8NzgNtHVAgm0AgKXPXYVBI9WwXRW+3p4CIyNfw==
X-Received: by 10.202.82.82 with SMTP id g79mr23324420oib.106.1483645613810;
	Thu, 05 Jan 2017 11:46:53 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:52 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:27 -0700
Message-Id: <c11f08a159342bbdbe50766f72096ad860b9404a.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 15/16] gnome-desktop3: fix for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:53 -0000

From: Christopher Larson <chris_larson@mentor.com>

Explicitly use strftime+strptime rather than snprintf+atol. This fixes the
build for X32, where long's size doesn't match that of time_t.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 ...op-thumbnail-don-t-convert-time_t-to-long.patch | 72 ++++++++++++++++++++++
 .../gnome-desktop/gnome-desktop3_3.22.2.bb         |  2 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch b/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
new file mode 100644
index 0000000..18a069f
--- /dev/null
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
@@ -0,0 +1,72 @@
+From adfa0c8f9fec1faac4bea6a94d947ea32e585923 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Tue, 13 Dec 2016 20:39:51 -0700
+Subject: [PATCH] gnome-desktop-thumbnail: don't convert time_t to long
+
+Explicitly use strftime+strptime rather than snprintf+atol. This fixes the
+build for X32, where long's size doesn't match that of time_t.
+
+Upstream-Status: Pending
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+---
+ libgnome-desktop/gnome-desktop-thumbnail.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/libgnome-desktop/gnome-desktop-thumbnail.c b/libgnome-desktop/gnome-desktop-thumbnail.c
+index 3946309..b756333 100644
+--- a/libgnome-desktop/gnome-desktop-thumbnail.c
++++ b/libgnome-desktop/gnome-desktop-thumbnail.c
+@@ -126,6 +126,8 @@
+  * Since: 2.2
+  */
+ 
++#define _XOPEN_SOURCE
++
+ #include <config.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+@@ -1483,6 +1485,7 @@ save_thumbnail (GdkPixbuf  *pixbuf,
+   char *tmp_path = NULL;
+   int tmp_fd;
+   char mtime_str[21];
++  struct tm *tmp_mtime = NULL;
+   gboolean ret = FALSE;
+   GError *error = NULL;
+   const char *width, *height;
+@@ -1502,7 +1505,11 @@ save_thumbnail (GdkPixbuf  *pixbuf,
+     goto out;
+   close (tmp_fd);
+ 
+-  g_snprintf (mtime_str, 21, "%ld",  mtime);
++  tmp_mtime = localtime (&mtime);
++  if (!tmp_mtime)
++    goto out;
++  strftime (mtime_str, 21, "%s", tmp_mtime);
++  free (tmp_mtime);
+   width = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Width");
+   height = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Height");
+ 
+@@ -1695,6 +1702,7 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf          *pixbuf,
+ {
+   const char *thumb_uri, *thumb_mtime_str;
+   time_t thumb_mtime;
++  struct tm tmp_mtime;
+   
+   thumb_uri = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::URI");
+   if (!thumb_uri)
+@@ -1705,7 +1713,11 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf          *pixbuf,
+   thumb_mtime_str = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::MTime");
+   if (!thumb_mtime_str)
+     return FALSE;
+-  thumb_mtime = atol (thumb_mtime_str);
++  if (!strptime (thumb_mtime_str, "%s", &tmp_mtime))
++    return FALSE;
++  thumb_mtime = mktime (&tmp_mtime);
++  if (!thumb_mtime)
++    return FALSE;
+   if (mtime != thumb_mtime)
+     return FALSE;
+   
+-- 
+2.8.0
+
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.2.bb
index e4e9d2f..e72c6ce 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.2.bb
@@ -10,6 +10,8 @@ inherit gnome pkgconfig upstream-version-is-even gobject-introspection
 SRC_URI[archive.md5sum] = "3d7222d5305f3db022eca31d8108e02d"
 SRC_URI[archive.sha256sum] = "51d7ebf7a6c359be14c3dd7a022213e931484653815eb10b0131bef4c8979e1c"
 
+SRC_URI += "file://gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch"
+
 DEPENDS += "intltool-native gnome-common-native gsettings-desktop-schemas gconf virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes udev"
 
 inherit distro_features_check gtk-doc
-- 
2.8.0



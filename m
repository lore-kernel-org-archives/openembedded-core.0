Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A8A577284C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 22:30:42 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so2017205wgh.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 14:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9T2I0W9zPehblnHonmJbkcAmZjNaQPJ/C07lHG3CK7k=;
	b=sGrMHcEHZtP/aLJakbHbho/Er3BJTg5bUzoMA2m1/mV7ZcyCws6htka3Ndp3NJRF4/
	p4HwyrAAl5vA8Jp9BIN7Pxw+QioJYz62Vxac3zjvdIjBUVmOtB3SiW+/GWapixEH0ECc
	dxAcNVDF7oydKSuaSuh7IkDodSAgD4vHwr1p8TZ8tlqk3uoH7Q4WtaPFU9vjB374tCYJ
	jyJa6aLGfK4SeDVyiBOEJYg5ch+popEGKUmVU7hTjoTUxD6XZxQiG3mSv2KlzRATCbOv
	Gw51ng/m/nOiN/COsEqvgRdnXYAPE3f5kHYJ+jfd3867yVOwxq/Rte1D+VXCuad1ToRl
	kAjA==
X-Received: by 10.194.62.235 with SMTP id b11mr11407814wjs.73.1420669842591;
	Wed, 07 Jan 2015 14:30:42 -0800 (PST)
Received: from Saturn.local.all (212-41-121-234.adsl.solnet.ch.
	[212.41.121.234])
	by mx.google.com with ESMTPSA id lg7sm4204690wic.0.2015.01.07.14.30.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 14:30:42 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jan 2015 23:29:56 +0100
Message-Id: <1420669797-17688-3-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1420669797-17688-1-git-send-email-max.krummenacher@toradex.com>
References: <1420669797-17688-1-git-send-email-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.oss.09@gmail.com>
Subject: [oe][PATCH V2 2/3] menu-cache: update to 1.0.0
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
X-List-Received-Date: Wed, 07 Jan 2015 22:30:43 -0000

From: Max Krummenacher <max.oss.09@gmail.com>

menu-cache depends on fmlib-extra and thus requires the split
of the libfm recipe in version 1.2.3.

This obsoletes Fix-segfault.patch.

menu-cache license has been changed by the authors from GPL to LGPL:
http://git.lxde.org/gitweb/?p=lxde/menu-cache.git;a=commit;h=7972913d8e47e4970b9aa70267cb87fe7eb3a8b4
http://git.lxde.org/gitweb/?p=lxde/menu-cache.git;a=commit;h=08fe520c52a79d425504ba631afbea5fd62cc735

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 .../menu-cache/files/Fix-segfault.patch            | 31 ----------------------
 .../menu-cache/menu-cache_0.4.1.bb                 | 21 ---------------
 .../menu-cache/menu-cache_1.0.0.bb                 | 16 +++++++++++
 3 files changed, 16 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-graphics/menu-cache/files/Fix-segfault.patch
 delete mode 100644 meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
 create mode 100644 meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb

diff --git a/meta/recipes-graphics/menu-cache/files/Fix-segfault.patch b/meta/recipes-graphics/menu-cache/files/Fix-segfault.patch
deleted file mode 100644
index 74a0407..0000000
--- a/meta/recipes-graphics/menu-cache/files/Fix-segfault.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a497ea6aae3994b7f6527ef7599dd95baf2ad841 Mon Sep 17 00:00:00 2001
-From: Laurentiu Palcu <laurentiu.palcu@intel.com>
-Date: Mon, 29 Apr 2013 12:04:20 +0300
-Subject: [PATCH] Fix segfault
-
-Apparently, g_io_channel_unref() was called twice: once in the
-menu-cache's on_client_closed() callback and once from the finalize
-function, g_io_unix_finalize()/g_io_win32_finalize(), which is called
-anyway when the source is removed.
-
-Upstream-Status: Pending
-Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
----
- menu-cache-daemon/menu-cached.c |    1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/menu-cache-daemon/menu-cached.c b/menu-cache-daemon/menu-cached.c
-index e246bb4..a10b6db 100644
---- a/menu-cache-daemon/menu-cached.c
-+++ b/menu-cache-daemon/menu-cached.c
-@@ -579,7 +579,6 @@ static void on_client_closed(gpointer user_data)
-         }
-     }
-     /* DEBUG("client closed"); */
--    g_io_channel_unref(ch);
- }
- 
- static gboolean on_client_data_in(GIOChannel* ch, GIOCondition cond, gpointer user_data)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb b/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
deleted file mode 100644
index 98bbe76..0000000
--- a/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Library for caching application menus"
-DESCRIPTION = "A library creating and utilizing caches to speed up freedesktop.org application menus"
-HOMEPAGE = "http://lxde.sourceforge.net/"
-
-LICENSE = "GPLv2 & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://libmenu-cache/menu-cache.h;endline=29;md5=26571532593adb17a37eac396260532c \
-                    file://menu-cache-daemon/menu-cached.c;endline=22;md5=fcecb7d315c57ef804103fa9cdab7111"
-
-SECTION = "x11/libs"
-DEPENDS = "glib-2.0 zlib"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.gz \
-           file://Fix-segfault.patch \
-          "
-
-SRC_URI[md5sum] = "20fed982f5d8e6ec8a56a5b48894ecf0"
-SRC_URI[sha256sum] = "4fa9408e353fedba5b7314cbf6b6cd06d873a1424e281aa050d88bb9c0a0191e"
-
-
-inherit autotools pkgconfig gtk-doc
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb b/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb
new file mode 100644
index 0000000..ab909f7
--- /dev/null
+++ b/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Library for caching application menus"
+DESCRIPTION = "A library creating and utilizing caches to speed up freedesktop.org application menus"
+HOMEPAGE = "http://lxde.sourceforge.net/"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0964c689fcf4c21c6797ea87408416b6"
+
+SECTION = "x11/libs"
+DEPENDS = "glib-2.0 intltool-native libfm-extra"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "4a8e6c1a86d5e64ec725d850a4abfbad"
+SRC_URI[sha256sum] = "ff7df437bbfd3119c5f662c6d209b98f15de03a7203308c6b56a4c1e1d419aaf"
+
+inherit autotools gettext pkgconfig gtk-doc
-- 
1.8.4.5



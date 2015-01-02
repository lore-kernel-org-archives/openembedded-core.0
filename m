Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1E163727B0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jan 2015 21:25:20 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id q59so4957824wes.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jan 2015 13:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Exu+8IaE6M8fXu6XypSyYr79VrkNMgEKAaYSQGenewQ=;
	b=TTKDzn87gKL1TreKMO6S8nyII9EPnZgvHMbHfVcXN+DpImFRHfi+SuQM2vE9SgnvoZ
	chNEYX847dQ0PFefgc06M3BfZnxH18VsfaWcxtzds9dKPzZboaycNPM5xWXETcXpceWI
	QrKJ81hOq9yIxlcN3eLLAZdoIf81dNYN7Ze/iNpVgqRpTb7WDmEZAuMTm1dBT/Dg3+4A
	FlREgREfyoXr3MLFoBKKeA6xhLXVxwW1BtkFb1IHxUWQ9P6bH5Wf2l8HuCj9F+8IxzQh
	pbRwmq3g0YALGLFCh0XRwKG2DSTjyFzMMnRtMu8aYx3f2rocA1gaPbFA8ScVljTWxqB+
	YDHw==
X-Received: by 10.194.90.10 with SMTP id bs10mr155771667wjb.43.1420233920869; 
	Fri, 02 Jan 2015 13:25:20 -0800 (PST)
Received: from Saturn.local.all (212-41-114-243.adsl.solnet.ch.
	[212.41.114.243]) by mx.google.com with ESMTPSA id
	u18sm65897114wjq.42.2015.01.02.13.25.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jan 2015 13:25:20 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jan 2015 22:25:03 +0100
Message-Id: <1420233904-26745-3-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1420233904-26745-1-git-send-email-max.oss.09@gmail.com>
References: <1420233904-26745-1-git-send-email-max.oss.09@gmail.com>
Subject: [oe][PATCH 2/3] menu-cache: update to 1.0.0
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
X-List-Received-Date: Fri, 02 Jan 2015 21:25:21 -0000

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
index 0000000..b0d5205
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
+SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/${PN}-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "4a8e6c1a86d5e64ec725d850a4abfbad"
+SRC_URI[sha256sum] = "ff7df437bbfd3119c5f662c6d209b98f15de03a7203308c6b56a4c1e1d419aaf"
+
+inherit autotools gettext pkgconfig gtk-doc
-- 
1.8.4.5



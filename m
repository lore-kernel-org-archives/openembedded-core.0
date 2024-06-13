Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E5DC27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 05:54:30 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.1499.1718258061177819609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 22:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ExjVXKR4;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3d1bc6e5f01so310065b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 22:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718258060; x=1718862860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fmtx9xw3w05RiLvm9TGYDtgbCZHZnOVdrvFxgLpHECU=;
        b=ExjVXKR4HKC3v2fhNfDMY7gFwJv+XpiBE2FYCgVMo8DZAe6GwESAdv5URb0b0GGW0z
         wX8W3huuLiwqScO3gdBFeBgUUpcA4QsVdqT3CwYm2cz+lel81LrYwKcW2bNCYb55kQTD
         NdP5Jr69VG85IC83o83wWHeIlQOw9Wj/GTXHVJc4BnCAaFGJMhq5vEGdik7QGfh7l2YB
         XH92QY+c5N3yCe8zKMgRARsXnLimhSYeH0VRLCyxy24WKnoDvyN5fXmmMxYWtDkR9LwR
         b3Fx7Kr4uV4d8MJJkDxJ+/SsbnLjQk3yR/mMLXrWAkqt8aSbaWXU7mMN0R7JiYOlz83I
         3nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718258060; x=1718862860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmtx9xw3w05RiLvm9TGYDtgbCZHZnOVdrvFxgLpHECU=;
        b=KluZLX/ru/zWcIR9qar3/FAzEacALOggsypcbAOlJVmwFfSMcqzENTkdlq6HcRVz/2
         vVBKEPuYImLqbqmXZ3cWsUFEYTf1tKDwd1wl+C1HnX+ipUc1SWNzpPp4RO/1U66+y3O/
         cOQBAArvfvroavWhm9rC9j83BDbK+UHZ8h6v8UUiIoTIJmSvz49ozZC55qSND5gio31T
         1rVqSqOASAwXIzOuc1H8YFY/SIVydJwJWLW1uDeBEdNwi1WCJxPx5kFQtIsqy4MTgQ3F
         8Ssfd119sL37HN/kgMf/lyYX859svz3EWeJe0C4oZ3GAMF3RmrzzUDwrZmm10oiP0DnQ
         6CFg==
X-Gm-Message-State: AOJu0YzzfYYQCre6QbPOEK8L5etLLVu5whEW/+CmS6FCDZhpNDa0J7R7
	t1jXV2/I08KJYF6+SRaIZ+Z8prs8a0M462kykNOU2rUDQLjut1mBL7+xoA==
X-Google-Smtp-Source: AGHT+IFkLfVvLYH6tzPRYKDx3bBlvuVx7XAiZn+1SKg4oMQoBvFbXC1Udj+odrn5J8Cb6MZhHnJcEA==
X-Received: by 2002:a05:6808:3a09:b0:3d2:2b8e:386d with SMTP id 5614622812f47-3d23e0a78damr4605581b6e.6.1718258059924;
        Wed, 12 Jun 2024 22:54:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::91d2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc91f6a4sm554070b3a.13.2024.06.12.22.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 22:54:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gstreamer1.0-plugins-bad: Fix build with musl
Date: Wed, 12 Jun 2024 22:54:17 -0700
Message-ID: <20240613055417.62801-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 05:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200586

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Refresh patch and change upstream status to accepted

 ...path_get_basename-instead-of-libc-ba.patch | 96 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.24.3.bb        |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch
new file mode 100644
index 00000000000..24b2741e39b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch
@@ -0,0 +1,96 @@
+From 7c558e8ef9375aea953d1e7c854b25947c967f76 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jun 2024 23:09:54 -0700
+Subject: [PATCH] uvcgadget: Use g_path_get_basename instead of libc basename
+
+Musl does not implement GNU basename and have fixed a bug where the
+prototype was leaked into string.h [1], which resullts in compile errors
+with GCC-14 and Clang-17+
+
+| sys/uvcgadget/configfs.c:262:21: error: call to undeclared function 'basename'
+ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+|   262 |     const char *v = basename (globbuf.gl_pathv[i]);
+|       |                     ^
+
+Use glib function instead makes it portable across musl and glibc on
+linux
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7a
+
+Upstream-Status: Accepted [https://gitlab.freedesktop.org/gstreamer/gstreamer/merge_requests/7006]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../gst-plugins-bad/sys/uvcgadget/configfs.c   | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+--- a/sys/uvcgadget/configfs.c
++++ b/sys/uvcgadget/configfs.c
+@@ -7,7 +7,7 @@
+  * Contact: Kieran Bingham <kieran.bingham@ideasonboard.com>
+  */
+ 
+-/* To provide basename and asprintf from the GNU library. */
++/* To provide asprintf from the GNU library. */
+ #define _GNU_SOURCE
+ 
+ #include <dirent.h>
+@@ -259,9 +259,10 @@ udc_find_video_device (const char *udc,
+   }
+ 
+   if (i < globbuf.gl_pathc) {
+-    const char *v = basename (globbuf.gl_pathv[i]);
++    gchar *v = g_path_get_basename (globbuf.gl_pathv[i]);
+ 
+     video = path_join ("/dev", v);
++    g_free (v);
+   }
+ 
+   globfree (&globbuf);
+@@ -894,6 +895,7 @@ configfs_parse_uvc_function (const char
+ {
+   struct uvc_function_config *fc;
+   char *fpath;
++  gchar *bname;
+   int ret = 0;
+ 
+   fc = malloc (sizeof *fc);
+@@ -923,11 +925,10 @@ configfs_parse_uvc_function (const char
+    * Parse the function configuration. Remove the gadget name qualifier
+    * from the function name, if any.
+    */
+-  if (function)
+-    function = basename (function);
++  bname = g_path_get_basename (function);
+ 
+   fc->udc = attribute_read_str (fpath, "../../UDC");
+-  fc->video = udc_find_video_device (fc->udc, function);
++  fc->video = udc_find_video_device (fc->udc, bname);
+   if (!fc->video) {
+     ret = -ENODEV;
+     goto done;
+@@ -942,6 +943,7 @@ done:
+   }
+ 
+   free (fpath);
++  g_free (bname);
+ 
+   return fc;
+ }
+@@ -979,12 +981,16 @@ configfs_parse_uvc_videodev (int fd, con
+   char *function = NULL;
+   char rpath[PATH_MAX];
+   char *res;
++  gchar *bname;
+ 
+   res = realpath (video, rpath);
+   if (!res)
+     return NULL;
+ 
+-  function = video_find_config_name (basename (rpath));
++  bname = g_path_get_basename (rpath);
++  function = video_find_config_name (bname);
++  g_free (bname);
++
+   if (!function)
+     return NULL;
+ 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
index dbd504e87dc..ccb1a544562 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
+           file://0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch \
            "
 SRC_URI[sha256sum] = "e90f26c7dc9c76f4aa599b758cfd6d8c10d6a0b9cb265ba2c3c9bdf3888558f8"
 


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8D2C27C6E
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 06:00:50 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.1524.1718258449176783361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 23:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JiR70SZo;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so436396a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 23:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718258448; x=1718863248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AdkXK0bH57MUsctVGvK6ZbGh4tszhtzCYutMDq52L9o=;
        b=JiR70SZoMLd3BYYCPBPg5VoEx+6kDaO4LJ3TKAxM/J4Tyad4n29xZ46gann0jUp837
         zsE48n/LY03CNugDoDPG7PtxDx3FbgxckWCXADnz/eAdZjGoJBLhFnQKBzAMzCZGtlxf
         F9sIF0tEYLzmHLz17GXX8DLABuAPeO8k6nlt7BAzwvbttrKH15rEUvewOrvsotjltHCr
         72pA46tcT5vNiXyc8okl512BPT8q6Y/1Zr1MqxtpTYzfxwhzCndopx9tWJgyUwKAXdJi
         /RNnDeapQ6nOIc/mUX7JcvwcteP9IGJ/gA6WsM75hFg+lzedaPhr9OQ3aW18yTQRgOVL
         5vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718258448; x=1718863248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdkXK0bH57MUsctVGvK6ZbGh4tszhtzCYutMDq52L9o=;
        b=OzNaduDADhAN51PqLUikX0cAed4O0YC0E3gOo08NhC06FYKiMjbuZUCJa5jDvJcTZN
         qy9fFni/uNseowF+7diXwwKzk9jeKI/AYSjJQQvQpPkqaRhTKgOquyD9uOdRJT4z+K3h
         kQ11YVIdO6/I9FPHy4A1+0wmYjuSBIeN45+SGraWrh/UOjVhg6/JaCK8l7/eKA/qppFX
         wqpysRQb/DgmPOVmTcrIlpaqcLHDv0Su7QzSbAtvDyU9fCUjNoNeaW6J4AzTkc7cwCny
         yAY2r+6XrS+4RDi4/lCVPRlC8YsnG7ZWS2gR9Eyr2kyQFPMseszVgxiMT8Tf9hXXiD5v
         79Yg==
X-Gm-Message-State: AOJu0YxpNYlaTX6YLcb54881qLnPWu1evH7WL2CG+sfwhFk2sN5nUdcu
	02ClUigv4145b1NEuky1vkkLOnVUHdtT6RfQko2s0BZbOd0KNN156So2RQ==
X-Google-Smtp-Source: AGHT+IEXCTIonqIbcV2z163p3uzt143Qeh5uyo1bN1HQFiiNXW3XjcbWmQsG3waon8rGh93RySSnuA==
X-Received: by 2002:a17:902:c245:b0:1f7:1cbc:184b with SMTP id d9443c01a7336-1f83b698483mr35243185ad.20.1718258447822;
        Wed, 12 Jun 2024 23:00:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::91d2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e6e223sm4862735ad.66.2024.06.12.23.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 23:00:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] gstreamer1.0-plugins-bad: Fix build with musl
Date: Wed, 12 Jun 2024 23:00:45 -0700
Message-ID: <20240613060045.99839-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 06:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200587

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Refresh patch and change upstream status to accepted
v3: Change status to backport

 ...path_get_basename-instead-of-libc-ba.patch | 96 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.24.3.bb        |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch
new file mode 100644
index 00000000000..cc21435ddeb
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
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/merge_requests/7006]
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
 


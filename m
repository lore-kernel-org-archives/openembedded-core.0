Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A431C27C75
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 20:46:54 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.547.1718225204282970361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 13:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UYBsfew3;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f47f07acd3so3377595ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 13:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718225203; x=1718830003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M3oI4hFhQAMlh4kQIFnFPF3+Ok/RxPkH5OdgXbJua4c=;
        b=UYBsfew3GZuXGnhAlBybhXo7xMygAOV2JyZYLioks9IRzbWlAzDPnDgUnMuU9WtzOI
         Sn6PsuRNvrKaHd8ExweLcFfyWwI/uj9snRoqqpoxdVG30C2SaxruEq3zINufvkfU4kva
         bSSibHZh5Qi8dD+jyWN9mmwFH7XtcUlaJsbef25hP3Q9qAZMqR8l3GtJyuTx5yV8nzwA
         c1mOH5ZivbNpB9UTt86eY+214HZRd41sC7R8YshtYY3AZ+ZuED4IEc1+Tzi9KNFNZ1mE
         mI6F43Qv5ulrLfWqIeDX+rUnN0zN78r47B5yXcfRHLreyv77dSWNGAOxoFdC1RMpcD+L
         OEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718225203; x=1718830003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3oI4hFhQAMlh4kQIFnFPF3+Ok/RxPkH5OdgXbJua4c=;
        b=mZjP5/ekyT4BbtPqjE3PLYUVQyngPD+4FP7WvuZF58Cv1LH8Nc+Rh+AOFT7v+gJEKD
         WI8mfwW/++5JV0NhEKMR05vuDoBBR/uRWM/od2TRTIM+wgkYygRYay1ENFD+w0LS+G+C
         lSkPCxy+bJo3sDAGrhvpqLuF0TJpMQ+/ikRBHemKIEqL0hsaNaAkdIpaE++qdJMd05uz
         YVZ/UD4WxsoJ3LUt2PZ/8XZNek986QHaj0e2rhjRBb/mgrIfc2zMRjO7abCNXB1DvPPa
         sPErHUvKSEQ0nKJ9ByXBQvVzsXyPuuiinEs9j4EBNpBadISxj/1XII3DRvPFNF5zTf8n
         li+Q==
X-Gm-Message-State: AOJu0YwM+E0mvsk76weLF+OeyK2VYVCQfVp5eIAacIOKb8reZQGoLuC9
	ZCZ79aPntcKIyIPTD1caIMH3YF/JSz649dxQOwXlMYqUUl+mfBON+7o4AQ==
X-Google-Smtp-Source: AGHT+IGQy3Ab0V0Y0fSqxZT//7aoXmGc9qs1zW02yKOooHIXsyf7LAkPoVlM6raDp0ptH6y92SQybA==
X-Received: by 2002:a17:902:ce8d:b0:1f7:20eb:913e with SMTP id d9443c01a7336-1f83b715c86mr32970875ad.52.1718225203325;
        Wed, 12 Jun 2024 13:46:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71303fc21sm65529505ad.51.2024.06.12.13.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 13:46:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gstreamer1.0-plugins-bad: Fix build with musl
Date: Wed, 12 Jun 2024 13:46:40 -0700
Message-ID: <20240612204640.3909981-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 20:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200581

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...path_get_basename-instead-of-libc-ba.patch | 98 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.24.3.bb        |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch
new file mode 100644
index 00000000000..3c93384d3db
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch
@@ -0,0 +1,98 @@
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
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/merge_requests/7006]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../gst-plugins-bad/sys/uvcgadget/configfs.c   | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/subprojects/gst-plugins-bad/sys/uvcgadget/configfs.c b/subprojects/gst-plugins-bad/sys/uvcgadget/configfs.c
+index 51b75cd795..3f43b80f6e 100644
+--- a/subprojects/gst-plugins-bad/sys/uvcgadget/configfs.c
++++ b/subprojects/gst-plugins-bad/sys/uvcgadget/configfs.c
+@@ -7,7 +7,7 @@
+  * Contact: Kieran Bingham <kieran.bingham@ideasonboard.com>
+  */
+ 
+-/* To provide basename and asprintf from the GNU library. */
++/* To provide asprintf from the GNU library. */
+ #define _GNU_SOURCE
+ 
+ #include <dirent.h>
+@@ -259,9 +259,10 @@ udc_find_video_device (const char *udc, const char *function)
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
+@@ -894,6 +895,7 @@ configfs_parse_uvc_function (const char *function)
+ {
+   struct uvc_function_config *fc;
+   char *fpath;
++  gchar *bname;
+   int ret = 0;
+ 
+   fc = malloc (sizeof *fc);
+@@ -923,11 +925,10 @@ configfs_parse_uvc_function (const char *function)
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
+@@ -979,12 +981,16 @@ configfs_parse_uvc_videodev (int fd, const char *video)
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
 


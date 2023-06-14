Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE39C001E0
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:44 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.7472.1686734975135896773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rJboUdw9;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-970028cfb6cso85331466b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734973; x=1689326973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1i5gYyfsQ9EyvDPl8ex0rh/gC9HvxBuZjkI3QV6vfns=;
        b=rJboUdw9Iy+0/nye0ntlRtzSW1RrX8gmgtv/rQm6yWB6x6vq8Qayu1SA+gL5fTrHj4
         CDBzq5yTmOH3hdsdUK57BOn1ylFnSzz74b0ehNzpJp9aBlD833KGXPr1PG4Qon/CpH7X
         xwGFWt0ZBFPLBxPigS7uvEqzuOqLhr/83fPomacBWjvPBIujSo09rKE6zAbZ/Wsi66al
         te2rcth5/IHmvTISMw0Fbdu4FER+83TIa9T/eJnFvoRX8zR34QtnewQW9IEVHRXz4Qdy
         YrIhRgeMEObKQLohsx8aVEqTGfeglPhoU/Td9xcWD6wZsyXxaWRlxfPYibixvoJcv2G2
         NiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734973; x=1689326973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1i5gYyfsQ9EyvDPl8ex0rh/gC9HvxBuZjkI3QV6vfns=;
        b=dEvr3Rw0rRAXxUeRZNgbuCDcXiCXLPa/MqwbIHbFmyr4iZiRb9ypJ2/1gvAVEmwaVY
         WsICExO0DnAJlaOubXaXNaS+uv9X1OFsqWuawOaPmgJgFOF+AvQ6EY8XQt4h9YONc7DO
         iP6j22ytLUYpy0wPKLN3OWALsAyBZ6i64KTS8nf3Uff1E5xiE3z2s2lrxh6fSeyj5rvs
         o2C6DIA0GF6PH7kwYTSpxiPi0lhe016lCIHxt7URkKaAV6uhw1i8i1kQuJFIzR/IdIJf
         d4cU8kfhKRvkHqq16VNLtrBwDZjvkkj/IMuzIL91FU/zXMTw4pBSJ5xNLtRjT7QzIj1g
         JKNA==
X-Gm-Message-State: AC+VfDzwAEjale4ogbJ6jQKUWlU3YAUnMCQaMx4hZz3ktG28caAGi9PQ
	9L4rePKMmJbLlE2YdzuP3iOuks9FjCY=
X-Google-Smtp-Source: ACHHUZ4kWvgic2jL7O5frXqkKLuYGCfFth1bgObvsO4hWJpHg1p0r8xjtYB83NifBQzPI5OIY6WAMQ==
X-Received: by 2002:a17:907:7202:b0:96f:cb13:8715 with SMTP id dr2-20020a170907720200b0096fcb138715mr14842095ejc.69.1686734973498;
        Wed, 14 Jun 2023 02:29:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/55] glib-2.0: backport a patch to address ptest fails caused by coreutils 9.2+
Date: Wed, 14 Jun 2023 11:28:36 +0200
Message-Id: <20230614092918.4065570-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182758

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...pparent-size-only-for-files-and-syml.patch | 105 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch
new file mode 100644
index 00000000000..a881b25ef3e
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch
@@ -0,0 +1,105 @@
+From d1a2117dc18dbcf87685891de7e2898108b66fc9 Mon Sep 17 00:00:00 2001
+From: Joan Bruguera <joanbrugueram@gmail.com>
+Date: Thu, 23 Mar 2023 02:24:30 +0000
+Subject: [PATCH] glocalfile: Sum apparent size only for files and symlinks
+
+Since GNU Coreutils 9.2 (commit 110bcd28386b1f47a4cd876098acb708fdcbbb25),
+`du --apparent-size` (including `du --bytes`) no longer counts all kinds of
+files (directories, FIFOs, etc.), but only those for which `st_size` in
+`struct stat` is defined by POSIX, namely regular files and symlinks
+(and also rarely supported memory objects).
+
+This aligns the behaviour of GLib's `G_FILE_MEASURE_APPARENT_SIZE` flag
+with the new GNU Coreutils `du` and correct POSIX use.
+
+Note that this may be a breaking change for some uses.
+
+Link: https://lists.gnu.org/archive/html/bug-coreutils/2023-03/msg00007.html
+Fixes: https://gitlab.gnome.org/GNOME/glib/-/issues/2965
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ gio/gioenums.h   |  3 +++
+ gio/glocalfile.c | 37 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 40 insertions(+)
+
+diff --git a/gio/gioenums.h b/gio/gioenums.h
+index 7fd74a43e..c820cd36d 100644
+--- a/gio/gioenums.h
++++ b/gio/gioenums.h
+@@ -224,6 +224,9 @@ typedef enum {
+  *   sizes.  Normally, the block-size is used, if available, as this is a
+  *   more accurate representation of disk space used.
+  *   Compare with `du --apparent-size`.
++ *   Since GLib 2.78. and similarly to `du` since GNU Coreutils 9.2, this will
++ *   ignore the sizes of file types other than regular files and links, as the
++ *   sizes of other file types are not specified in a standard way.
+  * @G_FILE_MEASURE_NO_XDEV: Do not cross mount point boundaries.
+  *   Compare with `du -x`.
+  *
+diff --git a/gio/glocalfile.c b/gio/glocalfile.c
+index 67d4b99fb..dbb56902d 100644
+--- a/gio/glocalfile.c
++++ b/gio/glocalfile.c
+@@ -86,6 +86,9 @@
+ #define FILE_READ_ONLY_VOLUME           0x00080000
+ #endif
+ 
++#ifndef S_ISREG
++#define S_ISREG(m) (((m) & _S_IFMT) == _S_IFREG)
++#endif
+ #ifndef S_ISDIR
+ #define S_ISDIR(m) (((m) & _S_IFMT) == _S_IFDIR)
+ #endif
+@@ -2777,6 +2780,39 @@ g_local_file_measure_size_of_contents (gint           fd,
+                                        MeasureState  *state,
+                                        GError       **error);
+ 
++/*
++ * _g_stat_is_size_usable:
++ * @buf: a #GLocalFileStat.
++ *
++ * Checks if the file type is such that the `st_size` field of `struct stat` is
++ * well-defined by POSIX.
++ * (see https://pubs.opengroup.org/onlinepubs/009696799/basedefs/sys/stat.h.html)
++ *
++ * This behaviour is aligned with `du` from GNU Coreutils 9.2+
++ * (see https://lists.gnu.org/archive/html/bug-coreutils/2023-03/msg00007.html)
++ * and makes apparent size sums well-defined; formerly, they depended on the
++ * implementation, and could differ across filesystems.
++ *
++ * Returns: %TRUE if the size field is well-defined, %FALSE otherwise.
++ **/
++inline static gboolean
++_g_stat_is_size_usable (const GLocalFileStat *buf)
++{
++#ifndef HAVE_STATX
++  /* Memory objects are defined by POSIX, but are not supported by statx nor Windows */
++#ifdef S_TYPEISSHM
++  if (S_TYPEISSHM (buf))
++    return TRUE;
++#endif
++#ifdef S_TYPEISTMO
++  if (S_TYPEISTMO (buf))
++    return TRUE;
++#endif
++#endif
++
++  return S_ISREG (_g_stat_mode (buf)) || S_ISLNK (_g_stat_mode (buf));
++}
++
+ static gboolean
+ g_local_file_measure_size_of_file (gint           parent_fd,
+                                    GSList        *name,
+@@ -2836,6 +2872,7 @@ g_local_file_measure_size_of_file (gint           parent_fd,
+     state->disk_usage += _g_stat_blocks (&buf) * G_GUINT64_CONSTANT (512);
+   else
+ #endif
++  if (_g_stat_is_size_usable (&buf))
+     state->disk_usage += _g_stat_size (&buf);
+ 
+   if (S_ISDIR (_g_stat_mode (&buf)))
+-- 
+2.39.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
index a60e7688367..4327a133450 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch \
+           file://0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.30.2



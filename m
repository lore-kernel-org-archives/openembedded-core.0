Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78914E77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 18:08:53 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.96.1736273326971048099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 10:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Lh72IPzJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216634dd574so154616445ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 10:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736273326; x=1736878126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDjkgP5s+rb6MfiwBIso2cPOw/qF8Jf8VTVyNysdF/s=;
        b=Lh72IPzJfC5iJScHfhJfUFM2eDEs9TLM94L0nL5ssrVH6ngw8E/2yCaQD8tsxabdmt
         MKk6r7s7Vg6hX13E4U1krQ5/iuUqj4HaXBPrRapzTWv+AwmX1XjDRZY04xE21w8uUwpg
         eXfIiqDOxl9eXFGqNxvYndhck8BjO9ikFyNmMxdBKilDlD1VVj62l5xHFz4Cp1vPpEAa
         I6Ru1A7YEZAYvSmXn6VO7LMoFtJRgI9XxMHuFVbU9qwqWT2oUp3aWZMH0BdXipjI39DX
         AP8gZkAEw/iNjruMlntJRH4GQkrffNNWJTkkwfhcbrZ5JYuww8NdrrL0eid5GqNB0mbZ
         y6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736273326; x=1736878126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDjkgP5s+rb6MfiwBIso2cPOw/qF8Jf8VTVyNysdF/s=;
        b=rQ4f36dlISGU21hLMnaxE/tQnYAXgmeQ5FuT+N1VfDkVN6S+z3MbidoEkwhLT7Jcz8
         bMY18vzEwGb3Hc3+ZB0XyEOLO0vDzQtEhXTJXbTlvEUADMwIZw5YcO/jT+s5aKP00YkG
         CeUVgOZyDnL5JUJkZv4y5elget5su9D1XRCG8WMd8fmZMCbmPmNr5+ic/knfRHfgjZsJ
         QYRiGiUMDygzL4hu2lc2E8GkpvDlcMkucildu5EyEhUj/cxBc+tlKzagWL2bqVExFcuS
         NcefR5q7zAB9tmmwpWHNkzFFam0q2dNxY8IDHJ7hpTNNgLaOiZWB5BMguIDpIGU+0AwS
         Tgow==
X-Gm-Message-State: AOJu0YzEF3lApInD1GROslGabKXDYziWi68InFzqGTjj6ummY9yv4BMC
	P3k1145HFen5hZKaP0o01tzF3J7EA/YbiRMzBp7DcdphqLXHgfJpHr/WPayFW3oJH5cDfVtvSD+
	IpIk=
X-Gm-Gg: ASbGncsUt39YUUgGXQWvCYwC01KkmCkmLeWrSa3kBt7QgtnsnFkB9/0VF0YbBZDVh7O
	6S7MRXTKqZOj6CZ0D2dFhiVVHFRWTLJxpzFOAJ6l0ou/sGfHX9pFYZF/PPLRImuh3U3HO6u27LC
	+S4T2+iQvL6KVQhJbwTYNJLx8/O8mXLfK21EeTOZdAYAR3NFSxPJRAyy8mrtyrR9jcSGfO6npCy
	uesfBwyinTIhVAfXbKRDSyUTkDsaAhmgEYt0SqTfoY55Q==
X-Google-Smtp-Source: AGHT+IHyqaAitDbXxPykZ/OvsABeaIoQlPCZ5vGU2C/VsmZC2m2tjF/lrddnYosvrVRHKdQt2zY+eA==
X-Received: by 2002:a17:903:2287:b0:215:5240:bb3d with SMTP id d9443c01a7336-219e6f144a4mr1008896305ad.42.1736273325902;
        Tue, 07 Jan 2025 10:08:45 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4413sm314166335ad.172.2025.01.07.10.08.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 10:08:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/19] gstreamer1.0-plugins-base: Fix for multiple CVE's
Date: Tue,  7 Jan 2025 10:08:19 -0800
Message-ID: <a26f77ae6d98e0bf22a682fad5f4353ae257b360.1736273200.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736273200.git.steve@sakoman.com>
References: <cover.1736273200.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 18:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209482

From: Vijay Anusuri <vanusuri@mvista.com>

Backport fixes for below CVE:
CVE-2024-47538
CVE-2024-47541
CVE-2024-47542
CVE-2024-47600
CVE-2024-47607
CVE-2024-47615
CVE-2024-47835

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2024-47538.patch                      |  35 ++++
 .../CVE-2024-47541-1.patch                    |  38 ++++
 .../CVE-2024-47541-2.patch                    |  99 +++++++++++
 .../CVE-2024-47542.patch                      |  64 +++++++
 .../CVE-2024-47600.patch                      |  38 ++++
 .../CVE-2024-47607.patch                      |  41 +++++
 .../CVE-2024-47615-1.patch                    |  79 ++++++++
 .../CVE-2024-47615-2.patch                    | 168 ++++++++++++++++++
 .../CVE-2024-47835.patch                      |  39 ++++
 .../gstreamer1.0-plugins-base_1.20.7.bb       |   9 +
 10 files changed, 610 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47538.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47541-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47541-2.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47542.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47600.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47607.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47615-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47615-2.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47835.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47538.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47538.patch
new file mode 100644
index 0000000000..3e353b39fd
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47538.patch
@@ -0,0 +1,35 @@
+From 7eb26b198beffecdba4dbb64299f9cb09a9181d6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 21:35:07 +0300
+Subject: [PATCH] vorbisdec: Set at most 64 channels to NONE position
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-115
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3869
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8047>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/7eb26b198beffecdba4dbb64299f9cb09a9181d6]
+CVE: CVE-2024-47538
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-base/ext/vorbis/gstvorbisdec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/subprojects/gst-plugins-base/ext/vorbis/gstvorbisdec.c b/subprojects/gst-plugins-base/ext/vorbis/gstvorbisdec.c
+index 6a410ed858ca..1fc4fa883e68 100644
+--- a/ext/vorbis/gstvorbisdec.c
++++ b/ext/vorbis/gstvorbisdec.c
+@@ -204,7 +204,7 @@ vorbis_handle_identification_packet (GstVorbisDec * vd)
+     }
+     default:{
+       GstAudioChannelPosition position[64];
+-      gint i, max_pos = MAX (vd->vi.channels, 64);
++      gint i, max_pos = MIN (vd->vi.channels, 64);
+ 
+       GST_ELEMENT_WARNING (vd, STREAM, DECODE,
+           (NULL), ("Using NONE channel layout for more than 8 channels"));
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47541-1.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47541-1.patch
new file mode 100644
index 0000000000..32628f323c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47541-1.patch
@@ -0,0 +1,38 @@
+From 7108073b5be73eb2482eb8494745962b8c0571f1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 21:40:44 +0300
+Subject: [PATCH] ssaparse: Search for closing brace after opening brace
+
+Otherwise removing anything between the braces leads to out of bound writes if
+there is a closing brace before the first opening brace.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-228
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3870
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8048>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/7108073b5be73eb2482eb8494745962b8c0571f1]
+CVE: CVE-2024-47541
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-base/gst/subparse/gstssaparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/subprojects/gst-plugins-base/gst/subparse/gstssaparse.c b/subprojects/gst-plugins-base/gst/subparse/gstssaparse.c
+index 42fbb42b99fe..37b892e92843 100644
+--- a/gst/subparse/gstssaparse.c
++++ b/gst/subparse/gstssaparse.c
+@@ -238,7 +238,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
+   gboolean removed_any = FALSE;
+ 
+   while ((t = strchr (txt, '{'))) {
+-    end = strchr (txt, '}');
++    end = strchr (t, '}');
+     if (end == NULL) {
+       GST_WARNING_OBJECT (parse, "Missing { for style override code");
+       return removed_any;
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47541-2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47541-2.patch
new file mode 100644
index 0000000000..5d0d13a3ff
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47541-2.patch
@@ -0,0 +1,99 @@
+From b66cf81e99ab9f400b6aea79a4b597c5ddac324d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 18:36:19 +0300
+Subject: [PATCH] ssaparse: Don't use strstr() on strings that are potentially
+ not NULL-terminated
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8048>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b66cf81e99ab9f400b6aea79a4b597c5ddac324d]
+CVE: CVE-2024-47541
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst/subparse/gstssaparse.c                | 36 ++++++++++++++++++-
+ subprojects/gst-plugins-base/meson.build      |  1 +
+ 2 files changed, 36 insertions(+), 1 deletion(-)
+
+diff --git a/subprojects/gst-plugins-base/gst/subparse/gstssaparse.c b/subprojects/gst-plugins-base/gst/subparse/gstssaparse.c
+index 37b892e92843..c162a542f581 100644
+--- a/gst/subparse/gstssaparse.c
++++ b/gst/subparse/gstssaparse.c
+@@ -146,6 +146,35 @@ gst_ssa_parse_sink_event (GstPad * pad, GstObject * parent, GstEvent * event)
+   return res;
+ }
+ 
++#ifndef HAVE_MEMMEM
++// memmem() is a GNU extension so if it's not available we'll need
++// our own implementation here. Thanks C.
++static void *
++my_memmem (const void *haystack, size_t haystacklen, const void *needle,
++    size_t needlelen)
++{
++  const guint8 *cur, *end;
++
++  if (needlelen > haystacklen)
++    return NULL;
++  if (needlelen == 0)
++    return (void *) haystack;
++
++
++  cur = haystack;
++  end = cur + haystacklen - needlelen;
++
++  for (; cur <= end; cur++) {
++    if (memcmp (cur, needle, needlelen) == 0)
++      return (void *) cur;
++  }
++
++  return NULL;
++}
++#else
++#define my_memmem memmem
++#endif
++
+ static gboolean
+ gst_ssa_parse_setcaps (GstPad * sinkpad, GstCaps * caps)
+ {
+@@ -154,6 +183,7 @@ gst_ssa_parse_setcaps (GstPad * sinkpad, GstCaps * caps)
+   const GValue *val;
+   GstStructure *s;
+   const guchar bom_utf8[] = { 0xEF, 0xBB, 0xBF };
++  const guint8 header[] = "[Script Info]";
+   const gchar *end;
+   GstBuffer *priv;
+   GstMapInfo map;
+@@ -193,7 +223,7 @@ gst_ssa_parse_setcaps (GstPad * sinkpad, GstCaps * caps)
+     left -= 3;
+   }
+ 
+-  if (!strstr (ptr, "[Script Info]"))
++  if (!my_memmem (ptr, left, header, sizeof (header) - 1))
+     goto invalid_init;
+ 
+   if (!g_utf8_validate (ptr, left, &end)) {
+@@ -231,6 +261,10 @@ invalid_init:
+   }
+ }
+ 
++#ifdef my_memmem
++#undef my_memmem
++#endif
++
+ static gboolean
+ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
+ {
+diff --git a/subprojects/gst-plugins-base/meson.build b/subprojects/gst-plugins-base/meson.build
+index 65c5d944d30f..91f2b77aec23 100644
+--- a/meson.build
++++ b/meson.build
+@@ -197,6 +197,7 @@ check_functions = [
+   ['HAVE_LRINTF', 'lrintf', '#include<math.h>'],
+   ['HAVE_MMAP', 'mmap', '#include<sys/mman.h>'],
+   ['HAVE_LOG2', 'log2', '#include<math.h>'],
++  ['HAVE_MEMMEM', 'memmem', '#include<string.h>'],
+ ]
+ 
+ libm = cc.find_library('m', required : false)
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47542.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47542.patch
new file mode 100644
index 0000000000..b982c04c40
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47542.patch
@@ -0,0 +1,64 @@
+From 921d8daa00c329932616dd5d197b601a7e271e79 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 13:43:06 +0300
+Subject: [PATCH] id3v2: Don't try parsing extended header if not enough data
+ is available
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-235
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3842
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8045>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/921d8daa00c329932616dd5d197b601a7e271e79]
+CVE: CVE-2024-47542
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-base/gst-libs/gst/tag/id3v2.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/subprojects/gst-plugins-base/gst-libs/gst/tag/id3v2.c b/subprojects/gst-plugins-base/gst-libs/gst/tag/id3v2.c
+index 7db2cb7e12b6..70f975d13374 100644
+--- a/gst-libs/gst/tag/id3v2.c
++++ b/gst-libs/gst/tag/id3v2.c
+@@ -29,7 +29,7 @@
+ 
+ #define HANDLE_INVALID_SYNCSAFE
+ 
+-static gboolean id3v2_frames_to_tag_list (ID3TagsWorking * work, guint size);
++static gboolean id3v2_frames_to_tag_list (ID3TagsWorking * work);
+ 
+ #ifndef GST_DISABLE_GST_DEBUG
+ 
+@@ -258,7 +258,7 @@ gst_tag_list_from_id3v2_tag (GstBuffer * buffer)
+     GST_MEMDUMP ("ID3v2 tag (un-unsyced)", uu_data, work.hdr.frame_data_size);
+   }
+ 
+-  id3v2_frames_to_tag_list (&work, work.hdr.frame_data_size);
++  id3v2_frames_to_tag_list (&work);
+ 
+   g_free (uu_data);
+ 
+@@ -440,12 +440,17 @@ id3v2_add_id3v2_frame_blob_to_taglist (ID3TagsWorking * work,
+ }
+ 
+ static gboolean
+-id3v2_frames_to_tag_list (ID3TagsWorking * work, guint size)
++id3v2_frames_to_tag_list (ID3TagsWorking * work)
+ {
+   guint frame_hdr_size;
+ 
+   /* Extended header if present */
+   if (work->hdr.flags & ID3V2_HDR_FLAG_EXTHDR) {
++    if (work->hdr.frame_data_size < 4) {
++      GST_DEBUG ("Tag has no extended header data. Broken tag");
++      return FALSE;
++    }
++
+     work->hdr.ext_hdr_size = id3v2_read_synch_uint (work->hdr.frame_data, 4);
+ 
+     /* In id3v2.4.x the header size is the size of the *whole*
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47600.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47600.patch
new file mode 100644
index 0000000000..04bde3e62c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47600.patch
@@ -0,0 +1,38 @@
+From 5b205225e2c6a19ddcace350fdc18a0edf87bcb5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 18:19:30 +0300
+Subject: [PATCH] discoverer: Don't print channel layout for more than 64
+ channels
+
+64+ channels are always unpositioned / unknown layout.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-248
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3864
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8046>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/5b205225e2c6a19ddcace350fdc18a0edf87bcb5]
+CVE: CVE-2024-47600
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-base/tools/gst-discoverer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/subprojects/gst-plugins-base/tools/gst-discoverer.c b/subprojects/gst-plugins-base/tools/gst-discoverer.c
+index b042be535d15..6028fc71c9d0 100644
+--- a/tools/gst-discoverer.c
++++ b/tools/gst-discoverer.c
+@@ -222,7 +222,7 @@ format_channel_mask (GstDiscovererAudioInfo * ainfo)
+ 
+   channel_mask = gst_discoverer_audio_info_get_channel_mask (ainfo);
+ 
+-  if (channel_mask != 0) {
++  if (channel_mask != 0 && channels <= 64) {
+     gst_audio_channel_positions_from_mask (channels, channel_mask, position);
+ 
+     for (i = 0; i < channels; i++) {
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47607.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47607.patch
new file mode 100644
index 0000000000..48249652d9
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47607.patch
@@ -0,0 +1,41 @@
+From 804eca458fb547942ed70b88c021b996be9228a2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 1 Oct 2024 13:22:50 +0300
+Subject: [PATCH] opusdec: Set at most 64 channels to NONE position
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-116
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3871
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8049>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/804eca458fb547942ed70b88c021b996be9228a2]
+CVE: CVE-2024-47607
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-base/ext/opus/gstopusdec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/subprojects/gst-plugins-base/ext/opus/gstopusdec.c b/subprojects/gst-plugins-base/ext/opus/gstopusdec.c
+index 99289fa7d223..d3f461d9a821 100644
+--- a/ext/opus/gstopusdec.c
++++ b/ext/opus/gstopusdec.c
+@@ -440,12 +440,12 @@ gst_opus_dec_parse_header (GstOpusDec * dec, GstBuffer * buf)
+         posn = gst_opus_channel_positions[dec->n_channels - 1];
+         break;
+       default:{
+-        gint i;
++        guint i, max_pos = MIN (dec->n_channels, 64);
+ 
+         GST_ELEMENT_WARNING (GST_ELEMENT (dec), STREAM, DECODE,
+             (NULL), ("Using NONE channel layout for more than 8 channels"));
+ 
+-        for (i = 0; i < dec->n_channels; i++)
++        for (i = 0; i < max_pos; i++)
+           pos[i] = GST_AUDIO_CHANNEL_POSITION_NONE;
+ 
+         posn = pos;
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47615-1.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47615-1.patch
new file mode 100644
index 0000000000..d9619ede52
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47615-1.patch
@@ -0,0 +1,79 @@
+From 30fa21ac45ef5dad2fef0d98f0e7130c75f0b628 Mon Sep 17 00:00:00 2001
+From: Mathieu Duponchelle <mathieu@centricular.com>
+Date: Wed, 2 Oct 2024 15:16:30 +0200
+Subject: [PATCH] vorbis_parse: check writes to GstOggStream.vorbis_mode_sizes
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-117 Fixes gstreamer#3875
+
+Also perform out-of-bounds check for accesses to op->packet
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8050>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/30fa21ac45ef5dad2fef0d98f0e7130c75f0b628]
+CVE: CVE-2024-47615
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst-plugins-base/ext/ogg/vorbis_parse.c   | 21 +++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/subprojects/gst-plugins-base/ext/ogg/vorbis_parse.c b/subprojects/gst-plugins-base/ext/ogg/vorbis_parse.c
+index 65ef463808e1..757c7cd82b8d 100644
+--- a/ext/ogg/vorbis_parse.c
++++ b/ext/ogg/vorbis_parse.c
+@@ -165,6 +165,10 @@ gst_parse_vorbis_setup_packet (GstOggStream * pad, ogg_packet * op)
+     if (offset == 0) {
+       offset = 8;
+       current_pos -= 1;
++
++      /* have we underrun? */
++      if (current_pos < op->packet)
++        return -1;
+     }
+   }
+ 
+@@ -178,6 +182,10 @@ gst_parse_vorbis_setup_packet (GstOggStream * pad, ogg_packet * op)
+     if (offset == 7)
+       current_pos -= 1;
+ 
++    /* have we underrun? */
++    if (current_pos < op->packet + 5)
++      return -1;
++
+     if (((current_pos[-5] & ~((1 << (offset + 1)) - 1)) != 0)
+         ||
+         current_pos[-4] != 0
+@@ -199,9 +207,18 @@ gst_parse_vorbis_setup_packet (GstOggStream * pad, ogg_packet * op)
+   /* Give ourselves a chance to recover if we went back too far by using
+    * the size check. */
+   for (ii = 0; ii < 2; ii++) {
++
+     if (offset > 4) {
++      /* have we underrun? */
++      if (current_pos < op->packet)
++        return -1;
++
+       size_check = (current_pos[0] >> (offset - 5)) & 0x3F;
+     } else {
++      /* have we underrun? */
++      if (current_pos < op->packet + 1)
++        return -1;
++
+       /* mask part of byte from current_pos */
+       size_check = (current_pos[0] & ((1 << (offset + 1)) - 1));
+       /* shift to appropriate position */
+@@ -233,6 +250,10 @@ gst_parse_vorbis_setup_packet (GstOggStream * pad, ogg_packet * op)
+ 
+   mode_size_ptr = pad->vorbis_mode_sizes;
+ 
++  if (size > G_N_ELEMENTS (pad->vorbis_mode_sizes)) {
++    return -1;
++  }
++
+   for (i = 0; i < size; i++) {
+     offset = (offset + 1) % 8;
+     if (offset == 0)
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47615-2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47615-2.patch
new file mode 100644
index 0000000000..c5f1dfbb80
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47615-2.patch
@@ -0,0 +1,168 @@
+From c94c44ce497d285ebcfe866b9faaae9c66c81132 Mon Sep 17 00:00:00 2001
+From: Mathieu Duponchelle <mathieu@centricular.com>
+Date: Wed, 2 Oct 2024 16:52:51 +0200
+Subject: [PATCH] oggstream: review and fix per-format min_packet_size
+
+This addresses all manually detected invalid reads in setup functions.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8050>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c94c44ce497d285ebcfe866b9faaae9c66c81132]
+CVE: CVE-2024-47615
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst-plugins-base/ext/ogg/gstoggstream.c   | 40 ++++++-------------
+ 1 file changed, 12 insertions(+), 28 deletions(-)
+
+diff --git a/subprojects/gst-plugins-base/ext/ogg/gstoggstream.c b/subprojects/gst-plugins-base/ext/ogg/gstoggstream.c
+index a8883304a5c0..ab6be238dc48 100644
+--- a/ext/ogg/gstoggstream.c
++++ b/ext/ogg/gstoggstream.c
+@@ -665,11 +665,6 @@ setup_vp8_mapper (GstOggStream * pad, ogg_packet * packet)
+ {
+   gint width, height, par_n, par_d, fps_n, fps_d;
+ 
+-  if (packet->bytes < 26) {
+-    GST_DEBUG ("Failed to parse VP8 BOS page");
+-    return FALSE;
+-  }
+-
+   width = GST_READ_UINT16_BE (packet->packet + 8);
+   height = GST_READ_UINT16_BE (packet->packet + 10);
+   par_n = GST_READ_UINT24_BE (packet->packet + 12);
+@@ -1221,11 +1216,6 @@ setup_fishead_mapper (GstOggStream * pad, ogg_packet * packet)
+   gint64 prestime_n, prestime_d;
+   gint64 basetime_n, basetime_d;
+ 
+-  if (packet->bytes < 44) {
+-    GST_DEBUG ("Not enough data for fishead header");
+-    return FALSE;
+-  }
+-
+   data = packet->packet;
+ 
+   data += 8;                    /* header */
+@@ -1256,8 +1246,8 @@ setup_fishead_mapper (GstOggStream * pad, ogg_packet * packet)
+     pad->prestime = -1;
+ 
+   /* Ogg Skeleton 3.3+ streams provide additional information in the header */
+-  if (packet->bytes >= SKELETON_FISHEAD_3_3_MIN_SIZE && pad->skeleton_major == 3
+-      && pad->skeleton_minor > 0) {
++  if (packet->bytes - 44 >= SKELETON_FISHEAD_3_3_MIN_SIZE
++      && pad->skeleton_major == 3 && pad->skeleton_minor > 0) {
+     gint64 firstsampletime_n, firstsampletime_d;
+     gint64 lastsampletime_n, lastsampletime_d;
+     gint64 firstsampletime, lastsampletime;
+@@ -1296,7 +1286,7 @@ setup_fishead_mapper (GstOggStream * pad, ogg_packet * packet)
+ 
+     GST_INFO ("skeleton fishead parsed total: %" GST_TIME_FORMAT,
+         GST_TIME_ARGS (pad->total_time));
+-  } else if (packet->bytes >= SKELETON_FISHEAD_4_0_MIN_SIZE
++  } else if (packet->bytes - 44 >= SKELETON_FISHEAD_4_0_MIN_SIZE
+       && pad->skeleton_major == 4) {
+     guint64 segment_length, content_offset;
+ 
+@@ -1980,9 +1970,6 @@ setup_kate_mapper (GstOggStream * pad, ogg_packet * packet)
+   guint8 *data = packet->packet;
+   const char *category;
+ 
+-  if (packet->bytes < 64)
+-    return FALSE;
+-
+   pad->granulerate_n = GST_READ_UINT32_LE (data + 24);
+   pad->granulerate_d = GST_READ_UINT32_LE (data + 28);
+   pad->granuleshift = GST_READ_UINT8 (data + 15);
+@@ -2111,9 +2098,6 @@ setup_opus_mapper (GstOggStream * pad, ogg_packet * packet)
+ {
+   GstBuffer *buffer;
+ 
+-  if (packet->bytes < 19)
+-    return FALSE;
+-
+   pad->granulerate_n = 48000;
+   pad->granulerate_d = 1;
+   pad->granuleshift = 0;
+@@ -2394,7 +2378,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "\001vorbis", 7, 22,
++    "\001vorbis", 7, 29,
+     "audio/x-vorbis",
+     setup_vorbis_mapper,
+     NULL,
+@@ -2426,7 +2410,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "PCM     ", 8, 0,
++    "PCM     ", 8, 28,
+     "audio/x-raw",
+     setup_pcm_mapper,
+     NULL,
+@@ -2442,7 +2426,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "CMML\0\0\0\0", 8, 0,
++    "CMML\0\0\0\0", 8, 29,
+     "text/x-cmml",
+     setup_cmml_mapper,
+     NULL,
+@@ -2458,7 +2442,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "Annodex", 7, 0,
++    "Annodex", 7, 44,
+     "application/x-annodex",
+     setup_fishead_mapper,
+     NULL,
+@@ -2537,7 +2521,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "CELT    ", 8, 0,
++    "CELT    ", 8, 60,
+     "audio/x-celt",
+     setup_celt_mapper,
+     NULL,
+@@ -2553,7 +2537,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "\200kate\0\0\0", 8, 0,
++    "\200kate\0\0\0", 8, 64,
+     "text/x-kate",
+     setup_kate_mapper,
+     NULL,
+@@ -2585,7 +2569,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "OVP80\1\1", 7, 4,
++    "OVP80\1\1", 7, 26,
+     "video/x-vp8",
+     setup_vp8_mapper,
+     setup_vp8_mapper_from_caps,
+@@ -2601,7 +2585,7 @@ const GstOggMap mappers[] = {
+     update_stats_vp8
+   },
+   {
+-    "OpusHead", 8, 0,
++    "OpusHead", 8, 19,
+     "audio/x-opus",
+     setup_opus_mapper,
+     NULL,
+@@ -2649,7 +2633,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "\001text\0\0\0", 9, 9,
++    "\001text\0\0\0", 9, 25,
+     "application/x-ogm-text",
+     setup_ogmtext_mapper,
+     NULL,
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47835.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47835.patch
new file mode 100644
index 0000000000..e5ee5d9d1d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-47835.patch
@@ -0,0 +1,39 @@
+From 1a5fdba14a1ccfe473bc4429f22ee5bbaee034eb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Wed, 9 Oct 2024 11:23:47 -0400
+Subject: [PATCH] subparse: Check for NULL return of strchr() when parsing LRC
+ subtitles
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-263
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3892
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8051>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1a5fdba14a1ccfe473bc4429f22ee5bbaee034eb]
+CVE: CVE-2024-47835
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-base/gst/subparse/gstsubparse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/subprojects/gst-plugins-base/gst/subparse/gstsubparse.c b/subprojects/gst-plugins-base/gst/subparse/gstsubparse.c
+index 994cf62d1acc..4fe43d91003f 100644
+--- a/gst/subparse/gstsubparse.c
++++ b/gst/subparse/gstsubparse.c
+@@ -1066,6 +1066,11 @@ parse_lrc (ParserState * state, const gchar * line)
+     return NULL;
+ 
+   start = strchr (line, ']');
++  // sscanf() does not check for the trailing ] but only up to the last
++  // placeholder, so there might be no ] at the end.
++  if (!start)
++    return NULL;
++
+   if (start - line == 9)
+     milli = 10;
+   else
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
index 368698b58b..fc9afff628 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
@@ -11,6 +11,15 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://CVE-2024-4453.patch \
+           file://CVE-2024-47538.patch \
+           file://CVE-2024-47541-1.patch \
+           file://CVE-2024-47541-2.patch \
+           file://CVE-2024-47542.patch \
+           file://CVE-2024-47600.patch \
+           file://CVE-2024-47607.patch \
+           file://CVE-2024-47615-1.patch \
+           file://CVE-2024-47615-2.patch \
+           file://CVE-2024-47835.patch \
            "
 SRC_URI[sha256sum] = "fde6696a91875095d82c1012b5777c28ba926047ffce08508e12c1d2c66f0057"
 
-- 
2.43.0



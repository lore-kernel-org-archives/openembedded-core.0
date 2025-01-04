Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC582E7719D
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:16 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.18140.1735998130174985023
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d5O1Nygd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-218c8aca5f1so232130095ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998129; x=1736602929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCzqQRDQ05mDaLgqfXnKjZJT3vDa0kEqN2PeYemVwCo=;
        b=d5O1NygdGAVpK1+ZJ5wXIpaPvdahWOloiAciGeE1Wq31KnjbnS07dHKCL8YTpdh/8R
         tXsjmtZj0b6LCFut8uSNinBvVNEooivBDI3bePX3eaScL3+1Muz5wucqRT4sZKqYva/b
         jzrpPXukxnr2zrOtkR+GlBSmECQLU4ec6DoU/FmQsukxkG+sr/a0tjOUdqiduEcT4+wQ
         V+T/mWWIIqUiTTq0brdC0kbN/ZaWn06vtppUWcejk6h4PptOR7LIwLEIMXgDnegzRew/
         hx1Pg+ybfuIJ8UmbsroloS7YTO6/g3w1+GUlVDJDwCGmWNXqE/MrKEGs8h0qPXPQcxVL
         Um1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998129; x=1736602929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCzqQRDQ05mDaLgqfXnKjZJT3vDa0kEqN2PeYemVwCo=;
        b=M8K99MbYLufmLXwifih4EvsWQCEpSJcC8R7CCuFewwqQ+/XnyxsuAssejsWi2Yh2Sr
         lVrEdgt1pH56XoX0m0FQrsdSY1TwFpiZfLDkcRNiFFtCT5qqaRSLd+dUskwVSTTWU8fm
         HQQi1M6vL6hKpNfc0Vilsuctq0OlQVKcGK5wetX4uFPAdCInEGcyRKW08muG2zmCwzgd
         elbfSB7GcerXQI/EDa27b1T2N+eZ+mmBAOd4YpNygDUcEDN/x1IlHwBC8xzpPM5n7iUK
         ONVhTFVP1fS1y86D5ZobVhC/oSX/s48xbopXj7Nxyh5OfxPIeBl67xS+7q3AOg/Hm0zW
         1Y4g==
X-Gm-Message-State: AOJu0YzC1PkrSqrPSaJdyHlftu0f3hLsB89xwl4VeMHmlAn7+zdfdZIt
	+tZk5eQcfgwEceo+E/PGDocnWCDqQ2KpW8yI17agrd05tbUZb+LPifu9gn2bQJrxrAZ5Mra9FCb
	/
X-Gm-Gg: ASbGncsr2tjXOlQjSDOl/iMuW/TEF3maY2ccTDolG7u6gNUFgnGIQwo7IFQ3vEzhCbl
	E/qZdWOTg/OiOCqHNNWihhN6Xkiky0rCqm2PUmYCO76eEpbsOBiqe8hvfOuazLnPojOnPau+/wL
	5gufGR3nEFasmAMHf1j5amFoiK+lxR6DB9FquK0zbgqqOOqMmU7x7kBLfQTcAfl8+5DQPkThxWg
	YeCXwAv9d7f6+JMnv3dHOqvgwOrBjsLKw3rExM+jr7g5A==
X-Google-Smtp-Source: AGHT+IEDuDPx5E4X+/habxJwwaNvEqKKJAOE4ZcdXE8ufrv4U2LhNLBIGCg7ye7NXIpbI8BnkugnHw==
X-Received: by 2002:a05:6a21:33a4:b0:1d9:c78f:4207 with SMTP id adf61e73a8af0-1e5e046529dmr72896619637.11.1735998129414;
        Sat, 04 Jan 2025 05:42:09 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/25] gstreamer1.0-plugins-base: patch CVE-2024-47541
Date: Sat,  4 Jan 2025 05:41:31 -0800
Message-ID: <c81dae9e755d28eb514bfa32426ef2d8fff78e56.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209376

From: Peter Marko <peter.marko@siemens.com>

Pick commits from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8036

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...for-closing-brace-after-opening-brac.patch | 38 +++++++
 ...se-strstr-on-strings-that-are-potent.patch | 99 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  2 +
 3 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch
new file mode 100644
index 0000000000..a20d2b4cca
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch
@@ -0,0 +1,38 @@
+From 15bb318416e1bf6b6b557006a37d1da86c3a76a8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 21:40:44 +0300
+Subject: [PATCH 1/2] ssaparse: Search for closing brace after opening brace
+
+Otherwise removing anything between the braces leads to out of bound writes if
+there is a closing brace before the first opening brace.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-228
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3870
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8036>
+
+CVE: CVE-2024-47541
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/15bb318416e1bf6b6b557006a37d1da86c3a76a8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/subparse/gstssaparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
+index 42fbb42b99..37b892e928 100644
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
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch
new file mode 100644
index 0000000000..e6674c7bfd
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch
@@ -0,0 +1,99 @@
+From 403b10eba06679319aa2e35d310236234782102f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 18:36:19 +0300
+Subject: [PATCH 2/2] ssaparse: Don't use strstr() on strings that are
+ potentially not NULL-terminated
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8036>
+
+CVE: CVE-2024-47541
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/403b10eba06679319aa2e35d310236234782102f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/subparse/gstssaparse.c | 36 +++++++++++++++++++++++++++++++++++-
+ meson.build                |  1 +
+ 2 files changed, 36 insertions(+), 1 deletion(-)
+
+diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
+index 37b892e928..c162a542f5 100644
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
+diff --git a/meson.build b/meson.build
+index d1033bef4a..65d0944114 100644
+--- a/meson.build
++++ b/meson.build
+@@ -199,6 +199,7 @@ check_functions = [
+   ['HAVE_LRINTF', 'lrintf', '#include<math.h>'],
+   ['HAVE_MMAP', 'mmap', '#include<sys/mman.h>'],
+   ['HAVE_LOG2', 'log2', '#include<math.h>'],
++  ['HAVE_MEMMEM', 'memmem', '#include<string.h>'],
+ ]
+ 
+ libm = cc.find_library('m', required : false)
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 18837e676d..e65de0036d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -14,6 +14,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch \
            file://0006-vorbis_parse-check-writes-to-GstOggStream.vorbis_mod.patch \
            file://0007-oggstream-review-and-fix-per-format-min_packet_size.patch \
+           file://0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch \
+           file://0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.43.0



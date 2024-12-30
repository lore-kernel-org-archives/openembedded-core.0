Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F131E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:28:53 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.66262.1735579726421903574
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=IByZ9c6q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20241230172844e2c8eeb31afb22fc8d-sslkkr@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20241230172844e2c8eeb31afb22fc8d
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:28:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=69iRD/+NOe0D+16aMdczbOAICzQz+zpqSWPDvNeDZIQ=;
 b=IByZ9c6qldI00rlM93/D4PRpNMGJta16ckNaZe44ZFOZrYoSaa5LwWlAVfTzynuz9E5fDN
 1xjgTC5cYaLc+Wdrob6fnpryPeJsy3UXXt+RLBst0Be7A08GLUirixUBH0STIjYRC9ii2oOC
 jL7kVjU/2SBYvsMmfoL3tCnVxGmko0HsOW0fFJLSP3hlSdpU+b+Mv86U962mG+hZxX/8YgNC
 Xyi93u6a9zD16ApFKpf4NMKnzC/wHIo/NgQW08d135uoDbHKfDMG8G9OaP/vmajh/liH3a7Z
 k62uVx+5jLZ54KDMbmr5L4cfGIH32Rcsq7baBORgKMSXKvwdIZ9oXAqA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 07/16] gstreamer1.0-plugins-base: patch CVE-2024-47541
Date: Mon, 30 Dec 2024 18:27:14 +0100
Message-Id: <20241230172723.3644270-7-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209171

From: Peter Marko <peter.marko@siemens.com>

Pick commits from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8036

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...for-closing-brace-after-opening-brac.patch | 38 +++++++
 ...se-strstr-on-strings-that-are-potent.patch | 99 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  2 +
 3 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch
new file mode 100644
index 00000000000..a20d2b4cca5
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
index 00000000000..e6674c7bfd1
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
index 18837e676dd..e65de0036d8 100644
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
2.30.2



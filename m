Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AA6CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 12:07:32 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.21038.1755173251827421957
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 05:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iTmcFmYd;
 spf=pass (domain: mvista.com, ip: 209.85.210.173, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2e614b84so900013b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755173251; x=1755778051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WjA6cyX7xk0Tr3QbbTwVLLRovUlw4AlGLe01A4a8o6c=;
        b=iTmcFmYdZO5A+XVW0BzLN0NOjEfI+IgsY00rGj0567ZbJYsv5gJ2kPBlhRJakVlPid
         A++pYl1kYOcKIgx0h7/fRhuAiQYiVInzB63VeyxuJSRCw4OxtwifQls6s2ogFiKzJoj6
         u3gNZpeC4mHg4/7gkKR2HWYJtA1nLV6Ho3TVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755173251; x=1755778051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjA6cyX7xk0Tr3QbbTwVLLRovUlw4AlGLe01A4a8o6c=;
        b=B4tLVH/eDZXdXMJ5538V9sKUvYRDGFuuaNsjHIdjDsgvvm7lJMQk7MKQ8GZp2qj+3B
         1NnHP2ywELTvAW+/9DZRkJO6eWkscDs9tYrKA1ZN8A+ge797pQZM9l9nlRTdFgrzTREY
         f1g1DBwJc90RMsfEedvRJe/CO9UFKHZpeDRaiOjTJOtHOKQjizk0nx7V19im4DSbrz8A
         Nhy5iESUglbN46fwOzEP0FRvHqgryvODXVfX5Gk/SBuZBOrph5I0SefLw/L+Ot9OtdlH
         TAlRN1CPbSeuL+1L753h/JgFqwle81PyZfJjAmFdmFbEFS2JZXWGImziuuKMvjRIdEXM
         3bYA==
X-Gm-Message-State: AOJu0Yytop7cOzCGzI4YxsPTTGyGYE34IviNrLCZ2/j2RtXJ+NUlMYQb
	be2aE+i+pq1jceZlSK+SdyIvFx6r2WIHCiGon90EhhowRKYBfkLHaDI+fiHn62iIGbi8DlWmXp3
	czzsE
X-Gm-Gg: ASbGncszDdpm5CSaMuoK8zu5Z4tsg/YT6x9PXBGQO2r7bda+bwWyKd/fgGdu2vwBfCK
	HK21sQOwLQ500OaolyHwR/UdT/iXCFAf7xPCa+U0CCAwnelzMcmab9kkvex7sFWzDOOLTQ7bFqW
	F7ivxk0bxwagSqoO6a4kZerYFAgV2ttIjrNZpVuBWefAsKHiLEqlHdzDSAwI6y8E1Wur+CkxsuP
	xllJ/bjQ6Nk4AmRH9kUo8oxD+eWHlfxAuFuw3fNPqWGT5ivOiaB2FZcUEGJzKkURIS4JrLYNFiO
	4vOmXitlvZNrQjEZIkJ6GJW+EnCG5SVaI45fPtDmNK8Q5XC7m9P7Ql0rRxBGsq6YSDo0JQevoCu
	nC2QYGtxbq7JkdndM6NZtQL/ZMX+tkdj4NRh98yCo3/OMZZc=
X-Google-Smtp-Source: AGHT+IGhuJhSqviXA6o6fpRI72m4zuFFRCVaLwddnZNnVQm2IiodOc+6s2uM84vK/5aUBiWWOUzIYA==
X-Received: by 2002:a17:902:cf42:b0:240:49d1:6347 with SMTP id d9443c01a7336-244586a1b0emr38966505ad.35.1755173250769;
        Thu, 14 Aug 2025 05:07:30 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef47f5sm348981145ad.10.2025.08.14.05.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 05:07:30 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] gstreamer1.0-plugins-good: fix CVE-2025-47183 & CVE-2025-47219
Date: Thu, 14 Aug 2025 17:37:09 +0530
Message-ID: <20250814120709.556520-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 12:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221861

* CVE-2025-47183 - Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c4d0f4bbd9a8e97f119a4528b9f4662a6b80922c && https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d76cae74dad89994bfcdad83da6ef1ad69074332
* CVE-2025-47219 - Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b80803943388050cb870c95934fc52feeffb94ac

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../CVE-2025-47183-001.patch                  | 151 ++++++++++++++++++
 .../CVE-2025-47183-002.patch                  |  80 ++++++++++
 .../CVE-2025-47219.patch                      |  40 +++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |   3 +
 4 files changed, 274 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-001.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-002.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47219.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-001.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-001.patch
new file mode 100644
index 0000000000..93c3b36d20
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-001.patch
@@ -0,0 +1,151 @@
+From c4d0f4bbd9a8e97f119a4528b9f4662a6b80922c Mon Sep 17 00:00:00 2001
+From: Jochen Henneberg <jochen@centricular.com>
+Date: Tue, 10 Dec 2024 21:34:48 +0100
+Subject: [PATCH] qtdemux: Use mvhd transform matrix and support for flipping
+
+The mvhd matrix is now combined with the tkhd matrix. The combined
+matrix is then checked if it matches one of the standard values for
+GST_TAG_IMAGE_ORIENTATION.
+This check now includes matrices with flipping.
+
+Fixes #4064
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8127.
+
+CVE: CVE-2025-47183
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c4d0f4bbd9a8e97f119a4528b9f4662a6b80922c]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ gst/isomp4/qtdemux.c | 53 ++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 49 insertions(+), 4 deletions(-)
+
+diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
+index bacf7d5..a5b28f5 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -10555,6 +10555,23 @@ qtdemux_parse_transformation_matrix (GstQTDemux * qtdemux,
+   return TRUE;
+ }
+ 
++static void
++qtdemux_mul_transformation_matrix (GstQTDemux * qtdemux,
++    guint32 * a, guint32 * b, guint32 * c)
++{
++#define QTMUL_MATRIX(_a,_b) (((_a) == 0 || (_b) == 0) ? 0 : \
++      ((_a) == (_b) ? 1 : -1))
++#define QTADD_MATRIX(_a,_b) ((_a) + (_b) > 0 ? (1U << 16) : \
++      ((_a) + (_b) < 0) ? (G_MAXUINT16 << 16) : 0u)
++
++  c[2] = c[5] = c[6] = c[7] = 0;
++  c[0] = QTADD_MATRIX (QTMUL_MATRIX (a[0], b[0]), QTMUL_MATRIX (a[1], b[3]));
++  c[1] = QTADD_MATRIX (QTMUL_MATRIX (a[0], b[1]), QTMUL_MATRIX (a[1], b[4]));
++  c[3] = QTADD_MATRIX (QTMUL_MATRIX (a[3], b[0]), QTMUL_MATRIX (a[4], b[3]));
++  c[4] = QTADD_MATRIX (QTMUL_MATRIX (a[3], b[1]), QTMUL_MATRIX (a[4], b[4]));
++  c[8] = a[8];
++}
++
+ static void
+ qtdemux_inspect_transformation_matrix (GstQTDemux * qtdemux,
+     QtDemuxStream * stream, guint32 * matrix, GstTagList ** taglist)
+@@ -10583,6 +10600,14 @@ qtdemux_inspect_transformation_matrix (GstQTDemux * qtdemux,
+       rotation_tag = "rotate-180";
+     } else if (QTCHECK_MATRIX (matrix, 0, G_MAXUINT16, 1, 0)) {
+       rotation_tag = "rotate-270";
++    } else if (QTCHECK_MATRIX (matrix, G_MAXUINT16, 0, 0, 1)) {
++      rotation_tag = "flip-rotate-0";
++    } else if (QTCHECK_MATRIX (matrix, 0, G_MAXUINT16, 1, 0)) {
++      rotation_tag = "flip-rotate-90";
++    } else if (QTCHECK_MATRIX (matrix, 1, 0, 0, G_MAXUINT16)) {
++      rotation_tag = "flip-rotate-180";
++    } else if (QTCHECK_MATRIX (matrix, 0, 1, 1, 0)) {
++      rotation_tag = "flip-rotate-270";
+     } else {
+       GST_FIXME_OBJECT (qtdemux, "Unhandled transformation matrix values");
+     }
+@@ -10869,7 +10894,7 @@ qtdemux_parse_stereo_svmi_atom (GstQTDemux * qtdemux, QtDemuxStream * stream,
+  * traks that do not decode to something (like strm traks) will not have a pad.
+  */
+ static gboolean
+-qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
++qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak, guint32 * mvhd_matrix)
+ {
+   GstByteReader tkhd;
+   int offset;
+@@ -11041,15 +11066,21 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+ 
+   /* parse rest of tkhd */
+   if (stream->subtype == FOURCC_vide) {
++    guint32 tkhd_matrix[9];
+     guint32 matrix[9];
+ 
+     /* version 1 uses some 64-bit ints */
+     if (!gst_byte_reader_skip (&tkhd, 20 + value_size))
+       goto corrupt_file;
+ 
+-    if (!qtdemux_parse_transformation_matrix (qtdemux, &tkhd, matrix, "tkhd"))
++    if (!qtdemux_parse_transformation_matrix (qtdemux, &tkhd, tkhd_matrix,
++            "tkhd"))
+       goto corrupt_file;
+ 
++    /* calculate the final matrix from the mvhd_matrix and the tkhd matrix */
++    qtdemux_mul_transformation_matrix (qtdemux, mvhd_matrix, tkhd_matrix,
++        matrix);
++
+     if (!gst_byte_reader_get_uint32_be (&tkhd, &w)
+         || !gst_byte_reader_get_uint32_be (&tkhd, &h))
+       goto corrupt_file;
+@@ -13800,11 +13831,14 @@ qtdemux_parse_tree (GstQTDemux * qtdemux)
+   guint64 creation_time;
+   GstDateTime *datetime = NULL;
+   gint version;
++  GstByteReader mvhd_reader;
++  guint32 matrix[9];
+ 
+   /* make sure we have a usable taglist */
+   qtdemux->tag_list = gst_tag_list_make_writable (qtdemux->tag_list);
+ 
+-  mvhd = qtdemux_tree_get_child_by_type (qtdemux->moov_node, FOURCC_mvhd);
++  mvhd = qtdemux_tree_get_child_by_type_full (qtdemux->moov_node,
++      FOURCC_mvhd, &mvhd_reader);
+   if (mvhd == NULL) {
+     GST_LOG_OBJECT (qtdemux, "No mvhd node found, looking for redirects.");
+     return qtdemux_parse_redirects (qtdemux);
+@@ -13815,15 +13849,26 @@ qtdemux_parse_tree (GstQTDemux * qtdemux)
+     creation_time = QT_UINT64 ((guint8 *) mvhd->data + 12);
+     qtdemux->timescale = QT_UINT32 ((guint8 *) mvhd->data + 28);
+     qtdemux->duration = QT_UINT64 ((guint8 *) mvhd->data + 32);
++    if (!gst_byte_reader_skip (&mvhd_reader, 4 + 8 + 8 + 4 + 8))
++      return FALSE;
+   } else if (version == 0) {
+     creation_time = QT_UINT32 ((guint8 *) mvhd->data + 12);
+     qtdemux->timescale = QT_UINT32 ((guint8 *) mvhd->data + 20);
+     qtdemux->duration = QT_UINT32 ((guint8 *) mvhd->data + 24);
++    if (!gst_byte_reader_skip (&mvhd_reader, 4 + 4 + 4 + 4 + 4))
++      return FALSE;
+   } else {
+     GST_WARNING_OBJECT (qtdemux, "Unhandled mvhd version %d", version);
+     return FALSE;
+   }
+ 
++  if (!gst_byte_reader_skip (&mvhd_reader, 4 + 2 + 2 + 2 * 4))
++    return FALSE;
++
++  if (!qtdemux_parse_transformation_matrix (qtdemux, &mvhd_reader, matrix,
++          "mvhd"))
++    return FALSE;
++
+   /* Moving qt creation time (secs since 1904) to unix time */
+   if (creation_time != 0) {
+     /* Try to use epoch first as it should be faster and more commonly found */
+@@ -13892,7 +13937,7 @@ qtdemux_parse_tree (GstQTDemux * qtdemux)
+   /* parse all traks */
+   trak = qtdemux_tree_get_child_by_type (qtdemux->moov_node, FOURCC_trak);
+   while (trak) {
+-    qtdemux_parse_trak (qtdemux, trak);
++    qtdemux_parse_trak (qtdemux, trak, matrix);
+     /* iterate all siblings */
+     trak = qtdemux_tree_get_sibling_by_type (trak, FOURCC_trak);
+   }
+-- 
+2.50.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-002.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-002.patch
new file mode 100644
index 0000000000..a33a3354ee
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-002.patch
@@ -0,0 +1,80 @@
+From d76cae74dad89994bfcdad83da6ef1ad69074332 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 29 Apr 2025 09:43:58 +0300
+Subject: [PATCH] qtdemux: Use byte reader to parse mvhd box
+
+This avoids OOB reads.
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4394
+Fixes CVE-2025-47183
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9133>
+
+CVE: CVE-2025-47183
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d76cae74dad89994bfcdad83da6ef1ad69074332]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ gst/isomp4/qtdemux.c | 36 ++++++++++++++++++++++++++----------
+ 1 file changed, 26 insertions(+), 10 deletions(-)
+
+diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
+index a5b28f5..9844ac2 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -13830,7 +13830,7 @@ qtdemux_parse_tree (GstQTDemux * qtdemux)
+   GNode *pssh;
+   guint64 creation_time;
+   GstDateTime *datetime = NULL;
+-  gint version;
++  guint8 version;
+   GstByteReader mvhd_reader;
+   guint32 matrix[9];
+ 
+@@ -13844,19 +13844,35 @@ qtdemux_parse_tree (GstQTDemux * qtdemux)
+     return qtdemux_parse_redirects (qtdemux);
+   }
+ 
+-  version = QT_UINT8 ((guint8 *) mvhd->data + 8);
++  if (!gst_byte_reader_get_uint8 (&mvhd_reader, &version))
++    return FALSE;
++  /* flags */
++  if (!gst_byte_reader_skip (&mvhd_reader, 3))
++    return FALSE;
+   if (version == 1) {
+-    creation_time = QT_UINT64 ((guint8 *) mvhd->data + 12);
+-    qtdemux->timescale = QT_UINT32 ((guint8 *) mvhd->data + 28);
+-    qtdemux->duration = QT_UINT64 ((guint8 *) mvhd->data + 32);
+-    if (!gst_byte_reader_skip (&mvhd_reader, 4 + 8 + 8 + 4 + 8))
++    if (!gst_byte_reader_get_uint64_be (&mvhd_reader, &creation_time))
++      return FALSE;
++    /* modification time */
++    if (!gst_byte_reader_skip (&mvhd_reader, 8))
++      return FALSE;
++    if (!gst_byte_reader_get_uint32_be (&mvhd_reader, &qtdemux->timescale))
++      return FALSE;
++    if (!gst_byte_reader_get_uint64_be (&mvhd_reader, &qtdemux->duration))
+       return FALSE;
+   } else if (version == 0) {
+-    creation_time = QT_UINT32 ((guint8 *) mvhd->data + 12);
+-    qtdemux->timescale = QT_UINT32 ((guint8 *) mvhd->data + 20);
+-    qtdemux->duration = QT_UINT32 ((guint8 *) mvhd->data + 24);
+-    if (!gst_byte_reader_skip (&mvhd_reader, 4 + 4 + 4 + 4 + 4))
++    guint32 tmp;
++
++    if (!gst_byte_reader_get_uint32_be (&mvhd_reader, &tmp))
++      return FALSE;
++    creation_time = tmp;
++    /* modification time */
++    if (!gst_byte_reader_skip (&mvhd_reader, 4))
++      return FALSE;
++    if (!gst_byte_reader_get_uint32_be (&mvhd_reader, &qtdemux->timescale))
++      return FALSE;
++    if (!gst_byte_reader_get_uint32_be (&mvhd_reader, &tmp))
+       return FALSE;
++    qtdemux->duration = tmp;
+   } else {
+     GST_WARNING_OBJECT (qtdemux, "Unhandled mvhd version %d", version);
+     return FALSE;
+-- 
+2.50.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47219.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47219.patch
new file mode 100644
index 0000000000..7e77a02642
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47219.patch
@@ -0,0 +1,40 @@
+From b80803943388050cb870c95934fc52feeffb94ac Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Sat, 3 May 2025 09:43:32 +0300
+Subject: [PATCH] qtdemux: Check if enough bytes are available for each stsd
+ entry
+
+There must be at least 8 bytes for the length / fourcc of each entry. After
+reading those, the length is already validated against the remaining available
+bytes.
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4407
+Fixes CVE-2025-47219
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9137>
+
+CVE: CVE-2025-47219
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b80803943388050cb870c95934fc52feeffb94ac]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ gst/isomp4/qtdemux.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
+index 9844ac2..0a88fb9 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -11124,6 +11124,10 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak, guint32 * mvhd_matrix)
+     gchar *codec = NULL;
+     QtDemuxStreamStsdEntry *entry = &stream->stsd_entries[stsd_index];
+ 
++    /* needs at least length and fourcc */
++    if (remaining_stsd_len < 8)
++      goto corrupt_file;
++
+     /* and that entry should fit within stsd */
+     len = QT_UINT32 (stsd_entry_data);
+     if (len > remaining_stsd_len)
+-- 
+2.50.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
index e82473086e..197b070893 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -37,6 +37,9 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://CVE-2024-47775_47776_47777_47778-5.patch \
            file://CVE-2024-47775_47776_47777_47778-6.patch \
            file://CVE-2024-47775_47776_47777_47778-7.patch \
+           file://CVE-2025-47183-001.patch \
+           file://CVE-2025-47183-002.patch \
+           file://CVE-2025-47219.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.50.1



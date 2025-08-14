Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8D9CA0ED1
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 05:21:50 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.16173.1755148900431445732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 22:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fwI3fwQs;
 spf=pass (domain: mvista.com, ip: 209.85.215.181, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b47173749dbso294796a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 22:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755148900; x=1755753700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EoM3LBJQTiMWtIGmxWZwJjgMas//3G/99C/ijnffYyY=;
        b=fwI3fwQscYRns8I5ugjnG5y42+gMfbxh2VKlwoxd8bISzAfhdLnU+ewexTzbSgDgnj
         9u424od6edFcju1O25Sy3PLpOBJatzRR3/1/yuQCm51m1/h09lBwe08GmC7NEgtCwt6b
         DzcsLiRLPKJFakGTikBq3dYobTC2rXFDWlOUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755148900; x=1755753700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoM3LBJQTiMWtIGmxWZwJjgMas//3G/99C/ijnffYyY=;
        b=riS/iTEQMqhM2hj2czrETGUmNxXwlQRgLZ/lrSVHVC7obahkKyixaWZtofvoQ/vZnN
         8qDpyB7moPOp08liLR11M3Risjj3NanmT6bllcDTk1OxDk41iSXFf6RXd5Bz1RltWF3q
         gO3GZnJ/C2CANDgboJ5Tq/UYsThFrE1VVo3vbl7Q69B2Lrsp5+j46fUOQV+3wnGd/Dzi
         xNKTXTtm6iED8AdjFNdWRVOW0/PZIXjhFi5PooUWqfzpacmLxa7mjoeLDYLiqWozjdeM
         6arxrlvCp0yJblN6tR3l8V+icbnxifWA0j9fndl1eduZEwCcNBC8aANGN9Y4r0tvvBDe
         udRg==
X-Gm-Message-State: AOJu0YwUbzW9Xw/kiOteliyP9PuhKt0QVUZiPDt+OEE0MhkrWI0RUDNB
	JZ9VrWD4NJ+R77L4ArQxLCNwMbF/nPC/rCt3i7j+fqs3G329T25PxpVOPZjHClq2F7qRdbatD6F
	mLUvZ
X-Gm-Gg: ASbGncvoOzlnipU+K7mvofH8io5rBeNFi4yHASQG8TjSmQtX6pDzzIyTPC6bXW/OlJv
	yMYoZOJ309r9Srj9PVubmFbNV4+ZmX2HKVzfnDaaS6IzXXrzrJfWrON69Xnz3Qi65jP0dD1AoPL
	Zat8W/uUMhht2yut3BKQ2v0/5feIPoGyhUlR/SkJaYV+LGV9bhw4Smpw9TON+020ugW1VJDByhH
	iK4A7rSKXpsyNn/CuHzn4SCAwzJ8mB1zTBu6VTIzshfFne9cbq5/jvMZAilh0r0DQzOUpX/Xt/e
	21WfoB4UjLQtZkgcf2pEYl3PcvI94Bv0xFl5miHVZ0aRvE4ejxVerR9+1I64cMp7MXyZyk335CG
	GHogqaoNE0f3//CwTGqz4TmKb6c0tTvRaHBo=
X-Google-Smtp-Source: AGHT+IENWCRl0Z1ac3vGDJiOEJJhYAycWbLYeD3GdRXxMyJ8XiltFve/3/Y0Tn1xW+1zkPLzMYgjjA==
X-Received: by 2002:a17:902:cf03:b0:242:a3fc:5900 with SMTP id d9443c01a7336-2445849f706mr25732325ad.8.1755148899469;
        Wed, 13 Aug 2025 22:21:39 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8977896sm340439895ad.79.2025.08.13.22.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 22:21:39 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv2] gstreamer1.0-plugins-good: fix multiple CVEs
Date: Thu, 14 Aug 2025 10:51:20 +0530
Message-ID: <20250814052121.204791-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 05:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221852

* CVE-2025-47183 - Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c4d0f4bbd9a8e97f119a4528b9f4662a6b80922c && https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d76cae74dad89994bfcdad83da6ef1ad69074332
* CVE-2025-47219 - Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b80803943388050cb870c95934fc52feeffb94ac

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../CVE-2025-47183-001.patch                  | 151 ++++++++++++++++++
 .../CVE-2025-47183-002.patch                  |  80 ++++++++++
 .../CVE-2025-47219.patch                      |  40 +++++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |   3 +
 4 files changed, 274 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-001.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-002.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47219.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-001.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2025-47183-001.patch
new file mode 100644
index 0000000000..bd25c5f1ed
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
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8127>
+
+CVE: CVE-2025-47183
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c4d0f4bbd9a8e97f119a4528b9f4662a6b80922c]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ gst/isomp4/qtdemux.c | 53 ++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 49 insertions(+), 4 deletions(-)
+
+diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
+index 10b21a6..e708ef4 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -10861,6 +10861,23 @@ qtdemux_parse_transformation_matrix (GstQTDemux * qtdemux,
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
+@@ -10889,6 +10906,14 @@ qtdemux_inspect_transformation_matrix (GstQTDemux * qtdemux,
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
+@@ -11175,7 +11200,7 @@ qtdemux_parse_stereo_svmi_atom (GstQTDemux * qtdemux, QtDemuxStream * stream,
+  * traks that do not decode to something (like strm traks) will not have a pad.
+  */
+ static gboolean
+-qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
++qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak, guint32 * mvhd_matrix)
+ {
+   GstByteReader tkhd;
+   int offset;
+@@ -11347,15 +11372,21 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
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
+@@ -14198,11 +14229,14 @@ qtdemux_parse_tree (GstQTDemux * qtdemux)
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
+@@ -14213,15 +14247,26 @@ qtdemux_parse_tree (GstQTDemux * qtdemux)
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
+@@ -14290,7 +14335,7 @@ qtdemux_parse_tree (GstQTDemux * qtdemux)
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
index 0000000000..77127dd466
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
+index e708ef4..0d29869 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -14228,7 +14228,7 @@ qtdemux_parse_tree (GstQTDemux * qtdemux)
+   GNode *pssh;
+   guint64 creation_time;
+   GstDateTime *datetime = NULL;
+-  gint version;
++  guint8 version;
+   GstByteReader mvhd_reader;
+   guint32 matrix[9];
+ 
+@@ -14242,19 +14242,35 @@ qtdemux_parse_tree (GstQTDemux * qtdemux)
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
index 0000000000..0d7e02ec1e
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
+index 10b21a6..b40aa81 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -11399,6 +11399,10 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
index 608c3030ba..31bc8af015 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
@@ -38,6 +38,9 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0029-wavparse-Check-that-at-least-32-bytes-are-available-.patch \
            file://0030-wavparse-Fix-clipping-of-size-to-the-file-size.patch \
            file://0031-wavparse-Check-size-before-reading-ds64-chunk.patch \
+           file://CVE-2025-47183-001.patch \
+           file://CVE-2025-47183-002.patch \
+           file://CVE-2025-47219.patch \
           "
 
 SRC_URI[sha256sum] = "9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7"
-- 
2.50.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6EBCA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:50:05 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.4492.1755636604507062179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JJI2av7e;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4761f281a7so480481a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755636604; x=1756241404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2M0rqwQuUdEh59guq9rifdOk+E06O6ZtS/yzhUDwiA=;
        b=JJI2av7exswy3Rmz76rdlCt1Hcl405Lf0dniUYnKBO2WpCp2ztCM4n6msyHyvJv/M/
         drCuhRK7U/aCmBvJJCWRX1UA/rHA2nJNf5sQ6FSji8aA72euiNcAfc/iSQ+5bkibcaKj
         S/aUJ7FmHeUQS0A5KLYhE/vcyaaxfHr0ZESs3mzFGX6hEmucu50eKJOCeD/tYTMW0YK7
         pH6Hy++nxHzACe+BEhItBOxiIRrXQ4ezLD2y2JgFFu8mLVTkTfnvyRbR/GqE0x2fe2N8
         6fPw51TxFBl6jwh50pBbXnVsAFhAKzto9Vd0QwhsulKw8miSRybOHoDNIIvp4sAbgNg4
         IMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755636604; x=1756241404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2M0rqwQuUdEh59guq9rifdOk+E06O6ZtS/yzhUDwiA=;
        b=nH2vVOhovspxlqIpLjLDp/HYYEV2dIANtTByZZveCZJc7Q73YraMLiEnEMkrUg1PhT
         J+Lt/2ZKAvXA9BQTniQrkj6C7NzKO4WWMqsQN4Psroi6x4HYxwVzHEM2XNWNVi5RbzdI
         jJuLh5e0FxtiBywguRrXPIvwyixzS5e3T4/q0AMtITyZOxWtZm28dswKptgey4SctHuP
         AVkCVIfI+NE1RIHl/jB4xcAPB4waRIAr57rvY5d/P9IYTFI/z9Wus0q/JqoT/Brjzjlb
         ueS5ou/7SOA2sJ9asCTIYjLo4I7JKcM0wrMlbKkUOIVfL4OicEGLtXvqWQA4CwsOrOV/
         Bh0A==
X-Gm-Message-State: AOJu0Yw5cudBOwNyojLVAHNg/B2t1grj+NghIml9rXTKBJpjmbMVsL/d
	PYRKQ0S3i/hHyecTjfvyenwWyjM5kVZy6fzsl297Su5hYnRGBKpzRlBGcGI2ZOpwHneT+z/RXI9
	jR1ri
X-Gm-Gg: ASbGncux5gOOJYy5f23IByOQwj5W4gBRTW9mm7liSqRVdMIVOQzsfd8Y52AfL9mumKT
	Xne0x2tcrzS3iQFnqPYLgs8XThaULFFwLEZ4xrbdSIzmqESX0rTOqLjvaP4EIL/QiE2XM70BOdV
	sKLm56vjzXPgg9NLExnBkOwLomrr8Bis/b22i7VCac9KrGQvUrUKyDSyQ1ysB4Q0+4ctmR22FlW
	IWQkN2XFaq0kFvPyfnXeSuOEqGgq8afyHxBLATorxd0OoGzFJV2vs58fg+tE/oPk6E14Pe4sVhz
	RQTIXd7QDkAKRZE2jWRfVmIrdQE//hidPegb96JQd2IZniAelhYkBYY0OAkIMT99YlcstyVTZQ6
	fmwMPj+Cpv2F78g==
X-Google-Smtp-Source: AGHT+IEHWVRUXxLsjmpgeie5FU+gyXPTAodwLEoDm6RD0LfMClNX9KDosHZqpDhIMhj+Tav97fhvEA==
X-Received: by 2002:a17:903:3bd0:b0:240:7753:3bec with SMTP id d9443c01a7336-245ef289ab8mr4219525ad.51.1755636603440;
        Tue, 19 Aug 2025 13:50:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33af50sm6179675ad.2.2025.08.19.13.50.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:50:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] gstreamer1.0-plugins-good: fix CVE-2025-47183 & CVE-2025-47219
Date: Tue, 19 Aug 2025 13:49:42 -0700
Message-ID: <0d923b416717d91142cced53961d853007a09daa.1755636489.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755636489.git.steve@sakoman.com>
References: <cover.1755636489.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222142

From: Hitendra Prajapati <hprajapati@mvista.com>

* CVE-2025-47183 - Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c4d0f4bbd9a8e97f119a4528b9f4662a6b80922c && https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d76cae74dad89994bfcdad83da6ef1ad69074332
* CVE-2025-47219 - Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b80803943388050cb870c95934fc52feeffb94ac

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0



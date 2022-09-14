Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F11ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 06:04:21 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.3022.1663135454287556282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 23:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dHr//Lnh;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663135454; x=1694671454;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=88FuXmytRxaQp0FkAvv2BBEBoNV2pGrj13zILDOL8m4=;
  b=dHr//Lnh33vc32zx5VZXADs6dbZCo//bZZlL0ds8sUxxeaRtChpCDpRz
   gDmZ8fxCTdUhkMDUtD3FSltF0wD7HWaFmxBJZ1VSAdTHKCGS/I4Pn7HJo
   t7WHPhNRlZaL86gn6bbyixZ/06N+KyoViN8xBvb4xdbQizGFeopbIrLvM
   5VOMnLcWomkC6ZY4IhTxzN3wLEOfkbSlRNsH+9DQyD/saf9tuTQ5N7u4v
   okP3L5vC+uMBUvBl+j1a/lwqkwGW3s56BFPGpRMnBdMGMOWSq6bgEOAUx
   qBeM3Bz4i8ll8+U0WJdKCrYrBqlgYusSiDmSM0z1X7Cre0JBZtUOvRCPp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="278073657"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200";
   d="scan'208";a="278073657"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 23:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200";
   d="scan'208";a="742442665"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga004.jf.intel.com with ESMTP; 13 Sep 2022 23:04:12 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/2] gst-plugins-good: fix several CVE
Date: Wed, 14 Sep 2022 14:04:10 +0800
Message-Id: <20220914060411.20436-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 06:04:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170634

From: Chee Yang Lee <chee.yang.lee@intel.com>

backport fix for:
CVE-2022-1920
CVE-2022-1921
CVE-2022-1922
CVE-2022-1923
CVE-2022-1924
CVE-2022-1925
CVE-2022-2122

also set ignore at gstreamer1.0_1.16.3.bb

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../CVE-2022-1920.patch                       |  59 +++++
 .../CVE-2022-1921.patch                       |  69 ++++++
 .../CVE-2022-1922-1923-1924-1925.patch        | 214 ++++++++++++++++++
 .../CVE-2022-2122.patch                       |  60 +++++
 .../gstreamer1.0-plugins-good_1.16.3.bb       |   4 +
 .../gstreamer/gstreamer1.0_1.16.3.bb          |   7 +
 6 files changed, 413 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1920.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1921.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1922-1923-1924-1925.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-2122.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1920.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1920.patch
new file mode 100644
index 0000000000..ee33c5564d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1920.patch
@@ -0,0 +1,59 @@
+From cf887f1b8e228bff6e19829e6d03995d70ad739d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Wed, 18 May 2022 10:23:15 +0300
+Subject: [PATCH] matroskademux: Avoid integer-overflow resulting in heap
+ corruption in WavPack header handling code
+
+blocksize + WAVPACK4_HEADER_SIZE might overflow gsize, which then
+results in allocating a very small buffer. Into that buffer blocksize
+data is memcpy'd later which then causes out of bound writes and can
+potentially lead to anything from crashes to remote code execution.
+
+Thanks to Adam Doupe for analyzing and reporting the issue.
+
+CVE: CVE-2022-1920
+
+https://gstreamer.freedesktop.org/security/sa-2022-0004.html
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/1226
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2612>
+
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/0df0dd7fe388174e4835eda4526b47f470a56370
+Upstream-Status: Backport
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ .../gst/matroska/matroska-demux.c     | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/gst/matroska/matroska-demux.c b/gst/matroska/matroska-demux.c
+index 64cc6be60be..01d754c3eb9 100644
+--- a/gst/matroska/matroska-demux.c
++++ b/gst/matroska/matroska-demux.c
+@@ -3933,7 +3933,8 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+   } else {
+     guint8 *outdata = NULL;
+     gsize buf_size, size;
+-    guint32 block_samples, flags, crc, blocksize;
++    guint32 block_samples, flags, crc;
++    gsize blocksize;
+     GstAdapter *adapter;
+ 
+     adapter = gst_adapter_new ();
+@@ -3974,6 +3975,13 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+         return GST_FLOW_ERROR;
+       }
+ 
++      if (blocksize > G_MAXSIZE - WAVPACK4_HEADER_SIZE) {
++        GST_ERROR_OBJECT (element, "Too big wavpack buffer");
++        gst_buffer_unmap (*buf, &map);
++        g_object_unref (adapter);
++        return GST_FLOW_ERROR;
++      }
++
+       g_assert (newbuf == NULL);
+ 
+       newbuf =
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1921.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1921.patch
new file mode 100644
index 0000000000..99dbb2b1b0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1921.patch
@@ -0,0 +1,69 @@
+From f503caad676971933dc0b52c4b313e5ef0d6dbb0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Wed, 18 May 2022 12:00:48 +0300
+Subject: [PATCH] avidemux: Fix integer overflow resulting in heap corruption
+ in DIB buffer inversion code
+
+Check that width*bpp/8 doesn't overflow a guint and also that
+height*stride fits into the provided buffer without overflowing.
+
+Thanks to Adam Doupe for analyzing and reporting the issue.
+
+CVE: CVE-2022-1921
+
+See https://gstreamer.freedesktop.org/security/sa-2022-0001.html
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/1224
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2608>
+
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f503caad676971933dc0b52c4b313e5ef0d6dbb0
+Upstream-Status: Backport
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ .../gst/avi/gstavidemux.c      | 17 ++++++++++++++---
+ 1 file changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/gst/avi/gstavidemux.c b/gst/avi/gstavidemux.c
+index eafe865494c..0d18a6495c7 100644
+--- a/gst/avi/gstavidemux.c
++++ b/gst/avi/gstavidemux.c
+@@ -4973,8 +4973,8 @@ swap_line (guint8 * d1, guint8 * d2, guint8 * tmp, gint bytes)
+ static GstBuffer *
+ gst_avi_demux_invert (GstAviStream * stream, GstBuffer * buf)
+ {
+-  gint y, w, h;
+-  gint bpp, stride;
++  guint y, w, h;
++  guint bpp, stride;
+   guint8 *tmp = NULL;
+   GstMapInfo map;
+   guint32 fourcc;
+@@ -5001,12 +5001,23 @@ gst_avi_demux_invert (GstAviStream * stream, GstBuffer * buf)
+   h = stream->strf.vids->height;
+   w = stream->strf.vids->width;
+   bpp = stream->strf.vids->bit_cnt ? stream->strf.vids->bit_cnt : 8;
++
++  if ((guint64) w * ((guint64) bpp / 8) > G_MAXUINT - 4) {
++    GST_WARNING ("Width x stride overflows");
++    return buf;
++  }
++
++  if (w == 0 || h == 0) {
++    GST_WARNING ("Zero width or height");
++    return buf;
++  }
++
+   stride = GST_ROUND_UP_4 (w * (bpp / 8));
+ 
+   buf = gst_buffer_make_writable (buf);
+ 
+   gst_buffer_map (buf, &map, GST_MAP_READWRITE);
+-  if (map.size < (stride * h)) {
++  if (map.size < ((guint64) stride * (guint64) h)) {
+     GST_WARNING ("Buffer is smaller than reported Width x Height x Depth");
+     gst_buffer_unmap (buf, &map);
+     return buf;
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1922-1923-1924-1925.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1922-1923-1924-1925.patch
new file mode 100644
index 0000000000..ebffbc473d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1922-1923-1924-1925.patch
@@ -0,0 +1,214 @@
+From ad6012159acf18c6b5c0f4edf037e8c9a2dbc966 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Wed, 18 May 2022 11:24:37 +0300
+Subject: [PATCH] matroskademux: Fix integer overflows in zlib/bz2/etc
+ decompression code
+
+Various variables were of smaller types than needed and there were no
+checks for any overflows when doing additions on the sizes. This is all
+checked now.
+
+In addition the size of the decompressed data is limited to 120MB now as
+any larger sizes are likely pathological and we can avoid out of memory
+situations in many cases like this.
+
+Also fix a bug where the available output size on the next iteration in
+the zlib/bz2 decompression code was provided too large and could
+potentially lead to out of bound writes.
+
+Thanks to Adam Doupe for analyzing and reporting the issue.
+
+CVE: CVE-2022-1922, CVE-2022-1923, CVE-2022-1924, CVE-2022-1925
+
+https://gstreamer.freedesktop.org/security/sa-2022-0002.html
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/1225
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2610>
+
+CVE: CVE-2022-1922 CVE-2022-1923 CVE-2022-1924 CVE-2022-1925
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/ad6012159acf18c6b5c0f4edf037e8c9a2dbc966
+Upstream-Status: Backport
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ .../gst/matroska/matroska-read-common.c       | 76 +++++++++++++++----
+ 1 file changed, 61 insertions(+), 15 deletions(-)
+
+diff --git a/gst/matroska/matroska-read-common.c b/gst/matroska/matroska-read-common.c
+index eb317644cc5..6fadbba9567 100644
+--- a/gst/matroska/matroska-read-common.c
++++ b/gst/matroska/matroska-read-common.c
+@@ -70,6 +70,10 @@ typedef struct
+   gboolean audio_only;
+ } TargetTypeContext;
+ 
++/* 120MB as maximum decompressed data size. Anything bigger is likely
++ * pathological, and like this we avoid out of memory situations in many cases
++ */
++#define MAX_DECOMPRESS_SIZE (120 * 1024 * 1024)
+ 
+ static gboolean
+ gst_matroska_decompress_data (GstMatroskaTrackEncoding * enc,
+@@ -77,19 +81,23 @@ gst_matroska_decompress_data (GstMatroskaTrackEncoding * enc,
+     GstMatroskaTrackCompressionAlgorithm algo)
+ {
+   guint8 *new_data = NULL;
+-  guint new_size = 0;
++  gsize new_size = 0;
+   guint8 *data = *data_out;
+-  guint size = *size_out;
++  const gsize size = *size_out;
+   gboolean ret = TRUE;
+ 
++  if (size > G_MAXUINT32) {
++    GST_WARNING ("too large compressed data buffer.");
++    ret = FALSE;
++    goto out;
++  }
++
+   if (algo == GST_MATROSKA_TRACK_COMPRESSION_ALGORITHM_ZLIB) {
+ #ifdef HAVE_ZLIB
+     /* zlib encoded data */
+     z_stream zstream;
+-    guint orig_size;
+     int result;
+ 
+-    orig_size = size;
+     zstream.zalloc = (alloc_func) 0;
+     zstream.zfree = (free_func) 0;
+     zstream.opaque = (voidpf) 0;
+@@ -99,8 +107,8 @@ gst_matroska_decompress_data (GstMatroskaTrackEncoding * enc,
+       goto out;
+     }
+     zstream.next_in = (Bytef *) data;
+-    zstream.avail_in = orig_size;
+-    new_size = orig_size;
++    zstream.avail_in = size;
++    new_size = size;
+     new_data = g_malloc (new_size);
+     zstream.avail_out = new_size;
+     zstream.next_out = (Bytef *) new_data;
+@@ -114,10 +122,18 @@ gst_matroska_decompress_data (GstMatroskaTrackEncoding * enc,
+         break;
+       }
+ 
++      if (new_size > G_MAXSIZE - 4096 || new_size + 4096 > MAX_DECOMPRESS_SIZE) {
++        GST_WARNING ("too big decompressed data");
++        result = Z_MEM_ERROR;
++        break;
++      }
++
+       new_size += 4096;
+       new_data = g_realloc (new_data, new_size);
+       zstream.next_out = (Bytef *) (new_data + zstream.total_out);
+-      zstream.avail_out += 4096;
++      /* avail_out is an unsigned int */
++      g_assert (new_size - zstream.total_out <= G_MAXUINT);
++      zstream.avail_out = new_size - zstream.total_out;
+     } while (zstream.avail_in > 0);
+ 
+     if (result != Z_STREAM_END) {
+@@ -137,13 +153,11 @@ gst_matroska_decompress_data (GstMatroskaTrackEncoding * enc,
+ #ifdef HAVE_BZ2
+     /* bzip2 encoded data */
+     bz_stream bzstream;
+-    guint orig_size;
+     int result;
+ 
+     bzstream.bzalloc = NULL;
+     bzstream.bzfree = NULL;
+     bzstream.opaque = NULL;
+-    orig_size = size;
+ 
+     if (BZ2_bzDecompressInit (&bzstream, 0, 0) != BZ_OK) {
+       GST_WARNING ("bzip2 initialization failed.");
+@@ -152,8 +166,8 @@ gst_matroska_decompress_data (GstMatroskaTrackEncoding * enc,
+     }
+ 
+     bzstream.next_in = (char *) data;
+-    bzstream.avail_in = orig_size;
+-    new_size = orig_size;
++    bzstream.avail_in = size;
++    new_size = size;
+     new_data = g_malloc (new_size);
+     bzstream.avail_out = new_size;
+     bzstream.next_out = (char *) new_data;
+@@ -167,17 +181,31 @@ gst_matroska_decompress_data (GstMatroskaTrackEncoding * enc,
+         break;
+       }
+ 
++      if (new_size > G_MAXSIZE - 4096 || new_size + 4096 > MAX_DECOMPRESS_SIZE) {
++        GST_WARNING ("too big decompressed data");
++        result = BZ_MEM_ERROR;
++        break;
++      }
++
+       new_size += 4096;
+       new_data = g_realloc (new_data, new_size);
+-      bzstream.next_out = (char *) (new_data + bzstream.total_out_lo32);
+-      bzstream.avail_out += 4096;
++      bzstream.next_out =
++          (char *) (new_data + ((guint64) bzstream.total_out_hi32 << 32) +
++          bzstream.total_out_lo32);
++      /* avail_out is an unsigned int */
++      g_assert (new_size - ((guint64) bzstream.total_out_hi32 << 32) +
++          bzstream.total_out_lo32 <= G_MAXUINT);
++      bzstream.avail_out =
++          new_size - ((guint64) bzstream.total_out_hi32 << 32) +
++          bzstream.total_out_lo32;
+     } while (bzstream.avail_in > 0);
+ 
+     if (result != BZ_STREAM_END) {
+       ret = FALSE;
+       g_free (new_data);
+     } else {
+-      new_size = bzstream.total_out_lo32;
++      new_size =
++          ((guint64) bzstream.total_out_hi32 << 32) + bzstream.total_out_lo32;
+     }
+     BZ2_bzDecompressEnd (&bzstream);
+ 
+@@ -189,7 +217,13 @@ gst_matroska_decompress_data (GstMatroskaTrackEncoding * enc,
+   } else if (algo == GST_MATROSKA_TRACK_COMPRESSION_ALGORITHM_LZO1X) {
+     /* lzo encoded data */
+     int result;
+-    int orig_size, out_size;
++    gint orig_size, out_size;
++
++    if (size > G_MAXINT) {
++      GST_WARNING ("too large compressed data buffer.");
++      ret = FALSE;
++      goto out;
++    }
+ 
+     orig_size = size;
+     out_size = size;
+@@ -203,6 +237,11 @@ gst_matroska_decompress_data (GstMatroskaTrackEncoding * enc,
+       result = lzo1x_decode (new_data, &out_size, data, &orig_size);
+ 
+       if (orig_size > 0) {
++        if (new_size > G_MAXINT - 4096 || new_size + 4096 > MAX_DECOMPRESS_SIZE) {
++          GST_WARNING ("too big decompressed data");
++          result = LZO_ERROR;
++          break;
++        }
+         new_size += 4096;
+         new_data = g_realloc (new_data, new_size);
+       }
+@@ -221,6 +260,13 @@ gst_matroska_decompress_data (GstMatroskaTrackEncoding * enc,
+   } else if (algo == GST_MATROSKA_TRACK_COMPRESSION_ALGORITHM_HEADERSTRIP) {
+     /* header stripped encoded data */
+     if (enc->comp_settings_length > 0) {
++      if (size > G_MAXSIZE - enc->comp_settings_length
++          || size + enc->comp_settings_length > MAX_DECOMPRESS_SIZE) {
++        GST_WARNING ("too big decompressed data");
++        ret = FALSE;
++        goto out;
++      }
++
+       new_data = g_malloc (size + enc->comp_settings_length);
+       new_size = size + enc->comp_settings_length;
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-2122.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-2122.patch
new file mode 100644
index 0000000000..f4d38c270e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-2122.patch
@@ -0,0 +1,60 @@
+From 14d306da6da51a762c4dc701d161bb52ab66d774 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 May 2022 10:15:37 +0300
+Subject: [PATCH] qtdemux: Fix integer overflows in zlib decompression code
+
+Various variables were of smaller types than needed and there were no
+checks for any overflows when doing additions on the sizes. This is all
+checked now.
+
+In addition the size of the decompressed data is limited to 200MB now as
+any larger sizes are likely pathological and we can avoid out of memory
+situations in many cases like this.
+
+Also fix a bug where the available output size on the next iteration in
+the zlib decompression code was provided too large and could
+potentially lead to out of bound writes.
+
+Thanks to Adam Doupe for analyzing and reporting the issue.
+
+CVE: tbd
+
+https://gstreamer.freedesktop.org/security/sa-2022-0003.html
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/1225
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2610>
+
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/14d306da6da51a762c4dc701d161bb52ab66d774
+CVE: CVE-2022-2122
+Upstream-Status: Backport
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ gst/isomp4/qtdemux.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
+index 7cc346b1e63..97ba0799a8d 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -7905,10 +7905,16 @@ qtdemux_inflate (void *z_buffer, guint z_length, guint * length)
+       break;
+     }
+ 
++    if (*length > G_MAXUINT - 4096 || *length > QTDEMUX_MAX_SAMPLE_INDEX_SIZE) {
++      GST_WARNING ("too big decompressed data");
++      ret = Z_MEM_ERROR;
++      break;
++    }
++
+     *length += 4096;
+     buffer = (guint8 *) g_realloc (buffer, *length);
+     z.next_out = (Bytef *) (buffer + z.total_out);
+-    z.avail_out += 4096;
++    z.avail_out += *length - z.total_out;
+   } while (z.avail_in > 0);
+ 
+   if (ret != Z_STREAM_END) {
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
index 1038cbf224..831a317a82 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
@@ -10,6 +10,10 @@ SRC_URI = " \
             file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
             file://CVE-2021-3497.patch \
             file://CVE-2021-3498.patch \
+            file://CVE-2022-1920.patch \
+            file://CVE-2022-1921.patch \
+            file://CVE-2022-1922-1923-1924-1925.patch \
+            file://CVE-2022-2122.patch \
             "
 
 SRC_URI[md5sum] = "c79b6c2f8eaadb2bb66615b694db399e"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
index 966a904eef..14793b7fdf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
@@ -83,5 +83,12 @@ CVE_CHECK_WHITELIST += "CVE-2021-3522"
 # so we need to ignore the false hits
 CVE_CHECK_WHITELIST += "CVE-2021-3497"
 CVE_CHECK_WHITELIST += "CVE-2021-3498"
+CVE_CHECK_WHITELIST += "CVE-2022-1920"
+CVE_CHECK_WHITELIST += "CVE-2022-1921"
+CVE_CHECK_WHITELIST += "CVE-2022-1922"
+CVE_CHECK_WHITELIST += "CVE-2022-1923"
+CVE_CHECK_WHITELIST += "CVE-2022-1924"
+CVE_CHECK_WHITELIST += "CVE-2022-1925"
+CVE_CHECK_WHITELIST += "CVE-2022-2122"
 
 require gstreamer1.0-ptest.inc
-- 
2.36.1



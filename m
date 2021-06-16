Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web08.7988.1623852315268474681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 07:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Hlm8ve25;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id c13so2605396oib.13
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 07:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OJUjoGU09MXhD5Ox1kaXvgZf7Cd2XgmWnpnErvFcVI8=;
        b=Hlm8ve253xp4w2dzqsi3WZ0WRqveu2trhSucs6tCY9PHfBTlTOlUnDA9PuVxrFGkf4
         9G/TsCHMAO96c8ftiOE8wrElCkkua5mAuLyfx7sb3Q7gCgDKZVh9GJx/qzL47O4LssAb
         BbwTP4EId8vHXiWTCmDAy8NgP4mV/0TV+WQubS2XDQfbwonJXxad7pdGFKBvEfWGEKwd
         jMp6jXD+Pq2UjsZICeA6vKvt+0Wpg1EXT0KxgLBTT2jg7/00ZJ8RpfBrWSB8JEPk27Ev
         Y/EcoCh3f4ukV0HcMDdz66Ec4Ux3HYCPeFizCDpttl682ZN9H0/Hh5jk6BKJDjebQDfN
         MoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJUjoGU09MXhD5Ox1kaXvgZf7Cd2XgmWnpnErvFcVI8=;
        b=t2DYFmvMHxX0UwcwPzRNxGMt2ZS7cF93L/RzYkdrxkrwSi7kUBGGapDIj1BFBRFla/
         baWRtbFzs2DQTqg7FhyEUF6spFKPKYlohZfxtaebdFLvQiwN6lTIRjInyEveu1AKMVBp
         MUpTdyeL9On1CMBPoPK2e7AnWFaA0XxXpDlBFEkvE1XW0s9dZOavFltEL/yZHsxW4cFf
         pgYsPvDnSGeY+dZNdit1/iuSYQtO7x/8qm+Qkma1WSwoaMJiL6HyDrJ8AWQeXPeBZvvM
         e901bCRYaGmVCCQqG9dHPKk25Y0gxNQ7xN01myKyiV4Rdkn9S/cR7bIFYn6YE4aRlqLc
         jLOg==
X-Gm-Message-State: AOAM531+IXi4kU/K3+g0e7BiEaNcRdncKCD/Wk+3LNfN+WL7EUGI0IEv
	DwYCiNB7G46W539i7wyHukoNkJpylPLrOTvsJNM=
X-Google-Smtp-Source: ABdhPJx+sVhwxnoRnCuwLBnReEdM6pib3wTQBr1dwdN+vKQgbIbuumvyTTPMGBWOMBd5u4vNDvWdqg==
X-Received: by 2002:a54:4398:: with SMTP id u24mr3293918oiv.81.1623852313844;
        Wed, 16 Jun 2021 07:05:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id w17sm434637oif.44.2021.06.16.07.05.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:05:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/6] gstreamer-plugins-good: fix CVE-2021-3497 CVE-2021-3498
Date: Wed, 16 Jun 2021 04:04:24 -1000
Message-Id: <865ef7d3cdc6645720762153d87771c6c4da31cf.1623852080.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623852080.git.steve@sakoman.com>
References: <cover.1623852080.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2021-3497.patch                       | 207 ++++++++++++++++++
 .../CVE-2021-3498.patch                       |  44 ++++
 .../gstreamer1.0-plugins-good_1.16.3.bb       |   2 +
 3 files changed, 253 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2021-3497.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2021-3498.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2021-3497.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2021-3497.patch
new file mode 100644
index 0000000000..81f7c59a7b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2021-3497.patch
@@ -0,0 +1,207 @@
+From 9181191511f9c0be6a89c98b311f49d66bd46dc3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 4 Mar 2021 13:05:19 +0200
+Subject: [PATCH] matroskademux: Fix extraction of multichannel WavPack
+
+The old code had a couple of issues that all lead to potential memory
+safety bugs.
+
+  - Use a constant for the Wavpack4Header size instead of using sizeof.
+    It's written out into the data and not from the struct and who knows
+    what special alignment/padding requirements some C compilers have.
+  - gst_buffer_set_size() does not realloc the buffer when setting a
+    bigger size than allocated, it only allows growing up to the maximum
+    allocated size. Instead use a GstAdapter to collect all the blocks
+    and take out everything at once in the end.
+  - Check that enough data is actually available in the input and
+    otherwise handle it an error in all cases instead of silently
+    ignoring it.
+
+Among other things this fixes out of bounds writes because the code
+assumed gst_buffer_set_size() can grow the buffer and simply wrote after
+the end of the buffer.
+
+Thanks to Natalie Silvanovich for reporting.
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues/859
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/903>
+
+Upstream-Status: Backport
+https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/commit/9181191511f9c0be6a89c98b311f49d66bd46dc3?merge_request_iid=903
+CVE: CVE-2021-3497
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ gst/matroska/matroska-demux.c | 99 +++++++++++++++++++----------------
+ gst/matroska/matroska-ids.h   |  2 +
+ 2 files changed, 55 insertions(+), 46 deletions(-)
+
+diff --git a/gst/matroska/matroska-demux.c b/gst/matroska/matroska-demux.c
+index 467815986..0e47ee7b5 100644
+--- a/gst/matroska/matroska-demux.c
++++ b/gst/matroska/matroska-demux.c
+@@ -3851,6 +3851,12 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+     guint32 block_samples, tmp;
+     gsize size = gst_buffer_get_size (*buf);
+ 
++    if (size < 4) {
++      GST_ERROR_OBJECT (element, "Too small wavpack buffer");
++      gst_buffer_unmap (*buf, &map);
++      return GST_FLOW_ERROR;
++    }
++
+     gst_buffer_extract (*buf, 0, &tmp, sizeof (guint32));
+     block_samples = GUINT32_FROM_LE (tmp);
+     /* we need to reconstruct the header of the wavpack block */
+@@ -3858,10 +3864,10 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+     /* -20 because ck_size is the size of the wavpack block -8
+      * and lace_size is the size of the wavpack block + 12
+      * (the three guint32 of the header that already are in the buffer) */
+-    wvh.ck_size = size + sizeof (Wavpack4Header) - 20;
++    wvh.ck_size = size + WAVPACK4_HEADER_SIZE - 20;
+ 
+     /* block_samples, flags and crc are already in the buffer */
+-    newbuf = gst_buffer_new_allocate (NULL, sizeof (Wavpack4Header) - 12, NULL);
++    newbuf = gst_buffer_new_allocate (NULL, WAVPACK4_HEADER_SIZE - 12, NULL);
+ 
+     gst_buffer_map (newbuf, &outmap, GST_MAP_WRITE);
+     data = outmap.data;
+@@ -3886,9 +3892,11 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+     audiocontext->wvpk_block_index += block_samples;
+   } else {
+     guint8 *outdata = NULL;
+-    guint outpos = 0;
+-    gsize buf_size, size, out_size = 0;
++    gsize buf_size, size;
+     guint32 block_samples, flags, crc, blocksize;
++    GstAdapter *adapter;
++
++    adapter = gst_adapter_new ();
+ 
+     gst_buffer_map (*buf, &map, GST_MAP_READ);
+     buf_data = map.data;
+@@ -3897,6 +3905,7 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+     if (buf_size < 4) {
+       GST_ERROR_OBJECT (element, "Too small wavpack buffer");
+       gst_buffer_unmap (*buf, &map);
++      g_object_unref (adapter);
+       return GST_FLOW_ERROR;
+     }
+ 
+@@ -3918,59 +3927,57 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+       data += 4;
+       size -= 4;
+ 
+-      if (blocksize == 0 || size < blocksize)
+-        break;
+-
+-      g_assert ((newbuf == NULL) == (outdata == NULL));
++      if (blocksize == 0 || size < blocksize) {
++        GST_ERROR_OBJECT (element, "Too small wavpack buffer");
++        gst_buffer_unmap (*buf, &map);
++        g_object_unref (adapter);
++        return GST_FLOW_ERROR;
++      }
+ 
+-      if (newbuf == NULL) {
+-        out_size = sizeof (Wavpack4Header) + blocksize;
+-        newbuf = gst_buffer_new_allocate (NULL, out_size, NULL);
++      g_assert (newbuf == NULL);
+ 
+-        gst_buffer_copy_into (newbuf, *buf,
+-            GST_BUFFER_COPY_TIMESTAMPS | GST_BUFFER_COPY_FLAGS, 0, -1);
++      newbuf =
++          gst_buffer_new_allocate (NULL, WAVPACK4_HEADER_SIZE + blocksize,
++          NULL);
++      gst_buffer_map (newbuf, &outmap, GST_MAP_WRITE);
++      outdata = outmap.data;
++
++      outdata[0] = 'w';
++      outdata[1] = 'v';
++      outdata[2] = 'p';
++      outdata[3] = 'k';
++      outdata += 4;
++
++      GST_WRITE_UINT32_LE (outdata, blocksize + WAVPACK4_HEADER_SIZE - 8);
++      GST_WRITE_UINT16_LE (outdata + 4, wvh.version);
++      GST_WRITE_UINT8 (outdata + 6, wvh.track_no);
++      GST_WRITE_UINT8 (outdata + 7, wvh.index_no);
++      GST_WRITE_UINT32_LE (outdata + 8, wvh.total_samples);
++      GST_WRITE_UINT32_LE (outdata + 12, wvh.block_index);
++      GST_WRITE_UINT32_LE (outdata + 16, block_samples);
++      GST_WRITE_UINT32_LE (outdata + 20, flags);
++      GST_WRITE_UINT32_LE (outdata + 24, crc);
++      outdata += 28;
++
++      memcpy (outdata, data, blocksize);
+ 
+-        outpos = 0;
+-        gst_buffer_map (newbuf, &outmap, GST_MAP_WRITE);
+-        outdata = outmap.data;
+-      } else {
+-        gst_buffer_unmap (newbuf, &outmap);
+-        out_size += sizeof (Wavpack4Header) + blocksize;
+-        gst_buffer_set_size (newbuf, out_size);
+-        gst_buffer_map (newbuf, &outmap, GST_MAP_WRITE);
+-        outdata = outmap.data;
+-      }
++      gst_buffer_unmap (newbuf, &outmap);
++      gst_adapter_push (adapter, newbuf);
++      newbuf = NULL;
+ 
+-      outdata[outpos] = 'w';
+-      outdata[outpos + 1] = 'v';
+-      outdata[outpos + 2] = 'p';
+-      outdata[outpos + 3] = 'k';
+-      outpos += 4;
+-
+-      GST_WRITE_UINT32_LE (outdata + outpos,
+-          blocksize + sizeof (Wavpack4Header) - 8);
+-      GST_WRITE_UINT16_LE (outdata + outpos + 4, wvh.version);
+-      GST_WRITE_UINT8 (outdata + outpos + 6, wvh.track_no);
+-      GST_WRITE_UINT8 (outdata + outpos + 7, wvh.index_no);
+-      GST_WRITE_UINT32_LE (outdata + outpos + 8, wvh.total_samples);
+-      GST_WRITE_UINT32_LE (outdata + outpos + 12, wvh.block_index);
+-      GST_WRITE_UINT32_LE (outdata + outpos + 16, block_samples);
+-      GST_WRITE_UINT32_LE (outdata + outpos + 20, flags);
+-      GST_WRITE_UINT32_LE (outdata + outpos + 24, crc);
+-      outpos += 28;
+-
+-      memmove (outdata + outpos, data, blocksize);
+-      outpos += blocksize;
+       data += blocksize;
+       size -= blocksize;
+     }
+     gst_buffer_unmap (*buf, &map);
+-    gst_buffer_unref (*buf);
+ 
+-    if (newbuf)
+-      gst_buffer_unmap (newbuf, &outmap);
++    newbuf = gst_adapter_take_buffer (adapter, gst_adapter_available (adapter));
++    g_object_unref (adapter);
+ 
++    gst_buffer_copy_into (newbuf, *buf,
++        GST_BUFFER_COPY_TIMESTAMPS | GST_BUFFER_COPY_FLAGS, 0, -1);
++    gst_buffer_unref (*buf);
+     *buf = newbuf;
++
+     audiocontext->wvpk_block_index += block_samples;
+   }
+ 
+diff --git a/gst/matroska/matroska-ids.h b/gst/matroska/matroska-ids.h
+index 429213f77..8d4a685a9 100644
+--- a/gst/matroska/matroska-ids.h
++++ b/gst/matroska/matroska-ids.h
+@@ -688,6 +688,8 @@ typedef struct _Wavpack4Header {
+   guint32 crc;           /* crc for actual decoded data                    */
+ } Wavpack4Header;
+ 
++#define WAVPACK4_HEADER_SIZE (32)
++
+ typedef enum {
+   GST_MATROSKA_TRACK_ENCODING_SCOPE_FRAME = (1<<0),
+   GST_MATROSKA_TRACK_ENCODING_SCOPE_CODEC_DATA = (1<<1),
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2021-3498.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2021-3498.patch
new file mode 100644
index 0000000000..d3de2d5014
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2021-3498.patch
@@ -0,0 +1,44 @@
+From 02174790726dd20a5c73ce2002189bf240ad4fe0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Wed, 3 Mar 2021 11:31:52 +0200
+Subject: [PATCH] matroskademux: Initialize track context out parameter to NULL
+ before parsing
+
+Various error return paths don't set it to NULL and callers are only
+checking if the pointer is NULL. As it's allocated on the stack this
+usually contains random stack memory, and more often than not the memory
+of a previously parsed track.
+
+This then causes all kinds of memory corruptions further down the line.
+
+Thanks to Natalie Silvanovich for reporting.
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues/858
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/903>
+
+Upstream-Status: Backport [
+https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/commit/02174790726dd20a5c73ce2002189bf240ad4fe0?merge_request_iid=903 ]
+CVE: CVE-2021-3498
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ gst/matroska/matroska-demux.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gst/matroska/matroska-demux.c b/gst/matroska/matroska-demux.c
+index 4d0234743..467815986 100644
+--- a/gst/matroska/matroska-demux.c
++++ b/gst/matroska/matroska-demux.c
+@@ -692,6 +692,8 @@ gst_matroska_demux_parse_stream (GstMatroskaDemux * demux, GstEbmlRead * ebml,
+ 
+   DEBUG_ELEMENT_START (demux, ebml, "TrackEntry");
+ 
++  *dest_context = NULL;
++
+   /* start with the master */
+   if ((ret = gst_ebml_read_master (ebml, &id)) != GST_FLOW_OK) {
+     DEBUG_ELEMENT_STOP (demux, ebml, "TrackEntry", ret);
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
index b3f17d4a4a..1038cbf224 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
@@ -8,6 +8,8 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
             file://0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch \
             file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
+            file://CVE-2021-3497.patch \
+            file://CVE-2021-3498.patch \
             "
 
 SRC_URI[md5sum] = "c79b6c2f8eaadb2bb66615b694db399e"
-- 
2.25.1


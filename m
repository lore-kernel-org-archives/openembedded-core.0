Return-Path: <wouter@wouterlucas.com>
Received: from h0stless.netw0rk.nl (h0stless.netw0rk.nl [149.210.182.68])
	by mail.openembedded.org (Postfix) with ESMTP id D16987016E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 03:31:10 +0000 (UTC)
Received: from c-73-162-69-48.hsd1.ca.comcast.net ([73.162.69.48]
	helo=localhost.localdomain)
	by h0stless.netw0rk.nl with esmtpa (Exim 4.91)
	(envelope-from <wouter@wouterlucas.com>)
	id 1fDM0U-0006j3-SP; Tue, 01 May 2018 05:31:11 +0200
From: wouterlucas <wouter@wouterlucas.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2018 20:30:55 -0700
Message-Id: <20180501033057.20291-2-wouter@wouterlucas.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180501033057.20291-1-wouter@wouterlucas.com>
References: <20180501033057.20291-1-wouter@wouterlucas.com>
X-Authenticated-Id: wl@wouterlucas.com
Subject: [pyro][PATCH 2/4] gstreamer1.0-plugins-bad: Readd and manage GstAdaptiveDemux for MSS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2018 03:31:11 -0000

Signed-off-by: wouterlucas <wouter@wouterlucas.com>
---
 ...the-adapter-in-the-subclass-after-bu.patch | 133 ++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.10.4.bb        |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch
new file mode 100644
index 0000000000..3648800867
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch
@@ -0,0 +1,133 @@
+From 8878df617892b7e19a9de7ee28c5a405238556be Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Enrique=20Oca=C3=B1a=20Gonz=C3=A1lez?= <eocanha@igalia.com>
+Date: Tue, 17 Jan 2017 16:43:53 +0000
+Subject: [PATCH] mssdemux: Handle the adapter in the subclass after bug
+ 764684
+
+The adapter on GstAdaptiveDemux was removed on
+https://bugzilla.gnome.org/show_bug.cgi?id=764684
+"adaptivedemux: Get rid of internal stream adapter and let subclasses handle this directly"
+commit ca9f62e1d062ac1e87f13c9ddddab9164a3cb892
+
+This commit readds and manages the adapter in gstmssdemux.
+---
+Upstream-Status: Backport
+Signed-off-by: wouterlucas <wouter@wouterlucas.com>
+
+ ext/smoothstreaming/gstmssdemux.c | 33 ++++++++++++++++++++++++++-------
+ ext/smoothstreaming/gstmssdemux.h |  1 +
+ 2 files changed, 27 insertions(+), 7 deletions(-)
+
+diff --git a/ext/smoothstreaming/gstmssdemux.c b/ext/smoothstreaming/gstmssdemux.c
+index 70b541e..1a122d4 100644
+--- a/ext/smoothstreaming/gstmssdemux.c
++++ b/ext/smoothstreaming/gstmssdemux.c
+@@ -121,6 +121,7 @@ static gboolean gst_mss_demux_process_manifest (GstAdaptiveDemux * demux,
+     GstBuffer * buffer);
+ static GstClockTime gst_mss_demux_get_duration (GstAdaptiveDemux * demux);
+ static void gst_mss_demux_reset (GstAdaptiveDemux * demux);
++static void gst_mss_demux_stream_free (GstAdaptiveDemuxStream * stream);
+ static GstFlowReturn gst_mss_demux_stream_seek (GstAdaptiveDemuxStream * stream,
+     gboolean forward, GstSeekFlags flags, GstClockTime ts,
+     GstClockTime * final_ts);
+@@ -142,7 +143,7 @@ static GstFlowReturn
+ gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
+     GstBuffer * buffer);
+ static GstFlowReturn gst_mss_demux_data_received (GstAdaptiveDemux * demux,
+-    GstAdaptiveDemuxStream * stream);
++    GstAdaptiveDemuxStream * stream, GstBuffer * buffer);
+ static gboolean
+ gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * demux);
+ 
+@@ -188,6 +189,7 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
+       gst_mss_demux_get_manifest_update_interval;
+   gstadaptivedemux_class->reset = gst_mss_demux_reset;
+   gstadaptivedemux_class->seek = gst_mss_demux_seek;
++  gstadaptivedemux_class->stream_free = gst_mss_demux_stream_free;
+   gstadaptivedemux_class->stream_seek = gst_mss_demux_stream_seek;
+   gstadaptivedemux_class->stream_advance_fragment =
+       gst_mss_demux_stream_advance_fragment;
+@@ -316,6 +318,14 @@ gst_mss_demux_stream_update_fragment_info (GstAdaptiveDemuxStream * stream)
+   return ret;
+ }
+ 
++static void
++gst_mss_demux_stream_free (GstAdaptiveDemuxStream * stream)
++{
++  GstMssDemuxStream *mssstream = (GstMssDemuxStream *) stream;
++
++  g_object_unref (mssstream->adapter);
++}
++
+ static GstFlowReturn
+ gst_mss_demux_stream_seek (GstAdaptiveDemuxStream * stream, gboolean forward,
+     GstSeekFlags flags, GstClockTime ts, GstClockTime * final_ts)
+@@ -451,6 +461,7 @@ gst_mss_demux_setup_streams (GstAdaptiveDemux * demux)
+         gst_adaptive_demux_stream_new (GST_ADAPTIVE_DEMUX_CAST (mssdemux),
+         srcpad);
+     stream->manifest_stream = manifeststream;
++    stream->adapter = gst_adapter_new();
+     gst_mss_stream_set_active (manifeststream, TRUE);
+     active_streams = g_slist_prepend (active_streams, stream);
+   }
+@@ -686,7 +697,7 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
+ 
+ static GstFlowReturn
+ gst_mss_demux_data_received (GstAdaptiveDemux * demux,
+-    GstAdaptiveDemuxStream * stream)
++    GstAdaptiveDemuxStream * stream, GstBuffer *buffer)
+ {
+   GstMssDemux *mssdemux = GST_MSS_DEMUX_CAST (demux);
+   GstMssDemuxStream *mssstream = (GstMssDemuxStream *) stream;
+@@ -694,23 +705,31 @@ gst_mss_demux_data_received (GstAdaptiveDemux * demux,
+ 
+   if (!gst_mss_manifest_is_live (mssdemux->manifest)) {
+     return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux,
+-        stream);
++        stream, buffer);
+   }
+ 
+   if (gst_mss_stream_fragment_parsing_needed (mssstream->manifest_stream)) {
+-    available = gst_adapter_available (stream->adapter);
++    gst_adapter_push (mssstream->adapter, buffer);
++
++    GST_DEBUG_OBJECT (stream->pad, "Received buffer of size %" G_GSIZE_FORMAT
++        ". Now %" G_GSIZE_FORMAT " on adapter", gst_buffer_get_size (buffer),
++        gst_adapter_available (mssstream->adapter));
++
++    available = gst_adapter_available (mssstream->adapter);
+     // FIXME: try to reduce this minimal size.
+     if (available < 4096) {
+       return GST_FLOW_OK;
+     } else {
+-      GstBuffer *buffer = gst_adapter_get_buffer (stream->adapter, available);
++      // We use here the accumulated buffer from the adapter instead o the
++      // original one.
++      buffer = gst_adapter_get_buffer (mssstream->adapter, available);
++      gst_adapter_clear (mssstream->adapter);
+       GST_LOG_OBJECT (stream->pad, "enough data, parsing fragment.");
+       gst_mss_stream_fragment_parse (mssstream->manifest_stream, buffer);
+-      gst_buffer_unref (buffer);
+     }
+   }
+ 
+-  return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux, stream);
++  return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux, stream, buffer);
+ }
+ 
+ static gboolean
+diff --git a/ext/smoothstreaming/gstmssdemux.h b/ext/smoothstreaming/gstmssdemux.h
+index f3ea6cf..3fcf55f 100644
+--- a/ext/smoothstreaming/gstmssdemux.h
++++ b/ext/smoothstreaming/gstmssdemux.h
+@@ -56,6 +56,7 @@ struct _GstMssDemuxStream {
+   GstAdaptiveDemuxStream parent;
+ 
+   GstMssStream *manifest_stream;
++  GstAdapter *adapter;
+ };
+ 
+ struct _GstMssDemux {
+-- 
+1.8.3.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 88289fb7d8..d209bcf8ab 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
+    file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch \
     file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
     file://0009-glimagesink-Downrank-to-marginal.patch \
 "
-- 
2.17.0



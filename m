Return-Path: <wouter@wouterlucas.com>
Received: from h0stless.netw0rk.nl (h0stless.netw0rk.nl [149.210.182.68])
	by mail.openembedded.org (Postfix) with ESMTP id BCD1D65D48
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 03:31:09 +0000 (UTC)
Received: from c-73-162-69-48.hsd1.ca.comcast.net ([73.162.69.48]
	helo=localhost.localdomain)
	by h0stless.netw0rk.nl with esmtpa (Exim 4.91)
	(envelope-from <wouter@wouterlucas.com>)
	id 1fDM0T-0006j3-IF; Tue, 01 May 2018 05:31:09 +0200
From: wouterlucas <wouter@wouterlucas.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2018 20:30:54 -0700
Message-Id: <20180501033057.20291-1-wouter@wouterlucas.com>
X-Mailer: git-send-email 2.17.0
X-Authenticated-Id: wl@wouterlucas.com
Subject: [pyro][PATCH 1/4] gstreamer1.0-plugins-bad: refresh live streaming patches, apply them in correct order
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
X-List-Received-Date: Tue, 01 May 2018 03:31:10 -0000

Signed-off-by: wouterlucas <wouter@wouterlucas.com>
---
 ...demux-improved-live-playback-support.patch | 355 ++++++++----------
 ...implement-adaptivedemux-s-get_live_s.patch |  60 +--
 .../gstreamer1.0-plugins-bad_1.10.4.bb        |   6 +-
 3 files changed, 198 insertions(+), 223 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
index 4832c18e78..a2b0052fe4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
@@ -1,6 +1,6 @@
-From 73721ad4e9e2d32e1c8b6a3b4aaa98401530e58a Mon Sep 17 00:00:00 2001
+From 12b9645c4c5b94ff4fd5062bdb02b63db7648db9 Mon Sep 17 00:00:00 2001
 From: Philippe Normand <philn@igalia.com>
-Date: Tue, 29 Nov 2016 14:43:41 +0100
+Date: Thu, 10 Sep 2015 16:13:30 +0200
 Subject: [PATCH] mssdemux: improved live playback support
 
 When a MSS server hosts a live stream the fragments listed in the
@@ -13,22 +13,22 @@ be incrementally built by parsing the first/current fragment.
 https://bugzilla.gnome.org/show_bug.cgi?id=755036
 ---
 Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: wouterlucas <wouter@wouterlucas.com>
 
  ext/smoothstreaming/Makefile.am               |   2 +
- ext/smoothstreaming/gstmssdemux.c             |  60 ++++++
- ext/smoothstreaming/gstmssfragmentparser.c    | 266 ++++++++++++++++++++++++++
- ext/smoothstreaming/gstmssfragmentparser.h    |  84 ++++++++
- ext/smoothstreaming/gstmssmanifest.c          | 158 ++++++++++++++-
- ext/smoothstreaming/gstmssmanifest.h          |   7 +
- gst-libs/gst/adaptivedemux/gstadaptivedemux.c |  27 ++-
+ ext/smoothstreaming/gstmssdemux.c             |  61 ++++++
+ ext/smoothstreaming/gstmssfragmentparser.c    | 255 ++++++++++++++++++++++++++
+ ext/smoothstreaming/gstmssfragmentparser.h    |  84 +++++++++
+ ext/smoothstreaming/gstmssmanifest.c          | 155 ++++++++++++++--
+ ext/smoothstreaming/gstmssmanifest.h          |   3 +
+ gst-libs/gst/adaptivedemux/gstadaptivedemux.c |  28 ++-
  gst-libs/gst/adaptivedemux/gstadaptivedemux.h |  14 ++
- 8 files changed, 606 insertions(+), 12 deletions(-)
+ 8 files changed, 586 insertions(+), 16 deletions(-)
  create mode 100644 ext/smoothstreaming/gstmssfragmentparser.c
  create mode 100644 ext/smoothstreaming/gstmssfragmentparser.h
 
 diff --git a/ext/smoothstreaming/Makefile.am b/ext/smoothstreaming/Makefile.am
-index 4faf9df9f..a5e1ad6ae 100644
+index 4faf9df..a5e1ad6 100644
 --- a/ext/smoothstreaming/Makefile.am
 +++ b/ext/smoothstreaming/Makefile.am
 @@ -13,8 +13,10 @@ libgstsmoothstreaming_la_LIBADD = \
@@ -43,10 +43,10 @@ index 4faf9df9f..a5e1ad6ae 100644
 +	gstmssfragmentparser.h \
  	gstmssmanifest.h
 diff --git a/ext/smoothstreaming/gstmssdemux.c b/ext/smoothstreaming/gstmssdemux.c
-index 12fb40497..120d9c22b 100644
+index 9d0aece..70b541e 100644
 --- a/ext/smoothstreaming/gstmssdemux.c
 +++ b/ext/smoothstreaming/gstmssdemux.c
-@@ -135,11 +135,18 @@ gst_mss_demux_stream_update_fragment_info (GstAdaptiveDemuxStream * stream);
+@@ -135,9 +135,16 @@ gst_mss_demux_stream_update_fragment_info (GstAdaptiveDemuxStream * stream);
  static gboolean gst_mss_demux_seek (GstAdaptiveDemux * demux, GstEvent * seek);
  static gint64
  gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux);
@@ -56,16 +56,14 @@ index 12fb40497..120d9c22b 100644
  static GstFlowReturn
  gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
      GstBuffer * buffer);
- static gboolean gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux,
-     gint64 * start, gint64 * stop);
 +static GstFlowReturn gst_mss_demux_data_received (GstAdaptiveDemux * demux,
-+    GstAdaptiveDemuxStream * stream, GstBuffer * buffer);
++    GstAdaptiveDemuxStream * stream);
 +static gboolean
 +gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * demux);
  
  static void
  gst_mss_demux_class_init (GstMssDemuxClass * klass)
-@@ -192,10 +199,15 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
+@@ -190,8 +197,13 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
        gst_mss_demux_stream_select_bitrate;
    gstadaptivedemux_class->stream_update_fragment_info =
        gst_mss_demux_stream_update_fragment_info;
@@ -73,36 +71,39 @@ index 12fb40497..120d9c22b 100644
 +      gst_mss_demux_stream_get_fragment_waiting_time;
    gstadaptivedemux_class->update_manifest_data =
        gst_mss_demux_update_manifest_data;
-   gstadaptivedemux_class->get_live_seek_range =
-       gst_mss_demux_get_live_seek_range;
 +  gstadaptivedemux_class->data_received = gst_mss_demux_data_received;
 +  gstadaptivedemux_class->requires_periodical_playlist_update =
 +      gst_mss_demux_requires_periodical_playlist_update;
  
    GST_DEBUG_CATEGORY_INIT (mssdemux_debug, "mssdemux", 0, "mssdemux plugin");
  }
-@@ -650,6 +662,13 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux)
+@@ -648,6 +660,17 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux)
    return interval;
  }
  
 +static gint64
 +gst_mss_demux_stream_get_fragment_waiting_time (GstAdaptiveDemuxStream * stream)
 +{
-+  /* Wait a second for live streams so we don't try premature fragments downloading */
-+  return GST_SECOND;
++  GstMssDemuxStream *mssstream = (GstMssDemuxStream *) stream;
++  GstMssStreamType streamtype =
++      gst_mss_stream_get_type (mssstream->manifest_stream);
++
++  /* Wait a second for live audio streams so we don't try premature fragments downloading */
++  return streamtype == MSS_STREAM_TYPE_AUDIO ? GST_SECOND : 0;
 +}
 +
  static GstFlowReturn
  gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
      GstBuffer * buffer)
-@@ -670,3 +689,44 @@ gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux, gint64 * start,
- 
-   return gst_mss_manifest_get_live_seek_range (mssdemux->manifest, start, stop);
+@@ -659,3 +682,41 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
+   gst_mss_manifest_reload_fragments (mssdemux->manifest, buffer);
+   return GST_FLOW_OK;
  }
 +
++
 +static GstFlowReturn
 +gst_mss_demux_data_received (GstAdaptiveDemux * demux,
-+    GstAdaptiveDemuxStream * stream, GstBuffer * buffer)
++    GstAdaptiveDemuxStream * stream)
 +{
 +  GstMssDemux *mssdemux = GST_MSS_DEMUX_CAST (demux);
 +  GstMssDemuxStream *mssstream = (GstMssDemuxStream *) stream;
@@ -110,27 +111,23 @@ index 12fb40497..120d9c22b 100644
 +
 +  if (!gst_mss_manifest_is_live (mssdemux->manifest)) {
 +    return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux,
-+        stream, buffer);
++        stream);
 +  }
 +
 +  if (gst_mss_stream_fragment_parsing_needed (mssstream->manifest_stream)) {
-+    gst_mss_manifest_live_adapter_push (mssstream->manifest_stream, buffer);
-+    available =
-+        gst_mss_manifest_live_adapter_available (mssstream->manifest_stream);
++    available = gst_adapter_available (stream->adapter);
 +    // FIXME: try to reduce this minimal size.
 +    if (available < 4096) {
 +      return GST_FLOW_OK;
 +    } else {
++      GstBuffer *buffer = gst_adapter_get_buffer (stream->adapter, available);
 +      GST_LOG_OBJECT (stream->pad, "enough data, parsing fragment.");
-+      buffer =
-+          gst_mss_manifest_live_adapter_take_buffer (mssstream->manifest_stream,
-+          available);
-+      gst_mss_stream_parse_fragment (mssstream->manifest_stream, buffer);
++      gst_mss_stream_fragment_parse (mssstream->manifest_stream, buffer);
++      gst_buffer_unref (buffer);
 +    }
 +  }
 +
-+  return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux, stream,
-+      buffer);
++  return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux, stream);
 +}
 +
 +static gboolean
@@ -142,17 +139,17 @@ index 12fb40497..120d9c22b 100644
 +}
 diff --git a/ext/smoothstreaming/gstmssfragmentparser.c b/ext/smoothstreaming/gstmssfragmentparser.c
 new file mode 100644
-index 000000000..b554d4f31
+index 0000000..01c3b15
 --- /dev/null
 +++ b/ext/smoothstreaming/gstmssfragmentparser.c
-@@ -0,0 +1,266 @@
+@@ -0,0 +1,255 @@
 +/*
 + * Microsoft Smooth-Streaming fragment parsing library
 + *
 + * gstmssfragmentparser.h
 + *
-+ * Copyright (C) 2016 Igalia S.L
-+ * Copyright (C) 2016 Metrological
++ * Copyright (C) 2015 Igalia S.L
++ * Copyright (C) 2015 Metrological
 + *   Author: Philippe Normand <philn@igalia.com>
 + *
 + * This library is free software; you can redistribute it and/or
@@ -333,12 +330,8 @@ index 000000000..b554d4f31
 +          size = gst_byte_reader_get_uint32_be_unchecked (&reader);
 +          fourcc = gst_byte_reader_get_uint32_le_unchecked (&reader);
 +          if (fourcc == GST_MSS_FRAGMENT_FOURCC_TRUN) {
-+            GST_TRACE ("trun box found, size: %" G_GUINT32_FORMAT, size);
-+            if (!gst_byte_reader_skip (&reader, size - 8)) {
-+              GST_WARNING ("Failed to skip trun box, enough data?");
-+              error = TRUE;
-+              goto beach;
-+            }
++            gst_byte_reader_skip_unchecked (&reader, size - 8);
++            GST_TRACE ("trun box found, size: %u", size);
 +          }
 +        }
 +      }
@@ -354,11 +347,7 @@ index 000000000..b554d4f31
 +    }
 +
 +    GST_TRACE ("box size: %" G_GUINT32_FORMAT, size);
-+    if (!gst_byte_reader_get_uint32_le (&reader, &fourcc)) {
-+      GST_WARNING ("Failed to get fourcc, enough data?");
-+      error = TRUE;
-+      break;
-+    }
++    fourcc = gst_byte_reader_get_uint32_le_unchecked (&reader);
 +
 +    if (fourcc == GST_MSS_FRAGMENT_FOURCC_MDAT) {
 +      GST_LOG ("mdat box found");
@@ -367,8 +356,7 @@ index 000000000..b554d4f31
 +    }
 +
 +    if (fourcc != GST_MSS_FRAGMENT_FOURCC_UUID) {
-+      GST_ERROR ("invalid UUID fourcc: %" GST_FOURCC_FORMAT,
-+          GST_FOURCC_ARGS (fourcc));
++      GST_ERROR ("invalid UUID fourcc");
 +      error = TRUE;
 +      break;
 +    }
@@ -403,8 +391,6 @@ index 000000000..b554d4f31
 +    }
 +  }
 +
-+beach:
-+
 +  if (!error)
 +    parser->status = GST_MSS_FRAGMENT_HEADER_PARSER_FINISHED;
 +
@@ -414,7 +400,7 @@ index 000000000..b554d4f31
 +}
 diff --git a/ext/smoothstreaming/gstmssfragmentparser.h b/ext/smoothstreaming/gstmssfragmentparser.h
 new file mode 100644
-index 000000000..cf4711865
+index 0000000..6626358
 --- /dev/null
 +++ b/ext/smoothstreaming/gstmssfragmentparser.h
 @@ -0,0 +1,84 @@
@@ -423,8 +409,8 @@ index 000000000..cf4711865
 + *
 + * gstmssfragmentparser.h
 + *
-+ * Copyright (C) 2016 Igalia S.L
-+ * Copyright (C) 2016 Metrological
++ * Copyright (C) 2015 Igalia S.L
++ * Copyright (C) 2015 Metrological
 + *   Author: Philippe Normand <philn@igalia.com>
 + *
 + * This library is free software; you can redistribute it and/or
@@ -503,14 +489,14 @@ index 000000000..cf4711865
 +
 +#endif /* __GST_MSS_FRAGMENT_PARSER_H__ */
 diff --git a/ext/smoothstreaming/gstmssmanifest.c b/ext/smoothstreaming/gstmssmanifest.c
-index 144bbb42d..e1031ba55 100644
+index 1b72e8d..d50a51a 100644
 --- a/ext/smoothstreaming/gstmssmanifest.c
 +++ b/ext/smoothstreaming/gstmssmanifest.c
 @@ -1,5 +1,7 @@
  /* GStreamer
   * Copyright (C) 2012 Smart TV Alliance
-+ * Copyright (C) 2016 Igalia S.L
-+ * Copyright (C) 2016 Metrological
++ * Copyright (C) 2015 Igalia S.L
++ * Copyright (C) 2015 Metrological
   *  Author: Thiago Sousa Santos <thiago.sousa.santos@collabora.com>, Collabora Ltd.
   *
   * gstmssmanifest.c:
@@ -522,12 +508,12 @@ index 144bbb42d..e1031ba55 100644
  
  GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
  #define GST_CAT_DEFAULT mssdemux_debug
-@@ -74,12 +77,17 @@ struct _GstMssStream
+@@ -73,12 +76,17 @@ struct _GstMssStream
    gboolean active;              /* if the stream is currently being used */
    gint selectedQualityIndex;
  
 +  gboolean has_live_fragments;
-+  GstAdapter *live_adapter;
++  GQueue live_fragments;
 +
    GList *fragments;
    GList *qualities;
@@ -540,15 +526,15 @@ index 144bbb42d..e1031ba55 100644
    guint fragment_repetition_index;
    GList *current_fragment;
    GList *current_quality;
-@@ -96,6 +104,7 @@ struct _GstMssManifest
+@@ -94,6 +102,7 @@ struct _GstMssManifest
+   xmlNodePtr xmlrootnode;
  
    gboolean is_live;
-   gint64 dvr_window;
 +  guint64 look_ahead_fragment_count;
  
    GString *protection_system_id;
    gchar *protection_data;
-@@ -235,7 +244,8 @@ compare_bitrate (GstMssStreamQuality * a, GstMssStreamQuality * b)
+@@ -233,7 +242,8 @@ compare_bitrate (GstMssStreamQuality * a, GstMssStreamQuality * b)
  }
  
  static void
@@ -558,7 +544,7 @@ index 144bbb42d..e1031ba55 100644
  {
    xmlNodePtr iter;
    GstMssFragmentListBuilder builder;
-@@ -248,9 +258,21 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
+@@ -246,9 +256,18 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
    stream->url = (gchar *) xmlGetProp (node, (xmlChar *) MSS_PROP_URL);
    stream->lang = (gchar *) xmlGetProp (node, (xmlChar *) MSS_PROP_LANGUAGE);
  
@@ -567,9 +553,6 @@ index 144bbb42d..e1031ba55 100644
 +   * playlist can be built incrementally from the first fragment
 +   * of the manifest.
 +   */
-+
-+  GST_DEBUG ("Live stream: %s, look-ahead fragments: %" G_GUINT64_FORMAT,
-+      manifest->is_live ? "yes" : "no", manifest->look_ahead_fragment_count);
 +  stream->has_live_fragments = manifest->is_live
 +      && manifest->look_ahead_fragment_count;
 +
@@ -581,13 +564,15 @@ index 144bbb42d..e1031ba55 100644
      } else if (node_has_type (iter, MSS_NODE_STREAM_QUALITY)) {
        GstMssStreamQuality *quality = gst_mss_stream_quality_new (iter);
        stream->qualities = g_list_prepend (stream->qualities, quality);
-@@ -259,17 +281,24 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
+@@ -257,17 +276,26 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
      }
    }
  
 -  stream->fragments = g_list_reverse (builder.fragments);
 +  if (stream->has_live_fragments) {
-+    stream->live_adapter = gst_adapter_new ();
++    g_queue_init (&stream->live_fragments);
++    g_queue_push_tail (&stream->live_fragments, builder.fragments->data);
++    stream->current_fragment = g_queue_peek_head_link (&stream->live_fragments);
 +  }
 +
 +  if (builder.fragments) {
@@ -609,7 +594,7 @@ index 144bbb42d..e1031ba55 100644
  }
  
  
-@@ -315,6 +344,7 @@ gst_mss_manifest_new (GstBuffer * data)
+@@ -313,6 +341,7 @@ gst_mss_manifest_new (GstBuffer * data)
    xmlNodePtr nodeiter;
    gchar *live_str;
    GstMapInfo mapinfo;
@@ -617,33 +602,21 @@ index 144bbb42d..e1031ba55 100644
  
    if (!gst_buffer_map (data, &mapinfo, GST_MAP_READ)) {
      return NULL;
-@@ -335,6 +365,7 @@ gst_mss_manifest_new (GstBuffer * data)
-   /* the entire file is always available for non-live streams */
-   if (!manifest->is_live) {
-     manifest->dvr_window = 0;
-+    manifest->look_ahead_fragment_count = 0;
-   } else {
-     /* if 0, or non-existent, the length is infinite */
-     gchar *dvr_window_str = (gchar *) xmlGetProp (root,
-@@ -346,6 +377,17 @@ gst_mss_manifest_new (GstBuffer * data)
-         manifest->dvr_window = 0;
-       }
-     }
-+
-+    look_ahead_fragment_count_str =
-+        (gchar *) xmlGetProp (root, (xmlChar *) "LookAheadFragmentCount");
-+    if (look_ahead_fragment_count_str) {
-+      manifest->look_ahead_fragment_count =
-+          g_ascii_strtoull (look_ahead_fragment_count_str, NULL, 10);
-+      xmlFree (look_ahead_fragment_count_str);
-+      if (manifest->look_ahead_fragment_count <= 0) {
-+        manifest->look_ahead_fragment_count = 0;
-+      }
-+    }
+@@ -330,13 +359,21 @@ gst_mss_manifest_new (GstBuffer * data)
+     xmlFree (live_str);
    }
  
++  look_ahead_fragment_count_str =
++      (gchar *) xmlGetProp (root, (xmlChar *) "LookAheadFragmentCount");
++  if (look_ahead_fragment_count_str) {
++    manifest->look_ahead_fragment_count =
++        g_ascii_strtoull (look_ahead_fragment_count_str, NULL, 10);
++    xmlFree (look_ahead_fragment_count_str);
++  }
++
    for (nodeiter = root->children; nodeiter; nodeiter = nodeiter->next) {
-@@ -354,7 +396,7 @@ gst_mss_manifest_new (GstBuffer * data)
+     if (nodeiter->type == XML_ELEMENT_NODE
+         && (strcmp ((const char *) nodeiter->name, "StreamIndex") == 0)) {
        GstMssStream *stream = g_new0 (GstMssStream, 1);
  
        manifest->streams = g_slist_append (manifest->streams, stream);
@@ -652,39 +625,56 @@ index 144bbb42d..e1031ba55 100644
      }
  
      if (nodeiter->type == XML_ELEMENT_NODE
-@@ -371,6 +413,11 @@ gst_mss_manifest_new (GstBuffer * data)
+@@ -353,13 +390,19 @@ gst_mss_manifest_new (GstBuffer * data)
  static void
  gst_mss_stream_free (GstMssStream * stream)
  {
-+  if (stream->live_adapter) {
-+    gst_adapter_clear (stream->live_adapter);
-+    g_object_unref (stream->live_adapter);
+-  g_list_free_full (stream->fragments, g_free);
++  if (stream->has_live_fragments) {
++    g_queue_foreach (&stream->live_fragments, (GFunc) g_free, NULL);
++    g_queue_clear (&stream->live_fragments);
++  } else {
++    g_list_free_full (stream->fragments, g_free);
 +  }
-+
-   g_list_free_full (stream->fragments, g_free);
    g_list_free_full (stream->qualities,
        (GDestroyNotify) gst_mss_stream_quality_free);
-@@ -379,6 +426,7 @@ gst_mss_stream_free (GstMssStream * stream)
+   xmlFree (stream->url);
+   xmlFree (stream->lang);
    g_regex_unref (stream->regex_position);
    g_regex_unref (stream->regex_bitrate);
-   g_free (stream);
 +  gst_mss_fragment_parser_clear (&stream->fragment_parser);
+   g_free (stream);
  }
  
- void
-@@ -1079,6 +1127,9 @@ GstFlowReturn
+@@ -984,7 +1027,12 @@ gst_mss_stream_get_fragment_gst_timestamp (GstMssStream * stream)
+   g_return_val_if_fail (stream->active, GST_CLOCK_TIME_NONE);
+ 
+   if (!stream->current_fragment) {
+-    GList *last = g_list_last (stream->fragments);
++    GList *last;
++
++    if (stream->has_live_fragments)
++      last = g_queue_peek_tail_link (&stream->live_fragments);
++    else
++      last = g_list_last (stream->fragments);
+     if (last == NULL)
+       return GST_CLOCK_TIME_NONE;
+ 
+@@ -1037,21 +1085,54 @@ GstFlowReturn
  gst_mss_stream_advance_fragment (GstMssStream * stream)
  {
    GstMssStreamFragment *fragment;
++  GstMssStreamFragment *prev_fragment;
 +  const gchar *stream_type_name =
 +      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
 +
    g_return_val_if_fail (stream->active, GST_FLOW_ERROR);
  
    if (stream->current_fragment == NULL)
-@@ -1086,14 +1137,20 @@ gst_mss_stream_advance_fragment (GstMssStream * stream)
+     return GST_FLOW_EOS;
  
-   fragment = stream->current_fragment->data;
+-  fragment = stream->current_fragment->data;
++  prev_fragment = fragment = stream->current_fragment->data;
    stream->fragment_repetition_index++;
 -  if (stream->fragment_repetition_index < fragment->repetitions) {
 -    return GST_FLOW_OK;
@@ -693,10 +683,34 @@ index 144bbb42d..e1031ba55 100644
 +    goto beach;
  
    stream->fragment_repetition_index = 0;
-   stream->current_fragment = g_list_next (stream->current_fragment);
+-  stream->current_fragment = g_list_next (stream->current_fragment);
++
++  if (stream->has_live_fragments)
++    stream->current_fragment = g_queue_pop_head_link (&stream->live_fragments);
++  else
++    stream->current_fragment = g_list_next (stream->current_fragment);
++
++  if (stream->current_fragment != NULL) {
++    fragment = stream->current_fragment->data;
++    if (fragment->time <= prev_fragment->time) {
++      while (fragment->time <= prev_fragment->time) {
++        if (stream->has_live_fragments)
++          stream->current_fragment =
++              g_queue_pop_head_link (&stream->live_fragments);
++        else
++          stream->current_fragment = g_list_next (stream->current_fragment);
++        if (stream->current_fragment == NULL)
++          break;
++        fragment = stream->current_fragment->data;
++      }
++    }
++  }
 +
 +  GST_DEBUG ("Advanced to fragment #%d on %s stream", fragment->number,
 +      stream_type_name);
++  if (stream->has_live_fragments)
++    GST_LOG ("%u fragments left in the %s stream queue",
++        g_queue_get_length (&stream->live_fragments), stream_type_name);
    if (stream->current_fragment == NULL)
      return GST_FLOW_EOS;
 +
@@ -706,57 +720,22 @@ index 144bbb42d..e1031ba55 100644
    return GST_FLOW_OK;
  }
  
-@@ -1173,6 +1230,11 @@ gst_mss_stream_seek (GstMssStream * stream, gboolean forward,
-   GST_DEBUG ("Stream %s seeking to %" G_GUINT64_FORMAT, stream->url, time);
-   for (iter = stream->fragments; iter; iter = g_list_next (iter)) {
-     fragment = iter->data;
-+    if (stream->has_live_fragments) {
-+      if (fragment->time + fragment->repetitions * fragment->duration > time)
-+        stream->current_fragment = iter;
-+      break;
-+    }
-     if (fragment->time + fragment->repetitions * fragment->duration > time) {
-       stream->current_fragment = iter;
-       stream->fragment_repetition_index =
-@@ -1256,9 +1318,14 @@ static void
- gst_mss_stream_reload_fragments (GstMssStream * stream, xmlNodePtr streamIndex)
- {
-   xmlNodePtr iter;
--  guint64 current_gst_time = gst_mss_stream_get_fragment_gst_timestamp (stream);
-+  guint64 current_gst_time;
-   GstMssFragmentListBuilder builder;
+@@ -1125,6 +1206,10 @@ gst_mss_stream_seek (GstMssStream * stream, gboolean forward,
+   guint64 timescale;
+   GstMssStreamFragment *fragment = NULL;
  
++  // FIXME: Seek support for live scenario using DVR window.
 +  if (stream->has_live_fragments)
 +    return;
 +
-+  current_gst_time = gst_mss_stream_get_fragment_gst_timestamp (stream);
-+
-   gst_mss_fragment_list_builder_init (&builder);
- 
-   GST_DEBUG ("Current position: %" GST_TIME_FORMAT,
-@@ -1514,3 +1581,74 @@ gst_mss_manifest_get_live_seek_range (GstMssManifest * manifest, gint64 * start,
+   timescale = gst_mss_stream_get_timescale (stream);
+   time = gst_util_uint64_scale_round (time, timescale, GST_SECOND);
  
-   return ret;
+@@ -1406,3 +1491,47 @@ gst_mss_stream_get_lang (GstMssStream * stream)
+ {
+   return stream->lang;
  }
 +
-+void
-+gst_mss_manifest_live_adapter_push (GstMssStream * stream, GstBuffer * buffer)
-+{
-+  gst_adapter_push (stream->live_adapter, buffer);
-+}
-+
-+gsize
-+gst_mss_manifest_live_adapter_available (GstMssStream * stream)
-+{
-+  return gst_adapter_available (stream->live_adapter);
-+}
-+
-+GstBuffer *
-+gst_mss_manifest_live_adapter_take_buffer (GstMssStream * stream, gsize nbytes)
-+{
-+  return gst_adapter_take_buffer (stream->live_adapter, nbytes);
-+}
-+
 +gboolean
 +gst_mss_stream_fragment_parsing_needed (GstMssStream * stream)
 +{
@@ -764,11 +743,11 @@ index 144bbb42d..e1031ba55 100644
 +}
 +
 +void
-+gst_mss_stream_parse_fragment (GstMssStream * stream, GstBuffer * buffer)
++gst_mss_stream_fragment_parse (GstMssStream * stream, GstBuffer * buffer)
 +{
 +  GstMssStreamFragment *current_fragment = NULL;
-+  const gchar *stream_type_name;
-+  guint8 index;
++  const gchar *stream_type_name =
++      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
 +
 +  if (!stream->has_live_fragments)
 +    return;
@@ -780,29 +759,20 @@ index 144bbb42d..e1031ba55 100644
 +  current_fragment->time = stream->fragment_parser.tfxd.time;
 +  current_fragment->duration = stream->fragment_parser.tfxd.duration;
 +
-+  stream_type_name =
-+      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
-+
-+  for (index = 0; index < stream->fragment_parser.tfrf.entries_count; index++) {
-+    GList *l = g_list_last (stream->fragments);
-+    GstMssStreamFragment *last;
++  for (guint8 index = 0; index < stream->fragment_parser.tfrf.entries_count;
++      index++) {
++    GstMssStreamFragment *last = g_queue_peek_tail (&stream->live_fragments);
 +    GstMssStreamFragment *fragment;
 +
-+    if (l == NULL)
-+      break;
-+
-+    last = (GstMssStreamFragment *) l->data;
-+
-+    if (last->time == stream->fragment_parser.tfrf.entries[index].time)
-+      continue;
-+
++    if (last == NULL)
++        break;
 +    fragment = g_new (GstMssStreamFragment, 1);
 +    fragment->number = last->number + 1;
 +    fragment->repetitions = 1;
 +    fragment->time = stream->fragment_parser.tfrf.entries[index].time;
 +    fragment->duration = stream->fragment_parser.tfrf.entries[index].duration;
 +
-+    stream->fragments = g_list_append (stream->fragments, fragment);
++    g_queue_push_tail (&stream->live_fragments, fragment);
 +    GST_LOG ("Adding fragment number: %u to %s stream, time: %" G_GUINT64_FORMAT
 +        ", duration: %" G_GUINT64_FORMAT ", repetitions: %u",
 +        fragment->number, stream_type_name,
@@ -810,31 +780,20 @@ index 144bbb42d..e1031ba55 100644
 +  }
 +}
 diff --git a/ext/smoothstreaming/gstmssmanifest.h b/ext/smoothstreaming/gstmssmanifest.h
-index 6b7b1f971..03b066ae5 100644
+index af7419c..039877f 100644
 --- a/ext/smoothstreaming/gstmssmanifest.h
 +++ b/ext/smoothstreaming/gstmssmanifest.h
-@@ -26,6 +26,7 @@
- #include <glib.h>
- #include <gio/gio.h>
- #include <gst/gst.h>
-+#include <gst/base/gstadapter.h>
- 
- G_BEGIN_DECLS
- 
-@@ -73,5 +74,11 @@ const gchar * gst_mss_stream_get_lang (GstMssStream * stream);
+@@ -72,5 +72,8 @@ const gchar * gst_mss_stream_get_lang (GstMssStream * stream);
  
  const gchar * gst_mss_stream_type_name (GstMssStreamType streamtype);
  
-+void gst_mss_manifest_live_adapter_push(GstMssStream * stream, GstBuffer * buffer);
-+gsize gst_mss_manifest_live_adapter_available(GstMssStream * stream);
-+GstBuffer * gst_mss_manifest_live_adapter_take_buffer(GstMssStream * stream, gsize nbytes);
 +gboolean gst_mss_stream_fragment_parsing_needed(GstMssStream * stream);
-+void gst_mss_stream_parse_fragment(GstMssStream * stream, GstBuffer * buffer);
++void gst_mss_stream_fragment_parse(GstMssStream * stream, GstBuffer * buffer);
 +
  G_END_DECLS
  #endif /* __GST_MSS_MANIFEST_H__ */
 diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
-index 634e4f388..ddca726b6 100644
+index bf311d3..20bd839 100644
 --- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
 +++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
 @@ -291,6 +291,9 @@ gst_adaptive_demux_wait_until (GstClock * clock, GCond * cond, GMutex * mutex,
@@ -868,7 +827,7 @@ index 634e4f388..ddca726b6 100644
            }
          } else {
            /* no streams */
-@@ -2125,6 +2133,13 @@ gst_adaptive_demux_stream_data_received_default (GstAdaptiveDemux * demux,
+@@ -2113,6 +2121,13 @@ gst_adaptive_demux_stream_data_received_default (GstAdaptiveDemux * demux,
    return gst_adaptive_demux_stream_push_buffer (stream, buffer);
  }
  
@@ -882,25 +841,33 @@ index 634e4f388..ddca726b6 100644
  static GstFlowReturn
  _src_chain (GstPad * pad, GstObject * parent, GstBuffer * buffer)
  {
-@@ -3338,7 +3353,15 @@ gst_adaptive_demux_stream_download_loop (GstAdaptiveDemuxStream * stream)
+@@ -2209,7 +2224,7 @@ _src_chain (GstPad * pad, GstObject * parent, GstBuffer * buffer)
+       stream->download_chunk_start_time;
+   stream->download_total_bytes += gst_buffer_get_size (buffer);
+ 
+-  GST_DEBUG_OBJECT (stream->pad, "Received buffer of size %" G_GSIZE_FORMAT,
++  GST_LOG_OBJECT (stream->pad, "Received buffer of size %" G_GSIZE_FORMAT,
+       gst_buffer_get_size (buffer));
+ 
+   ret = klass->data_received (demux, stream, buffer);
+@@ -3326,7 +3341,14 @@ gst_adaptive_demux_stream_download_loop (GstAdaptiveDemuxStream * stream)
        GST_DEBUG_OBJECT (stream->pad, "EOS, checking to stop download loop");
        /* we push the EOS after releasing the object lock */
        if (gst_adaptive_demux_is_live (demux)) {
 -        if (gst_adaptive_demux_stream_wait_manifest_update (demux, stream)) {
 +        GstAdaptiveDemuxClass *demux_class =
-+            GST_ADAPTIVE_DEMUX_GET_CLASS (demux);
++          GST_ADAPTIVE_DEMUX_GET_CLASS (demux);
 +
 +        /* this might be a fragment download error, refresh the manifest, just in case */
 +        if (!demux_class->requires_periodical_playlist_update (demux)) {
 +          ret = gst_adaptive_demux_update_manifest (demux);
 +          break;
-+        } else if (gst_adaptive_demux_stream_wait_manifest_update (demux,
-+                stream)) {
++        } else if (gst_adaptive_demux_stream_wait_manifest_update (demux, stream)) {
            goto end;
          }
          gst_task_stop (stream->download_task);
 diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.h b/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
-index 780f4d93f..9a1a1b7d1 100644
+index 780f4d9..9a1a1b7 100644
 --- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
 +++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
 @@ -459,6 +459,20 @@ struct _GstAdaptiveDemuxClass
@@ -925,5 +892,5 @@ index 780f4d93f..9a1a1b7d1 100644
  
  GType    gst_adaptive_demux_get_type (void);
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
index 76d29e151b..ce32744e62 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
@@ -1,4 +1,4 @@
-From e9178fa082116d4bf733b184a8b6951112c17900 Mon Sep 17 00:00:00 2001
+From e8155c77d8dcaf39ec564b85c4a56e64fce6de2b Mon Sep 17 00:00:00 2001
 From: Matthew Waters <matthew@centricular.com>
 Date: Thu, 10 Nov 2016 17:18:36 +1100
 Subject: [PATCH] smoothstreaming: implement adaptivedemux's
@@ -11,39 +11,47 @@ manifest.
 https://bugzilla.gnome.org/show_bug.cgi?id=774178
 ---
 Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: wouterlucas <wouter@wouterlucas.com>
 
- ext/smoothstreaming/gstmssdemux.c    | 13 ++++++
+ ext/smoothstreaming/gstmssdemux.c    | 14 +++++-
  ext/smoothstreaming/gstmssmanifest.c | 84 ++++++++++++++++++++++++++++++++++++
  ext/smoothstreaming/gstmssmanifest.h |  1 +
- 3 files changed, 98 insertions(+)
+ 3 files changed, 98 insertions(+), 1 deletion(-)
 
 diff --git a/ext/smoothstreaming/gstmssdemux.c b/ext/smoothstreaming/gstmssdemux.c
-index 9d0aece2b..b66e19514 100644
+index 1a122d4..26147fd 100644
 --- a/ext/smoothstreaming/gstmssdemux.c
 +++ b/ext/smoothstreaming/gstmssdemux.c
-@@ -138,6 +138,8 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux);
- static GstFlowReturn
- gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
-     GstBuffer * buffer);
+@@ -146,6 +146,8 @@ static GstFlowReturn gst_mss_demux_data_received (GstAdaptiveDemux * demux,
+     GstAdaptiveDemuxStream * stream, GstBuffer * buffer);
+ static gboolean
+ gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * demux);
 +static gboolean gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux,
 +    gint64 * start, gint64 * stop);
  
  static void
  gst_mss_demux_class_init (GstMssDemuxClass * klass)
-@@ -192,6 +194,8 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
-       gst_mss_demux_stream_update_fragment_info;
-   gstadaptivedemux_class->update_manifest_data =
-       gst_mss_demux_update_manifest_data;
+@@ -206,6 +208,8 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
+   gstadaptivedemux_class->data_received = gst_mss_demux_data_received;
+   gstadaptivedemux_class->requires_periodical_playlist_update =
+       gst_mss_demux_requires_periodical_playlist_update;
 +  gstadaptivedemux_class->get_live_seek_range =
 +      gst_mss_demux_get_live_seek_range;
  
    GST_DEBUG_CATEGORY_INIT (mssdemux_debug, "mssdemux", 0, "mssdemux plugin");
  }
-@@ -659,3 +663,12 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
-   gst_mss_manifest_reload_fragments (mssdemux->manifest, buffer);
+@@ -694,7 +698,6 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
    return GST_FLOW_OK;
  }
+ 
+-
+ static GstFlowReturn
+ gst_mss_demux_data_received (GstAdaptiveDemux * demux,
+     GstAdaptiveDemuxStream * stream, GstBuffer *buffer)
+@@ -739,3 +742,12 @@ gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * demux)
+ 
+   return (!gst_mss_manifest_is_live (mssdemux->manifest));
+ }
 +
 +static gboolean
 +gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux, gint64 * start,
@@ -54,10 +62,10 @@ index 9d0aece2b..b66e19514 100644
 +  return gst_mss_manifest_get_live_seek_range (mssdemux->manifest, start, stop);
 +}
 diff --git a/ext/smoothstreaming/gstmssmanifest.c b/ext/smoothstreaming/gstmssmanifest.c
-index 1b72e8de1..317b3cef9 100644
+index b9dacb3..291080a 100644
 --- a/ext/smoothstreaming/gstmssmanifest.c
 +++ b/ext/smoothstreaming/gstmssmanifest.c
-@@ -42,6 +42,7 @@ GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
+@@ -45,6 +45,7 @@ GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
  
  #define MSS_PROP_BITRATE              "Bitrate"
  #define MSS_PROP_DURATION             "d"
@@ -65,16 +73,16 @@ index 1b72e8de1..317b3cef9 100644
  #define MSS_PROP_LANGUAGE             "Language"
  #define MSS_PROP_NUMBER               "n"
  #define MSS_PROP_REPETITIONS          "r"
-@@ -94,6 +95,7 @@ struct _GstMssManifest
-   xmlNodePtr xmlrootnode;
+@@ -103,6 +104,7 @@ struct _GstMssManifest
  
    gboolean is_live;
+   guint64 look_ahead_fragment_count;
 +  gint64 dvr_window;
  
    GString *protection_system_id;
    gchar *protection_data;
-@@ -330,6 +332,22 @@ gst_mss_manifest_new (GstBuffer * data)
-     xmlFree (live_str);
+@@ -367,6 +369,22 @@ gst_mss_manifest_new (GstBuffer * data)
+     xmlFree (look_ahead_fragment_count_str);
    }
  
 +  /* the entire file is always available for non-live streams */
@@ -96,9 +104,9 @@ index 1b72e8de1..317b3cef9 100644
    for (nodeiter = root->children; nodeiter; nodeiter = nodeiter->next) {
      if (nodeiter->type == XML_ELEMENT_NODE
          && (strcmp ((const char *) nodeiter->name, "StreamIndex") == 0)) {
-@@ -1406,3 +1424,69 @@ gst_mss_stream_get_lang (GstMssStream * stream)
- {
-   return stream->lang;
+@@ -1546,3 +1564,69 @@ gst_mss_stream_fragment_parse (GstMssStream * stream, GstBuffer * buffer)
+         fragment->time, fragment->duration, fragment->repetitions);
+   }
  }
 +
 +static GstClockTime
@@ -167,7 +175,7 @@ index 1b72e8de1..317b3cef9 100644
 +  return ret;
 +}
 diff --git a/ext/smoothstreaming/gstmssmanifest.h b/ext/smoothstreaming/gstmssmanifest.h
-index af7419c23..6b7b1f971 100644
+index 039877f..29545af 100644
 --- a/ext/smoothstreaming/gstmssmanifest.h
 +++ b/ext/smoothstreaming/gstmssmanifest.h
 @@ -54,6 +54,7 @@ void gst_mss_manifest_reload_fragments (GstMssManifest * manifest, GstBuffer * d
@@ -179,5 +187,5 @@ index af7419c23..6b7b1f971 100644
  GstMssStreamType gst_mss_stream_get_type (GstMssStream *stream);
  GstCaps * gst_mss_stream_get_caps (GstMssStream * stream);
 -- 
-2.11.0
+1.8.3.2
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 0bb4053e43..88289fb7d8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -11,13 +11,13 @@ SRC_URI = " \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
+    file://0001-mssdemux-improved-live-playback-support.patch \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
-    file://0009-glimagesink-Downrank-to-marginal.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch \
-    file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
-    file://0001-mssdemux-improved-live-playback-support.patch \
+    file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
+    file://0009-glimagesink-Downrank-to-marginal.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
2.17.0



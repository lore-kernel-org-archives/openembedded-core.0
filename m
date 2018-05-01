Return-Path: <wouter@wouterlucas.com>
Received: from h0stless.netw0rk.nl (h0stless.netw0rk.nl [149.210.182.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9D79F70057
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 03:31:11 +0000 (UTC)
Received: from c-73-162-69-48.hsd1.ca.comcast.net ([73.162.69.48]
	helo=localhost.localdomain)
	by h0stless.netw0rk.nl with esmtpa (Exim 4.91)
	(envelope-from <wouter@wouterlucas.com>)
	id 1fDM0W-0006j3-3Y; Tue, 01 May 2018 05:31:12 +0200
From: wouterlucas <wouter@wouterlucas.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2018 20:30:56 -0700
Message-Id: <20180501033057.20291-3-wouter@wouterlucas.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180501033057.20291-1-wouter@wouterlucas.com>
References: <20180501033057.20291-1-wouter@wouterlucas.com>
X-Authenticated-Id: wl@wouterlucas.com
Subject: [pyro][PATCH 3/4] gstreamer1.0-plugins-bad: adaptivedemux: minimal HTTP context support
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
 ...vedemux-minimal-HTTP-context-support.patch | 145 ++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.10.4.bb        |   1 +
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch
new file mode 100644
index 0000000000..e778277fb0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch
@@ -0,0 +1,145 @@
+From 992bd23193978742029966e0a2232b1bfcc06122 Mon Sep 17 00:00:00 2001
+From: Philippe Normand <philn@igalia.com>
+Date: Wed, 28 Oct 2015 11:52:49 +0100
+Subject: [PATCH] adaptivedemux: minimal HTTP context support
+
+The uridownloader is now querying the source element for an HTTP
+context, which stores session data (cookies only for now), and reusing
+the data when fetching data over HTTP. Additionally the context is set
+on adaptivedemux, which allows it to also properly use session data
+when downloading fragments.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=726314
+---
+Upstream-Status: Backport
+Signed-off-by: wouterlucas <wouter@wouterlucas.com>
+
+ gst-libs/gst/adaptivedemux/gstadaptivedemux.c | 16 ++++++++++++-
+ gst-libs/gst/uridownloader/gsturidownloader.c | 34 +++++++++++++++++++++++++--
+ gst-libs/gst/uridownloader/gsturidownloader.h |  2 +-
+ 3 files changed, 48 insertions(+), 4 deletions(-)
+
+diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
+index 20bd839..1b5cace 100644
+--- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
++++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
+@@ -432,7 +432,7 @@ gst_adaptive_demux_init (GstAdaptiveDemux * demux,
+ 
+   demux->priv = GST_ADAPTIVE_DEMUX_GET_PRIVATE (demux);
+   demux->priv->input_adapter = gst_adapter_new ();
+-  demux->downloader = gst_uri_downloader_new ();
++  demux->downloader = gst_uri_downloader_new (GST_ELEMENT (demux));
+   demux->stream_struct_size = sizeof (GstAdaptiveDemuxStream);
+   demux->priv->segment_seqnum = gst_util_seqnum_next ();
+   demux->have_group_id = FALSE;
+@@ -2547,6 +2547,7 @@ gst_adaptive_demux_stream_update_source (GstAdaptiveDemuxStream * stream,
+     GstPadLinkReturn pad_link_ret;
+     GObjectClass *gobject_class;
+     gchar *internal_name, *bin_name;
++    GstContext *context = NULL;
+ 
+     /* Our src consists of a bin containing uri_handler -> queue2 . The
+      * purpose of the queue2 is to allow the uri_handler to download an
+@@ -2598,6 +2599,19 @@ gst_adaptive_demux_stream_update_source (GstAdaptiveDemuxStream * stream,
+       }
+     }
+ 
++    context =
++        gst_element_get_context (GST_ELEMENT_CAST (demux), "http-headers");
++    if (context) {
++      const GstStructure *s = gst_context_get_structure (context);
++      const gchar **cookies = NULL;
++      gst_structure_get (s, "cookies", G_TYPE_STRV, &cookies, NULL);
++      if (cookies) {
++        GST_DEBUG_OBJECT (demux, "Passing cookies through");
++        g_object_set (uri_handler, "cookies", cookies, NULL);
++      }
++      gst_context_unref (context);
++    }
++
+     /* Source bin creation */
+     bin_name = g_strdup_printf ("srcbin-%s", GST_PAD_NAME (stream->pad));
+     stream->src = gst_bin_new (bin_name);
+diff --git a/gst-libs/gst/uridownloader/gsturidownloader.c b/gst-libs/gst/uridownloader/gsturidownloader.c
+index 47b6f29..1f61250 100644
+--- a/gst-libs/gst/uridownloader/gsturidownloader.c
++++ b/gst-libs/gst/uridownloader/gsturidownloader.c
+@@ -33,6 +33,8 @@ GST_DEBUG_CATEGORY (uridownloader_debug);
+ 
+ struct _GstUriDownloaderPrivate
+ {
++  GstElement *parent;
++
+   /* Fragments fetcher */
+   GstElement *urisrc;
+   GstBus *bus;
+@@ -148,9 +150,11 @@ gst_uri_downloader_finalize (GObject * object)
+ }
+ 
+ GstUriDownloader *
+-gst_uri_downloader_new (void)
++gst_uri_downloader_new (GstElement * parent)
+ {
+-  return g_object_new (GST_TYPE_URI_DOWNLOADER, NULL);
++  GstUriDownloader *downloader = g_object_new (GST_TYPE_URI_DOWNLOADER, NULL);
++  downloader->priv->parent = parent;
++  return downloader;
+ }
+ 
+ static gboolean
+@@ -413,6 +417,7 @@ gst_uri_downloader_set_uri (GstUriDownloader * downloader, const gchar * uri,
+ {
+   GstPad *pad;
+   GObjectClass *gobject_class;
++  GstContext *context = NULL;
+ 
+   if (!gst_uri_is_valid (uri))
+     return FALSE;
+@@ -449,6 +454,31 @@ gst_uri_downloader_set_uri (GstUriDownloader * downloader, const gchar * uri,
+     }
+   }
+ 
++  context = gst_element_get_context (downloader->priv->parent, "http-headers");
++  if (!context) {
++    GstQuery *context_query = gst_query_new_context ("http-headers");
++    GstPad *parent_sink_pad =
++        gst_element_get_static_pad (downloader->priv->parent, "sink");
++    if (gst_pad_peer_query (parent_sink_pad, context_query)) {
++
++      gst_query_parse_context (context_query, &context);
++      gst_element_set_context (downloader->priv->parent, context);
++    }
++    gst_object_unref (parent_sink_pad);
++    gst_query_unref (context_query);
++  }
++
++  if (context) {
++    const GstStructure *s = gst_context_get_structure (context);
++    const gchar **cookies = NULL;
++    gst_structure_get (s, "cookies", G_TYPE_STRV, &cookies, NULL);
++    if (cookies) {
++      GST_DEBUG_OBJECT (downloader, "Passing cookies through");
++      g_object_set (downloader->priv->urisrc, "cookies", cookies, NULL);
++    }
++    gst_context_unref (context);
++  }
++
+   /* add a sync handler for the bus messages to detect errors in the download */
+   gst_element_set_bus (GST_ELEMENT (downloader->priv->urisrc),
+       downloader->priv->bus);
+diff --git a/gst-libs/gst/uridownloader/gsturidownloader.h b/gst-libs/gst/uridownloader/gsturidownloader.h
+index 80b8a3e..36cbf65 100644
+--- a/gst-libs/gst/uridownloader/gsturidownloader.h
++++ b/gst-libs/gst/uridownloader/gsturidownloader.h
+@@ -60,7 +60,7 @@ struct _GstUriDownloaderClass
+ 
+ GType gst_uri_downloader_get_type (void);
+ 
+-GstUriDownloader * gst_uri_downloader_new (void);
++GstUriDownloader * gst_uri_downloader_new (GstElement * parent);
+ GstFragment * gst_uri_downloader_fetch_uri (GstUriDownloader * downloader, const gchar * uri, const gchar * referer, gboolean compress, gboolean refresh, gboolean allow_cache, GError ** err);
+ GstFragment * gst_uri_downloader_fetch_uri_with_range (GstUriDownloader * downloader, const gchar * uri, const gchar * referer, gboolean compress, gboolean refresh, gboolean allow_cache, gint64 range_start, gint64 range_end, GError ** err);
+ void gst_uri_downloader_reset (GstUriDownloader *downloader);
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index d209bcf8ab..f23d60c3d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
     file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch \
+    file://0003-adaptivedemux-minimal-HTTP-context-support.patch \
     file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
     file://0009-glimagesink-Downrank-to-marginal.patch \
 "
-- 
2.17.0



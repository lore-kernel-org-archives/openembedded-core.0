Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2BC770C5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 08:32:21 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 2B9BB21B95
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 09:32:17 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 09:32:06 +0100
Message-Id: <1446712332-17113-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 1/7] gstreamer1.0: upgrade to version 1.6.1
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
X-List-Received-Date: Thu, 05 Nov 2015 08:32:23 -0000

Removed patches which either were backports or accepted and integrated

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   8 +-
 ...gstinfo-Shorten-__FILE__-on-all-platforms.patch |  55 -------
 ...x-QoS-lateness-checking-if-subclass-imple.patch |  70 ---------
 ...ink-Shouldn-t-drop-buffer-when-sync-false.patch |  30 ----
 ...cky-events-haven-t-send-out-when-ac-1-4-1.patch | 167 ---------------------
 .../gstreamer/gstreamer1.0_1.4.5.bb                |  18 ---
 .../gstreamer/gstreamer1.0_1.6.1.bb                |  14 ++
 7 files changed, 18 insertions(+), 344 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-basesink-Shouldn-t-drop-buffer-when-sync-false.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index be8aa8f..aa95d57 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 LICENSE = "LGPLv2+"
-DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
+DEPENDS = "glib-2.0 libxml2 bison-native flex-native libcap"
 
 inherit autotools pkgconfig gettext
 
@@ -23,7 +23,7 @@ RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-raw
 
 CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
 
-FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dev += " ${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a"
-FILES_${PN}-dbg += " ${libdir}/gstreamer-1.0/.debug/ ${libexecdir}/gstreamer-1.0/.debug/"
+FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so ${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
+FILES_${PN}-dev += " ${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
+FILES_${PN}-dbg += " ${libdir}/gstreamer-1.0/.debug/ ${libexecdir}/gstreamer-1.0/.debug/ ${datadir}/bash-completion/helpers/.debug/"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch
deleted file mode 100644
index 8213c4b..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 81fecd367b016e5ac4fb0c04b84da5c474f30da6 Mon Sep 17 00:00:00 2001
-From: Peter Urbanec <git.user@urbanec.net>
-Date: Fri, 27 Feb 2015 01:16:58 +1100
-Subject: [PATCH 1/1] gstinfo: Shorten __FILE__ on all platforms.
-
-This is useful not only for MSVC, but also with gcc/Linux when doing
-cross-compilation builds and out-of-tree builds.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=745213]
-
-Signed-off-by: Peter Urbanec <git.user@urbanec.net>
----
- gst/gstinfo.c | 11 ++++-------
- 1 file changed, 4 insertions(+), 7 deletions(-)
-
-diff --git a/gst/gstinfo.c b/gst/gstinfo.c
-index b2a3005..8b61d09 100644
---- a/gst/gstinfo.c
-+++ b/gst/gstinfo.c
-@@ -444,7 +444,6 @@ gst_debug_log (GstDebugCategory * category, GstDebugLevel level,
-   va_end (var_args);
- }
- 
--#ifdef G_OS_WIN32
- /* based on g_basename(), which we can't use because it was deprecated */
- static inline const gchar *
- gst_path_basename (const gchar * file_name)
-@@ -467,7 +466,6 @@ gst_path_basename (const gchar * file_name)
- 
-   return file_name;
- }
--#endif
- 
- /**
-  * gst_debug_log_valist:
-@@ -497,12 +495,11 @@ gst_debug_log_valist (GstDebugCategory * category, GstDebugLevel level,
-   g_return_if_fail (function != NULL);
-   g_return_if_fail (format != NULL);
- 
--  /* The predefined macro __FILE__ is always the exact path given to the
--   * compiler with MSVC, which may or may not be the basename.  We work
--   * around it at runtime to improve the readability. */
--#ifdef G_OS_WIN32
-+  /* The predefined macro __FILE__ can be an absolute path in some build
-+   * environments, such as MSVC or out-of-tree cross-compiles. This may
-+   * be significantly longer than the filename.  We work around it at
-+   * runtime to improve the readability. */
-   file = gst_path_basename (file);
--#endif
- 
-   message.message = NULL;
-   message.format = format;
--- 
-2.3.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
deleted file mode 100644
index 1505cbe..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 6914566ed6a89c96973a578aa5ecd01ee68cdcfd Mon Sep 17 00:00:00 2001
-From: Jian <Jian.Li@freescale.com>
-Date: Thu, 14 May 2015 15:49:43 +0800
-Subject: [PATCH] basesink: Fix QoS/lateness checking if subclass implements
- prepare/prepare_list vfuncs
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-In basesink functions gst_base_sink_chain_unlocked(), below code is used to
-checking if buffer is late before doing prepare call to save some effort:
-    if (syncable && do_sync)
-      late =
-          gst_base_sink_is_too_late (basesink, obj, rstart, rstop,
-          GST_CLOCK_EARLY, 0, FALSE);
-
-    if (G_UNLIKELY (late))
-      goto dropped;
-
-But this code has problem, it should calculate jitter based on current media
-clock, rather than just passing 0. I found it will drop all the frames when
-rewind in slow speed, such as -2X.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=749258
-
-Upstream-Status: Backport [1.5.1]
----
- libs/gst/base/gstbasesink.c |   26 ++++++++++++++++++++++----
- 1 file changed, 22 insertions(+), 4 deletions(-)
-
-diff --git a/libs/gst/base/gstbasesink.c b/libs/gst/base/gstbasesink.c
-index a505695..5fb2d6a 100644
---- a/libs/gst/base/gstbasesink.c
-+++ b/libs/gst/base/gstbasesink.c
-@@ -3369,10 +3369,28 @@ gst_base_sink_chain_unlocked (GstBaseSink * basesink, GstPad * pad,
-     if (G_UNLIKELY (stepped))
-       goto dropped;
- 
--    if (syncable && do_sync)
--      late =
--          gst_base_sink_is_too_late (basesink, obj, rstart, rstop,
--          GST_CLOCK_EARLY, 0, FALSE);
-+    if (syncable && do_sync) {
-+      GstClock *clock;
-+
-+      GST_OBJECT_LOCK (basesink);
-+      clock = GST_ELEMENT_CLOCK (basesink);
-+      if (clock && GST_STATE (basesink) == GST_STATE_PLAYING) {
-+        GstClockTime base_time;
-+        GstClockTime stime;
-+        GstClockTime now;
-+
-+        base_time = GST_ELEMENT_CAST (basesink)->base_time;
-+        stime = base_time + gst_base_sink_adjust_time (basesink, rstart);
-+        now = gst_clock_get_time (clock);
-+        GST_OBJECT_UNLOCK (basesink);
-+
-+        late =
-+            gst_base_sink_is_too_late (basesink, obj, rstart, rstop,
-+            GST_CLOCK_EARLY, GST_CLOCK_DIFF (stime, now), FALSE);
-+      } else {
-+        GST_OBJECT_UNLOCK (basesink);
-+      }
-+    }
- 
-     if (G_UNLIKELY (late))
-       goto dropped;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-basesink-Shouldn-t-drop-buffer-when-sync-false.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-basesink-Shouldn-t-drop-buffer-when-sync-false.patch
deleted file mode 100755
index d682ee6..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-basesink-Shouldn-t-drop-buffer-when-sync-false.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 73df2b5c0aea58015788f5a94a3ec65296a688d3 Mon Sep 17 00:00:00 2001
-From: Song Bing <b06498@freescale.com>
-Date: Thu, 2 Jul 2015 14:32:21 +0800
-Subject: [PATCH] basesink: Shouldn't drop buffer when sync=false
-
-Shouldn't drop buffer when sync=false
-
-Upstream-Status: Accepted
-
-https://bugzilla.gnome.org/show_bug.cgi?id=751819
----
- libs/gst/base/gstbasesink.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libs/gst/base/gstbasesink.c b/libs/gst/base/gstbasesink.c
-index d44e8fc..cd759ac 100644
---- a/libs/gst/base/gstbasesink.c
-+++ b/libs/gst/base/gstbasesink.c
-@@ -3423,7 +3423,7 @@ gst_base_sink_chain_unlocked (GstBaseSink * basesink, GstPad * pad,
-     if (G_UNLIKELY (stepped))
-       goto dropped;
- 
--    if (syncable && do_sync) {
-+    if (syncable && do_sync && gst_base_sink_get_sync (basesink)) {
-       GstClock *clock;
- 
-       GST_OBJECT_LOCK (basesink);
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch
deleted file mode 100755
index f50ce6f..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From 83bed90c306ed3185d48febf6441177d638f7341 Mon Sep 17 00:00:00 2001
-From: Song Bing <b06498@freescale.com>
-Date: Wed, 24 Dec 2014 10:13:51 +0800
-Subject: [PATCH] inputselector: sticky events haven't send out when active
- track reach EOS
-
-EOS event hasn't been send to down-element. The resolution is block EOS event
-of inactive pad, send the event after the pad actived.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=740949
-
-Upstream-Status: Backport [1.5.1]
-
-Signed-off-by: Song Bing <b06498@freescale.com>
----
- plugins/elements/gstinputselector.c |   58 ++++++++++++++++++++++++++---------
- plugins/elements/gstinputselector.h |    1 +
- 2 files changed, 45 insertions(+), 14 deletions(-)
-
-diff --git a/plugins/elements/gstinputselector.c b/plugins/elements/gstinputselector.c
-index fb50802..4461f7c 100644
---- a/plugins/elements/gstinputselector.c
-+++ b/plugins/elements/gstinputselector.c
-@@ -440,6 +440,17 @@ gst_selector_pad_iterate_linked_pads (GstPad * pad, GstObject * parent)
- }
- 
- static gboolean
-+gst_input_selector_eos_wait (GstInputSelector * self, GstSelectorPad * pad)
-+{
-+  while (!self->eos && !self->flushing && !pad->flushing) {
-+    /* we can be unlocked here when we are shutting down (flushing) or when we
-+     * get unblocked */
-+    GST_INPUT_SELECTOR_WAIT (self);
-+  }
-+  return self->flushing;
-+}
-+
-+static gboolean
- gst_selector_pad_event (GstPad * pad, GstObject * parent, GstEvent * event)
- {
-   gboolean res = TRUE;
-@@ -486,6 +497,7 @@ gst_selector_pad_event (GstPad * pad, GstObject * parent, GstEvent * event)
-     case GST_EVENT_FLUSH_START:
-       /* Unblock the pad if it's waiting */
-       selpad->flushing = TRUE;
-+      sel->eos = FALSE;
-       GST_INPUT_SELECTOR_BROADCAST (sel);
-       break;
-     case GST_EVENT_FLUSH_STOP:
-@@ -523,21 +535,12 @@ gst_selector_pad_event (GstPad * pad, GstObject * parent, GstEvent * event)
-     case GST_EVENT_EOS:
-       selpad->eos = TRUE;
- 
--      if (forward) {
--        selpad->eos_sent = TRUE;
--      } else {
--        GstSelectorPad *active_selpad;
--
--        /* If the active sinkpad is in EOS state but EOS
--         * was not sent downstream this means that the pad
--         * got EOS before it was set as active pad and that
--         * the previously active pad got EOS after it was
--         * active
--         */
--        active_selpad = GST_SELECTOR_PAD (active_sinkpad);
--        forward = (active_selpad->eos && !active_selpad->eos_sent);
--        active_selpad->eos_sent = TRUE;
-+      if (!forward) {
-+        /* blocked until active the sind pad or flush */
-+        gst_input_selector_eos_wait (sel, selpad);
-+        forward = TRUE;
-       }
-+      selpad->eos_sent = TRUE;
-       GST_DEBUG_OBJECT (pad, "received EOS");
-       break;
-     case GST_EVENT_GAP:{
-@@ -676,6 +679,12 @@ gst_input_selector_wait_running_time (GstInputSelector * sel,
-         gst_input_selector_activate_sinkpad (sel, GST_PAD_CAST (selpad));
-     active_selpad = GST_SELECTOR_PAD_CAST (active_sinkpad);
- 
-+    if (sel->eos) {
-+      GST_DEBUG_OBJECT (sel, "Not waiting because inputselector reach EOS.");
-+      GST_INPUT_SELECTOR_UNLOCK (sel);
-+      return FALSE;
-+    }
-+
-     if (seg->format != GST_FORMAT_TIME) {
-       GST_DEBUG_OBJECT (selpad,
-           "Not waiting because we don't have a TIME segment");
-@@ -971,6 +980,12 @@ gst_selector_pad_chain (GstPad * pad, GstObject * parent, GstBuffer * buf)
-       GST_TIME_ARGS (GST_BUFFER_TIMESTAMP (buf)));
- 
-   GST_INPUT_SELECTOR_LOCK (sel);
-+  if (sel->eos) {
-+    GST_DEBUG_OBJECT (pad, "inputselector eos.");
-+    GST_INPUT_SELECTOR_UNLOCK (sel);
-+    goto eos;
-+  }
-+
-   /* wait or check for flushing */
-   if (gst_input_selector_wait (sel, selpad)) {
-     GST_INPUT_SELECTOR_UNLOCK (sel);
-@@ -1151,6 +1166,13 @@ flushing:
-     res = GST_FLOW_FLUSHING;
-     goto done;
-   }
-+eos:
-+  {
-+    GST_DEBUG_OBJECT (pad, "We are eos, discard buffer %p", buf);
-+    gst_buffer_unref (buf);
-+    res = GST_FLOW_EOS;
-+    goto done;
-+  }
- }
- 
- static void gst_input_selector_dispose (GObject * object);
-@@ -1309,6 +1331,7 @@ gst_input_selector_init (GstInputSelector * sel)
-   g_mutex_init (&sel->lock);
-   g_cond_init (&sel->cond);
-   sel->blocked = FALSE;
-+  sel->eos = FALSE;
- 
-   /* lets give a change for downstream to do something on
-    * active-pad change before we start pushing new buffers */
-@@ -1377,6 +1400,11 @@ gst_input_selector_set_active_pad (GstInputSelector * self, GstPad * pad)
-   GST_DEBUG_OBJECT (self, "New active pad is %" GST_PTR_FORMAT,
-       self->active_sinkpad);
- 
-+  if (old != new && new->eos && !new->eos_sent) {
-+    self->eos = TRUE;
-+    GST_INPUT_SELECTOR_BROADCAST (self);
-+  }
-+
-   return TRUE;
- }
- 
-@@ -1771,6 +1799,7 @@ gst_input_selector_change_state (GstElement * element,
-   switch (transition) {
-     case GST_STATE_CHANGE_READY_TO_PAUSED:
-       GST_INPUT_SELECTOR_LOCK (self);
-+      self->eos = FALSE;
-       self->blocked = FALSE;
-       self->flushing = FALSE;
-       GST_INPUT_SELECTOR_UNLOCK (self);
-@@ -1779,6 +1808,7 @@ gst_input_selector_change_state (GstElement * element,
-       /* first unlock before we call the parent state change function, which
-        * tries to acquire the stream lock when going to ready. */
-       GST_INPUT_SELECTOR_LOCK (self);
-+      self->eos = TRUE;
-       self->blocked = FALSE;
-       self->flushing = TRUE;
-       GST_INPUT_SELECTOR_BROADCAST (self);
-diff --git a/plugins/elements/gstinputselector.h b/plugins/elements/gstinputselector.h
-index 96c680f..9bf924f 100644
---- a/plugins/elements/gstinputselector.h
-+++ b/plugins/elements/gstinputselector.h
-@@ -77,6 +77,7 @@ struct _GstInputSelector {
-   GMutex lock;
-   GCond cond;
-   gboolean blocked;
-+  gboolean eos;
-   gboolean flushing;
- };
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
deleted file mode 100644
index 73a4a99..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-include gstreamer1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
-
-SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
-    file://0001-Fix-crash-with-gst-inspect.patch \
-    file://0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch \
-    file://inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch \
-    file://0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch \
-    file://0003-basesink-Shouldn-t-drop-buffer-when-sync-false.patch \
-"
-SRC_URI[md5sum] = "88a9289c64a4950ebb4f544980234289"
-SRC_URI[sha256sum] = "40801aa7f979024526258a0e94707ba42b8ab6f7d2206e56adbc4433155cb0ae"
-
-S = "${WORKDIR}/gstreamer-${PV}"
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb
new file mode 100644
index 0000000..2359249
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb
@@ -0,0 +1,14 @@
+include gstreamer1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
+                    file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
+
+SRC_URI = " \
+    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
+    file://0001-Fix-crash-with-gst-inspect.patch \
+"
+SRC_URI[md5sum] = "e72e2dc2ee06bfc045bb6010c89de520"
+SRC_URI[sha256sum] = "973a3f213c8d41d6dd0e4e7e38fd6cccacd5ae1ac09e1179a8d5d869ef0a5c9c"
+
+S = "${WORKDIR}/gstreamer-${PV}"
+
-- 
2.5.0



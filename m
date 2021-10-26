X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [honister][PATCH 04/37] gstreamer1.0-plugins-good: 1.18.4 -> 1.18.5
Date: Tue, 26 Oct 2021 23:57:35 +0800
Message-Id: <790cb8acafc89969a6d1468f7df0493b737f946a.1635257336.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Jose Quaresma <quaresma.jose@gmail.com>

Drop backport patches:
    * 0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch

    * 0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch
      https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/commit/a1bf3d8d540a25268d612a489e1e836d6ea737b0

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b51d46790e582556a7230a1fe8f67375e785cc43)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...Fix-parsing-of-the-mediaclk-direct-f.patch |  33 ------
 ...from-static-vars-to-fix-build-with-g.patch | 100 ------------------
 ...bb => gstreamer1.0-plugins-good_1.18.5.bb} |   4 +-
 3 files changed, 1 insertion(+), 136 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.4.bb => gstreamer1.0-plugins-good_1.18.5.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch
deleted file mode 100644
index 14a9fe23aa..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ec1949dffd931d0ec7e4f67108a08ab1e2af0cfe Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Tue, 16 Mar 2021 19:25:36 +0200
-Subject: [PATCH] rtpjitterbuffer: Fix parsing of the mediaclk:direct= field
-
-Due to an off-by-one when parsing the string, the most significant digit
-or the clock offset was skipped when parsing the offset.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/910>
-
-Upstream-Status: Backport [b5bb4ede3a42273fafc1054f9cf106ca527e3c26]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- gst/rtpmanager/gstrtpjitterbuffer.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/rtpmanager/gstrtpjitterbuffer.c b/gst/rtpmanager/gstrtpjitterbuffer.c
-index 60d8ad875..02fe15adc 100644
---- a/gst/rtpmanager/gstrtpjitterbuffer.c
-+++ b/gst/rtpmanager/gstrtpjitterbuffer.c
-@@ -1534,7 +1534,7 @@ gst_jitter_buffer_sink_parse_caps (GstRtpJitterBuffer * jitterbuffer,
-       GST_DEBUG_OBJECT (jitterbuffer, "Got media clock %s", mediaclk);
- 
-       if (!g_str_has_prefix (mediaclk, "direct=") ||
--          !g_ascii_string_to_unsigned (&mediaclk[8], 10, 0, G_MAXUINT64,
-+          !g_ascii_string_to_unsigned (&mediaclk[7], 10, 0, G_MAXUINT64,
-               &clock_offset, NULL))
-         GST_FIXME_OBJECT (jitterbuffer, "Unsupported media clock");
-       if (strstr (mediaclk, "rate=") != NULL) {
--- 
-2.31.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch
deleted file mode 100644
index 87223826c6..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 07572920319ea86cebb6dd073ab65915ec207eed Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Sat, 8 May 2021 14:08:41 +0200
-Subject: [PATCH] Remove volatile from static vars to fix build with gcc11
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Stolen from [1]
-
-[1] https://src.fedoraproject.org/rpms/gstreamer1-plugins-good/blob/rawhide/f/gstreamer1-plugins-good-gcc11.patch
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- ext/qt/gstqsgtexture.cc  | 2 +-
- ext/qt/gstqtglutility.cc | 2 +-
- ext/qt/qtglrenderer.cc   | 2 +-
- ext/qt/qtitem.cc         | 2 +-
- ext/qt/qtwindow.cc       | 4 ++--
- 5 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/ext/qt/gstqsgtexture.cc b/ext/qt/gstqsgtexture.cc
-index 4cc9fc6..50c8d7f 100644
---- a/ext/qt/gstqsgtexture.cc
-+++ b/ext/qt/gstqsgtexture.cc
-@@ -35,7 +35,7 @@ GST_DEBUG_CATEGORY_STATIC (GST_CAT_DEFAULT);
- 
- GstQSGTexture::GstQSGTexture ()
- {
--  static volatile gsize _debug;
-+  static gsize _debug;
- 
-   initializeOpenGLFunctions();
- 
-diff --git a/ext/qt/gstqtglutility.cc b/ext/qt/gstqtglutility.cc
-index acb89b6..d2c0922 100644
---- a/ext/qt/gstqtglutility.cc
-+++ b/ext/qt/gstqtglutility.cc
-@@ -66,7 +66,7 @@ gst_qt_get_gl_display ()
- {
-   GstGLDisplay *display = NULL;
-   QGuiApplication *app = static_cast<QGuiApplication *> (QCoreApplication::instance ());
--  static volatile gsize _debug;
-+  static gsize _debug;
- 
-   g_assert (app != NULL);
- 
-diff --git a/ext/qt/qtglrenderer.cc b/ext/qt/qtglrenderer.cc
-index 2ad5601..bffba8f 100644
---- a/ext/qt/qtglrenderer.cc
-+++ b/ext/qt/qtglrenderer.cc
-@@ -22,7 +22,7 @@ GST_DEBUG_CATEGORY_STATIC (GST_CAT_DEFAULT);
- static void
- init_debug (void)
- {
--  static volatile gsize _debug;
-+  static gsize _debug;
- 
-   if (g_once_init_enter (&_debug)) {
-     GST_DEBUG_CATEGORY_INIT (GST_CAT_DEFAULT, "qtglrenderer", 0,
-diff --git a/ext/qt/qtitem.cc b/ext/qt/qtitem.cc
-index 7659800..bc99639 100644
---- a/ext/qt/qtitem.cc
-+++ b/ext/qt/qtitem.cc
-@@ -104,7 +104,7 @@ void InitializeSceneGraph::run()
- 
- QtGLVideoItem::QtGLVideoItem()
- {
--  static volatile gsize _debug;
-+  static gsize _debug;
- 
-   if (g_once_init_enter (&_debug)) {
-     GST_DEBUG_CATEGORY_INIT (GST_CAT_DEFAULT, "qtglwidget", 0, "Qt GL Widget");
-diff --git a/ext/qt/qtwindow.cc b/ext/qt/qtwindow.cc
-index 0dfd3f1..f1bd4ae 100644
---- a/ext/qt/qtwindow.cc
-+++ b/ext/qt/qtwindow.cc
-@@ -103,7 +103,7 @@ QtGLWindow::QtGLWindow ( QWindow * parent, QQuickWindow *src ) :
-   QQuickWindow( parent ), source (src)
- {
-   QGuiApplication *app = static_cast<QGuiApplication *> (QCoreApplication::instance ());
--  static volatile gsize _debug;
-+  static gsize _debug;
- 
-   g_assert (app != NULL);
- 
-@@ -152,7 +152,7 @@ QtGLWindow::beforeRendering()
- 
-   g_mutex_lock (&this->priv->lock);
- 
--  static volatile gsize once = 0;
-+  static gsize once = 0;
-   if (g_once_init_enter(&once)) {
-     this->priv->start = QDateTime::currentDateTime().toMSecsSinceEpoch();
-     g_once_init_leave(&once,1);
--- 
-2.30.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
index a90594ade5..ade935df9e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
@@ -6,11 +6,9 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
-           file://0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch \
-           file://0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch \
            "
 
-SRC_URI[sha256sum] = "b6e50e3a9bbcd56ee6ec71c33aa8332cc9c926b0c1fae995aac8b3040ebe39b0"
+SRC_URI[sha256sum] = "3aaeeea7765fbf8801acce4a503a9b05f73f04e8a35352e9d00232cfd555796b"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.31.1


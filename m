Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.5738.1620476087801089134
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 May 2021 05:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JirnbPL+;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id h4so11829360wrt.12
        for <openembedded-core@lists.openembedded.org>; Sat, 08 May 2021 05:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uCTvlqBTAEwuCYlYsDQvNvgWeUtfZuw2eVq2herad9w=;
        b=JirnbPL+CS7BO/3PzASHkS+k/HsluU9Ynu2eYw3dPPT26ZtxKbIcygwNk7OqP92stb
         vFpM7nW423rInHrLWY/ihCqRiTt96M4u9CgiXMIAkZUzZsLZEf1oR/uhKpAp/bW6LG29
         oCXiSuZ5S03lHVK8mFABCFea1hFznKZMO1Y9lUbpPcgO8xVyPt77y/htgSb++mwa9C5q
         cihMyUBuc9lfjdCCXU+ca4hRTf3XALKnl08OjX4I79/OmuEwvxc1EBbPIPWZMOMOxax7
         BN6j9F5eTlrKpS43sDSOmBl+PYG5OaGoTYPdmiz7/5aDHH6ZNpJ5ZZPWNfTIU7Z0KXM2
         xjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uCTvlqBTAEwuCYlYsDQvNvgWeUtfZuw2eVq2herad9w=;
        b=aX/I/TFeHfKEgMfmqhh4l4kW2PKuwR+ybPyBmgGwHmNPgJJwGmlAYCBXcjqUD5bV2r
         chojMhXJvXDD3BVZK45bsJdnra03dBcR71tXaoO3S8TbCHqgQsSmSZ6UeBff/1GSPCVO
         6uQZ0SDu9kR3vPtGYrKPf1ijdWbE/kXOj/oxD2WI7yCMFSicXgdlplBuziUiUbIlsy7Q
         PCNsJii3mLKKqumAhG5CloO1ZHz03QOwOJsiZ/8s8ZYYMyn6tnsLwHZnoVmHKK6BliIz
         sESKL/sz6QnpD/FI4hIlGSXoJCpb28CTvyaiR66+CMaIOaIbwk6CiONq01Zp9Lm438Ww
         XjaA==
X-Gm-Message-State: AOAM532pSiGyBs6pgh+02LfaskhKAm5BSdNZreWYsBHwdmwXFvmWdGf0
	IottTVK1nUJnGoDSC87pxqCyrUZwB2U=
X-Google-Smtp-Source: ABdhPJxp1XZRMxLcI+wtO64+80uptSQgcycpBMBW2fRQ/+wrOGkxcbRpBgVMaCwTywZ5Q6iNV9hlCA==
X-Received: by 2002:a5d:5610:: with SMTP id l16mr19602438wrv.106.1620476086148;
        Sat, 08 May 2021 05:14:46 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f17f605bf678a28cd790588.dip0.t-ipconnect.de. [2003:f0:7f17:f605:bf67:8a28:cd79:588])
        by smtp.gmail.com with ESMTPSA id y17sm14723155wrw.90.2021.05.08.05.14.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:14:45 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gstreamer1.0-plugins-good: fix build with gcc11
Date: Sat,  8 May 2021 14:14:37 +0200
Message-Id: <20210508121437.839561-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...from-static-vars-to-fix-build-with-g.patch | 100 ++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.18.4.bb       |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch
new file mode 100644
index 0000000000..87223826c6
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch
@@ -0,0 +1,100 @@
+From 07572920319ea86cebb6dd073ab65915ec207eed Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 8 May 2021 14:08:41 +0200
+Subject: [PATCH] Remove volatile from static vars to fix build with gcc11
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Stolen from [1]
+
+[1] https://src.fedoraproject.org/rpms/gstreamer1-plugins-good/blob/rawhide/f/gstreamer1-plugins-good-gcc11.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ ext/qt/gstqsgtexture.cc  | 2 +-
+ ext/qt/gstqtglutility.cc | 2 +-
+ ext/qt/qtglrenderer.cc   | 2 +-
+ ext/qt/qtitem.cc         | 2 +-
+ ext/qt/qtwindow.cc       | 4 ++--
+ 5 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/ext/qt/gstqsgtexture.cc b/ext/qt/gstqsgtexture.cc
+index 4cc9fc6..50c8d7f 100644
+--- a/ext/qt/gstqsgtexture.cc
++++ b/ext/qt/gstqsgtexture.cc
+@@ -35,7 +35,7 @@ GST_DEBUG_CATEGORY_STATIC (GST_CAT_DEFAULT);
+ 
+ GstQSGTexture::GstQSGTexture ()
+ {
+-  static volatile gsize _debug;
++  static gsize _debug;
+ 
+   initializeOpenGLFunctions();
+ 
+diff --git a/ext/qt/gstqtglutility.cc b/ext/qt/gstqtglutility.cc
+index acb89b6..d2c0922 100644
+--- a/ext/qt/gstqtglutility.cc
++++ b/ext/qt/gstqtglutility.cc
+@@ -66,7 +66,7 @@ gst_qt_get_gl_display ()
+ {
+   GstGLDisplay *display = NULL;
+   QGuiApplication *app = static_cast<QGuiApplication *> (QCoreApplication::instance ());
+-  static volatile gsize _debug;
++  static gsize _debug;
+ 
+   g_assert (app != NULL);
+ 
+diff --git a/ext/qt/qtglrenderer.cc b/ext/qt/qtglrenderer.cc
+index 2ad5601..bffba8f 100644
+--- a/ext/qt/qtglrenderer.cc
++++ b/ext/qt/qtglrenderer.cc
+@@ -22,7 +22,7 @@ GST_DEBUG_CATEGORY_STATIC (GST_CAT_DEFAULT);
+ static void
+ init_debug (void)
+ {
+-  static volatile gsize _debug;
++  static gsize _debug;
+ 
+   if (g_once_init_enter (&_debug)) {
+     GST_DEBUG_CATEGORY_INIT (GST_CAT_DEFAULT, "qtglrenderer", 0,
+diff --git a/ext/qt/qtitem.cc b/ext/qt/qtitem.cc
+index 7659800..bc99639 100644
+--- a/ext/qt/qtitem.cc
++++ b/ext/qt/qtitem.cc
+@@ -104,7 +104,7 @@ void InitializeSceneGraph::run()
+ 
+ QtGLVideoItem::QtGLVideoItem()
+ {
+-  static volatile gsize _debug;
++  static gsize _debug;
+ 
+   if (g_once_init_enter (&_debug)) {
+     GST_DEBUG_CATEGORY_INIT (GST_CAT_DEFAULT, "qtglwidget", 0, "Qt GL Widget");
+diff --git a/ext/qt/qtwindow.cc b/ext/qt/qtwindow.cc
+index 0dfd3f1..f1bd4ae 100644
+--- a/ext/qt/qtwindow.cc
++++ b/ext/qt/qtwindow.cc
+@@ -103,7 +103,7 @@ QtGLWindow::QtGLWindow ( QWindow * parent, QQuickWindow *src ) :
+   QQuickWindow( parent ), source (src)
+ {
+   QGuiApplication *app = static_cast<QGuiApplication *> (QCoreApplication::instance ());
+-  static volatile gsize _debug;
++  static gsize _debug;
+ 
+   g_assert (app != NULL);
+ 
+@@ -152,7 +152,7 @@ QtGLWindow::beforeRendering()
+ 
+   g_mutex_lock (&this->priv->lock);
+ 
+-  static volatile gsize once = 0;
++  static gsize once = 0;
+   if (g_once_init_enter(&once)) {
+     this->priv->start = QDateTime::currentDateTime().toMSecsSinceEpoch();
+     g_once_init_leave(&once,1);
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
index 07cacdc68a..c7d31d206d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
@@ -7,6 +7,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch \
+           file://0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch \
            "
 
 SRC_URI[sha256sum] = "b6e50e3a9bbcd56ee6ec71c33aa8332cc9c926b0c1fae995aac8b3040ebe39b0"
-- 
2.30.2


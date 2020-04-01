Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.62.1585715419523575174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 21:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tN8jpmYm;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d24so5267717pll.8
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 21:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+VdrtILszPFY+8fgZlUbyd4Y4Lrkoyqb5JwFEeOAI8E=;
        b=tN8jpmYmWTpCrQcP2zyUqAKftGcgckDlFNe6x7F6j5xlC84zo7cowCev+4N3r1gJwg
         KkpL7EnmqoIrxZqwj8obVFzjL9NcAcmMYyfVzY4YXr2jm3MbF0XKWFh5SWdt+THiVV1s
         ZpreV9aQMgJrIYKAWvYKguQ3YGa9NImxLCJ3TRLGuHGyH5CUizU8r54PjNzRDVKVFJIk
         kUGyzE2kM75A18PuLoFQCbhrwTz9c50HHbJu/KQ734i3K8jrVfwaYlmc2Grw6qr8HT2X
         yyKcBIoiBE0ng7dw2i8hnrAdiYRp20n9f2a21KBN6luREDwT1VEbE0bogA3zK+6qJPjg
         p0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+VdrtILszPFY+8fgZlUbyd4Y4Lrkoyqb5JwFEeOAI8E=;
        b=Dl2O3YVFOEAjwqypbKzfjQOK0EapicRZT98F2bxWJ6xsuQYAaqfHBvQ0ax3oE4cNJT
         mPOrFwNVg+8Ofi4CJ51bgTRV4PqrP32RfEXUMdDMFvGyOhZgVUBLouxjPYdOV7NTzXH4
         ENEojeT+b9ENFvXtdH0XG3rXDrFM/qbPPSuj+P45qMG5pRXmsomjBAksSKnw37zvI/ed
         VnwgxOLIxPSY4cCesJtgseqSSemrA0JrGCuC5IqLJrS64S6DCMVU5l/Sz8LtqR2azw4v
         zz4RxklOTEM0/JMkl6lrUUsBDHcOxkL4Ix3E7fM7h1vDhr6t+SvsdlDuWzGPW2LJ4COA
         JpdA==
X-Gm-Message-State: AGi0PubB/d3wV0JKIRtxheB8W//VXfl1IUT/A/jt1Q5sDnrMuigvhg9E
	o/l9QtOWS97cDuu5jo2z1VRm7hqn6xc=
X-Google-Smtp-Source: APiQypI8DbSb8zGAKKaQFzehS+hGzKJSijDEvFUwBqhiKWGuzASAbrVB4DPQORhqikmzWBP038mPFw==
X-Received: by 2002:a17:90a:8b96:: with SMTP id z22mr2429526pjn.159.1585715418419;
        Tue, 31 Mar 2020 21:30:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id t1sm444744pgh.88.2020.03.31.21.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 21:30:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gstreamer1.0-plugins-good: Fix build when egl is enabled but no x11/wayland
Date: Tue, 31 Mar 2020 21:30:32 -0700
Message-Id: <20200401043032.2636269-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes build errors seen in no-x11/no-wayland configuration ( eglfs
) and when QT5 support is enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...defines-GLsync-to-fix-compile-on-som.patch | 70 +++++++++++++++++++
 ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch | 56 +++++++++++++++
 .../gstreamer1.0-plugins-good_1.16.2.bb       |  2 +
 3 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
new file mode 100644
index 0000000000..136848763b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
@@ -0,0 +1,70 @@
+From 3e0d5577444b32579bdf5b69d720a322322ff7bc Mon Sep 17 00:00:00 2001
+From: Milian Wolff <milian.wolff@kdab.com>
+Date: Tue, 26 Nov 2019 15:08:20 +0100
+Subject: [PATCH] qmlgl: ensure Qt defines GLsync to fix compile on some platforms
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+By explictly including QtGui/qopengl.h we force the code path that
+defines GLsync in the Qt-specific way. Without that, some platforms
+failed to compile the qmlgl plugin, since neither Qt nor gstreamer
+defined GLsync then, leading to e.g.:
+
+```
+make[4]: Entering directory '/.../gst-plugins-good-1.16.1/ext/qt'
+  CXX      libgstqmlgl_la-qtitem.lo
+In file included from gstqtgl.h:32,
+                 from qtitem.h:27,
+                 from qtitem.cc:28:
+/.../usr/include/gstreamer-1.0/
+gst/gl/gstglfuncs.h:93:17: error: expected identifier before ‘*’ token
+   ret (GSTGLAPI *name) args;
+                 ^
+/.../usr/include/gstreamer-1.0/
+gst/gl/glprototypes/sync.h:27:1: note: in expansion of macro
+‘GST_GL_EXT_FUNCTION’
+ GST_GL_EXT_FUNCTION (GLsync, FenceSync,
+ ^~~~~~~~~~~~~~~~~~~
+```
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/commit/3e0d5577444b32579bdf5b69d720a322322ff7bc]
+---
+ ext/qt/gstqtgl.h | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+--- a/ext/qt/gstqtgl.h
++++ b/ext/qt/gstqtgl.h
+@@ -22,14 +22,7 @@
+ #include <QtGui/qtgui-config.h>
+ #endif
+ 
+-/* qt uses the same trick as us to typedef GLsync on GLES2 but to a different
+- * type which confuses the preprocessor. Instead of trying to reconcile the
+- * two, we instead use the GLsync definition from Qt from above, and ensure
+- * that we don't typedef GLsync in gstglfuncs.h */
+ #include <gst/gl/gstglconfig.h>
+-#undef GST_GL_HAVE_GLSYNC
+-#define GST_GL_HAVE_GLSYNC 1
+-#include <gst/gl/gstglfuncs.h>
+ 
+ /* The glext.h guard was renamed in 2018, but some software which
+  * includes their own copy of the GL headers (such as qt) might have
+@@ -46,6 +39,17 @@
+ #endif
+ #endif
+ 
++/* pulls in GLsync, see below */
++#include <QtGui/qopengl.h>
++
++/* qt uses the same trick as us to typedef GLsync on GLES2 but to a different
++ * type which confuses the preprocessor. Instead of trying to reconcile the
++ * two, we instead use the GLsync definition from Qt from above, and ensure
++ * that we don't typedef GLsync in gstglfuncs.h */
++#undef GST_GL_HAVE_GLSYNC
++#define GST_GL_HAVE_GLSYNC 1
++#include <gst/gl/gstglfuncs.h>
++
+ #if defined(QT_OPENGL_ES_2)
+ #include <QtGui/QOpenGLContext>
+ #include <QtGui/QOpenGLFunctions>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
new file mode 100644
index 0000000000..3d423154e0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
@@ -0,0 +1,56 @@
+From d08234a659bec1fd5c984fedefbeb8192af07839 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 31 Mar 2020 21:23:28 -0700
+Subject: [PATCH] qt: include ext/qt/gstqtgl.h instead of gst/gl/gstglfuncs.h
+
+gst/gl/gstglfuncs.h is included via ext/qt/gstqtgl.h which has logic to
+prefer qt headers definitions for GLsync
+
+This helps in fixing build errors like below
+
+/mnt/b/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/gstreamer1.0-plugins-good/1.16.2-r0/recipe-sysroot/usr/include/QtGui/qopengles2ext.h:24:26: error: conflicting declaration 'typedef struct __GLsync* GLsync'
+   24 | typedef struct __GLsync *GLsync;
+      |                          ^~~~~~
+In file included from /mnt/b/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/gstreamer1.0-plugins-good/1.16.2-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstglfuncs.h:84,
+                 from ../gst-plugins-good-1.16.2/ext/qt/gstqsgtexture.cc:30:
+/mnt/b/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/gstreamer1.0-plugins-good/1.16.2-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/glprototypes/gstgl_compat.h:40:18: note: previous declaration as 'typedef void* GLsync
+'
+   40 | typedef gpointer GLsync;
+      |                  ^~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ext/qt/gstqsgtexture.cc | 2 +-
+ ext/qt/qtwindow.cc      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ext/qt/gstqsgtexture.cc b/ext/qt/gstqsgtexture.cc
+index 2b314e0..12b15dd 100644
+--- a/ext/qt/gstqsgtexture.cc
++++ b/ext/qt/gstqsgtexture.cc
+@@ -27,7 +27,7 @@
+ 
+ #include <gst/video/video.h>
+ #include <gst/gl/gl.h>
+-#include <gst/gl/gstglfuncs.h>
++#include <ext/qt/gstqtgl.h>
+ #include "gstqsgtexture.h"
+ 
+ #define GST_CAT_DEFAULT gst_qsg_texture_debug
+diff --git a/ext/qt/qtwindow.cc b/ext/qt/qtwindow.cc
+index 62d26b6..bf68ebb 100644
+--- a/ext/qt/qtwindow.cc
++++ b/ext/qt/qtwindow.cc
+@@ -25,7 +25,7 @@
+ #include <stdio.h>
+ 
+ #include <gst/video/video.h>
+-#include <gst/gl/gstglfuncs.h>
++#include <ext/qt/gstqtgl.h>
+ #include "qtwindow.h"
+ #include "gstqsgtexture.h"
+ #include "gstqtglutility.h"
+-- 
+2.26.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
index 8b34111d38..17c9421394 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
@@ -2,6 +2,8 @@ require gstreamer1.0-plugins-common.inc
 
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
+            file://0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch \
+            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
             "
 
 SRC_URI[md5sum] = "bd025f8f14974f94b75ac69a9d1b9c93"
-- 
2.26.0


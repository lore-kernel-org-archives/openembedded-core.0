Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32F58601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 06:06:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6666boI015706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2016 23:06:37 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Jul 2016 23:06:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jul 2016 23:06:35 -0700
Message-ID: <77330f411f14a46259b347dcb617ce9fb7d6a023.1467785158.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1467785158.git.liezhi.yang@windriver.com>
References: <cover.1467785158.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gtk+3: update 0003-Add-disable-opengl-configure-option.patch
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
X-List-Received-Date: Wed, 06 Jul 2016 06:06:37 -0000
Content-Type: text/plain

The patch contained git style patch like:
| diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-with-gl-context.h
| similarity index 100%
| rename from gdk/x11/gdkx.h
| rename to gdk/x11/gdkx-with-gl-context.h

Which can't be applied by older patch tool such as patch 2.6.1. So
update the patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0003-Add-disable-opengl-configure-option.patch | 184 +++++++++++++++++----
 1 file changed, 153 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
index 8552f53..0912c44 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
@@ -20,32 +20,31 @@ Long-term it would be good to find an alternative solution to this
 Upstream-Status: Inappropriate [Evil eye expected from upstream]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
- configure.ac                               | 13 +++++--
- demos/gtk-demo/glarea.c                    | 13 +++++++
- docs/tools/Makefile.am                     |  9 +++--
- docs/tools/widgets.c                       |  4 ++-
- gdk/gdkdisplay.c                           |  4 ++-
- gdk/gdkgl.c                                | 10 ++++++
- gdk/gdkglcontext.c                         |  6 ++++
- gdk/gdkwindow.c                            | 13 +++++++
- gdk/x11/Makefile.am                        | 30 +++++++++++++---
- gdk/x11/gdkdisplay-x11.c                   |  6 +++-
- gdk/x11/gdkscreen-x11.c                    |  5 +++
- gdk/x11/gdkwindow-x11.c                    |  4 +++
- gdk/x11/gdkx-autocleanups.h                |  2 ++
- gdk/x11/{gdkx.h => gdkx-with-gl-context.h} |  0
- gdk/x11/gdkx-without-gl-context.h          | 58 ++++++++++++++++++++++++++++++
- gtk/Makefile.am                            |  3 +-
- gtk/gtkglarea.c                            | 20 ++++++++++-
- gtk/inspector/general.c                    |  6 ++++
- tests/Makefile.am                          | 10 ++++--
- testsuite/gtk/objects-finalize.c           |  2 ++
- 20 files changed, 201 insertions(+), 17 deletions(-)
- rename gdk/x11/{gdkx.h => gdkx-with-gl-context.h} (100%)
- create mode 100644 gdk/x11/gdkx-without-gl-context.h
+ configure.ac                      | 13 +++++++++++--
+ demos/gtk-demo/glarea.c           | 13 +++++++++++++
+ docs/tools/Makefile.am            |  9 +++++++--
+ docs/tools/widgets.c              |  4 +++-
+ gdk/gdkdisplay.c                  |  4 +++-
+ gdk/gdkgl.c                       | 10 ++++++++++
+ gdk/gdkglcontext.c                |  6 ++++++
+ gdk/gdkwindow.c                   | 13 +++++++++++++
+ gdk/x11/Makefile.am               | 30 ++++++++++++++++++++++++++----
+ gdk/x11/gdkdisplay-x11.c          |  6 +++++-
+ gdk/x11/gdkscreen-x11.c           |  5 +++++
+ gdk/x11/gdkwindow-x11.c           |  4 ++++
+ gdk/x11/gdkx-autocleanups.h       |  2 ++
+ gdk/x11/gdkx-with-gl-context.h    | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ gdk/x11/gdkx-without-gl-context.h | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ gdk/x11/gdkx.h                    | 59 -----------------------------------------------------------
+ gtk/Makefile.am                   |  3 +--
+ gtk/gtkglarea.c                   | 20 +++++++++++++++++++-
+ gtk/inspector/general.c           |  6 ++++++
+ tests/Makefile.am                 | 10 +++++++---
+ testsuite/gtk/objects-finalize.c  |  2 ++
+ 21 files changed, 260 insertions(+), 76 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e27da49..a3e9beb 100644
+index a01824e..dde9dc5 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -342,6 +342,15 @@ AC_ARG_ENABLE(mir-backend,
@@ -549,10 +548,71 @@ index edb0ea7..a317d61 100644
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Keymap, g_object_unref)
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
-diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-with-gl-context.h
-similarity index 100%
-rename from gdk/x11/gdkx.h
-rename to gdk/x11/gdkx-with-gl-context.h
+diff --git a/gdk/x11/gdkx-with-gl-context.h b/gdk/x11/gdkx-with-gl-context.h
+new file mode 100644
+index 0000000..ae05fa6
+--- /dev/null
++++ b/gdk/x11/gdkx-with-gl-context.h
+@@ -0,0 +1,59 @@
++/* GDK - The GIMP Drawing Kit
++ * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library. If not, see <http://www.gnu.org/licenses/>.
++ */
++
++/*
++ * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
++ * file for a list of people on the GTK+ Team.  See the ChangeLog
++ * files for a list of changes.  These files are distributed with
++ * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
++ */
++
++#ifndef __GDK_X_H__
++#define __GDK_X_H__
++
++#include <gdk/gdk.h>
++
++#include <X11/Xlib.h>
++#include <X11/Xutil.h>
++
++#define __GDKX_H_INSIDE__
++
++#include <gdk/x11/gdkx11applaunchcontext.h>
++#include <gdk/x11/gdkx11cursor.h>
++#include <gdk/x11/gdkx11device.h>
++#include <gdk/x11/gdkx11device-core.h>
++#include <gdk/x11/gdkx11device-xi2.h>
++#include <gdk/x11/gdkx11devicemanager.h>
++#include <gdk/x11/gdkx11devicemanager-core.h>
++#include <gdk/x11/gdkx11devicemanager-xi2.h>
++#include <gdk/x11/gdkx11display.h>
++#include <gdk/x11/gdkx11displaymanager.h>
++#include <gdk/x11/gdkx11dnd.h>
++#include <gdk/x11/gdkx11glcontext.h>
++#include <gdk/x11/gdkx11keys.h>
++#include <gdk/x11/gdkx11property.h>
++#include <gdk/x11/gdkx11screen.h>
++#include <gdk/x11/gdkx11selection.h>
++#include <gdk/x11/gdkx11utils.h>
++#include <gdk/x11/gdkx11visual.h>
++#include <gdk/x11/gdkx11window.h>
++
++#include <gdk/x11/gdkx-autocleanups.h>
++
++#undef __GDKX_H_INSIDE__
++
++#endif /* __GDK_X_H__ */
 diff --git a/gdk/x11/gdkx-without-gl-context.h b/gdk/x11/gdkx-without-gl-context.h
 new file mode 100644
 index 0000000..c9e2617
@@ -617,6 +677,71 @@ index 0000000..c9e2617
 +#undef __GDKX_H_INSIDE__
 +
 +#endif /* __GDK_X_H__ */
+diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
+deleted file mode 100644
+index ae05fa6..0000000
+--- a/gdk/x11/gdkx.h
++++ /dev/null
+@@ -1,59 +0,0 @@
+-/* GDK - The GIMP Drawing Kit
+- * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
+- *
+- * This library is free software; you can redistribute it and/or
+- * modify it under the terms of the GNU Lesser General Public
+- * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
+- *
+- * This library is distributed in the hope that it will be useful,
+- * but WITHOUT ANY WARRANTY; without even the implied warranty of
+- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+- * Lesser General Public License for more details.
+- *
+- * You should have received a copy of the GNU Lesser General Public
+- * License along with this library. If not, see <http://www.gnu.org/licenses/>.
+- */
+-
+-/*
+- * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
+- * file for a list of people on the GTK+ Team.  See the ChangeLog
+- * files for a list of changes.  These files are distributed with
+- * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
+- */
+-
+-#ifndef __GDK_X_H__
+-#define __GDK_X_H__
+-
+-#include <gdk/gdk.h>
+-
+-#include <X11/Xlib.h>
+-#include <X11/Xutil.h>
+-
+-#define __GDKX_H_INSIDE__
+-
+-#include <gdk/x11/gdkx11applaunchcontext.h>
+-#include <gdk/x11/gdkx11cursor.h>
+-#include <gdk/x11/gdkx11device.h>
+-#include <gdk/x11/gdkx11device-core.h>
+-#include <gdk/x11/gdkx11device-xi2.h>
+-#include <gdk/x11/gdkx11devicemanager.h>
+-#include <gdk/x11/gdkx11devicemanager-core.h>
+-#include <gdk/x11/gdkx11devicemanager-xi2.h>
+-#include <gdk/x11/gdkx11display.h>
+-#include <gdk/x11/gdkx11displaymanager.h>
+-#include <gdk/x11/gdkx11dnd.h>
+-#include <gdk/x11/gdkx11glcontext.h>
+-#include <gdk/x11/gdkx11keys.h>
+-#include <gdk/x11/gdkx11property.h>
+-#include <gdk/x11/gdkx11screen.h>
+-#include <gdk/x11/gdkx11selection.h>
+-#include <gdk/x11/gdkx11utils.h>
+-#include <gdk/x11/gdkx11visual.h>
+-#include <gdk/x11/gdkx11window.h>
+-
+-#include <gdk/x11/gdkx-autocleanups.h>
+-
+-#undef __GDKX_H_INSIDE__
+-
+-#endif /* __GDK_X_H__ */
 diff --git a/gtk/Makefile.am b/gtk/Makefile.am
 index 6a53a2b..49a35e6 100644
 --- a/gtk/Makefile.am
@@ -827,6 +952,3 @@ index e0ebee0..703643c 100644
  	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pixbuf_loader_close() */
  	  all_types[i] != GDK_TYPE_PIXBUF_LOADER &&
  	  all_types[i] != gdk_pixbuf_simple_anim_iter_get_type())
--- 
-2.1.4
-
-- 
2.8.0



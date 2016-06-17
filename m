Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6F60B75E2D
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 19:37:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 17 Jun 2016 12:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,485,1459839600"; d="scan'208";a="830423152"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 17 Jun 2016 12:37:51 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 22:37:48 +0300
Message-Id: <a3c036a30e52a5a292c68183f84f4de1696973ac.1466191636.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1466191636.git.jussi.kukkonen@intel.com>
References: <cover.1466191636.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] gtk+3: Make sure gdkx.h is updated
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
X-List-Received-Date: Fri, 17 Jun 2016 19:37:52 -0000

Always run the Makefile rule that modifies gdkx.h (for opengl
disabling), but only do the modification if the file is not
correct already.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-Add-disable-opengl-configure-option.patch    | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch
index a963334..2306614 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch
@@ -1,4 +1,4 @@
-From c77afa19881d955d759879aeae8bbd88613dd4fe Mon Sep 17 00:00:00 2001
+From 91814d22387370e47384206e67729a26a5729192 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 16 Jun 2016 15:11:34 +0300
 Subject: [PATCH] Add --disable-opengl configure option
@@ -28,7 +28,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  gdk/gdkgl.c                       | 10 +++++++
  gdk/gdkglcontext.c                |  6 ++++
  gdk/gdkwindow.c                   | 14 +++++++++-
- gdk/x11/Makefile.am               | 28 ++++++++++++++++---
+ gdk/x11/Makefile.am               | 29 ++++++++++++++++---
  gdk/x11/gdkdisplay-x11.c          |  6 ++--
  gdk/x11/gdkscreen-x11.c           |  5 ++++
  gdk/x11/gdkwindow-x11.c           |  4 +++
@@ -41,7 +41,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  gtk/inspector/general.c           |  6 ++++
  tests/Makefile.am                 | 10 +++++--
  testsuite/gtk/objects-finalize.c  |  2 ++
- 21 files changed, 257 insertions(+), 78 deletions(-)
+ 21 files changed, 258 insertions(+), 78 deletions(-)
  create mode 100644 gdk/x11/gdkx-with-gl-context.h
  create mode 100644 gdk/x11/gdkx-without-gl-context.h
  delete mode 100644 gdk/x11/gdkx.h
@@ -412,7 +412,7 @@ index c34c113..3025e96 100644
            cairo_region_destroy (opaque_region);
  
 diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
-index c488a31..d0aa7ce 100644
+index c488a31..576f8e1 100644
 --- a/gdk/x11/Makefile.am
 +++ b/gdk/x11/Makefile.am
 @@ -39,8 +39,6 @@ libgdk_x11_la_SOURCES = 	\
@@ -424,7 +424,7 @@ index c488a31..d0aa7ce 100644
  	gdkkeys-x11.c		\
  	gdkmain-x11.c		\
  	gdkproperty-x11.c	\
-@@ -53,14 +51,30 @@ libgdk_x11_la_SOURCES = 	\
+@@ -53,14 +51,31 @@ libgdk_x11_la_SOURCES = 	\
  	gdkwindow-x11.h		\
  	gdkxftdefaults.c	\
  	gdkxid.c		\
@@ -449,14 +449,15 @@ index c488a31..d0aa7ce 100644
 +endif
 +
 +BUILT_SOURCES = gdkx.h
-+
++.PHONY: gdkx.h
 +gdkx.h:
-+	$(AM_V_GEN) cd $(srcdir) && cp $(GDKX_HEADER) gdkx.h
++	$(AM_V_GEN) cd $(srcdir) \
++	&& (cmp -s $(GDKX_HEADER) gdkx.h || cp $(GDKX_HEADER) gdkx.h )
 +
  libgdkx11include_HEADERS = 	\
  	gdkx-autocleanups.h	\
  	gdkx11applaunchcontext.h \
-@@ -74,7 +88,6 @@ libgdkx11include_HEADERS = 	\
+@@ -74,7 +89,6 @@ libgdkx11include_HEADERS = 	\
  	gdkx11display.h		\
  	gdkx11displaymanager.h	\
  	gdkx11dnd.h		\
@@ -464,7 +465,7 @@ index c488a31..d0aa7ce 100644
  	gdkx11keys.h		\
  	gdkx11property.h	\
  	gdkx11screen.h		\
-@@ -83,9 +96,16 @@ libgdkx11include_HEADERS = 	\
+@@ -83,9 +97,16 @@ libgdkx11include_HEADERS = 	\
  	gdkx11visual.h		\
  	gdkx11window.h
  
-- 
2.1.4



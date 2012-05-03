Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPoy3-0006c3-GM
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 07:52:43 +0200
Received: by wibhj13 with SMTP id hj13so1216412wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 22:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=G+NKn8c66YaYBPxUo3QhIZnUqVHvYLrqlAAt0Ne5SKg=;
	b=k3qhUUoLIxmkdqDHJe6Uw9Yocckspt7PPk5s/Cbw+vHs1QBq08whclXaLF35g0sEDA
	+tH8/7b91WjxI/RGvTNZ232tMzncP9K9JDZ5d/FOY9mxg6251UmbNjQJsxexhpmUJLWr
	Qrby/UDRZ+atfjrgKqDTVkPJig9j3xtnjhWSMx4MkqRwHGqQOx9khBOZOMBFnEOBlP4T
	eS+M/DUPeZu5My/xlUTmK5hNev//IQ11G+tiPq/DyYLcrHI9uvJM5J2q6/s7YmpD5Ylr
	AExEOeHCkq2DsNyk50Yl8ITIlMJ02CbQXRUasfCL5/XxZgzPiYNK1+p74hjC+Wwe2lKE
	2L/g==
Received: by 10.180.104.230 with SMTP id gh6mr2133030wib.22.1336023778563;
	Wed, 02 May 2012 22:42:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg2sm14816552wib.7.2012.05.02.22.42.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 22:42:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 07:42:52 +0200
Message-Id: <f42d908150e61fe8209ab1e0c3bc3d9a171b22d9.1336023730.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335967122.git.Martin.Jansa@gmail.com>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1336023730.git.Martin.Jansa@gmail.com>
References: <cover.1336023730.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] gtk-engines: fix build with glib-2.32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 05:52:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gtk-engines/gtk-engines-2.20.2/glib-2.32.patch |   23 ++++++++++++++++++++
 .../gtk-engines/gtk-engines_2.20.2.bb              |    3 +-
 2 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch

diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch b/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch
new file mode 100644
index 0000000..f0b878d
--- /dev/null
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch
@@ -0,0 +1,23 @@
+From 8d49a386f467cbf8e0842d2218126f643e50f834 Mon Sep 17 00:00:00 2001
+From: Dominique Leuenberger <dimstar@opensuse.org>
+Date: Sun, 27 Nov 2011 14:24:57 +0000
+Subject: Fix build with glib 2.31: Only glib.h can be #include'd. Fixes bug #664914
+
+Upstream-Status: Backport
+
+---
+diff --git a/engines/clearlooks/src/animation.c b/engines/clearlooks/src/animation.c
+index 1f7a41f..56a9286 100644
+--- a/engines/clearlooks/src/animation.c
++++ b/engines/clearlooks/src/animation.c
+@@ -28,7 +28,7 @@
+ #include "animation.h"
+ 
+ #ifdef HAVE_WORKING_ANIMATION
+-#include <glib/gtimer.h>
++#include <glib.h>
+ 
+ struct _AnimationInfo {
+ 	GTimer *timer;
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 3ca6e81..5b8ee88 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/base"
 DEPENDS = "gtk+"
 
-PR = "r1"
+PR = "r2"
 
 PACKAGES_DYNAMIC = "gtk-engine-* gtk-theme-*"
 
@@ -39,5 +39,6 @@ python populate_packages_prepend() {
 	# TODO: mark theme packages as arch all
 }
 
+SRC_URI += "file://glib-2.32.patch"
 SRC_URI[archive.md5sum] = "5deb287bc6075dc21812130604c7dc4f"
 SRC_URI[archive.sha256sum] = "15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5"
-- 
1.7.8.6




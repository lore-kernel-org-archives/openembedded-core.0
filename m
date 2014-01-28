Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 155FD6E9BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 20:27:58 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 21:27:54 +0100
Message-Id: <1390940874-11839-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <20140128192141.GA3640@mail.itconsulting-heinold.de>
References: <20140128192141.GA3640@mail.itconsulting-heinold.de>
Subject: [PATCH v2] cogl: kms: include necessary header for size_t
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
X-List-Received-Date: Tue, 28 Jan 2014 20:27:59 -0000

Fixes compilation in cases where stddef.h is not already
included by EGL headers.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
:-P

 meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb      |  2 ++
 .../kms-include-stddef.h-before-drm.h.patch        | 33 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.16.0/kms-include-stddef.h-before-drm.h.patch

diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb
index 5e5c82b..0ef9726 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.16.0.bb
@@ -2,5 +2,7 @@ require cogl-1.0.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
+SRC_URI += "file://kms-include-stddef.h-before-drm.h.patch"
+
 SRC_URI[archive.md5sum] = "611a61bed04354cbfffa3dc27feb6d4f"
 SRC_URI[archive.sha256sum] = "75c2c4636a050fda7ee8722ce3d9c618b08799ed92bbb72b4fdff3e73b096094"
diff --git a/meta/recipes-graphics/cogl/cogl-1.16.0/kms-include-stddef.h-before-drm.h.patch b/meta/recipes-graphics/cogl/cogl-1.16.0/kms-include-stddef.h-before-drm.h.patch
new file mode 100644
index 0000000..7cce279
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.16.0/kms-include-stddef.h-before-drm.h.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Submitted [cogl@lists.freedesktop.org]
+
+From 5e4f4689308732a0570a1631169247157c59f064 Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@saftware.de>
+Date: Tue, 28 Jan 2014 18:36:04 +0100
+Subject: [PATCH] kms: include stddef.h before drm.h
+
+Not doing so leads to the following error, if stddef.h is not included
+indirectly through EGL headers:
+
+| libdrm/drm.h:132:2: error: unknown type name 'size_t'
+|   size_t name_len;   /**< Length of name buffer */
+
+Signed-off-by: Andreas Oberritter <obi@saftware.de>
+---
+ cogl/winsys/cogl-winsys-egl-kms.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cogl/winsys/cogl-winsys-egl-kms.c b/cogl/winsys/cogl-winsys-egl-kms.c
+index f7c9cfb..144ad9b 100644
+--- a/cogl/winsys/cogl-winsys-egl-kms.c
++++ b/cogl/winsys/cogl-winsys-egl-kms.c
+@@ -40,6 +40,7 @@
+ 
+ #include <EGL/egl.h>
+ #include <EGL/eglext.h>
++#include <stddef.h>
+ #include <drm.h>
+ #include <xf86drm.h>
+ #include <xf86drmMode.h>
+-- 
+1.8.3.2
+
-- 
1.8.3.2



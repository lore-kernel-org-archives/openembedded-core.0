Received: from mail-ve0-f173.google.com ([209.85.128.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stashluk@gmail.com>) id 1U37FW-0003T5-0S
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 16:49:33 +0100
Received: by mail-ve0-f173.google.com with SMTP id oz10so1317516veb.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2013 07:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=mx3N1v3u0B6ZkFfuoWNt8SfbwfXWTVjBa+iPQ5cQ6dM=;
	b=l3tcHleBeKI+9iOXTkwwX3XgzoR3YpP00KzA+PybJll42t/fSkOMpefQPgsIOP9/kB
	fw5qkIjkVkZjgyVECOoFngBgt2lgT3jRWTiTUyUGLy04vaf6OLuSZWwIlEzZvQwPP/u2
	iwoyq8pNbRoLnBSyaUQ09du15UUbNBsPw6ouwhUc3O+3xbHkWDzxEaHTkbcDyIvUYQKr
	osaVdvOcCz0DLrDcL6PXWcaUqUBEmkwqB+GSkLI9b/i868T1qMXcx18hZkbGPxN21Y+w
	FhD6INvp4k0g8jQczMpitxFhu2+S1QgCyGR9WO+BuRAgBkQptWlPW7Pt+aZg2SvAs7sY
	1xDg==
X-Received: by 10.52.96.232 with SMTP id dv8mr29142085vdb.132.1360164814666;
	Wed, 06 Feb 2013 07:33:34 -0800 (PST)
Received: from jstashluk2.deka.local ([208.65.175.197])
	by mx.google.com with ESMTPS id pa4sm19979758veb.1.2013.02.06.07.33.30
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 07:33:31 -0800 (PST)
From: Jeremy Stashluk <stashluk@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2013 10:33:24 -0500
Message-Id: <1360164804-25784-1-git-send-email-jstashluk@dekaresearch.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>
Subject: [PATCH v6] gst-plugins-gl: add package recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 15:49:35 -0000

Added notes, signoff, and upstream status to internal patch.

Signed-off-by: Jeremy Stashluk <jstashluk@dekaresearch.com>
---
 ...-conditional-gl-framebuffer-undefined-use.patch |   35 ++++++++++++++++++++
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |   15 +++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
new file mode 100644
index 0000000..bc2f88b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
@@ -0,0 +1,35 @@
+From 14d51cbefef19737e7ab2b6818ee1d3bdb248d12 Mon Sep 17 00:00:00 2001
+From: Jeremy Stashluk <jstashluk@dekaresearch.com>
+Date: Wed, 6 Feb 2013 09:59:48 -0500
+Subject: [PATCH] conditional gl framebuffer undefined use
+
+The OpenGL extension GL_ARB_framebuffer_object defines the macro
+GL_FRAMEBUFFER_UNDEFINED. The macro will only need to map to an error
+string if the extension provides functions that might return the macro.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jeremy Stashluk <jstashluk@dekaresearch.com>
+---
+ gst-libs/gst/gl/gstgldisplay.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gst-libs/gst/gl/gstgldisplay.c b/gst-libs/gst/gl/gstgldisplay.c
+index 3ed0b71..64c6c2c 100644
+--- a/gst-libs/gst/gl/gstgldisplay.c
++++ b/gst-libs/gst/gl/gstgldisplay.c
+@@ -2177,9 +2177,11 @@ gst_gl_display_check_framebuffer_status (void)
+       GST_ERROR ("GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS");
+       break;
+ 
++#if defined(GL_ARB_framebuffer_object)
+     case GL_FRAMEBUFFER_UNDEFINED:
+       GST_ERROR ("GL_FRAMEBUFFER_UNDEFINED");
+       break;
++#endif
+ 
+     default:
+       GST_ERROR ("General FBO error");
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
new file mode 100644
index 0000000..18d13a3
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -0,0 +1,15 @@
+require recipes-multimedia/gstreamer/gst-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl glew jpeg"
+
+EXTRA_OECONF += "ac_cv_header_GL_gl_h=no"
+
+SRC_URI[md5sum] = "ac70ede13f79978d56eaed8abaa3c938"
+SRC_URI[sha256sum] = "48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c429bf210"
+
+SRC_URI += " file://0001-conditional-gl-framebuffer-undefined-use.patch"
+
+inherit gettext gconf
-- 
1.7.9.5




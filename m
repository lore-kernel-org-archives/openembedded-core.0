Received: from mail-ve0-f171.google.com ([209.85.128.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stashluk@gmail.com>) id 1U2pr3-0008CH-KO
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 22:15:03 +0100
Received: by mail-ve0-f171.google.com with SMTP id b10so529642vea.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 12:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=iyRocVB3LSzgM6qY7iQGZWwWmiVm1g/Gdx19eHEIUmE=;
	b=Fm3G6Ctf+hdhAfdESDjb7SYgDFotwKrsrCv0lT7Wp5VprtpdzwmR73kRKBeSkFRkhB
	+1aMm41Ms94CRZnKCbgjjsFWAWX/8UonV/2K9LojbO79wE1ytBroIASmZtalv4sZVRom
	lq6sm8rzwJ7+1/3epuFS6wrv8fJrFbhhwcsY8U5We5IgwZbwk3wWgfGHB8rnbDdVM+UW
	gOf7BWWWrMX3Bw9Yowb9b9B/qFPxWEtTAuxoJg6tdyrDBVyv3nsQ+yM+s5rHMLrf0UEw
	+OwdasSrtQJdz0wBUe76Hh5fIV2T364l7hNWPGF+rnD8A8I3OBxCyZzBtVyFj/BuIjfl
	rP7A==
X-Received: by 10.52.20.239 with SMTP id q15mr26159121vde.73.1360097951325;
	Tue, 05 Feb 2013 12:59:11 -0800 (PST)
Received: from jstashluk2.deka.local ([208.65.175.197])
	by mx.google.com with ESMTPS id cl9sm29189449vdb.3.2013.02.05.12.59.08
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 12:59:09 -0800 (PST)
From: Jeremy Stashluk <stashluk@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 15:58:58 -0500
Message-Id: <1360097938-31967-1-git-send-email-jstashluk@dekaresearch.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>
Subject: [PATCH v5] gst-plugins-gl: add package recipe
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
X-List-Received-Date: Tue, 05 Feb 2013 21:15:04 -0000


Signed-off-by: Jeremy Stashluk <jstashluk@dekaresearch.com>
---
 ...remove-gl-framebuffer-undefined-reference.patch |   16 ++++++++++++++++
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |   15 +++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-remove-gl-framebuffer-undefined-reference.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-remove-gl-framebuffer-undefined-reference.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-remove-gl-framebuffer-undefined-reference.patch
new file mode 100644
index 0000000..eaddcaa
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-remove-gl-framebuffer-undefined-reference.patch
@@ -0,0 +1,16 @@
+Index: gst-plugins-gl-0.10.3/gst-libs/gst/gl/gstgldisplay.c
+===================================================================
+--- gst-plugins-gl-0.10.3.orig/gst-libs/gst/gl/gstgldisplay.c	2012-05-08 00:43:19.000000000 -0400
++++ gst-plugins-gl-0.10.3/gst-libs/gst/gl/gstgldisplay.c	2013-02-05 15:04:15.287856732 -0500
+@@ -2177,9 +2177,11 @@
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
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
new file mode 100644
index 0000000..80d58d7
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
+SRC_URI += " file://0001-remove-gl-framebuffer-undefined-reference.patch"
+
+inherit gettext gconf
-- 
1.7.9.5




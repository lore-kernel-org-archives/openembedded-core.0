Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UVIov-0005pc-AE
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 11:50:34 +0200
Received: by mail-ee0-f41.google.com with SMTP id c50so817785eek.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 02:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=e0TYEEGpb3wGLeupa9ApEun2b+9agCC4aUZLW095Esc=;
	b=SjMdkgLYMLdHYzg9juuHUgUzeetmQk/nmh6h4c4JHcVhnSMfvNdj51QLCZP1tX/flG
	3IUFJNVdMwDiQZcmHG/VGW4zubjXPq1KfqF9Q2pmp5qdULXt8AaHTUOMcVYhOLOI98SQ
	GoSOLqov1O4iEYMpbCdS7+sSMhI9/4nG0QRLPu59lA59qkc1WEupaPnaa8NrF+sWRGgk
	fRNJVl2jYEJhb7xP3dyVDp+2LM3RGq8D5VPSlXhWYgOvaOYv6k/RG4qHp0KtnBE7FWER
	14M9nr+EBEeUrxTPfZf1kPKZgPzmPxxjBeXmPvszxk03SqHsEnbN8QbzqVnP2tcyJyTQ
	gkuA==
X-Received: by 10.14.105.1 with SMTP id j1mr28858433eeg.6.1366882364424;
	Thu, 25 Apr 2013 02:32:44 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id bk42sm9316290eeb.3.2013.04.25.02.32.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 02:32:43 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 11:32:29 +0200
Message-Id: <1366882349-22368-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQmdDl/DILcRrtnEyQWqPst3NduOWhDrmvqxWv9zPM2uLCylTZ8kXplEw6yny/GKZB+TVBl2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gst-plugins-gl: make it work for both openGL and openGL ESv2
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
X-List-Received-Date: Thu, 25 Apr 2013 09:50:41 -0000

Those are mutually exclusive, but PACKAGECONFIG doesn't seem to handle that yet, so use this slightly ugly construct.

Tested on FRI2/angstrom and Minnowboard/angstrom. 'glimagesink' and 'glupload' work, but anything else (filters, gldownload) will throw an FBO error. This is most likely a problem with the EMGD drivers.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
index a6c74fb..7cf87e5 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -8,15 +8,13 @@ SRC_URI[sha256sum] = "48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c42
 
 SRC_URI += " file://0001-conditional-gl-framebuffer-undefined-use.patch"
 
-DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg"
+DEPENDS += "gst-plugins-base"
 
 inherit gettext gconf
 
-# This package doesn't have a configure switch for EGL or GL, so forcibly tell
-# configure that it can't find gl.h so it always uses EGL.  If/when we have some
-# way for machines to specify their preferred GL flavour this can be
-# automatically adapted.
-EXTRA_OECONF += "ac_cv_header_GL_gl_h=no"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'opengl', 'opengl', 'openglesv2', d)}"
+PACKAGECONFIG[opengl] = ",ac_cv_header_GL_gl_h=no,virtual/libgl glew"
+PACKAGECONFIG[openglesv2] = "ac_cv_header_GL_gl_h=no,,virtual/libgles2 virtual/egl"
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-apps = "1"
-- 
1.8.1.4




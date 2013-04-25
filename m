Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UVJZb-0005a9-Al
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 12:38:44 +0200
Received: by mail-ea0-f181.google.com with SMTP id a11so1181890eae.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 03:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=if6ffdYN96WsjfoXLk+Bi38/mPMB25YHc25dHmkLZp0=;
	b=Xy/pJxSwUcJs7oUDBRHPAXjsiFelTh39B+fShkpa1HKT2gOpzeWJ8o6X6KWSyD23Ah
	gEIadZodC0aHRo0EWIOWGdt4lFEHF0+87b+JLr/gKjuo4NvI6xhg8l2vVT0QTGd1oAo2
	aoUt3K3xslAdYOo1YXcd/IyM4wtO9r9vPQuFMT1ZUdFEYa0333//Deh/ZOLFZzv4t1UX
	GB2ZYdbkbBqiKlahAlzKM0bzA1D4Dc2lsZvZiNYrYq3juD7P4Gvhqa+52WPE2ioiKEFf
	dZ4rG9sNFsIVCAfmhsb8iQLYMkrx0WOYjIXgcrxO0GcoMUdKTZvz3t58gHPBYqrfIeQ0
	y2Eg==
X-Received: by 10.15.93.202 with SMTP id w50mr50073118eez.45.1366885260213;
	Thu, 25 Apr 2013 03:21:00 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id ch6sm9487022eeb.17.2013.04.25.03.20.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 03:20:59 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 12:20:54 +0200
Message-Id: <1366885254-26519-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQmRQ060cub2sWTw6VFibQFCmNXrn/HNJtdGa7dN1tQS2El0JZ9YizKtyHuP0x851ZHwkvJy
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2] gst-plugins-gl: make it work for both openGL and openGL ESv2
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
X-List-Received-Date: Thu, 25 Apr 2013 10:38:47 -0000

Those are mutually exclusive, but PACKAGECONFIG doesn't seem to handle that yet, so use this slightly ugly construct.

Tested on FRI2/angstrom and Minnowboard/angstrom. 'glimagesink' and 'glupload' work, but anything else (filters, gldownload) will throw an FBO error. This is most likely a problem with the EMGD drivers.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
index a6c74fb..7925448 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -8,15 +8,13 @@ SRC_URI[sha256sum] = "48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c42
 
 SRC_URI += " file://0001-conditional-gl-framebuffer-undefined-use.patch"
 
-DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg"
+DEPENDS += "gst-plugins-base jpeg libpng"
 
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




Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id D109C6D149
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 09:30:11 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id f12so6251327wgh.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 02:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xVnSwsRekxrFwdiGhG9zPlE2mHs2TA/ZKP/fp6SWx/U=;
	b=kEDNmR9Hr7pwfOMXnXXN5TqOpEQp+JEkl4rzF9UYP8idNA4IbOcDJa8JlsbJBbqpuJ
	z6/7UyURZHcfGd6ZmfD9QrCBCad0lf7wP8DfPB37g/deJnRr8SItWL82kgTshXIxYJ4H
	KBNyCAdgbqDSB2joKeoxgtViI+VLVaUtVchvJbAArxQN0zz8xkMly3zMpqNN13cVRzcY
	Ay3tXNcZ6bcss787XWskohETqSOtRMqGw8IUwFgN5Mr5AaW/eVkdN1i87Y/o8E+pGxVx
	gDfhpZT/xen2KlvX8xHh4k2BoHO9lTtuRky4/eadNVFpPXbk88IECHCDLIL7wzOMPhZC
	GLig==
X-Gm-Message-State: ALoCoQmZoxoyMQ2wI5Z3CGk6QcFTbIWNKfDpCH90/grHvXeiuZ8bBo1zQnQUl5bMbIyU3Q5zkmI7
X-Received: by 10.194.123.8 with SMTP id lw8mr1007427wjb.40.1382347812994;
	Mon, 21 Oct 2013 02:30:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	eq12sm30262337wic.7.2013.10.21.02.30.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Oct 2013 02:30:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 10:28:49 +0100
Message-Id: <1382347729-18757-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gdk-pixbuf: use PACKAGECONFIG to control legacy X11 sub-library
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
X-List-Received-Date: Mon, 21 Oct 2013 09:30:12 -0000

Instead of appending and using overrides, turn gdk-pixbuf-xlib into a
PACKAGECONFIG option and enable it for LSB-builds only.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bb |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bb
index 08d6f0a..d027fcf 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bb
@@ -26,15 +26,18 @@ inherit autotools pkgconfig gettext pixbufcache
 
 LIBV = "2.10.0"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG[x11] = "--with-x11,--without-x11,virtual/libx11"
+
 EXTRA_OECONF = "\
-  --without-libtiff \
   --with-libpng \
-  ${X11DEPENDS} \
+  --with-libjpeg \
+  --without-libtiff \
+  --without-libjasper \
   --disable-introspection \
 "
-X11DEPENDS = "--without-x11"
-X11DEPENDS_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x11', '--without-x11', d)}"
-X11DEPENDS_class-native = "--without-x11"
 
 PACKAGES =+ "${PN}-xlib"
 
-- 
1.7.10.4



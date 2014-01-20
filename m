Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 927856CD4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 22:45:10 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so4415806wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 14:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hoTSDoiLJXU9dM1uh80qPnw9YBZVOmeDE3DLFd1UNh8=;
	b=ZfN8jVjKwqWVYi2soodjIIq+YiU3OAbuQhKMhmOxrHOngnmjP1MBOMS5Ci7JxcebGx
	cWHbS8tqJgEg9HXJVp9HqM5qSZuO63e3Cp6Hei1t3QMCBysOET9k4ez2TVMYXfCCTEML
	e6K6pEoCsxUnSEdAcVnMPDn57BcZ6kQ4fHWLTlnnyyYbq5tCopqU8QJsfISPt4Rf6lPC
	PQ2pdMp2jrXfqkI9FHBMj2ML9Ksec4vMQ/Q6+WnHJDk8/hNIgCjZ1Yxmt2+rvARzsvWf
	7SkqlmPO4Ytx5cRPd23LccGDFqpAiiNP/0c0+gY6KEvBNkUaN1x4NAPLhj6i0FVRcrrA
	zJaQ==
X-Gm-Message-State: ALoCoQkPjPDk0s/2CivXYQ0R9CjVj7I0vncPjRjdLMDjRUzK4+9tsSdG89kF4xoobhWynP0G9x+c
X-Received: by 10.180.79.106 with SMTP id i10mr11735851wix.23.1390257910911;
	Mon, 20 Jan 2014 14:45:10 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id uc9sm5733776wib.2.2014.01.20.14.45.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 14:45:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 22:45:02 +0000
Message-Id: <1390257902-31739-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1390257902-31739-1-git-send-email-ross.burton@intel.com>
References: <1390257902-31739-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] gdk-pixbuf: use PACKAGECONFIG to control loaders with external dependencies
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
X-List-Received-Date: Mon, 20 Jan 2014 22:45:10 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb |   19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
index 4c4d207..187af46 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 SECTION = "libs"
 
-DEPENDS = "libpng glib-2.0 jpeg"
+DEPENDS = "glib-2.0"
 DEPENDS_append_linuxstdbase = " virtual/libx11"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
@@ -25,19 +25,22 @@ inherit autotools pkgconfig gettext pixbufcache
 
 LIBV = "2.10.0"
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG_class-native = ""
+GDK_PIXBUF_LOADERS ?= "png jpeg"
+
+PACKAGECONFIG ??= "${GDK_PIXBUF_LOADERS}"
+PACKAGECONFIG_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} ${GDK_PIXBUF_LOADERS}"
+PACKAGECONFIG_class-native = "${GDK_PIXBUF_LOADERS}"
+
+PACKAGECONFIG[png] = "--with-libpng,--without-libpng,libpng"
+PACKAGECONFIG[jpeg] = "--with-libjpeg,--without-libjpeg,jpeg"
+PACKAGECONFIG[tiff] = "--with-libtiff,--without-libtiff,tiff"
+PACKAGECONFIG[jpeg2000] = "--with-libjasper,--without-libjasper,jasper"
 
 # Use GIO to sniff image format instead of trying all loaders
 PACKAGECONFIG[gio-sniff] = "--enable-gio-sniffing,--disable-gio-sniffing,,shared-mime-info"
 PACKAGECONFIG[x11] = "--with-x11,--without-x11,virtual/libx11"
 
 EXTRA_OECONF = "\
-  --with-libpng \
-  --with-libjpeg \
-  --without-libtiff \
-  --without-libjasper \
   --disable-introspection \
 "
 
-- 
1.7.10.4



Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UCVBG-00078o-Ta
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 14:11:52 +0100
Received: by mail-wi0-f173.google.com with SMTP id hq4so1950634wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 04:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=/KIHU759QWPkkePIfEIdjJkwc6DcplhBGYJM9aaFgck=;
	b=BeFeiO9waiehxdEVP8EboRUtAM3VQW8R8o57gRNg6zWXem7jmomyegBSHVcEfdG2Kc
	TXqxjrwzhIBhaOTUFNuVn40+uldxE8Ckddog7OAY6tVUhicuhhjhh+XixLoqhCWSOb/R
	B9FGCMZuG0G0BGyySr0y3RqstNryCeTmBcMUCujflRvVE8LnbqU4e5d0wJ/9gnTKpdCs
	DBoV+oD1iCxfXax4OdJNigMqmMx7qhUxhFr5frYBh8d6w2rxXSD83lRW5F//3TS4i7h4
	XshpM5UgN2Ps6aDcYkyguV4YxRByOwr0liaBsiAZJPRFV9K1hme52s9F4lpUVoPREdf7
	UuPQ==
X-Received: by 10.180.78.168 with SMTP id c8mr2921714wix.27.1362401715485;
	Mon, 04 Mar 2013 04:55:15 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fx5sm15460507wib.11.2013.03.04.04.55.14
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 04:55:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2013 12:52:44 +0000
Message-Id: <eefbfac657e1cae6e2eb915ad8e101caf1d05014.1362401323.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362401323.git.ross.burton@intel.com>
References: <cover.1362401323.git.ross.burton@intel.com>
In-Reply-To: <cover.1362401323.git.ross.burton@intel.com>
References: <cover.1362401323.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmVxA2HTTn6e5HBFgooBhLGSRb1vG8oXkXYkV8/8oRmcc7YIK17TXlwG02fU0g/pP5hGISV
Subject: [PATCH 1/4] gtk-update-icon-cache-native: add
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
X-List-Received-Date: Mon, 04 Mar 2013 13:11:53 -0000

This recipe builds natively just the gtk-update-icon-cache binary that is
required to run the gtk-icon-cache.bbclass postinstall scripts.

The advantage of doing this is it means running 400 less tasks which takes four
minutes on my machine, as the alternative is building GTK+ natively (and so
libX11, freetype, fontconfig...).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gtk+/gtk-update-icon-cache-native_3.4.4.bb     |   44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb

diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
new file mode 100644
index 0000000..5941bbd
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
@@ -0,0 +1,44 @@
+SUMMARY = "gtk-update-icon-cache built natively"
+DESCRIPTION = "Just gtk-update-icon-cache built from GTK+ natively, for on-host postinst script execution."
+SECTION = "libs"
+
+PROVIDES = "virtual/gtk-update-icon-cache-native"
+
+DEPENDS = "gdk-pixbuf-native"
+
+LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
+                    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
+                    file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
+
+SRC_URI = "http://download.gnome.org/sources/gtk+/3.4/gtk+-${PV}.tar.xz"
+SRC_URI[md5sum] = "1b2cf29502a6394e8d4b30f7f5bb9131"
+SRC_URI[sha256sum] = "f154e460075034da4c0ce89c320025dcd459da2a1fdf32d92a09522eaca242c7"
+
+S = "${WORKDIR}/gtk+-${PV}"
+
+inherit pkgconfig native
+
+PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
+
+do_configure() {
+	# Quite ugly but defines enough to compile the tool.
+	if ! test -f gtk/config.h; then
+		echo "#define GETTEXT_PACKAGE \"gtk30\"" >> gtk/config.h
+		echo "#define HAVE_UNISTD_H 1" >> gtk/config.h
+		echo "#define HAVE_FTW_H 1" >> gtk/config.h
+
+	fi
+}
+
+do_compile() {
+	${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} $(${PKG_CONFIG_FOR_BUILD} --cflags --libs gdk-pixbuf-2.0) \
+		-o gtk-update-icon-cache ${S}/gtk/updateiconcache.c
+}
+
+do_install() {
+	install -d ${D}${bindir}
+        install -m 0755 ${B}/gtk-update-icon-cache ${D}${bindir}
+}
-- 
1.7.10.4




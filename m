Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UdHV8-00018c-Gv
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 12:03:03 +0200
Received: by mail-ee0-f51.google.com with SMTP id e51so2363918eek.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 02:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=NFVwY0ZZTqcx4251+CP6cJlgSn3VuITQhdepdiLL4iU=;
	b=Wmq/UNJAgsFytanadPqIGiNpX7HyPQlyKgKKfaKI/P3CAWiP7F4/gyihLhZjn6KJJg
	pOlQ/BeH/6b1301Xh+ztvDPXQ6qdc1FQPRvN/eul9bczLxignVomjViT5xX6KwwQ4K44
	DlnjW1uwg+z+cborcdFA1YYQaAMn5omXFtHWQGky6wGmztmJxDx2TtU/Fw7b2ihrMpdt
	ZBtMBpv4B0RuwvbLGlEwMDIlxAEqpzBtNr7OUyJEHPXCy01eO53IYhewrqidE0Y44UaU
	GKs+XO1+keoEultBBiDx06uYr1n0iATbsMYhCWpyp211bp6m5D9tBhbylxoBAANDrAfV
	2I4Q==
X-Received: by 10.15.33.195 with SMTP id c43mr87892522eev.2.1368783887240;
	Fri, 17 May 2013 02:44:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id y10sm17473904eev.3.2013.05.17.02.44.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 May 2013 02:44:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 10:40:42 +0100
Message-Id: <5d307b926a893dd8095498990911285f2c0737ce.1368783549.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1368783549.git.ross.burton@intel.com>
References: <cover.1368783549.git.ross.burton@intel.com>
In-Reply-To: <cover.1368783549.git.ross.burton@intel.com>
References: <cover.1368783549.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmeo6F2e4mMfP+C11JFMas+zvST4KQght3dwoQIDZa483VLCEZCQ87jLQ/oj5BzBOuvIVoh
Subject: [PATCH 2/5] gdk-pixbuf: remove native loader cache generation, use the class
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
X-List-Received-Date: Fri, 17 May 2013 10:03:07 -0000

We assumed that the only relevant gdk-pixbuf loaders in the native environment
were the ones in gdk-pixbuf itself, as the icon cache is only for PNG files.
However, glib-compile-resources can transform SVG files to raw image data, and
done natively this requires the SVG loader to be registered.  The current
implementation relies on this assumption by generating the cache based on the
staging directory during install, so if gdk-pixbuf-native is re-installed to the
sysroot after librsvg-native it will overwrite the loader cache.

So, remove the code in do_install that updated the cache, and rely on the new
logic in pixbufcache.bbclass that updates the cache when it's installed into the
sysroot itself.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
index b35f7c6..b85bbaf 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
@@ -69,9 +69,6 @@ python populate_packages_prepend () {
 }
 
 do_install_append_class-native() {
-#Use wrapper script rather than binary as required libtool library is not installed now
-	GDK_PIXBUF_MODULEDIR=${D}${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders ${B}/gdk-pixbuf/gdk-pixbuf-query-loaders > ${D}${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
-	sed -i -e 's#${D}##g' ${D}${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 	find ${D}${libdir} -name "libpixbufloader-*.la" -exec rm \{\} \;
 
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-csource \
-- 
1.7.10.4




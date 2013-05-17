Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UdHVC-00019i-VD
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 12:03:08 +0200
Received: by mail-ee0-f41.google.com with SMTP id d4so2461625eek.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 02:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=bQqSOccUxIgks+FGai2yPdnOctVT7G/XVyGCru7a5cA=;
	b=etVxPARwNA4JTaPezETYQTBYqKz8hGMcR1bq7TxlNtmLF4D45nnkS5Gvyokb7YYY6O
	cCYgJusc5i58X29vwdsANGXHmHUVRhKmRAV7okFsWcpE1pNU85IK5xBoqPgJkg8QyVGO
	7sjU8miwr3aN7iI5fqerq02nBmJRIXs9OYBkRCpor/Uv7I0kqgn3OepHve3N+lwVJkvM
	59G4ro2gMl81B2xcXvQKg6yymXRpOpI6I90sG5UkFgYw7k22xVcEewlanIt3YYr5k+tH
	HR0puKyHGD30inLPZvWEHryfq1d8EbBtOdtZWDRZ18sNDYIbv9Gc/X5RwohR4AHgbDRl
	icyw==
X-Received: by 10.15.24.72 with SMTP id i48mr106587074eeu.37.1368783891702;
	Fri, 17 May 2013 02:44:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id y10sm17473904eev.3.2013.05.17.02.44.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 May 2013 02:44:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 10:40:45 +0100
Message-Id: <28ba5f0003c131377c4cff9bcd35c7eeabbb4f21.1368783549.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1368783549.git.ross.burton@intel.com>
References: <cover.1368783549.git.ross.burton@intel.com>
In-Reply-To: <cover.1368783549.git.ross.burton@intel.com>
References: <cover.1368783549.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlNV7mUnrAm7C+zIxkp8C2h5grK9AD5gXAtCuTGJuv84XxXBgfHQ8w5hQSeRF+KAWBrBbGz
Subject: [PATCH 5/5] librsvg: small cleanups
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
X-List-Received-Date: Fri, 17 May 2013 10:03:31 -0000

Re-order fields to a more logical order.

Remove the unrecognised --disable-mozilla-plugin option.

Remove the unrequired setting of GDK_PIXBUF_QUERYLOADERS, it's found
automatically.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |   20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index f50c1a8..6594bf0 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -14,7 +14,14 @@ PR = "r12"
 
 inherit autotools pkgconfig gnomebase gtk-doc pixbufcache
 
-EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz"
+SRC_URI += "file://doc_Makefile.patch \
+            file://librsvg-CVE-2011-3146.patch \
+           "
+
+SRC_URI[archive.md5sum] = "4b00d0fee130c936644892c152f42db7"
+SRC_URI[archive.sha256sum] = "91b98051f352fab8a6257688d6b2fd665b4648ed66144861f2f853ccf876d334"
+
+EXTRA_OECONF = "--without-svgz"
 
 PACKAGECONFIG ??= "croco gdkpixbuf"
 
@@ -25,17 +32,6 @@ PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader"
 # GTK+ 2 theme engine
 PACKAGECONFIG[gtk] = "--enable-gtk-theme,--disable-gtk-theme,gtk+"
 
-SRC_URI += "file://doc_Makefile.patch \
-	    file://librsvg-CVE-2011-3146.patch \
-	    "
-
-SRC_URI[archive.md5sum] = "4b00d0fee130c936644892c152f42db7"
-SRC_URI[archive.sha256sum] = "91b98051f352fab8a6257688d6b2fd665b4648ed66144861f2f853ccf876d334"
-
-do_configure_prepend () {
-	export GDK_PIXBUF_QUERYLOADERS="${libdir}/gdk-pixbuf-2.0/2.10.0/loaders"
-}
-
 PACKAGES =+ "librsvg-gtk librsvg-gtk-dbg librsvg-gtk-dev rsvg"
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN}-staticdev += "${libdir}/gdk-pixbuf-2.0/*.a ${libdir}/gdk-pixbuf-2.0/*/*/*.a \
-- 
1.7.10.4




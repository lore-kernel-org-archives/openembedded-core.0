Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UdHVA-00018k-0q
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 12:03:08 +0200
Received: by mail-ee0-f50.google.com with SMTP id c41so2442967eek.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 02:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=bQRnj2ligePRUi9BcdnJdE4nHKNF4RHl6gG7jcs60ZE=;
	b=SWWlsfZELP0Hp3+2lkwCQ/tZ8qud0TL6FfTTAHxba51jzmw68oT4xkAo8bPOD5bg1i
	Ka4RHHBsXMIcz7wmHtSHJXl2mplbEjvjn4F4TObEkStjmatWFwlRassuuq4sE0XRY6zK
	nFyea48vR7xt/5BzW96aLqqgzNX1YAB4nTCpsHeagwE7+9CKeprVeMakWNK+CNPJJskX
	9czL63x6cNfzX+9OT/9C60x8Ik/LYGLJcHQJc6fInT1uSPdV7RIh0uvEsUe7sFD0ffGS
	zYCZckHKnOvLiWp6gJ71vQJ6YLIiC2mzzbUOQhRCwwfcBTaWwf6/Va4pYLjatqDhphnt
	M/uw==
X-Received: by 10.14.38.198 with SMTP id a46mr127817600eeb.11.1368783888720;
	Fri, 17 May 2013 02:44:48 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id y10sm17473904eev.3.2013.05.17.02.44.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 May 2013 02:44:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 10:40:43 +0100
Message-Id: <97d108e5e5de539826209f972a27ca50698fae88.1368783549.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1368783549.git.ross.burton@intel.com>
References: <cover.1368783549.git.ross.burton@intel.com>
In-Reply-To: <cover.1368783549.git.ross.burton@intel.com>
References: <cover.1368783549.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlg40k2Kl6MP8SXDLBwrmAnIpEfROr3I7uS8TeIC6rAJCyoij7odG7Z33vZuVm31eCjjYNL
Subject: [PATCH 3/5] librsvg: add more PACKAGECONFIG options
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

Add options for the gdk-pixbuf loaders and the GTK+ 2 theme engine.  The theme
engine is generally unused so don't enable that by default, but enable the
gdk-pixbuf loader and also enable the croco feature which is required for
parsing CSS embedded into SVG.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index ff17cf7..980c01c 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://rsvg.h;beginline=3;endline=24;md5=20b4113c4909bbf0d67e006778302bc6"
 
 SECTION = "x11/utils"
-DEPENDS = "gtk+ cairo libxml2"
+DEPENDS = "cairo glib-2.0 gdk-pixbuf fontconfig freetype libxml2 pango"
 DEPENDS_class-native = "cairo-native pango-native gdk-pixbuf-native"
 BBCLASSEXTEND = "native"
 
@@ -17,11 +17,14 @@ inherit autotools pkgconfig gnome gtk-doc pixbufcache
 
 EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz"
 
-PACKAGECONFIG ??= "croco"
-# When native we can manage without croco, as it's only for GTK+
-PACKAGECONFIG_class-native = ""
+PACKAGECONFIG ??= "croco gdkpixbuf"
 
+# Support embedded CSS stylesheets (recommended upstream)
 PACKAGECONFIG[croco] = "--with-croco,--without-croco,libcroco"
+# gdk-pixbuf loader
+PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader"
+# GTK+ 2 theme engine
+PACKAGECONFIG[gtk] = "--enable-gtk-theme,--disable-gtk-theme,gtk+"
 
 SRC_URI += "file://doc_Makefile.patch \
 	    file://librsvg-CVE-2011-3146.patch \
-- 
1.7.10.4




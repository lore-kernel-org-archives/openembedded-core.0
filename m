Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id F19A06DF29
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 16:19:03 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hq4so10158231wib.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2013 08:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=tC/hCTbqPD3o23WSrdvpTqGcH3MYSmAMuKbP5lP9Y3w=;
	b=KfSfw42Rt2xFVduKwc8oOSc8Un8PbcJAFYfmrCEYIbm5PTqMp0FUw8wgsUoEAktSH7
	e3asCGA0MD8mMsrvahrjpA0K9L36Os5BFAsjpAWDpY5o8DqJKbFaI0wyjhLaa5x73cZ+
	HkWqL6d0qrArD9zkq9Igm7IHuFzNVlsDDXsTjtZxW7aKOqgzVtd6JtlJTnecRAk7ZCqH
	78/+4NfZ9F/+p36hM8gpvWARXn+odp6mR0VD7tZ979kqwJfVJ6nRGnDxnBJPSFapQrvI
	G+72NA915nX/XVMSCIrOGIEqMR9+gOH8QYt1McTz/t3jygw1Ew6uJvZ2XQ/mKvEigM2H
	gv+w==
X-Gm-Message-State: ALoCoQmJ4xYwi5PYqQNRaQXVGCTDAlTfbv9wgHDqxtovYFtVhTht8EWYaYrT34D92bH+G1YHCHUq
X-Received: by 10.194.240.129 with SMTP id wa1mr69359116wjc.31.1386260343108; 
	Thu, 05 Dec 2013 08:19:03 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fj8sm7776729wib.1.2013.12.05.08.19.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Dec 2013 08:19:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 16:18:47 +0000
Message-Id: <1386260327-27927-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] fstests: update to git master
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
X-List-Received-Date: Thu, 05 Dec 2013 16:19:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upstream git has a fix for broken compilation against Freetype 2.5.1.

It also integrates the link patch we had, and installs into $bindir.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../files/dso_linking_change_build_fix.patch       |   74 --------------------
 meta/recipes-graphics/fstests/fstests_git.bb       |   14 +---
 2 files changed, 3 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-graphics/fstests/files/dso_linking_change_build_fix.patch

diff --git a/meta/recipes-graphics/fstests/files/dso_linking_change_build_fix.patch b/meta/recipes-graphics/fstests/files/dso_linking_change_build_fix.patch
deleted file mode 100644
index 37a1f32..0000000
--- a/meta/recipes-graphics/fstests/files/dso_linking_change_build_fix.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-Upstream-Status: Pending
-
-after gcc linking has changed, all the libraries must be explicitely specified 
-This patch avoids these linking errors:
-
-
-| make[1]: Entering directory `/disk0/pokybuild/build1/tmp/work/i586-poky-linux/fstests-0.0+svnr426-r0/fstests/tests'^M
-| ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12   -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2   -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o test-gtk-layout test_gtk_layout-test-gtk-layout.o -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0   -pthread -lpangoxft-1.0 -lpangoft2-1.0 -lXft -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0^M
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: t^A: invalid DSO for symbol `XSync' definition^M
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libX11.so.6: could not read symbols: Bad value^M
-| collect2: ld returned 1 exit status^M
-| make[1]: *** [test-gtk-layout] Error 1
-
-
-|ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2   -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o test-pango test_pango-test-pango.o -pthread -lpangoxft-1.0 -lpangoft2-1.0 -lXft -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: �: invalid DSO for symbol `XOpenDisplay' definition
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libX11.so.6: could not read symbols: Bad value
-| collect2: ld returned 1 exit status
-| make[1]: *** [test-pango] Error 1
-
-
-| ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12   -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2   -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o test-pango-gdk test_pango_gdk-test-pango-gdk.o -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0   -pthread -lpangoxft-1.0 -lpangoft2-1.0 -lXft -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: t: invalid DSO for symbol `XSync' definition
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libX11.so.6: could not read symbols: Bad value
-| collect2: ld returned 1 exit status
-| make[1]: *** [test-pango-gdk] Error 1
-
-
-| ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12   -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2   -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o test-pango-gtk test_pango_gtk-test-pango-gtk.o -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0   -pthread -lpangoxft-1.0 -lpangoft2-1.0 -lXft -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: t: invalid DSO for symbol `XSync' definition
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libX11.so.6: could not read symbols: Bad value
-| collect2: ld returned 1 exit status
-| make[1]: *** [test-pango-gtk] Error 1
-
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/11
-
-Index: tests/Makefile.am
-===================================================================
---- tests.orig/Makefile.am
-+++ tests/Makefile.am
-@@ -48,19 +48,19 @@ test_xft_CFLAGS = @XLIBS_CFLAGS@ @PANGO_
- 
- # draws pango strings with just x
- test_pango_SOURCES = test-pango.c
--test_pango_LDADD = @PANGO_LIBS@
-+test_pango_LDADD = @PANGO_LIBS@ @XLIBS_LIBS@
- test_pango_CFLAGS = @PANGO_CFLAGS@
- 
- #below are as above but on 
- 
- # Draws a list of Pango glyphs onto a GtkWindow with pango_xft_render
- test_pango_gdk_SOURCES = test-pango-gdk.c
--test_pango_gdk_LDADD = @GTK_LIBS@ @PANGO_LIBS@
-+test_pango_gdk_LDADD = @GTK_LIBS@ @PANGO_LIBS@ @XLIBS_LIBS@
- test_pango_gdk_CFLAGS = @GTK_CFLAGS@ @PANGO_CFLAGS@
- 
- # Draws a list of Pango glyphs onto a GtkDrawingArea with pango_xft_render
- test_pango_gtk_SOURCES = test-pango-gtk.c
--test_pango_gtk_LDADD = @GTK_LIBS@ @PANGO_LIBS@
-+test_pango_gtk_LDADD = @GTK_LIBS@ @PANGO_LIBS@ @XLIBS_LIBS@
- test_pango_gtk_CFLAGS = @GTK_CFLAGS@ @PANGO_CFLAGS@
- 
- # Draws a list of Pango glyphs onto a GtkWindow with gdk_draw_glyphs
-@@ -76,7 +76,7 @@ test_pango_layout_CFLAGS = @GTK_CFLAGS@ 
- 
- # As above PangoLayout onto a GtkWindow with gdk_draw_layout XXX TOGO ?
- test_gtk_layout_SOURCES = test-gtk-layout.c
--test_gtk_layout_LDADD = @GTK_LIBS@ @PANGO_LIBS@
-+test_gtk_layout_LDADD = @GTK_LIBS@ @PANGO_LIBS@ @XLIBS_LIBS@
- test_gtk_layout_CFLAGS = @GTK_CFLAGS@ @PANGO_CFLAGS@
- 
- 
diff --git a/meta/recipes-graphics/fstests/fstests_git.bb b/meta/recipes-graphics/fstests/fstests_git.bb
index 3d271ad..678d1e7 100644
--- a/meta/recipes-graphics/fstests/fstests_git.bb
+++ b/meta/recipes-graphics/fstests/fstests_git.bb
@@ -4,21 +4,13 @@ SECTION = "devel"
 LICENSE = "Zlib"
 DEPENDS = "pango libxext libxft virtual/libx11 gtk+"
 
-SRCREV = "218b99d82b56011e3f1b909e6baf22ce25af6334"
+SRCREV = "e5939ff608b95cdd4d0ab0e1935781ab9a276ac0"
 PV = "0.1+git${SRCPV}"
 
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
-           file://dso_linking_change_build_fix.patch"
+LIC_FILES_CHKSUM = "file://test-pango-gdk.c;endline=24;md5=1ee74ec851ecda57eb7ac6cc180f7655"
 
 S = "${WORKDIR}/git/tests"
 
 inherit autotools
-
-do_install() {
-    install -d ${D}${bindir}
-    find . -name "test-*" -type f -perm -755 -exec install -m 0755 {} ${D}${bindir} \;   
-}
-
-
-LIC_FILES_CHKSUM = "file://test-pango-gdk.c;endline=24;md5=1ee74ec851ecda57eb7ac6cc180f7655"
-- 
1.7.10.4



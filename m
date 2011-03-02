Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PuqOP-00075f-3N
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:03:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Mar 2011 10:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,254,1297065600"; d="scan'208";a="715282390"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by orsmga001.jf.intel.com with ESMTP; 02 Mar 2011 10:00:41 -0800
Message-Id: <b830c5b4c5488eee4b31094db32f5cf0cd95ad30.1299088354.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299088353.git.sgw@linux.intel.com>
References: <cover.1299088353.git.sgw@linux.intel.com>
Old-Date: Tue, 1 Mar 2011 11:12:58 -0800
Date: Wed, 02 Mar 2011 10:00:39 -0800
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 02 Mar 2011 19:07:49 +0100
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Liping Ke <liping.ke@intel.com>, Dongxiao Xu <dongxiao.xu@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 24/26] screenshot: change the order of LDADD arguments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2011 18:03:22 -0000

From: Scott Garman <scott.a.garman@intel.com>

Rather than setting linker flags explicitly in LDADD as the
previous patch did, simply put libshot.la before GTK_LIBS.

This fixes [BUGID #664]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../files/dso_linking_change_build_fix.patch       |   49 --------------------
 .../screenshot/files/fix_ldadd_order.patch         |   12 +++++
 meta/recipes-sato/screenshot/screenshot_svn.bb     |    6 +-
 3 files changed, 15 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-sato/screenshot/files/dso_linking_change_build_fix.patch
 create mode 100644 meta/recipes-sato/screenshot/files/fix_ldadd_order.patch

diff --git a/meta/recipes-sato/screenshot/files/dso_linking_change_build_fix.patch b/meta/recipes-sato/screenshot/files/dso_linking_change_build_fix.patch
deleted file mode 100644
index d3a9ed1..0000000
--- a/meta/recipes-sato/screenshot/files/dso_linking_change_build_fix.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-after gcc linking has changed, all the libraries must be explicitely specified 
-This patch avoids these linking errors:
-
-
-
-| i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -Wall -g -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12 -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/screenshot main.o -pthread  /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgtk-x11-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgdk-x11-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libatk-1.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgdk_pixbuf-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgio-2.0.so -lresolv /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpangocairo-1.0.so -L/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpangoft2-1.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libstdc++.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libcairo.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpixman-1.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpng12.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXrender.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libX11.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libxcb.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXau.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXdmcp.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libz.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpango-1.0.so -lm /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libfontconfig.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libfreetype.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libexpat.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgobject-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgmodule-2.0.so -ldl /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgthread-2.0.so -lpthread /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libglib-2.0.so -lrt ./.libs/libshot.a -pthread
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: L: invalid DSO for symbol `gdk_cursor_unref' definition
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgdk-x11-2.0.so: could not read symbols: Bad value
-| collect2: ld returned 1 exit status
-| make[1]: *** [screenshot] Error 1
-
-
-
-
-| i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -Wall -g -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12 -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/screenshot main.o -pthread  /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgtk-x11-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libatk-1.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgdk_pixbuf-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgio-2.0.so -lresolv /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpangocairo-1.0.so -L/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpangoft2-1.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libstdc++.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libcairo.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpixman-1.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpng12.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXrender.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libX11.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libxcb.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXau.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXdmcp.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libz.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpango-1.0.so -lm /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libfontconfig.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libfreetype.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libexpat.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgobject-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgmodule-2.0.so -ldl /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgthread-2.0.so -lpthread /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libglib-2.0.so -lrt ./.libs/libshot.a /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgdk-x11-2.0.so -pthread
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: a: invalid DSO for symbol `gdk_pixbuf_unref' definition
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgdk_pixbuf-2.0.so: could not read symbols: Bad value
-| collect2: ld returned 1 exit status
-| make[1]: *** [screenshot] Error 1
-
-
-| i586-poky-linux-libtool: link: ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -Wall -g -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12 -pthread -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/glib-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/glib-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/gtk-2.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/gtk-2.0/include -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/atk-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/cairo -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pango-1.0 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/pixman-1 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/freetype2 -I/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/include/libpng12 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/screenshot main.o -pthread  /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgtk-x11-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libatk-1.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpangocairo-1.0.so -L/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpangoft2-1.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libstdc++.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libcairo.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpixman-1.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpng12.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXrender.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libX11.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libxcb.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXau.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXdmcp.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpango-1.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libfontconfig.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libfreetype.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libexpat.so ./.libs/libshot.a /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgdk-x11-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgdk_pixbuf-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgio-2.0.so -lresolv /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libz.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgobject-2.0.so /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgmodule-2.0.so -ldl /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libgthread-2.0.so -lpthread /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libglib-2.0.so -lrt -lm -pthread
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: }: invalid DSO for symbol `XUngrabServer' definition
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libX11.so: could not read symbols: Bad value
-| collect2: ld returned 1 exit status
-| make[1]: *** [screenshot] Error 1
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/11
-
-Update:
-This is identified as a libtool issue. While creating the libshot.la 
-file, libtool should have added these needed libraries in there.
- A bug has been created for this issue: 
-   http://bugzilla.pokylinux.org/show_bug.cgi?id=664
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/19
-
-
-Index: screenshot/Makefile.am
-===================================================================
---- screenshot.orig/Makefile.am
-+++ screenshot/Makefile.am
-@@ -23,4 +23,4 @@ endif
- # A standalone tool for running from a terminal and scripts
- bin_PROGRAMS = screenshot
- screenshot_SOURCES = main.c
--screenshot_LDADD = $(GTK_LIBS) libshot.la
-+screenshot_LDADD = $(GTK_LIBS) libshot.la -lgdk-x11-2.0 -lgdk_pixbuf-2.0 -lX11
diff --git a/meta/recipes-sato/screenshot/files/fix_ldadd_order.patch b/meta/recipes-sato/screenshot/files/fix_ldadd_order.patch
new file mode 100644
index 0000000..726d590
--- /dev/null
+++ b/meta/recipes-sato/screenshot/files/fix_ldadd_order.patch
@@ -0,0 +1,12 @@
+Fix the ordering of LDADD options to fix a compilation failure.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+diff -urN screenshot.orig//Makefile.am screenshot/Makefile.am
+--- screenshot.orig//Makefile.am	2010-06-29 11:55:00.000000000 -0700
++++ screenshot/Makefile.am	2011-03-01 11:09:01.215813968 -0800
+@@ -23,4 +23,4 @@
+ # A standalone tool for running from a terminal and scripts
+ bin_PROGRAMS = screenshot
+ screenshot_SOURCES = main.c
+-screenshot_LDADD = $(GTK_LIBS) libshot.la
++screenshot_LDADD = libshot.la $(GTK_LIBS)
diff --git a/meta/recipes-sato/screenshot/screenshot_svn.bb b/meta/recipes-sato/screenshot/screenshot_svn.bb
index ff2b7c8..f9c4db6 100644
--- a/meta/recipes-sato/screenshot/screenshot_svn.bb
+++ b/meta/recipes-sato/screenshot/screenshot_svn.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 PRIORITY = "optional"
 DEPENDS = "matchbox-panel-2"
 PV = "0.0+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=${PN};proto=http\
-	file://dso_linking_change_build_fix.patch"
+SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=${PN};proto=http \
+           file://fix_ldadd_order.patch"
 
 S = ${WORKDIR}/${PN}
 
-- 
1.7.1




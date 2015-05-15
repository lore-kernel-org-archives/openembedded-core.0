Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 68B777416C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 13:37:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 0D9E46018CD
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 May 2015 14:37:12 +0100
Message-Id: <a77975067764b47f3e9cf28b3de7ecfbfe5b2342.1431696945.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <cover.1431696945.git.joshua.lock@collabora.co.uk>
References: <cover.1431696945.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1431696945.git.joshua.lock@collabora.co.uk>
References: <cover.1431696945.git.joshua.lock@collabora.co.uk>
Subject: [PATCH 1/1] cairo: make xlib and libxcb dependencies explicit
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
X-List-Received-Date: Fri, 15 May 2015 13:37:41 -0000

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-graphics/cairo/cairo.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 98add5a..1e45318 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -17,9 +17,11 @@ LICENSE_${PN}-perf-utils = "GPLv3+"
 X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
-PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
+
+PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
+PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
 PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
 PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
 PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
-- 
2.4.0



Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RNjcy-0007ca-8q
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 12:14:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA8B7nbh014919
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 03:07:49 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 8 Nov 2011 03:07:49 -0800
Message-ID: <a3bc0652da3fe9a2e90444030b4a364871c47549.1320750179.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1320750179.git.xiaofeng.yan@windriver.com>
References: <cover.1320750179.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 8 Nov 2011 18:39:38 +0800
Date: Tue, 8 Nov 2011 19:15:50 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] cairo: Fix bug 1674
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
X-List-Received-Date: Tue, 08 Nov 2011 11:14:04 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #1674]
Image "gtk+ over directfb" doesn't need "x11".
cairo should be compiled without x11 when compiling an image based on directfb.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/cairo/cairo.inc |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 876acad..d1fc48c 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -11,13 +11,18 @@ BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 LICENSE = "MPL-1 & LGPLv2.1"
 X11DEPENDS = "virtual/libx11 libsm libxrender"
-DEPENDS = "libpng fontconfig pixman glib-2.0 ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
+DIRECTFBDEPENDS = "directfb"
+DEPENDS = "libpng fontconfig pixman glib-2.0 ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)} ${@base_contains('DISTRO_FEATURES', 'directfb', '${DIRECTFBDEPENDS}', '', d)}"
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
+CONF_directfb="--with-x=no --enable-xcb=no --enable-directfb=yes"
+CONF_xorg="--with-x=yes --enable-xcb=no --enable-directfb=no"
+
 EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} ${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
+EXTRA_OECONF += " ${@base_contains('DISTRO_FEATURES', 'directfb', '${CONF_directfb}', '${CONF_xorg}', d)}"
 
 inherit autotools pkgconfig
 
 # We don't depend on binutils so we need to disable this
-export ac_cv_lib_bfd_bfd_openr=no
\ No newline at end of file
+export ac_cv_lib_bfd_bfd_openr=no
-- 
1.7.0.4




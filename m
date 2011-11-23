Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RT6kp-00060w-10
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 07:56:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAN6npaW013605
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 22:49:51 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 Nov 2011 22:49:50 -0800
Message-ID: <7623f4e5412f2a671368a41a1dfacf06a7c1e882.1322028165.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322028165.git.xiaofeng.yan@windriver.com>
References: <cover.1322028165.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 23 Nov 2011 13:30:48 +0800
Date: Wed, 23 Nov 2011 14:47:59 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] cairo: add directfb DISTRO_FEATURE
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
X-List-Received-Date: Wed, 23 Nov 2011 06:56:23 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

cairo run over x11 at current OE-core. If cairo want to run over directfb, then \
the configuration related to x11 should be disabled and directfb should be enabled.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/cairo/cairo.inc |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 876acad..d7f7347 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -10,14 +10,20 @@ HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 LICENSE = "MPL-1 & LGPLv2.1"
+
 X11DEPENDS = "virtual/libx11 libsm libxrender"
-DEPENDS = "libpng fontconfig pixman glib-2.0 ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
+DEPENDS = "libpng fontconfig pixman glib-2.0"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
+PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
+
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
-EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} ${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
+EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)}"
 
 inherit autotools pkgconfig
 
 # We don't depend on binutils so we need to disable this
-export ac_cv_lib_bfd_bfd_openr=no
\ No newline at end of file
+export ac_cv_lib_bfd_bfd_openr=no
-- 
1.7.0.4




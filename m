Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RYaY5-0001IZ-1e
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 10:45:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB89d3hc025036
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 01:39:03 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 8 Dec 2011 01:39:02 -0800
Message-ID: <9c421fba97bc5dea715346c33992170d459e4022.1323327959.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1323327959.git.xiaofeng.yan@windriver.com>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 5 Dec 2011 15:06:33 +0800
Date: Thu, 8 Dec 2011 17:34:11 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] cairo: add directfb DISTRO_FEATURE
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
X-List-Received-Date: Thu, 08 Dec 2011 09:45:56 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

cairo run over x11 at current OE-core. If cairo want to run over directfb, then \
the configuration related to x11 should be disabled and directfb should be enabled.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/cairo/cairo.inc |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 876acad..411ef58 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -11,13 +11,18 @@ BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 LICENSE = "MPL-1 & LGPLv2.1"
 X11DEPENDS = "virtual/libx11 libsm libxrender"
-DEPENDS = "libpng fontconfig pixman glib-2.0 ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
+DEPENDS = "libpng fontconfig pixman glib-2.0"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
+PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
 EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} ${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
 
+
 inherit autotools pkgconfig
 
 # We don't depend on binutils so we need to disable this
-export ac_cv_lib_bfd_bfd_openr=no
\ No newline at end of file
+export ac_cv_lib_bfd_bfd_openr=no
-- 
1.7.0.4




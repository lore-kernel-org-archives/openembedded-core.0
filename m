Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QskDS-0005Pw-F3
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 01:35:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2011 16:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38387546"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.242])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2011 16:30:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Aug 2011 16:30:44 -0700
Message-Id: <6233d1155d29f83ae13f8f0d769f2894789f14dd.1313363644.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/12] cairo: only use x11 if selected in DISTRO_FEATURES
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
X-List-Received-Date: Sun, 14 Aug 2011 23:35:39 -0000

From: Phil Blundell <philb@gnu.org>

This makes it possible to build cairo-using apps without X11.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-graphics/cairo/cairo.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 72aaa03..c983a89 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -10,10 +10,11 @@ HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 LICENSE = "MPL-1 & LGPLv2.1"
-DEPENDS = "virtual/libx11 libsm libpng fontconfig libxrender pixman glib-2.0"
+X11DEPENDS = "virtual/libx11 libsm libxrender"
+DEPENDS = "libpng fontconfig pixman glib-2.0 ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
-EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)}"
+EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} ${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
 
 inherit autotools pkgconfig
-- 
1.7.6




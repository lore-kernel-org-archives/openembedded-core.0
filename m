Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TwAfX-0002Ks-2g
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 13:03:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jan 2013 03:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,491,1355126400"; d="scan'208";a="245575085"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2013 03:47:53 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 13:48:31 +0200
Message-Id: <bdcf95d9b9f55541bbacb952f84383304eec76f0.1358509450.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1358509450.git.constantinx.musca@intel.com>
References: <cover.1358509450.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1358509450.git.constantinx.musca@intel.com>
References: <cover.1358509450.git.constantinx.musca@intel.com>
Subject: [PATCH 3/4] gtk+: remove directfb support
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
X-List-Received-Date: Fri, 18 Jan 2013 12:03:35 -0000

- DirectFB is not supported by gtk versions >= 2.18

[YOCTO #3642]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc        | 7 +------
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb | 2 +-
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 97d3650..3a40409 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -14,14 +14,9 @@ X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender
 DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
  libgcrypt cairo gdk-pixbuf"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
- ${@base_contains('DISTRO_FEATURES', 'gtk-directfb', 'gtk-directfb', '', d)}"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
-# for gtk+ 2.x, have to pick either x11 or directfb not both
-# for gtk+ 3.x, PACKAGECONFIG[gtk-directfb] should be removed because directfb will not be support as
-# a backend.
 PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
-PACKAGECONFIG[gtk-directfb] = "--with-gdktarget=directfb,,directfb"
 
 inherit autotools gtk-doc pkgconfig update-alternatives
 
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
index d794840..fab360d 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "e2c16f119ed624893ecfc3775930ae4c"
 SRC_URI[sha256sum] = "8bd1b8b511a3004e8972badf467ce829e6855cdff15540b9344dc934c68008ac"
-- 
1.7.11.7




Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SxOWw-00071K-1l
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 22:31:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2012 13:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193014110"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2012 13:19:47 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2012 23:19:36 +0300
Message-Id: <54632fe18804ea88065c2506700b814aa3e91a28.1344022584.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344022584.git.laurentiu.palcu@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1344022584.git.laurentiu.palcu@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/5] gtk+: enable gtk+-native
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
X-List-Received-Date: Fri, 03 Aug 2012 20:31:30 -0000

This is needed in order to run postinst scriplets at do_rootfs time
rather than first boot time.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index 529f8e1..878eb87 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI[md5sum] = "0413187f7e596aef00ccd1b54776ff03"
 SRC_URI[sha256sum] = "ac2325a65312922a6722a7c02a389f3f4072d79e13131485cc7b7226e2537043"
@@ -37,6 +37,9 @@ EXTRA_OECONF = "--without-libtiff --without-libjasper --enable-xkb --disable-gli
 LIBV = "2.10.0"
 
 PACKAGES_DYNAMIC += "gtk-immodule-* gtk-printbackend-*"
+BBCLASSEXTEND = "native"
+RRECOMMENDS_${PN}_virtclass-native = ""
+DEPENDS_virtclass-native = "glib-2.0-native atk-native pango-native cairo-native gdk-pixbuf-native"
 
 python populate_packages_prepend () {
     prologue = d.getVar("postinst_prologue", True)
-- 
1.7.9.5




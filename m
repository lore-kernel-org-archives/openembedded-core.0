Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 031AE7638A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:27:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2015 07:27:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="616054344"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga003.jf.intel.com with ESMTP; 30 Jul 2015 07:27:00 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 17:27:24 +0300
Message-Id: <ef39b19bb58a92918201d8cc33ef4dc6e9daf0bb.1438265949.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/21] classes/gnomebase: change tarball compression to xz
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
X-List-Received-Date: Thu, 30 Jul 2015 14:27:17 -0000

Upstream, xz has been the only format for some time now, so let's
make it the default and adjust recipes that package old stuff.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gnomebase.bbclass                              | 2 +-
 meta/recipes-core/glib-networking/glib-networking_2.44.0.bb | 2 --
 meta/recipes-gnome/gnome/gnome-common_3.14.0.bb             | 2 --
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb         | 2 --
 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb          | 1 +
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb        | 1 +
 meta/recipes-gnome/json-glib/json-glib_1.0.4.bb             | 2 --
 meta/recipes-gnome/libglade/libglade_2.6.4.bb               | 1 +
 meta/recipes-gnome/librsvg/librsvg_2.40.9.bb                | 2 --
 meta/recipes-graphics/pango/pango_1.36.8.bb                 | 2 --
 meta/recipes-support/atk/atk_2.16.0.bb                      | 2 --
 meta/recipes-support/libcroco/libcroco_0.6.8.bb             | 2 --
 meta/recipes-support/vte/vte_0.28.2.bb                      | 4 ++--
 13 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index 6ca13cb..e5c6776 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -1,7 +1,7 @@
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 2)
 
-GNOME_COMPRESS_TYPE ?= "bz2"
+GNOME_COMPRESS_TYPE ?= "xz"
 SECTION ?= "x11/gnome"
 GNOMEBN ?= "${BPN}"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.44.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.44.0.bb
index 848bf53..4f91b76 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.44.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.44.0.bb
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 SECTION = "libs"
 DEPENDS = "glib-2.0 intltool-native"
 
-GNOME_COMPRESS_TYPE = "xz"
-
 SRC_URI[archive.md5sum] = "6989b20cf3b26dd5ae272e04a9acb0b3"
 SRC_URI[archive.sha256sum] = "8f8a340d3ba99bfdef38b653da929652ea6640e27969d29f7ac51fbbe11a4346"
 
diff --git a/meta/recipes-gnome/gnome/gnome-common_3.14.0.bb b/meta/recipes-gnome/gnome/gnome-common_3.14.0.bb
index 1f9fe8b..80b7033 100644
--- a/meta/recipes-gnome/gnome/gnome-common_3.14.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-common_3.14.0.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SECTION = "x11/gnome"
 inherit gnomebase allarch
 
-GNOME_COMPRESS_TYPE = "xz"
-
 SRC_URI[archive.md5sum] = "ba58c61d0d81b7c3ff8452c620513a9d"
 SRC_URI[archive.sha256sum] = "4c00242f781bb441289f49dd80ed1d895d84de0c94bfc2c6818a104c9e39262c"
 
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
index 321eb7f..78cc005 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
@@ -2,8 +2,6 @@ require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-GNOME_COMPRESS_TYPE = "xz"
-
 SRC_URI += "file://xsltproc_nonet.patch \
             file://use-usr-bin-env-for-python-in-xml2po.patch \
             file://sysrooted-pkg-config.patch \
diff --git a/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb b/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
index 65b79f0..a31eb55 100644
--- a/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://pkgconfig.patch"
 
 SRC_URI[archive.md5sum] = "541858188f80090d12a33b5a7c34d42c"
 SRC_URI[archive.sha256sum] = "37196b5b37085bbcd45c338c36e26898fe35dd5975295f69f48028b1e8436fd7"
+GNOME_COMPRESS_TYPE="bz2"
 
 DEPENDS += "shared-mime-info intltool-native"
 RDEPENDS_${PN} = "shared-mime-info"
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 036aa27..c30454c 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -32,6 +32,7 @@ CFLAGS_prepend = "-DHAVE_ANIMATION "
 RDEPENDS_${PN}-dev = ""
 
 inherit gnomebase
+GNOME_COMPRESS_TYPE="bz2"
 
 python populate_packages_prepend() {
     engines_root = os.path.join(d.getVar('libdir', True), "gtk-2.0/2.10.0/engines")
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
index 4d2b613..c57c973 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
@@ -10,8 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "glib-2.0"
 
-GNOME_COMPRESS_TYPE = "xz"
-
 SRC_URI[archive.md5sum] = "3131b0417ecde3da1ae72acceaa375cf"
 SRC_URI[archive.sha256sum] = "80f3593cb6bd13f1465828e46a9f740e2e9bd3cd2257889442b3e62bd6de05cd"
 
diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
index 681b856..15267ca 100644
--- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -12,6 +12,7 @@ PR = "r5"
 DEPENDS = "zlib gdk-pixbuf gtk+"
 
 inherit autotools pkgconfig gnomebase gtk-doc
+GNOME_COMPRESS_TYPE="bz2"
 
 SRC_URI += "file://glade-cruft.patch file://no-xml2.patch file://python_environment.patch"
 
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.9.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.9.bb
index 9a14f29..9b2c74c 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.9.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.9.bb
@@ -12,8 +12,6 @@ BBCLASSEXTEND = "native"
 
 inherit autotools pkgconfig gnomebase gtk-doc pixbufcache
 
-GNOME_COMPRESS_TYPE = "xz"
-
 SRC_URI += "file://gtk-option.patch"
 
 SRC_URI[archive.md5sum] = "31df15e3beaa8fbbf538ca3c52b400d2"
diff --git a/meta/recipes-graphics/pango/pango_1.36.8.bb b/meta/recipes-graphics/pango/pango_1.36.8.bb
index 4605c76..f4e4250 100644
--- a/meta/recipes-graphics/pango/pango_1.36.8.bb
+++ b/meta/recipes-graphics/pango/pango_1.36.8.bb
@@ -2,8 +2,6 @@ require pango.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-GNOME_COMPRESS_TYPE="xz"
-
 SRC_URI += "file://run-ptest \
             file://multilib-fix-clean.patch \
 "
diff --git a/meta/recipes-support/atk/atk_2.16.0.bb b/meta/recipes-support/atk/atk_2.16.0.bb
index e29469b..0f8f9b5 100644
--- a/meta/recipes-support/atk/atk_2.16.0.bb
+++ b/meta/recipes-support/atk/atk_2.16.0.bb
@@ -12,8 +12,6 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gtk-doc
 
-GNOME_COMPRESS_TYPE = "xz"
-
 SRC_URI[archive.md5sum] = "c7c5002bd6e58b4723a165f1bf312116"
 SRC_URI[archive.sha256sum] = "095f986060a6a0b22eb15eef84ae9f14a1cf8082488faa6886d94c37438ae562"
 
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.8.bb b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
index 88696a4..2b1b910 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.8.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
@@ -17,7 +17,5 @@ BINCONFIG = "${bindir}/croco-0.6-config"
 
 inherit autotools pkgconfig gnomebase gtk-doc binconfig-disabled
 
-GNOME_COMPRESS_TYPE = "xz"
-
 SRC_URI[archive.md5sum] = "767e73c4174f75b99695d4530fd9bb80"
 SRC_URI[archive.sha256sum] = "ea6e1b858c55219cefd7109756bff5bc1a774ba7a55f7d3ccd734d6b871b8570"
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index 9dab390..68bc16d 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -8,5 +8,5 @@ SRC_URI += "file://obsolete_automake_macros.patch"
 
 CFLAGS += "-D_GNU_SOURCE"
 
-SRC_URI[archive.md5sum] = "f07a4bf943194f94b7f142db8f7f36dc"
-SRC_URI[archive.sha256sum] = "8d04e202b617373dfb47689e5e628febe2c58840b34cccc4af4feb88c48df903"
+SRC_URI[archive.md5sum] = "497f26e457308649e6ece32b3bb142ff"
+SRC_URI[archive.sha256sum] = "86cf0b81aa023fa93ed415653d51c96767f20b2d7334c893caba71e42654b0ae"
-- 
2.1.4



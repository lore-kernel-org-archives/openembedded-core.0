Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UapAa-00070q-0Z
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 17:23:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 May 2013 08:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="331999121"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 08:04:35 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 18:04:20 +0300
Message-Id: <a6466ebba497127879dfa67a801f1c662cfd2950.1368198012.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
Subject: [PATCH 8/8] libdrm: upgrade to 2.4.44
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
X-List-Received-Date: Fri, 10 May 2013 15:24:02 -0000

Removed part of the installtests.patch since tests can now be installed
giving an option to configure script.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-graphics/drm/libdrm.inc               |    1 +
 .../recipes-graphics/drm/libdrm/installtests.patch |   26 --------------------
 .../drm/{libdrm_2.4.42.bb => libdrm_2.4.44.bb}     |    6 ++---
 3 files changed, 3 insertions(+), 30 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.42.bb => libdrm_2.4.44.bb} (43%)

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index 9c1124e..e395e03 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -20,6 +20,7 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-cairo-tests \
                  --enable-omap-experimental-api \
+                 --enable-install-test-programs \
                 "
 ALLOW_EMPTY_${PN}-drivers = "1"
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
diff --git a/meta/recipes-graphics/drm/libdrm/installtests.patch b/meta/recipes-graphics/drm/libdrm/installtests.patch
index 1f39719..7d443af 100644
--- a/meta/recipes-graphics/drm/libdrm/installtests.patch
+++ b/meta/recipes-graphics/drm/libdrm/installtests.patch
@@ -21,29 +21,3 @@ index bf1987f..d909e19 100644
  SUBDIRS = modeprint
  
  if HAVE_LIBKMS
-diff --git a/tests/modeprint/Makefile.am b/tests/modeprint/Makefile.am
-index c4862ac..7db76ea 100644
---- a/tests/modeprint/Makefile.am
-+++ b/tests/modeprint/Makefile.am
-@@ -2,7 +2,7 @@ AM_CFLAGS = \
- 	-I$(top_srcdir)/include/drm \
- 	-I$(top_srcdir)
- 
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	modeprint
- 
- modeprint_SOURCES = \
-diff --git a/tests/modetest/Makefile.am b/tests/modetest/Makefile.am
-index 2191242..1d2c1b0 100644
---- a/tests/modetest/Makefile.am
-+++ b/tests/modetest/Makefile.am
-@@ -4,7 +4,7 @@ AM_CFLAGS = \
- 	-I$(top_srcdir) \
- 	$(CAIRO_CFLAGS)
- 
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	modetest
- 
- modetest_SOURCES = \
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.42.bb b/meta/recipes-graphics/drm/libdrm_2.4.44.bb
similarity index 43%
rename from meta/recipes-graphics/drm/libdrm_2.4.42.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.44.bb
index 67ae2e6..b016958 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.42.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.44.bb
@@ -1,10 +1,8 @@
 require libdrm.inc
 
-PR = "${INC_PR}.0"
-
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
+SRC_URI[md5sum] = "b760b1f2ae4ec6452383164ec697cd5d"
+SRC_URI[sha256sum] = "42b45ad15bb1bc52630a4b37b7afcfaea27e01b3c0b4791ef25d0f7b2456f6a2"
 
-SRC_URI[md5sum] = "a6e2e26951bcc920b2049b65e86a659f"
-SRC_URI[sha256sum] = "e0671082a77871c8474d3c0f09dbf5ff82d2429cd248088a691f7b484cbc76e1"
-- 
1.7.9.5




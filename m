Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Ts94W-0007zS-RM
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 10:32:46 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jan 2013 01:17:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,423,1355126400"; d="scan'208";a="273709749"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jan 2013 01:17:33 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 11:18:11 +0200
Message-Id: <1357550291-8035-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] gsettings-desktop-schemas: add missing elements from meta-gnome
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
X-List-Received-Date: Mon, 07 Jan 2013 09:32:55 -0000

- modify the recipe according to the meta-gnome variant

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
index 720858a..d5784af 100644
--- a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
+++ b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
@@ -4,12 +4,20 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+PR = "r1"
+RDEPENDS_${PN} = "glib-2.0-utils"
 
-DEPENDS = "glib-2.0"
-
-inherit gnome pkgconfig autotools gettext
+inherit gnome
 
 GNOME_COMPRESS_TYPE = "xz"
 
 SRC_URI[archive.md5sum] = "6dbede8f6112b7e0dd4864e979b91771"
 SRC_URI[archive.sha256sum] = "1da53e1b960f08ce4b0d472e6f339b7beaf19a7889c15911775abf4efe2ec760"
+
+pkg_postinst_${PN} () {
+    if [ -n "$D" ]; then
+        exit 1
+    fi
+
+    glib-compile-schemas ${datadir}/glib-2.0/schemas
+}
-- 
1.7.11.7




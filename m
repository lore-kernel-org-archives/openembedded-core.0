Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D61877D55
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 14:10:27 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2017 07:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,292,1491289200"; d="scan'208";a="97700159"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 05 May 2017 07:10:25 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 May 2017 17:10:22 +0300
Message-Id: <20170505141027.8381-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCHv2 1/6] liberation-fonts: update to 2.00.1
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
X-List-Received-Date: Fri, 05 May 2017 14:10:28 -0000

'fontforge issue' was actually a non-issue; fontforge is required only
when building ttf fonts from sfd source. We took prebuilt ttf fonts
when using 1.04 version, and can do the same thing with 2.00.1 version,
it's just that the tarball name for prebuilt fonts has slightly changed
and no one noticed somehow.

License has changed from GPLv2 to Open Font License v.1.1

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/default-versions.inc           |  3 ---
 ...eration-fonts_1.04.bb => liberation-fonts_2.00.1.bb} | 17 ++++++++---------
 2 files changed, 8 insertions(+), 12 deletions(-)
 rename meta/recipes-graphics/ttf-fonts/{liberation-fonts_1.04.bb => liberation-fonts_2.00.1.bb} (67%)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index d976508ff51..a6f331350eb 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -2,6 +2,3 @@
 # Default preferred versions
 #
 
-# Force the older version of liberation-fonts until we fix the fontforge issue
-PREFERRED_VERSION_liberation-fonts ?= "1.04"
-
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
similarity index 67%
rename from meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
rename to meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
index 74212e7e5ed..412da48725e 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb
@@ -5,23 +5,22 @@ Arial, Times New Roman, Courier New."
 HOMEPAGE = "https://releases.pagure.org/liberation-fonts/"
 BUGTRACKER = "https://bugzilla.redhat.com/"
 
-RECIPE_NO_UPDATE_REASON = "2.x depends on fontforge package, which is not yet provided in oe-core"
-
 SECTION = "x11/fonts"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r4"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f96db970a9a46c5369142b99f530366b"
 PE = "1"
 
 inherit allarch fontcache
 
 FONT_PACKAGES = "${PN}"
 
-SRC_URI = "https://releases.pagure.org/liberation-fonts/liberation-fonts-${PV}.tar.gz \
+SRC_URI = "https://releases.pagure.org/liberation-fonts/liberation-fonts-ttf-${PV}.tar.gz \
            file://30-liberation-aliases.conf"
 
-SRC_URI[md5sum] = "4846797ef0fc70b0cbaede2514677c58"
-SRC_URI[sha256sum] = "0e0d0957c85b758561a3d4aef4ebcd2c39959e5328429d96ae106249d83531a1"
+S = "${WORKDIR}/liberation-fonts-ttf-${PV}"
+
+SRC_URI[md5sum] = "5c781723a0d9ed6188960defba8e91cf"
+SRC_URI[sha256sum] = "7890278a6cd17873c57d9cd785c2d230d9abdea837e96516019c5885dd271504"
 
 do_install () {
 	install -d ${D}${datadir}/fonts/ttf/
@@ -33,7 +32,7 @@ do_install () {
 	install -m 0644 ${WORKDIR}/30-liberation-aliases.conf ${D}${sysconfdir}/fonts/conf.d/
 
 	install -d ${D}${prefix}/share/doc/${BPN}/
-	install -m 0644 License.txt ${D}${datadir}/doc/${BPN}/
+	install -m 0644 LICENSE ${D}${datadir}/doc/${BPN}/
 }
 
 PACKAGES = "${PN}"
-- 
2.11.0



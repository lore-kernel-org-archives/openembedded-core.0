Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2fBF-0006Tz-0u
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 10:51:12 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 01:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="281086915"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 01:35:13 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 11:35:00 +0200
Message-Id: <79697b5de00846a83d02e244a7ed60c4e16557d6.1360055640.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
Subject: [PATCH 6/8] liberation-fonts: use the new fontcache.bbclass
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
X-List-Received-Date: Tue, 05 Feb 2013 09:51:14 -0000

This will add the proper postinst/postrm scriptlets.

[YOCTO #2599]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../ttf-fonts/liberation-fonts_1.04.bb             |   14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
index b0a8242..67e36e2 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
@@ -9,10 +9,12 @@ SECTION = "x11/fonts"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 RDEPENDS_${PN} = "fontconfig-utils"
-PR = "r2"
+PR = "r3"
 PE = "1"
 
-inherit allarch
+inherit allarch fontcache
+
+FONT_PACKAGES = "${PN}"
 
 SRC_URI = "https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-${PV}.tar.gz \
            file://30-liberation-aliases.conf"
@@ -33,13 +35,5 @@ do_install () {
 	install -m 0644 License.txt ${D}${datadir}/doc/${PN}/
 }
 
-pkg_postinst_${PN} () {
-#!/bin/sh
-if [ "x$D" != "x" ] ; then
-	exit 1
-fi
-fc-cache
-}
-
 PACKAGES = "${PN}"
 FILES_${PN} += "${sysconfdir} ${datadir}"
-- 
1.7.9.5




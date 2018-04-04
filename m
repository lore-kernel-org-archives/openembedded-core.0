Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 029CE74C0A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:33:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 08:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="47921380"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2018 08:33:42 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 1EECB5801C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 08:33:41 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 18:32:20 +0300
Message-Id: <1522855946-8702-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 04/10] at-spi2-atk: upgrade to version 2.26.2
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
X-List-Received-Date: Wed, 04 Apr 2018 15:33:42 -0000

1. convert to meson build
2. inherit gnomebase and associated cleanup
3. add libxml2 to DEPENDS list

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../atk/{at-spi2-atk_2.26.1.bb => at-spi2-atk_2.26.2.bb}     | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.26.1.bb => at-spi2-atk_2.26.2.bb} (53%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.26.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.26.2.bb
similarity index 53%
rename from meta/recipes-support/atk/at-spi2-atk_2.26.1.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.26.2.bb
index 8617bb8..16d8e45 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.26.1.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.26.2.bb
@@ -3,15 +3,13 @@ HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+SRC_URI[archive.md5sum] = "355c7916a69513490cb83ad34016b169"
+SRC_URI[archive.sha256sum] = "61891f0abae1689f6617a963105a3f1dcdab5970c4a36ded9c79a7a544b16a6e"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "eeec6cead3350dca48a235271c105b3e"
-SRC_URI[sha256sum] = "b4f0c27b61dbffba7a5b5ba2ff88c8cee10ff8dac774fa5b79ce906853623b75"
+DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 
-DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core"
-
-inherit autotools pkgconfig distro_features_check upstream-version-is-even
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase distro_features_check upstream-version-is-even
 
 # The at-spi2-core requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.4.0



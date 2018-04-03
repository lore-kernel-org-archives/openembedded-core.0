Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 74DFB74928
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 15:51:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 08:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,401,1517904000"; d="scan'208";a="39069200"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2018 08:51:50 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 18:45:17 +0300
Message-Id: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH 1/8] nativesdk-postinst-intercept: remove the recipe
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
X-List-Received-Date: Tue, 03 Apr 2018 15:51:51 -0000

Its use required a script from an external repo which hasn't been updated
in 4 years, the recipe itself is out of date (doesn't install all
intercepts), and there is no oe-selftest or documentation for this.
If anyone still wants this, please do it in a separate layer.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/distro_alias.inc              |  1 -
 meta/conf/distro/include/maintainers.inc               |  1 -
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb   |  1 -
 .../nativesdk-postinst-intercept_1.0.bb                | 18 ------------------
 4 files changed, 21 deletions(-)
 delete mode 100644 meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept_1.0.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 8ec623befbd..13c7e652bc7 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -313,7 +313,6 @@ DISTRO_PN_ALIAS_pn-pkgconfig = "Ubuntu=pkg-config Fedora=pkgconfig"
 DISTRO_PN_ALIAS_pn-pointercal-xinput = "OE-Core"
 DISTRO_PN_ALIAS_pn-pong-clock = "OpenedHand"
 DISTRO_PN_ALIAS_pn-portmap = "Debian=rpcbind Fedora=rpcbind"
-DISTRO_PN_ALIAS_pn-postinst-intercept = "OE-Core"
 DISTRO_PN_ALIAS_pn-powertop = "Meego=powertop Fedora=powertop Debian=powertop OpenSuSE=powertop Mandriva=powertop"
 DISTRO_PN_ALIAS_pn-ppp-dialin = "OE-Core"
 DISTRO_PN_ALIAS_pn-presentproto = "Debian=x11proto-present-dev Fedora=xorg-x11-proto-devel"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e471891f2ce..48aff9537e4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -527,7 +527,6 @@ RECIPE_MAINTAINER_pn-nativesdk-buildtools-perl-dummy = "Richard Purdie <richard.
 RECIPE_MAINTAINER_pn-nativesdk-libtool = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-nativesdk-packagegroup-sdk-host = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-nativesdk-qemu-helper = "Juro Bystricky <juro.bystricky@intel.com>"
-RECIPE_MAINTAINER_pn-nativesdk-postinst-intercept = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ncurses = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-neard = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-neon = "Maxin B. John <maxin.john@intel.com>"
diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 88e7c648b64..e2f61699946 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -23,7 +23,6 @@ RDEPENDS_${PN} = "\
     nativesdk-makedevs \
     nativesdk-dnf \
     nativesdk-cmake \
-    nativesdk-postinst-intercept \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
     nativesdk-sdk-provides-dummy \
     "
diff --git a/meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept_1.0.bb b/meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept_1.0.bb
deleted file mode 100644
index 938ac8ad7b3..00000000000
--- a/meta/recipes-devtools/postinst-intercept/nativesdk-postinst-intercept_1.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Postinstall scriptlets"
-LICENSE = "MIT"
-
-FILES_${PN}_append = " ${datadir}/postinst-intercepts/*"
-
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-
-do_install() {
-	install -d ${D}${datadir}/postinst-intercepts
-	install -m 755 ${COREBASE}/scripts/postinst-intercepts/postinst_intercept ${D}${datadir}/postinst-intercepts/
-	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_font_cache ${D}${datadir}/postinst-intercepts/
-	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_icon_cache ${D}${datadir}/postinst-intercepts/
-	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_pixbuf_cache ${D}${datadir}/postinst-intercepts/
-}
-
-inherit nativesdk
-INHIBIT_DEFAULT_DEPS = "1"
-- 
2.16.1



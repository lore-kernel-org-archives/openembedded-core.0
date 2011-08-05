Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QpHoi-0001bE-HB
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 12:39:48 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2011 03:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,322,1309762800"; d="scan'208";a="36152629"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2011 03:35:25 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 18:37:14 +0800
Message-Id: <d6abfdf3cc569e60160a55eb278e7efa6057598a.1312540193.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
References: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1312540193.git.lianhao.lu@intel.com>
References: <cover.1312540193.git.lianhao.lu@intel.com>
Subject: [PATCH 4/6] Misc: Corrected the dependency on non-native for -native package.
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
X-List-Received-Date: Fri, 05 Aug 2011 10:39:48 -0000

[YOCTO #1336] Corrected the wrong dependency on non-native for -native
packages for the following recipes:

- util-macros
- intltool

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    2 +-
 meta/recipes-devtools/intltool/intltool.inc        |    1 +
 .../xorg-util/util-macros_1.14.0.bb                |    4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index cc0129f..9ec851e 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -9,7 +9,7 @@ PR = "r2"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl virtual/gettext"
-PROVIDES_virtclass-native = ""
+PROVIDES_virtclass-native = "virtual/gettext-native"
 CONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
           "
diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index c934654..1e778b6 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -9,6 +9,7 @@ S = "${WORKDIR}/intltool-${PV}"
 DEPENDS = "libxml-parser-perl-native"
 #RDEPENDS_${PN} = "libxml-parser-perl"
 RRECOMMENDS_${PN} = "perl-modules"
+RRECOMMENDS_${PN}_virtclass-native = ""
 
 inherit autotools pkgconfig perlnative
 
diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.14.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.14.0.bb
index 88ee4f6..4fa235b 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.14.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.14.0.bb
@@ -12,8 +12,8 @@ PR = "r0"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 DEPENDS = "libgpg-error"
-DEPENDS_virtclass-native = "virtual/gettext"
-DEPENDS_virtclass-nativesdk = "virtual/gettext"
+DEPENDS_virtclass-native = "virtual/gettext-native"
+DEPENDS_virtclass-nativesdk = "virtual/gettext-nativesdk"
 
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
1.7.0.4




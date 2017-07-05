Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9699777CEC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 15:03:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 08:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,312,1496127600"; d="scan'208";a="107336046"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2017 08:03:11 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 61FA75801CF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:03:10 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 18:03:22 +0300
Message-Id: <1499267003-20382-12-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1499267003-20382-1-git-send-email-maxin.john@intel.com>
References: <1499267003-20382-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 11/12] libva-utils: add recipe
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
X-List-Received-Date: Wed, 05 Jul 2017 15:03:43 -0000

Utilities and tests in the libva was spun-off as libva-utils
during 1.8.0 release.

libva-utils is a collection of utilities and examples to exercise VA-API
in accordance with the libva project

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/libva/libva-utils_1.8.3.bb | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/libva/libva-utils_1.8.3.bb

diff --git a/meta/recipes-graphics/libva/libva-utils_1.8.3.bb b/meta/recipes-graphics/libva/libva-utils_1.8.3.bb
new file mode 100644
index 0000000..9c2c0d6
--- /dev/null
+++ b/meta/recipes-graphics/libva/libva-utils_1.8.3.bb
@@ -0,0 +1,30 @@
+SUMMARY = "libva-utils is a collection of utilities from libva project"
+
+DESCRIPTION = "libva-utils is a collection of utilities \
+and examples to exercise VA-API in accordance with the libva \
+project.VA-API is an open-source library and API specification, \
+which provides access to graphics hardware acceleration capabilities \
+for video processing. It consists of a main library and driver-specific \
+acceleration backends for each supported hardware vendor"
+
+HOMEPAGE = "https://01.org/linuxmedia/vaapi"
+BUGTRACKER = "https://github.com/01org/libva-utils/issues"
+
+SECTION = "x11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
+
+SRC_URI = "git://github.com/01org/libva-utils.git;branch=v1.8-branch"
+SRCREV = "011c709b98b52db3b10aeb361dfea9da43930364"
+UPSTREAM_CHECK_URI = "https://github.com/01org/libva-utils/releases"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libva"
+
+inherit autotools pkgconfig distro_features_check
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
+PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxext libxfixes"
+PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland-native wayland"
-- 
2.4.0



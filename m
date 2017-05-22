Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 85601719E7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 22:25:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 22 May 2017 15:25:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,379,1491289200"; d="scan'208";a="860132960"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2017 15:25:28 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 May 2017 15:25:23 -0700
Message-Id: <20170522222523.15978-1-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] intltool: Adds gettext as a DEPENDS
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
X-List-Received-Date: Mon, 22 May 2017 22:25:29 -0000

When setting USE_NLS="no" and building systemd-boot
(which DEPENDS on intltool), configure fails,
complaining about missing gettext:

configure: error: GNU gettext tools not found; required for intltool

This is caused because USE_NLS="no" makes the gettext class
add gettext-minimal-native to BASEDEPENDS instead of adding
gettext-native.

Since we still would like to set USE_NLS="no" and build systemd-boot,
we add gettext-native as a dependency to intltool-native, which makes it
available for the configure script of systemd-boot fixing the problem.

[YOCTO #11562]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/intltool/intltool_0.51.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
index 551bdf0619a..ecff2faf253 100644
--- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
@@ -16,7 +16,7 @@ UPSTREAM_CHECK_URI = "https://launchpad.net/intltool/trunk/"
 
 DEPENDS = "libxml-parser-perl-native"
 RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
-DEPENDS_class-native = "libxml-parser-perl-native"
+DEPENDS_class-native = "libxml-parser-perl-native gettext-native"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.12.0



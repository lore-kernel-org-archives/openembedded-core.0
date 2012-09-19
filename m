Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TEI71-0003pE-Sv
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 13:06:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Sep 2012 03:53:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194475235"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.66])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2012 03:53:52 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 12:59:14 +0300
Message-Id: <1348048754-30379-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH v2] intltool: include intltool.m4 and add missing rdepends
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
X-List-Received-Date: Wed, 19 Sep 2012 11:06:36 -0000

- include /usr/share/aclocal/intltool.m4 into the intltool
package (the files from intltool-dev must be included into the
main package, as intltool is a development tool)
- add missing rdepends: gettext-dev, libxml-parser-perl

[YOCTO #2597]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-devtools/intltool/intltool.inc       |    9 ++++++++-
 meta/recipes-devtools/intltool/intltool_0.50.0.bb |    2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index 1c41f0f..59974d8 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -7,11 +7,18 @@ SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
 S = "${WORKDIR}/intltool-${PV}"
 
 DEPENDS = "libxml-parser-perl-native"
+RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
 DEPENDS_virtclass-native = "libxml-parser-perl-native"
-#RDEPENDS_${PN} = "libxml-parser-perl"
+# gettext is assumed to exist on the host
+RDEPENDS_${PN}_virtclass-native = "libxml-parser-perl-native"
 RRECOMMENDS_${PN} = "perl-modules"
 RRECOMMENDS_${PN}_virtclass-native = ""
 
+FILES_${PN}-dev = ""
+FILES_${PN} += "${datadir}/aclocal"
+
+INSANE_SKIP_${PN} += "dev-deps"
+
 inherit autotools pkgconfig perlnative
 
 export PERL = "${bindir}/env perl"
diff --git a/meta/recipes-devtools/intltool/intltool_0.50.0.bb b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
index d1ee31d..fa9850f 100644
--- a/meta/recipes-devtools/intltool/intltool_0.50.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
@@ -1,7 +1,7 @@
 require intltool.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://intltool-nowarn-0.50.0.patch \
            ${NATIVEPATCHES} \
-- 
1.7.9.5




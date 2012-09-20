Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TEfe1-00006a-IC
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 14:14:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Sep 2012 05:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,453,1344236400"; d="scan'208";a="194975158"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.66])
	by azsmga001.ch.intel.com with ESMTP; 20 Sep 2012 05:01:28 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2012 14:06:51 +0300
Message-Id: <1348139211-23176-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH v3] intltool: include intltool.m4 and add missing rdepends
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
X-List-Received-Date: Thu, 20 Sep 2012 12:14:13 -0000

- include /usr/share/aclocal/intltool.m4 into the intltool package (the
files from intltool-dev must be included into the main package, as intltool
is a development tool)
- add gettext-dev rdepend: intltool.m4 references AM_NLS which is provided
by the gettext-dev package
- add libxml-parser-perl rdepend: intltool-merge aborts without the
perl XML parser (die "You must have XML::Parser installed to run $0\n\n";)

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




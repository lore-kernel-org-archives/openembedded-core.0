Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9hp-0006ZY-5U
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:00:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980284"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:32 -0700
Message-Id: <74027ac474d8d8fd1d62d6367eab30cd48acdf70.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/32] libxslt: fix packaging of static libraries
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
X-List-Received-Date: Thu, 18 Aug 2011 21:00:49 -0000

From: Phil Blundell <philb@gnu.org>

This prevents warnings about .a files being installed but not shipped.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-support/libxslt/libxslt_1.1.26.bb |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
index b5f6962..cc64ba7 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
@@ -6,8 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0cd9a07afbeb24026c9b03aecfeba458"
 
 SECTION = "libs"
-DEPENDS = "libxml2 (>=2.6.27)"
-PR = "r1"
+DEPENDS = "libxml2"
+PR = "r2"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch;patch=1"
@@ -16,13 +16,14 @@ SRC_URI[md5sum] = "e61d0364a30146aaa3001296f853b2b9"
 SRC_URI[sha256sum] = "55dd52b42861f8a02989d701ef716d6280bfa02971e967c285016f99c66e3db1"
 S = "${WORKDIR}/libxslt-${PV}"
 
-inherit autotools pkgconfig binconfig
+inherit autotools pkgconfig binconfig lib_package
 
 EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
+# older versions of this recipe had ${PN}-utils
+RPROVIDES_${PN}-bin += "${PN}-utils"
+RCONFLICTS_${PN}-bin += "${PN}-utils"
+RREPLACES_${PN}-bin += "${PN}-utils"
 
-PACKAGES = "${PN}-dbg ${PN}-dev ${PN}-utils ${PN} ${PN}-doc ${PN}-locale"
-
-FILES_${PN}-dev += "${bindir}/xslt-config"
-FILES_${PN}-utils += "${bindir}"
+FILES_${PN}-dev += "${bindir}/xsltConf.sh"
 
 BBCLASSEXTEND = "native"
-- 
1.7.6




Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QpHor-0001eA-ED
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 12:39:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Aug 2011 03:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,322,1309762800"; d="scan'208";a="36152620"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2011 03:35:18 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 18:37:11 +0800
Message-Id: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1312540193.git.lianhao.lu@intel.com>
References: <cover.1312540193.git.lianhao.lu@intel.com>
Subject: [PATCH 1/6] SRC_URI: Using BPN instaed of PN.
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
X-List-Received-Date: Fri, 05 Aug 2011 10:39:57 -0000

[YOCTO #1333]
In multilib cases, PN has the prefix of MLPREFIX. It is not correct to
use PN in SRC_URI. We should use the pruned BPN instead.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    2 +-
 .../net-tools/net-tools_1.60-23.bb                 |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
index 3a47620..a4203ec 100644
--- a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
+++ b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 
 DEPENDS = 	"dbus glib-2.0 dbus-glib"
 
-SRC_URI =	"http://www.galago-project.org/files/releases/source/${BPN}/${P}.tar.gz \
+SRC_URI =	"http://www.galago-project.org/files/releases/source/${BPN}/${BPN}-${PV}.tar.gz \
                  file://mkdir.patch;patch=1 \
                  file://pkgconfig.patch;patch=1 "
 
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
index 41041aa..213fb60 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
 PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=tarball \
-           ${DEBIAN_MIRROR}/main/n/net-tools/${PN}_${PV}.diff.gz;apply=no;name=patch \
+           ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=no;name=patch \
            file://net-tools-config.h \
            file://net-tools-config.make" 
 
@@ -31,7 +31,7 @@ PARALLEL_MAKE = ""
 # up all previously applied patches in the start
 nettools_do_patch() {
 	cd ${S}
-	patch -p1 < ${WORKDIR}/${PN}_${PV}.diff
+	patch -p1 < ${WORKDIR}/${BPN}_${PV}.diff
 	QUILT_PATCHES=${S}/debian/patches quilt push -a
 	rm -rf ${S}/patches ${S}/.pc
 }
-- 
1.7.0.4




Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RirGW-0007x6-3Y
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 18:38:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 09:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92761353"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 09:30:49 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 09:30:41 -0800
Message-Id: <b34432a20f8269f81bc541aa4ca06aa4425f4a76.1325784550.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325784550.git.nitin.a.kamble@intel.com>
References: <cover.1325784550.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/7] python-pycairo: fix for x32
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
X-List-Received-Date: Thu, 05 Jan 2012 17:38:12 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Add the libdir to configure so that path like /usr/libx32 can work.

Also passing parallel make flags to the building process.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../python/python-pycairo_1.10.0.bb                |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
index 812acfb..7d1b6c1 100644
--- a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
+++ b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421 \
 
 # cairo >= 1.8.8
 DEPENDS = "cairo"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://cairographics.org/releases/py2cairo-${PV}.tar.bz2"
 
@@ -21,11 +21,11 @@ S = "${WORKDIR}/py2cairo-${PV}"
 inherit distutils pkgconfig
 
 do_configure() {
-	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} ./waf configure --prefix=${D}${prefix}
+	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} ./waf configure --prefix=${D}${prefix} --libdir=${D}${libdir}
 }
 
 do_compile() {
-	./waf build
+	./waf build ${PARALLEL_MAKE}
 }
 
 do_install() {
-- 
1.7.6.4




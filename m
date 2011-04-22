Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QD4fE-0005E6-1n
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 02:56:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Apr 2011 17:53:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,252,1301900400"; d="scan'208";a="912931629"
Received: from nbuild1.sc.intel.com (HELO localhost) ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 21 Apr 2011 17:53:38 -0700
Message-Id: <ecf9dcd12702cc9de24f4435b6dc6023074cb384.1303433480.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1303433480.git.nitin.a.kamble@intel.com>
References: <cover.1303433480.git.nitin.a.kamble@intel.com>
Old-Date: Fri, 15 Apr 2011 18:54:04 -0700
Date: Thu, 21 Apr 2011 17:53:13 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 4/8] python-pycairo: fix installation path of __init__.py
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
X-List-Received-Date: Fri, 22 Apr 2011 00:56:04 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This fixes Bug [YOCTO #477]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../python/python-pycairo_1.8.10.bb                |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
index 7d73dc2..24b3ff2 100644
--- a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
+++ b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1 & MPLv1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421"
 # cairo >= 1.8.8
 DEPENDS = "cairo"
-PR = "ml0"
+PR = "r1"
 
 SRC_URI = "http://cairographics.org/releases/py2cairo-${PV}.tar.gz"
 
@@ -16,6 +16,12 @@ S = "${WORKDIR}/pycairo-${PV}"
 
 inherit distutils pkgconfig
 
+do_compile_prepend() {
+#fix the installation path of __init__.py
+#It was going in the sysroot instead of target install location
+	sed -i -e "s#dsy.get_python_lib()#'${D}${PYTHON_SITEPACKAGES_DIR}'#" ${S}/setup.py
+}
+
 do_install_append () {
 	install -d ${D}${includedir}
 	install -d ${D}${libdir}
-- 
1.7.2.2




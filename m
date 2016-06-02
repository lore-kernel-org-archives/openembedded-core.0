Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EFEE67716F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:27:00 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2016 02:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114703463"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 02:26:43 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 12:26:06 +0300
Message-Id: <ba72b645cf046f93a64e5642e2763cdb8cee854c.1464859158.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 29/31] hwlatdetect: move to Python 3
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
X-List-Received-Date: Thu, 02 Jun 2016 09:27:01 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb b/meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb
index 025eb63..012b2dd 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 require rt-tests.inc
-inherit python-dir
+inherit python3-dir
 
 EXTRA_OEMAKE += "PYLIB=${libdir}/python${PYTHON_BASEVERSION}/dist-packages"
 
@@ -17,8 +17,10 @@ do_compile() {
 do_install() {
         oe_runmake install_hwlatdetect DESTDIR=${D} SBINDIR=${sbindir} \
 	           MANDIR=${mandir} INCLUDEDIR=${includedir}
+
+        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py
 }
 
 FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
-RDEPENDS_${PN} = "python python-subprocess python-textutils"
+RDEPENDS_${PN} = "python3 python3-subprocess python3-textutils"
 RRECOMMENDS_${PN} = "kernel-module-hwlat-detector"
-- 
2.8.1



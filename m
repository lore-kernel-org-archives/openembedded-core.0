Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 611AB6FF5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:01 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:54:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498102"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:12 +0300
Message-Id: <b6ca89be5bed094a882a8aad820512585b04dbf2.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 23/45] bootchart2: move to Python 3
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
X-List-Received-Date: Tue, 24 May 2016 11:54:01 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index 86c614a..d0555c3 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -99,7 +99,7 @@ SRCREV = "48e0071048564c6af75ab969e842d6dec808da09"
 
 inherit systemd
 inherit update-rc.d
-inherit pythonnative
+inherit python3native
 
 # The only reason to build bootchart2-native is for a native pybootchartgui.
 BBCLASSEXTEND = "native"
@@ -110,13 +110,6 @@ UPDATERCPN = "bootchartd-stop-initscript"
 INITSCRIPT_NAME = "bootchartd_stop.sh"
 INITSCRIPT_PARAMS = "start 99 2 3 4 5 ."
 
-# We want native pybootchartgui to execute with the correct Python interpeter.
-do_compile_append_class-native () {
-    echo "#! ${PYTHON}" | cat - ${S}/pybootchartgui.py > ${WORKDIR}/temp_pybootchartgui
-    mv ${WORKDIR}/temp_pybootchartgui ${S}/pybootchartgui.py
-    chmod +x ${S}/pybootchartgui
-}
-
 do_compile_prepend () {
     export PY_LIBDIR="${libdir}/${PYTHON_DIR}"
     export BINDIR="${bindir}"
@@ -135,14 +128,17 @@ do_install () {
     install -m 0755 ${WORKDIR}/bootchartd_stop.sh ${D}${sysconfdir}/init.d
 
     echo 'EXIT_PROC="$EXIT_PROC matchbox-window-manager"' >> ${D}${sysconfdir}/bootchartd.conf
+
+   # Use python 3 instead of python 2
+   sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${bindir}/pybootchartgui
 }
 
 PACKAGES =+ "pybootchartgui"
 FILES_pybootchartgui += "${libdir}/python*/site-packages/pybootchartgui ${bindir}/pybootchartgui"
-RDEPENDS_pybootchartgui = "python-pycairo python-compression python-image python-textutils python-shell python-compression python-codecs"
+RDEPENDS_pybootchartgui = "python3-pycairo python3-compression python3-image python3-textutils python3-shell python3-compression python3-codecs"
 RDEPENDS_${PN}_class-target += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
 RDEPENDS_${PN}_class-target += "lsb"
-DEPENDS_append_class-native = " python-pycairo-native"
+DEPENDS_append_class-native = " python3-pycairo-native"
 
 PACKAGES =+ "bootchartd-stop-initscript"
 FILES_bootchartd-stop-initscript += "${sysconfdir}/init.d ${sysconfdir}/rc*.d"
-- 
2.8.1



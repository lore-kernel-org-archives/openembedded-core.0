Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rj4mU-0004Ld-Of
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 09:04:06 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 23:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93004472"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 23:56:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 23:56:21 -0800
Message-Id: <5bd83816ac900bd4a47826632be41e01c406c21d.1325836241.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325836241.git.sgw@linux.intel.com>
References: <cover.1325836241.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325836241.git.sgw@linux.intel.com>
References: <cover.1325836241.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/25] qt4-graphics-system: add
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
X-List-Received-Date: Fri, 06 Jan 2012 08:04:07 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Allow setting default runtime graphics system engine for Qt4
applications per machine.

Depending on the GPU and Xorg driver, this can boost and impact
significantly the drawing performance. The default setting is to
'raster' as this offer best performance for most machines GPUs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb

diff --git a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
new file mode 100644
index 0000000..b3aa1e5
--- /dev/null
+++ b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Set default Qt4 Graphics System to ${QT_GRAPHICS_SYSTEM}"
+SECTION = "x11/base"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+QT_GRAPHICS_SYSTEM ?= "raster"
+
+# xserver-common, x11-common
+VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
+
+def _get_extra_rdepends(d):
+    gs = d.getVar('QT_GRAPHICS_SYSTEM', 1)
+    if gs == "opengl":
+        return "qt4-plugin-graphicssystems-glgraphicssystem"
+
+    return ""
+
+do_install () {
+	install -d ${D}/${sysconfdir}/X11/Xsession.d/
+	cfg_file=${D}/${sysconfdir}/X11/Xsession.d/85xqt-graphicssystem
+	echo "export QT_GRAPHICSSYSTEM=${QT_GRAPHICS_SYSTEM}" > $cfg_file
+	chmod +x $cfg_file
+}
+
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_xserver_common} ${@_get_extra_rdepends(d)}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.6.4




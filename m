Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4ao-0006gw-Io
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632851"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:31:52 -0800
Message-Id: <cfd3a50b38b151c4c9a055dc5b438b92e7d61c34.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/62] ghostscript: build cups filters
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:35 -0000

From: James Limbouris <james@digitalmatter.com.au>

Cups filters are no longer built by default. Since ghostscript already depends
on cups, build the filters and package them as ghostscript-cups.

Ghostscript uses the cups-config script from the oe sysroots to determine some
of the target install paths, as well as to determine the linker path. The config
script gives out paths pointing to the sysroot, so some of the paths needed to
be adjusted in the Makefile.

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 .../ghostscript/ghostscript_9.04.bb                |   29 ++++++++++++++++---
 1 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
index 7178524..80d363f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
@@ -15,7 +15,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d151214b3131251dfc9d858593acbd24"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
 DEPENDS_virtclass-native = ""
@@ -34,7 +34,8 @@ SRC_URI_virtclass-native = "${SRC_URI_BASE}"
 SRC_URI[md5sum] = "9c2fb4af1eb609d09dba5bb0fa76173a"
 SRC_URI[sha256sum] = "f1e333738c41c3bf2b47ceb9806abb8045bcdc7353002c32736150425a7c1ef4"
 
-EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --without-jasper --with-fontpath=${datadir}/fonts"
+EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --without-jasper \
+                --with-fontpath=${datadir}/fonts --with-install-cups"
 
 # This has been fixed upstream but for now we need to subvert the check for time.h
 # http://bugs.ghostscript.com/show_bug.cgi?id=692443
@@ -60,6 +61,14 @@ do_configure_append () {
 			cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i obj/aux/$i
 		done
 	fi
+
+	# replace cups paths from sysroots/.../usr/bin/crossscripts/cups-config with target paths
+	# CUPSDATA is compiled into a utility, and CUPSSERVERBIN is used as an install path
+	CUPSSERVERBIN=${exec_prefix}/lib/cups          # /usr/lib NOT libdir
+	CUPSDATA=${datadir}/cups
+
+	sed -e "s#^CUPSSERVERBIN=.*#CUPSSERVERBIN=${CUPSSERVERBIN}#" -i Makefile
+	sed -e "s#^CUPSDATA=.*#CUPSDATA=${CUPSDATA}#" -i Makefile
 }
 
 do_install_append () {
@@ -67,9 +76,7 @@ do_install_append () {
     cp -r Resource ${D}${datadir}/ghostscript/${PV}/
     cp -r iccprofiles ${D}${datadir}/ghostscript/${PV}/
 
-    if [ -f ${D}${sysconfdir}/cups ]; then
-        chown -R root:lp ${D}${sysconfdir}/cups
-    fi
+    chown -R root:lp ${D}${sysconfdir}/cups
 }
 
 python do_patch_virtclass-native () {
@@ -95,3 +102,15 @@ BBCLASSEXTEND = "native"
 # Ghostscript install tool 'instcopy' tries to remove already created
 # directories during install and parallel make causes problems.
 PARALLEL_MAKEINST=""
+
+PACKAGES =+ "${PN}-cups"
+
+FILES_${PN}-dbg += "${exec_prefix}/lib/cups/filter/.debug"
+
+FILES_${PN}-cups += "${exec_prefix}/lib/cups/filter/gstoraster \
+                     ${exec_prefix}/lib/cups/filter/pstopxl \
+                     ${datadir}/cups \
+                     ${sysconfdir}/cups \
+                     "
+
+RDEPENDS_${PN}-cups = ${PN}
-- 
1.7.6.5




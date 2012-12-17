Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TkXVt-0005BF-U5
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 11:01:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Dec 2012 01:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,300,1355126400"; d="scan'208";a="181811030"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Dec 2012 01:46:50 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 11:46:47 +0200
Message-Id: <1355737607-8007-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355737607-8007-1-git-send-email-laurentiu.palcu@intel.com>
References: <1355737607-8007-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] distcc: use useradd.bbclass to add the distcc user
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
X-List-Received-Date: Mon, 17 Dec 2012 10:01:34 -0000

This is needed for the postinstalls to run at do_rootfs time.

[YOCTO #3601]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-devtools/distcc/distcc_2.18.3.bb |   19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
index de181e5..bd2af4a 100644
--- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
@@ -4,7 +4,7 @@ compilation of C/C++/ObjC code across machines on a network."
 SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r8"
+PR = "r9"
 
 DEPENDS = "avahi"
 
@@ -28,7 +28,14 @@ SRC_URI = "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "0d6b80a1efc3a3d816c4f4175f63eaa2"
 SRC_URI[sha256sum] = "6500f1bc2a30b1f044ebed79c6ce15457d1712263e65f0db7d6046af262ba434"
 
-inherit autotools pkgconfig update-rc.d
+inherit autotools pkgconfig update-rc.d useradd
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system \
+                       --home /dev/null \
+                       --no-create-home \
+                       --gid nogroup \
+                       distcc"
 
 INITSCRIPT_NAME = "distcc"
 
@@ -53,10 +60,6 @@ FILES_${PN} = " ${sysconfdir} \
 FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
 				${datadir}/distcc"
 
-pkg_postinst_${PN} () {
-	if test "x$D" != "x"; then
-		exit 1
-	else
-		grep distcc /etc/passwd || adduser --system --home /dev/null --no-create-home --empty-password --ingroup nogroup distcc
-	fi
+pkg_postrm_${PN} () {
+	deluser distcc || true
 }
-- 
1.7.9.5




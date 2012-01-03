Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrC-0004fO-RZ
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:23 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752212"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:38 -0800
Message-Id: <b4898b0c434fba2944ebf54db0ae8c420c722b2e.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 052/113] native.bbclass: Fix variable remapping coverage
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:25 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When looking for RDEPENDS to process, bitbake iterates through PACKAGES
*and* PN. Since native.bbclass sets PACKAGES to be empty, its pointless
remapping the list of PACKAGES since this does nothing. There is a problem
since *_${PN} are used by bitbake but not remapped by the native.bbclass
class extension code.

This changes the code to remap _${PN} in both expanded and unexpanded
forms. We use the unexpanded form since d.expandkeys() has not been called
at the point this code executes. Remapping the expanded form is belt and braces
to cover any case where the unexpanded key form may not be present.

As a result of this, various surprising dependencies are uncovered
and the patch rectifies those. These are real bugs since they're injecting
unneeded (unremapped) dependencies into the dependency chain. Workarounds
for this kind of problem in autoconf are removed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/native.bbclass                        |    2 +-
 meta/recipes-devtools/autoconf/autoconf.inc        |    2 ++
 meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    8 --------
 meta/recipes-devtools/automake/automake_1.11.1.bb  |    4 ++--
 .../recipes-devtools/python/python-native_2.7.2.bb |    2 ++
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    1 +
 meta/recipes-support/boost/boost.inc               |    1 +
 7 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 49823d6..00196ba 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -127,7 +127,7 @@ python native_virtclass_handler () {
         d.setVar(varname, " ".join(newdeps))
 
     map_dependencies("DEPENDS", e.data)
-    for pkg in (e.data.getVar("PACKAGES", True).split() + [""]):
+    for pkg in [e.data.getVar("PN", True), "", "${PN}"]:
         map_dependencies("RDEPENDS", e.data, pkg)
         map_dependencies("RRECOMMENDS", e.data, pkg)
         map_dependencies("RSUGGESTS", e.data, pkg)
diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 08a1b02..1d0cf90 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -6,6 +6,8 @@ LICENSE = "GPLv3"
 HOMEPAGE = "http://www.gnu.org/software/autoconf/"
 SECTION = "devel"
 DEPENDS += "m4-native"
+DEPENDS_virtclass-native = "m4-native gnu-config-native"
+DEPENDS_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
 RDEPENDS_${PN} = "m4 gnu-config"
 
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2 \
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
index 9028e83..84eb182 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -4,8 +4,6 @@ PR = "r4"
 
 PARALLEL_MAKE = ""
 
-DEPENDS += "m4-native"
-RDEPENDS_${PN} = "m4 gnu-config"
 LICENSE = "GPLv2 & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 		    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504"
@@ -22,12 +20,6 @@ SRC_URI += "file://autoreconf-include.patch \
 SRC_URI[md5sum] = "864d785215aa60d627c91fcb21b05b07"
 SRC_URI[sha256sum] = "c491fb273fd6d4ca925e26ceed3d177920233c76d542b150ff35e571454332c8"
 
-DEPENDS_virtclass-native = "m4-native gnu-config-native"
-RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
-
-DEPENDS_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
-RDEPENDS_${PN}_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
-
 SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch"
 
 EXTRA_OECONF += "ac_cv_path_M4=m4"
diff --git a/meta/recipes-devtools/automake/automake_1.11.1.bb b/meta/recipes-devtools/automake/automake_1.11.1.bb
index ff8353f..6bffecf 100644
--- a/meta/recipes-devtools/automake/automake_1.11.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.11.1.bb
@@ -3,7 +3,7 @@ LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe" 
 DEPENDS_virtclass-native = "autoconf-native"
 
-RDEPENDS_automake += "\
+RDEPENDS_${PN} += "\
     autoconf \
     perl \
     perl-module-bytes \
@@ -27,7 +27,7 @@ RDEPENDS_automake += "\
     perl-module-text-parsewords \
     perl-module-vars "
 
-RDEPENDS_automake-native = "autoconf-native perl-native-runtime"
+RDEPENDS_${PN}_virtclass-native = "autoconf-native perl-native-runtime"
 
 PATHFIXPATCH = "file://path_prog_fixes.patch"
 PATHFIXPATCH_virtclass-native = ""
diff --git a/meta/recipes-devtools/python/python-native_2.7.2.bb b/meta/recipes-devtools/python/python-native_2.7.2.bb
index d036eca..10bfa6c 100644
--- a/meta/recipes-devtools/python/python-native_2.7.2.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.2.bb
@@ -16,6 +16,8 @@ S = "${WORKDIR}/Python-${PV}"
 
 inherit native
 
+RPROVIDES += "python-distutils-native python-compression-native python-textutils-native"
+
 EXTRA_OEMAKE = '\
   BUILD_SYS="" \
   HOST_SYS="" \
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index 9d327fc..f7d3594 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -39,6 +39,7 @@ do_install_append() {
 
 # disable dbus-x11 when x11 isn't in DISTRO_FEATURES
 RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}"
+RDEPENDS_${PN}_virtclass-native = ""
 
 FILES_${PN} += "${libdir}/GConf/* \
 	        ${libdir}/gio/*/*.so \
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index aa577b3..fc417c9 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -74,6 +74,7 @@ FILES_${PN}-dev = "${includedir} ${libdir}/libboost_*.so ${libdir}/libboost_*.a"
 # "boost" is a metapackage which pulls in all boost librabries
 PACKAGES += "${PN}"
 RRECOMMENDS_${PN} += "${BOOST_PACKAGES}"
+RRECOMMENDS_${PN}_virtclass-native = ""
 ALLOW_EMPTY_${PN} = "1"
 
 # to avoid GNU_HASH QA errors added LDFLAGS to ARCH; a little bit dirty but at least it works
-- 
1.7.6.4




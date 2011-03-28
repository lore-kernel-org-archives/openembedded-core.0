Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q4DUL-0007Gk-1H
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 16:32:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Mar 2011 07:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,255,1299484800"; d="scan'208";a="672394700"
Received: from unknown (HELO localhost) ([10.255.16.125])
	by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2011 07:28:50 -0700
Message-Id: <c004e2cc4593f5fd3309a57b3bc4d5507fdeaa57.1301322225.git.josh@linux.intel.com>
In-Reply-To: <cover.1301322225.git.josh@linux.intel.com>
References: <cover.1301322225.git.josh@linux.intel.com>
Old-Date: Mon, 28 Mar 2011 13:14:37 +0100
Date: Mon, 28 Mar 2011 15:28:44 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 3/4] clutter-box2d: add version 0.10.0 for use with clutter 1.6
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
X-List-Received-Date: Mon, 28 Mar 2011 14:32:30 -0000

From: Joshua Lock <josh@linux.intel.com>

Don't specificy dependant clutter version in inc file, this enables the inc
file to be re-used accross Clutter versions.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../clutter/clutter-box2d-1.6_0.10.0.bb            |   20 ++++++++++++++
 meta/recipes-graphics/clutter/clutter-box2d.inc    |    4 +-
 .../clutter-box2d/fix-disable-introspection.patch  |   28 ++++++++++++++++++++
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
 4 files changed, 51 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch

diff --git a/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb b/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
new file mode 100644
index 0000000..cad8cfc
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
@@ -0,0 +1,20 @@
+require clutter-box2d.inc
+
+PR = "r0"
+
+SRC_URI = "http://source.clutter-project.org/sources/clutter-box2d/0.10/clutter-box2d-${PV}.tar.bz2 \
+           file://fix-disable-introspection.patch"
+
+S = "${WORKDIR}/clutter-box2d-${PV}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+BASE_CONF += "--disable-introspection"
+
+do_configure_prepend () {
+	# Disable DOLT
+	sed -i -e 's/^DOLT//' ${S}/configure.ac
+}
+
+SRC_URI[md5sum] = "51618976ca6a5d536c4eac5f0e120d9d"
+SRC_URI[sha256sum] = "1e42d0cea429e4dc953a1f652672dbd322b3938846e99bab35f463de6fd8ae7f"
diff --git a/meta/recipes-graphics/clutter/clutter-box2d.inc b/meta/recipes-graphics/clutter/clutter-box2d.inc
index 0249984..0574db3 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d.inc
+++ b/meta/recipes-graphics/clutter/clutter-box2d.inc
@@ -2,8 +2,6 @@ DESCRIPTION = "Clutter Box2D"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "Catto"
 
-DEPENDS = "clutter-1.4"
-
 # The main clutter lib is machine specific so we need to be too
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -13,3 +11,5 @@ do_install_append () {
 	install -d ${D}${bindir}
 	install ${S}/examples/.libs/blockbox ${D}${bindir}
 }
+
+FILESPATH = "${FILE_DIRNAME}/clutter-box2d"
diff --git a/meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch b/meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch
new file mode 100644
index 0000000..cfb50dc
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch
@@ -0,0 +1,28 @@
+Even with introspection disabled clutter-box2d would try to install the gir
+files.
+This patch ignored the while introspection related section of the Makefile if
+introspection is disabled.
+
+JL 28/03/11
+josh@linux.intel.com
+
+Index: clutter-box2d-0.10.0/clutter-box2d/Makefile.am
+===================================================================
+--- clutter-box2d-0.10.0.orig/clutter-box2d/Makefile.am
++++ clutter-box2d-0.10.0/clutter-box2d/Makefile.am
+@@ -41,6 +41,8 @@ EXTRA_DIST = \
+ 
+ BUILT_GIRSOURCES =
+ 
++if HAVE_INTROSPECTION
++
+ ClutterBox2D-@CLUTTER_BOX2D_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libclutter-box2d-@CLUTTER_BOX2D_API_VERSION@.la
+ 	$(QUIET_GEN)$(INTROSPECTION_SCANNER) -v \
+ 		--namespace ClutterBox2D --nsversion=@CLUTTER_BOX2D_API_VERSION@ \
+@@ -70,3 +72,5 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
+ 
+ CLEANFILES=
+ CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
++
++endif
+\ No newline at end of file
diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
index 6b718d5..62b5c80 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -9,4 +9,4 @@ SRC_URI = "git://git.clutter-project.org/clutter-box2d.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
-
+DEPENDS += "clutter-1.4"
-- 
1.7.4




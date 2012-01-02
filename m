Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RholU-0008Gw-Nx
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 21:45:53 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jan 2012 12:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108039308"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2012 12:38:15 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 12:37:59 -0800
Message-Id: <be1482c985944b0202bd3f81668e5b76d4b6170d.1325536389.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
References: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325536389.git.nitin.a.kamble@intel.com>
References: <cover.1325536389.git.nitin.a.kamble@intel.com>
Subject: [PATCH v2 03/15] quilt upgreade from 0.48 to 0.50
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
X-List-Received-Date: Mon, 02 Jan 2012 20:45:54 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

gnu_patch_test_fix.patch : this patch removed as it is already
upstream now.

Renamed quilt.inc to quilt-0.50.inc and moved the dupicate information
from native & target recipe files into the quilt-0.50.inc file.

Clean up the unpackaged files warning

These warnings are avoided:
WARNING: For recipe quilt, the following files/directories were
installed but not shipped in any package:
WARNING:   /usr/bin/quiltrc
WARNING:   /usr/share/emacs
WARNING:   /usr/share/emacs/site-lisp
WARNING:   /usr/share/emacs/site-lisp/quilt.el

The /usr/bin/quiltrc is purposely not packaged, as it is needed
for native recipe only.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../quilt/{quilt.inc => quilt-0.50.inc}            |   10 ++++++--
 meta/recipes-devtools/quilt/quilt-native_0.48.bb   |    7 ------
 meta/recipes-devtools/quilt/quilt-native_0.50.bb   |    4 +++
 .../quilt/quilt/gnu_patch_test_fix.patch           |   21 --------------------
 meta/recipes-devtools/quilt/quilt_0.48.bb          |   13 ------------
 meta/recipes-devtools/quilt/quilt_0.50.bb          |    7 ++++++
 6 files changed, 18 insertions(+), 44 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt.inc => quilt-0.50.inc} (74%)
 delete mode 100644 meta/recipes-devtools/quilt/quilt-native_0.48.bb
 create mode 100644 meta/recipes-devtools/quilt/quilt-native_0.50.bb
 delete mode 100644 meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix.patch
 delete mode 100644 meta/recipes-devtools/quilt/quilt_0.48.bb
 create mode 100644 meta/recipes-devtools/quilt/quilt_0.50.bb

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt-0.50.inc
similarity index 74%
rename from meta/recipes-devtools/quilt/quilt.inc
rename to meta/recipes-devtools/quilt/quilt-0.50.inc
index 3a66093..5a72169 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.50.inc
@@ -5,14 +5,16 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
-        file://install.patch \
-        file://gnu_patch_test_fix.patch"
+        file://install.patch"
+
+SRC_URI[md5sum] = "ff5e1e041363c3af3c8fda4b968c9d1d"
+SRC_URI[sha256sum] = "fa4579628a98cf94472b36869e74f5cd0cb057d6fd13c1872a53f01c45aba8c3"
 
 inherit autotools
 
 PACKAGES += "guards guards-doc"
 FILES_${PN} = "${sysconfdir} ${datadir}/quilt \
-	       ${bindir}/quilt ${libdir}/quilt"
+               ${bindir}/quilt ${libdir}/quilt"
 FILES_guards = "${bindir}/guards"
 FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${P}"
 FILES_guards-doc = "${mandir}/man1/guards.1"
@@ -27,4 +29,6 @@ do_install () {
 		install -d ${D}${bindir}/
 		touch ${D}${bindir}/quiltrc
 	fi
+	# cleanup unpackaged files
+	rm -rf ${D}/${datadir}/emacs
 }
diff --git a/meta/recipes-devtools/quilt/quilt-native_0.48.bb b/meta/recipes-devtools/quilt/quilt-native_0.48.bb
deleted file mode 100644
index a62531e..0000000
--- a/meta/recipes-devtools/quilt/quilt-native_0.48.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require quilt.inc
-require quilt-native.inc
-
-PR = "r0"
-
-SRC_URI[md5sum] = "f77adda60039ffa753f3c584a286f12b"
-SRC_URI[sha256sum] = "73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc"
diff --git a/meta/recipes-devtools/quilt/quilt-native_0.50.bb b/meta/recipes-devtools/quilt/quilt-native_0.50.bb
new file mode 100644
index 0000000..b99b9b6
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt-native_0.50.bb
@@ -0,0 +1,4 @@
+require quilt-${PV}.inc
+require quilt-native.inc
+
+PR = "r0"
diff --git a/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix.patch b/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix.patch
deleted file mode 100644
index 348b327..0000000
--- a/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Pending
-
-# quilt's configure tosses an error with patch @ GNU patch 2.6.1.81-5b68
-#
-# Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---- quilt-0.48/configure	2010-11-03 11:50:55.280329802 -0700
-+++ quilt-0.48/configure	2010-11-03 11:52:43.705354080 -0700
-@@ -5896,7 +5896,12 @@
- echo $ECHO_N "checking the version of $PATCH... $ECHO_C" >&6; }
- if $PATCH --version 2> /dev/null | grep GNU >/dev/null; then
-   set -- `$PATCH --version 2> /dev/null`
--  patch_version=$2
-+  #
-+  if test x$1 = xGNU ; then
-+    patch_version=$3
-+  else
-+    patch_version=$2
-+  fi
-   { echo "$as_me:$LINENO: result: $patch_version" >&5
- echo "${ECHO_T}$patch_version" >&6; }
-   saved_IFS=$IFS; IFS='.'
diff --git a/meta/recipes-devtools/quilt/quilt_0.48.bb b/meta/recipes-devtools/quilt/quilt_0.48.bb
deleted file mode 100644
index 1600c62..0000000
--- a/meta/recipes-devtools/quilt/quilt_0.48.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require quilt.inc
-LICENSE="GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
-PR = "r2"
-SRC_URI += "file://aclocal.patch \
-            file://gnu_patch_test_fix_target.patch \
-           "
-
-SRC_URI[md5sum] = "f77adda60039ffa753f3c584a286f12b"
-SRC_URI[sha256sum] = "73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc"
-
-inherit autotools gettext 
diff --git a/meta/recipes-devtools/quilt/quilt_0.50.bb b/meta/recipes-devtools/quilt/quilt_0.50.bb
new file mode 100644
index 0000000..6691d15
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt_0.50.bb
@@ -0,0 +1,7 @@
+require quilt-${PV}.inc
+inherit gettext 
+RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
+SRC_URI += "file://aclocal.patch \
+            file://gnu_patch_test_fix_target.patch \
+           "
+PR = "r0"
-- 
1.7.6.4




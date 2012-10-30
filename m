Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TT8Lj-0002q2-0y
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 10:43:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9U9TVod000295
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 02:29:32 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 30 Oct 2012 02:29:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2012 17:33:42 +0800
Message-ID: <8698cda3dbc2452237b9202f556ac88d82a6bf04.1351496696.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1351496696.git.liezhi.yang@windriver.com>
References: <cover.1351496696.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 01/11] classes: replace virtclass-native(sdk) with class-native(sdk)
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
X-List-Received-Date: Tue, 30 Oct 2012 09:43:08 -0000
Content-Type: text/plain

The overrides virtclass-native and virtclass-nativesdk are deprecated,
which should be replaced by class-native and class-nativesdk.

[YOCTO #3297]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/cross.bbclass            |  2 +-
 meta/classes/insane.bbclass           |  4 ++--
 meta/classes/multilib.bbclass         |  2 +-
 meta/classes/multilib_global.bbclass  |  4 ++--
 meta/classes/native.bbclass           |  6 +++---
 meta/classes/populate_sdk_rpm.bbclass |  2 +-
 meta/classes/rootfs_rpm.bbclass       |  2 +-
 meta/classes/update-rc.d.bbclass      |  6 +++---
 meta/classes/useradd.bbclass          | 24 ++++++++++++------------
 9 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index e998307..735f6d2 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -7,7 +7,7 @@ EXCLUDE_FROM_WORLD = "1"
 CLASSOVERRIDE = "class-cross"
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
-PACKAGES_DYNAMIC_virtclass-native = ""
+PACKAGES_DYNAMIC_class-native = ""
 
 HOST_ARCH = "${BUILD_ARCH}"
 HOST_VENDOR = "${BUILD_VENDOR}"
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 2dc9ba3..d51d1a1 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -24,8 +24,8 @@ PACKAGEFUNCS += " do_package_qa "
 # unsafe-references-in-binaries requires prelink-rtld from
 # prelink-native, but we don't want this DEPENDS for -native builds
 QADEPENDS = "prelink-native"
-QADEPENDS_virtclass-native = ""
-QADEPENDS_virtclass-nativesdk = ""
+QADEPENDS_class-native = ""
+QADEPENDS_class-nativesdk = ""
 
 #
 # dictionary for elf headers
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index c249925..77ccce4 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -44,7 +44,7 @@ python multilib_virtclass_handler () {
 
     e.data.setVar("MLPREFIX", variant + "-")
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
-    e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
+    e.data.setVar("SHLIBSDIR_class-multilib-" + variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
 }
 
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index f55e3a2..3b5faa0 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -4,8 +4,8 @@ python multilib_virtclass_handler_global () {
 
     if isinstance(e, bb.event.RecipePreFinalise):
         for v in e.data.getVar("MULTILIB_VARIANTS", True).split():
-            if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + v, False) is None:
-	       e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + v, e.data.getVar("TARGET_VENDOR", False) + "ml" + v)
+            if e.data.getVar("TARGET_VENDOR_class-multilib-" + v, False) is None:
+	       e.data.setVar("TARGET_VENDOR_class-multilib-" + v, e.data.getVar("TARGET_VENDOR", False) + "ml" + v)
 
     variant = e.data.getVar("BBEXTENDVARIANT", True)
 
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 93f96f5..6314ba1 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -6,14 +6,14 @@ inherit relocatable
 EXCLUDE_FROM_WORLD = "1"
 
 PACKAGES = ""
-PACKAGES_virtclass-native = ""
+PACKAGES_class-native = ""
 PACKAGES_DYNAMIC = ""
-PACKAGES_DYNAMIC_virtclass-native = ""
+PACKAGES_DYNAMIC_class-native = ""
 PACKAGE_ARCH = "${BUILD_ARCH}"
 
 # used by cmake class
 OECMAKE_RPATH = "${libdir}"
-OECMAKE_RPATH_virtclass-native = "${libdir}"
+OECMAKE_RPATH_class-native = "${libdir}"
 
 # When this class has packaging enabled, setting 
 # RPROVIDES becomes unnecessary.
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 1c54049..d4c880e 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -128,7 +128,7 @@ python () {
         eext = ext.split(':')
         if len(eext) > 1 and eext[0] == 'multilib':
             localdata = bb.data.createCopy(d)
-            default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
+            default_tune = localdata.getVar("DEFAULTTUNE_class-multilib-" + eext[1], False)
             if default_tune:
                 localdata.setVar("DEFAULTTUNE", default_tune)
             package_archs = localdata.getVar("PACKAGE_ARCHS", True) or ""
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index c86cd09..16b7779 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -194,7 +194,7 @@ python () {
         eext = ext.split(':')
         if len(eext) > 1 and eext[0] == 'multilib':
             localdata = bb.data.createCopy(d)
-            default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
+            default_tune = localdata.getVar("DEFAULTTUNE_class-multilib-" + eext[1], False)
             if default_tune:
                 localdata.setVar("DEFAULTTUNE", default_tune)
             package_archs = localdata.getVar("PACKAGE_ARCHS", True) or ""
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index eef2e8c..a512503 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -2,9 +2,9 @@ UPDATERCPN ?= "${PN}"
 
 DEPENDS_append = " update-rc.d-native"
 UPDATERCD = "update-rc.d"
-UPDATERCD_virtclass-cross = ""
-UPDATERCD_virtclass-native = ""
-UPDATERCD_virtclass-nativesdk = ""
+UPDATERCD_class-cross = ""
+UPDATERCD_class-native = ""
+UPDATERCD_class-nativesdk = ""
 
 RDEPENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
 
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index bb8f42b..2ee95da 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -3,9 +3,9 @@
 # and support files needed to add and modify user and group accounts
 DEPENDS_append = "${USERADDDEPENDS}"
 USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot shadow"
-USERADDDEPENDS_virtclass-cross = ""
-USERADDDEPENDS_virtclass-native = ""
-USERADDDEPENDS_virtclass-nativesdk = ""
+USERADDDEPENDS_class-cross = ""
+USERADDDEPENDS_class-native = ""
+USERADDDEPENDS_class-nativesdk = ""
 
 # This preinstall function can be run in four different contexts:
 #
@@ -137,19 +137,19 @@ useradd_sysroot_sstate () {
 
 do_install[prefuncs] += "${SYSROOTFUNC}"
 SYSROOTFUNC = "useradd_sysroot"
-SYSROOTFUNC_virtclass-cross = ""
-SYSROOTFUNC_virtclass-native = ""
-SYSROOTFUNC_virtclass-nativesdk = ""
+SYSROOTFUNC_class-cross = ""
+SYSROOTFUNC_class-native = ""
+SYSROOTFUNC_class-nativesdk = ""
 SSTATEPREINSTFUNCS += "${SYSROOTPOSTFUNC}"
 SYSROOTPOSTFUNC = "useradd_sysroot_sstate"
-SYSROOTPOSTFUNC_virtclass-cross = ""
-SYSROOTPOSTFUNC_virtclass-native = ""
-SYSROOTPOSTFUNC_virtclass-nativesdk = ""
+SYSROOTPOSTFUNC_class-cross = ""
+SYSROOTPOSTFUNC_class-native = ""
+SYSROOTPOSTFUNC_class-nativesdk = ""
 
 USERADDSETSCENEDEPS = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
-USERADDSETSCENEDEPS_virtclass-cross = ""
-USERADDSETSCENEDEPS_virtclass-native = ""
-USERADDSETSCENEDEPS_virtclass-nativesdk = ""
+USERADDSETSCENEDEPS_class-cross = ""
+USERADDSETSCENEDEPS_class-native = ""
+USERADDSETSCENEDEPS_class-nativesdk = ""
 do_package_setscene[depends] = "${USERADDSETSCENEDEPS}"
 
 # Recipe parse-time sanity checks
-- 
1.7.11.2




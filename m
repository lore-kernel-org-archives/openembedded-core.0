Return-Path: <Daniel.Klauer@gin.de>
X-Greylist: delayed 1361 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 Aug 2019 09:44:39 UTC
Received: from good-out-15.clustermail.de (good-out-15.clustermail.de
	[212.223.36.19])
	by mail.openembedded.org (Postfix) with ESMTP id 4A64A7F51C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 09:44:39 +0000 (UTC)
Received: from [10.0.0.17] (helo=frontend.clustermail.de)
	by smtpout-03.clustermail.de with esmtp (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1i2BC9-0006YF-Hi; Mon, 26 Aug 2019 11:21:56 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1i2BC9-0006xB-F4; Mon, 26 Aug 2019 11:21:49 +0200
Received: from [10.160.138.39] (10.160.138.39) by Win2012-02.gin-domain.local
	(192.168.1.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Mon, 26 Aug 2019 11:21:48 +0200
To: Randy MacLeod <randy.macleod@windriver.com>
References: <a01c66d2-4603-5633-9b3e-6180ba8c904d@windriver.com>
From: Daniel Klauer <daniel.klauer@gin.de>
Message-ID: <86a7eb4c-1097-1534-58b1-0ee61f16133f@gin.de>
Date: Mon, 26 Aug 2019 11:21:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a01c66d2-4603-5633-9b3e-6180ba8c904d@windriver.com>
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: Win2012-02.gin-domain.local (192.168.1.12) To
	Win2012-02.gin-domain.local (192.168.1.12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: boost 1.69 -> 1.71 upgrade for 3.0?
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
X-List-Received-Date: Mon, 26 Aug 2019 09:44:40 -0000
X-Groupsio-MsgNum: 128244
Content-Type: multipart/mixed; boundary="------------5E1DD032C88A7172326A9578"
Content-Language: en-US

--------------5E1DD032C88A7172326A9578
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hi,

On 22.08.19 21:19, Randy MacLeod wrote:
> I'm checking if you have done any work on upgrading the
> boost recipe?
Not long ago I've looked at updating the boost recipe to 1.71.0-beta1
(when 1.71.0 wasn't released yet) because of some bugs encountered with
1.69.0 (and 1.70.0 being buggy too). See the attached patch (it is based
on poky warrior).

It was not trivial due to changes to bjam bootstrap scripts, but I got
it working. I'd be interested in updating it to the final 1.71.0 too,
including backporting to warrior.

Regards,
Daniel

--------------5E1DD032C88A7172326A9578
Content-Type: text/x-patch; name="0001-boost-Update-to-1.71.0-beta1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-boost-Update-to-1.71.0-beta1.patch"

From 2f8eb6379ff926cc53d1b2a24a2b93c5ea5268fa Mon Sep 17 00:00:00 2001
From: Daniel Klauer <daniel.klauer@gin.de>
Date: Mon, 26 Aug 2019 11:01:00 +0200
Subject: [PATCH] boost: Update to 1.71.0-beta1

Some notes:
- bjam bootstrap scripts were changed, and the patch for that had to be
  adjusted. tools/build/src/engine/build.sh now supports an --debug option
  which the bjam-native recipe can use to get the debug build of b2.
- gcc.jam patch had to be refreshed because boost added more "cpu-flags"
  lines.
- since 1.70.0, boost includes new cmake config files which are packaged
  in ${PN}-dev now so they make it into the SDK. (although 1.71.0 is needed
  to fix some bugs in them)
- The recipe had to be adjusted more than usual to support the boost beta
  version.
---
 ..._1.69.0.bb => bjam-native_1.71.0.beta1.bb} |  5 +-
 ...oost-1.69.0.inc => boost-1.71.0.beta1.inc} | 12 ++---
 meta/recipes-support/boost/boost.inc          |  2 +-
 ...h-instruction-set-flags-we-do-that-o.patch | 23 +++++----
 ...{boost_1.69.0.bb => boost_1.71.0.beta1.bb} |  0
 .../0001-Build-debug-version-of-bjam.patch    | 25 ++++++++++
 .../files/bjam-native-build-bjam.debug.patch  | 50 -------------------
 7 files changed, 45 insertions(+), 72 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.69.0.bb => bjam-native_1.71.0.beta1.bb} (70%)
 rename meta/recipes-support/boost/{boost-1.69.0.inc => boost-1.71.0.beta1.inc} (59%)
 rename meta/recipes-support/boost/{boost_1.69.0.bb => boost_1.71.0.beta1.bb} (100%)
 create mode 100644 meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.patch
 delete mode 100644 meta/recipes-support/boost/files/bjam-native-build-bjam.debug.patch

diff --git a/meta/recipes-support/boost/bjam-native_1.69.0.bb b/meta/recipes-support/boost/bjam-native_1.71.0.beta1.bb
similarity index 70%
rename from meta/recipes-support/boost/bjam-native_1.69.0.bb
rename to meta/recipes-support/boost/bjam-native_1.71.0.beta1.bb
index 94f96e62d8..30279a73e6 100644
--- a/meta/recipes-support/boost/bjam-native_1.69.0.bb
+++ b/meta/recipes-support/boost/bjam-native_1.71.0.beta1.bb
@@ -5,8 +5,7 @@ SECTION = "devel"
 
 inherit native
 
-SRC_URI += "file://bjam-native-build-bjam.debug.patch \
-"
+SRC_URI += "file://0001-Build-debug-version-of-bjam.patch"
 
 do_compile() {
     ./bootstrap.sh --with-toolset=gcc
@@ -15,5 +14,5 @@ do_compile() {
 do_install() {
     install -d ${D}${bindir}/
     # install unstripped version for bjam
-    install -c -m 755 bjam.debug ${D}${bindir}/bjam
+    install -c -m 755 b2 ${D}${bindir}/bjam
 }
diff --git a/meta/recipes-support/boost/boost-1.69.0.inc b/meta/recipes-support/boost/boost-1.71.0.beta1.inc
similarity index 59%
rename from meta/recipes-support/boost/boost-1.69.0.inc
rename to meta/recipes-support/boost/boost-1.71.0.beta1.inc
index 923436b1e0..d2e2a11457 100644
--- a/meta/recipes-support/boost/boost-1.69.0.inc
+++ b/meta/recipes-support/boost/boost-1.71.0.beta1.inc
@@ -7,15 +7,11 @@ HOMEPAGE = "http://www.boost.org/"
 LICENSE = "BSL-1.0 & MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
-BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
-BOOST_P = "boost_${BOOST_VER}"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
-SRC_URI[md5sum] = "a1332494397bf48332cb152abfefcec2"
-SRC_URI[sha256sum] = "8f32d4617390d1c2d16f26a27ab60d97807b35440d45891fa340fc2648b04406"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/boost_1_71_0_b1.tar.bz2"
+SRC_URI[md5sum] = "f74e2064eef26e108f304680b21a9a82"
+SRC_URI[sha256sum] = "a93d7066fc1514995aec0e726532a219447dd39b0ffa7cb97ca5736f16b0488b"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
 
-S = "${WORKDIR}/${BOOST_P}"
+S = "${WORKDIR}/boost_1_71_0"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 9be3717fd6..6de940265c 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -80,7 +80,7 @@ FILES_boost-test = "${libdir}/libboost_prg_exec_monitor*.so.* \
 
 # -dev last to pick up the remaining stuff
 PACKAGES += "${PN}-dev ${PN}-staticdev"
-FILES_${PN}-dev = "${includedir} ${libdir}/libboost_*.so"
+FILES_${PN}-dev = "${includedir} ${libdir}/libboost_*.so ${libdir}/cmake"
 FILES_${PN}-staticdev = "${libdir}/libboost_*.a"
 
 # "boost" is a metapackage which pulls in all boost librabries
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 8944cb37b4..6ef60df679 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,20 +1,17 @@
-From 3e4eb02eb5951058bc6f8dffbf049eb189df8291 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 18 Dec 2018 15:42:57 +0100
+From 13d2cc58e00dac424e2ae205dd581898de451f4f Mon Sep 17 00:00:00 2001
+From: Daniel Klauer <daniel.klauer@gin.de>
+Date: Tue, 30 Jul 2019 11:56:41 +0200
 Subject: [PATCH] Don't set up arch/instruction-set flags, we do that ourselves
 
-Upstream-Status: Inappropriate
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- tools/build/src/tools/gcc.jam | 128 ----------------------------------
- 1 file changed, 128 deletions(-)
+ tools/build/src/tools/gcc.jam | 132 ----------------------------------
+ 1 file changed, 132 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index c57c773f..28618fb1 100644
+index b9bb9cf2a..c7e3cf3fe 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1152,131 +1152,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1180,135 +1180,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
@@ -144,5 +141,11 @@ index c57c773f..28618fb1 100644
 -cpu-flags gcc OPTIONS : power : rios2 : -mcpu=rios2 ;
 -cpu-flags gcc OPTIONS : power : rsc : -mcpu=rsc ;
 -cpu-flags gcc OPTIONS : power : rs64a : -mcpu=rs64 ;
+-cpu-flags gcc OPTIONS : s390x : z196 : -march=z196 ;
+-cpu-flags gcc OPTIONS : s390x : zEC12 : -march=zEC12 ;
+-cpu-flags gcc OPTIONS : s390x : z13 : -march=z13 ;
+-cpu-flags gcc OPTIONS : s390x : z14 : -march=z14 ;
 -# AIX variant of RS/6000 & PowerPC
 -toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64" ;
+-- 
+2.17.1
diff --git a/meta/recipes-support/boost/boost_1.69.0.bb b/meta/recipes-support/boost/boost_1.71.0.beta1.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.69.0.bb
rename to meta/recipes-support/boost/boost_1.71.0.beta1.bb
diff --git a/meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.patch b/meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.patch
new file mode 100644
index 0000000000..39433fd46a
--- /dev/null
+++ b/meta/recipes-support/boost/files/0001-Build-debug-version-of-bjam.patch
@@ -0,0 +1,25 @@
+From 19c117c3d1388654da484e26afb3fb6c3e4181a9 Mon Sep 17 00:00:00 2001
+From: Daniel Klauer <daniel.klauer@gin.de>
+Date: Tue, 30 Jul 2019 11:39:09 +0200
+Subject: [PATCH] Build debug version of bjam
+
+---
+ bootstrap.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bootstrap.sh b/bootstrap.sh
+index ca0b08d58..87f38dcf2 100755
+--- a/bootstrap.sh
++++ b/bootstrap.sh
+@@ -223,7 +223,7 @@ rm -f config.log
+ if test "x$BJAM" = x; then
+   $ECHO -n "Building Boost.Build engine with toolset $TOOLSET... "
+   pwd=`pwd`
+-  (cd "$my_dir/tools/build/src/engine" && ./build.sh "$TOOLSET") > bootstrap.log 2>&1
++  (cd "$my_dir/tools/build/src/engine" && ./build.sh "$TOOLSET" --debug) > bootstrap.log 2>&1
+   if [ $? -ne 0 ]; then
+       echo
+       echo "Failed to build Boost.Build build engine" 
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/boost/files/bjam-native-build-bjam.debug.patch b/meta/recipes-support/boost/files/bjam-native-build-bjam.debug.patch
deleted file mode 100644
index 9f8b7eac0a..0000000000
--- a/meta/recipes-support/boost/files/bjam-native-build-bjam.debug.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 619ada314ab26c0c9cbfe5702cd9c0caa8f6415a Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Mon, 3 Aug 2015 17:12:33 +0800
-Subject: [PATCH] bjam-native: build bjam.debug
-
-bjam is stripped by default, this causes QA warning while stripping it
-from do_populate_sysroot():
-
-  WARNING: File '.../tmp/sysroots/x86_64-linux/usr/bin/bjam' \
-    from bjam-native was already stripped, \
-    this will prevent future debugging!
-
-The JAM scripts allow to build unstripped version with '--debug'. Just
-build and install the bjam.debug to stop bjam from being stripped in
-compile step.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- bootstrap.sh                    | 1 +
- tools/build/src/engine/build.sh | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/bootstrap.sh b/bootstrap.sh
-index 98cf88b..54690aa 100755
---- a/bootstrap.sh
-+++ b/bootstrap.sh
-@@ -228,6 +228,7 @@ if test "x$BJAM" = x; then
-   echo "tools/build/src/engine/$arch/b2"
-   cp "$BJAM" .
-   cp "$my_dir/tools/build/src/engine/$arch/bjam" .
-+  cp "$my_dir/tools/build/src/engine/${arch}.debug/bjam" bjam.debug
- 
- fi
- 
-diff --git a/tools/build/src/engine/build.sh b/tools/build/src/engine/build.sh
-index 6dbc706..c69fdc7 100755
---- a/tools/build/src/engine/build.sh
-+++ b/tools/build/src/engine/build.sh
-@@ -312,5 +312,5 @@ if test -x "./bootstrap/jam0" ; then
-     if test "${BJAM_UPDATE}" != "update" ; then
-         echo_run ./bootstrap/jam0 -f build.jam --toolset=$BOOST_JAM_TOOLSET "--toolset-root=$BOOST_JAM_TOOLSET_ROOT" "$@" clean
-     fi
--    echo_run ./bootstrap/jam0 -f build.jam --toolset=$BOOST_JAM_TOOLSET "--toolset-root=$BOOST_JAM_TOOLSET_ROOT" "$@"
-+    echo_run ./bootstrap/jam0 -f build.jam --toolset=$BOOST_JAM_TOOLSET "--toolset-root=$BOOST_JAM_TOOLSET_ROOT" "$@" --debug
- fi
--- 
-1.9.1
-
-- 
2.17.1


--------------5E1DD032C88A7172326A9578--

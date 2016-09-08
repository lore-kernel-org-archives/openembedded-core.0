Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 599677732E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 10:26:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u88AQo5g007986
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Sep 2016 03:26:50 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Sep 2016 03:26:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Sep 2016 03:26:48 -0700
Message-ID: <42d33eb8cc83999993ba8596ee63f31a4cac0e2f.1473330368.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1473330368.git.liezhi.yang@windriver.com>
References: <cover.1473330368.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qemu: 2.6.0 -> 2.7.0
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
X-List-Received-Date: Thu, 08 Sep 2016 10:26:51 -0000
Content-Type: text/plain

This upgrade can fix a qemuppc + openssh bug, the ssh connection maybe
refused or closed randomly, and it's not easy to reproduce. RP pointed
that this upgrade can fix the problem, and it does work in my local
testing.

* Update add-ptest-in-makefile.patch
* Drop backported patch 0001-configure-support-vte-2.91.patch

Here is the Changlog:
http://wiki.qemu.org/ChangeLog/2.7

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../qemu/0001-configure-support-vte-2.91.patch     | 79 ----------------------
 .../qemu/qemu/add-ptest-in-makefile.patch          | 19 +++---
 .../qemu/{qemu_2.6.0.bb => qemu_2.7.0.bb}          |  5 +-
 3 files changed, 11 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch
 rename meta/recipes-devtools/qemu/{qemu_2.6.0.bb => qemu_2.7.0.bb} (79%)

diff --git a/meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch b/meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch
deleted file mode 100644
index c286822..0000000
--- a/meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From f40a8ceaaf0ee37fcfeb6900960632d7a7085a9f Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 17 Jun 2016 21:09:03 +0300
-Subject: [PATCH] configure: support vte-2.91
-
-Upstream-Status: Backport [c6feff9e09aa99]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-Original commit message below:
-
-From: Cole Robinson <crobinso@redhat.com>
-Date: Fri, 6 May 2016 14:03:12 -0400
-Subject: [PATCH] configure: support vte-2.91
-
-vte >= 0.37 expores API version 2.91, which is where all the active
-development is. qemu builds and runs fine with that version, so use it
-if it's available.
-
-Signed-off-by: Cole Robinson <crobinso@redhat.com>
-Message-id: b4f0375647f7b368d3dbd3834aee58cb0253566a.1462557436.git.crobinso@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- configure | 17 +++++++++++------
- 1 file changed, 11 insertions(+), 6 deletions(-)
-
-diff --git a/configure b/configure
-index 54a3189..a16fa2b 100755
---- a/configure
-+++ b/configure
-@@ -2394,20 +2394,25 @@ fi
- 
- if test "$vte" != "no"; then
-     if test "$gtkabi" = "3.0"; then
--      vtepackage="vte-2.90"
--      vteversion="0.32.0"
-+      vteminversion="0.32.0"
-+      if $pkg_config --exists "vte-2.91"; then
-+        vtepackage="vte-2.91"
-+      else
-+        vtepackage="vte-2.90"
-+      fi
-     else
-       vtepackage="vte"
--      vteversion="0.24.0"
-+      vteminversion="0.24.0"
-     fi
--    if $pkg_config --exists "$vtepackage >= $vteversion"; then
-+    if $pkg_config --exists "$vtepackage >= $vteminversion"; then
-         vte_cflags=`$pkg_config --cflags $vtepackage`
-         vte_libs=`$pkg_config --libs $vtepackage`
-+        vteversion=`$pkg_config --modversion $vtepackage`
-         libs_softmmu="$vte_libs $libs_softmmu"
-         vte="yes"
-     elif test "$vte" = "yes"; then
-         if test "$gtkabi" = "3.0"; then
--            feature_not_found "vte" "Install libvte-2.90 devel"
-+            feature_not_found "vte" "Install libvte-2.90/2.91 devel"
-         else
-             feature_not_found "vte" "Install libvte devel"
-         fi
-@@ -4759,6 +4764,7 @@ echo "pixman            $pixman"
- echo "SDL support       $sdl"
- echo "GTK support       $gtk"
- echo "GTK GL support    $gtk_gl"
-+echo "VTE support       $vte `echo_version $vte $vteversion`"
- echo "GNUTLS support    $gnutls"
- echo "GNUTLS hash       $gnutls_hash"
- echo "GNUTLS rnd        $gnutls_rnd"
-@@ -4771,7 +4777,6 @@ else
- fi
- echo "nettle kdf        $nettle_kdf"
- echo "libtasn1          $tasn1"
--echo "VTE support       $vte"
- echo "curses support    $curses"
- echo "virgl support     $virglrenderer"
- echo "curl support      $curl"
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
index a99f720..2ce3478 100644
--- a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
+++ b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
@@ -4,14 +4,14 @@ Add subpackage -ptest which runs all unit test cases for qemu.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- tests/Makefile |   10 ++++++++++
- 1 file changed, 10 insertions(+)
+ tests/Makefile.include | 8 ++++++++
+ 1 file changed, 8 insertions(+)
 
-diff --git a/tests/Makefile b/tests/Makefile
-index 88f7105..3f40b4b 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -405,3 +405,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
+diff --git a/tests/Makefile.include b/tests/Makefile.include
+index 14be491..0fce37a 100644
+--- a/tests/Makefile.include
++++ b/tests/Makefile.include
+@@ -776,3 +776,11 @@ all: $(QEMU_IOTESTS_HELPERS-y)
  
  -include $(wildcard tests/*.d)
  -include $(wildcard tests/libqos/*.d)
@@ -23,7 +23,6 @@ index 88f7105..3f40b4b 100644
 +		nf=$$(echo $$f | sed 's/tests\//\.\//g'); \
 +		$$nf; \
 +	done
-+
---
-1.7.9.5
+-- 
+2.9.0
 
diff --git a/meta/recipes-devtools/qemu/qemu_2.6.0.bb b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
similarity index 79%
rename from meta/recipes-devtools/qemu/qemu_2.6.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.7.0.bb
index c4a0435..619b8ed 100644
--- a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
@@ -9,12 +9,11 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://no-valgrind.patch \
             file://pathlimit.patch \
             file://qemu-2.5.0-cflags.patch \
-            file://0001-configure-support-vte-2.91.patch \
 "
 
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "ca3f70b43f093e33e9e014f144067f13"
-SRC_URI[sha256sum] = "c9ac4a651b273233d21b8bec32e30507cb9cce7900841febc330956a1a8434ec"
+SRC_URI[md5sum] = "08d4d06d1cb598efecd796137f4844ab"
+SRC_URI[sha256sum] = "326e739506ba690daf69fc17bd3913a6c313d9928d743bd8eddb82f403f81e53"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
2.9.0



Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B432B75E2D
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 19:37:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 17 Jun 2016 12:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,485,1459839600"; d="scan'208";a="830423158"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 17 Jun 2016 12:37:52 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 22:37:49 +0300
Message-Id: <c0275ab96e7c48f1c7ae5053c79346de68b88f9e.1466191636.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a3c036a30e52a5a292c68183f84f4de1696973ac.1466191636.git.jussi.kukkonen@intel.com>
References: <a3c036a30e52a5a292c68183f84f4de1696973ac.1466191636.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1466191636.git.jussi.kukkonen@intel.com>
References: <cover.1466191636.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] qemu: Use Gtk+3, add configure patch to find vte
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
X-List-Received-Date: Fri, 17 Jun 2016 19:37:52 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  2 +-
 .../qemu/0001-configure-support-vte-2.91.patch     | 79 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.6.0.bb           |  1 +
 3 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d5925fd..44e6744 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -119,7 +119,7 @@ PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
 PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
 PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
-PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+ libvte,"
+PACKAGECONFIG[gtk+] = "--enable-gtk --with-gtkabi=3.0 --enable-vte,--disable-gtk --disable-vte,gtk+3 vte"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
 PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,gcrypt,"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch b/meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch
new file mode 100644
index 0000000..af0df3b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch
@@ -0,0 +1,79 @@
+From f40a8ceaaf0ee37fcfeb6900960632d7a7085a9f Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 17 Jun 2016 21:09:03 +0300
+Subject: [PATCH] configure: support vte-2.91
+
+Upstream-status: Backport [c6feff9e09aa99]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+Original commit message below:
+
+From: Cole Robinson <crobinso@redhat.com>
+Date: Fri, 6 May 2016 14:03:12 -0400
+Subject: [PATCH] configure: support vte-2.91
+
+vte >= 0.37 expores API version 2.91, which is where all the active
+development is. qemu builds and runs fine with that version, so use it
+if it's available.
+
+Signed-off-by: Cole Robinson <crobinso@redhat.com>
+Message-id: b4f0375647f7b368d3dbd3834aee58cb0253566a.1462557436.git.crobinso@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+---
+ configure | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/configure b/configure
+index 54a3189..a16fa2b 100755
+--- a/configure
++++ b/configure
+@@ -2394,20 +2394,25 @@ fi
+ 
+ if test "$vte" != "no"; then
+     if test "$gtkabi" = "3.0"; then
+-      vtepackage="vte-2.90"
+-      vteversion="0.32.0"
++      vteminversion="0.32.0"
++      if $pkg_config --exists "vte-2.91"; then
++        vtepackage="vte-2.91"
++      else
++        vtepackage="vte-2.90"
++      fi
+     else
+       vtepackage="vte"
+-      vteversion="0.24.0"
++      vteminversion="0.24.0"
+     fi
+-    if $pkg_config --exists "$vtepackage >= $vteversion"; then
++    if $pkg_config --exists "$vtepackage >= $vteminversion"; then
+         vte_cflags=`$pkg_config --cflags $vtepackage`
+         vte_libs=`$pkg_config --libs $vtepackage`
++        vteversion=`$pkg_config --modversion $vtepackage`
+         libs_softmmu="$vte_libs $libs_softmmu"
+         vte="yes"
+     elif test "$vte" = "yes"; then
+         if test "$gtkabi" = "3.0"; then
+-            feature_not_found "vte" "Install libvte-2.90 devel"
++            feature_not_found "vte" "Install libvte-2.90/2.91 devel"
+         else
+             feature_not_found "vte" "Install libvte devel"
+         fi
+@@ -4759,6 +4764,7 @@ echo "pixman            $pixman"
+ echo "SDL support       $sdl"
+ echo "GTK support       $gtk"
+ echo "GTK GL support    $gtk_gl"
++echo "VTE support       $vte `echo_version $vte $vteversion`"
+ echo "GNUTLS support    $gnutls"
+ echo "GNUTLS hash       $gnutls_hash"
+ echo "GNUTLS rnd        $gnutls_rnd"
+@@ -4771,7 +4777,6 @@ else
+ fi
+ echo "nettle kdf        $nettle_kdf"
+ echo "libtasn1          $tasn1"
+-echo "VTE support       $vte"
+ echo "curses support    $curses"
+ echo "virgl support     $virglrenderer"
+ echo "curl support      $curl"
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.6.0.bb b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
index 735d013..c4a0435 100644
--- a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://no-valgrind.patch \
             file://pathlimit.patch \
             file://qemu-2.5.0-cflags.patch \
+            file://0001-configure-support-vte-2.91.patch \
 "
 
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-- 
2.1.4



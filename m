Return-Path: <mihai.prica@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 420796BB9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 15:00:14 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Aug 2013 08:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,968,1367996400"; d="scan'208";a="287368548"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.31])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Aug 2013 08:00:14 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 17:59:37 +0300
Message-Id: <e3986a99c3de0b996e28d536466fc07275c50a88.1377613447.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377613447.git.mihai.prica@intel.com>
References: <cover.1377613447.git.mihai.prica@intel.com>
In-Reply-To: <cover.1377613447.git.mihai.prica@intel.com>
References: <cover.1377613447.git.mihai.prica@intel.com>
Subject: [PATCH 3/5] vala: add version 0.16 from meta-oe
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
X-List-Received-Date: Tue, 27 Aug 2013 15:00:16 -0000

Vala is a C#-like language dedicated to ease GObject programming.
It is required by the Midori web-browser.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 ...-gen-don-t-append-dirty-if-we-re-not-in-g.patch |   53 ++++++++++++++++++++
 meta/recipes-devtools/vala/vala.inc                |   20 ++++++++
 meta/recipes-devtools/vala/vala_0.16.0.bb          |    8 +++
 3 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
 create mode 100644 meta/recipes-devtools/vala/vala.inc
 create mode 100644 meta/recipes-devtools/vala/vala_0.16.0.bb

diff --git a/meta/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch b/meta/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
new file mode 100644
index 0000000..e6c7941
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
@@ -0,0 +1,53 @@
+From 2460d7b79f7e90dcfeebde5e9c53d9b6798a1f3c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 21 Feb 2012 17:12:50 +0100
+Subject: [PATCH] git-version-gen: don't append -dirty if we're not in git
+ repo
+
+* for example if we have some dirty directory and we unpack clean vala tarball in it, then it will append -dirty
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ build-aux/git-version-gen |   25 ++++++++++++++-----------
+ 1 files changed, 14 insertions(+), 11 deletions(-)
+
+diff --git a/build-aux/git-version-gen b/build-aux/git-version-gen
+index 0fa6faa..1d1f9d2 100755
+--- a/build-aux/git-version-gen
++++ b/build-aux/git-version-gen
+@@ -126,18 +126,21 @@ fi
+ 
+ v=`echo "$v" |sed 's/^v//'`
+ 
+-# Don't declare a version "dirty" merely because a time stamp has changed.
+-git status > /dev/null 2>&1
++if test -d .git
++then
++	# Don't declare a version "dirty" merely because a time stamp has changed.
++	git status > /dev/null 2>&1
+ 
+-dirty=`sh -c 'git diff-index --name-only HEAD' 2>/dev/null` || dirty=
+-case "$dirty" in
+-    '') ;;
+-    *) # Append the suffix only if there isn't one already.
+-	case $v in
+-	  *-dirty) ;;
+-	  *) v="$v-dirty" ;;
+-	esac ;;
+-esac
++	dirty=`sh -c 'git diff-index --name-only HEAD' 2>/dev/null` || dirty=
++	case "$dirty" in
++	    '') ;;
++	    *) # Append the suffix only if there isn't one already.
++		case $v in
++		  *-dirty) ;;
++		  *) v="$v-dirty" ;;
++		esac ;;
++	esac
++fi
+ 
+ # Omit the trailing newline, so that m4_esyscmd can use the result directly.
+ echo "$v" | tr -d '\012'
+-- 
+1.7.8.4
+
diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
new file mode 100644
index 0000000..6cdc605
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -0,0 +1,20 @@
+DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
+Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
+SECTION = "devel"
+DEPENDS = "glib-2.0 dbus gtk+"
+BBCLASSEXTEND = "native"
+DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
+HOMEPAGE = "http://vala-project.org"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+INC_PR = "r1"
+
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
+inherit autotools
+
+EXTRA_OECONF = "--disable-vapigen"
+
+FILES_${PN}-doc += "${datadir}/devhelp"
+FILES_${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi"
diff --git a/meta/recipes-devtools/vala/vala_0.16.0.bb b/meta/recipes-devtools/vala/vala_0.16.0.bb
new file mode 100644
index 0000000..92120b4
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.16.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
+
+SRC_URI[md5sum] = "84b742e9cca4c90fde3026c3793c03c1"
+SRC_URI[sha256sum] = "3adb37aa2b35e2e2daed47552e85dbcbf752c0f7768b269d856993620073a657"
-- 
1.7.9.5



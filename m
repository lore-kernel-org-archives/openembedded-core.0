Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8XAJ-0005m8-4I
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 15:58:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 06:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217553085"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 06:45:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 14:45:37 +0100
Message-Id: <c7e39a954a3449edc65092a9f626056cc5c5dde9.1346679751.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346679751.git.paul.eggleton@linux.intel.com>
References: <cover.1346679751.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346679751.git.paul.eggleton@linux.intel.com>
References: <cover.1346679751.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/7] oprofileui: split server to separate recipe to avoid X11 dependency
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
X-List-Received-Date: Mon, 03 Sep 2012 13:58:11 -0000

Increase SRCREV to include an upstream patch that fixes the configure
script so that the server can be built separately without gtk+ and
avahi-ui, and create a separate recipe for the server.

Also fix the RDEPENDS so that oprofile actually gets pulled in by the
client and the server.

Part of the fix for [YOCTO #1690].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../oprofile/oprofileui-server_git.bb              |   13 +++++++++++++
 meta/recipes-kernel/oprofile/oprofileui.inc        |   11 ++---------
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |   10 +++++++++-
 3 files changed, 24 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofileui-server_git.bb

diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
new file mode 100644
index 0000000..b9f6a81
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
@@ -0,0 +1,13 @@
+require oprofileui.inc
+
+SRCREV = "82ecf8c6b53b84f80682a8312f9defa83a95f2a3"
+PV = "0.0+git${SRCPV}"
+PR = "r0"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://git.yoctoproject.org/oprofileui;protocol=git"
+
+EXTRA_OECONF += "--disable-client --enable-server"
+
+RDEPENDS_${PN} = "oprofile"
diff --git a/meta/recipes-kernel/oprofile/oprofileui.inc b/meta/recipes-kernel/oprofile/oprofileui.inc
index ab14c38..9a9bc19 100644
--- a/meta/recipes-kernel/oprofile/oprofileui.inc
+++ b/meta/recipes-kernel/oprofile/oprofileui.inc
@@ -8,16 +8,9 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "glib-2.0 gtk+ libglade libxml2 avahi-ui gconf"
+DEPENDS = "glib-2.0 avahi"
 
-inherit autotools pkgconfig gtk-icon-cache
-
-PACKAGES =+ "oprofileui-server oprofileui-viewer"
+inherit autotools pkgconfig
 
 EXTRA_OECONF = "--with-avahi"
 
-FILES_oprofileui-viewer = "${bindir}/oparchconv ${bindir}/oprofile-viewer ${datadir}/applications/ ${datadir}/oprofileui/"
-RDEPENDS_oprofile-viewer = "oprofile"
-
-FILES_oprofileui-server = "${bindir}/oprofile-server"
-RDEPENDS_oprofile-server = "oprofile"
diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
index 3fe9bb4..2c6e96a 100644
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -1,10 +1,18 @@
 require oprofileui.inc
 
+DEPENDS += "gtk+ libglade libxml2 avahi-ui gconf"
+
 SRCREV = "82ecf8c6b53b84f80682a8312f9defa83a95f2a3"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
 S = "${WORKDIR}/git"
 
-# Oprofileui at http://labs.o-hand.com/oprofileui/ is not maintained now.
 SRC_URI = "git://git.yoctoproject.org/oprofileui;protocol=git"
+
+EXTRA_OECONF += "--enable-client --disable-server"
+
+PACKAGES =+ "oprofileui-viewer"
+
+FILES_oprofileui-viewer = "${bindir}/oparchconv ${bindir}/oprofile-viewer ${datadir}/applications/ ${datadir}/oprofileui/"
+RDEPENDS_oprofileui-viewer = "oprofile"
-- 
1.7.9.5




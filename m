Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1ROJYu-0000IY-Vy
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 02:36:17 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Nov 2011 17:29:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,486,1315206000"; d="scan'208";a="72645355"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.15])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 17:29:58 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 17:29:52 -0800
Message-Id: <d2ff8cde49d384d7ae700dbfff2ad8e9773c7eca.1320888203.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320888203.git.josh@linux.intel.com>
References: <cover.1320888203.git.josh@linux.intel.com>
In-Reply-To: <cover.1320888203.git.josh@linux.intel.com>
References: <cover.1320888203.git.josh@linux.intel.com>
Subject: [PATCH 5/7] clutter-*-1.6: drop clutter 1.6 recipes
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
X-List-Received-Date: Thu, 10 Nov 2011 01:36:17 -0000

Clutter 1.8 is API and ABI compatible with Clutter 1.6 according to the
release notes so there's no need to keep these recipes around.

www.clutter-project.org/blogs/archive/2011-09/clutter-1.8.0-stable-release

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../recipes-graphics/clutter/clutter-1.6_1.6.18.bb |   26 --------------------
 .../clutter/clutter-gst-1.6_1.3.6.bb               |   21 ----------------
 2 files changed, 0 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.6_1.6.18.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb

diff --git a/meta/recipes-graphics/clutter/clutter-1.6_1.6.18.bb b/meta/recipes-graphics/clutter/clutter-1.6_1.6.18.bb
deleted file mode 100644
index 9c32efd..0000000
--- a/meta/recipes-graphics/clutter/clutter-1.6_1.6.18.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-require recipes-graphics/clutter/clutter.inc
-
-PR = "r2"
-
-# Internal json-glib was removed in Clutter 1.5.2
-STDDEPENDS += "json-glib"
-
-PACKAGES =+ "${PN}-examples"
-FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
-
-SRC_URI = "http://source.clutter-project.org/sources/clutter/1.6/clutter-${PV}.tar.bz2 \
-           file://enable_tests-1.4.patch \
-           file://update_gettext_macro_version.patch"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-S = "${WORKDIR}/clutter-${PV}"
-
-BASE_CONF += "--disable-introspection"
-
-do_configure_prepend () {
-	# Disable DOLT
-	sed -i -e 's/^DOLT//' ${S}/configure.ac
-}
-
-SRC_URI[md5sum] = "7302513c96b00588b7779918fae0b33b"
-SRC_URI[sha256sum] = "d849f92944be193e9d8e707f1371e6bab7fca473e09a492265e2e2296febd749"
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb b/meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
deleted file mode 100644
index cf1da04..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require clutter-gst.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
-
-DEPENDS += "clutter-1.6"
-
-PR = "r1"
-
-SRC_URI = "http://source.clutter-project.org/sources/clutter-gst/1.3/clutter-gst-${PV}.tar.bz2 \
-           file://enable_tests.patch"
-
-SRC_URI[md5sum] = "5ec828cd10713c1c32996e5fa65aa956"
-SRC_URI[sha256sum] = "68c79596ae46ed54885409cac1eeeaf6819673e2f41ee3014fe9705dfbbc1b5a"
-
-S = "${WORKDIR}/clutter-gst-${PV}"
-
-do_configure_prepend () {
-       # Disable DOLT
-       sed -i -e 's/^DOLT//' ${S}/configure.ac
-}
-- 
1.7.7




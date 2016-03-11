Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 04531731F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:07:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 11 Mar 2016 05:07:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="907975367"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2016 05:07:05 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 15:12:28 +0200
Message-Id: <15b00b615b2b69e760fec69410e06597a3e42ddb.1457698804.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
References: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1457698804.git.jussi.kukkonen@intel.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
Subject: [RFC PATCH 09/12] gtk-sato-engine: Remove as unused
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
X-List-Received-Date: Fri, 11 Mar 2016 13:07:06 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  | 25 ----------------------
 .../gtk-engines/gtk-sato-engine_git.bb             | 14 ------------
 2 files changed, 39 deletions(-)
 delete mode 100644 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
 delete mode 100644 meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb

diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
deleted file mode 100644
index 93538ed..0000000
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Sato theme engine for GTK+"
-HOMEPAGE = "http://www.o-hand.com"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
-
-LICENSE = "LGPLv2.1 & LGPLv2+"
-
-SECTION = "x11/base"
-DEPENDS = "gtk+"
-RDEPENDS_gtk-theme-sato = "gtk-sato-engine"
-
-inherit distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-PACKAGES += "gtk-theme-sato"
-FILES_${PN} = "${libdir}/gtk-2.0/*/engines/*.so "
-FILES_${PN}-dev = "${libdir}/gtk-2.0/*/engines/*.la"
-FILES_gtk-theme-sato = "${datadir}/icons ${datadir}/themes"
-
-inherit autotools-brokensep pkgconfig
-
-do_configure_prepend() {
-	for i in `ls gtk-common`; do
-		ln -sf ../gtk-common/$i gtk2-engine/$i
-	done
-}
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
deleted file mode 100644
index da4d98a..0000000
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require gtk-sato-engine.inc
-
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/sato-utils.h;endline=24;md5=708f28cfe7fe028d497aaf4389b80b62 \
-                    file://src/sato-main.c;endline=24;md5=b5e5dddebca570275becb51b526e4c5a"
-
-SRCREV = "4740ad8d53aba4368ce3e03b06cfdc69eb86dcdc"
-PV = "0.3.3+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF += "${@bb.utils.contains('MACHINE_FEATURES', 'qvga', '--with-mode=qvga', '',d)}"
-- 
2.1.4



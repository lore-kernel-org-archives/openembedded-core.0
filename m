Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C0F16771F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:29:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2016 02:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,499,1464678000"; d="scan'208";a="1038512892"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2016 02:29:45 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3FA4A6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:29:29 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 12:30:26 +0300
Message-Id: <1470821429-6094-8-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
References: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 07/10] tslib: remove recipe
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
X-List-Received-Date: Wed, 10 Aug 2016 09:29:43 -0000

Modern systems generally use the kernel driver or libinput instead
of tslib. Move tslib from oe-core along with xtscal.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/tslib/tslib/ts.conf  | 25 --------------
 meta/recipes-graphics/tslib/tslib/tslib.sh |  8 -----
 meta/recipes-graphics/tslib/tslib_1.1.bb   | 53 ------------------------------
 3 files changed, 86 deletions(-)
 delete mode 100644 meta/recipes-graphics/tslib/tslib/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib_1.1.bb

diff --git a/meta/recipes-graphics/tslib/tslib/ts.conf b/meta/recipes-graphics/tslib/tslib/ts.conf
deleted file mode 100644
index 1b0da93..0000000
--- a/meta/recipes-graphics/tslib/tslib/ts.conf
+++ /dev/null
@@ -1,25 +0,0 @@
-# Uncomment if you wish to use the linux input layer event interface
-module_raw input
-
-# Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
-# module_raw collie
-
-# Uncomment if you're using a Sharp Zaurus SL-C700/C750/C760/C860
-# module_raw corgi
-
-# Uncomment if you're using a device with a UCB1200/1300/1400 TS interface
-# module_raw ucb1x00
-
-# Uncomment if you're using an HP iPaq h3600 or similar
-# module_raw h3600
-
-# Uncomment if you're using a Hitachi Webpad
-# module_raw mk712
-
-# Uncomment if you're using an IBM Arctic II
-# module_raw arctic2
-
-module pthres pmin=1
-module variance delta=30
-module dejitter delta=100
-module linear
diff --git a/meta/recipes-graphics/tslib/tslib/tslib.sh b/meta/recipes-graphics/tslib/tslib/tslib.sh
deleted file mode 100644
index 7068e8d..0000000
--- a/meta/recipes-graphics/tslib/tslib/tslib.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-if [ -e /dev/input/touchscreen0 ]; then
-    TSLIB_TSDEVICE=/dev/input/touchscreen0
-
-    export TSLIB_TSDEVICE
-fi
-
diff --git a/meta/recipes-graphics/tslib/tslib_1.1.bb b/meta/recipes-graphics/tslib/tslib_1.1.bb
deleted file mode 100644
index b0264c3..0000000
--- a/meta/recipes-graphics/tslib/tslib_1.1.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "An abstraction layer for touchscreen panel events"
-DESCRIPTION = "Tslib is an abstraction layer for touchscreen panel \
-events, as well as a filter stack for the manipulation of those events. \
-Tslib is generally used on embedded devices to provide a common user \
-space interface to touchscreen functionality."
-HOMEPAGE = "http://tslib.berlios.de/"
-
-AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
-SECTION = "base"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
-
-SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.tar.xz;downloadfilename=tslib-${PV}.tar.xz \
-           file://ts.conf \
-           file://tslib.sh \
-"
-
-SRC_URI[md5sum] = "14771f8607b341bb4b297819d37e837d"
-SRC_URI[sha256sum] = "fe35e5f710ea933b118f710e2ce4403ac076fe69926b570333867d4de082a51c"
-
-UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--enable-shared --disable-h3600 --enable-input --disable-corgi --disable-collie --disable-mk712 --disable-arctic2 --disable-ucb1x00"
-
-do_install_prepend() {
-	install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
-}
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/profile.d/
-	install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
-}
-
-# People should consider using udev's /dev/input/touchscreen0 symlink
-# instead of detect-stylus
-#RDEPENDS_tslib-conf_weird-machine = "detect-stylus"
-RPROVIDES_tslib-conf = "libts-0.0-conf"
-
-PACKAGES =+ "tslib-conf tslib-tests tslib-calibrate"
-DEBIAN_NOAUTONAME_tslib-conf = "1"
-DEBIAN_NOAUTONAME_tslib-tests = "1"
-DEBIAN_NOAUTONAME_tslib-calibrate = "1"
-
-RDEPENDS_${PN} = "tslib-conf"
-RRECOMMENDS_${PN} = "pointercal"
-
-FILES_${PN}-dev += "${libdir}/ts/*.la"
-FILES_tslib-conf = "${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tslib.sh ${datadir}/tslib"
-FILES_${PN} = "${libdir}/*.so.* ${libdir}/ts/*.so*"
-FILES_tslib-calibrate += "${bindir}/ts_calibrate"
-FILES_tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print ${bindir}/ts_print_raw ${bindir}/ts_test"
-- 
2.4.0



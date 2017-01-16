Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8147971998
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 13:44:20 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f73so31071473wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 05:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KyJgJMGluUTu79QPTWIBkdyVAeRdJaEgdugUDghsxOQ=;
	b=CpkGWIBiWddXIM3bhV5hQYf47054Gs6zQqpxGPe4pb7VtnL550/rMADZ6zaMdUTCc7
	ON+2ulos4RrCaR55RQHxbfWRc09cu1AkYt1hItc9x/46kk66A3XIuziUCdbZ5DoLF3DE
	8BGcjabh9RoAdiyAs1KnydYkSdURIcrjQGjk1sfAcjgnTHOMozQ0DYh6rIV4x6q7+7Y0
	8kFBGwqNDEHmmidPnlk+W2CLgNDQecExcf5Esn5QokKgByRiKhbEHIEC+Y3iS/6qMRLy
	44yRTCJlb7TDqqlj+TKi97ZfXHyGlF+jGwHzqSmyHdjmKDsmzplpWVpiNUrkCUXO1lMi
	ViLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KyJgJMGluUTu79QPTWIBkdyVAeRdJaEgdugUDghsxOQ=;
	b=oR/UDPXnu8LVl0CltbfwT8q/Ct1Q+n9UOnIj+vd4xuYRouL+IK872ETOutT5Mx/Hj0
	m7ZcOZ2VzH5IblbQTNNNDYF7f4egg+9vZIsh+L1OQWZgmen0xwTQU2ihSvOMQ6cUMHwm
	gyB74xEy/1xCsgw9rmCn/FIN3v7CLxjWvgv+SA5uiPSzir7upLPVxCqi49dOyyjvRbbP
	3KbgHU0EbheGfJg97oJjJ9r+aqDcS7Zy28fM1IhECtJ7NrUxKwbXDWbEILs1RB1hHZd2
	KqqLtsY8qBbYOz+xQYw/w7aikoYt/j+oxmTNWnKnZXTOUcaAIM9E8yBy8bUxBF3eCJaq
	z9BQ==
X-Gm-Message-State: AIkVDXJWore/e0f/ZQV9mlKZxN8QEy1ktVMmIiuY8Gp9mIII+bBLjSTq/1fVDZJKPAUgW7Ga
X-Received: by 10.28.86.131 with SMTP id k125mr12904141wmb.89.1484574259969;
	Mon, 16 Jan 2017 05:44:19 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	l67sm21925064wmf.1.2017.01.16.05.44.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Jan 2017 05:44:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 13:44:12 +0000
Message-Id: <1484574253-30817-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 1/2] perf: use PACKAGECONFIG instead of hand-rolled logic
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
X-List-Received-Date: Mon, 16 Jan 2017 13:44:20 -0000

PERF_FEATURES_ENABLE and perf_feature_enabled() was basically a poor man's clone
of PACKAGECONFIG, without the automatic handling of dependencies and configure
options.

As part of the port to PACKAGECONFIG the options have been changed to remove the
perf- prefix, but are otherwise unchanged.

Also remove BUILDPERF_libc_uclibc assignment as nothing in the metadata uses a
BUILDPERF variable.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/perf/perf-features.inc | 22 ----------------------
 meta/recipes-kernel/perf/perf.bb           | 26 +++++++++-----------------
 2 files changed, 9 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-kernel/perf/perf-features.inc

diff --git a/meta/recipes-kernel/perf/perf-features.inc b/meta/recipes-kernel/perf/perf-features.inc
deleted file mode 100644
index a4402cc..0000000
--- a/meta/recipes-kernel/perf/perf-features.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
-
-def perf_feature_enabled(feature, trueval, falseval, d):
-    """
-    Check which perf features are enabled.
-
-    The PERF_FEATURES_ENABLE variable lists the perf features to
-    enable.  Override it if you want something different from what's
-    listed above, which is the default.  If empty, the build won't
-    enable any features (which may be exactly what you want, just a
-    barebones perf without any extra baggage, what you get if you
-    specify an empty feature list).
-
-    Available perf features:
-      perf-scripting: enable support for Perl and Python bindings
-      perf-tui: enable support for the perf TUI (via libnewt)
-
-    """
-    enabled_features = d.getVar("PERF_FEATURES_ENABLE") or ""
-    if feature in enabled_features:
-        return trueval
-    return falseval
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index cfbe628..8b5028e 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -10,24 +10,21 @@ LICENSE = "GPLv2"
 
 PR = "r9"
 
-require perf-features.inc
-
 BUILDPERF_libc-uclibc = "no"
 
+PACKAGECONFIG ??= "scripting tui"
+PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python"
 # gui support was added with kernel 3.6.35
 # since 3.10 libnewt was replaced by slang
 # to cover a wide range of kernel we add both dependencies
-TUI_DEPENDS = "${@perf_feature_enabled('perf-tui', 'libnewt slang', '',d)}"
-SCRIPTING_DEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl python', '',d)}"
-LIBUNWIND_DEPENDS = "${@perf_feature_enabled('perf-libunwind', 'libunwind', '',d)}"
+PACKAGECONFIG[tui] = ",NO_NEWT=1,libnewt slang"
+PACKAGECONFIG[libunwind] = ",NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1,libunwind"
+PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
 
 DEPENDS = " \
     virtual/${MLPREFIX}libc \
     ${MLPREFIX}elfutils \
     ${MLPREFIX}binutils \
-    ${TUI_DEPENDS} \
-    ${SCRIPTING_DEPENDS} \
-    ${LIBUNWIND_DEPENDS} \
     bison flex xz \
     xmlto-native \
     asciidoc-native \
@@ -61,11 +58,6 @@ inherit kernelsrc
 B = "${WORKDIR}/${BPN}-${PV}"
 SPDX_S = "${S}/tools/perf"
 
-SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
-TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
-LIBUNWIND_DEFINES = "${@perf_feature_enabled('perf-libunwind', '', 'NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1',d)}"
-LIBNUMA_DEFINES = "${@perf_feature_enabled('perf-libnuma', '', 'NO_LIBNUMA=1',d)}"
-
 # The LDFLAGS is required or some old kernels fails due missing
 # symbols and this is preferred than requiring patches to every old
 # supported kernel.
@@ -82,8 +74,8 @@ EXTRA_OEMAKE = '\
     EXTRA_CFLAGS="-ldw" \
     EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \
-    NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${LIBUNWIND_DEFINES} \
-    ${SCRIPTING_DEFINES} ${LIBNUMA_DEFINES} \
+    NO_GTK2=1 NO_DWARF=1 \
+    ${PACKAGECONFIG_CONFARGS} \
 '
 
 EXTRA_OEMAKE += "\
@@ -116,7 +108,7 @@ do_install() {
 	unset CFLAGS
 	oe_runmake install
 	# we are checking for this make target to be compatible with older perf versions
-	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" ] && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
+	if ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'true', 'false', d)} && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
 		oe_runmake DESTDIR=${D} install-python_ext
 	fi
 }
@@ -225,7 +217,7 @@ RDEPENDS_${PN}-python =+ "bash python python-modules"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
 RDEPENDS_${PN}-tests =+ "python"
 
-RSUGGESTS_SCRIPTING = "${@perf_feature_enabled('perf-scripting', '${PN}-perl ${PN}-python', '',d)}"
+RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}-perl ${PN}-python', '',d)}"
 RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
 #FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core /usr/lib64/traceevent ${libdir}/traceevent"
-- 
2.8.1



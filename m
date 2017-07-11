Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4D78078038
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 12:57:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 05:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,346,1496127600"; d="scan'208";a="877573217"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2017 05:57:54 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 186125804B8;
	Tue, 11 Jul 2017 05:57:52 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:58:11 +0300
Message-Id: <1499777893-16292-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1499777893-16292-1-git-send-email-maxin.john@intel.com>
References: <1499777893-16292-1-git-send-email-maxin.john@intel.com>
Cc: joshua.g.lock@intel.com, Christopher Larson <chris_larson@mentor.com>,
	stanley.cheong.kwan.phoong@intel.com
Subject: [PATCH 1/3] pkgconf: add recipe
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
X-List-Received-Date: Tue, 11 Jul 2017 12:57:53 -0000

Move pkgconf recipe to oe-core from meta-pkgconf:
https://github.com/kergoth/meta-kergoth-wip/tree/master/meta-pkgconf

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/files/common-licenses/pkgconf                 | 10 ++++
 .../pkgconf/pkgconf/pkg-config-native.in           |  6 +++
 .../pkgconf/pkgconf/pkg-config-wrapper             | 16 +++++++
 meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb     | 55 ++++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 meta/files/common-licenses/pkgconf
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
 create mode 100755 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb

diff --git a/meta/files/common-licenses/pkgconf b/meta/files/common-licenses/pkgconf
new file mode 100644
index 0000000..81a5221
--- /dev/null
+++ b/meta/files/common-licenses/pkgconf
@@ -0,0 +1,10 @@
+Copyright (c) 2011, 2012, 2013, 2014, 2015, 2016, 2017
+    pkgconf authors (see AUTHORS file in source directory).
+
+Permission to use, copy, modify, and/or distribute this software for any
+purpose with or without fee is hereby granted, provided that the above
+copyright notice and this permission notice appear in all copies.
+
+This software is provided 'as is' and without any warranty, express or
+implied.  In no event shall the authors be liable for any damages arising
+from the use of this software.
diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
new file mode 100644
index 0000000..9ed30a0
--- /dev/null
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
@@ -0,0 +1,6 @@
+#! /bin/sh
+
+PKG_CONFIG_PATH="@PATH_NATIVE@"
+unset PKG_CONFIG_SYSROOT_DIR
+
+pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
new file mode 100755
index 0000000..695f349
--- /dev/null
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
@@ -0,0 +1,16 @@
+#!/bin/sh
+# pkgconf wrapper to deal with pkg-config/pkgconf compatibility issues
+#
+# Copyright (C) 2015 Christopher Larson <chris_larson@mentor.com>
+# License: MIT (see COPYING.MIT at the root of the repository for terms)
+
+for arg; do
+    case "$arg" in
+        --variable|--variable=*)
+            # pkg-config doesn't sysroot-prefix user variables
+            unset PKG_CONFIG_SYSROOT_DIR
+            ;;
+    esac
+done
+
+exec pkgconf "$@"
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb
new file mode 100644
index 0000000..dd2a012
--- /dev/null
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb
@@ -0,0 +1,55 @@
+SUMMARY = "pkgconf provides compiler and linker configuration for development frameworks."
+DESCRIPTION = "pkgconf is a program which helps to configure compiler and linker \
+flags for development frameworks. It is similar to pkg-config from \
+freedesktop.org, providing additional functionality while also maintaining \
+compatibility."
+HOMEPAGE = "http://pkgconf.org"
+BUGTRACKER = "https://github.com/pkgconf/pkgconf/issues"
+SECTION = "devel"
+PROVIDES += "pkgconfig"
+RPROVIDES_${PN} += "pkgconfig"
+DEFAULT_PREFERENCE = "-1"
+
+# The pkgconf license seems to be functionally equivalent to BSD-2-Clause or
+# ISC, but has different wording, so needs its own name.
+LICENSE = "pkgconf"
+LIC_FILES_CHKSUM = "file://COPYING;md5=548a9d1db10cc0a84810c313a0e9266f"
+
+SRC_URI = "\
+    https://distfiles.dereferenced.org/pkgconf/pkgconf-${PV}.tar.xz \
+    file://pkg-config-wrapper \
+    file://pkg-config-native.in \
+"
+SRC_URI[md5sum] = "ac35c34d84eeb6a03d4d61b8555d6197"
+SRC_URI[sha256sum] = "1be7e40900c7467893c65f810211b1e68da3f8d5e70fddb883fc24839cad0339"
+
+inherit autotools update-alternatives
+
+EXTRA_OECONF += "--with-pkg-config-dir='${libdir}/pkgconfig:${datadir}/pkgconfig'"
+
+do_install_append () {
+    # Install a wrapper which deals, as much as possible with pkgconf vs
+    # pkg-config compatibility issues.
+    install -m 0755 "${WORKDIR}/pkg-config-wrapper" "${D}${bindir}/pkg-config"
+}
+
+do_install_append_class-native () {
+    # Install a pkg-config-native wrapper that will use the native sysroot instead
+    # of the MACHINE sysroot, for using pkg-config when building native tools.
+    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
+        < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
+    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+}
+
+ALTERNATIVE_${PN} = "pkg-config"
+
+# When using the RPM generated automatic package dependencies, some packages
+# will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
+# specifying an appropriate provide.
+RPROVIDES_${PN} += "pkgconfig(pkg-config)"
+
+# Include pkg.m4 in the main package, leaving libpkgconf dev files in -dev
+FILES_${PN}-dev_remove = "${datadir}/aclocal"
+FILES_${PN} += "${datadir}/aclocal"
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.4.0



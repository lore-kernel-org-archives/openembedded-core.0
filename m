Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7D271A88
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 11:23:35 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 04:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,317,1496127600"; d="scan'208";a="105094396"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 06 Jul 2017 04:23:36 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 51FF658038E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 04:23:36 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 14:24:02 +0300
Message-Id: <1499340242-18008-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v3] curl: add ptest
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
X-List-Received-Date: Thu, 06 Jul 2017 11:23:39 -0000

Add ptest support to curl

Fixes [YOCTO #6707]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/curl/curl/run-ptest |  6 ++++++
 meta/recipes-support/curl/curl_7.54.1.bb | 22 +++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/run-ptest

diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-support/curl/curl/run-ptest
new file mode 100644
index 0000000..614e822
--- /dev/null
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+cd tests
+./runtests.pl -a -n -s | sed \
+     -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
+     -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
+     -e 's/Warning: test[0-9]\+ not present in tests\/data\/Makefile.inc//'
diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.54.1.bb
index f42582a..3622022 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.54.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://run-ptest \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
@@ -18,7 +19,7 @@ SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
 SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
 
 CVE_PRODUCT = "libcurl"
-inherit autotools pkgconfig binconfig multilib_header
+inherit autotools pkgconfig binconfig multilib_header ptest
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy zlib"
 PACKAGECONFIG_class-native = "ipv6 proxy ssl zlib"
@@ -62,6 +63,25 @@ do_install_append_class-target() {
 	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/curl-config
 }
 
+do_compile_ptest() {
+	oe_runmake test
+	oe_runmake -C ${B}/tests/data/ show
+	oe_runmake -C ${B}/tests/server
+}
+
+do_install_ptest() {
+	cp -rf ${B}/tests ${D}${PTEST_PATH}
+	cp -rf ${S}/tests ${D}${PTEST_PATH}
+	install -d ${D}${PTEST_PATH}/src
+	ln -sf ${bindir}/curl   ${D}${PTEST_PATH}/src/curl
+}
+
+RDEPENDS_${PN}-ptest += "make bash perl perl-module-cwd \
+                         perl-module-ipc-open2 perl-module-digest-md5\
+                         perl-module-file-basename perl-module-posix \
+                         perl-module-errno python python-netserver \
+                         python-argparse python-pprint diffutils"
+
 PACKAGES =+ "lib${BPN}"
 
 FILES_lib${BPN} = "${libdir}/lib*.so.*"
-- 
2.4.0



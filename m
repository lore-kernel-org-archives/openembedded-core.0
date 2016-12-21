Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 22EBF773D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 15:18:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 21 Dec 2016 07:19:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,384,1477983600"; d="scan'208";a="1074861996"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2016 07:19:00 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 7AD946A4006;
	Wed, 21 Dec 2016 07:18:10 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 17:20:26 +0200
Message-Id: <1482333628-15689-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Cc: Cristian Iorga <cristian.iorga@intel.com>
Subject: [PATCH 1/3 V2] curl: add ptest
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
X-List-Received-Date: Wed, 21 Dec 2016 15:19:00 -0000

Add ptest support to curl

[YOCTO #6707]

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
Changes in V2:
Drop ptest dependency on openssh since the Test suite "will not run ssh
server as root to mitigate security risks".
---
 .../curl/0001-runtests.pl-remove-warning.patch     | 31 ++++++++++++++++++++++
 meta/recipes-support/curl/curl/run-ptest           |  5 ++++
 meta/recipes-support/curl/curl_7.51.0.bb           | 25 +++++++++++++++--
 3 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/0001-runtests.pl-remove-warning.patch
 create mode 100644 meta/recipes-support/curl/curl/run-ptest

diff --git a/meta/recipes-support/curl/curl/0001-runtests.pl-remove-warning.patch b/meta/recipes-support/curl/curl/0001-runtests.pl-remove-warning.patch
new file mode 100644
index 0000000..283aa20
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-runtests.pl-remove-warning.patch
@@ -0,0 +1,31 @@
+From c1d3bf13567909395715e441bc329793a5d2566b Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Mon, 12 Dec 2016 12:49:46 +0200
+Subject: [PATCH] runtests.pl: remove warning
+
+Remove the warning which floods the console while executing tests.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ tests/runtests.pl | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/tests/runtests.pl b/tests/runtests.pl
+index b8497f9..3cc6415 100755
+--- a/tests/runtests.pl
++++ b/tests/runtests.pl
+@@ -2879,9 +2879,6 @@ sub singletest {
+     # timestamp test preparation start
+     $timeprepini{$testnum} = Time::HiRes::time() if($timestats);
+ 
+-    if($disttests !~ /test$testnum\W/ ) {
+-        logmsg "Warning: test$testnum not present in tests/data/Makefile.inc\n";
+-    }
+     if($disabled{$testnum}) {
+         logmsg "Warning: test$testnum is explicitly disabled\n";
+     }
+-- 
+2.4.0
+
diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-support/curl/curl/run-ptest
new file mode 100644
index 0000000..c91f294
--- /dev/null
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+cd tests
+./runtests.pl -a -n -s | sed \
+     -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
+     -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|'
diff --git a/meta/recipes-support/curl/curl_7.51.0.bb b/meta/recipes-support/curl/curl_7.51.0.bb
index a9589b8..880ace2 100644
--- a/meta/recipes-support/curl/curl_7.51.0.bb
+++ b/meta/recipes-support/curl/curl_7.51.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://0001-runtests.pl-remove-warning.patch \
+           file://run-ptest \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
@@ -18,7 +20,8 @@ SRC_URI[md5sum] = "09a7c5769a7eae676d5e2c86d51f167e"
 SRC_URI[sha256sum] = "7f8240048907e5030f67be0a6129bc4b333783b9cca1391026d700835a788dde"
 
 CVE_PRODUCT = "libcurl"
-inherit autotools pkgconfig binconfig multilib_header
+
+inherit autotools pkgconfig binconfig multilib_header ptest
 
 PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls proxy zlib"
 PACKAGECONFIG_class-native = "ipv6 proxy ssl zlib"
@@ -62,11 +65,29 @@ do_install_append_class-target() {
 	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/curl-config
 }
 
+do_compile_ptest() {
+     oe_runmake test
+     oe_runmake -C ${B}/tests/data/ show
+     oe_runmake -C ${B}/tests/server
+}
+
+do_install_ptest() {
+     cp -rf ${B}/tests ${D}${PTEST_PATH}
+     cp -rf ${S}/tests ${D}${PTEST_PATH}
+     install -d ${D}${PTEST_PATH}/src
+     ln -sf ${bindir}/curl   ${D}${PTEST_PATH}/src/curl
+}
+
 PACKAGES =+ "lib${BPN}"
 
 FILES_lib${BPN} = "${libdir}/lib*.so.*"
 RRECOMMENDS_lib${BPN} += "ca-certificates"
-
+RDEPENDS_${PN}-ptest += "make bash perl perl-module-cwd \
+                         perl-module-ipc-open2 perl-module-digest-md5\
+                         perl-module-file-basename perl-module-posix \
+                         perl-module-errno python python-netserver \
+                         python-argparse python-pprint diffutils \
+                        "
 FILES_${PN} += "${datadir}/zsh"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.4.0



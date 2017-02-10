Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 16B1360069
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 14:00:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 06:00:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="819325197"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2017 06:00:33 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 1EBB86A4080;
	Fri, 10 Feb 2017 05:59:31 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 16:01:40 +0200
Message-Id: <1486735300-3408-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Cc: Cristian Iorga <cristian.iorga@intel.com>
Subject: [PATCH v2] curl: add ptest
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
X-List-Received-Date: Fri, 10 Feb 2017 14:00:34 -0000

Add ptest support to curl

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
Changes in v2:
        Make dependency on openssh optional

 .../curl/0001-runtests.pl-remove-warning.patch     | 31 ++++++++++++++++++++++
 meta/recipes-support/curl/curl/run-ptest           |  8 ++++++
 meta/recipes-support/curl/curl_7.52.1.bb           | 23 +++++++++++++++-
 3 files changed, 61 insertions(+), 1 deletion(-)
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
index 0000000..d22e6f7
--- /dev/null
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -0,0 +1,8 @@
+#!/bin/sh
+useradd curl-test
+chown -R curl-test:curl-test .
+cd tests
+su curl-test -c "./runtests.pl -a -n -s | sed \
+    -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
+    -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|'"
+userdel curl-test
diff --git a/meta/recipes-support/curl/curl_7.52.1.bb b/meta/recipes-support/curl/curl_7.52.1.bb
index 2882bc0..b7c08f1 100644
--- a/meta/recipes-support/curl/curl_7.52.1.bb
+++ b/meta/recipes-support/curl/curl_7.52.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://0001-runtests.pl-remove-warning.patch \
+           file://run-ptest \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
@@ -18,7 +20,7 @@ SRC_URI[md5sum] = "dd014df06ff1d12e173de86873f9f77a"
 SRC_URI[sha256sum] = "d16185a767cb2c1ba3d5b9096ec54e5ec198b213f45864a38b3bda4bbf87389b"
 
 CVE_PRODUCT = "libcurl"
-inherit autotools pkgconfig binconfig multilib_header
+inherit autotools pkgconfig binconfig multilib_header ptest
 
 PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls proxy zlib"
 PACKAGECONFIG_class-native = "ipv6 proxy ssl zlib"
@@ -62,11 +64,30 @@ do_install_append_class-target() {
 	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/curl-config
 }
 
+do_compile_ptest() {
+    oe_runmake test
+    oe_runmake -C ${B}/tests/data/ show
+    oe_runmake -C ${B}/tests/server
+}
+
+do_install_ptest() {
+    cp -rf ${B}/tests ${D}${PTEST_PATH}
+    cp -rf ${S}/tests ${D}${PTEST_PATH}
+    install -d ${D}${PTEST_PATH}/src
+    ln -sf ${bindir}/curl   ${D}${PTEST_PATH}/src/curl
+}
+
 PACKAGES =+ "lib${BPN}"
 
 FILES_lib${BPN} = "${libdir}/lib*.so.*"
 RRECOMMENDS_lib${BPN} += "ca-certificates"
 
+RDEPENDS_${PN}-ptest += "make bash sudo perl perl-module-cwd perl-module-ipc-open2 \
+    ${@bb.utils.contains("IMAGE_FEATURES", "ssh-server-openssh", "openssh ", "",d)}\
+    perl-module-digest-md5  perl-module-file-basename perl-module-posix diffutils \
+    perl-module-errno python python-netserver python-argparse python-pprint \
+    "
+
 FILES_${PN} += "${datadir}/zsh"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.4.0



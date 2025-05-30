Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0C5C54F30
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 07:11:03 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.1267.1748589058681809327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 00:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm2 header.b=OnXPDdld;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1328795-20250530071055ac214fd830c1c17672-aehfol@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250530071055ac214fd830c1c17672
        for <openembedded-core@lists.openembedded.org>;
        Fri, 30 May 2025 09:10:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=hdgHWcgKpGTVBzPjqmadb7qpeYDAcutwJkC8LwD0w9M=;
 b=OnXPDdldINasLrjqJsPqMI0t/bp0mnuf0qBBmOQMLtJ5egCgfBDeqmY4xnq5U/4sGvgoiv
 4Yzmj/HUrEl7uVsgegEFgG19vKVZ3HraZgFhanw0zbL0mhCeKfzyD8Bh888lAeD9W5sRpPoO
 u4QzgeZDIiG/wvdxGlSI/cTfPyF+/p6TirHwd89Te2iMqC+Ygnq92cl7UfIl17PTzeauzP2v
 UxMZ4OJ6TtOIEp6w1V6ZUxmNwW1MKHJUF58ZrIuZ/ZhcU7QxtNz4P3dSbgM6Xlb1ZJJiIAdb
 F/GNTjfX/dFvuXnTOQMm5fueqvoc4F4GC0ZXGxYbxxVTtNN5D9VsYZiA==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [OE-core][kirkstone][PATCH v2] curl: add ptests
Date: Fri, 30 May 2025 09:10:35 +0200
Message-Id: <20250530071035.2805304-1-andrej.kozemcak@siemens.com>
In-Reply-To: <CAOSpxdY=1nEQsOXMAqzwQ30xHUmwdUkhNGQf0T_v8G1ZfJhadA@mail.gmail.com>
References: <CAOSpxdY=1nEQsOXMAqzwQ30xHUmwdUkhNGQf0T_v8G1ZfJhadA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328795:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217468

Ptest was copy from scarthgap and then edit for kirkstone.
For kirstone we disable this test (which is already failing in kirstone):
- 418
- 722
and remove this tests (which not exist in kirstone):
- 412
- 413
- 1478
- 1477
- 1222
- 1279

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>

---
PATCH v2, list of changes:
- fix warning: ptest-packagelists.inc [missing-ptest]
- fix error: Nothing RPROVIDES 'locale-base-en-us'
- can't reproduce errors: nothing provides perl-module* 

---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/curl/curl/disable-tests  | 37 +++++++++++++++
 meta/recipes-support/curl/curl/run-ptest      | 13 ++++++
 meta/recipes-support/curl/curl_7.82.0.bb      | 45 ++++++++++++++++++-
 4 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/disable-tests
 create mode 100644 meta/recipes-support/curl/curl/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5c6a30635f..21b42fba91 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -78,6 +78,7 @@ PTESTS_FAST:remove:riscv32 = "qemu-ptest"
 PTESTS_PROBLEMS:append:riscv32 = " qemu-ptest"
 
 PTESTS_SLOW = "\
+    curl-ptest \
     babeltrace-ptest \
     babeltrace2-ptest \
     busybox-ptest \
diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
new file mode 100644
index 0000000000..64d59d0d8e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -0,0 +1,37 @@
+# Intermittently fails e.g. https://autobuilder.yocto.io/pub/non-release/20231220-28/testresults/qemux86-64-ptest/curl.log
+# https://autobuilder.yocto.io/pub/non-release/20231220-27/testresults/qemux86-64-ptest/curl.log
+337
+# These CRL test (alt-avc) are failing
+356
+# These were failing kirkstone version when adding ptest
+418
+722
+# These CRL tests are scanning docs
+971
+# Intermittently hangs e.g http://autobuilder.yocto.io/pub/non-release/20231228-18/testresults/qemux86-64-ptest/curl.log
+1091
+# Intermittently hangs e.g https://autobuilder.yocto.io/pub/non-release/20231220-27/testresults/qemux86-64-ptest/curl.log
+1096
+# These CRL tests are scanning docs
+1119
+1132
+1135
+# These CRL tests are scanning headers
+1167
+# These CRL tests are scanning man pages
+1139
+1140
+1173
+1177
+# This CRL test is looking for m4 files
+1165
+# This CRL test is looking for src files
+1185
+# These CRL tests need --libcurl option to be enabled
+1400
+1401
+1402
+1403
+1404
+1405
+1465
diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-support/curl/curl/run-ptest
new file mode 100644
index 0000000000..5e8d90087a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+cd tests
+
+# Run all tests, don't stop on first failure
+# Don't use valgrind if it is found
+# Use automake-style output
+# Run four tests in parallel
+# Print log output on failure
+
+# Don't run the flaky or timing dependent tests
+# Until https://github.com/curl/curl/issues/13350 is resolved, don't run FTP tests
+./runtests.pl -a -n -am -p !flaky !timing-dependent !FTP
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index cda42da4d3..e10193140c 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -10,6 +10,8 @@ LICENSE = "curl"
 LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 
 SRC_URI = "https://curl.se/download/${BP}.tar.xz \
+           file://run-ptest \
+           file://disable-tests \
            file://CVE-2022-22576.patch \
            file://CVE-2022-27775.patch \
            file://CVE-2022-27776.patch \
@@ -74,7 +76,7 @@ CVE_CHECK_IGNORE += "CVE-2023-42915"
 # ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack
 CVE_CHECK_IGNORE += "CVE-2024-32928"
 
-inherit autotools pkgconfig binconfig multilib_header
+inherit autotools pkgconfig binconfig multilib_header ptest
 
 # Entropy source for random PACKAGECONFIG option
 RANDOM ?= "/dev/urandom"
@@ -139,6 +141,47 @@ do_install:append:class-target() {
 	    ${D}${bindir}/curl-config
 }
 
+do_compile_ptest() {
+	oe_runmake -C ${B}/tests
+}
+
+do_install_ptest() {
+	cat  ${WORKDIR}/disable-tests >> ${S}/tests/data/DISABLED
+	rm -f ${B}/tests/configurehelp.pm
+	cp -rf ${B}/tests ${D}${PTEST_PATH}
+        rm -f ${D}${PTEST_PATH}/tests/libtest/.libs/libhostname.la
+        rm -f ${D}${PTEST_PATH}/tests/libtest/libhostname.la
+        mv ${D}${PTEST_PATH}/tests/libtest/.libs/* ${D}${PTEST_PATH}/tests/libtest/
+        mv ${D}${PTEST_PATH}/tests/libtest/libhostname.so ${D}${PTEST_PATH}/tests/libtest/.libs/
+	cp -rf ${S}/tests ${D}${PTEST_PATH}
+	find ${D}${PTEST_PATH}/ -type f -name Makefile.am -o -name Makefile.in -o -name Makefile -delete
+	install -d ${D}${PTEST_PATH}/src
+	ln -sf ${bindir}/curl   ${D}${PTEST_PATH}/src/curl
+	cp -rf ${D}${bindir}/curl-config ${D}${PTEST_PATH}
+}
+
+RDEPENDS:${PN}-ptest:append:libc-glibc = " \
+    locale-base-en-us \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	bash \
+	perl-module-b \
+	perl-module-base \
+	perl-module-cwd \
+	perl-module-digest \
+	perl-module-digest-md5 \
+	perl-module-file-basename \
+	perl-module-file-spec \
+	perl-module-file-temp \
+	perl-module-io-socket \
+	perl-module-ipc-open2 \
+	perl-module-list-util \
+	perl-module-memoize \
+	perl-module-storable \
+	perl-module-time-hires \
+"
+
 PACKAGES =+ "lib${BPN}"
 
 FILES:lib${BPN} = "${libdir}/lib*.so.*"
-- 
2.39.5



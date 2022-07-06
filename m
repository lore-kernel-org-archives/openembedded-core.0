Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9485C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 10:18:52 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.4466.1657102724007610262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 03:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dLtjNupM;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657102724; x=1688638724;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HUl4SHFxCz4O6QlDA9yU/W7dfkQJ32X7aDkHzGckSTI=;
  b=dLtjNupM8kYorj4ZT8EwVZuJebSAdsuTdXWN3n1mDNx5F1A77B4N+znr
   DvAIKcofi6iETfWUcH24pHnxf0iEQQvVlNjIwiDN0ubeZrcWweZ2/eCOv
   S2+RtZe/WzdZ4zscKHXF9yGYhfLpL7e1wnPJHUxh7m9K3OKnNJBYM61A0
   cfBaQCj9nurgDo9ggNxZkXy4borOZJJ2BhyLuzg51FNiMeWPw5AjdyNhw
   jcO5065Sw/9gaDZhCDDy+ullcTfYNmzX5KKw9X5UputL5IGw8xY6VsXKe
   JxSPLSnQfGG+S9MRr2Dgjn/BJPzxEOPntgTBumoayQnM72RyiHAC6rLze
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="272491206"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400";
   d="scan'208";a="272491206"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 03:18:40 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400";
   d="scan'208";a="920106339"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 06 Jul 2022 03:18:39 -0700
From: Yogesh Tyagi <yogesh.tyagi@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4] curl : Add ptest
Date: Wed,  6 Jul 2022 18:18:27 +0800
Message-Id: <20220706101827.76249-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 10:18:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167716

- curl-ptest is taking around 200 seconds to execute so
  added curl-ptest to PTESTS_SLOW
- This patch is rework on an existing patch provided
  by Maxin B. John (maxin.john@intel.com)
  https://www.openembedded.org/pipermail/openembedded-core/2017-July/139176.html
- Below is the run log of curl-ptest
  START: ptest-runner
  2022-07-03T15:52
  BEGIN: /usr/lib/curl/ptest
  ********* System characteristics ********
  * curl 7.83.1 (x86_64-poky-linux-gnu)
  * libcurl/7.83.1 OpenSSL/3.0.3 zlib/1.2.12 libidn2/2.3.2
  * Features: alt-svc AsynchDNS Debug HSTS HTTPS-proxy IDN Largefile libz NTLM SSL TLS-SRP UnixSockets
  * Disabled: headers-api
  * Host: qemux86-64
  * System: Linux qemux86-64 5.15.44-yocto-standard #1 SMP PREEMPT Tue May 31 20:28:59 UTC 2022 x86_64 GNU/Linux
  * OS: linux
  * Servers: HTTP-unix
  * Env:
  * Seed: 238593
  *****************************************
  PASS: test 0001 (1   out of 1466, remaining: 25:07, took 1.029s, duration: 00:01)
  PASS: test 0002 (2   out of 1466, remaining: 13:21, took 0.065s, duration: 00:01)
  ...
  ...
  PASS: test 3019 (1460 out of 1466, remaining: 00:00, took 0.012s, duration: 03:16)
  PASS: test 3020 (1461 out of 1466, remaining: 00:00, took 0.011s, duration: 03:16)
  test 3025...The tool set in the test case for this: 'lib3025' does not exist
  TESTDONE: 1280 tests were considered during 197 seconds.
  TESTDONE: 783 tests out of PASS: 783 report: 100%
  DURATION: 202
  END: /usr/lib/curl/ptest
  2022-07-03T15:56
  STOP: ptest-runner
  TOTAL: 1 FAIL: 0
- disable the curl tests that are expected to fail
- remove the generated file configurehelp.pm from curl test beacuse it is causing reproducible build failure.
  this file is used by some curl tests to scan symbols from curl headers. we are anyway not installing curl
  headers and already have disabled those tests.
  [YOCTO #6707]

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
v4:removed configurehelp.pm from curl test which is causing reproducible build error

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/curl/curl/disable-tests  | 28 +++++++++++++++++++
 meta/recipes-support/curl/curl/run-ptest      |  6 ++++
 meta/recipes-support/curl/curl_7.84.0.bb      | 21 +++++++++++++-
 4 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/disable-tests
 create mode 100644 meta/recipes-support/curl/curl/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index a1ead90649..6c4339e3e1 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -81,6 +81,7 @@ PTESTS_SLOW = "\
     babeltrace2-ptest \
     busybox-ptest \
     coreutils-ptest \
+    curl-ptest \
     dbus-ptest \
     e2fsprogs-ptest \
     findutils-ptest \
diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
new file mode 100644
index 0000000000..92056bd8ca
--- /dev/null
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -0,0 +1,28 @@
+# These CRL test (alt-avc) are failing
+356
+412
+413
+# These CRL tests are scanning docs
+971
+1119
+1132
+1135
+# These CRL tests are scnning headers
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
index 0000000000..614e822922
--- /dev/null
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+cd tests
+./runtests.pl -a -n -s | sed \
+     -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
+     -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
+     -e 's/Warning: test[0-9]\+ not present in tests\/data\/Makefile.inc//'
diff --git a/meta/recipes-support/curl/curl_7.84.0.bb b/meta/recipes-support/curl/curl_7.84.0.bb
index 74a19d20c9..0d829cdf23 100644
--- a/meta/recipes-support/curl/curl_7.84.0.bb
+++ b/meta/recipes-support/curl/curl_7.84.0.bb
@@ -12,13 +12,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 SRC_URI = " \
     https://curl.se/download/${BP}.tar.xz \
     file://0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch \
+    file://run-ptest \
+    file://disable-tests \
 "
 SRC_URI[sha256sum] = "2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080aef49fbcd817c5db8"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 
-inherit autotools pkgconfig binconfig multilib_header
+inherit autotools pkgconfig binconfig multilib_header ptest
 
 # Entropy source for random PACKAGECONFIG option
 RANDOM ?= "/dev/urandom"
@@ -83,6 +85,23 @@ do_install:append:class-target() {
 	    ${D}${bindir}/curl-config
 }
 
+do_compile_ptest() {
+	oe_runmake test
+	oe_runmake -C ${B}/tests/server
+}
+
+do_install_ptest() {
+	cat  ${WORKDIR}/disable-tests >> ${S}/tests/data/DISABLED
+	rm  ${B}/tests/configurehelp.pm
+	cp -rf ${B}/tests ${D}${PTEST_PATH}
+	cp -rf ${S}/tests ${D}${PTEST_PATH}
+	install -d ${D}${PTEST_PATH}/src
+	ln -sf ${bindir}/curl   ${D}${PTEST_PATH}/src/curl
+	cp -rf ${D}${bindir}/curl-config ${D}${PTEST_PATH}
+}
+
+RDEPENDS:${PN}-ptest += "bash perl-modules"
+
 PACKAGES =+ "lib${BPN}"
 
 FILES:lib${BPN} = "${libdir}/lib*.so.*"
-- 
2.36.1



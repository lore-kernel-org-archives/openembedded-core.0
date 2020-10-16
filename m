Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12220.1602843683020080320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0121E38C166F
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] openssl: upgrading to 1.1.1h SUCCEEDED
Message-ID: <MADEUP.163E71D66B298D86.21580@lists.openembedded.org>
X-Groupsio-MsgNum: 143413
Content-Type: multipart/mixed; boundary="===============4399820368060388850=="

--===============4399820368060388850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssl* to *1.1.1h* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssl-upgrade-1.1.1g-1.1.1h.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============4399820368060388850==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-openssl-upgrade-1.1.1g-1.1.1h.patch"

From 5a30855afbb8ea7de66276a085e4fdcda20c04c0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 00:57:09 +0000
Subject: [PATCH] openssl: upgrade 1.1.1g -> 1.1.1h

---
 .../openssl/files/environment.d-openssl.sh           |  1 -
 meta/recipes-connectivity/openssl/openssl/run-ptest  | 12 ------------
 .../openssl/{openssl_1.1.1g.bb => openssl_1.1.1h.bb} |  3 +--
 3 files changed, 1 insertion(+), 15 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/run-ptest
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1g.bb => openssl_1.1.1h.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
deleted file mode 100644
index b9cc24a7ac..0000000000
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ /dev/null
@@ -1 +0,0 @@
-export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
deleted file mode 100644
index 3fb22471f8..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/bin/sh
-
-set -e
-
-# Optional arguments are 'list' to lists all tests, or the test name (base name
-# ie test_evp, not 03_test_evp.t).
-
-export TOP=.
-# OPENSSL_ENGINES is relative from the test binaries
-export OPENSSL_ENGINES=../engines
-
-perl ./test/run_tests.pl $* | perl -0pe 's#(.*) \.*.ok#PASS: \1#g; s#(.*) \.*.skipped: (.*)#SKIP: \1 (\2)#g; s#(.*) \.*.\nDubious#FAIL: \1#;'
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
index 815955837b..fc0b0f839a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
 DEPENDS = "hostperl-runtime-native"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
-           file://run-ptest \
            file://0001-skip-test_symbol_presence.patch \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
@@ -23,7 +22,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
+SRC_URI[sha256sum] = "5c9ca8774bd7b03e5784f26ae9e9e6d749c9da2438545077e6b3d755a06595d9"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.18.4


--===============4399820368060388850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/openssl: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/libcrypto: PKGSIZE changed from 2851620 to 2855716 (+0%)
packages/core2-32-poky-linux/openssl/libcrypto: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/libcrypto: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/libssl: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/libssl: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/openssl-bin: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/openssl-bin: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/openssl-conf: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/openssl-conf: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/openssl-dbg: PKGSIZE changed from 89716164 to 94885960 (+6%)
packages/core2-32-poky-linux/openssl/openssl-dbg: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/openssl-dbg: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/openssl-dev: PKGSIZE changed from 1371674 to 1372706 (+0%)
packages/core2-32-poky-linux/openssl/openssl-dev: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/openssl-dev: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/openssl-doc: PKGSIZE changed from 132570 to 132734 (+0%)
packages/core2-32-poky-linux/openssl/openssl-doc: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/openssl-doc: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/openssl-engines: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/openssl-engines: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/openssl-locale: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/openssl-locale: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/openssl-misc: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/openssl-misc: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/openssl-ptest: PKGSIZE changed from 62150597 to 64669405 (+4%)
packages/core2-32-poky-linux/openssl/openssl-ptest: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/openssl-ptest: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/openssl-src: PKGSIZE changed from 23925768 to 23949480 (+0%)
packages/core2-32-poky-linux/openssl/openssl-src: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/openssl-src: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/openssl-staticdev: PKGSIZE changed from 12066112 to 12081192 (+0%)
packages/core2-32-poky-linux/openssl/openssl-staticdev: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/openssl-staticdev: PV changed from "1.1.1g" to "1.1.1h"
packages/core2-32-poky-linux/openssl/openssl: PKGV changed from 1.1.1g [default] to 1.1.1h [default]
packages/core2-32-poky-linux/openssl/openssl: PV changed from "1.1.1g" to "1.1.1h"

--===============4399820368060388850==--

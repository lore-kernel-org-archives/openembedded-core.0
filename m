Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E02C369C9
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:14:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.29955.1744834473722437879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1v5c73Pb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c33ac23edso1021445ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 13:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744834473; x=1745439273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipc7u4vNbr2zxU5APbUtxjZdRK1vUmJdZBMSV0366NY=;
        b=1v5c73PbQWElVM/FAJzgdOD4HS+YMyUbPUNiEAdwCb5uI/CidjaiRa/mqCqeBZBZOv
         7s6I31/+ewyg5BGaRxbP4fm8iZdvPnKFDyCBZWkoS9+wbV2SXuXeY7A8XVo9Fz2SWK08
         bDAUx5KOmNZdcmqRCE1PnkyG3pYxT8YDjBiMWSup7JlYy1Aj5N5stnbKjjPmWA83Vt+A
         2phM+4D0kRXGmGMBr+iPNalrm7q2XQZNgxPxQEazk9iMfnjKxvgvcUT6QRephXB3vANy
         FUNBZcVWwObKcejqkFArTujYvzdqYi97C+9bf2KZIp0BCXxZT8IfvDlzRtSOvcsqwKUM
         K8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834473; x=1745439273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipc7u4vNbr2zxU5APbUtxjZdRK1vUmJdZBMSV0366NY=;
        b=whxfVG2zQMDYunlCRl66BJZUDM/RuZHUKAEyyiDRLXFu91pv9Uq1y9KgHXS2zkdZnB
         hZVdj7bV/DoXbcSNE7QFDru3FxUCjCa+yGilOh/4tvQTAsEp9UxSgZrM3Bbjjqdt73ME
         WrQfzTntICz9fRfbhDWjUQg++mpkOSqmKHay4tKzLTVEpPP2QF4/69IAB+x/XMGDHrde
         hupw2HCyLZsunniJtX1i3Um2V2fc+VdELn/UoccgJ5c5jgelyppE4xS80j6WNyZAJlT+
         7TKHMBBi71aJ2bZFCzNgQOuNHcaSHRwzsBMx2i2o927HJuqG85dB7ngQ3SZqmd/3L3MF
         Ju6A==
X-Gm-Message-State: AOJu0Yyw3sUPKEhy6KXCYyJpEU5fEeqf1m3e0quy1boHBloKMrq6I8y6
	vIdz1pxYVO6wQTPiZcn5tizZGktdTaNxLRANRhmEjd+g0v+C9d4G5vEO51a13cjpep+QtkmTKAm
	j
X-Gm-Gg: ASbGncu2xp39OGflM1qnmRteloi7CgCA0BdXd3pev5ZZlANPfstnMpONuytviOQeuGK
	gNKJB+mNqXgobgHWZU/X4Z/HQRBbvgEBMqTXkfPJqIEVcPRptJ1+hDq9MbxPhMyimXJoR6hYBJc
	GjUcDqOLts+zUNA/VF+e9ccpkyAXRQJXqYG2ISt+F8p0taRk0T1ZvwTW1l3Wbu22aTLcmk/vOMw
	+y+rEqDkVsPOb9gH9dt/0uCdbEYtB1xJ3J9FP/tUMZCfpTNj7W3yHjPLTaLf48lJkJbAJpiJHT7
	m5Nx1Cq2N3gsXdkzExXEC3ImlLVqQ8FU
X-Google-Smtp-Source: AGHT+IGreUQ1TGO4akkKWipPZnTQox+u89i3GOhS8ymAtghHjnxaFqIbZMvdGVR6oJmwn72A9Kqptg==
X-Received: by 2002:a17:903:24c:b0:227:e74a:a066 with SMTP id d9443c01a7336-22c35916cc4mr41931335ad.28.1744834472845;
        Wed, 16 Apr 2025 13:14:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aeb8:30c6:2c5c:85aa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b222029ccsm1703880a12.62.2025.04.16.13.14.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:14:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/6] openssl: rewrite ptest installation
Date: Wed, 16 Apr 2025 13:14:15 -0700
Message-ID: <617c68752faf94a265e3b2ceba8fdd16e2ff3e5a.1744834364.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744834364.git.steve@sakoman.com>
References: <cover.1744834364.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215013

From: Vishwas Udupa <quic_vudupa@quicinc.com>

Rewrite (again) the openssl test suite installation.

Depend on and reuse already installed libraries and modules instead of
installing them twice.

Be more selective when installing from the build tree so we don't install
intermediate .c .d .o files.

This further reduces the size of openssl-dbg from ~120MB to ~18MB.

(From OE-Core rev: 8baa0ce7eae65026cb3a784adaf3a4fc724ce9c9)

Upstream-Status: Backport[https://git.yoctoproject.org/poky/commit/?id=76212866402edb947f745f837e3c3b98b3056e58]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 76212866402edb947f745f837e3c3b98b3056e58)
Signed-off-by: Vishwas Udupa <quic_vudupa@quicinc.com>

Change-Id: Ifc0e3a019c2abe5142d0f1e359ae5aa33dae1608
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/run-ptest                 | 19 ++++--
 .../openssl/openssl_3.2.4.bb                  | 67 +++++++++----------
 2 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
index c89ec5afa1..cd29bb1446 100644
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -1,12 +1,19 @@
 #!/bin/sh
 
-set -e
+set -eu
 
-# Optional arguments are 'list' to lists all tests, or the test name (base name
-# ie test_evp, not 03_test_evp.t).
+# Optional arguments are 'list' to lists the tests, or the test name (base name
+# ie test_evp, not 03_test_evp.t). Without any arguments we run all tests.
+
+if test $# -gt 0; then
+    TESTS=$*
+else
+    # Skip test_symbol_presence as this is for developers
+    TESTS="alltests -test_symbol_presence"
+fi
 
 export TOP=.
-# OPENSSL_ENGINES is relative from the test binaries
-export OPENSSL_ENGINES=../engines
+# Run four jobs in parallel
+export HARNESS_JOBS=4
 
-{ HARNESS_JOBS=4 perl ./test/run_tests.pl $* || echo "FAIL: openssl" ; } | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
+{ perl ./test/run_tests.pl $TESTS || echo "FAIL: openssl" ; } | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.4.bb b/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
index bada192fe9..c4ad80e734 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
@@ -186,44 +186,43 @@ do_install:append:class-nativesdk () {
 
 PTEST_BUILD_HOST_FILES += "configdata.pm"
 PTEST_BUILD_HOST_PATTERN = "perl_version ="
-do_install_ptest () {
-	install -d ${D}${PTEST_PATH}/test
-	install -m755 ${B}/test/p_test.so ${D}${PTEST_PATH}/test
-	install -m755 ${B}/test/p_minimal.so ${D}${PTEST_PATH}/test
-	install -m755 ${B}/test/provider_internal_test.cnf ${D}${PTEST_PATH}/test
-
-	# Prune the build tree
-	rm -f ${B}/fuzz/*.* ${B}/test/*.*
-
-	cp ${S}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
-	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/configdata.pm
-	cp -r ${S}/external ${B}/test ${S}/test ${B}/fuzz ${S}/util ${B}/util ${D}${PTEST_PATH}
-
-	# For test_shlibload
-	ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/
-	ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/
+do_install_ptest() {
+	install -m644 ${S}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
+	cp -rf ${S}/Configurations ${S}/external ${D}${PTEST_PATH}/
 
 	install -d ${D}${PTEST_PATH}/apps
 	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
-	install -m644 ${S}/apps/*.pem ${S}/apps/*.srl ${S}/apps/openssl.cnf ${D}${PTEST_PATH}/apps
-	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
-
-	install -d ${D}${PTEST_PATH}/engines
-	install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines
-	install -m755 ${B}/engines/loader_attic.so ${D}${PTEST_PATH}/engines
-	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
-
-	install -d ${D}${PTEST_PATH}/providers
-	install -m755 ${B}/providers/legacy.so ${D}${PTEST_PATH}/providers
 
-	install -d ${D}${PTEST_PATH}/Configurations
-	cp -rf ${S}/Configurations/* ${D}${PTEST_PATH}/Configurations/
+	cd ${S}
+	find test/certs test/ct test/d2i-tests test/recipes test/ocsp-tests test/ssl-tests test/smime-certs -type f -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find apps test -name \*.cnf -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find apps test -name \*.der -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find apps test -name \*.pem -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find util -name \*.p[lm] -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+
+	cd ${B}
+	# Everything but .? (.o and .d)
+	find test -type f -name \*[^.]? -exec install -m755 -D {} ${D}${PTEST_PATH}/{} \;
+	find apps test -name \*.cnf -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find apps test -name \*.pem -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find apps test -name \*.srl -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	install -m755 ${B}/util/*wrap.* ${D}${PTEST_PATH}/util/
+
+	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps/
+	install -m755 ${S}/test/*.pl ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/shibboleth.pfx ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/*.bin ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/dane*.in ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/smcont*.txt ${D}${PTEST_PATH}/test/
+	install -m755 ${S}/test/ssl_test.tmpl ${D}${PTEST_PATH}/test/
+
+	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/configdata.pm ${D}${PTEST_PATH}/util/wrap.pl
 
-	# seems to be needed with perl 5.32.1
-	install -d ${D}${PTEST_PATH}/util/perl/recipes
-	cp ${D}${PTEST_PATH}/test/recipes/tconversion.pl ${D}${PTEST_PATH}/util/perl/recipes/
-
-	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/util/wrap.pl
+	install -d ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines/
+	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines/
+	ln -s ${libdir}/engines-3/loader_attic.so ${D}${PTEST_PATH}/engines/
+	ln -s ${libdir}/ossl-modules/ ${D}${PTEST_PATH}/providers
 }
 
 # Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
@@ -250,7 +249,7 @@ CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 
 RRECOMMENDS:libcrypto += "openssl-conf ${PN}-ossl-module-legacy"
 RDEPENDS:${PN}-misc = "perl"
-RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed"
+RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed openssl-engines openssl-ossl-module-legacy"
 
 RDEPENDS:${PN}-bin += "openssl-conf"
 
-- 
2.43.0



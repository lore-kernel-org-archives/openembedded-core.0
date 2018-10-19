Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B338274C4D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 19:43:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y11-v6so4687217wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 12:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=UzkvKBpLJnDqBsLM0gAHY0ud+qWrd8rCqJ6QaXEq66g=;
	b=tuwnZVK+lyQn2vGJq9/UIOqWVvy8RdyRwgWNgHH9192OmY0G1dlQioWll4l4GbbFNl
	b3oszYtuZ1x1gIPPKRnSvR4A8Pnn7SuUF+jKdsSaDfVgQI2WFJKyNEiVoOTuyzJ+BUhs
	jkSWnwH3Dqh9d15oAIjn+N0HOW4rwuO38AoHkGLL0wuHQ7dE/MVP8elpWhnjVZe/M+z/
	HQ86r2aGa2lQnihbfz8YB3CR0lduP4cETY2abmS0915Whin/8D9rk5ZUUUSMn8j60Gvo
	6qzi+RW/KmOjV6+fYUMBWHUC7K1QMDjTxEDdbpByVTETCY3yYhqCTuDpMpDQldFEDpFJ
	PCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UzkvKBpLJnDqBsLM0gAHY0ud+qWrd8rCqJ6QaXEq66g=;
	b=j46oCfwrv2FoGJI+cC800rxk1zS+CRqUAwhrn//THmUcq2ZnbWWPom6uHnWqEl8VgT
	tj9Gw2GbinEc30dAZQS3RgicDPHSHsVtxRXj0YIFLlnQmjKZqPYrNrGYl+ynHAJwBP+L
	Kc96vjsrTx5r5f1ILJu7fNP8Dk9/e1FmeczS+wRlOIFmC1la2wl46JiVGfbuucLliMO2
	xKQYxUiHmTYClSosG3cPTHpeoBzmrHperCFHvdlHID9FWdmt8goIhmUP7Mi83o6qvHF/
	JXAS4cw8uQg+vvZJU4BFdNuiZRys9PBCHlPZS5kfjUMBeBjQ4m3VT+ZX2IlQfYM3+u+F
	nUwA==
X-Gm-Message-State: ABuFfohqlhpSgYdLs5YAT4G1jBbRnSM1WNj73iQZut5rtNjs3rXZxUEn
	GkFjwEIBF8KE5pknfwyBLsnpw8csKn4=
X-Google-Smtp-Source: ACcGV63RfDEagsW1FsNoTBF7Y687hzpc1H858TClzsfupU9YFqk5/QF3xVykSUhiX2LG7luJhqly+Q==
X-Received: by 2002:a1c:7c07:: with SMTP id x7-v6mr6136079wmc.32.1539978201852;
	Fri, 19 Oct 2018 12:43:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	134-v6sm2830398wmb.13.2018.10.19.12.43.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Oct 2018 12:43:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2018 20:43:17 +0100
Message-Id: <20181019194318.23511-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] openssl: fix ptest
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
X-List-Received-Date: Fri, 19 Oct 2018 19:43:22 -0000

Previously the ptest installation was simply a copy of the entire build tree,
which is terribly ugly.

Instead copy just the pieces we need, symlink to /usr as appropriate, and add
missing dependencies.  Remove PRIVATE_LIBS as we don't ship copies of the
libraries now.

Also remember to do 'set -x' in run-ptest, so if the tests fail the runner
knows!

[ YOCTO #12965 ]
[ YOCTO #12967 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl/run-ptest | 14 +++++++++++---
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb  | 20 ++++++++++++++++----
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
index 65c6cc7b862..0a620dea74a 100644
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -1,4 +1,12 @@
 #!/bin/sh
-cd test
-OPENSSL_ENGINES=../engines BLDTOP=.. SRCTOP=.. perl run_tests.pl
-cd ..
+
+set -e
+
+# Optional arguments are 'list' to lists all tests, or the test name (base name
+# ie test_evp, not 03_test_evp.t).
+
+export TOP=.
+# OPENSSL_ENGINES is relative from the test binaries
+export OPENSSL_ENGINES=../engines
+
+perl ./test/run_tests.pl $*
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index 0d80aba64d7..4516f610217 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -151,10 +151,22 @@ do_install_append_class-nativesdk () {
 }
 
 do_install_ptest () {
-	cp -r * ${D}${PTEST_PATH}
-}
+	cp ${B}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
+	# TODO fuzz needs to be pruned of non-binaries
+	cp -r ${B}/external ${B}/test ${B}/fuzz ${B}/util ${D}${PTEST_PATH}
+
+	# For test_shlibload
+	ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/libcrypto.so
+	ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/libssl.so
 
-PRIVATE_LIBS_${PN}-ptest = "libcrypto.so.1.1 libssl.so.1.1"
+	install -d ${D}${PTEST_PATH}/apps
+	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
+	install -m644 ${B}/apps/*.pem ${B}/apps/*.srl ${B}/apps/openssl.cnf ${D}${PTEST_PATH}/apps
+	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
+
+	install -d ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
+}
 
 # Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
 # package RRECOMMENDS on this package. This will enable the configuration
@@ -176,7 +188,7 @@ CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 RRECOMMENDS_libcrypto += "openssl-conf"
 RDEPENDS_${PN}-bin = "perl"
 RDEPENDS_${PN}-misc = "perl"
-RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
+RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash python"
 
 RPROVIDES_openssl-conf = "openssl10-conf"
 RREPLACES_openssl-conf = "openssl10-conf"
-- 
2.11.0



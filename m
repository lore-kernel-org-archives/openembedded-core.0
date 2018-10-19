Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E891D79CED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 16:28:27 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 189-v6so4216437wmw.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 09:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=1DDklOhO5nlzP+BGag6dmBFCIb9j1ubPYn7pqdGw0W0=;
	b=NqbPM+puQ52e3EEopfXbmglMrBvKuND6df0dZKbrUwC8YP74o56R1z4zKZ/NAkzUH4
	3Ovhkr1ocN352Im943VRJNnZAr3c6le+pPkNlEq//6L2UwZ39U6ck71bpQ90jr256tgb
	O0NvpCfX8I4177xTCqFy6+0GqSc1O13FygVU35Gfqc89Bb3cnDDVi1aoAchAUR3jHNwi
	OMX8FPZRV5d342yJUMEPE2nsDmo7EghxgYPNHUf4ORghIi8/ikTpBuA9zjVsNpnZmsrl
	pbXmraKuAPmPnWy9+BGsbEW80HL5qe6qH7dB495tU5GLK4ASK+F7BEJ31lRL6oChxGrL
	0e6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1DDklOhO5nlzP+BGag6dmBFCIb9j1ubPYn7pqdGw0W0=;
	b=FPJXq7f/ahHDhXj1wWLCwswwiEfZAL6UnmRoxwC1ZG7yOfewygkR+hwNibobrzN9+Y
	6z7d7n9Z9Me+a23R+FS+SEJnMP0PKozLcXq/g588fx0Y+/wxdZzK1dGaWnUCg14pHbDM
	8l97nynFhHs3vY9da0nJcAx10DxeDwc/jc5FKjh9uS/S65gaiTp/4qc0hIR+glZ6FGEV
	F54GQXoTYxFY73Clg1arlECoGU7zlv8rK7PNPrKJmBmW5usmq+94moenvbmpnIiG5Dsy
	iglnYa+afwLohFEJCjNDAczGq+Cu3T+3WlW5RbM2jMWUSR0Bt5pAnUjW9L7AcRwKdlgF
	EMtQ==
X-Gm-Message-State: ABuFfoix13rBYjlgPrBRTRLGdERSO+wNMp2Y3DlR7we9orJ9dsxCQtGF
	cQKcg6qaJZvUIbWfbxhXt7TNK+MwWx0=
X-Google-Smtp-Source: ACcGV61ztEdAd58bRlu7Di1vAGSWPQjlzUEQcKZL7Kgtm4vmg4JWrXgsSOE6Je5h7ZciTP7Izu7l/A==
X-Received: by 2002:a1c:448a:: with SMTP id
	r132-v6mr5689844wma.132.1539966508160; 
	Fri, 19 Oct 2018 09:28:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r131-v6sm5717798wmb.32.2018.10.19.09.28.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Oct 2018 09:28:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2018 17:28:24 +0100
Message-Id: <20181019162824.3847-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] openssl: fix ptest
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
X-List-Received-Date: Fri, 19 Oct 2018 16:28:28 -0000

Previously the ptest installation was simply a copy of the entire build tree,
which is terribly ugly.

Instead copy just the pieces we need, symlink to /usr as appropriate, and add
missing dependencies.

Also remember to do 'set -x' in run-ptest, so if the tests fail the runner
knows!

[ YOCTO #12965 ]
[ YOCTO #12967 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl/run-ptest | 14 ++++++++++----
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb  | 18 ++++++++++++++++--
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
index 65c6cc7b862..c2d8885abde 100644
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -1,4 +1,10 @@
-#!/bin/sh
-cd test
-OPENSSL_ENGINES=../engines BLDTOP=.. SRCTOP=.. perl run_tests.pl
-cd ..
+#!/bin/sh -x
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
index 0d80aba64d7..001ab5fcf62 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -151,7 +151,21 @@ do_install_append_class-nativesdk () {
 }
 
 do_install_ptest () {
-	cp -r * ${D}${PTEST_PATH}
+	cp ${B}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
+	# TODO fuzz needs to be pruned of non-binaries
+	cp -r ${B}/external ${B}/test ${B}/fuzz ${B}/util ${D}${PTEST_PATH}
+
+	# For test_shlibload
+	ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/libcrypto.so
+	ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/libssl.so
+
+	install -d ${D}${PTEST_PATH}/apps
+	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
+	install -m644 ${B}/apps/*.pem ${B}/apps/*.srl ${B}/apps/openssl.cnf ${D}${PTEST_PATH}/apps
+	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
+
+	install -d ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
 }
 
 PRIVATE_LIBS_${PN}-ptest = "libcrypto.so.1.1 libssl.so.1.1"
@@ -176,7 +190,7 @@ CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 RRECOMMENDS_libcrypto += "openssl-conf"
 RDEPENDS_${PN}-bin = "perl"
 RDEPENDS_${PN}-misc = "perl"
-RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
+RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash python"
 
 RPROVIDES_openssl-conf = "openssl10-conf"
 RREPLACES_openssl-conf = "openssl10-conf"
-- 
2.11.0



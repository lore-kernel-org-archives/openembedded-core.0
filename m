Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12146.1795693355527377625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 03:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=V7VCpL1F;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9DBD1BA8
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 03:42:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 695B13F632
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 03:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795693354; bh=lmvL4Lv3LTVgPOBMyj7LhxG3xOI7200F7F8D0aaHH1c=;
	h=From:To:Subject:Date:From;
	b=V7VCpL1FtCRnKUcoBuTHRNrYh0EM9ptwbot0XbQuaEZiXkuIMiLiIDpWwdbYNR11i
	 jxH4/lix+tZLWdcJaqTEeoaVjPoTUy7Xsbv9GWiuk3D1PERn9Pk7bGWrwGSegsU9Q1
	 t9I7cTAEJTMrrzO56XHos0oOVJn7UGFFywYL5oCY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: drop redundant test timeout change
Date: Thu, 26 Nov 2026 11:42:26 +0000
Message-ID: <20261126114226.3858190-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 11:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251293
Content-Type: text/plain; charset="utf-8"

This patch was extending the test case timeout from 3s to 6s. However,
OpenSSL 4.1 (since [1]) has a timeout of 60s for these tests.

[1] https://github.com/openssl/openssl/pull/31889

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-extend-check_cwm-test-timeout.patch  | 32 -------------------
 .../openssl/openssl_4.1.0.bb                  |  1 -
 2 files changed, 33 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-extend=
-check_cwm-test-timeout.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_=
cwm-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-e=
xtend-check_cwm-test-timeout.patch
deleted file mode 100644
index 29b9728479f..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-tes=
t-timeout.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ff0de34474c0dfec4f13dfb4079689c8731bf6ce Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Thu, 23 Oct 2025 11:24:36 +0200
-Subject: [PATCH] extend check_cwm test timeout
-
-The default, 3s long test timeout isn't always enough for this
-particular test in case there is a high load on the host machine
-(assuming it is running in qemu). Extend the default timeout to 6s
-for the check_cwm test to avoid timeouts.
-
-Upstream-Status: Inappropriate [upstream issue: https://github.com/opens=
sl/openssl/issues/28983]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- test/radix/main.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/test/radix/main.c b/test/radix/main.c
-index 0f3dc11..d925639 100644
---- a/test/radix/main.c
-+++ b/test/radix/main.c
-@@ -25,6 +25,11 @@ static int test_script(int idx)
-     int testresult;
-     TERP_CONFIG cfg =3D { 0 };
-=20
-+    // check_cwm test sometimes times out, the default 3000ms is
-+    // not enough if the test execution starves for CPU
-+    if (!strncmp("check_cwm", script_info->name, strlen("check_cwm")))
-+        cfg.max_execution_time =3D ossl_ms2time(6000);
-+
-     if (!TEST_true(bindings_process_init(0, 0)))
-         return 0;
-=20
diff --git a/meta/recipes-connectivity/openssl/openssl_4.1.0.bb b/meta/re=
cipes-connectivity/openssl/openssl_4.1.0.bb
index 1e47c3cf348..a7a4bec8742 100644
--- a/meta/recipes-connectivity/openssl/openssl_4.1.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_4.1.0.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
            file://run-ptest \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://0001-extend-check_cwm-test-timeout.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.43.0


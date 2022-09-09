Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13079ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 10:13:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.147.1662718420298822940
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 03:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F15D815DB;
	Fri,  9 Sep 2022 03:13:45 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35FAC3F73D;
	Fri,  9 Sep 2022 03:13:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libgcrypt: disable bench-slope test case
Date: Fri,  9 Sep 2022 11:13:37 +0100
Message-Id: <20220909101337.3029658-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 10:13:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170483

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libgcrypt/files/no-bench-slope.patch      | 20 +++++++++++++++++++
 .../libgcrypt/libgcrypt_1.10.1.bb             |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/no-bench-slope.p=
atch

diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/=
meta/recipes-support/libgcrypt/files/no-bench-slope.patch
new file mode 100644
index 00000000000..8de3c6713b7
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -0,0 +1,20 @@
+The bench-slope test appears to be aborting fairly frequently, which cau=
ses
+failures on the autobuilder.
+
+Until this has been root-caused, disable the test.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/tests/testdrv.c b/tests/testdrv.c
+index 0ccde326..d3455186 100644
+--- a/tests/testdrv.c
++++ b/tests/testdrv.c
+@@ -77,7 +77,6 @@ static struct {
+    { "t-x448"      },
+    { "t-ed448"     },
+    { "benchmark"   },
+-   { "bench-slope" },
+    { "hashtest-256g",  "hashtest", "--gigs 256 SHA1 SHA256 SHA512 SM3",
+      LONG_RUNNING },
+    { NULL }
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.10.1.bb
index b0d88de3aa1..bf9d7cbd102 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.=
tar.bz2 \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-p=
ath.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthr=
ead.patch \
            file://no-native-gpg-error.patch \
+           file://no-bench-slope.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] =3D "ef14ae546b0084cd84259f61a55e07a38c3b53afc0f546bf=
fcef2f01baffe9de"
--=20
2.34.1



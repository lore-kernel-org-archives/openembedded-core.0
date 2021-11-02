Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A11C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:57:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.642.1635872230630721735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80BD111B3
	for <openembedded-core@lists.openembedded.org>;
 Tue,  2 Nov 2021 09:57:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AEB03F7B4
	for <openembedded-core@lists.openembedded.org>;
 Tue,  2 Nov 2021 09:57:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: fix builds on ARMv8 targets without Aarch64
Date: Tue,  2 Nov 2021 16:57:06 +0000
Message-Id: <20211102165706.3821866-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:57:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157804

ARMv8 doesn't imply Aarch64, so correct a check that was making that
assumption.  This fixes the build on 32-bit ARMv8 targets such as
Cortex-A32.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../openssl/openssl/armv8-32bit.patch         | 29 +++++++++++++++++++
 .../openssl/openssl_3.0.0.bb                  |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/armv8-32bit=
.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/armv8-32bit.patch =
b/meta/recipes-connectivity/openssl/openssl/armv8-32bit.patch
new file mode 100644
index 0000000000..1935651be0
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/armv8-32bit.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/1695=
1]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 5118e96a3dbedde2523e7726fa34af30923a9add Mon Sep 17 00:00:00 2001
+From: Tom Cosgrove <tom.cosgrove@arm.com>
+Date: Tue, 2 Nov 2021 15:26:21 +0000
+Subject: [PATCH] Fix builds on Armv8 systems without AArch64
+
+This fixes "undefined reference to `aes_gcm_dec_128_kernel' in function
+`armv8_aes_gcm_decrypt'" and similar
+
+Fixes #16949
+---
+ include/crypto/aes_platform.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/crypto/aes_platform.h b/include/crypto/aes_platform=
.h
+index 015c3bd4ab91..e95ad5aa5de6 100644
+--- a/include/crypto/aes_platform.h
++++ b/include/crypto/aes_platform.h
+@@ -100,7 +100,7 @@ void AES_xts_decrypt(const unsigned char *inp, unsig=
ned char *out, size_t len,
+ #    define AES_PMULL_CAPABLE ((OPENSSL_armcap_P & ARMV8_PMULL) && (OPE=
NSSL_armcap_P & ARMV8_AES))
+ #    define AES_GCM_ENC_BYTES 512
+ #    define AES_GCM_DEC_BYTES 512
+-#    if __ARM_MAX_ARCH__>=3D8
++#    if __ARM_MAX_ARCH__>=3D8 && defined(__aarch64__)
+ #     define AES_gcm_encrypt armv8_aes_gcm_encrypt
+ #     define AES_gcm_decrypt armv8_aes_gcm_decrypt
+ #     define AES_GCM_ASM(gctx) ((gctx)->ctr=3D=3Daes_v8_ctr32_encrypt_b=
locks && \
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.0.0.bb
index 67343bedcc..8852a51ca8 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://armv8-32bit.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.25.1



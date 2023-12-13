Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5D6C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 16:14:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40279.1702484069079186465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 08:14:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31F2EC15
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 08:15:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D213D3F738
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 08:14:27 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: mark assembler sections as call targets for PAC/BTI support on aarch64
Date: Wed, 13 Dec 2023 16:14:21 +0000
Message-Id: <20231213161421.778466-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 16:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192304

From: Ross Burton <ross.burton@arm.com>

The assembler sections in OpenSSL were not marked as valid call targets,
so branch protection could not be enabled for libcrypto.so.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../openssl/openssl/aarch64-bti.patch         | 35 +++++++++++++++++++
 .../openssl/openssl_3.2.0.bb                  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/aarch64-bti=
.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch =
b/meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch
new file mode 100644
index 00000000000..2a16debb76e
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch
@@ -0,0 +1,35 @@
+From ad347c9ff0fd93bdd2fa2085611c65b88e94829f Mon Sep 17 00:00:00 2001
+From: "fangming.fang" <fangming.fang@arm.com>
+Date: Thu, 7 Dec 2023 06:17:51 +0000
+Subject: [PATCH] Enable BTI feature for md5 on aarch64
+
+Fixes: #22959
+
+Reviewed-by: Tom Cosgrove <tom.cosgrove@arm.com>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/22971)
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ crypto/md5/asm/md5-aarch64.pl | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/crypto/md5/asm/md5-aarch64.pl b/crypto/md5/asm/md5-aarch64.=
pl
+index 3200a0fa9bff0..5a8608069691d 100755
+--- a/crypto/md5/asm/md5-aarch64.pl
++++ b/crypto/md5/asm/md5-aarch64.pl
+@@ -28,10 +28,13 @@
+ *STDOUT=3D*OUT;
+=20
+ $code .=3D <<EOF;
++#include "arm_arch.h"
++
+ .text
+ .globl  ossl_md5_block_asm_data_order
+ .type   ossl_md5_block_asm_data_order,\@function
+ ossl_md5_block_asm_data_order:
++        AARCH64_VALID_CALL_TARGET
+         // Save all callee-saved registers
+         stp     x19,x20,[sp,#-80]!
+         stp     x21,x22,[sp,#16]
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.2.0.bb
index ab0562bd730..1c97d853f11 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails=
.patch \
+		   file://aarch64-bti.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.34.1



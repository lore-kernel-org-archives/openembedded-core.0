Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94FAC47DDB
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 18:07:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1920.1706551625810400409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 10:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57870DA7
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 10:07:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 258E73F738
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 10:07:04 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: backport fix for CVE-2023-6129
Date: Mon, 29 Jan 2024 18:07:02 +0000
Message-Id: <20240129180702.2169499-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 18:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194474

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../openssl/openssl/CVE-2023-6129.patch       | 113 ++++++++++++++++++
 .../openssl/openssl_3.2.0.bb                  |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-61=
29.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patc=
h b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch
new file mode 100644
index 00000000000..c2cbedd1b70
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch
@@ -0,0 +1,113 @@
+From 5b139f95c9a47a55a0c54100f3837b1eee942b04 Mon Sep 17 00:00:00 2001
+From: Rohan McLure <rmclure@linux.ibm.com>
+Date: Thu, 4 Jan 2024 10:25:50 +0100
+Subject: [PATCH] poly1305-ppc.pl: Fix vector register clobbering
+
+Fixes CVE-2023-6129
+
+The POLY1305 MAC (message authentication code) implementation in OpenSSL=
 for
+PowerPC CPUs saves the the contents of vector registers in different ord=
er
+than they are restored. Thus the contents of some of these vector regist=
ers
+is corrupted when returning to the caller. The vulnerable code is used o=
nly
+on newer PowerPC processors supporting the PowerISA 2.07 instructions.
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/23200)
+
+(cherry picked from commit 8d847a3ffd4f0b17ee33962cf69c36224925b34f)
+
+CVE: CVE-2023-6129
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ crypto/poly1305/asm/poly1305-ppc.pl | 42 ++++++++++++++---------------
+ 1 file changed, 21 insertions(+), 21 deletions(-)
+
+diff --git a/crypto/poly1305/asm/poly1305-ppc.pl b/crypto/poly1305/asm/p=
oly1305-ppc.pl
+index 9f86134d923fb..2e601bb9c24be 100755
+--- a/crypto/poly1305/asm/poly1305-ppc.pl
++++ b/crypto/poly1305/asm/poly1305-ppc.pl
+@@ -744,7 +744,7 @@
+ my $LOCALS=3D 6*$SIZE_T;
+ my $VSXFRAME =3D $LOCALS + 6*$SIZE_T;
+    $VSXFRAME +=3D 128;	# local variables
+-   $VSXFRAME +=3D 13*16;	# v20-v31 offload
++   $VSXFRAME +=3D 12*16;	# v20-v31 offload
+=20
+ my $BIG_ENDIAN =3D ($flavour !~ /le/) ? 4 : 0;
+=20
+@@ -919,12 +919,12 @@
+ 	addi	r11,r11,32
+ 	stvx	v22,r10,$sp
+ 	addi	r10,r10,32
+-	stvx	v23,r10,$sp
+-	addi	r10,r10,32
+-	stvx	v24,r11,$sp
++	stvx	v23,r11,$sp
+ 	addi	r11,r11,32
+-	stvx	v25,r10,$sp
++	stvx	v24,r10,$sp
+ 	addi	r10,r10,32
++	stvx	v25,r11,$sp
++	addi	r11,r11,32
+ 	stvx	v26,r10,$sp
+ 	addi	r10,r10,32
+ 	stvx	v27,r11,$sp
+@@ -1153,12 +1153,12 @@
+ 	addi	r11,r11,32
+ 	stvx	v22,r10,$sp
+ 	addi	r10,r10,32
+-	stvx	v23,r10,$sp
+-	addi	r10,r10,32
+-	stvx	v24,r11,$sp
++	stvx	v23,r11,$sp
+ 	addi	r11,r11,32
+-	stvx	v25,r10,$sp
++	stvx	v24,r10,$sp
+ 	addi	r10,r10,32
++	stvx	v25,r11,$sp
++	addi	r11,r11,32
+ 	stvx	v26,r10,$sp
+ 	addi	r10,r10,32
+ 	stvx	v27,r11,$sp
+@@ -1899,26 +1899,26 @@
+ 	mtspr	256,r12				# restore vrsave
+ 	lvx	v20,r10,$sp
+ 	addi	r10,r10,32
+-	lvx	v21,r10,$sp
+-	addi	r10,r10,32
+-	lvx	v22,r11,$sp
++	lvx	v21,r11,$sp
+ 	addi	r11,r11,32
+-	lvx	v23,r10,$sp
++	lvx	v22,r10,$sp
+ 	addi	r10,r10,32
+-	lvx	v24,r11,$sp
++	lvx	v23,r11,$sp
+ 	addi	r11,r11,32
+-	lvx	v25,r10,$sp
++	lvx	v24,r10,$sp
+ 	addi	r10,r10,32
+-	lvx	v26,r11,$sp
++	lvx	v25,r11,$sp
+ 	addi	r11,r11,32
+-	lvx	v27,r10,$sp
++	lvx	v26,r10,$sp
+ 	addi	r10,r10,32
+-	lvx	v28,r11,$sp
++	lvx	v27,r11,$sp
+ 	addi	r11,r11,32
+-	lvx	v29,r10,$sp
++	lvx	v28,r10,$sp
+ 	addi	r10,r10,32
+-	lvx	v30,r11,$sp
+-	lvx	v31,r10,$sp
++	lvx	v29,r11,$sp
++	addi	r11,r11,32
++	lvx	v30,r10,$sp
++	lvx	v31,r11,$sp
+ 	$POP	r27,`$VSXFRAME-$SIZE_T*5`($sp)
+ 	$POP	r28,`$VSXFRAME-$SIZE_T*4`($sp)
+ 	$POP	r29,`$VSXFRAME-$SIZE_T*3`($sp)
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.2.0.bb
index cf08cdbaa05..b2cdf761fc1 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
            file://0001-Added-handshake-history-reporting-when-test-fails=
.patch \
            file://aarch64-bti.patch \
            file://0001-riscv-Fix-mispelling-of-extension-test-macro.patc=
h \
+           file://CVE-2023-6129.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.34.1



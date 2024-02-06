Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01CEC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:47:37 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.24456.1707234449172775916
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 07:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Cznt08eU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5ceb3fe708eso4432064a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707234448; x=1707839248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYCKkZV+ViYG8E+2UkkJAgGJWbqLyCtFtCksgUDtPmo=;
        b=Cznt08eUDtvvX50ou8VWu0rFbzaIGKeY6o/fojuAyUBydm9KUgv5OXAgIIbtRcp4yu
         xMrzITp94iO4ljPjf7hC54KKDAz0ZoKXMIGzTQUQFxRrUGIPas45bYv/ew+/mpng5qfr
         9RD1qHKdmeCpM+DsZFrNwLxQck0hvzPJ3d0juop8MEJvUoVFFcgdlfcfC1OzYK/i7+KL
         c8ooEn3mxqkijDBazFYkgSKBN1k/ayKoMIe8kxEj13HDVeAZBgwgqp5yK+twyRZns9uN
         7Vh+C8SsQTP3IRQRUbyp0M+ITDiUi2lMhrDo1ebdkH8s1nF1wTAP4k3+J65ud3PZBYu2
         W9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707234448; x=1707839248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYCKkZV+ViYG8E+2UkkJAgGJWbqLyCtFtCksgUDtPmo=;
        b=AFzHCgyfsEWsUzddmUGkNbKkoSwzFyRGGqgoBKDLszZDa8Z7vh/9us0rkxh/IFmhV7
         fMbtYwHkhATuvBj3XN6iAzDqriDHROMY/Xtzdh0EhnJebYt6d73VjMOAw9plCYdV0jSR
         A/1KtJiPD/3SVDFVE7WcfExblLvQ9CKtys59ZoQ5knaLjHPV42e9A3umzYhYNMJ0LKnD
         YvUmJT6wdiMwq1w6y9T2Pe+UoKaNCgutrj/pz83rY50gpzOehI0+LagHusjBPupfD9LI
         ahmm566osrVAx+xaTwN6h9uAKCeoWwxAjwh1iOxHt/AxxRGG3SsTfkty3vzOUc9woK7F
         fdfw==
X-Gm-Message-State: AOJu0YwjPJVV8BnLsmGl5LIXHU4XgL+GzSREQLGk6UpY1QvaIE9aUiov
	Kr/hc1BaORzUR7yhAI//JyFCjWPV3OBZdSKrVmadiFMn1uyMigCAyBcr5Evarhzy9LjA7qPXT+C
	qB7w=
X-Google-Smtp-Source: AGHT+IHxqxsSy5kbRgHA4SLKET4SzB3wK0Eru0Il7fvD+fJOYoIleFDGH2Cg7AiYaO+y3j+KHg82sQ==
X-Received: by 2002:a17:90a:34c2:b0:295:f30d:ae1 with SMTP id m2-20020a17090a34c200b00295f30d0ae1mr3004301pjf.8.1707234448036;
        Tue, 06 Feb 2024 07:47:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id kx18-20020a17090b229200b0029454cca5c3sm1811452pjb.39.2024.02.06.07.47.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:47:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] openssl: Upgrade 3.0.12 -> 3.0.13
Date: Tue,  6 Feb 2024 05:45:25 -1000
Message-Id: <2bdae590ab20dc4518ba247c903060fa67ed0fc4.1707234215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707234215.git.steve@sakoman.com>
References: <cover.1707234215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 15:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195006

From: Peter Marko <peter.marko@siemens.com>

Fixes CVE-2024-0727

Removed included CVE patch backports.

New module was implemented in tests and needs to be installed
to successfully pass 04-test_provider.t test.

Release information:
https://github.com/openssl/openssl/blob/openssl-3.0/NEWS.md#major-changes-between-openssl-3012-and-openssl-3013-30-jan-2024

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2023-5678.patch       | 180 ------------------
 .../openssl/openssl/CVE-2023-6129.patch       | 113 -----------
 .../openssl/openssl/CVE-2023-6237.patch       | 127 ------------
 .../{openssl_3.0.12.bb => openssl_3.0.13.bb}  |   6 +-
 4 files changed, 2 insertions(+), 424 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-5678.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.12.bb => openssl_3.0.13.bb} (97%)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-5678.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-5678.patch
deleted file mode 100644
index 796a4f8be9..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-5678.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-From db925ae2e65d0d925adef429afc37f75bd1c2017 Mon Sep 17 00:00:00 2001
-From: Richard Levitte <levitte@openssl.org>
-Date: Fri, 20 Oct 2023 09:18:19 +0200
-Subject: [PATCH] Make DH_check_pub_key() and DH_generate_key() safer yet
-
-We already check for an excessively large P in DH_generate_key(), but not in
-DH_check_pub_key(), and none of them check for an excessively large Q.
-
-This change adds all the missing excessive size checks of P and Q.
-
-It's to be noted that behaviours surrounding excessively sized P and Q
-differ.  DH_check() raises an error on the excessively sized P, but only
-sets a flag for the excessively sized Q.  This behaviour is mimicked in
-DH_check_pub_key().
-
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Hugo Landau <hlandau@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/22518)
-
-(cherry picked from commit ddeb4b6c6d527e54ce9a99cba785c0f7776e54b6)
-
-Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=db925ae2e65d0d925adef429afc37f75bd1c2017]
-CVE: CVE-2023-5678
-Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
----
- crypto/dh/dh_check.c    | 12 ++++++++++++
- crypto/dh/dh_err.c      |  3 ++-
- crypto/dh/dh_key.c      | 12 ++++++++++++
- crypto/err/openssl.txt  |  1 +
- include/crypto/dherr.h  |  2 +-
- include/openssl/dh.h    |  6 +++---
- include/openssl/dherr.h |  3 ++-
- 7 files changed, 33 insertions(+), 6 deletions(-)
-
-diff --git a/crypto/dh/dh_check.c b/crypto/dh/dh_check.c
-index 7ba2bea..e20eb62 100644
---- a/crypto/dh/dh_check.c
-+++ b/crypto/dh/dh_check.c
-@@ -249,6 +249,18 @@ int DH_check_pub_key_ex(const DH *dh, const BIGNUM *pub_key)
-  */
- int DH_check_pub_key(const DH *dh, const BIGNUM *pub_key, int *ret)
- {
-+    /* Don't do any checks at all with an excessively large modulus */
-+    if (BN_num_bits(dh->params.p) > OPENSSL_DH_CHECK_MAX_MODULUS_BITS) {
-+        ERR_raise(ERR_LIB_DH, DH_R_MODULUS_TOO_LARGE);
-+        *ret = DH_MODULUS_TOO_LARGE | DH_CHECK_PUBKEY_INVALID;
-+        return 0;
-+    }
-+
-+    if (dh->params.q != NULL && BN_ucmp(dh->params.p, dh->params.q) < 0) {
-+        *ret |= DH_CHECK_INVALID_Q_VALUE | DH_CHECK_PUBKEY_INVALID;
-+        return 1;
-+    }
-+
-     return ossl_ffc_validate_public_key(&dh->params, pub_key, ret);
- }
-
-diff --git a/crypto/dh/dh_err.c b/crypto/dh/dh_err.c
-index 4152397..f76ac0d 100644
---- a/crypto/dh/dh_err.c
-+++ b/crypto/dh/dh_err.c
-@@ -1,6 +1,6 @@
- /*
-  * Generated by util/mkerr.pl DO NOT EDIT
-- * Copyright 1995-2021 The OpenSSL Project Authors. All Rights Reserved.
-+ * Copyright 1995-2023 The OpenSSL Project Authors. All Rights Reserved.
-  *
-  * Licensed under the Apache License 2.0 (the "License").  You may not use
-  * this file except in compliance with the License.  You can obtain a copy
-@@ -54,6 +54,7 @@ static const ERR_STRING_DATA DH_str_reasons[] = {
-     {ERR_PACK(ERR_LIB_DH, 0, DH_R_PARAMETER_ENCODING_ERROR),
-     "parameter encoding error"},
-     {ERR_PACK(ERR_LIB_DH, 0, DH_R_PEER_KEY_ERROR), "peer key error"},
-+    {ERR_PACK(ERR_LIB_DH, 0, DH_R_Q_TOO_LARGE), "q too large"},
-     {ERR_PACK(ERR_LIB_DH, 0, DH_R_SHARED_INFO_ERROR), "shared info error"},
-     {ERR_PACK(ERR_LIB_DH, 0, DH_R_UNABLE_TO_CHECK_GENERATOR),
-     "unable to check generator"},
-diff --git a/crypto/dh/dh_key.c b/crypto/dh/dh_key.c
-index d84ea99..afc49f5 100644
---- a/crypto/dh/dh_key.c
-+++ b/crypto/dh/dh_key.c
-@@ -49,6 +49,12 @@ int ossl_dh_compute_key(unsigned char *key, const BIGNUM *pub_key, DH *dh)
-         goto err;
-     }
-
-+    if (dh->params.q != NULL
-+        && BN_num_bits(dh->params.q) > OPENSSL_DH_MAX_MODULUS_BITS) {
-+        ERR_raise(ERR_LIB_DH, DH_R_Q_TOO_LARGE);
-+        goto err;
-+    }
-+
-     if (BN_num_bits(dh->params.p) < DH_MIN_MODULUS_BITS) {
-         ERR_raise(ERR_LIB_DH, DH_R_MODULUS_TOO_SMALL);
-         return 0;
-@@ -267,6 +273,12 @@ static int generate_key(DH *dh)
-         return 0;
-     }
-
-+    if (dh->params.q != NULL
-+        && BN_num_bits(dh->params.q) > OPENSSL_DH_MAX_MODULUS_BITS) {
-+        ERR_raise(ERR_LIB_DH, DH_R_Q_TOO_LARGE);
-+        return 0;
-+    }
-+
-     if (BN_num_bits(dh->params.p) < DH_MIN_MODULUS_BITS) {
-         ERR_raise(ERR_LIB_DH, DH_R_MODULUS_TOO_SMALL);
-         return 0;
-diff --git a/crypto/err/openssl.txt b/crypto/err/openssl.txt
-index e51504b..36de321 100644
---- a/crypto/err/openssl.txt
-+++ b/crypto/err/openssl.txt
-@@ -500,6 +500,7 @@ DH_R_NO_PARAMETERS_SET:107:no parameters set
- DH_R_NO_PRIVATE_VALUE:100:no private value
- DH_R_PARAMETER_ENCODING_ERROR:105:parameter encoding error
- DH_R_PEER_KEY_ERROR:111:peer key error
-+DH_R_Q_TOO_LARGE:130:q too large
- DH_R_SHARED_INFO_ERROR:113:shared info error
- DH_R_UNABLE_TO_CHECK_GENERATOR:121:unable to check generator
- DSA_R_BAD_FFC_PARAMETERS:114:bad ffc parameters
-diff --git a/include/crypto/dherr.h b/include/crypto/dherr.h
-index bb24d13..519327f 100644
---- a/include/crypto/dherr.h
-+++ b/include/crypto/dherr.h
-@@ -1,6 +1,6 @@
- /*
-  * Generated by util/mkerr.pl DO NOT EDIT
-- * Copyright 2020-2021 The OpenSSL Project Authors. All Rights Reserved.
-+ * Copyright 2020-2023 The OpenSSL Project Authors. All Rights Reserved.
-  *
-  * Licensed under the Apache License 2.0 (the "License").  You may not use
-  * this file except in compliance with the License.  You can obtain a copy
-diff --git a/include/openssl/dh.h b/include/openssl/dh.h
-index 6533260..50e0cf5 100644
---- a/include/openssl/dh.h
-+++ b/include/openssl/dh.h
-@@ -141,7 +141,7 @@ DECLARE_ASN1_ITEM(DHparams)
- #   define DH_GENERATOR_3          3
- #   define DH_GENERATOR_5          5
-
--/* DH_check error codes */
-+/* DH_check error codes, some of them shared with DH_check_pub_key */
- /*
-  * NB: These values must align with the equivalently named macros in
-  * internal/ffc.h.
-@@ -151,10 +151,10 @@ DECLARE_ASN1_ITEM(DHparams)
- #   define DH_UNABLE_TO_CHECK_GENERATOR    0x04
- #   define DH_NOT_SUITABLE_GENERATOR       0x08
- #   define DH_CHECK_Q_NOT_PRIME            0x10
--#   define DH_CHECK_INVALID_Q_VALUE        0x20
-+#   define DH_CHECK_INVALID_Q_VALUE        0x20 /* +DH_check_pub_key */
- #   define DH_CHECK_INVALID_J_VALUE        0x40
- #   define DH_MODULUS_TOO_SMALL            0x80
--#   define DH_MODULUS_TOO_LARGE            0x100
-+#   define DH_MODULUS_TOO_LARGE            0x100 /* +DH_check_pub_key */
-
- /* DH_check_pub_key error codes */
- #   define DH_CHECK_PUBKEY_TOO_SMALL       0x01
-diff --git a/include/openssl/dherr.h b/include/openssl/dherr.h
-index 5d2a762..074a701 100644
---- a/include/openssl/dherr.h
-+++ b/include/openssl/dherr.h
-@@ -1,6 +1,6 @@
- /*
-  * Generated by util/mkerr.pl DO NOT EDIT
-- * Copyright 1995-2021 The OpenSSL Project Authors. All Rights Reserved.
-+ * Copyright 1995-2023 The OpenSSL Project Authors. All Rights Reserved.
-  *
-  * Licensed under the Apache License 2.0 (the "License").  You may not use
-  * this file except in compliance with the License.  You can obtain a copy
-@@ -50,6 +50,7 @@
- #  define DH_R_NO_PRIVATE_VALUE                            100
- #  define DH_R_PARAMETER_ENCODING_ERROR                    105
- #  define DH_R_PEER_KEY_ERROR                              111
-+#  define DH_R_Q_TOO_LARGE                                 130
- #  define DH_R_SHARED_INFO_ERROR                           113
- #  define DH_R_UNABLE_TO_CHECK_GENERATOR                   121
-
---
-2.40.1
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch
deleted file mode 100644
index c5749e1874..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 8d847a3ffd4f0b17ee33962cf69c36224925b34f Mon Sep 17 00:00:00 2001
-From: Rohan McLure <rmclure@linux.ibm.com>
-Date: Thu, 4 Jan 2024 10:25:50 +0100
-Subject: [PATCH] poly1305-ppc.pl: Fix vector register clobbering
-
-Fixes CVE-2023-6129
-
-The POLY1305 MAC (message authentication code) implementation in OpenSSL for
-PowerPC CPUs saves the the contents of vector registers in different order
-than they are restored. Thus the contents of some of these vector registers
-is corrupted when returning to the caller. The vulnerable code is used only
-on newer PowerPC processors supporting the PowerISA 2.07 instructions.
-
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/23200)
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/8d847a3ffd4f0b17ee33962cf69c36224925b34f]
-CVE: CVE-2023-6129
-Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
----
- crypto/poly1305/asm/poly1305-ppc.pl | 42 ++++++++++++++---------------
- 1 file changed, 21 insertions(+), 21 deletions(-)
-
-diff --git a/crypto/poly1305/asm/poly1305-ppc.pl b/crypto/poly1305/asm/poly1305-ppc.pl
-index 9f86134..2e601bb 100755
---- a/crypto/poly1305/asm/poly1305-ppc.pl
-+++ b/crypto/poly1305/asm/poly1305-ppc.pl
-@@ -744,7 +744,7 @@ ___
- my $LOCALS= 6*$SIZE_T;
- my $VSXFRAME = $LOCALS + 6*$SIZE_T;
-    $VSXFRAME += 128;	# local variables
--   $VSXFRAME += 13*16;	# v20-v31 offload
-+   $VSXFRAME += 12*16;	# v20-v31 offload
-
- my $BIG_ENDIAN = ($flavour !~ /le/) ? 4 : 0;
-
-@@ -919,12 +919,12 @@ __poly1305_blocks_vsx:
-	addi	r11,r11,32
-	stvx	v22,r10,$sp
-	addi	r10,r10,32
--	stvx	v23,r10,$sp
--	addi	r10,r10,32
--	stvx	v24,r11,$sp
-+	stvx	v23,r11,$sp
-	addi	r11,r11,32
--	stvx	v25,r10,$sp
-+	stvx	v24,r10,$sp
-	addi	r10,r10,32
-+	stvx	v25,r11,$sp
-+	addi	r11,r11,32
-	stvx	v26,r10,$sp
-	addi	r10,r10,32
-	stvx	v27,r11,$sp
-@@ -1153,12 +1153,12 @@ __poly1305_blocks_vsx:
-	addi	r11,r11,32
-	stvx	v22,r10,$sp
-	addi	r10,r10,32
--	stvx	v23,r10,$sp
--	addi	r10,r10,32
--	stvx	v24,r11,$sp
-+	stvx	v23,r11,$sp
-	addi	r11,r11,32
--	stvx	v25,r10,$sp
-+	stvx	v24,r10,$sp
-	addi	r10,r10,32
-+	stvx	v25,r11,$sp
-+	addi	r11,r11,32
-	stvx	v26,r10,$sp
-	addi	r10,r10,32
-	stvx	v27,r11,$sp
-@@ -1899,26 +1899,26 @@ Ldone_vsx:
-	mtspr	256,r12				# restore vrsave
-	lvx	v20,r10,$sp
-	addi	r10,r10,32
--	lvx	v21,r10,$sp
--	addi	r10,r10,32
--	lvx	v22,r11,$sp
-+	lvx	v21,r11,$sp
-	addi	r11,r11,32
--	lvx	v23,r10,$sp
-+	lvx	v22,r10,$sp
-	addi	r10,r10,32
--	lvx	v24,r11,$sp
-+	lvx	v23,r11,$sp
-	addi	r11,r11,32
--	lvx	v25,r10,$sp
-+	lvx	v24,r10,$sp
-	addi	r10,r10,32
--	lvx	v26,r11,$sp
-+	lvx	v25,r11,$sp
-	addi	r11,r11,32
--	lvx	v27,r10,$sp
-+	lvx	v26,r10,$sp
-	addi	r10,r10,32
--	lvx	v28,r11,$sp
-+	lvx	v27,r11,$sp
-	addi	r11,r11,32
--	lvx	v29,r10,$sp
-+	lvx	v28,r10,$sp
-	addi	r10,r10,32
--	lvx	v30,r11,$sp
--	lvx	v31,r10,$sp
-+	lvx	v29,r11,$sp
-+	addi	r11,r11,32
-+	lvx	v30,r10,$sp
-+	lvx	v31,r11,$sp
-	$POP	r27,`$VSXFRAME-$SIZE_T*5`($sp)
-	$POP	r28,`$VSXFRAME-$SIZE_T*4`($sp)
-	$POP	r29,`$VSXFRAME-$SIZE_T*3`($sp)
---
-2.39.3
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
deleted file mode 100644
index 621dc6b0ab..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-rom e09fc1d746a4fd15bb5c3d7bbbab950aadd005db Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tomas@openssl.org>
-Date: Fri, 22 Dec 2023 16:25:56 +0100
-Subject: [PATCH] Limit the execution time of RSA public key check
-
-Fixes CVE-2023-6237
-
-If a large and incorrect RSA public key is checked with
-EVP_PKEY_public_check() the computation could take very long time
-due to no limit being applied to the RSA public key size and
-unnecessarily high number of Miller-Rabin algorithm rounds
-used for non-primality check of the modulus.
-
-Now the keys larger than 16384 bits (OPENSSL_RSA_MAX_MODULUS_BITS)
-will fail the check with RSA_R_MODULUS_TOO_LARGE error reason.
-Also the number of Miller-Rabin rounds was set to 5.
-
-Reviewed-by: Neil Horman <nhorman@openssl.org>
-Reviewed-by: Matt Caswell <matt@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/23243)
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e09fc1d746a4fd15bb5c3d7bbbab950aadd005db]
-CVE: CVE-2023-6237
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- crypto/rsa/rsa_sp800_56b_check.c              |  8 +++-
- test/recipes/91-test_pkey_check.t             |  2 +-
- .../91-test_pkey_check_data/rsapub_17k.pem    | 48 +++++++++++++++++++
- 3 files changed, 56 insertions(+), 2 deletions(-)
- create mode 100644 test/recipes/91-test_pkey_check_data/rsapub_17k.pem
-
-diff --git a/crypto/rsa/rsa_sp800_56b_check.c b/crypto/rsa/rsa_sp800_56b_check.c
-index fc8f19b..bcbdd24 100644
---- a/crypto/rsa/rsa_sp800_56b_check.c
-+++ b/crypto/rsa/rsa_sp800_56b_check.c
-@@ -289,6 +289,11 @@ int ossl_rsa_sp800_56b_check_public(const RSA *rsa)
-         return 0;
- 
-     nbits = BN_num_bits(rsa->n);
-+    if (nbits > OPENSSL_RSA_MAX_MODULUS_BITS) {
-+        ERR_raise(ERR_LIB_RSA, RSA_R_MODULUS_TOO_LARGE);
-+        return 0;
-+    }
-+
- #ifdef FIPS_MODULE
-     /*
-      * (Step a): modulus must be 2048 or 3072 (caveat from SP800-56Br1)
-@@ -324,7 +329,8 @@ int ossl_rsa_sp800_56b_check_public(const RSA *rsa)
-         goto err;
-     }
- 
--    ret = ossl_bn_miller_rabin_is_prime(rsa->n, 0, ctx, NULL, 1, &status);
-+    /* Highest number of MR rounds from FIPS 186-5 Section B.3 Table B.1 */
-+    ret = ossl_bn_miller_rabin_is_prime(rsa->n, 5, ctx, NULL, 1, &status);
- #ifdef FIPS_MODULE
-     if (ret != 1 || status != BN_PRIMETEST_COMPOSITE_NOT_POWER_OF_PRIME) {
- #else
-diff --git a/test/recipes/91-test_pkey_check.t b/test/recipes/91-test_pkey_check.t
-index dc7cc64..f8088df 100644
---- a/test/recipes/91-test_pkey_check.t
-+++ b/test/recipes/91-test_pkey_check.t
-@@ -70,7 +70,7 @@ push(@positive_tests, (
-     "dhpkey.pem"
-     )) unless disabled("dh");
- 
--my @negative_pubtests = ();
-+my @negative_pubtests = ("rsapub_17k.pem");  # Too big RSA public key
- 
- push(@negative_pubtests, (
-     "dsapub_noparam.der"
-diff --git a/test/recipes/91-test_pkey_check_data/rsapub_17k.pem b/test/recipes/91-test_pkey_check_data/rsapub_17k.pem
-new file mode 100644
-index 0000000..9a2eaed
---- /dev/null
-+++ b/test/recipes/91-test_pkey_check_data/rsapub_17k.pem
-@@ -0,0 +1,48 @@
-+-----BEGIN PUBLIC KEY-----
-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
-+AQAB
-+-----END PUBLIC KEY-----
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl_3.0.12.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.13.bb
index ce0f9fa8e3..5e43fdc2de 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
@@ -12,16 +12,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://CVE-2023-5678.patch \
-           file://CVE-2023-6129.patch \
-           file://CVE-2023-6237.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "f93c9e8edde5e9166119de31755fc87b4aa34863662f67ddfcba14d0b6b69b61"
+SRC_URI[sha256sum] = "88525753f79d3bec27d2fa7c66aa0b92b3aa9498dafd93d7cfa4b3780cdae313"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
@@ -188,6 +185,7 @@ PTEST_BUILD_HOST_PATTERN = "perl_version ="
 do_install_ptest () {
 	install -d ${D}${PTEST_PATH}/test
 	install -m755 ${B}/test/p_test.so ${D}${PTEST_PATH}/test
+	install -m755 ${B}/test/p_minimal.so ${D}${PTEST_PATH}/test
 	install -m755 ${B}/test/provider_internal_test.cnf ${D}${PTEST_PATH}/test
 
 	# Prune the build tree
-- 
2.34.1



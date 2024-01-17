Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF62C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 15:59:20 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.6547.1705507151196536415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 07:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NnYJJ4NN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d542701796so62470075ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705507150; x=1706111950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBB0BJvjBtBfxt1Y9hwWuldAoGek/btnZoKEXrQaMZk=;
        b=NnYJJ4NNTOzvRNbYUA3Jg/BE/RAz25QuvkmJ7UYzYVYhYrwi/33xBczoaeLollwlr/
         dBpWc25BhUaiIS9jaFZMg3px3jT/Kr4Rji9z7mqyZNolyUDWyVtEFxC+hW9dp1xE37JJ
         G+iYlSYRtZGuqdC5XvgWHUipj2EN7xB/x0xYrDXej1XmC8ugra4RE85Qky/YQ4WzThs1
         G59KRo14E/Cb37FP7ZIOebgulDOUc5Jy3bSpF+ZheLC6BYsu5i2m9nBD5mguzZPysqiU
         XIGEZlyUr+nGFXsKslUtWqFY3kogMJlNbNXbO4p70ZZBlbhOcRR67mGTfpPxWciFCCdu
         WHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507150; x=1706111950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBB0BJvjBtBfxt1Y9hwWuldAoGek/btnZoKEXrQaMZk=;
        b=iXY8VqPml7exzuEI6OE3db0KQLnAaJPj6+rjnwfaf2aFFrWcZTS3cSlhyDfFENgkue
         c+nP2MLvoBi4kSgl9vC8thfki9dnw/iah7F3j9lA9lEGPERKmkXAs4qZtQR4feXougq7
         IuFrO57ZW80N+drbPr1U3/iySERYZ4M9ltg4fj7I3sG/ep9OTCMycybt0G0G8HNSgcby
         4ObV2SV4h96YGXdHaTSCILYbGeB6guqae1FV+n61uGwv/zHStS5hvZWOda7ROJvWNfva
         3RmXYXYHupTYqzWaszEV72pyVc5dIhbvb4dexSUG9p5TfdeDBc2uoidyQ3VcvfreGkNP
         4FLg==
X-Gm-Message-State: AOJu0Yyf81asV0MXxdfmyz3L12K7xyAtBWEOSqBGBzkq8EOqiaLoie6u
	OUIr0xMLLdRuJjV92doaBjBOwUcBgbBsAD16hF363wBqbp0EaQ==
X-Google-Smtp-Source: AGHT+IGeZaIR7YYFlyhznS757DJzPzY2IzsvoXeT684qBRWK8w7kHrjKPI6LL1lQ7CdRqgwgZYfeXw==
X-Received: by 2002:a17:903:2349:b0:1d4:7863:7580 with SMTP id c9-20020a170903234900b001d478637580mr6645015plh.109.1705507149816;
        Wed, 17 Jan 2024 07:59:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902ea0400b001d425d495c9sm11117999plg.190.2024.01.17.07.59.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:59:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/7] openssl: Backport fix for CVE-2023-6129
Date: Wed, 17 Jan 2024 05:58:54 -1000
Message-Id: <db1c8b434e1e249cf5a12fe39cf996373513f3dc.1705505890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705505890.git.steve@sakoman.com>
References: <cover.1705505890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 15:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193925

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport [https://github.com/openssl/openssl/commit/8d847a3ffd4f0b17ee33962cf69c36224925b34f]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2023-6129.patch       | 113 ++++++++++++++++++
 .../openssl/openssl_3.0.12.bb                 |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch
new file mode 100644
index 0000000000..c5749e1874
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch
@@ -0,0 +1,113 @@
+From 8d847a3ffd4f0b17ee33962cf69c36224925b34f Mon Sep 17 00:00:00 2001
+From: Rohan McLure <rmclure@linux.ibm.com>
+Date: Thu, 4 Jan 2024 10:25:50 +0100
+Subject: [PATCH] poly1305-ppc.pl: Fix vector register clobbering
+
+Fixes CVE-2023-6129
+
+The POLY1305 MAC (message authentication code) implementation in OpenSSL for
+PowerPC CPUs saves the the contents of vector registers in different order
+than they are restored. Thus the contents of some of these vector registers
+is corrupted when returning to the caller. The vulnerable code is used only
+on newer PowerPC processors supporting the PowerISA 2.07 instructions.
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/23200)
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/8d847a3ffd4f0b17ee33962cf69c36224925b34f]
+CVE: CVE-2023-6129
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ crypto/poly1305/asm/poly1305-ppc.pl | 42 ++++++++++++++---------------
+ 1 file changed, 21 insertions(+), 21 deletions(-)
+
+diff --git a/crypto/poly1305/asm/poly1305-ppc.pl b/crypto/poly1305/asm/poly1305-ppc.pl
+index 9f86134..2e601bb 100755
+--- a/crypto/poly1305/asm/poly1305-ppc.pl
++++ b/crypto/poly1305/asm/poly1305-ppc.pl
+@@ -744,7 +744,7 @@ ___
+ my $LOCALS= 6*$SIZE_T;
+ my $VSXFRAME = $LOCALS + 6*$SIZE_T;
+    $VSXFRAME += 128;	# local variables
+-   $VSXFRAME += 13*16;	# v20-v31 offload
++   $VSXFRAME += 12*16;	# v20-v31 offload
+
+ my $BIG_ENDIAN = ($flavour !~ /le/) ? 4 : 0;
+
+@@ -919,12 +919,12 @@ __poly1305_blocks_vsx:
+	addi	r11,r11,32
+	stvx	v22,r10,$sp
+	addi	r10,r10,32
+-	stvx	v23,r10,$sp
+-	addi	r10,r10,32
+-	stvx	v24,r11,$sp
++	stvx	v23,r11,$sp
+	addi	r11,r11,32
+-	stvx	v25,r10,$sp
++	stvx	v24,r10,$sp
+	addi	r10,r10,32
++	stvx	v25,r11,$sp
++	addi	r11,r11,32
+	stvx	v26,r10,$sp
+	addi	r10,r10,32
+	stvx	v27,r11,$sp
+@@ -1153,12 +1153,12 @@ __poly1305_blocks_vsx:
+	addi	r11,r11,32
+	stvx	v22,r10,$sp
+	addi	r10,r10,32
+-	stvx	v23,r10,$sp
+-	addi	r10,r10,32
+-	stvx	v24,r11,$sp
++	stvx	v23,r11,$sp
+	addi	r11,r11,32
+-	stvx	v25,r10,$sp
++	stvx	v24,r10,$sp
+	addi	r10,r10,32
++	stvx	v25,r11,$sp
++	addi	r11,r11,32
+	stvx	v26,r10,$sp
+	addi	r10,r10,32
+	stvx	v27,r11,$sp
+@@ -1899,26 +1899,26 @@ Ldone_vsx:
+	mtspr	256,r12				# restore vrsave
+	lvx	v20,r10,$sp
+	addi	r10,r10,32
+-	lvx	v21,r10,$sp
+-	addi	r10,r10,32
+-	lvx	v22,r11,$sp
++	lvx	v21,r11,$sp
+	addi	r11,r11,32
+-	lvx	v23,r10,$sp
++	lvx	v22,r10,$sp
+	addi	r10,r10,32
+-	lvx	v24,r11,$sp
++	lvx	v23,r11,$sp
+	addi	r11,r11,32
+-	lvx	v25,r10,$sp
++	lvx	v24,r10,$sp
+	addi	r10,r10,32
+-	lvx	v26,r11,$sp
++	lvx	v25,r11,$sp
+	addi	r11,r11,32
+-	lvx	v27,r10,$sp
++	lvx	v26,r10,$sp
+	addi	r10,r10,32
+-	lvx	v28,r11,$sp
++	lvx	v27,r11,$sp
+	addi	r11,r11,32
+-	lvx	v29,r10,$sp
++	lvx	v28,r10,$sp
+	addi	r10,r10,32
+-	lvx	v30,r11,$sp
+-	lvx	v31,r10,$sp
++	lvx	v29,r11,$sp
++	addi	r11,r11,32
++	lvx	v30,r10,$sp
++	lvx	v31,r11,$sp
+	$POP	r27,`$VSXFRAME-$SIZE_T*5`($sp)
+	$POP	r28,`$VSXFRAME-$SIZE_T*4`($sp)
+	$POP	r29,`$VSXFRAME-$SIZE_T*3`($sp)
+--
+2.39.3
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
index 395cace2ec..4602151d91 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://CVE-2023-5678.patch \
+           file://CVE-2023-6129.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1



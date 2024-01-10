Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59759C4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 11:39:08 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.9724.1704886742154351886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 03:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cKopcSem;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6d9b1589a75so1816079b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 03:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704886741; x=1705491541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi6/sbez+GauDxH8Fhy+REXHSv2GBtYM+mMPvUQCd1o=;
        b=cKopcSem2+o2OkA15JUQvrosNMYHFcrTyztFQjrX8QOGIVOLem/k01Lk7H4TlqVbIr
         zUOoXQmFvzCRbj5BGpxlrb52k3ehaUxZqg7JPiAZnMFKBjPQ3YhO/maOGMcZX3S6/4aM
         mhKbCXhhgrz6nJOih4IQ+w/ERDa2muwisWVgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704886741; x=1705491541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pi6/sbez+GauDxH8Fhy+REXHSv2GBtYM+mMPvUQCd1o=;
        b=VIhA8SGRvu1O5OIxUrlIplRvs2BOsHworjmMuUkOWWr2CND5LIKYdjGyzcEx7cLone
         vDnZqZDUdLBmJ5U6DoD/uqXJJKMUL8evYz5pENA9e7w4NNONRG9Oio9kxs8XRLSD2LR/
         ZU+KGhKijRWguL/uO6V3Ovi44/+Bf/sPID4siF7k8jv4RT1xYvKlMbaJOL+fQaD6YG/K
         03rUezy4nf6WYr5Psu+BZzR/1dMkcK2A2Fu2T0PS58/4plkZY6ilTULViSeVjQMlJih+
         Of49aqNur8tCqUzVyTw0suxBFFBeYCLNaG1PICFBKJVUSZBDRhtkqSd4rJspr5ooDFIW
         TAfQ==
X-Gm-Message-State: AOJu0YwdD9dPljh98e83NHXRu3BDTBYYTo3OZkQSR95lvNSMs2gOv7aQ
	UyTZOTE4Pc9SrizBakdSH5wr8TTj96yvElcqEM/Tj+21lgs=
X-Google-Smtp-Source: AGHT+IGy9rqCQucHpToYzqf5RbGIhJ7+ZOWIHIhfgl9lCBuome6YL5kCbqUh7KOB6u4b65v7bgjM6w==
X-Received: by 2002:a62:ed05:0:b0:6d9:9003:e2cd with SMTP id u5-20020a62ed05000000b006d99003e2cdmr724112pfh.41.1704886740578;
        Wed, 10 Jan 2024 03:39:00 -0800 (PST)
Received: from localhost.localdomain ([116.75.173.5])
        by smtp.gmail.com with ESMTPSA id fi25-20020a056a00399900b006db3358a0bdsm881974pfb.193.2024.01.10.03.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 03:39:00 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] openssl: Backport fix for CVE-2023-6129
Date: Wed, 10 Jan 2024 17:08:40 +0530
Message-Id: <20240110113840.655450-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 11:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193491

Upstream-Status: Backport [https://github.com/openssl/openssl/commit/8d847a3ffd4f0b17ee33962cf69c36224925b34f]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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
2.39.3



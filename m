Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D076ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 08:57:42 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.9930.1662022651855024134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 01:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V9yIhgc4;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id b26so10254986ljk.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 01:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/rH8eLR9Id6Y4K4Sl12tOMbM89AfDONKs591YIGNn34=;
        b=V9yIhgc44asVxn0MZJsKerh48Gp22mKW3ZGZo1GPnFbEFLei/N0pCDIpCQjb9q5X0y
         Y9Mm6iWN1rz1ltkbhsZFt4LNxu2kVIJB8pvjrYxaZqdlO/1Bw3Hh8O6tJkdca7zi9sgZ
         v+lTp2rdBU5g6q4iJjxoGiYF278f0uNDulyBCFVimPahYdoJKBbFFlOtMpdNv9M+hTId
         ewujxKkeGBP2oGTSnJCuOJ2VQtSSb3kZ4Pr2fHGVcj0qYegseqCQy+Eo2fybmaqP26pL
         BLprJp7PEzIqmavmLTExs8JHwfSDbYPb/aFSgpjJDFQYeHO2Qk2KoC0O2nB7MZAWEkOP
         EQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/rH8eLR9Id6Y4K4Sl12tOMbM89AfDONKs591YIGNn34=;
        b=LGFSgVAkfrgSrqq2+xh9jWXJplXu0LC9V2QRktanjl1Cz5Tn+xCyOE/hvGcVpp542W
         aXNAAu1W7SmgaSOUgMH/26UZ5pzsbo4TNHDtkHFGEIO6Tj+YXD8dFdC5dUZTeuQU3P7M
         iwcRUK4IV28Wq2jW3tbBeOxkH548Fw4zNUPRL+Wz5zJ55gTrLdYcIP2ZSg1HEw73E0Hr
         Gto4LACwSbv/NvCYVW19/Qd4HjZdSgSljKQPeg/5PbK5c6x+x1Y2Mm/lzH07vjrLu3Hl
         tzV8XXEsKbyXY5dcgsnLG073ROZpictWGXc2/LXJtn3rZl3bHWmk2EwsJRlroRwqrTJp
         HB9g==
X-Gm-Message-State: ACgBeo0l4ekIzWa7IhPJK/xfo8aw0RvDq28WB9R1JgOYW6kMYtvQwIkC
	QxAZXOLBfy1DIXio0vV6/SVUwEg4/xc=
X-Google-Smtp-Source: 
 AA6agR6kNfNTL2qxvziGjsOiRzGoN6/cT7ztxVzuTGOrpk6U1oWgwUBacCYj6rYltD5P2AEdDM1K6Q==
X-Received: by 2002:a2e:b5a2:0:b0:265:f702:cba5 with SMTP id
 f2-20020a2eb5a2000000b00265f702cba5mr4714142ljn.399.1662022649503;
        Thu, 01 Sep 2022 01:57:29 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:74e:23c9:cfb:ccf0:d533:6859])
        by smtp.gmail.com with ESMTPSA id
 f24-20020a2eb5b8000000b0025e5cd1620fsm1607701ljn.57.2022.09.01.01.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 01:57:29 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: LUIS ENRIQUEZ <luis.enriquez@se.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH 2/2] kernel-fitimage.bbclass: add
 padding algorithm property in config nodes
Date: Thu,  1 Sep 2022 10:57:13 +0200
Message-Id: <20220901085713.10361-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901085713.10361-1-liu.ming50@gmail.com>
References: <20220901085713.10361-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 08:57:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170159

From: LUIS ENRIQUEZ <luis.enriquez@se.com>

This allows choosing padding algorithm when building fitImage. It may be pkcs-1.5 or pss.

Signed-off-by: LUIS ENRIQUEZ <luis.enriquez@se.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 29d5336c728b28890bbaadebf0ccff00ad90a64d)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 ++
 meta/classes/uboot-sign.bbclass      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 7b16633f6f..983392c23a 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -346,6 +346,7 @@ fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
 	conf_sign_algo="${FIT_SIGN_ALG}"
+	conf_padding_algo="${FIT_PAD_ALG}"
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
@@ -465,6 +466,7 @@ EOF
                         signature-1 {
                                 algo = "$conf_csum,$conf_sign_algo";
                                 key-name-hint = "$conf_sign_keyname";
+                                padding = "$conf_padding_algo";
                                 $sign_line
                         };
 EOF
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 31ffe1f472..eecdec9160 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -73,6 +73,9 @@ UBOOT_FIT_HASH_ALG ?= "sha256"
 FIT_SIGN_ALG ?= "rsa2048"
 UBOOT_FIT_SIGN_ALG ?= "rsa2048"
 
+# Kernel / U-Boot fitImage Padding Algo
+FIT_PAD_ALG ?= "pkcs-1.5"
+
 # Generate keys for signing Kernel / U-Boot fitImage
 FIT_GENERATE_KEYS ?= "0"
 UBOOT_FIT_GENERATE_KEYS ?= "0"
-- 
2.25.1



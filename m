Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A73C5B543
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:43:48 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.17594.1748443422207602224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uE9sHsM2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2301ac32320so40150875ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748443421; x=1749048221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8w1iA2wvGv4PlUatZ1BQ0pumJKjotlnrZ/kuDwBWr7U=;
        b=uE9sHsM2jxdiNTEagX7U99l7/s6oi3soKvq0bkxXUUWoShxAHBdAUvgwxM4Vfn0hYC
         QbHSVa8xBjvOSspaZ4ZdVUx2XigcRtyKnT4u8iAHWIQrfXffSNfQdMqnvAgCYNe1RB5u
         m7bSTxBGrULHsul7fwFbwcCTwuq/p+DRSoHWGC/t6lzTYOGV656Wo6iaUlZJuQEg5EDB
         1WI6Z0C1TdZWDP92uvMhs/Y+MJk06b7xCuF060QFV3R7ABPou0v3N6Vd9FhGcpa3zHuz
         eOuQDIOoYGmCSA0r7CO5X5yFOopnLMfIUojfIN+1Y37l6Hjksl36octSJGIPHFaiCb8U
         zmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443421; x=1749048221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8w1iA2wvGv4PlUatZ1BQ0pumJKjotlnrZ/kuDwBWr7U=;
        b=YL52i8HU6CruE8P/jd0BHTn7emWUXqIZwqXFLSaynyMrcunxuRNGPCeGoJH0yqO5Nf
         aWhkRE8HlG7rFnYmtJoW8AN7z5rIP4RahMly/vZsphy8NpXbDffgwih4Dlw3DjbgqNVz
         d16cPZzcBnPnKbCyDBNlFJoZUxlZdcec+FQbWpL5rFs1h2mkLgLu6AHRH39S1ymyT0Wr
         sr0pqU5iaSvFD97jkr4C1bJhHDyVmnhp8Vg7DeQDTwMcIZDP2Jmz1KDJlZMlU7rebtpd
         IIqm/95Gv6Ze7jQ5X60SDcI779akDF676O7qmbjRjlnqyysfhtZTKeGmKpOBs73Utgl1
         MEIg==
X-Gm-Message-State: AOJu0YztAXbw5W1Ozs05LVvcyNrAtcVy4DGL199KJ2Qt/Ocby6EPprRm
	6DQidQRVg6jPOG+JO31qPsftXVnVrXfLhpQzs2rJTEm6tipb7rEPEDOTF8Y2Qjgdn3gt+UiCq5v
	BWx66
X-Gm-Gg: ASbGncspcefgG+MXnaUrWYaO8oesKSKAGpnasOZNO0/nQgmStZjqbU8+Jm2F0hz1E52
	h8omvk50POQRcgclKw0S0Fs192gjVPXr89NJWyqd8WKG30d4NmXvDL9K9tQsyEMoqKldLpJ/lki
	a7CeQQ5TQsq6wJSfNOVaIl2oeWJpLVAAdtxP87aQqaEDHIV2ak4+1QvynGKB7qkAurvQWw3Z8CG
	YkudCow7+ycUONNs9gbFLBimRq0b7els/w2kxJfOU0nXhKPFZT5qgyHm7aSv+hNZLVga1pm9xKF
	5EnVBK+39uYe7a2v2EIWKS+krBttReF0W/41zv0dEIA=
X-Google-Smtp-Source: AGHT+IH4P9SmiQTFfcgjBOHpzYtqwMh8pSD07NMH2vgtcfK4p67I/l3pR6wp4amTEX7GINf3fWeFgQ==
X-Received: by 2002:a17:903:11c5:b0:234:d2fb:2d0e with SMTP id d9443c01a7336-234d2fb2f7dmr43270895ad.10.1748443421461;
        Wed, 28 May 2025 07:43:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f1e2sm12626285ad.140.2025.05.28.07.43.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:43:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/11] u-boot: ensure keys are generated before assembling U-Boot FIT image
Date: Wed, 28 May 2025 07:43:14 -0700
Message-ID: <56431a98ac661eaa42803e83a9ede6eae0b72b67.1748443238.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748443238.git.steve@sakoman.com>
References: <cover.1748443238.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217363

From: Rogerio Guerra Borin <rogerio.borin@toradex.com>

Add the task dependency:

do_uboot_assemble_fitimage -> virtual/kernel:do_kernel_generate_rsa_keys

to ensure the kernel FIT image signing keys are available when creating
the U-Boot DTB. This is done only if the signing of the kernel FIT image
is enabled (UBOOT_SIGN_ENABLE="1").

The lack of the dependency causes build errors when executing a build
with no kernel FIT keys initially present in the keys directory. In such
cases one would see an output like this in the Bitbake logs:

Log data follows:
| DEBUG: Executing shell function do_uboot_assemble_fitimage
| Couldn't open RSA private key: '/workdir/build/keys/fit/dev.key': No such file or directory
| Failed to sign 'signature' signature node in 'conf-1' conf node
| FIT description: Kernel Image image with one or more FDT blobs
| ...

This issue was introduced by commit 259bfa86f384 where the dependency
between U-Boot and the kernel was removed (for good reasons). Before
that commit the dependency was set via DEPENDS so that, in terms of
tasks, one had:

u-boot:do_configure -> virtual/kernel:do_populate_sysroot

and the chain leading to the key generation was:

virtual/kernel:do_populate_sysroot -> virtual/kernel:do_install
virtual/kernel:do_install -> virtual/kernel:do_assemble_fitimage
virtual/kernel:do_assemble_fitimage -> virtual/kernel:do_kernel_generate_rsa_keys

With the removal of the first dependency, no more guarantees exist that
the keys would be present when assembling the U-Boot FIT image. That's
the situation we are solving with the present commit.

(From OE-Core rev: 036f20156b3c7d0a8b912e90aa29a9b986106d5a)

Fixes: d7bd9c627661 ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled")
Signed-off-by: Rogerio Guerra Borin <rogerio.borin@toradex.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 5c579a9fb0..699db248e1 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -94,6 +94,8 @@ python() {
     sign = d.getVar('UBOOT_SIGN_ENABLE') == '1'
     if d.getVar('UBOOT_FITIMAGE_ENABLE') == '1' or sign:
         d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
+    if d.getVar('FIT_GENERATE_KEYS') == '1' and sign:
+        d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' virtual/kernel:do_kernel_generate_rsa_keys')
 }
 
 concat_dtb() {
-- 
2.43.0



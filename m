Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A016C04A6A
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 08:24:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.81908.1691915056898210224
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 01:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ET7JdVtS;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fe8a158fcbso16498675e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 01:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691915055; x=1692519855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vNF4Wk+rU0Mjqksn1UiuSC+HGiAXaeQmy+QQ3fFvKc=;
        b=ET7JdVtSQ8Mqjs544qfYSzNEvj9P6vRpquPEoBqxWcu3ED+7/7hCWUfkrLB5fKg6pi
         leM3JugbPq+RtPO3kAG7ivsx0ha5b1b0xP8Irqrl1gWW4OORI5ZQoFJJbO7yp15I2+29
         Hlphg1z2A0+8WiRnCrGCU9pXKVslefq0gQ+ajzrxHd7z9r8j1gJhdSIpRzckf5eGOHCX
         vz663zFSWeAUQO8uC2OhaM0/0Iv4E9tj/YhB9iNAUF18sTE+1hLS476iYzXhmaR2sTWe
         3yn/WZK3io20AeW+5qwmgyJFMOnW39t9qiE6qVUToWVZ9/yy2A/RQmmdf29gJ1OhiML3
         cJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691915055; x=1692519855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vNF4Wk+rU0Mjqksn1UiuSC+HGiAXaeQmy+QQ3fFvKc=;
        b=UsEFH0U8oD1Xq6X0+t87qGmljktEE/mytgtCNatp+RQXXxzr1BVanQPXPkzdUKgriV
         g8D+ha1jtMcvLCb5X1gA5ZxklYIwQSoKwMq9DQxqDwPMpMJpYcxWRs5LEfHxsH3XV6Ff
         YbugEai/JAzcvKog63e1hcMkIT1zVVcXrtsrVtuqISzr52kx7K2eR3vLCUzm5Ez5TzA1
         HD3TH/3FZ05MKtPFayQi1KJv6nGq4MUEznNpDCPGa4DYgN34U13vYDjZ5TMx4lrvLmKf
         AVxHdjibcn2ByMs7rQqPdf086GmnQxyZeZQYHYFXSNRpiKi8K1HKYEnG8+5XORYlkktN
         1AFg==
X-Gm-Message-State: AOJu0YzpyHLdePAtLPeURSmYkcIzd5NpPmpyUJpdteZRCi3ieeglgsnA
	WhChGVR5ryhTbpE2aE4Lme4vI3Yk6Do=
X-Google-Smtp-Source: AGHT+IE06E8XHYitcZRheIFeSdyXUpUR05UH1EAlNV+P/OkpytovY+nG83PKovb1GgEqH4sA+0NzHw==
X-Received: by 2002:a7b:c4d0:0:b0:3fe:1679:ba7b with SMTP id g16-20020a7bc4d0000000b003fe1679ba7bmr5025657wmk.24.1691915055127;
        Sun, 13 Aug 2023 01:24:15 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:e135:6fa3:a98f:aed0])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d480b000000b00318147fd2d3sm10601450wrq.41.2023.08.13.01.24.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 01:24:14 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV2 2/4] classes-recipe: add cargo_c.bbclass
Date: Sun, 13 Aug 2023 10:23:55 +0200
Message-Id: <62228d31921d705665a7f313033af7851aedc08e.1691914589.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691914589.git.frederic.martinsons@gmail.com>
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 08:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185865

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This class can be used inside rust recipe to generate
a rust library that can be called by C/C++ code.

The rust recipe which uses this class has to only replace
"inherit cargo" by "inherit cargo-c".

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo_c.bbclass | 41 +++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/classes-recipe/cargo_c.bbclass

diff --git a/meta/classes-recipe/cargo_c.bbclass b/meta/classes-recipe/cargo_c.bbclass
new file mode 100644
index 0000000000..c083f69c08
--- /dev/null
+++ b/meta/classes-recipe/cargo_c.bbclass
@@ -0,0 +1,41 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+##
+## Purpose:
+## This class is used by any recipes that want to compile a C ABI compatible
+## library with header and pkg config file
+
+inherit cargo pkgconfig
+
+# the binaries we will use
+CARGO_C_BUILD = "cargo-cbuild"
+CARGO_C_INSTALL = "cargo-cinstall"
+
+# We need cargo-c to compile for the target
+BASEDEPENDS:append = " cargo-c-native"
+
+do_compile[progress] = "outof:\s+(\d+)/(\d+)"
+cargo_c_do_compile() {
+    oe_cargo_fix_env
+    export RUSTFLAGS="${RUSTFLAGS}"
+    bbnote "Using rust targets from ${RUST_TARGET_PATH}"
+    bbnote "cargo-cbuild = $(which ${CARGO_C_BUILD})"
+    bbnote "${CARGO_C_BUILD} cbuild ${CARGO_BUILD_FLAGS}"
+    "${CARGO_C_BUILD}" cbuild ${CARGO_BUILD_FLAGS}
+}
+
+cargo_c_do_install() {
+    oe_cargo_fix_env
+    export RUSTFLAGS="${RUSTFLAGS}"
+    bbnote "cargo-cinstall = $(which ${CARGO_C_INSTALL})"
+    "${CARGO_C_INSTALL}" cinstall ${CARGO_BUILD_FLAGS} \
+        --destdir ${D} \
+        --prefix /usr \
+        --library-type cdylib
+}
+
+EXPORT_FUNCTIONS do_compile do_install
-- 
2.34.1



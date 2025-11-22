Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA696CFD306
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:15:03 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3757.1763849694281912262
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QDIKd+dO;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-340bcc92c7dso2534536a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849693; x=1764454493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LA3KRtSe4TPlAYsxPz0Vp8mdnzB6kqPgnEur2GUJw4=;
        b=QDIKd+dOwkDtWIoSDsfCjFICuCLxMrlpxAb+QIdD3IeqrijumCk5RzWPEct/3IIXx4
         9IUjrae0UwYpPGbsQM2+MKL5MbAPOjO/jNkYmUZ4XA/uG2BFqRCaO4ERBV1LIvqzSE/E
         E1OYMBIAK9102GyIzPlUdz8VbgjG/V9mDUHqr74xhCY8rX8fi58RKQcoYOy7v8Nu+5yi
         mMcbieTLxk62VlhuPxtDxRykAejYgeop/H07jFe7eRJe7Aky1QZeCb9UB9YdpambXc4r
         PmZaGoTjBuyFIum19sHg4kPaWKbGGfECjwdZOCzPDY5qSAxAasTxLgFWeCf50PJ7pCtw
         gyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849693; x=1764454493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5LA3KRtSe4TPlAYsxPz0Vp8mdnzB6kqPgnEur2GUJw4=;
        b=veL2beaT13SgOf0/KjaR9Be84livk/Ws5xze7vwUvDSaLX3QAz73Bz0of2x/fp1/af
         vRoOp8R4jW/HkttObk28TvalkCUSav3NHQMWo6T+QruPRJtSUDDfjbvcYXkdEkuN8aQf
         +THb8RQ4FzCMg1arPpMfhryxosDgUofVhlXaYCD4kD0QZ+QHQYUfFG1W7+uBCOmGjjB+
         IA+ABeIY2CZPdt2EdPYWr5evT474ROmvsdWyb0CY/eF5ahw/lvsdkaNYJ6SqihrQ+cie
         qO0Vv1K4i5pSA3fOtKvzHdK8BgpO3W6Xq2S4cXt8R8s8CoTe9jiiWnKniAvaYx6XEZ2l
         RxWQ==
X-Gm-Message-State: AOJu0Yx9vT4BI/lXAI5tuhU4QMtNCGG/q6mpR4upHDn/HH5jxsqAuiOQ
	Rn2tYtwMPQtlr9HzFLYvjwufdUuT3X1qphwBn71cqlyn5SsbPzLr0v24Xmyz6SAW1TBII1uvZBe
	5AT6c
X-Gm-Gg: ASbGnctlKp9yPW3ls33brpfTJYVwFnG8q2LmnWgiZ5/RzxbQ0M9VMol5H/WQiCKL48n
	Pv1f2WDgNW53QshZK2eTZQpebrVFW0nHUJOiaxqib4CHFYsICPjSyihAi0g1bQNWAu/rsz6/uqR
	PNkzxKbulv7JMkYYI6hIUcy0DiDEDgxWNG7V0CwQ5S4KUlWb4HL6IR+KeqXGfOn5btGgeatAxk1
	YING4fqgpDwd83PoQ9DJ30ihUmOFYM8rRj0gNKRSoEFIK1oZDtMrTSf0AeBxz9IEUjokmz933c5
	bwXq8W1mm0+L/DBrIaNxVaFMokhFpJUCzocVDSSoR1rbwdm0KeC2Tkk9oBuchGtdx3tqYxJTRFb
	UB8Oo4/9HM4LpTwCCOJJp9JEN4VrH33OEWZDPE0UgM1PvNUK0CHrPrHFP1UHuqWfSNr/00LvFS7
	e5BQ==
X-Google-Smtp-Source: AGHT+IFxxjpI2DuA09hQ+rKZVeNRyKtgpBkurZmvGs68SMcsnL8Tkrzj/LozPG5szNEJ5/GUYmtEsQ==
X-Received: by 2002:a17:90a:dfcb:b0:343:7711:127d with SMTP id 98e67ed59e1d1-347298a9fabmr11333183a91.9.1763849693535;
        Sat, 22 Nov 2025 14:14:53 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/21] glslang: fix compiling with gcc15
Date: Sat, 22 Nov 2025 14:14:17 -0800
Message-ID: <cd0039c22d7aa3d6983ac6fe917b648930355849.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226709

From: Gyorgy Sarvari <skandigraun@gmail.com>

Backport a patch that fixes a compilation failure with gcc15:

| .../git/SPIRV/SpvBuilder.h:238:30: error: ‘uint32_t’ has not been declared
|   238 |     Id makeDebugLexicalBlock(uint32_t line);
|       |                              ^~~~~~~~
| .../git/SPIRV/SpvBuilder.h:64:1: note: ‘uint32_t’ is defined in header ‘<cstdint>’; this is probably fixable by adding ‘#include <cstdint>’

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...uilder.h-add-missing-cstdint-include.patch | 30 +++++++++++++++++++
 .../glslang/glslang_1.3.275.0.bb              |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-graphics/glslang/glslang/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch

diff --git a/meta/recipes-graphics/glslang/glslang/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch b/meta/recipes-graphics/glslang/glslang/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
new file mode 100644
index 0000000000..02b072c56a
--- /dev/null
+++ b/meta/recipes-graphics/glslang/glslang/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
@@ -0,0 +1,30 @@
+From e40c14a3e007fac0e4f2e4164fdf14d1712355bd Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Fri, 2 Aug 2024 22:44:21 +0100
+Subject: [PATCH] SPIRV/SpvBuilder.h: add missing <cstdint> include
+
+Without the change `glslang` build fails on upcoming `gcc-15` as:
+
+    In file included from /build/source/SPIRV/GlslangToSpv.cpp:45:
+    SPIRV/SpvBuilder.h:248:30: error: 'uint32_t' has not been declared
+      248 |     Id makeDebugLexicalBlock(uint32_t line);
+          |                              ^~~~~~~~
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/glslang/commit/e40c14a3e007fac0e4f2e4164fdf14d1712355bd]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ SPIRV/SpvBuilder.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/SPIRV/SpvBuilder.h b/SPIRV/SpvBuilder.h
+index b1ca6ce1..00b2e53a 100644
+--- a/SPIRV/SpvBuilder.h
++++ b/SPIRV/SpvBuilder.h
+@@ -56,6 +56,7 @@ namespace spv {
+ }
+ 
+ #include <algorithm>
++#include <cstdint>
+ #include <map>
+ #include <memory>
+ #include <set>
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
index 2fd1e72a26..b688b3df48 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 SRCREV = "a91631b260cba3f22858d6c6827511e636c2458a"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
+           file://0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch \
            "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.43.0



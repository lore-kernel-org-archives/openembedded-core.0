Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896B9C3DA7D
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 18:39:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.25193.1672425542732158012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 10:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JEiMvAdU;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso12601579wms.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tB7YiDI68azNOU/Xr6twT0wedyzcLiG7Duears2Oryk=;
        b=JEiMvAdUhS6Il+LfZD63thItlyMNrz3Oretm2huw2JcFkRfsod0229T7I2WZKUfrKH
         1112OuftQ80sB9ON1r2QxobWGP7GmR/v0Ugdpa1B/UIKxazYSxV3we+lMqREZRxg3VKV
         3MDbz5UJB9uEoKw/DusosFLIss8EwxkmTcVEZ9Y7D2JFib4pxpCzXDk1j9JKI/yBRkhX
         ZqOmWONVSGM96PttnhwOzOUQM92h1G9QvIZvfQ2OiNYATdQP7+YNenuHsN6o0GgPrAub
         yuf/Q/phP79E+hByTu/B/FasMCm5ICwfsT86x6ar0791LdC9MkjEtEJpnBkE5KwjEsxN
         tf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tB7YiDI68azNOU/Xr6twT0wedyzcLiG7Duears2Oryk=;
        b=m11U/ocVzwTukvD0yOi5ScW7jtEErs6gvhMwA7/uG6mvJmCEXgGjfbfvLQ6zEgjjPF
         P1b5lXaHtj2mZbRFmncj8iSOf2rLRaauWPxgSGQNvirwyqRnYb2oYbm47b4Q2kkJ91tr
         OBc0nyh7Ptpjfe/HgpA19jKbsdg3Pzohmx7J3yDARi+qqH7FzkMwuRPHsHUXF9vIZHS3
         F1QNYakLkSl4tByjEPwoqCg7bRoMOpNESyp6scrKeVeEBmO41lfctVvsgpyjGmdXimR8
         wPLdu00IjMiAiu5F/KFl6TIoPgrrhLMCOo3lqZoXdg+YIuqGaGv5967HiCWZIku+brAK
         kGLQ==
X-Gm-Message-State: AFqh2kpc9YqOFrbbgMtoiYYGdIBLF4rphReM3e5Le1yuWBY+Fy3c8Avo
	E0ULsySKO1e8Uhg2KIHn20353ohYX5I=
X-Google-Smtp-Source: AMrXdXuIxCc0lT+Vwej/lTvpspv8tzggHKtGrN2TAtYmmws+kDwKL6pDQcboSlmygy9ixvD/TNeqiA==
X-Received: by 2002:a05:600c:4a90:b0:3d2:3ae8:886a with SMTP id b16-20020a05600c4a9000b003d23ae8886amr26438455wmp.17.1672425540952;
        Fri, 30 Dec 2022 10:39:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003d96b8e9bcasm31426682wmq.32.2022.12.30.10.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 10:39:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/11] conf/machine/include: add x86-64-v3 tunes (AVX, AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE)
Date: Fri, 30 Dec 2022 19:38:40 +0100
Message-Id: <20221230183850.3089510-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 18:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175164

Qemu 7.2 finally allows us to move beyond building for original Core 2/Core i7 era hardware,
and this patch adds support for the newer generations. But first, a bit of
background:

Recently toolchains gained support for specifying x86-64 'levels' of
instruction set support; v3 corresponds to 2013-era Haswell CPUs
(and later), with AVX, AVX2 and a few other instructions that
were introduced in that generation. I believe this is preferrable
to picking a specific CPU model as the baseline.

Here's Phoronix's feature article that explains the feature and the available levels:

"Both LLVM Clang 12 and GCC 11 are ready to go in offering the new x86-64-v2, x86-64-v3, and x86-64-v4 targets.

These x86_64 micro-architecture feature levels have been about coming up with a few "classes" of Intel/AMD CPU processor support rather than continuing to rely on just the x86_64 baseline or targeting a
specific CPU family for optimizations. These new levels make it easier to raise the base requirements around Linux x86-64 whether it be for a Linux distribution or a particular software application where
the developer/ISV may be wanting to compile with greater instruction set extensions enabled in catering to more recent Intel/AMD CPUs."

https://www.phoronix.com/news/GCC-11-x86-64-Feature-Levels

Here's gcc docs for it:
https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html

And here's the formal specification (click on the pdf link):
https://gitlab.com/x86-psABIs/x86-64-ABI

The actual tune file was created by copying corei7 tunes and doing
search/replace on them. Qemu options were dropped as unnecessary.
32 bit tune was dropped as well, as there is no 32 bit only CPU
that also supports these new instructions; all of the v3 capable
chips are 64 bit.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../machine/include/x86/tune-x86-64-v3.inc    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/conf/machine/include/x86/tune-x86-64-v3.inc

diff --git a/meta/conf/machine/include/x86/tune-x86-64-v3.inc b/meta/conf/machine/include/x86/tune-x86-64-v3.inc
new file mode 100644
index 0000000000..267c12ff50
--- /dev/null
+++ b/meta/conf/machine/include/x86/tune-x86-64-v3.inc
@@ -0,0 +1,29 @@
+# Settings for the GCC(1) cpu-type "x86-64-v3":
+#
+#     CPUs with AVX, AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE.
+#     (but not AVX512).
+#     See https://www.phoronix.com/news/GCC-11-x86-64-Feature-Levels for details.
+#
+# This tune is recommended for Intel Haswell/AMD Excavator CPUs (and later).
+#
+DEFAULTTUNE ?= "x86-64-v3"
+
+# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
+require conf/machine/include/x86/tune-corei7.inc
+
+# Extra tune features
+TUNEVALID[x86-64-v3] = "Enable x86-64-v3 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'x86-64-v3', ' -march=x86-64-v3', '', d)}"
+
+# Extra tune selections
+AVAILTUNES += "x86-64-v3"
+TUNE_FEATURES:tune-x86-64-v3 = "${TUNE_FEATURES:tune-x86-64} x86-64-v3"
+BASE_LIB:tune-x86-64-v3 = "lib64"
+TUNE_PKGARCH:tune-x86-64-v3 = "x86-64-v3"
+PACKAGE_EXTRA_ARCHS:tune-x86-64-v3 = "${PACKAGE_EXTRA_ARCHS:tune-corei7-64} x86-64-v3"
+
+AVAILTUNES += "x86-64-v3-x32"
+TUNE_FEATURES:tune-x86-64-v3-x32 = "${TUNE_FEATURES:tune-x86-64-x32} x86-64-v3"
+BASE_LIB:tune-x86-64-v3-x32 = "libx32"
+TUNE_PKGARCH:tune-x86-64-v3-x32 = "x86-64-v3-x32"
+PACKAGE_EXTRA_ARCHS:tune-x86-64-v3-x32 = "${PACKAGE_EXTRA_ARCHS:tune-corei7-64-x32} x86-64-v3-x32"
-- 
2.30.2



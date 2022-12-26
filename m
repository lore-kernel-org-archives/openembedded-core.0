Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2521CC3DA79
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 08:45:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.132423.1672044310357761603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 00:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FQhlztr2;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso4784295wmb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BSItT7+m/7YSA0uLBi0oLlWhxkpt1HYIneloDbD4BzI=;
        b=FQhlztr2gyOPYECgeAscYRnDmX8VtXziB+GLhuntr1NTFsFL1SS3urXROHhOBoLGuC
         oU4AwHDYID9ioHeNZEdiImbXmfXFZiNlLDooLOj/NFzkUieoZVnL0iMfgNyCjjQX6i/N
         G6sYr+3hhUu6F1zaLeLbdS+X3aeDdpwb3PQdrq/5uza+7OB+/WdsnLf9yBApxD+0hxfq
         XTFk0zfDISorgFHGE6HyT/YfSY6zjxEmI096Yu3nBniSF3DqQ8vP39L6l6UlMqrRv14E
         nY+U7LGG7bqm5IBMK6Pp7Moo7iWS0THzKQmMADaIyv+4LG2BHd+wzjoG3ib6f7rM4+t4
         8Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSItT7+m/7YSA0uLBi0oLlWhxkpt1HYIneloDbD4BzI=;
        b=v2RbF+RSWcPplTONsZP2LTrJS44f0j3RvyQFa442RyS16KKyvpg0yZgAOjNHjdyVbN
         FRW7psFRbsnfYRDN7aEVlfrK2KAurlEItxXA/lXNfHOKThCyTGWB2rTrKB6lQ52fAZ1R
         SF67RdakQUYHREKNIvskmYZ5MLrbB2smXOZXTz/9efWoXEZnvRuqJ9UcLvsbjp7niqf0
         cU3LO5/C4bVdbq8couvBVCABoZOZj5OaIhj6CvQCvFouVrlZ0bv9smy02byxpCVi9YJb
         WPDrAOTP/fGNAexNfGGAnPHd6p8uhZ2QmNkL5kTD7A4MXGJRhmdwT/aU9ExdiZwMS2iP
         PADg==
X-Gm-Message-State: AFqh2koEVlDR/sqs62NO1HMCqjN8nddtyPyxTkglyaLWmaPB9F5eF1dr
	TjdJXB+K1kEGkNhiJTVBlzIePaK2i8E=
X-Google-Smtp-Source: AMrXdXsPAfytu4zCGEudPJl+rSuXErgEgl/RwNIUQwXOWiEOxKiVvZne0SfOtrxE9jnhdB2FV/SLVA==
X-Received: by 2002:a05:600c:12c6:b0:3cf:6926:2abb with SMTP id v6-20020a05600c12c600b003cf69262abbmr13051446wmd.7.1672044308463;
        Mon, 26 Dec 2022 00:45:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n64-20020a1ca443000000b003d21759db42sm18203942wme.5.2022.12.26.00.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 00:45:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 1/3] conf/machine/include: add x86-64-v3 tunes (AVX, AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE)
Date: Mon, 26 Dec 2022 09:44:53 +0100
Message-Id: <20221226084455.2835751-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 08:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175013

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

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../machine/include/x86/tune-x86-64-v3.inc    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/conf/machine/include/x86/tune-x86-64-v3.inc

diff --git a/meta/conf/machine/include/x86/tune-x86-64-v3.inc b/meta/conf/machine/include/x86/tune-x86-64-v3.inc
new file mode 100644
index 0000000000..365e23b49b
--- /dev/null
+++ b/meta/conf/machine/include/x86/tune-x86-64-v3.inc
@@ -0,0 +1,35 @@
+# Settings for the GCC(1) cpu-type "x86-64-v3":
+#
+#     CPUs with AVX, AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE.
+#     (but not AVX512).
+#     See https://www.phoronix.com/news/GCC-11-x86-64-Feature-Levels for details.
+#
+# This tune is recommended for Intel Haswell/AMD Excavator CPUs (and later).
+#
+DEFAULTTUNE ?= "x86-64-v3-64"
+
+# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
+require conf/machine/include/x86/tune-corei7.inc
+
+# Extra tune features
+TUNEVALID[x86-64-v3] = "Enable x86-64-v3 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'x86-64-v3', ' -march=x86-64-v3', '', d)}"
+
+# Extra tune selections
+AVAILTUNES += "x86-64-v3-32"
+TUNE_FEATURES:tune-x86-64-v3-32 = "${TUNE_FEATURES:tune-x86} x86-64-v3"
+BASE_LIB:tune-x86-64-v3-32 = "lib"
+TUNE_PKGARCH:tune-x86-64-v3-32 = "x86-64-v3-32"
+PACKAGE_EXTRA_ARCHS:tune-x86-64-v3-32 = "${PACKAGE_EXTRA_ARCHS:tune-corei7-32} x86-64-v3-32"
+
+AVAILTUNES += "x86-64-v3-64"
+TUNE_FEATURES:tune-x86-64-v3-64 = "${TUNE_FEATURES:tune-x86-64} x86-64-v3"
+BASE_LIB:tune-x86-64-v3-64 = "lib64"
+TUNE_PKGARCH:tune-x86-64-v3-64 = "x86-64-v3-64"
+PACKAGE_EXTRA_ARCHS:tune-x86-64-v3-64 = "${PACKAGE_EXTRA_ARCHS:tune-corei7-64} x86-64-v3-64"
+
+AVAILTUNES += "x86-64-v3-64-x32"
+TUNE_FEATURES:tune-x86-64-v3-64-x32 = "${TUNE_FEATURES:tune-x86-64-x32} x86-64-v3"
+BASE_LIB:tune-x86-64-v3-64-x32 = "libx32"
+TUNE_PKGARCH:tune-x86-64-v3-64-x32 = "x86-64-v3-64-x32"
+PACKAGE_EXTRA_ARCHS:tune-x86-64-v3-64-x32 = "${PACKAGE_EXTRA_ARCHS:tune-corei7-64-x32} x86-64-v3-64-x32"
-- 
2.30.2



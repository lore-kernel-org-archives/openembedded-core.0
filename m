Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032EDC4167B
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:01:23 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.208335.1672329680560026347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M+Fl64zc;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id ay40so13454912wmb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tB7YiDI68azNOU/Xr6twT0wedyzcLiG7Duears2Oryk=;
        b=M+Fl64zcx0kONwQwyOuPkWzPmUwls7v4xnolrQJG2+laR71PdM2fhmp4NWW6O+j5Ko
         FDrGd3c0lHYm+x9rG7rn93mpmOhKtLuFOMa3WXJLlgWzyfEBSmzwoBDK3JJg1HPnInkt
         b2RwbPm332wlcxYp9drQsL7Ux2J8thqE+mKL4qlhY4gB0LnwsN5VjZ3hoqsm0mN9Jrh2
         BGPd/i6bDH7XufDVLpuQxhdndnvPh/NjwwvrQ+bf2m2X+p8HG8KVJ/HYHptSI+jZfi4r
         Qp47f3Mje8qTBDc9dx9WN3OwuId8ArVDQjKG0yQxGSZAdjLK42qGbJ4ft7cq138JLVLL
         W/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tB7YiDI68azNOU/Xr6twT0wedyzcLiG7Duears2Oryk=;
        b=t0mSpnWOfq+A5niwCugRZUw7HU/UED7h4yS1uK1Ob7PlG6GGWhLWtwc/aAPLbiDv2v
         /1zbKgPLQqVlApfZMon/pArg6oGlMeiTGC1agOCpRMNmtVPLmzTjVNSge3aPaujF/a8F
         FvFkUC+1pmeXAFlDXvfhBgQzqefGo05zK6D967zCOycdLpPoHxZFlayfU+22ZMOcF7Bw
         UNKwv67CqRCgfxcFOhguUrPuIQN/g7JosfHqgCDSfGypYPssD/jFIVn/IrP7GCtboxOm
         1ddSfFpep2smSekkmbZ5eBXP98+vgk/QJbFxO+Fuz2tTtYEF1UyHWgzyWPo50sE+sqnE
         c6/A==
X-Gm-Message-State: AFqh2kpM8YQJqPyciDiia+E7Z5DSdTJsMKTjfOgfmBw4LZEuYWK3qGMr
	qYdFhuPvMjAnZtcQ6F8e0w58D0dzBKE=
X-Google-Smtp-Source: AMrXdXu/YilZkT+NG3ufa6rmWVqYMX2z5PgHh42iKzJhhBwzsXy4C2ToIO3nXcGfjeOJsvAm0wUrJA==
X-Received: by 2002:a1c:3887:0:b0:3d2:26cd:3b1e with SMTP id f129-20020a1c3887000000b003d226cd3b1emr20314726wma.28.1672329678842;
        Thu, 29 Dec 2022 08:01:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05600c3c8c00b003d1e34bcbb2sm28161735wmb.13.2022.12.29.08.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:01:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/10] conf/machine/include: add x86-64-v3 tunes (AVX, AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE)
Date: Thu, 29 Dec 2022 17:01:02 +0100
Message-Id: <20221229160110.255775-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221229160110.255775-1-alex@linutronix.de>
References: <20221229160110.255775-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175108

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



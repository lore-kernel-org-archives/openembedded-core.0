Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3831C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:14:25 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.78318.1746544457433892421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1priaPzb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22435603572so74927005ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746544457; x=1747149257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThKiEsV+y3d26PgqLmNGwGk1RFpUiLiA0IOyEKdgs58=;
        b=1priaPzbfaFYZDifZtXl4tMWsrLzU7hOsc54x/g1dNyFMuvbFBhoEXQaYs2KWzlpNF
         N+rN6gjp/W+GJ/lKzDBrqG0HTQTkWL7QgX6x4b2RuXrMu+wFzm60KiM+lNEjTihRKK2v
         Wem8Yjy5qTjt4NU4n+vB0XwqnjIDQSFpjR3DyrqkRolFKhfC8ERDowEKKJpvqz9DbwVM
         5B+kF4XpTxqZGh8wRelKKMVdmGSfzd/9BaOKlIKhjVWymcllClTmoJelzIlS0cvckte9
         nQZQ1cTXuKrVuzF1NKJgl+abn/N834ED8PzEP8tjkaiqhjZ7ANbe3LThszrP1+P3p4fE
         rkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544457; x=1747149257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThKiEsV+y3d26PgqLmNGwGk1RFpUiLiA0IOyEKdgs58=;
        b=ikr+GN8REh4ZvGPtUUQ13BR3NhH1ZHumrczIM4s/0t1Ye4Tyl6PI6GnftA6ElL1WPY
         /ACxn+1BhpcQR3ZgfH6lZSlZhAHr2Mp//TkFxhxIE2LKFAcmw7ns8Hc/fM3rPnfGbZ3h
         YndkTAXougq0+KxM9mLDiwlmYVpJWfRLZxCNIEYxdq2sOky3FAFknbdjrw9etT88BOD/
         ZsxHkrfjUY5pesHo8xAMXDoI4fnSiAWW1tTmSdl7Yf3qqnC6O0KsVRLBtRLwvkTPKc73
         Yft759NN7P5uhrPPDma9FMR/dhABAYyonhPX/U7THD9uIXDb6XUGX8IuiMKbxTM1LwLb
         CH9A==
X-Gm-Message-State: AOJu0YxcRF/9IeC0na38IPYK24ddnl3h9sokzl3hNCf0cOAPBeHc6m51
	Rxijxy2WoyEhUIgtRdlaJBl8LRqy1UmGk+tjiQdItRhkoUWxxvdmIHiXgqquLKCVJIN8iuPbm2q
	w
X-Gm-Gg: ASbGncsCht0srAKv8MdigOHu1TjgNIlpcGaebT3btGUk9lvXDWSlJrrPKCY12DEjh+T
	A8tvfUlAqGwNtMW4EghtBaElspvq4oBwu15Oz+BjpW5r6nEy/hg1JV+49OpY5OlgEPK2kOOzabQ
	bBAq+MRSKKwA0a20M+JsvrY6B4+K568yZPA+rIFq9OUfE4D5ZVTU06joh1berMicv44y3Rrh3vV
	dXp8lCJBDvgGxKeDJX7qr5aNWaa8VBlyR9CDpUCHVQV66dv+s2qiyQl+mI3k/bte4UuGKp78UPZ
	HqCEfepmAcPfoYKtBegLVSgNO0+iWpD8
X-Google-Smtp-Source: AGHT+IEA3iVOkGe9t3FkQyPYwuMoiXyvz8MGTAD2FFLj4TMyasiqMEy0zd+As977Fwi2fY41PF/URw==
X-Received: by 2002:a17:902:d505:b0:220:d601:a704 with SMTP id d9443c01a7336-22e1e8eaf8dmr131629645ad.18.1746544456608;
        Tue, 06 May 2025 08:14:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:8d37:c5d1:328a:ee43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fa58sm75222545ad.150.2025.05.06.08.14.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:14:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/7] glibc: stable 2.39 branch updates
Date: Tue,  6 May 2025 08:13:56 -0700
Message-ID: <f14c2e6a6ba72673a0e30cde48ec1d5573be3e01.1746544207.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746544207.git.steve@sakoman.com>
References: <cover.1746544207.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216061

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

3463100f2d x86: Detect Intel Diamond Rapids
e09436c2cb x86: Handle unknown Intel processor with default tuning
7620d98186 x86: Add ARL/PTL/CWF model detection support
765ff3d0d4 x86: Optimize xstate size calculation
65ae73be01 x86: Use `Avoid_Non_Temporal_Memset` to control non-temporal path
2be36448c4 x86: Tunables may incorrectly set Prefer_PMINUB_for_stringop (bug 32047)
bde201e92c x86: Disable non-temporal memset on Skylake Server
38a7632f2d x86: Fix value for `x86_memset_non_temporal_threshold` when it is undesirable
cc59fa5dbc x86: Enable non-temporal memset tunable for AMD
0da58e8be0 x86: Add seperate non-temporal tunable for memset
837a36c371 x86: Link tst-gnu2-tls2-x86-noxsave{,c,xsavec} with libpthread
87ab0c7f7f x86: Use separate variable for TLSDESC XSAVE/XSAVEC state size (bug 32810)
60cd7123a6 x86: Skip XSAVE state size reset if ISA level requires XSAVE
4cf3f9df54 x86_64: Add atanh with FMA
01ed435e2e x86_64: Add sinh with FMA
0edcc77fe7 x86_64: Add tanh with FMA
7ecf0d3bde x86-64: Exclude FMA4 IFUNC functions for -mapxf
e1fe22368e nptl: clear the whole rseq area before registration
dd8c0c3bbd math: Improve layout of exp/exp10 data
a1b09e59e2 AArch64: Use prefer_sve_ifuncs for SVE memset
d0e2133470 AArch64: Add SVE memset
0cc12d9c47 math: Improve layout of expf data
0cd10047bf AArch64: Remove zva_128 from memset
dd1e63ab58 AArch64: Optimize memset
65a96a6f2b AArch64: Improve generic strlen
4073e4ee2c AArch64: Improve codegen for SVE logs
78abd3ef6e AArch64: Improve codegen in SVE tans
a10183b633 AArch64: Improve codegen of AdvSIMD atan(2)(f)
dcd1229e5b AArch64: Improve codegen of AdvSIMD logf function family
72156cb90b AArch64: Improve codegen in AdvSIMD logs
5e354bf4e2 AArch64: Simplify rounding-multiply pattern in several AdvSIMD routines
80df456112 aarch64: Avoid redundant MOVs in AdvSIMD F32 logs
d591876303 aarch64: Fix AdvSIMD libmvec routines for big-endian
f6d48470ae assert: Add test for CVE-2025-0395

Testresults:
Before update	|After update	 |Difference
PASS: 5068	|PASS: 5072	 |PASS: +4
FAIL: 120	|FAIL: 120	 |FAIL: 0
XPASS: 4	|XPASS: 4	 |XPASS: 0
XFAIL: 16	|XFAIL: 16	 |XFAIL: 0
UNSUPPORTED: 157|UNSUPPORTED: 157|UNSUPPORTED: 0

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index da9227ccca..040fc793b1 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "662516aca8b6bf6aa6555f471055d5eb512b1ddc"
+SRCREV_glibc ?= "3463100f2d47f2897a24ba8023a5c7aaf2d26550"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0



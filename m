Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C63FC54E71
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 19:48:44 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.418.1747770515266680464
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 12:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tqAgFN97;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30e8a968b15so3928296a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 12:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747770514; x=1748375314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHnmbjVjYlELC6ouB9i1m+SNnJdm2CV+Y5kS3h2LDlE=;
        b=tqAgFN97PWkjegm65XfHoQ7mJDm7FF3vvsFhQNfocUzFZhkh9N0PmdGZ1o/ifHcf3A
         CJlVpB9WqsKFg0ENcYEsHFnM/Udu6uKAIkGuWOrbUChWcYy/AvunnsPc4zfQvDzwtzqK
         Y7VdMrDSF0H9p/5TDZaebur71wXjUZ7ME3u38GnbLHxj9rdkt0RYfYT7GvOzJgBRlPua
         7sJq5fskJ4v1dO+8uB4kfHpBS3pT2BI0x+A+e7ogUpFLutik/8+8B+6hHZlqAHYUNWnl
         UDa80X/pryF0tyhqm3GiCrcPQQpGS3EphxJKw0SdQgv0a/eiZBeYtB+s3Yc+wxOi4Gkr
         PawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770514; x=1748375314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHnmbjVjYlELC6ouB9i1m+SNnJdm2CV+Y5kS3h2LDlE=;
        b=wIiWRcqNr6kDOABh4rqP1ZG5a2nn1tCFNTNL9oWdCSznGXNN4BJ6ruDUtvNHDkIA/J
         h6fZ5/7AAL83T1ABlHrGx3uoDIzxX6TIWB416N/9OW77tt8wpIc0Wz8uBvTo/TLGqFM5
         rSB2C5T+kSc0i6b25Oy5eOcwNMgEnN3OIZa5MEeShyTJLWBH+JiVrd3HxtFmH95XCpwN
         9KvDoC6eGeck9YJqYoipI3atZQKT66M1TDlmy6b2vChzPHCcT63HCssWCEbpOAEGSqCD
         1QM1y8zCkhJYQ7+Q9wTcY2XhGM1byUaSfgs+MwENGehJSAaAE+ttSwLgmM7q2CYwSo4c
         o4/g==
X-Gm-Message-State: AOJu0YwYgytfKFEXhrQlKJCUltRVYTMvzG4AdMI9NNbdlwOX7HCwNZl/
	FkesaMGbNe44klJs7SkyntymnluWuwiD0qeuHry+4YwMXDIu0BJvxAS5tD4eQ7GN/B72BRScV4N
	NX3Cn
X-Gm-Gg: ASbGncuLPejbJJiDM6ZzLzbGnzbppHQTyvVnqkUMgQg/7wh16sUZ16rfn/18VcAXkQH
	j5u1zi6eCGIxLbOiqWuJxhNXDxOkOSOfEkeJNq3MdAwat528MKUGwEaqjnCqVNEQadoRht24tAa
	P8onMGflFuElOmuZunLK5OA1gu48khcE7lGbHm4W0RXtxt4oL1n+eFBG6l+XyX5Xwm4l23RG6bG
	H0cSrZgpjUNmjgHtMhf05fBWDrIoCzZl9jbdrfFpjUJTYt8NrBrchHcJrtgC/P6Wu9iT38n8PdR
	woG0NMDdyjlMyHby80yr5ZV4ktwE3Vt+KRLYth9fNw==
X-Google-Smtp-Source: AGHT+IGM9ixYnGSmOg+ZmCQnpYPBzzGDtrpkqQYa5NiewhZUjixAeSoVISV5vXh6L6ihBvZLFruVCw==
X-Received: by 2002:a17:90a:c883:b0:2ee:e518:c1cb with SMTP id 98e67ed59e1d1-30e830c797dmr28298684a91.7.1747770514368;
        Tue, 20 May 2025 12:48:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:48df:296e:5350:93e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36386944sm2120772a91.14.2025.05.20.12.48.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:48:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 7/8] glibc: stable 2.41 branch update
Date: Tue, 20 May 2025 12:48:14 -0700
Message-ID: <f4b89ed2e8841b9091cc9a618440b6985b509c25.1747770224.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747770224.git.steve@sakoman.com>
References: <cover.1747770224.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 19:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216940

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on glibc-2.41 stable branch are updated.
5cb575ca9a elf: tst-audit10: split AVX512F code into dedicated functions [BZ #32882]
046b33800c x86: Detect Intel Diamond Rapids
a53e764657 x86: Handle unknown Intel processor with default tuning
aca31d2712 x86: Add ARL/PTL/CWF model detection support
f68b407d4b x86: Optimize xstate size calculation
d6d56af6e7 elf: Fix arm-linux-gnueabihf build break from b861755a84
b861755a84 elf: Extend glibc.rtld.execstack tunable to force executable stack (BZ 32653)
200d20123c x86: Link tst-gnu2-tls2-x86-noxsave{,c,xsavec} with libpthread
80cd656649 x86: Use separate variable for TLSDESC XSAVE/XSAVEC state size (bug 32810)
a282e2c0ae x86: Skip XSAVE state size reset if ISA level requires XSAVE
bcd4cf9d5f x86_64: Add atanh with FMA
7e72fa7577 x86_64: Add sinh with FMA
6a3a4a5e58 x86_64: Add tanh with FMA
ce9b765522 nptl: Check if thread is already terminated in sigcancel_handler (BZ 32782)
98c712855d nptl: PTHREAD_COND_INITIALIZER compatibility with pre-2.41 versions (bug 32786)
e22c132484 nptl: clear the whole rseq area before registration
33bfd9020f Linux: Remove attribute access from sched_getattr (bug 32781)
66fc3bd758 math: Remove an extra semicolon in math function declarations
1a3083b999 posix: Move environ helper variables next to environ definition (bug 32541)
91f8cff2c4 configure: Fix spelling of -Wl,--no-error-execstack option
fd202462c5 elf: Check if __attribute__ ((aligned (65536))) is supported
746ef8e939 static-pie: Skip the empty PT_LOAD segment at offset 0 [BZ #32763]
56609f8df1 Pass -Wl,--no-error-execstack for tests where -Wl,-z,execstack is used [PR32717]
89be78704e AArch64: Use prefer_sve_ifuncs for SVE memset
c47c3890f1 AArch64: Add SVE memset
e0bc5f64ea math: Improve layout of exp/exp10 data
009c5a2dca aarch64: Add GCS test with signal handler
8d98ee8d70 aarch64: Add GCS tests for dlopen
61ba3cdfa9 aarch64: Add GCS tests for transitive dependencies
fda5730898 aarch64: Add tests for Guarded Control Stack
6d1f97bb06 aarch64: Add configure checks for GCS support
7774a9d07a AArch64: Improve codegen for SVE powf
2025e27a81 AArch64: Improve codegen for SVE pow
f3d9c116cb AArch64: Improve codegen for SVE erfcf
94859e8680 Aarch64: Improve codegen in SVE exp and users, and update expf_inline
7c9a086807 Aarch64: Improve codegen in SVE asinh
30992cb5e9 RISC-V: Fix IFUNC resolver cannot access gp pointer
07288c7445 math: Add optimization barrier to ensure a1 + u.d is not reused [BZ #30664]
2cb04444b9 math: Fix `unknown type name '__float128'` for clang 3.4 to 3.8.1 (bug 32694)
a900dbaf70 x86 (__HAVE_FLOAT128): Defined to 0 for Intel SYCL compiler [BZ #32723]
1e0e33e1b1 Fix tst-aarch64-pkey to handle ENOSPC as not supported
69fda28279 assert: Add test for CVE-2025-0395
cf88351b68 math: Fix tanf for some inputs (BZ 32630)
cb7f206537 nptl: Correct stack size attribute when stack grows up [BZ #32574]
d85a771953 math: Fix sinhf for some inputs (BZ 32627)
bdccbfbc52 math: Fix log10p1f internal table value (BZ 32626)

Testresults:
Before update	|After update	 |Difference
PASS:  5816	|PASS:  5826	 |PASS: +10
FAIL:  239	|FAIL:  239	 |FAIL:  0
XPASS: 4	|XPASS: 4	 |XPASS: 0
XFAIL: 16	|XFAIL: 16	 |XFAIL: 0
UNSUPPORTED: 164|UNSUPPORTED: 164|UNSUPPORTED: 0

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 4d28affed9..d84106fb95 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "0a7c7a3e283a55d1bfaa48fdef063a32a4689a2b"
+SRCREV_glibc ?= "5b4c4617016d28569106549dff6f9fec73eed5ce"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0



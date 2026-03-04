Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16549EFCE38
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 18:29:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25510.1772648930103436447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 10:28:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vIpH3cAU;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F2DE34E42507;
	Wed,  4 Mar 2026 18:28:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7C085FF5C;
	Wed,  4 Mar 2026 18:28:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A28B610368740;
	Wed,  4 Mar 2026 19:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772648927; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yOfD5SZ6MIiJqQbHhJwkBJvw5TuIclIfn0HwugGQiLM=;
	b=vIpH3cAUCpqHpcApLj36fyp1ej34faD/FJQs+0OQg8ab82lHVhX1PS5UMCQbGoShHBGHUP
	PuMUCjYuiYtcrOT3iCCR3YOXDD7UH+qsla2d8feuc4wdmFF36rLXXDGuMcfrnihrOzoxTB
	EL1jxVPT9jMqrNtCirCmpbGuvruv9vZCja7i2ksGphnOqfZ3IZpsCDx+iuGrHFh1up2gC1
	5zdq5y0a9LjdpHVOaQZ+tfy6Xe6e71FmiTg03fbLocawVmJi6ptdpzquCpnwsgXVLLkXBI
	q8GqmKETPFeQUIn1wEFPgIyJj2dTLxUnOmk9whp5hlMkKVZiKBZZKkkF4Z/r+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 19:28:39 +0100
Message-Id: <DGU7LJD9WY7B.3HPRQY4TB93YO@bootlin.com>
Subject: Re: [OE-core] [PATCH V3 0/4] Oe-selftest for Clang, LLVM, LLD
Cc: <Randy.Macleod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260302104314.301665-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260302104314.301665-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 18:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232433

On Mon Mar 2, 2026 at 11:43 AM CET, Deepesh via lists.openembedded.org Vara=
tharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> This patch series introduces a test framework to run selftests for
> target builds of Clang, LLVM, and LLD.
>
> v3 changes:
> - llvm_sysroot_preprocess_testsuite function needs be added to=20
>   llvm:class-target not llvm:class-nativesdk.
>
> v2 changes:
> - Enable required CMake flags only when running the testsuite.
> - Ensure default build time and package sizes remain unaffected.
>
> Summary of changes:
> -Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
>           detect the llvm-bcanalyzer target.
> -Patch 2: Enabled the necessary CMake flags for clang, llvm & lld tests
>           when CLANG_ENABLE_TESTSUITE is set to "1".
> -Patch 3: Selftest script for Clang, LLVM, and LLD including exclude list
> -Patch 4: Fix rust build failure by replacing target llvm-config with nat=
ive
>

Hi Deepesh,

Thanks for the new version.

While it runs correctly on the autobuilder, I'm noting it takes quite a
bit of time to run the tests. I'm not really against merging them, I
just want:
- to make everybody aware of that.
- to confirm with you these are some expected timings.

Taking some random build in my branch:

2026-03-03 21:20:21,805 - oe-selftest - INFO - clang.LLDSelfTestSystemEmula=
ted.test_lld (subunit.RemotedTestCase)
2026-03-03 21:20:21,805 - oe-selftest - INFO -  ... ok
2026-03-03 21:20:21,805 - oe-selftest - INFO - 2: 1/1 18/21 (7205.57s) (0 f=
ailed) (clang.LLDSelfTestSystemEmulated.test_lld)
...
2026-03-04 00:56:44,671 - oe-selftest - INFO - clang.ClangSelfTestSystemEmu=
lated.test_clang (subunit.RemotedTestCase)
2026-03-04 00:56:44,671 - oe-selftest - INFO -  ... ok
2026-03-04 00:56:44,671 - oe-selftest - INFO - 1: 1/1 20/21 (20188.43s) (0 =
failed) (clang.ClangSelfTestSystemEmulated.test_clang)
2026-03-04 01:37:34,036 - oe-selftest - INFO - clang.LLVMSelfTestSystemEmul=
ated.test_llvm (subunit.RemotedTestCase)
2026-03-04 01:37:34,036 - oe-selftest - INFO -  ... ok
2026-03-04 01:37:34,036 - oe-selftest - INFO - 3: 1/1 21/21 (22637.80s) (0 =
failed) (clang.LLVMSelfTestSystemEmulated.test_llvm)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3230

So first, we only had a few builds so far, maybe we just were a bit
unlucky (looking at the test, I believe sstate will not have any impact
in later builds). Also we already had some quite long tests in there,
but in some builds the test_clang / test_llvm really seems to take a
longer time.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



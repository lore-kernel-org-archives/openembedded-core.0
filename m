Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3910CEEF30C
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 06:37:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38655.1772692647975822400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 22:37:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k1SUmyYg;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D23E74E42558;
	Thu,  5 Mar 2026 06:37:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8BBFC5FDEB;
	Thu,  5 Mar 2026 06:37:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52CFF1036981D;
	Thu,  5 Mar 2026 07:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772692644; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hqwjDSE8lfjKTc0K1U0AVUaW5u9UUSw4KnrSEXgCslQ=;
	b=k1SUmyYg/5bHi+jtg2tgIEHkNLUSjfNsHWgdHpN6w1Sx+vB6ACMCibZCDaqkhw6kxyIyrM
	BeOsVEFbUp6H2n4xFIeQEBne9xlfffirzShOF7DKJ4vvk6c2R2GToi1WN7OM2V58/GCudY
	ec88WtY5zROoE29azTDGk4VLllN46n5lj5XVL5kFbtIhqCLjhnWshxh6ZQo4Ob1mW035UC
	9B6fLfFcnK30ordVQ1njKYfKpSYWPrF/52WKYOF+Mu1JGL6GmAYBxbTG/8eJEhu/p+mOnl
	X7HgzzW3Juc2X2Z4OXkSs9Y+g6abYoYhgMtdRjpcEzmUFGkduQpztOJIgx64+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 07:37:17 +0100
Message-Id: <DGUN3FDKQET4.34XM6M0JXC826@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V3 0/4] Oe-selftest for Clang, LLVM, LLD
Cc: <Randy.Macleod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260302104314.301665-1-Deepesh.Varatharajan@windriver.com>
 <DGU7LJD9WY7B.3HPRQY4TB93YO@bootlin.com>
In-Reply-To: <DGU7LJD9WY7B.3HPRQY4TB93YO@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 06:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232447

On Wed Mar 4, 2026 at 7:28 PM CET, Mathieu Dubois-Briand wrote:
> On Mon Mar 2, 2026 at 11:43 AM CET, Deepesh via lists.openembedded.org Va=
ratharajan wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> This patch series introduces a test framework to run selftests for
>> target builds of Clang, LLVM, and LLD.
>>
>> v3 changes:
>> - llvm_sysroot_preprocess_testsuite function needs be added to=20
>>   llvm:class-target not llvm:class-nativesdk.
>>
>> v2 changes:
>> - Enable required CMake flags only when running the testsuite.
>> - Ensure default build time and package sizes remain unaffected.
>>
>> Summary of changes:
>> -Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
>>           detect the llvm-bcanalyzer target.
>> -Patch 2: Enabled the necessary CMake flags for clang, llvm & lld tests
>>           when CLANG_ENABLE_TESTSUITE is set to "1".
>> -Patch 3: Selftest script for Clang, LLVM, and LLD including exclude lis=
t
>> -Patch 4: Fix rust build failure by replacing target llvm-config with na=
tive
>>
>
> Hi Deepesh,
>
> Thanks for the new version.
>
> While it runs correctly on the autobuilder, I'm noting it takes quite a
> bit of time to run the tests. I'm not really against merging them, I
> just want:
> - to make everybody aware of that.
> - to confirm with you these are some expected timings.
>
> Taking some random build in my branch:
>
> 2026-03-03 21:20:21,805 - oe-selftest - INFO - clang.LLDSelfTestSystemEmu=
lated.test_lld (subunit.RemotedTestCase)
> 2026-03-03 21:20:21,805 - oe-selftest - INFO -  ... ok
> 2026-03-03 21:20:21,805 - oe-selftest - INFO - 2: 1/1 18/21 (7205.57s) (0=
 failed) (clang.LLDSelfTestSystemEmulated.test_lld)
> ...
> 2026-03-04 00:56:44,671 - oe-selftest - INFO - clang.ClangSelfTestSystemE=
mulated.test_clang (subunit.RemotedTestCase)
> 2026-03-04 00:56:44,671 - oe-selftest - INFO -  ... ok
> 2026-03-04 00:56:44,671 - oe-selftest - INFO - 1: 1/1 20/21 (20188.43s) (=
0 failed) (clang.ClangSelfTestSystemEmulated.test_clang)
> 2026-03-04 01:37:34,036 - oe-selftest - INFO - clang.LLVMSelfTestSystemEm=
ulated.test_llvm (subunit.RemotedTestCase)
> 2026-03-04 01:37:34,036 - oe-selftest - INFO -  ... ok
> 2026-03-04 01:37:34,036 - oe-selftest - INFO - 3: 1/1 21/21 (22637.80s) (=
0 failed) (clang.LLVMSelfTestSystemEmulated.test_llvm)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3230
>
> So first, we only had a few builds so far, maybe we just were a bit
> unlucky (looking at the test, I believe sstate will not have any impact
> in later builds). Also we already had some quite long tests in there,
> but in some builds the test_clang / test_llvm really seems to take a
> longer time.
>
> Thanks,
> Mathieu

I'm only realizing now, this series is also linked with this intermitent
issue: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16188.

We should probably keep it aside for a few days, until we get something
better.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



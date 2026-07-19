Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFA7C44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 05:51:48 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.697.1784440306200628553
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 22:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MFxxTC4s;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EBF621A10D2
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 05:51:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B244E601A5;
	Sun, 19 Jul 2026 05:51:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8656A11BD0C60;
	Sun, 19 Jul 2026 07:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784440303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1FHSqM39xrC6oTBn8MbXNm4xrFpNKXcOAvXFCq1zD6g=;
	b=MFxxTC4sQyCU792BaIHEPokI6hEJCBltIsuBsnurxrWSfyNxoLos5zb2QUYdQZAdm+cyQs
	vQBArb56oKhy/cj2mK/MrQX5ZsGDHHRyubslNmJUu5Q7F1GLZECVvG2DurmmZ5TnvMOiuW
	0bvIv/bxa061Pa4KKwV2dskUxLoOKHBn3MstHi+eTa1SRYPLECm9OmPwaxNYXeGW4xCYc8
	H5j8E7PfcYQhJT0vzDc6qFiAkHuNDq+uBvmFyDzU5EpJh/tOBMi75alFOQpEUwI4Hq2UOx
	X0/grjhhwDfl5Jw8DJtLD5+gSfVBP0UQKrSUBCMi9xTWLsAOVsFzKvP2GrpaMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 07:51:40 +0200
Message-Id: <DK2BAKXVNU4Q.2RBGX6QVYNC1D@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/3 v6] Oe-selftest for Clang, LLVM, LLD
Cc: <Sundeep.Kokkonda@windriver.com>, <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 05:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241274

On Wed Jul 15, 2026 at 8:00 AM CEST, Deepesh via lists.openembedded.org Var=
atharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> This patch series introduces a test framework to run selftests for
> target builds of Clang, LLVM, and LLD.
>

Hi Deepesh,

It looks like some tests are failing intermittently:

2026-07-18 18:06:49,355 - oe-selftest - INFO - 3: 1/1 20/21 (3039.16s) (0 f=
ailed) (clang.LLVMSelfTestSystemEmulated.test_llvm)
2026-07-18 18:06:49,355 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/openembedded-co=
re/meta/lib/oeqa/selftest/cases/clang.py", line 195, in test_llvm
    raise AssertionError(f"llvm-lit failed for LLVM: {output}")
AssertionError: llvm-lit failed for LLVM: -- Testing: 23802 of 60668 tests,=
 4 workers --
...
XFAIL: LLVM :: Analysis/DDG/basic-loopnest.ll (287 of 23802)
...
XFAIL: LLVM :: Analysis/DependenceAnalysis/Invariant.ll (338 of 23802)
...
XFAIL: LLVM :: Analysis/ScalarEvolution/2008-12-14-StrideAndSigned.ll (699 =
of 23802)
...
XFAIL: LLVM :: Bitcode/upgrade-datalayout2.ll (1749 of 23802)
...


https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/4122
https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/4120
https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/4120
https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/4125

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CD5C61DD3
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 08:23:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16522.1771662202848281298
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 00:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IHFrwn9L;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E8BF9C16557;
	Sat, 21 Feb 2026 08:23:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92C0A5FB54;
	Sat, 21 Feb 2026 08:23:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6CBB610368C40;
	Sat, 21 Feb 2026 09:23:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771662199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5Rfh+R5SIlA0TRoSxzpv6gVYGWgYxjvINIxj6+4peNM=;
	b=IHFrwn9LppEXwat8XEwB/AHgL34vOiBrqpJdRjm3RXQDrGFadLhWIpesxgK35op7INd3YP
	Y4N1Dr9JUlA1zn5h0z2x6u+I3xOXuS5xBV09vdDv+fIRGzfc7tsbEfMd1kTZthQc1+2yks
	ez4h3N3sVXr6AJdDaaKZoWAoyWfqcd1e795wn40TsrygkPPflGhk/Tys2JaOkt7BD5F7xn
	67FcfEVqkEqRgesS/+k39lFdQnvUpXHVrG1u0YmExw0CZAhafG45/+KSerDAUGLA1sa2po
	EOG4WW7dkh+UlshBBiGVg1rve6ezDyrQZNqvzAdg61sjgTKh2u+axHO2ir1l2Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 09:23:15 +0100
Message-Id: <DGKHU0R6V881.3PN6D4V3SHOUB@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/4] Oe-selftest for Clang, LLVM, LLD
Cc: <Sundeep.Kokkonda@windriver.com>, <Deepesh.Varatharajan@windriver.com>,
 <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260220060252.77248-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260220060252.77248-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231605

On Fri Feb 20, 2026 at 7:02 AM CET, Deepesh via lists.openembedded.org Vara=
tharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> This patch series introduces a test framework to run selftests for
> target builds of Clang, LLVM, and LLD.
>
> Summary of changes:
> -Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
>           detect the llvm-bcanalyzer target.
> -Patch 2: Enabled the necessary CMake flags for clang, llvm & lld tests
> -Patch 3: Selftest script for Clang, LLVM, and LLD including exclude list
> -Patch 4: Fix rust build failure by replacing target llvm-config with nat=
ive
>
> Testing:
> 1. The test suite has been successfully validated on x86-64, arm64, riscv=
64
> and arm32 for all Clang, LLD & LLVM components.
> 2. Clang and LLD tests passed successfully on x86. LLVM tests are skipped
> on x86 since it's broken. A follow-up bug will be filed and addressed.
> 3. Clang, LLVM & LLD all together ~80K tests are there and we currently
> ~250 tests to exclude list which are failing (0.32%).
>
> Impact on build time:
> These builds were executed in a controlled environment without poky-sstat=
e
> enabled.
>
> Default(without changes):
> |  Target   | Run 1      | Run 2      | Run 3      |    Average     |
> | --------- | ---------- | ---------- | ---------- | -------------- |
> |   llvm    | 22m18.441s | 22m31.905s | 22m23.718s |   22m24.688s   |
> |   clang   | 30m09.774s | 30m22.680s | 30m15.312s |   30m15.922s   |
> |   lld     | 1m26.994s  | 1m30.415s  | 1m29.006s  |   1m28.805s    |
>
> With the testsuite changes applied:
> |  Target   | Run 1      | Run 2      | Run 3      |    Average     |
> | --------- | ---------- | ---------- | ---------- | -------------- |
> |   llvm    | 23m32.104s | 23m45.887s | 23m38.157s |   23m38.716s   |
> |   clang   | 30m31.402s | 30m46.198s | 30m39.445s |   30m39.015s   |
> |   lld     | 1m29.845s  | 1m34.212s  | 1m31.925s  |   1m31.994s    |
>
> Comparison:
> |  Target   | Default Avg | With Changes Avg |     **Diff**     |
> | --------- | ----------- | ---------------- | ---------------- |
> |   llvm    | 22m24.688s  | 23m38.716s       |   +1m14.028s     |
> |   clang   | 30m15.922s  | 30m39.015s       |   +0m23.093s     |
> |   lld     | 1m28.805s   | 1m31.994s        |   +0m3.189s      |
>
> Impact on tmpdir size:
> | Metric                               | Size  |
> | ------------------------------------ | ----- |
> | Default target `tmpdir` size         | 74 GB |
> | Target `tmpdir` size (after changes) | 79 GB |
> | Difference                           | +5 GB |
>
> Deepesh Varatharajan (4):

Hi Deepesh,

It looks like some selftests are failing:

2026-02-20 20:32:17,178 - oe-selftest - INFO - clang.LLVMSelfTestSystemEmul=
ated.test_llvm (subunit.RemotedTestCase)
2026-02-20 20:32:17,179 - oe-selftest - INFO -  ... FAIL
...
2026-02-20 20:32:17,179 - oe-selftest - INFO - 3: 1/1 8/21 (298.44s) (0 fai=
led) (clang.LLVMSelfTestSystemEmulated.test_llvm)
2026-02-20 20:32:17,179 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/openembedded=
-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/openembedded=
-core/meta/lib/oeqa/selftest/cases/clang.py", line 184, in test_llvm
    raise AssertionError(f"llvm-lit failed for LLVM: {output}")
AssertionError: llvm-lit failed for LLVM: sh: cd: line 0: can't cd to /srv/=
pokybuild/yocto-worker/qemux86-64-tc/build/build-st-177928/tmp/work/x86-64-=
v3-poky-linux/llvm/21.1.8/build/bin: No such file or directory
...
2026-02-20 20:32:20,596 - oe-selftest - INFO - clang.LLDSelfTestSystemEmula=
ted.test_lld (subunit.RemotedTestCase)
2026-02-20 20:32:20,597 - oe-selftest - INFO -  ... FAIL
...
2026-02-20 20:32:20,814 - oe-selftest - INFO - clang.ClangSelfTestSystemEmu=
lated.test_clang (subunit.RemotedTestCase)
2026-02-20 20:32:20,815 - oe-selftest - INFO -  ... FAIL

https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/3243
https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/1069
https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3147
https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/3165
https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3151

Can you have a look at these failures?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



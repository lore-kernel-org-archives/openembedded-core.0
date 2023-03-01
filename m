Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24329C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 07:58:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.17087.1677657485325042651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 23:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h47ryfqE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4A4776000A;
	Wed,  1 Mar 2023 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677657483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J+Vm0AG1EZ33L1f5c3ldevR4R8bE5jvvZ//kjQwUZ0A=;
	b=h47ryfqEjqZOoBYGao7oCuhFOKkIy7gorgp9HcDjLUxu6P5nbVQnkD4188SJe/At75+StS
	3+LtG7RnyfxzwuSPR084GXSd68x01QDD1tZgvDAj4DX+fNlLUHGf2dyEOJNGYKLq8hlIKG
	+etC/ObT5814U8XwDIIu4vmQ3nJwzNnxEYIsttxUGS/f7JwfJQaT47WQwj6TlhbakQFfhS
	2dYGsETRvLkgoJTpqQBhPEv2ifOG+KFNISlTrsFa87EblPg9QCoYRjNabErQMABHY88Yff
	FmE2dfTeDOhZrFBZM+MPmZ0NGGcOEKTDBoPveUe7H8eCPwI8fTUisT51oKEMCw==
Message-ID: <5c1dc268-86e9-1d89-d5f0-2eac2c4157cd@bootlin.com>
Date: Wed, 1 Mar 2023 08:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [OE-core] [PATCH 0/6] keep reducing regression reports noise
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org,
 thomas.petazzoni@bootlin.com
References: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
 <CANx9H-CphQSxUqc_y2_YPHnhyTBxQKuSn25bHeiYRs79fckDow@mail.gmail.com>
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <CANx9H-CphQSxUqc_y2_YPHnhyTBxQKuSn25bHeiYRs79fckDow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 07:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177871

Hello Tim,
On 3/1/23 07:24, Tim Orling wrote:

> On Tue, Feb 28, 2023 at 10:10 AM Alexis Lothoré via lists.openembedded.org
> <http://lists.openembedded.org>
> <alexis.lothore=bootlin.com@lists.openembedded.org
> <mailto:bootlin.com@lists.openembedded.org>> wrote:
> 
>     From: Alexis Lothoré <alexis.lothore@bootlin.com
>     <mailto:alexis.lothore@bootlin.com>>
> 
>     Hello,
>     here is another batch of fixes to reduce noise in regression reports. Fixes are
>     directly linked to main noise sources seen in 4.2_M3 regression report ([1]).
>     - fix some existing selftests for resulttool
>     - add more filters for ptests incorrectly logging failures. The root cause of
>       those wrongly named test results remained to be fixed to stop saving broken
>       test results, but this series fixes at least parsing for existing results
>     - Stop logging "newly passing" tests in regression reports. Some real
>       regressions are "hidden" in big chunks of newly passing tests:
>     foo: FAIL -> PASS
>     bar: FAIL -> PASS
>     moo: FAIL -> PASS
>     [...]
>     xxx: PASS -> FAIL
>     [...]
>     yyy: FAIL -> PASS
>     zzz: FAIL -> PASS
> 
>     We are reaching a point where regression reports are small enough to get posted
>     on pastebin, so by following [2] you can find a report sample generated with
>     tooling patched with this series
> 
>     [1] https://autobuilder.yocto.io/pub/releases/yocto-4.2_M3.rc1/t
>     <https://autobuilder.yocto.io/pub/releases/yocto-4.2_M3.rc1/testresults/testresult-regressions-report.txt>
> 
> 
> It seems a bit odd that all the regressions are changing from a valid state
> (PASS, SKIP…) -> None. Does this literally mean the only changes were dropped
> test cases?

For most of "XXX -> None" transitions in the 4.2_M3.rc1 regression report, tests
were not dropped between base and target tests, they are present in both, but
the test names saved and stored in git are incorrect and bear a "non
reproducible" part, which makes the tooling raise many of those wrong
transitions. Here is an example:

ptestresult.binutils-ld.in testcase
/home/pokybuild/yocto-worker/qemux86/build/build-st-15167/tmp/work/core2-32-poky-linux/binutils-cross-testsuite/2.40-r0/git/ld/testsuite/ld-ctf/ctf.exp:
ERROR -> None

This binutils-ld test result is present in both base and target results, but the
test name is very likely broken: the error has been captured as part of the test
name, and worse than than, it contains multiple parts that change between
executions (possibly "core2-32-poky-linux" and "qemux86", but especially
"build-st-15167") because of path embedded in the error log. So when running
"resulttool regression-git", the tool does not find in target the test it has
found in base, which raises a "XXX -> None".
Obviously the main issue has to be fixed in all runners generating those errors
(so far, we have seen this kind of issues with ptests for binutils, curl, dbus,
toolchains, glibc, etc), but since we want to be able to work with current tests
results history, we must make the tools able to circumvent those issues.

Regards,

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



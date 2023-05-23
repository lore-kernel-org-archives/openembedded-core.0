Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D143C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 15:37:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.1562.1684856227614881453
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 08:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EJazllHz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1E2EA1C000A;
	Tue, 23 May 2023 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684856225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpyMVd8MyoEw5gc1hEb8I49DSPxeumjrphw2H/lVJw0=;
	b=EJazllHziAamRAV9NCaNtzPf92QOXDwXGZ+uw8d53wwhcY6121a2GywxXDWBDqV2eaoAmt
	htfpFHASvyt41lxL/R3fFGH6poRy7h9ebSQuWoK1G3qTnYMPaZ7zSRIxu4Eut2xZdKx0ok
	nIBhUyC3TqtKFYj/3pFeEyc6U+DmiKqkdUUy/rY3hzcukmL+T2VfcVJJwaxi4F6oqoYSAn
	R/cP/V9Thc9rCNFFsjlN2IQvScED6NrMZxauUxrDs+B1g2JrAYDJfSABJx+nmzbKTp+KvB
	rJyPtlKTYpdXFHAf8MaXO4FZh5IpwJ0Li7y9dlE/juNWu5RkQqEdZHiWKqz2HQ==
Message-ID: <7a2089fa-980d-64b3-6a92-4380581c1985@bootlin.com>
Date: Tue, 23 May 2023 17:37:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [OE-core][RFC] tests artifacts retriever
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Openembedded-core@lists.openembedded.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <17617EDE5E1F7514.20228@lists.openembedded.org>
 <31d56f83-65b7-d52a-8312-89cccba421c1@bootlin.com>
 <CANNYZj-+b3YKjL2cxg7yKvTgpx1xSPJDRBrQmjbMrbWj1_FdQg@mail.gmail.com>
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <CANNYZj-+b3YKjL2cxg7yKvTgpx1xSPJDRBrQmjbMrbWj1_FdQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 15:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181641

Hello Alexander, thanks for the feedback

On 5/23/23 11:50, Alexander Kanavin wrote:
> I think having to write a custom artifacts.conf for each ptest is not
> a good direction, as it's both too much work, and requires good
> understanding what is important in the output and what isn't :) When a
> ptest fails, it would be enough to simply make a tarball of
> /usr/lib/component/ptest/ with everything in it. Maybe /tmp and
> /var/log as well.

Indeed, it can be tedious to write an artifacts conf file for each ptest.
If it is tolerable to get an archive of the whole ptest directory (+ possibly
/var/log and /tmp), we can go for it and fine-tune later if needed. In this
case, I could either keep artifacts.conf to list the directories we want for all
ptests, or completely drop it.

I will let this RFC run for more time before starting to implement something,
but if no one come back on this, I will apply your suggestion.

Kind regards,

> 
> Alex
> 
> On Mon, 22 May 2023 at 16:58, Alexis Lothoré via
> lists.openembedded.org
> <alexis.lothore=bootlin.com@lists.openembedded.org> wrote:
>>
>> On 5/22/23 16:52, Alexis Lothoré via lists.openembedded.org wrote:
>>> Hello everyone,
>>> I have been briefed about the need to add an infrastructure to be able to
>>> retrieve some test files (test output, logs, etc) in Yocto/CI
>>> automation to ease debugging of some hard-to-reproduce issues. Before
>>> starting to implement a solution, I would like to get some feedback about
>>> what I have understood from the original issue and what I propose to
>>> implement to improve this. Please find below my reflexions, feel free
>>> to comment, correct, enrich and/or approve.
>>>
>>> # Motivation
>>>
>>> Some test failures appearing in automatic testing can be hard to fix, based
>>> on too few informations from failing tests (see
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14901 ). Sometimes
>>> packages/binaries under test are able to generate more detailed output in a
>>> dedicated file, but there is actually no standardized way of retrieving
>>> such output files. There has been some custom efforts done to solve this issue
>>> for specific recipes, for example for lttng-tools tests :
>>> https://git.yoctoproject.org/poky/commit/?id=2ea27691aa57951aaba3cc1714a080a112d15408
>>>
>>> The goal of this RFC is to propose an architecture for a generic system which
>>> allows to retrieve an arbitrary list of files from a test run.
>>>
>>> # Use case example
>>>
>>> lttng-tools recipe provides LTTNG tools tests as ptests (see
>>> meta/recipes-kernel/lttng/lttng-tools/run-ptest) and generate some log
>>> files (error.log, test-suite.log), it would be convenient to retrieve those
>>> files.
>>>
>>> # Proposal
>>>
>>> - Introduce an "artifacts.conf" file
>>>   - this file contains a "files of interest" list to be retrieved onto
>>>     host after running ptests (exact format to be defined)
>>>   - artifacts.conf is specific to a ptest package and is stored next to
>>>     run-ptest script in package
>>>   - artifacts.conf contains, for each ptest package, the following
>>>     informations:
>>>     - name of file to retrieve
>>>   - artifacts.conf will be installed in target image (as for
>>>     package-specific run-ptest script)
>>>   - each ptest package MAY have an artifacts.conf file
>>> - When running ptests, for each available ptest, ptest-runner (on the
>>>   target) will read artifacts.conf if it exists, and retrieve
>>>   corresponding artifacts file in an artifacts directory, with one
>>>   subdirectory per ptest.
>>>   - Artifacts will be aggregated only if at least one test has a status
>>>     different from "PASS"
>>> - Once tests are finished, tests manager on host (ptest.py) will fetch
>>>   artifacts directory. It will put this directory alongside testresults
>>>   file on host
>>> - This mechanism will work for both real targets and emulated targets
>>>   (Qemu), and will based on SSH to transfer artifacts back to host
>>>
>>> # Additional questions
>>>
>>> - once retrieved from target, aside from default test results directory
>>>   (build/tmp/log/oeqa/<...>), where should we store artifacts ? For
>>>   automated testing, should we publish them alongside other test and
>>>   regression reports (in web server directory) ?
>>> - current proposal is focused on ptests: should I broaden the scope and
>>>   include all kind of runtime tests (as found in
>>>   meta/lib/oeqa/runtime/cases ?)
>>> - are there examples of tests producing files to retrieve with non-static
>>>   names (which will then require the artifacts.conf to be smarter) ?
>>>
>>
>> Fixing Alexandre Belloni's address in CC, sorry for the noise
>>
>> --
>> Alexis Lothoré, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#181597): https://lists.openembedded.org/g/openembedded-core/message/181597
>> Mute This Topic: https://lists.openembedded.org/mt/99066378/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



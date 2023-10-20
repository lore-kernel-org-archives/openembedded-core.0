Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D81CDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 06:31:46 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.48875.1697783500360340670
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 23:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eVMOj/+E;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84214C0006;
	Fri, 20 Oct 2023 06:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697783497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0jRnJosX5YvNXciRXhdnqVWpCiiSqxaQ4kYAKOIV7c=;
	b=eVMOj/+ELTy6LL6xaroP8O1V/BhZvb/U8s4yx8GtJbWJJiETyzLkTN3/KeoF8eQF8aza0l
	ELJm9sBnv6PEwPRSiw/cCB68cfZZ/mI1eTatsQDbb65ou2+ic8HmZ6Swns/rRfOyPMbHhG
	grAMGUMsIH0vp+wvYNat16WXY8hVeul+RkW+C+vdkdVlOf7/28DthB9K6jMzU33Sq7Z+at
	TFLz+PBGy225fFlBEU6xHb4I/+8LioCua4D981w/16b1vNiox3cXs8T5wY5ufJ9yOnEIdr
	Ip4ZBLK7YpdjmTeSLvXrU3j4JKGw15sGMe9t0JkrMREZCGgC9qLrwRB5djq78w==
Message-ID: <2d64155c-15b4-4a61-b39e-c2c3b9afc410@bootlin.com>
Date: Fri, 20 Oct 2023 08:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH 0/2] Add a display limit for regression report
 generation
To: alexandre.belloni@bootlin.com
Cc: Openembedded-core@lists.openembedded.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231019095352.25923-1-alexis.lothore@bootlin.com>
 <20231020060513c625e441@mail.local>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <20231020060513c625e441@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 06:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189498

Hello Alexandre,

On 10/20/23 08:05, Alexandre Belloni via lists.openembedded.org wrote:
> Hello Alexis,> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5886/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5935/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5952/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5936/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2296/steps/14/logs/stdio
> 
> 
> 2023-10-19 07:28:44,229 - oe-selftest - INFO - resulttooltests.ResultToolTests.test_can_match_non_static_ptest_names (subunit.RemotedTestCase)
> 2023-10-19 07:28:44,229 - oe-selftest - INFO -  ... ERROR
> Stderr:
> 2023-10-19 07:05:57,080 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-271681/conf/local.conf
> 2023-10-19 07:05:57,081 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
> 2023-10-19 07:28:44,229 - oe-selftest - INFO - 6: 24/42 185/543 (0.01s) (0 failed) (resulttooltests.ResultToolTests.test_can_match_non_static_ptest_names)
> 2023-10-19 07:28:44,230 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/resulttooltests.py", line 372, in test_can_match_non_static_ptest_names
>     result, resultstring = regression.compare_result(
>                            ^^^^^^^^^^^^^^^^^^^^^^^^^^
> TypeError: compare_result() missing 1 required positional argument: 'display_limit'

Looks like I forgot to update/run selftests locally before pushing... Sorry for
the mess and thanks for the notification.
Anyway, Ross and Richard gave some relevant feedback
(https://lore.kernel.org/yocto/90D7FE40-32EB-4D67-B099-9E0C764FC258@arm.com/) on
this so I will prepare a v2, which fill also fix this selftest.

Thanks,

Alexis
-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



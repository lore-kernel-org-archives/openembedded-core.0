Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24845CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 06:05:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.48665.1697781916139340475
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 23:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GvY6AbXC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFBC360007;
	Fri, 20 Oct 2023 06:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697781914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JymVbwXW6Aanj1em51RRTNns/FVrgIKrbEO0Gsxhc4k=;
	b=GvY6AbXC0DUqTMeD1cz78jGvhTXQUZu1DLBm54RjjFYZ5vOXRYrX0fg4fCvuHjc/p95GpP
	k5XftbjySX4UlVCKA1vZn/xGees30IPmUSHedhjRT2yTMdd8oi0ZizrussZRHLqSuTpzXb
	rErWlC+UrIoJPOJnbi+O3o6HfZvgw8ZI0R92R8qkzEH48fLH2pQat+KUqZsQdoLl9IjASo
	a9/nxRVRnkp8ri6Ib7uXGrhT/67OV/8OqPy1PUBFRtKP/mXpUxk+fLhsj/O01Snv+8rE53
	GTzrcFeU7pzU7X6YLJLWDdfoR3AZgAT/Wm/zIcNRzeDXMR/99CCiMfloW8KE+Q==
Date: Fri, 20 Oct 2023 08:05:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: alexis.lothore@bootlin.com
Cc: Openembedded-core@lists.openembedded.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [OE-Core][PATCH 0/2] Add a display limit for regression report
 generation
Message-ID: <20231020060513c625e441@mail.local>
References: <20231019095352.25923-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231019095352.25923-1-alexis.lothore@bootlin.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 06:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189497

Hello Alexis,

On 19/10/2023 11:53:50+0200, Alexis Lothor� via lists.openembedded.org wrote:
> It has been observed that useful information in regression report can be
> drowned in huge regression lists which are often false-positives (for
> example, a whole set of tests has been temporarily disabled).
> 
> This series brings a default limit to how many changes are displayed per
> base/target comparison. This default can still be overriden on commandline,
> for example to have a better look at the whole regression list when trying
> to debug an issue (i.e. by disabling the limit)
> 
> First commit implement the limit, its default value and the corresponding
> commandline option in resulttool.
> Second commit allow yocto_testresults_query.py to drive this value.
> 
> As a result, one can for example do the following:
> - yocto_testresults_query 4.3_M1 4.3_M2
>   -> will display at most 50 regressions per test
> - yocto_testresults_query -l 10 4.3_M1 4.3_M2
>   -> override the display limit and reduce it to 10 regressions per pair.
> - yocto_testresults_query -l 0 4.3_M1 4.3_M2
>   -> disable the display limit, print all regressions
> 
> An example of regression report with display limit can be found here:
> https://pastebin.com/6QbfGstR
> 
> Alexis Lothor� (2):
>   scripts/resulttool: limit the number of changes displayed per test
>   scripts/yocto_testresults_query: add option to change display limit
> 

This causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5886/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5935/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5952/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5936/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2296/steps/14/logs/stdio


2023-10-19 07:28:44,229 - oe-selftest - INFO - resulttooltests.ResultToolTests.test_can_match_non_static_ptest_names (subunit.RemotedTestCase)
2023-10-19 07:28:44,229 - oe-selftest - INFO -  ... ERROR
Stderr:
2023-10-19 07:05:57,080 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-271681/conf/local.conf
2023-10-19 07:05:57,081 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2023-10-19 07:28:44,229 - oe-selftest - INFO - 6: 24/42 185/543 (0.01s) (0 failed) (resulttooltests.ResultToolTests.test_can_match_non_static_ptest_names)
2023-10-19 07:28:44,230 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/resulttooltests.py", line 372, in test_can_match_non_static_ptest_names
    result, resultstring = regression.compare_result(
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: compare_result() missing 1 required positional argument: 'display_limit'


2023-10-19 07:28:44,311 - oe-selftest - INFO - resulttooltests.ResultToolTests.test_regression_can_get_regression_result (subunit.RemotedTestCase)
2023-10-19 07:28:44,311 - oe-selftest - INFO -  ... ERROR
Stderr:
2023-10-19 07:05:57,080 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-271681/conf/local.conf
2023-10-19 07:05:57,081 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2023-10-19 07:28:44,312 - oe-selftest - INFO - 6: 31/42 192/543 (0.01s) (2 failed) (resulttooltests.ResultToolTests.test_regression_can_get_regression_result)
2023-10-19 07:28:44,312 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/resulttooltests.py", line 85, in test_regression_can_get_regression_result
    result, text = regression.compare_result(self.logger, "BaseTestRunName", "TargetTestRunName", base_result_data, target_result_data)
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: compare_result() missing 1 required positional argument: 'display_limit'


>  scripts/lib/resulttool/regression.py | 23 +++++++++++++++++++----
>  scripts/yocto_testresults_query.py   | 13 ++++++++++---
>  2 files changed, 29 insertions(+), 7 deletions(-)
> 
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189440): https://lists.openembedded.org/g/openembedded-core/message/189440
> Mute This Topic: https://lists.openembedded.org/mt/102057050/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


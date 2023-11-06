Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448B7C4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 21:19:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.67561.1699305584248737477
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 13:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eFi5/1gv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16F0AFF805;
	Mon,  6 Nov 2023 21:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699305581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f5zivQ6ll0Bq6n9yQ6w5ONiqXEy8vcdZDsWZAp64jqM=;
	b=eFi5/1gvMygzR/aQSmJdZgWfb9lygPPhNgOa8KzHb1cX9FQEyVUdQ/uAIcOtbshmXzm2Zi
	6RjfjKPfiuIEtZ2O9JlaCqOtjIuzrVMrkBKfhj6Cpdnw8yaaiMm0DdpayXISJDvrpJqa+S
	sR3/Fs8Ziz9PAkQGcCUhjkOdvFJQXiKGOJ493+C2vVeNhxUTmgD1GnG1jw2oulq0XO6n+b
	dKhYj09HRh8E7jLGkFa4LoNY81M/4axYS70vmeuvlO52e7HuzwyZDk75t/Vay5Gw2K13Ax
	xCr43M3p5q5c7z89IgnF6CQ/hQIXvo5c+sNa5ZuDjp5U49ZPodXA6KnIvcMFFQ==
Message-ID: <7fed1cc6-da4d-4bd6-80ee-a90b9c71546f@bootlin.com>
Date: Mon, 6 Nov 2023 13:20:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH] scripts/resulttool: group all regressions in
 regression report
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20231103205018.19693-1-alexis.lothore@bootlin.com>
 <eee499bd9c5445eeae353677ed3d9611a046845a.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <eee499bd9c5445eeae353677ed3d9611a046845a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 21:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190249

Hi Richard,
sorry for the late reply. I see that you have decided to apply the patch in the
mean time, but here are my comments

On 11/4/23 04:13, Richard Purdie wrote:
> On Fri, 2023-11-03 at 13:50 -0700, Alexis Lothoré via
> lists.openembedded.org wrote:
>> From: Alexis Lothoré <alexis.lothore@bootlin.com>
>> 5 regression(s) for oescripts
>>     oescripts.OEGitproxyTests.test_oegitproxy_proxy_dash: PASSED -> SKIPPED
>>     oescripts.OEPybootchartguyTests.test_pybootchartguy_help: PASSED -> SKIPPED
>>     oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build_pdf_output: PASSED -> SKIPPED
>>     oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build_png_output: PASSED -> SKIPPED
>>     oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build_svg_output: PASSED -> SKIPPED
>>
> 
> Do you have a different example? This one is tricky as I happen to know
> that test depends on the host distro and the things available there.
> There are some distros it will pass on, there are some where it is
> always skipped. There was a recipetool test added recently which will
> do something similar depending upon host python version.

If not already done, you can take a look at the report I have manually generated
for 4.3.rc2 (https://pastebin.com/fvRcqes4) which relies on this patch

> The challenge is we run the test on different host distros so it is
> hard to see it as a regression. I don't know what we can do to make
> this "clear" to the report reader...
> 
> The patch is probably ok as it doesn't make the output worse but it has
> probably already obfuscated things a bit.

I am not sure if this patch obfuscates things more, since it is mostly about
grouping regressions to avoid the repeated "1 regression(s) for <..>". I would
say it _may_ obfuscate some things if there are a lot of regressions for the
same test kind  (so the display limit is triggered) AND some tests of this
specific kind are meant to run on specific distros while some others must run on
multiple. In this case, indeed, there may be a mix of (legitimately) skipped
tests and real failing tests, hidden by the display limit. But is it the case ?

Anyway, I agree with you about the main issue (false positive due to tests not
meant to be compared between some distros/machines), but I did not find time yet
to take a better look at this and propose something relevant while making sure
not to loose any relevant comparison. The "dumb" way could be to detect that all
tests in a result have a "SKIPPED" status on target side, which hints about
those tests not being relevant for the target (in this case, we could simply
silently discard the comparison), but I have to ensure it is valid for most cases.

Alexis

> 
> Cheers,
> 
> Richar

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



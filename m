Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2C2C83003
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 07:35:56 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.3016.1686123349301947655
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 00:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Tz7c4EWE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686123346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZuJnX8mUkffoEknsrTGAygQqgD3M4UUl9bF31AWyD+k=;
	b=Tz7c4EWEZEb2sr3ZDAzMxjfZwe7al+5f+DveJ7sMg0y1tj25ZGLui1OKDDpH1DpoD3B6Lv
	Jp6lnrs9tUOojtu0bLtyQo5UBPA1gWOceLaCzyEiKJptzBAJCg6+VWZdkLuBEuc3r4AaXw
	5jxtGyAGPF+te4Sut4Uq8+bg1mfKZWJpO1ZBuNcFIFEOqumdAuPxRvxGYIdBS9WyivxeZJ
	UQ5CFY/dd4dVPtQlwakorIdB2B8QfXbQsaIH7PJBTpNEay1s09PFbcw7iAt0b98wMwPmjp
	ZCG3csX/2Bt3b2nb6oEhrcdVnux1J0vzXGemxokaiuKdH923Nk15FyQLVcQOaA==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A2C020003;
	Wed,  7 Jun 2023 07:35:45 +0000 (UTC)
Message-ID: <6df3a2b3-5915-8b67-a7a9-f10f59144e99@bootlin.com>
Date: Wed, 7 Jun 2023 09:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [OE-Core][RFC][PATCH 3/3] testimage: implement test artifacts
 retriever for failing tests
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Openembedded-core@lists.openembedded.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
 <20230602095037.97981-4-alexis.lothore@bootlin.com>
 <CANNYZj8vV1=GOacn_vHpfeJ1h29AdLNJsO6X-wXPrW9vahc_5Q@mail.gmail.com>
 <ZHnYGjE3ahdytp+g@nuoska> <228e247a-2121-d1c6-95bf-51f18ec95e03@bootlin.com>
 <ZHnphEHQR7tx1D7w@nuoska>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <ZHnphEHQR7tx1D7w@nuoska>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 07:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182456

Hi Mikko, sorry for late reply, and thanks for the additional feedback

On 6/2/23 15:07, Mikko Rapeli wrote:
> Hi,
> 
> These changes are an improvement, but based on my experience in product test automation,
> instead of collecting logs after testing is completed, it is better to capture logs
> from the target device while tests are being executed. Serial console, systemd journal
> etc logs can be captured as streams from the device under test (DUT), and time stamps added
> from the test controller so that aligning events like test command execution and log messages
> is possible. It is also a good idea to capture core dumps via this kind of stream(s).
> Problems with HW and BSP SW may not be visible after testing completes (device has
> rebooted, reset) or capturing data is not possible at all (due to system, kernel, userspace hang,
> oom or too much load).
> 
> This capturing of logs could be implemented by adding some configurable variables to execute
> commands on the test controller and inside oeqa environment at certain stages of testing, for example
> after serial console login prompt has been detected. Command to execute could be a simple
> "ssh -c 'journalctl -b -a'" to capture boot logs and "ssh 'journalctl -a -f'" and log the output data with
> additional time stamps to bitbake task output or a separate file.
> 
> Just thinking out loud here, these changes are an improvement over current situation already.
> Thanks for sending these patches!

While I tend to agree with what you are suggesting, I feel like there are some
new constraints, because of targets variety: is the system a real target or a
qemu image ? Does it run systemd/journald ? Are coredumps enabled by default ?
Of course those constraints may be quite easy to circumvent, moreover we can
think of a "best effort" solution which gathers "what it can" from running
target. Also, there may be some corner cases that would need some specific
handling: some tests can be quite long (hours), what about broken pipes during
those ? This would definitely need some re-connection strategies for example.

Since current proposed solution is not very invasive/has not much requirements
except a valid ssh access, I plan to update the series and let some real testing
show if it is relevant. If not (or not enough), we may give a try to a "runtime"
version like the one you are suggesting ?

Thanks,
Alexis
> 
> Cheers,
> 
> -Mikko
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182316): https://lists.openembedded.org/g/openembedded-core/message/182316
> Mute This Topic: https://lists.openembedded.org/mt/99283034/7394887
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexis.lothore@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



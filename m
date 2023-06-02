Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00BFC77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:41:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13367.1685713266021967308
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FAcYhY9s;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685713263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TsBKoBNHOVO+UrQvLAvlfhPoLd2n8kGL4hVQ5dHxNl4=;
	b=FAcYhY9sW/NAD89OlQjcDeu4tGJvx0c4qTairpySnUgIkjHfMuJ6G6d+sh9rGUk7Sa5Xqf
	zfDcDH/eQ/dEhLPY04Nl6qx6YxGIzIPAoYQpKcibgMdLuOr3APAVn+XYyaT+IAgDKhf7ST
	b8DxyDlA2IFyJ3K2lwbXfkXJ2C+IY36GREEjAbjqebQM0yhmy/WWY1r8NW6DS5TjgApQh9
	ttxWyCHXUOJlm51SeLUhy3qkSLNqXrsdtFrcF/tWfLzrcKMNJWuIzaQm3lvCB0obkNdD4c
	UDOesGX9yn85n58uHd4/DPiJTg1uvpBZOxK+RS8ymXqFsTsyl70o/1FcgaTFpg==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20EB3FF805;
	Fri,  2 Jun 2023 13:41:02 +0000 (UTC)
Message-ID: <a57ca55e-b65d-0e4a-8c77-9c74c90d1484@bootlin.com>
Date: Fri, 2 Jun 2023 15:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [OE-Core][RFC][PATCH 1/3] oeqa/target/ssh: update options for SCP
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
 <20230602095037.97981-2-alexis.lothore@bootlin.com>
 <7f52a730227e60bb145201b27fc3fe827e2cc63a.camel@linuxfoundation.org>
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <7f52a730227e60bb145201b27fc3fe827e2cc63a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182330

On 6/2/23 14:02, Richard Purdie wrote:
> On Fri, 2023-06-02 at 11:50 +0200, Alexis Lothoré via
> lists.openembedded.org wrote:
>> Add two options for SCP:
>> - by default scp expects sftp server to be available on target, which is
>>   not always true (e.g: core-image-minimal image). Pass -O to force SCP to
>>   fallback to legacy SCP protocol
> 
> We deliberately switched away from SCP since it is deprecated and will
> be removed in a later openssh release. This is therefore a step
> backwards, we really need to do something different.

Understood. Digging a bit about the deprecation issue and why it did not work on
my machine without this option, and based on fixes seen in mailing list around
this issue, I found out that my image was not configured properly (adding
dropbear package instead of enabling it as an IMAGE_FEATURE, which brings in
sftp support)
I guess keeping scp command but with sftp support instead of legacy scp support
is ok ? Or you are in fact talking about completely stopping using the scp
binary, even with sftp support ?

Kind regards,
> 
>> - by default scp expects files. Passing -r option allows to copy
>>   directories too
> 
> Cheers,
> 
> Richard

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF9FC53210
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:02:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.14736.1672930971209161956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 07:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MPeBRXtk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AF463C0006;
	Thu,  5 Jan 2023 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672930969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vswft3/Xlz2lRBUxtBIuunKZ7J1nyQM+8CRzqRAtLxg=;
	b=MPeBRXtkChUv6qL7a2EYAXxprJLZAD/x4kIxOX54NWbgVySFPAdwhcrmnxoY7OGQFVLNRt
	Qn5+josJroHCxY7rCFUiVnN5KHwWucMjfcpTI+yZjTwG1ete7RDCXFfIAydS4yn+j7CTQA
	CXw6Jur0r6GJaGl/h1TOE/YrsGKVenf9klt3iXe6W+Qjw9MBZxwMBHcfTCFBNnUoNr6lMk
	4xv14abTDunDL/lnYe/a4sIGCSDXdPrCaf/610ZbUOxyUBAiB1qNrft9BbENLOtgGicJAd
	JvbKJQmZ7qTkkFjENbUQPCHFlRyazP/g+TRIRv8LwH2XJCLPdvAyZPLcDj1Gqw==
Message-ID: <c39c062f-44d2-7b84-9b22-3b52957407f5@bootlin.com>
Date: Thu, 5 Jan 2023 16:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: michael.opdenacker@bootlin.com,
 OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] is "poky" distro defined to use "sysvinit" as
 INIT_MANAGER?
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <2893205d-57e1-e63e-5c12-c57c7bbcb924@crashcourse.ca>
 <CAMKF1spKw-X-JTvdicfBBNNGk93EPL=gqD3jixvJkb7YfT1P0g@mail.gmail.com>
 <1736D38C7177CA6A.6604@lists.openembedded.org>
 <b725dbd2-3825-1eb7-3f71-a19a17c2ef7f@bootlin.com>
 <d92b4751144e16c0d97823b7eef1b88b3a20b760.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <d92b4751144e16c0d97823b7eef1b88b3a20b760.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 15:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175537

Am 05.01.23 um 15:57 schrieb Richard Purdie:
> On Thu, 2023-01-05 at 15:23 +0100, Michael Opdenacker wrote:
>>
>> Richard told me on IRC that, from memory, this was set because of
>> interference poky-altcfg (if I understood correctly).
>>
>> I understand one recommended way to have systemd instead of sysvinit in
>> Poky is to use "poky-altcfg" instead of "poky" as distro.
>>
>> Similarly, I guess I should use "poky-tiny" if I want to use
>> "mdev-busybox" as INIT_MANAGER.
>>
>> Then, I guess I'll document something like this:
>>
>>    * With the OpenEmbedded build system, you can choose your init system
>>      by setting INIT_MANAGER to "sysvinit", "systemd", "busybox-mdev" or
>>      "none"
>>    * BUT if you're using Poky, that won't work, so your options will be
>>      to use either "poky" (sysvinit), "poky-altcfg" (systemd) or
>>      "poky-tiny" (mdev-busybox).
>>
>> Does this sound like the right way to document this?
> We should really fix poky so this works correctly. I just have a memory
> of trying to fix it and it not being as straightforward it first
> appears. I'd then have got distracted by the next problem :/


As far as I am concerned, I tried to set INIT_MANAGER with "?=" in 
poky.conf and the set INIT_MANAGER = "systemd" in local.conf and the 
resulting system was booting fine.
Shall we make the change in master and see if autobuilders catch any 
issue? Unless your remember was the complexity was about.

Or shall I file a bug so that one of us addresses this when (s)he has time?

Thanks for your help on this!

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



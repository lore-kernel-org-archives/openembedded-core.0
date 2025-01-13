Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DA6C02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 19:44:28 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.27098.1736797459801791997
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 11:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=mx-20241105 header.b=ZOxc8reg;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF01D101F417B;
	Mon, 13 Jan 2025 20:44:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736797457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zhOUUU1N2fpJ01Ek5qtlH0j3uRULQl7LrCBLGNcfDw=;
	b=ZOxc8regq0Bi/FMs2LokkBBGCAoRw8XlRDZHFUwWpRIF2PoDzwb0t2uK2cJO4W3FyPCWy9
	u6TLNvJZVBm526jgaB92SxF8uiLC0JRNyt/xQ37VAc/Vmq3zsHPzA22jhCR/6EiVKdTMM/
	hHoXl86mK7HiqKfy+lHUMLE+R1MewXE5fWz48coVxM4NLAPcnh37YFF5Q6jaJDtJiobgY9
	G3lXPbh9Te3egVNLO2ckzq0xafiAZ3C0hdqIv++8UsF5MfUCg6L8CUFcryLBgonYfWm/wi
	ehoRB8+vzf2Yp/Giq/O3fRaeFf6Bdej7mYPNrpDNrmTzM9XuReOj63eIwtdhoQ==
Message-ID: <224f2e2b-0f5b-414d-aab5-4c24a794d906@denx.de>
Date: Mon, 13 Jan 2025 20:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: kernel-fitimage: Fix dependency loop if
 UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sean Anderson <sean.anderson@seco.com>
References: <20250111183134.22040-1-marex@denx.de>
 <CAB3asfjM6QDcOcWARN_GVF2DzDZWo2oUoyen95HskDoQ3av5nA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAB3asfjM6QDcOcWARN_GVF2DzDZWo2oUoyen95HskDoQ3av5nA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 19:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209742

On 1/13/25 12:10 PM, Adrian Freihofer wrote:
> Hi Marek

Hi,

> The issue is known and already discussed here:
> https://lists.yoctoproject.org/g/yocto/message/64428. It probably hits many
> users and a fix would be more than welcome.

Indeed.

> A more general discussion about issues related to the
> kernel-fitimage.bbclass is here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12912.

[...]

>> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
>> b/meta/classes-recipe/kernel-fitimage.bbclass
>> index 67c98adb23..81245446a2 100644
>> --- a/meta/classes-recipe/kernel-fitimage.bbclass
>> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
>> @@ -42,7 +42,7 @@ python __anonymous () {
>>
>>       ubootenv = d.getVar('UBOOT_ENV')
>>       if ubootenv:
>> -        d.appendVarFlag('do_assemble_fitimage', 'depends', '
>> virtual/bootloader:do_populate_sysroot')
>> +        d.appendVarFlag('do_assemble_fitimage', 'depends', '
>> virtual/bootloader:do_compile')
>>
> This is definitely one of the problematic lines of code. See also
> https://lists.yoctoproject.org/g/yocto/message/64428.
> 
> However, I guess even if you write the env script from the do_compile task
> to the sysroot directory, the dependency here should be on
> do_populate_sysroot so that the env file is properly cached by the sstate
> cache.

Right, that is one of the things I am not sure about in this patch -- 
how to stage the mkimage'd env blob into sstate cache early.

The other alternative would be, if the kernel-fitimage-bbclass could 
somehow gain access to the UBOOT_ENV source file in the 
virtual/bootloader recipe (is that even possible?) , it would be able to 
run its own mkimage invocation to convert the UBOOT_ENV source file into 
the env blob, but that is not awesome either.

And one more alternative would be to split the env blob generation into 
separate u-boot-env_1.0.bb recipe , that would seem like the best way to 
me, but that would break existing layers which bbappend u-boot_%.bb .

> But unfortunately this is not the only problem the fitimage-kernel.bbclass
> has when it comes to building from sstate-cache with empty TMPDIR. This is
> also broken in other places, which means that this patch theoretically
> makes the situation with the sstate even worse. But since this doesn't work
> anyway and the patch fixes the circular dependencies issue, the majority of
> users would probably benefit from this patch. And to fix the problem
> properly, you would probably have to rewrite the fitimage generation, as
> discussed on https://bugzilla.yoctoproject.org/show_bug.cgi?id=12912.
I am in full agreement with this statement, I had that fitimage bbclass 
rewrite plan on my todo list for years, haven't gotten to it yet though, 
sorry.

I also think the LTS releases will need some minimal fix.


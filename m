Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD636D12D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 20:53:51 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id x18so2400107lbi.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Nov 2013 12:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xTaoomthj9wdoP7bGj8HF8qyWHaN5pEVLmRNU+7qBnE=;
	b=DDuujoH/KCSpdrAw9HRpTEKc76uy1qYC06Lc60s1kihSIESugdFSSxFnkdcacTuRiE
	H+K6EcQTerfkj4SLI2ydRicmZFYVVSyPGIlGBrpRY6i98aZR8cNjdNNExmBn2zdgbQHY
	ExQWWvGVcZzS4BTBHvPFFqBABMZSGUBIy9/91u7y5mEWqu0iETAwQ/siU9HhZhuUaeLi
	I7t2mNsgu7QLe8HtnSotjksZz08Xxxlw643lTI/V4iZeaqXD16gYPUE3w18U6tqXsU2L
	xVlgbrDN7VUK89YeiFqEIw5fcMsVosgvrLMrBGH0v6Mu6ad1SbwZAjrBqu8G2elT2XaW
	rK2Q==
MIME-Version: 1.0
X-Received: by 10.152.6.169 with SMTP id c9mr16040499laa.28.1384030433007;
	Sat, 09 Nov 2013 12:53:53 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Sat, 9 Nov 2013 12:53:52 -0800 (PST)
In-Reply-To: <CAAQYJAsg4ux4xxKs2boj=Dg7WSJwtdwXO3v1FYj--4xO1t9vxg@mail.gmail.com>
References: <1383923827.2345.2.camel@ted>
	<1383929280.5378.110.camel@dvhart-mobl4.amr.corp.intel.com>
	<1383929632.2345.14.camel@ted>
	<CAAQYJAsg4ux4xxKs2boj=Dg7WSJwtdwXO3v1FYj--4xO1t9vxg@mail.gmail.com>
Date: Sat, 9 Nov 2013 21:53:52 +0100
Message-ID: <CAAQYJAuf8ex4KBttVSTa809N=f7n5yrOwTt_eJKm02LbNpt1pA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use hardlinks during do_install for speed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Nov 2013 20:53:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 9, 2013 at 9:33 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Fri, Nov 8, 2013 at 5:53 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2013-11-08 at 16:48 +0000, Hart, Darren wrote:
>>> On Fri, 2013-11-08 at 15:17 +0000, Richard Purdie wrote:
>>> > Whilst the comment says we can't do this, its incorrect, install operates
>>> > on WORKDIR and its hard for different parts of WORKDIR to be on different
>>>
>>> Is it hard? Or is it not possible / not supported?
>>
>> Not really possible unless you try very hard. Its not supported. We
>> don't even support WORKDIR and sysroot on different disks really.
>>
>>> My understanding was it was possible and therefor we couldn't hardlink.
>>> I'm thrilled at the prospect of being wrong there though!
>>
>> I'm happy enough to decide we don't support it (and we never have).
>>
>>> > filesystems. Hardlinking instead of copying is therefore a nice performance
>>> > gain.
>>> >
>>> > Also, completely skip the Documentation directory (adding a dummy Makefile
>>> > to keep make happy) and tweak the other cp commands to link since if we
>>> > don't we'd get "this is the same file" type errors from cp for some kernel
>>> > versions.
>>> >
>>> > For do_install on linux-yocto, this takes it from 227s -> 84s.
>>>
>>> This, and the others, are fantastic improvements, thanks RP!
>>
>> I'm rather happy to find something we can easily fix :)
>>
>> Cheers,
>>
>> Richard
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> On my old quad core:
>
> Before: 131.01 seconds
> After: 102.29 seconds
>

Somehow with both patches for hardlink and after some -ccleanall I'm
now down to 84-85 secs.

I expect even more from the /lib/oe/path patch which is atm broken on my setup.

Many Thanks !

Andrea


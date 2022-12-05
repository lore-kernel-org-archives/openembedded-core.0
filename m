Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A400C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 11:06:04 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.12379.1670238357588813134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 03:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bvl6MSki;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670238358;
  x=1701774358;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version;
  bh=xKvmj6t9cQaMIbOXWf3rrd3uFA9U0qkVNmvFZ5Mjnws=;
  b=bvl6MSkiMVkU1nSpX4ZVsYi8nNBCDT/p7Ps8FBLQSLWE+Pd6oJJDFOdD
   ihV2qJyMKbdczFuFblLa4mBq/ZEWq0RaUdiL9NJi74DvspLTIsnj80y2j
   yl5WlRPxeRvopA5eZR3KYF8p1N5QLk9QeskALPJquK7uNlXXSN2G6HgnU
   MbAhdzCPnJuqGAlU3RN4x+OyyQwW2FuzjqEVf+G/gUYYJ1tQKBskbrl62
   e0GOsny7Utlf8zMsobAdTJ7uYwYjgZFNnUAkBP/AB5UcnLF6DDifWWEcU
   jVVMx9Jezbv+7GUQemw0k3keoUlRCNq4YrB+KG6HN6S/dSej1oSJTq7wl
   w==;
References: <0b6801d90409$885d6860$99183920$@gmail.com>
 <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
 <bda7b996024942763ae9d03ea0b958c3a38b04c8.camel@linuxfoundation.org>
 <20221130143604.5a6659dc@wsk>
 <ad2adc6af5026edc201cd3ab3a7b1f129cfdbd57.camel@linuxfoundation.org>
 <D8DC7E4C-58C5-4102-A5B0-20D95FC0C3A9@arm.com>
 <Y4eLLpnUKLz+YiwM@mail.local>
 <f63f222e6c7bd50f1b50ffb198c61864a67f9ef2.camel@linuxfoundation.org>
 <jwqcz8y17xr.fsf@axis.com>
 <a02da780e14fd8353c2b9d4dedabbf2dbcf971b6.camel@linuxfoundation.org>
User-agent: mu4e 1.8.8; emacs 29.0.50
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Ross Burton
	<ross.burton@arm.com>, Lukasz Majewski <lukma@denx.de>, Alexander Kanavin
	<alex.kanavin@gmail.com>, Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	"openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [yocto] [OE-core] [Openembedded-architecture] Y2038 proposal
Date: Mon, 5 Dec 2022 12:05:24 +0100
Organization: Axis Communications AB
In-Reply-To: <a02da780e14fd8353c2b9d4dedabbf2dbcf971b6.camel@linuxfoundation.org>
Message-ID: <jwq8rjm1564.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 11:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174284


On Mon, Dec 05 2022, Richard Purdie wrote:

> On Mon, 2022-12-05 at 11:00 +0100, Ola x Nilsson wrote:
>> On Wed, Nov 30 2022, Richard Purdie wrote:
>> 
>> > On Wed, 2022-11-30 at 17:56 +0100, Alexandre Belloni wrote:
>> > > On 30/11/2022 16:46:17+0000, Ross Burton wrote:
>> > > > On 30 Nov 2022, at 14:20, Richard Purdie via
>> > > > lists.yoctoproject.org
>> > > > <richard.purdie=linuxfoundation.org@lists.yoctoproject.org> wrote:
>> > > > > > > * Could we optionally disable some of the glibc 32 bit function calls
>> > > > > > > to ensure they're not being used? 
>> > > > > > 
>> > > > > > Could you be more specific here? Would you like to disable some
>> > > > > > syscalls?
>> > > > > 
>> > > > > I'm meaning disabling the 32 bit glibc time functions.
>> > > > 
>> > > > Some time ago I filed
>> > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=6803 as Debian
>> > > > has a nice sanity check where it warns if non-LFS glibc functions
>> > > > are used.  I imagine the same logic could be used to check for 32-
>> > > > bit time_t use.
>> > 
>> > That sounds interesting and something we should probably look into for
>> > both issues...
>> 
>> I have a working sanity checker that checks for any glibc functions
>> affected by -D_FILE_OFFSET_BITS=64 or -D_TIME_BITS=64.
>> The INSANE_SKIP functionality needs some more polish but I'd be happy to
>> contribute it.
>> 
>> Some libraries use both 32 and 64 bit APIs to glibc and needs exceptions
>> in the checker.
>> 
>> I have not run any world builds with this checker, I've focused on the
>> recipes we actually use so far so we could get to a testable system.  My
>> biggest worry at the moment is rust, I know to little to know if it is
>> an actual problem and how to fix it.
>> 
>> I would like to be part of any "y2038 team" for Yocto.
>
> That does sound useful, perhaps sharing it as an RFC patch might be a
> good place to start? We might be able to run one of the autobuilder
> world targets against it, see how it looks for our core recipes?

That works for me.  I've started preparing a patch for oe-core.

-- 
Ola x Nilsson


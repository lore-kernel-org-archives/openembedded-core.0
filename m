Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id EF0546E38C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 19:01:57 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id pa12so1356129veb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=lWHYLiovClwX2O+WNhkAlMpgseXV4R7Rx3fcLNxJz1E=;
	b=BcXK8TS8GypLRzwvC3rJ6J0yZa4vqldw04FMtQI8diRm29+zaB99xLzJsGKQTUVEVo
	2EsTGAP9cYlx71FIkYgYtO+uGZ7F9zUtoboFv7GDuYlrBqLnBaFb7B3Ig2WAa0H2JlGX
	cS/7obEM+KWlAJs5SEXCcUH3H036dzz0e9KOMnP558nwrCeBzt2GxgdttbK2LlNdFP4w
	uIRR9Fi0z8bWI1P1OO2S48E3gFCU4eWTk8s532YBibnZswA98xcpAIHFjedDyLHk11Ov
	IrT9Hu7FKaVW8g9JoUeOi2ykajrJJxrU0igqnKrgTKgl3uhMJt1E7nMoYtqzSUv7CMtR
	K/QA==
X-Received: by 10.220.159.4 with SMTP id h4mr5338065vcx.1.1390503718572; Thu,
	23 Jan 2014 11:01:58 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Thu, 23 Jan 2014 11:01:18 -0800 (PST)
In-Reply-To: <52E15760.8050606@balister.org>
References: <52E10247.8050700@pseudoterminal.org>
	<52E15760.8050606@balister.org>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 23 Jan 2014 19:01:18 +0000
X-Google-Sender-Auth: MaTaxMsSKXoERYDdnCi9TcOIYpM
Message-ID: <CANyK_8f__Lh=1VqfEb7YwNHZ=Cvy561J1aDMYgmoDtQT2w7QBA@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Berkeley DB fails to build
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
X-List-Received-Date: Thu, 23 Jan 2014 19:01:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 23 January 2014 17:54, Philip Balister <philip@balister.org> wrote:
> On 01/23/2014 06:51 AM, Carlos Rafael Giani wrote:
>> Hello,
>>
>> I noticed that since the C++ bindings for the berkeley DB were included
>> in commit 23f29027db73d5759889b48fabdea7f6173217a7 , I cannot build db
>> anymore.
>> The error is:
>>
>>     /usr/lib/libstdc++.so: file not recognized: File format not recognized
>>
>> this is the offending part in the log.do_compile file:
>
> What distro is your build machine running? I've this from people using
> Arch Linux.
>

I've tracked this down to libtool replacing '-lstdc++' with an
explicit reference to '/usr/lib/libstdc++.so' before it runs ld. So
it's libtool not ld at fault here. I did look at the recipe for
Berkeley db and spotted that it overrides do_configure, allowing the
shipped copies of libtool and related files to be used rather than
running the autoreconf stuff that replaces them. That's my
understanding at least.

At that point I ran away and reverted the commit in question locally
as libtool terrifies me and I don't need the c++ bindings myself!

Sorry I can't be more help but I hope that points someone in the right
direction.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


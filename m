Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id D3138621CA;
	Mon, 27 May 2013 12:08:05 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id pb11so2915218veb.37
	for <multiple recipients>; Mon, 27 May 2013 05:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=5vtY/q0PSbRf7dkjez7bdtnde4TgAYBhmZDRTO12zpM=;
	b=o1bFWZjtAZLf9Irj4VO69CMF96i58b8xzRXyL1KyhzmUeAkx3joszokN8ngPz9o37i
	reQbeJuHfOkrwkQeVhE3pN+XlK7sYs/y+cyyI4raM1OtYVY2EdoL+Khv57xarVfbGpmb
	kGoSFqJt7vAsmKSMbUsXN7ITkK0d7gay30CI7USurpkcZ34UTbdRHZBwKVfgfPWDQIpD
	p5ExlVIphRUwt/NSW7pQ1YYWLL5gjo4+wygpBtX8iOxh8r6M5XjCUoYl2Njd7ztCBH77
	1qNMhRVhveRNyKQjMnLSm3gyxQ9iA2Hs55CTSlpejXslv+JTTu4n38S7XqhZ5iyWLVtv
	RC3g==
X-Received: by 10.220.3.144 with SMTP id 16mr2886370vcn.6.1369656486135; Mon,
	27 May 2013 05:08:06 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.110.6 with HTTP; Mon, 27 May 2013 05:07:26 -0700 (PDT)
In-Reply-To: <CABcZAN=kxmSiDUGxgz0CWgmsr=Biwo9PiLf-inDeBwJhCGpzmA@mail.gmail.com>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<1368650024.18324.102.camel@ted>
	<CANyK_8c4t0Oy1p8sktO-rxMfc1CR+-gbkXYH1RzDSTRy6qQORQ@mail.gmail.com>
	<CANyK_8cbVGMQkD7_KEd5KYTBxP+ZT5jY6VVVpdSAv_uY7JPY1w@mail.gmail.com>
	<1369217654.6695.62.camel@phil-desktop.brightsign>
	<CABcZAN=kxmSiDUGxgz0CWgmsr=Biwo9PiLf-inDeBwJhCGpzmA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 27 May 2013 13:07:26 +0100
X-Google-Sender-Auth: V3WeZyqM7jG_jdR6LkcPO8q2A08
Message-ID: <CANyK_8dhFHBQRsqyxbJH5MoBHYRLytkCE23f8wxsQ0vfSc3B3w@mail.gmail.com>
To: Chris Larson <clarson@kergoth.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Mon, 27 May 2013 12:08:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 23 May 2013 03:50, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, May 22, 2013 at 3:14 AM, Phil Blundell <pb@pbcl.net> wrote:
>>
>> On Wed, 2013-05-22 at 09:47 +0100, Paul Barker wrote:
>> > I've just sent a patch to the yocto@ list to fix this but it's brought
>> > up two things:
>> >
>> > 1) In openembedded-core/meta/classes/image.bbclass SPLASH is set with
>> > '?='. I'm overriding this with '=' in
>> > meta-raspberrypi/conf/machine/raspberrypi.conf which means it can't be
>> > overridden further in local.conf. Is this worth changing to '??=' in
>> > image.bbclass, '?=' in the machine conf so that it can be overridden
>> > with '=' in local.conf? Is my understanding of the overrides correct
>> > here?
>>
>> You can always override it from local.conf using a _forcevariable
>> override (which used to be named "_local", in fact, but that terminology
>> turned out to be a bit confusing), or a _MACHINE override of course.  So
>> I don't think there is any major problem here.
>>
>> But, that said, it probably is true that the semantics of ??= are less
>> surprising for users (since it isn't position-dependent in the way
>> that ?= is) which might make it a better choice for image.bbclass.
>
>
> ??= is great in config files, but not ideal in classes that aren't globally
> inherited. If bitbake.conf sets a ??=, and a distro .conf updates the
> default by using ??= again, and then the class uses ??=, it'll replace the
> latest default set by the config. So, I think for default values, classes
> should use ?=, config files should use ??=.

Lets leave this as it is then.

I've had no responses to the second point I made or feedback on my
patch to meta-raspberrypi. I really think it's worth adding a
documentation comment to the psplash recipe to explain the intended
way to customise the splash image as the logic there isn't
straightforward. My approach was to append the image to SPLASH_IMAGES
in a bbappend and then set this as the default via the SPLASH variable
in the machine config file for raspberrypi. I imagine it'd be a
similar approach for setting a distro default. It then ensures that
just including a machine or distro layer with a bbappend to psplash
doesn't force it's image on the user unless they're building for that
machine or distro. Is that the correct approach? If so I'm happy to
submit a patch adding something to this effect as a documentation
comment to the psplash recipe.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


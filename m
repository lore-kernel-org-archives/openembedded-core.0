Return-Path: <dbaryshkov@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id B1C55765E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 15:47:52 +0000 (UTC)
Received: by iodd187 with SMTP id d187so89197482iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 08:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xwlE3Zt0xK+YE5Ojd4e+qAMs5o16bYMDhjRsXKADF04=;
	b=sXpRb2SIjCqNbPYlCr+9Y+7IZZZ0lIGZ1jFu2TFC6QPtedJvR4nurHgaanNZiVtm4+
	cF27/fAdfFQ2a7inT3qeDDgq3Byp5WRMGZX8cuS4nOCAh+NOzYQ30YoqIEW6QMAdO0M6
	Bv4LuM8HVhHlvpCk6MuEGlZ1JF7JHLzEDlbw/fBJr9LRSTLxLfVOqEEu2B7CcjZsnnai
	6vTp+umUs3SoDvb+zRyGvIGhg3E0j+YI7seZsfpx6c6X8IlkL1WyL5zXWgagczdDQpZF
	JEp3NhA0Yhm5ipeQ6euxO90k6AQ3EsF+o3LoLcwB0t1AYzJwZNA5A6cSTeALjRKUMjLf
	CL3Q==
MIME-Version: 1.0
X-Received: by 10.107.12.104 with SMTP id w101mr6721419ioi.110.1438357672683; 
	Fri, 31 Jul 2015 08:47:52 -0700 (PDT)
Received: by 10.64.122.193 with HTTP; Fri, 31 Jul 2015 08:47:52 -0700 (PDT)
In-Reply-To: <1438340361.22462.22.camel@linuxfoundation.org>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<CALT56yP2_bkOfesazULteWL73DuBKo-BMu0MPxHw-FUz79997g@mail.gmail.com>
	<559D1AD2.3050305@windriver.com>
	<CALT56yMhBodVKpG9Pe8zzUcHiwanmxn8pUEqdJUU14-ry6DBvg@mail.gmail.com>
	<55AD1800.20706@windriver.com>
	<CALT56yO0nwxie_DAubO+LZqMYjaY-eUoF1iG2Cy6KoMAg4nuaA@mail.gmail.com>
	<55AE57D8.3040205@windriver.com> <55AE64AD.8060406@windriver.com>
	<CALT56yPYUe7J2rx4NSy29B2YOtRepH2k+VsZ+JTa6k6f5RA=YQ@mail.gmail.com>
	<55B8EA2B.3080408@windriver.com>
	<CALT56yNYwnwhV9MUSP+AXD7YcK05R=OzuJ+9-E68beWFhS8EjQ@mail.gmail.com>
	<1438340361.22462.22.camel@linuxfoundation.org>
Date: Fri, 31 Jul 2015 18:47:52 +0300
Message-ID: <CALT56yMF7T5ubH+9oW6F2kV5WxOWKfPfD=-KwrkQuJ0FyU-7og@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Fix builds for MIPS64 N32
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
X-List-Received-Date: Fri, 31 Jul 2015 15:47:53 -0000
Content-Type: text/plain; charset=UTF-8

2015-07-31 13:59 GMT+03:00 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Wed, 2015-07-29 at 18:00 +0300, Dmitry Eremin-Solenikov wrote:
>> > Recent check-ins have changed some things.  The compile side was working for a
>> > while, but not the compilation side (using it).
>> >
>> > I've been working with RP on IRC, and he's come up with some additional patches.
>> >  (including this set of 4..)
>> >
>> > So I think the set is fine, it's up to the other pieces that need to mesh with
>> > this to produce the working SDK.
>>
>> Ok. So what would be the plan then? If you need any additional tests
>> from my side,
>> I can provide them.
>
> Sorry for the delays on this. I found several issues and ended up with
> some quite subtle gcc changes to make all this work. I've put both our
> changes into master-next. The local.conf testing setup I've been using
> is:
>
> MACHINE = "qemumips64"
> require conf/multilib.conf
> DEFAULTTUNE = "mips64-n32"
> MULTILIBS = "multilib:lib64 multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
> DEFAULTTUNE_virtclass-multilib-lib32 = "mips32r2"
>
> then the build/test commands:
>
> bitbake core-image-minimal -c populate_sdk
> bitbake core-image-minimal -c testsdk
>
> The nice thing is the latter automated test part now passes for this
> configuration (and its tests all three multilibs).
>
> What remains is to run these changes through the autobuilder and make
> sure nothing else breaks as a result of this patchset. I'm about to do
> some business travel which means my ability to debug any further issues
> will be limited, compiling toolchains on the laptop isn't realistic. I
> may therefore need help in ironing out any further wrinkles or we'll
> have to wait until I get back in a couple of weeks.

I should be able to test your changes in a more or less timely manner,
so feel free to ping me if the need arises.

-- 
With best wishes
Dmitry


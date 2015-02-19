Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3080460556
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 17:26:05 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hl2so1793453igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 09:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FN94VHeo8lWvDLmLFQPzbDsfCnEqow9QtcmGLc+jYJ8=;
	b=tcygDQOSL6+XiTp71qi7WpLInbqyTbkgcsRFp9kjxt0CfbMHiFMv21S/N1/dyeKmyj
	filhsuK9q70daaPIr4Hj46ibqPYl90wMts13E+sQ8lHjXZRFB2LIvsg+GbN9WJsOvChy
	npfQR9m/yADaRAIjrr/3ZnLPsJlqwNm92yLjvHrNfhvVRjUsndWY8T5pZ5pJFCODBLnA
	xu5WRIWSAucyJ4nbDwW099neeTYs9hcrvk5omv7kpIMUTpVpHu1CKSVI5c78ToGRJNHu
	QmuO0KBo6drEITkJafR+Pe2X4CqgtPuFYWzR3LgRES7ZJVkCD0JPS5Y9y6iJfbE18Jdo
	88pA==
MIME-Version: 1.0
X-Received: by 10.50.56.82 with SMTP id y18mr6060868igp.25.1424366767047; Thu,
	19 Feb 2015 09:26:07 -0800 (PST)
Received: by 10.36.78.16 with HTTP; Thu, 19 Feb 2015 09:26:06 -0800 (PST)
In-Reply-To: <1424365206.11836.33.camel@linuxfoundation.org>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
	<CADkTA4NYnGhGUmi9ZSZZU3PYf7wA2Zj-u7HM8GhQbO5sU9AoTg@mail.gmail.com>
	<3100587.NflBacsYxf@peggleto-mobl5.ger.corp.intel.com>
	<1424365206.11836.33.camel@linuxfoundation.org>
Date: Thu, 19 Feb 2015 12:26:06 -0500
Message-ID: <CADkTA4NUJL94Rj19KNVdSG2og+mDawHGyraaz=uV-v3pAwJP_w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] devtool and externalsrc improvements
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
X-List-Received-Date: Thu, 19 Feb 2015 17:26:09 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 19, 2015 at 12:00 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2015-02-19 at 16:55 +0000, Paul Eggleton wrote:
>> On Thursday 19 February 2015 11:47:01 Bruce Ashfield wrote:
>> > On Thu, Feb 19, 2015 at 11:39 AM, Paul Eggleton
>> > <paul.eggleton@linux.intel.com> wrote:
>> > > I've been attempting to enable usage of devtool with the kernel (which
>> > > effectively means using the externalsrc class with the kernel). This
>> > > doesn't really work yet due to lack of handling the kernel configuration,
>> >
>> > I've always insisted/argued and designed in that externalsrc shouldn't touch
>> > the kernel configuration at all.
>> >
>> > You are building a tree that is completely managed outside of the build
>> > system, and getting the kernel configuration in place is part of that
>> > management.
>> >
>> > So I'm not convinced it is a problem that needs to be solved.
>>
>> So, externalsrc still doesn't touch the configuration, and it is not my plan to
>> make it do so. However, users do need some way of setting up that configuration
>> when checking out those sources for the first time, and if that's to be of any
>> use to someone who just wants to make some minor changes, it should be the
>> exact same configuration you get when you build the recipe as normal. That is
>> what I believe "devtool modify" (at least with -x) should be doing, given that
>> it is one means you can use to set up a development environment if you do not
>> have one already.
>>
>> We can certainly talk about the mechanism and work out the best way to do it,
>> such that it fits in with how linux-yocto works and meets user expectations. My
>> intent with this series was to get us to the point where we can at least
>> experiment and have that discussion.
>
> Having the option of triggering the standard configuration process as
> per a usual linux-yocto build but on an external direction, standalone
> may be the best option?

I did try that before, and the tools to run on random trees (I use it
for building
the linux-yocto kernel source out of tree), but they need the fragments and
meta-data to do that configuration.

and when a externalsrc tree is unpacked and checked out, that data won't
by lying around (that being said, I haven't tried the series to see what
exactly is happening).

I always considered externalsrc to be: "here's my tree, I've set it up and
it is ready to build .. go do it!", so I need to think about the best way to
get that next step done (for any kernel, not just linux yocto).

Bruce

>
> Cheers,
>
> Richard
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


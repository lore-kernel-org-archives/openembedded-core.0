Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id D533C6D323
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 07:43:32 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id db12so1290438veb.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 00:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SNkQZib9oa/BRMyIaNyPa0dQujp99lpoxyDbas0afWo=;
	b=anMAjIVooJ0yz75d5dtbZvi0OkgqxqtkPzYntC+aVPQQpBawlsQYwjr48T7nQvi/0o
	F+dcBb802+v4lB4D44O8mvcD6xzEUhuz9RCtB3tICTZwjZkByi4faEBIhX/uSheMXCyg
	EG4dyWeXWBdhCiM3fjRI6k0ua6zsoDQJgb08AdjooSpqfTNUC8LVqlwG0CNvcD8VCGpQ
	e6h+f7TZpQ2DcdF+athdsP2c+tXuqHt71hAOv4m9rBonynxwBUQfux9d64BXt6S/y9f5
	fRPFAVky8piRnVkHx/rl7sNTF+dY2cuo/YkVak3+hxw06iPhXzlNA1u4kGJzJQPmXRZ/
	/3GA==
MIME-Version: 1.0
X-Received: by 10.58.180.227 with SMTP id dr3mr187236vec.36.1382600614221;
	Thu, 24 Oct 2013 00:43:34 -0700 (PDT)
Received: by 10.52.184.103 with HTTP; Thu, 24 Oct 2013 00:43:34 -0700 (PDT)
In-Reply-To: <52687085.9060605@mlbassoc.com>
References: <5267D269.2020701@mlbassoc.com>
	<CAJTo0LYaqs00v5XUf+wRtaKytZy1-8VDuPcEyawYU8UXxzPUGw@mail.gmail.com>
	<526803BD.8010106@mlbassoc.com> <526804E7.3020406@mlbassoc.com>
	<52687085.9060605@mlbassoc.com>
Date: Thu, 24 Oct 2013 09:43:34 +0200
Message-ID: <CALbNGRS_eqkx5D4jsYqPb3KgPV3rcgpHy5NZBFuipBgXdxocXg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: meta-ti@yoctoproject.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Mesa mess
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
X-List-Received-Date: Thu, 24 Oct 2013 07:43:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 24, 2013 at 2:57 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2013-10-23 11:18, Gary Thomas wrote:
>>
>> On 2013-10-23 11:13, Gary Thomas wrote:
>>>
>>> On 2013-10-23 08:07, Burton, Ross wrote:
>>>>
>>>> On 23 October 2013 14:43, Gary Thomas <gary@mlbassoc.com> wrote:
>>>>>
>>>>> With the current master (Poky ffb440c37c), I can't build anything
>>>>> with a virtual/mesa requirement.  This seems to bring in both mesa
>>>>> and mesa-gl, which fight to the death, killing the build :-(
>>>>
>>>>
>>>> Presumably you want just mesa-gl?
>>>>
>>>> I guess your distro is setting a preferred provider for
>>>> virtual/something to mesa-gl, and something else is pulling in mesa,
>>>> probably through a default.  Can you check that all of the
>>>> mesa-related virtual/* lines are set in your distro, my hunch is that
>>>> you don't have virtual/mesa set to mesa-gl.
>>
>>
>> I also compared all of the PREFERRED_PROVIDERs between my build and a
>> stock
>> poky build and they are identical.
>>
>>>>
>>>> If the distro looks right then try using depexp to see what is pulling
>>>> in mesa when it shouldn't be?
>>>
>>>
>>> I looked through this and nothing was obvious.  According to depmod,
>>> neither
>>> mesa nor mesa-gl have any direct "reverse depends", i.e. packages that
>>> depend
>>> on them.  As far as I can see, it's just coming from the xserver-xorg
>>> dependency
>>> on virtual/mesa.
>>>
>>> Which led me to another experiment which I truly do not understand.  I
>>> removed
>>> the mesa-gl recipe and now when I try to build 'virtual/mesa' I get a
>>> message
>>> that there is no provider :-(  However, I *can* build mesa with no
>>> problems.
>>> I also checked it against the other PROVIDES from mesa.inc and all of
>>> them
>>> except for virtual/mesa work.  How can this possibly be?
>>
>>
>> To be clear, 'bitbake virtual/libgl' (or any of its friends except
>> virtual/mesa)
>> will cause 'mesa' to be built, but 'bitbake virtual/mesa' fails.
>>
>
> I found the cause :-)  In addition to OE-core, I am using meta-ti on an
> OMAP3 target.
> In meta-ti, there is this line:
>   meta-ti/recipes-graphics/mesa/mesa-omap3-common.inc:PROVIDES_omap3 =
> "virtual/libgl"
> I added virtual/mesa to this list and it now builds again.  I'm not sure
> that this is
> 100% correct though.
>
>
I am struggling for the same issue and removed the PROVIDES because
they are not correct any more: for omap3 we need mesa-gl as PROVIDER
for libgl. Same for virtual/mesa.

But still: Seems something is broken with virtual/libgl*. I working on
a bsp-layer [1] and maybe I did something wrong there but building
virtual/libgles2 builds mesa whatever I try...

Andreas

[1] git://gitorious.org/schnitzeltony-oe-meta/meta-toradex-community.git


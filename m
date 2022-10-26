Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E13C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 20:59:14 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web09.1229.1666817950316621427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 13:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 29QKw2rB004048;
	Wed, 26 Oct 2022 15:58:03 -0500
Message-ID: <4ec75b61-9161-f2bd-5e9e-00619366c1d4@kernel.crashing.org>
Date: Wed, 26 Oct 2022 15:58:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
Content-Language: en-US
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
        Ross Burton <ross.burton@arm.com>, Khem Raj <raj.khem@gmail.com>,
        Kai Kang <kai.kang@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20221018230820.2385167-1-raj.khem@gmail.com>
 <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
 <171F65F5948858B5.6129@lists.openembedded.org>
 <CANNYZj89RTk6=-tqK550uDvUb3nZ1bfR=H1=Ns2pw5WaiPZ_Tw@mail.gmail.com>
 <78322791-72e6-75fd-f870-1f2eb7d8e4f6@kernel.crashing.org>
 <CANNYZj_KT77PhQtPd3gTT4J9RWZNnY0UgvH_PmOZXNs+yewM6Q@mail.gmail.com>
 <4070adb4-bfb0-9d96-2193-c8f8386383e9@kernel.crashing.org>
 <CAJdd5GbBEdmT4sk=UKdn+FUv5yVRT+tCppCBUpZip8rH06_niw@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAJdd5GbBEdmT4sk=UKdn+FUv5yVRT+tCppCBUpZip8rH06_niw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 20:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172173



On 10/26/22 12:48 PM, Joshua Watt wrote:
> On Wed, Oct 26, 2022 at 12:21 PM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
>>
>>
>>
>> On 10/26/22 11:03 AM, Alexander Kanavin wrote:
>>> On Wed, 26 Oct 2022 at 16:35, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>>>> (I just saw this, so a little late on the reply, but..)
>>>>
>>>> mesa-gl is ABSOLUTELY still being used.  It's needed for libmali usage.  Not
>>>> everyone wants to use lima support for graphics.
>>>>
>>>> It was broken into two separate packages so that is was VERY clear if you were
>>>> using mesa for 'everything' (mesa), or mesa JUST for 'gl' (not gles).
>>>
>>> Okay, I'm not going to propose this, but can you clarify, what is the
>>> current use for 'gl'? Is it just opengl 3d in standalone x server
>>> based systems (which is slowly dying), or is there something else to
>>> it?
> 
> Are you specifically talking about libmali with the following statements?
> 
> I would say that in general libmali is probably not doing things in
> the "normal" way if so, although I'm not trying to say that it isn't a
> legitimate way to do it.

https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-graphics/libgles/libmali-xlnx.bb

libmali is providing all of the ELG/GLES/GLES2 and KHR headers.  It is providing 
the libegl, libgles1, libgles2, libgbm.  Also provides interfaces to fbdev, X11, 
and Wayland usage.

But all of this is specific to ONLY gles 1 and 2 interfaces.

>> Anything that needs "OpenGL", i.e. Wayland/Weston, X11, Chromium, etc etc etc.
>> These all end up linking to a combination of libmali and mesa-gl.
> 
> In general (maybe not for libmali) Wayland and Weston themselves don't
> use OpenGL, or mesa-gl. Individual clients may be able to use it,
> although it's rare in my (incomplete) experience. Most of the OpenGL
> users in Wayland/Weston are going through XWayland/X11 and using GLX.

Weston won't build without a functional OpenGL/libgles configuration.  It errors 
about missing interfaces.  Even with libmali, some of the items need to be 
disabled as they require libgles3, which libmali does not support.

>>
>> Pretty much anything that depends on 'virtual/gl' (vs virtual/libgles1,2,3).
>> libmali provides virtual/libgles1 and virtual/libgles2 and a few other things
>> that meta-gl doesn't.
>>
>> libmali also doesn't include the DRM/DRI parts.  This comes from mesa-gl.
> 
> In general, DRM/DRI doesn't come from mesa-gl. libdrm is its own
> recipe, and libgbm comes from mesa proper, or from some other
> dedicated vendor specific libgbm recipe.

https://git.yoctoproject.org/poky/tree/meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb

This enables the packageconfig for the gallium set.  Our bbappend enabled the 
dri3 and gallium specifically:

https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-graphics/mesa/mesa-gl_%25.bbappend

This allows the display out for any application using wayland/xwayland.

> 
> If this is sidetracking the discussion please ignore; I'm just a
> little confused by the above statements because either A) libmali is
> really weird B) my understanding of things is _way_ off, or C) the
> statements aren't quite correct.

libmali just provides a basic set of interfaces that call the mali co-processor 
to perform actions.  The interfaces happen to be libgles1 and 2 and defined by 
Kronos.  It does NOT provide any way to display content, the DRI/DRM interfaces 
are used for this.

So you end up with a configuration for a system that COULD be as simple as 
libmali + fbdev, where the application renders something with libmali, then uses 
fbdev to display it.  Or you can use X11, or you can use Wayland/Weston.

We have a configuration where Chromium is linked to BOTH mesa-gl and libmali in 
order to do it's rendering, while using Wayland as the compositor/display 
interfaces... which goes through the DRM system.


But ultimately the openGL part is just an engine to "do something", which 
usually involves drawing shapes into memory.  The 'display' side of things 
happens elsewhere.. and this elsewhere CAN be in mesa, it CAN be in wayland, it 
can be fbdev, etc... lots of ways, but unless you are creating all custom apps 
-- you need to be able to use mesa and the existing X11 or Wayland/Weston 
interfaces (via mesa) in order to do this.

--Mark

>>
>> --Mark
>>
>>> Alex
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#172167): https://lists.openembedded.org/g/openembedded-core/message/172167
>> Mute This Topic: https://lists.openembedded.org/mt/94420106/3616948
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


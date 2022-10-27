Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C5FC433FE
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 00:46:35 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web08.1402.1666831588975404339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 17:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 29R0kR4v017243
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 19:46:28 -0500
Message-ID: <8244b1a2-e090-8c4d-d0ef-a5501d4dfedb@kernel.crashing.org>
Date: Wed, 26 Oct 2022 19:46:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: openembedded-core@lists.openembedded.org
References: <20221018230820.2385167-1-raj.khem@gmail.com>
 <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
 <171F65F5948858B5.6129@lists.openembedded.org>
 <CANNYZj89RTk6=-tqK550uDvUb3nZ1bfR=H1=Ns2pw5WaiPZ_Tw@mail.gmail.com>
 <78322791-72e6-75fd-f870-1f2eb7d8e4f6@kernel.crashing.org>
 <CANNYZj_KT77PhQtPd3gTT4J9RWZNnY0UgvH_PmOZXNs+yewM6Q@mail.gmail.com>
 <4070adb4-bfb0-9d96-2193-c8f8386383e9@kernel.crashing.org>
 <CAJdd5GbBEdmT4sk=UKdn+FUv5yVRT+tCppCBUpZip8rH06_niw@mail.gmail.com>
 <CANNYZj9ag_2nUdZZjxbZpR4zOPCi8v7EK8kQ9jiddTJEYTYR9g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANNYZj9ag_2nUdZZjxbZpR4zOPCi8v7EK8kQ9jiddTJEYTYR9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 00:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172178



On 10/26/22 1:01 PM, Alexander Kanavin wrote:
> Is there a combination of libmali recipe and mesa-gl somewhere public
> so we could try to pick it apart and see what links to where?

libmali is ALWAYS implementation specific.  You will need to pick a vendor and 
build for it.  What is generic is the application interface (from what I've been 
told.). I can give you the AMD (Xilinx) instructions.  But you likely won't be 
able to actually execute the code without a corresponding board.  (AFAIK QEMU 
doesn't have any mali400 emulation.)

And to be clear, libmali provides the interfaces, but it is NOT a replacement to 
mesa, it works WITH mesa, just the 'gl' part (not the gles part).

The following is an abbreviated attempt to show how the pieces interact with 
each other.  It may not be 100% correct, I am definitely not an expert at this. 
(For example, I don't understand why it's "DRM" in some places but "DRI" in 
others.  These seem to be 'generally' the same systems.)  But it's how the parts 
and pieces appear to be put together based on a functioning system.


In a 'normal' system (mesa):

mesa provides:
   libglapi.so.0
   libEGL.so.1
   libGLESv2.so.2
   (and others)

The CONFIG_DRM_LIMA backend and whatever the display port DRM (CONFIG_DRM_XLNX) 
go through a dlopened backend module, which USUALLY talks to a kernel module for 
any hardware access through a standard (known) kernel interface.

In our case the dynamic modules would be the lima_dri.so and xlnx_dri.so.

glmark2-es2-wayland ->
   libwayland-client
   libwayland-cursor
   libwayland-egl.so.1

I believe the libwayland-egl talks to weston "somehow" for the egl interfaces, 
via the libwayland-client?  but I'm fuzzy here.

Weston has two related items:

drm-backend.o ->
   libglapi.so.0 (dlopened)

This bit uses mesa to access the DRM backend to actually display the stuff..

gl-backend.so ->
   libwayland-server
   libEGL.so.1
   libGLESv2.so.2

This backend is used to render the items.


So the glmark2 does it's benchmarking and renders (gl-backend) through Weston 
backends to the display port (drm-backend).

In the above case it all comes from mesa, the drm and libELG/libGLESv2 parts.



The following shows a libmali configured system as a contrasts to the above:

libmali-xlnx provides:

libEGL.so.1
libGLESv1_CM.so.1
libGLESv2.so.2
libmali.so.9
libgbm.so.1

(also provides specific backends for fbdev, headless, wayland and x11)


It talks to a backend kernel module called 'mali.ko'

mesa provides:

libGL.so.1
libglapi.so.0

and also swrast dri interface

glmark2-es2-wayland ->
   libwayland-client
   libwayland-cursor
   libwayland-egl.so.1

(same as above)

drm-backend.o ->
   libwayland-server
   libdrm.so.2
   libMali.so.9

gl-backend.so ->
   libwayland-server
   libMali.so.9

So in the above, libMali is providing all of the APIs of libEGL and libGLESv2, 
as well as (enough of) libglapi for the built in raster implementation.


Compiling things like Chromium that will link directly, you move from linking to 
libGL.so from mesa to linking in libMali, along with libGL from mesa.  The 
libMali will provide the core set of APIs, while the libGL will augement them 
with additional APIs.

Cairo is another utility that similar modifies in this way.


To re-iterate, it's NOT a "swap libmali" and re-use everything.  You need to 
rebuild anything that links to libgles or libgl or even libglapi with this new 
configuration.  It's API compatible, NOT ABI compatible!


I hope this helps.  As far as letting you play with it, I'm working through the 
final stuff and should have something I can push to langdale/master on the 
meta-xilinx and meta-xilinx-tools soon.

--Mark

> My (perhaps confused) understanding is similar to Joshua's: 'gl' is
> basically 'opengl in x11' or 'opengl rendered to memory', and if a
> system uses neither, then it is not needed.
> 
> Alex
> 
> On Wed, 26 Oct 2022 at 19:48, Joshua Watt <jpewhacker@gmail.com> wrote:
>>
>> On Wed, Oct 26, 2022 at 12:21 PM Mark Hatle
>> <mark.hatle@kernel.crashing.org> wrote:
>>>
>>>
>>>
>>> On 10/26/22 11:03 AM, Alexander Kanavin wrote:
>>>> On Wed, 26 Oct 2022 at 16:35, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>>>>> (I just saw this, so a little late on the reply, but..)
>>>>>
>>>>> mesa-gl is ABSOLUTELY still being used.  It's needed for libmali usage.  Not
>>>>> everyone wants to use lima support for graphics.
>>>>>
>>>>> It was broken into two separate packages so that is was VERY clear if you were
>>>>> using mesa for 'everything' (mesa), or mesa JUST for 'gl' (not gles).
>>>>
>>>> Okay, I'm not going to propose this, but can you clarify, what is the
>>>> current use for 'gl'? Is it just opengl 3d in standalone x server
>>>> based systems (which is slowly dying), or is there something else to
>>>> it?
>>
>> Are you specifically talking about libmali with the following statements?
>>
>> I would say that in general libmali is probably not doing things in
>> the "normal" way if so, although I'm not trying to say that it isn't a
>> legitimate way to do it.
>>
>>>
>>> Anything that needs "OpenGL", i.e. Wayland/Weston, X11, Chromium, etc etc etc.
>>> These all end up linking to a combination of libmali and mesa-gl.
>>
>> In general (maybe not for libmali) Wayland and Weston themselves don't
>> use OpenGL, or mesa-gl. Individual clients may be able to use it,
>> although it's rare in my (incomplete) experience. Most of the OpenGL
>> users in Wayland/Weston are going through XWayland/X11 and using GLX.
>>
>>>
>>> Pretty much anything that depends on 'virtual/gl' (vs virtual/libgles1,2,3).
>>> libmali provides virtual/libgles1 and virtual/libgles2 and a few other things
>>> that meta-gl doesn't.
>>>
>>> libmali also doesn't include the DRM/DRI parts.  This comes from mesa-gl.
>>
>> In general, DRM/DRI doesn't come from mesa-gl. libdrm is its own
>> recipe, and libgbm comes from mesa proper, or from some other
>> dedicated vendor specific libgbm recipe.
>>
>>
>> If this is sidetracking the discussion please ignore; I'm just a
>> little confused by the above statements because either A) libmali is
>> really weird B) my understanding of things is _way_ off, or C) the
>> statements aren't quite correct.
>>
>>>
>>> --Mark
>>>
>>>> Alex
>>>
>>>
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#172168): https://lists.openembedded.org/g/openembedded-core/message/172168
>>> Mute This Topic: https://lists.openembedded.org/mt/94420106/3616948
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


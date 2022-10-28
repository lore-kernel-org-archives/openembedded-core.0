Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C32FFA3741
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 10:59:56 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.4885.1666954775893833612
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 03:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MoDwXLAI;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id z24so7888237ljn.4
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 03:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yvTFAjFY7zt5Q7VuyVuIhyRzwwGoMtdILycdtysrfag=;
        b=MoDwXLAIZna9NoMJzc7PFZ6/rlmfklF5xj5mttcarj0Tl3qcOxITEL0L5bNm8kGzyi
         9PESr5n6UwQqPvFhiwOa/jC/b910j/TaMJEVEqLjznf/SLqyAT76S/T/ZTBRBToxSza1
         nE+uUckZpDUxqZZvzm1J1qvyQX0H4y1XuQ6IG2+w8Lrs323bwCPeZSt1ggkJBA2gZjlU
         9uthi9KVnJcArZmxTpss6b4AS6ncIpiKagIAPkFIkgsUUK+kOLu73hjQx/0Ys/WchRRF
         BbeFj0hCaiA80DRyaYSSLk4rBwwHfOATTxnEii0LqBvL4MZu/oBfYE0+kp/e0Vk0IdX7
         T7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvTFAjFY7zt5Q7VuyVuIhyRzwwGoMtdILycdtysrfag=;
        b=j+DQXYCFqa5dHE7zTA+bgYMBdm3ylAgiNKlyUGjfMqIKZU3sh6LMgUY9NbldY+pU2H
         ZsVD6n2Cs2v+VvK0WykicMBuXoTfQh9lRWbBM/YbRWZz1U7yZCM7aj7gK5pXn3xK1SPr
         H734N24XQ5igqoMj/ZF5iHy+bPdZSNG8G28xv+hi7zrsZFNDKseZ/sIe1SQubBg2vtxO
         ZrQ/nW0mO44RDF4GHd3kpyqRzYOQEXUi4+WLCgW8MxC3QKKLOiXVRUMkRd3RaH3gyKmo
         ofkoBVXWiOiWYdyXF7i+vsYXpTXXEajEbHIOImhDSoIBfZdGwnn7j7sDQc9kQlHXhIxQ
         c+oQ==
X-Gm-Message-State: ACrzQf2ZUrgMCm10CCt9wdclWdOCgLloKdMxjraNYJMzQ2tYpPVJ+7oi
	GAU8o3mXJ5BeeQedOEAwdpGupgVnxp6bUcNPHVnaynFYnkU=
X-Google-Smtp-Source: AMsMyM6M3Mt9wqfhzCowU7a1OordiiHQ9mxqluy7CGjNaPaztMMfact+3cOp5L+6DwEeGEko5Zg8iiCZdcy2jWcZ1DA=
X-Received: by 2002:a2e:c4a:0:b0:277:3931:6dc9 with SMTP id
 o10-20020a2e0c4a000000b0027739316dc9mr261529ljd.45.1666954773741; Fri, 28 Oct
 2022 03:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
 <171F65F5948858B5.6129@lists.openembedded.org> <CANNYZj89RTk6=-tqK550uDvUb3nZ1bfR=H1=Ns2pw5WaiPZ_Tw@mail.gmail.com>
 <78322791-72e6-75fd-f870-1f2eb7d8e4f6@kernel.crashing.org>
 <CANNYZj_KT77PhQtPd3gTT4J9RWZNnY0UgvH_PmOZXNs+yewM6Q@mail.gmail.com>
 <4070adb4-bfb0-9d96-2193-c8f8386383e9@kernel.crashing.org>
 <CAJdd5GbBEdmT4sk=UKdn+FUv5yVRT+tCppCBUpZip8rH06_niw@mail.gmail.com>
 <CANNYZj9ag_2nUdZZjxbZpR4zOPCi8v7EK8kQ9jiddTJEYTYR9g@mail.gmail.com> <8244b1a2-e090-8c4d-d0ef-a5501d4dfedb@kernel.crashing.org>
In-Reply-To: <8244b1a2-e090-8c4d-d0ef-a5501d4dfedb@kernel.crashing.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Oct 2022 12:59:22 +0200
Message-ID: <CANNYZj8ZU-nCAvZfOQ-Wo_u9nVy0-z=ySuAvydVLGkZ_Wu7p5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 10:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172245

Thanks. What I would want to understand is whether this arrangement
should have its own
MACHINE_FEATURE, e.g. 'vendor-egl' or similar, and then mesa proper
would be configured accordingly to
disable bits that come from the vendor.

Is there a particular need for a separate recipe?

Alex

On Thu, 27 Oct 2022 at 02:46, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>
>
>
> On 10/26/22 1:01 PM, Alexander Kanavin wrote:
> > Is there a combination of libmali recipe and mesa-gl somewhere public
> > so we could try to pick it apart and see what links to where?
>
> libmali is ALWAYS implementation specific.  You will need to pick a vendor and
> build for it.  What is generic is the application interface (from what I've been
> told.). I can give you the AMD (Xilinx) instructions.  But you likely won't be
> able to actually execute the code without a corresponding board.  (AFAIK QEMU
> doesn't have any mali400 emulation.)
>
> And to be clear, libmali provides the interfaces, but it is NOT a replacement to
> mesa, it works WITH mesa, just the 'gl' part (not the gles part).
>
> The following is an abbreviated attempt to show how the pieces interact with
> each other.  It may not be 100% correct, I am definitely not an expert at this.
> (For example, I don't understand why it's "DRM" in some places but "DRI" in
> others.  These seem to be 'generally' the same systems.)  But it's how the parts
> and pieces appear to be put together based on a functioning system.
>
>
> In a 'normal' system (mesa):
>
> mesa provides:
>    libglapi.so.0
>    libEGL.so.1
>    libGLESv2.so.2
>    (and others)
>
> The CONFIG_DRM_LIMA backend and whatever the display port DRM (CONFIG_DRM_XLNX)
> go through a dlopened backend module, which USUALLY talks to a kernel module for
> any hardware access through a standard (known) kernel interface.
>
> In our case the dynamic modules would be the lima_dri.so and xlnx_dri.so.
>
> glmark2-es2-wayland ->
>    libwayland-client
>    libwayland-cursor
>    libwayland-egl.so.1
>
> I believe the libwayland-egl talks to weston "somehow" for the egl interfaces,
> via the libwayland-client?  but I'm fuzzy here.
>
> Weston has two related items:
>
> drm-backend.o ->
>    libglapi.so.0 (dlopened)
>
> This bit uses mesa to access the DRM backend to actually display the stuff..
>
> gl-backend.so ->
>    libwayland-server
>    libEGL.so.1
>    libGLESv2.so.2
>
> This backend is used to render the items.
>
>
> So the glmark2 does it's benchmarking and renders (gl-backend) through Weston
> backends to the display port (drm-backend).
>
> In the above case it all comes from mesa, the drm and libELG/libGLESv2 parts.
>
>
>
> The following shows a libmali configured system as a contrasts to the above:
>
> libmali-xlnx provides:
>
> libEGL.so.1
> libGLESv1_CM.so.1
> libGLESv2.so.2
> libmali.so.9
> libgbm.so.1
>
> (also provides specific backends for fbdev, headless, wayland and x11)
>
>
> It talks to a backend kernel module called 'mali.ko'
>
> mesa provides:
>
> libGL.so.1
> libglapi.so.0
>
> and also swrast dri interface
>
> glmark2-es2-wayland ->
>    libwayland-client
>    libwayland-cursor
>    libwayland-egl.so.1
>
> (same as above)
>
> drm-backend.o ->
>    libwayland-server
>    libdrm.so.2
>    libMali.so.9
>
> gl-backend.so ->
>    libwayland-server
>    libMali.so.9
>
> So in the above, libMali is providing all of the APIs of libEGL and libGLESv2,
> as well as (enough of) libglapi for the built in raster implementation.
>
>
> Compiling things like Chromium that will link directly, you move from linking to
> libGL.so from mesa to linking in libMali, along with libGL from mesa.  The
> libMali will provide the core set of APIs, while the libGL will augement them
> with additional APIs.
>
> Cairo is another utility that similar modifies in this way.
>
>
> To re-iterate, it's NOT a "swap libmali" and re-use everything.  You need to
> rebuild anything that links to libgles or libgl or even libglapi with this new
> configuration.  It's API compatible, NOT ABI compatible!
>
>
> I hope this helps.  As far as letting you play with it, I'm working through the
> final stuff and should have something I can push to langdale/master on the
> meta-xilinx and meta-xilinx-tools soon.
>
> --Mark
>
> > My (perhaps confused) understanding is similar to Joshua's: 'gl' is
> > basically 'opengl in x11' or 'opengl rendered to memory', and if a
> > system uses neither, then it is not needed.
> >
> > Alex
> >
> > On Wed, 26 Oct 2022 at 19:48, Joshua Watt <jpewhacker@gmail.com> wrote:
> >>
> >> On Wed, Oct 26, 2022 at 12:21 PM Mark Hatle
> >> <mark.hatle@kernel.crashing.org> wrote:
> >>>
> >>>
> >>>
> >>> On 10/26/22 11:03 AM, Alexander Kanavin wrote:
> >>>> On Wed, 26 Oct 2022 at 16:35, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
> >>>>> (I just saw this, so a little late on the reply, but..)
> >>>>>
> >>>>> mesa-gl is ABSOLUTELY still being used.  It's needed for libmali usage.  Not
> >>>>> everyone wants to use lima support for graphics.
> >>>>>
> >>>>> It was broken into two separate packages so that is was VERY clear if you were
> >>>>> using mesa for 'everything' (mesa), or mesa JUST for 'gl' (not gles).
> >>>>
> >>>> Okay, I'm not going to propose this, but can you clarify, what is the
> >>>> current use for 'gl'? Is it just opengl 3d in standalone x server
> >>>> based systems (which is slowly dying), or is there something else to
> >>>> it?
> >>
> >> Are you specifically talking about libmali with the following statements?
> >>
> >> I would say that in general libmali is probably not doing things in
> >> the "normal" way if so, although I'm not trying to say that it isn't a
> >> legitimate way to do it.
> >>
> >>>
> >>> Anything that needs "OpenGL", i.e. Wayland/Weston, X11, Chromium, etc etc etc.
> >>> These all end up linking to a combination of libmali and mesa-gl.
> >>
> >> In general (maybe not for libmali) Wayland and Weston themselves don't
> >> use OpenGL, or mesa-gl. Individual clients may be able to use it,
> >> although it's rare in my (incomplete) experience. Most of the OpenGL
> >> users in Wayland/Weston are going through XWayland/X11 and using GLX.
> >>
> >>>
> >>> Pretty much anything that depends on 'virtual/gl' (vs virtual/libgles1,2,3).
> >>> libmali provides virtual/libgles1 and virtual/libgles2 and a few other things
> >>> that meta-gl doesn't.
> >>>
> >>> libmali also doesn't include the DRM/DRI parts.  This comes from mesa-gl.
> >>
> >> In general, DRM/DRI doesn't come from mesa-gl. libdrm is its own
> >> recipe, and libgbm comes from mesa proper, or from some other
> >> dedicated vendor specific libgbm recipe.
> >>
> >>
> >> If this is sidetracking the discussion please ignore; I'm just a
> >> little confused by the above statements because either A) libmali is
> >> really weird B) my understanding of things is _way_ off, or C) the
> >> statements aren't quite correct.
> >>
> >>>
> >>> --Mark
> >>>
> >>>> Alex
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172178): https://lists.openembedded.org/g/openembedded-core/message/172178
> Mute This Topic: https://lists.openembedded.org/mt/94420106/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


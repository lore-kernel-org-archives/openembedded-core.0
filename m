Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF57C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 17:48:25 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.10735.1666806501627278331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 10:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qR23t7aa;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id kt23so17892606ejc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 10:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l02uKB4AMjFzrLg+oNBThbU71tbcNllhPwvAegwyvXE=;
        b=qR23t7aaFC0klruFgglogh27vwWldgctLweUGFkaymAzWtccWgUX/5k1pE36b6mZRm
         5XbZEJqJF+X01q0/UJgJjxOuXxBvhfdWCBzqZiksL7YkwSXIcBFxtZbasbEbUH0+JrR4
         LGvLGeQvd77xRv0OrR+f+RPlQrFRiWJ/GNiOzh7dwsvo10HJDF107VBOsS7+Ma53mNWr
         kFUIQsRbZFp/llqB7vsulV7PlgmOVf3o+bQtU4njqIbzY/RPr70QvC+pDGXRpXfowE1U
         oqQnDJv1OYb9Oc0qq5Iq2skwR469D1eMPpQxp/N8RzOYOjMofB8WUNYmm7KCTIjxkUYA
         xXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l02uKB4AMjFzrLg+oNBThbU71tbcNllhPwvAegwyvXE=;
        b=VQjN42wdK61JuhSjbkWHWFEnSYxa53qTQ7LPBjzqkd75Gho0gXyiXbIrldK90okCHa
         kiAgykW/fOBFxygEuBqsoi3ilrna9xLoUIZWAUahAfERTkYNK0ZHL2VuNG2PWG+hJmpd
         u33O2zcfaXnMNJgDVkYvtzHGIbxWdKupOoVDMy4n2N3EkkQsqN1Bh6/iwhWbhPqnKcoj
         Jawc9yCDeMKWp/TuzCTgTv0hmTap4IjaNhgpJcweZAQKaazhb0wFwtNw9PDo4LcmGQLH
         poSI3Pck5bMOXBDRMTNkoa1bUyVc+zHXj5OwcoOMD9uikQFuCSQ9KTNpMxpbDA0oCT1e
         M9DA==
X-Gm-Message-State: ACrzQf0KOxCScmkZpCX+lEh34g5niQoeqCKaG5byK/eou+GL0vC2mgrR
	UlqvZ9FxZBg+bOy43qNUKmsf45tFx75g1me3XlA=
X-Google-Smtp-Source: AMsMyM5p2ma+Zlv/dz565G0flLLyMhUibzwE+mNyzPyQMbLsZET+S2cac+NIMcBnMPpdzKrf2fgPJ3WrhBKke5FmUYE=
X-Received: by 2002:a17:906:9b83:b0:730:b3ae:343 with SMTP id
 dd3-20020a1709069b8300b00730b3ae0343mr40080023ejc.670.1666806500057; Wed, 26
 Oct 2022 10:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
 <171F65F5948858B5.6129@lists.openembedded.org> <CANNYZj89RTk6=-tqK550uDvUb3nZ1bfR=H1=Ns2pw5WaiPZ_Tw@mail.gmail.com>
 <78322791-72e6-75fd-f870-1f2eb7d8e4f6@kernel.crashing.org>
 <CANNYZj_KT77PhQtPd3gTT4J9RWZNnY0UgvH_PmOZXNs+yewM6Q@mail.gmail.com> <4070adb4-bfb0-9d96-2193-c8f8386383e9@kernel.crashing.org>
In-Reply-To: <4070adb4-bfb0-9d96-2193-c8f8386383e9@kernel.crashing.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 26 Oct 2022 12:48:08 -0500
Message-ID: <CAJdd5GbBEdmT4sk=UKdn+FUv5yVRT+tCppCBUpZip8rH06_niw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	Khem Raj <raj.khem@gmail.com>, Kai Kang <kai.kang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 17:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172167

On Wed, Oct 26, 2022 at 12:21 PM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
>
>
> On 10/26/22 11:03 AM, Alexander Kanavin wrote:
> > On Wed, 26 Oct 2022 at 16:35, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
> >> (I just saw this, so a little late on the reply, but..)
> >>
> >> mesa-gl is ABSOLUTELY still being used.  It's needed for libmali usage.  Not
> >> everyone wants to use lima support for graphics.
> >>
> >> It was broken into two separate packages so that is was VERY clear if you were
> >> using mesa for 'everything' (mesa), or mesa JUST for 'gl' (not gles).
> >
> > Okay, I'm not going to propose this, but can you clarify, what is the
> > current use for 'gl'? Is it just opengl 3d in standalone x server
> > based systems (which is slowly dying), or is there something else to
> > it?

Are you specifically talking about libmali with the following statements?

I would say that in general libmali is probably not doing things in
the "normal" way if so, although I'm not trying to say that it isn't a
legitimate way to do it.

>
> Anything that needs "OpenGL", i.e. Wayland/Weston, X11, Chromium, etc etc etc.
> These all end up linking to a combination of libmali and mesa-gl.

In general (maybe not for libmali) Wayland and Weston themselves don't
use OpenGL, or mesa-gl. Individual clients may be able to use it,
although it's rare in my (incomplete) experience. Most of the OpenGL
users in Wayland/Weston are going through XWayland/X11 and using GLX.

>
> Pretty much anything that depends on 'virtual/gl' (vs virtual/libgles1,2,3).
> libmali provides virtual/libgles1 and virtual/libgles2 and a few other things
> that meta-gl doesn't.
>
> libmali also doesn't include the DRM/DRI parts.  This comes from mesa-gl.

In general, DRM/DRI doesn't come from mesa-gl. libdrm is its own
recipe, and libgbm comes from mesa proper, or from some other
dedicated vendor specific libgbm recipe.


If this is sidetracking the discussion please ignore; I'm just a
little confused by the above statements because either A) libmali is
really weird B) my understanding of things is _way_ off, or C) the
statements aren't quite correct.

>
> --Mark
>
> > Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172165): https://lists.openembedded.org/g/openembedded-core/message/172165
> Mute This Topic: https://lists.openembedded.org/mt/94420106/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


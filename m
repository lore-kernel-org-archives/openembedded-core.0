Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.15400.1624904443747611444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 11:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VP7dXfqd;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id w17so11791650edd.10
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 11:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cauFVI7O6WJmKhlmyixK5V4XfePXjn/YTuxCgRHMN7o=;
        b=VP7dXfqdv+VPZsqtfJ+i+WPxvxEwnHzLkyGP5kzQosXRgyr+cHDUZuQPyF44rAAzmT
         I402zw9LPxkfb9sDFi10rpuclui9Y8ocZfoJaAYoZ6HXCerCv2eXtNrOKD6oQEfnGfz1
         MRlvy0vSSy78r68T6kaajaet8FkbDteWTCbWZ/y5hTAcxF1bLL0nL40dre+ueFoY59wt
         /8EbzU06UZ4QEVE/vbqOE27UkXzLSKNQchlNWyvJPLUhdUm0UvOO4wjLnng12F27uZno
         jnEm5QKr86dHxO+FnEUVUKnQ2USejdwues8NTtcOPKXj5DZ/6o8kyFPlFcJ0iYur0p3D
         vdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cauFVI7O6WJmKhlmyixK5V4XfePXjn/YTuxCgRHMN7o=;
        b=roqWMqApcOrRzY0nFzpOo7ZxoAblJ9+cxqxMYO9BO84K6RrxPXncGqzerw7JFeZFg1
         5Icsw8TddY7mYv5xYe/ixF0FHNm8N5K93mu2yT4BMypw4ZSGK//sqrKPoN1AFjBbwJxi
         RrYhbNYaDiYJgUkxpN58sBXNR+ftaW6hqQWW2QeleO7I5dduJZrwl3JD8v1koWj/r2pl
         3popk9WfCgXjluAVZFbzT51NCus1R6567jbRnIGFL6wNFEL5PP0M68tbE3IJ+Oqb2knd
         DtueoKXScoMevE33+YQLaBZtyWA7qgrUFHbjMYWkIgDcmCGF1Js8oVKaZmRkAC3svq+D
         jJgw==
X-Gm-Message-State: AOAM530TRLZ8mI9d7LxUBFjyIOmrOzCWNURbWHGazYdKny8j7yf3Fc9t
	m2v31qVu7NvG4M/4z3I1j+npYBONl42X3BcvT8g=
X-Google-Smtp-Source: ABdhPJzsURMbzwZSp6dpk9lrYIlugpIbV7Sll7UPUpDnvTJjDpYKMAy4rgcmZAyp8ilk3/GJjq4yla/elt6QAlCqFPk=
X-Received: by 2002:a05:6402:95a:: with SMTP id h26mr35230358edz.114.1624904442183;
 Mon, 28 Jun 2021 11:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
 <c11c5d80-1913-00eb-343d-a8b344352298@gmail.com>
In-Reply-To: <c11c5d80-1913-00eb-343d-a8b344352298@gmail.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Mon, 28 Jun 2021 20:20:31 +0200
Message-ID: <CAAQYJAsGX9ExxsmoGUY8wO_Bp_JscSoRJ-pBiNJ4oBf5eBf5CQ@mail.gmail.com>
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 7:55 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Andrea
>
> On 6/28/21 3:01 AM, Andrea Adami wrote:
> > Hello,
> >
> > during a core-image-sato build for armv4 I got one single build
> > failure with pulseaudio.
> >
> > This happens after commit 80bbea0 pulseaudio: switch build system from
> > Autotools to Meson. In the commit text it is evidenced:
> >
> > "
> > With Meson there's no option for disabling Neon optimizations if the
> > compiler supports Neon. If -mfpu is set in CC or CFLAGS, it's ignored,
> > because the build system adds -mfpu=neon at the end of the compiler
> > command line, overriding any earlier -mfpu options. This shouldn't be
> > a problem, because PulseAudio detects at runtime whether the CPU
> > supports Neon instructions.
> > "
> >
> > At the moment to build pulseaudio for armv4/5 I have reverted to using
> > autotools.
> >
> >
> > There was around a patch but has not been merged.
> > https://lists.openembedded.org/g/openembedded-core/message/146375
> >
>
> this patch is not right. It might let us compile but it will still emit
> code that will expect VFP at runtime and hence fail to run.
>
> > Maybe a v2 will be accepted?
>
> right fix would be to add a proper neon support check in pulseaudio
> meson'ary, and if PA has dropped the ball on non VFP ARM then it will be
> hard to convince upstream to accept it but atleast you can try.
>

Thank you for the review.
I knew the patch was not right, I tried other workarounds and I
failed. That's why the RFC was sent.

With my very limited knowledge about the matter it would be impossible
for me to argue with L.P. upstream.
My personal opinion is that the switch to meson was done too early, at
least 14.x could have used autotools and less meson patches.

But if upstream deliberately breaks compatibility there isn't much we
can do, maybe overpatching. sigh...

Cheers
A.A.
> >
> > Cheers
> > A.A.
> >
> >
> >
> > 
> >

Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774C3C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 13:55:41 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.45708.1674136531199360235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 05:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c2vgrtoX;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id 203so973484iou.13
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 05:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=21p18Ll8GDHMe0de56Tgb8HixqZozouqoEBYFkroc9s=;
        b=c2vgrtoXeRbD/xh5rwnSlpQaE9d5CaHYSkOyfAR5kqQ01s5oJdd0vHIp2Pn7tIQt80
         Sw3HL3KASKt71BLhJyg1eKmfn0Uqu7lpFOlOK410BYD8/wg/tdPPx2qJs1aReJogU5uw
         uIVJsUzIitD4SV40ktTrU1kNOE14APMmdtyblKKgSxER9Clp8bnN98DdxroYXQvhgPuD
         g1DvyQnV5nCcswtUny1Z3lA/NVpnM6uGYO3z/eiyjUfoExuDiG6u6XfT9Gx4Ps5O5cMg
         ZVd5rEKPLFYCHhqi/BfYz+WW0KTumaCz7cfiOCZ9aU9Nmgm/XGEJEIn5kKUzb4Pb5dgm
         7qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21p18Ll8GDHMe0de56Tgb8HixqZozouqoEBYFkroc9s=;
        b=Ck99MQc5F2VzTjCxU569ijHt0f0VEUFPv0bissu3/5108HwvKtuTUbCHF6LpDj7X20
         qpbtAJGPfqbw3Q5kZVXyd8POMrkvdVwkWvnGmCSsrkEHdxTG/Ro7LfqNbO7Cbc+pwrXX
         F4vkX/y/Hs02fCu00FQWSRTD9pv/CFPEucMOz3l7Yu+QZ9BYpv9PBW6fvX0VPqSaP8P/
         QqmlZom7nx96q5PFjsrUcDQ1gGEdtu8nnaA7Y5CGwjI7iU5DS4i6VIW19yKi9MF92M7l
         mzrxvvp/8quWXCKJjTLtxyhhtqqE3jBbKA9bC04UqXtdGQ4bUnUvDM+2Mnqn0FSnOnrz
         D3XQ==
X-Gm-Message-State: AFqh2kpuyBd0wPVtG6A+ZaU05mDYriWuT7/sagjTbXjwoeARQOOWLtcw
	Wk1rduyDBwp9TUYxyiFw0HI2tS0Y7FqTFoap9BE=
X-Google-Smtp-Source: AMrXdXt0xH4rHi95/qKVMgoz3wrdUy8cKr7VQ1DDCSqWllnUGdSxe3KR3Vttz4cl6qYZ6N8D+TFfb1uUwSXjhbQ8dIU=
X-Received: by 2002:a5e:c20a:0:b0:6bc:711:821 with SMTP id v10-20020a5ec20a000000b006bc07110821mr695015iop.192.1674136530451;
 Thu, 19 Jan 2023 05:55:30 -0800 (PST)
MIME-Version: 1.0
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
 <20230119102423.3493565d@booty> <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
In-Reply-To: <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 Jan 2023 08:55:19 -0500
Message-ID: <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	=?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>, 
	Anuj Mittal <anuj.mittal@intel.com>, Scott Murray <scott.murray@konsulko.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 13:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176139

On Thu, Jan 19, 2023 at 4:57 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Anuj/Bruce/Jan-Simon/Scott,
>
> Please see the links below. This patch, pending for master triggers a
> few warnings in a few layers as there are a handful of patches with no
> Upstream-Status present in them.
>
> I know this kind of thing is annoying but it is probably worth starting
> to give the wider community the hint that they should document this,
> and if they do document it, it might remind them to try and submit them
> too. You're not the target audience but as layers being tested on the
> autobuilder you get to lead by example! :)
>
> If anyone doesn't want to tweak things to fix this, we can disable the
> warnings for that specific test but I would prefer not to, I think this
> is the right thing to encourage. The numbers of issues are low and
> easily avoided one way or another.

I'd prefer the upstream-status check to be disabled for meta-virtualization.

This isn't something that I'm strictly enforcing, and not something that I
want to start strictly enforcing.

Cheers,

Bruce

>
> On Thu, 2023-01-19 at 10:24 +0100, Luca Ceresoli wrote:
> > On Wed, 18 Jan 2023 14:22:19 +0000
> > "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
> >
> > > Currently, whilst patch errors or warnings are shown, the errors don't stop builds.
> > > The configuration isn't very configurable from WARN_QA and ERROR_QA either.
> > >
> > > This patch:
> > >  * Uses the standard mechanisms to handle the patch fuzz warnings/errors
> > >  * Makes Upstream-Status checking configurable from WARN/ERROR_QA
> > >  * Allows that checking to be used with non-core layers
> > >  * Makes patch-fuzz an error by default
> > >  * Enables warnings for missing Upstream-Status in non-core layer patches by default
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/classes-global/insane.bbclass | 27 ++++++++++++++++++---------
> > >  1 file changed, 18 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> > > index ada8a7ef4e4..e1295f85392 100644
> > > --- a/meta/classes-global/insane.bbclass
> > > +++ b/meta/classes-global/insane.bbclass
> > > @@ -29,11 +29,12 @@
> > >  WARN_QA ?= " libdir xorg-driver-abi buildpaths \
> > >              textrel incompatible-license files-invalid \
> > >              infodir build-deps src-uri-bad symlink-to-sysroot multilib \
> > > -            invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
> > > +            invalid-packageconfig host-user-contaminated uppercase-pn \
> > >              mime mime-xdg unlisted-pkg-lics unhandled-features-check \
> > >              missing-update-alternatives native-last missing-ptest \
> > >              license-exists license-no-generic license-syntax license-format \
> > >              license-incompatible license-file-missing obsolete-license \
> > > +            patch-status-noncore \
> >
> > AB testing with this patch applied revealed a few Upstream-Status
> > warnings:
> >
> > - 5 in meta-agl-core:
> >   https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/2272/steps/13/logs/stdio
> >
> > - 3 in meta-intel:
> >   https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/3968/steps/13/logs/stdio
> >
> > Jan-Simon, Anuj, can you look at those patches and maybe fix the Upstream-Status?
> >
> > Richard, this patch didn't trigger any problems in my test branch. Now
> > I'm going to remove it from my testing branch in order to avoid
> > warnings on issues we already know, unless you prefer me too keep it
> > and ignore the above mentioned warnings until they are fixed in the
> > respective layers.
>
> There are also some in meta-virt:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1168/steps/13/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1168/steps/21/logs/warnings
>
> Cheers,
>
> Richard
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78545C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:53:18 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.53585.1697806390096848640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 05:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nUpOOs3W;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7a667f3f5c0so27295939f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 05:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697806389; x=1698411189; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moavlk6YRHtKspsdtvWRNvgZw9RW3WZhaJrL4DoIz/A=;
        b=nUpOOs3WfXfoQE6q9I8hjuYZ5zSoe24o9885WKWTX8rIOOlHozz+WDs+j4vT2kAynn
         rIQjd9C6d+BH4v40F7gkuSqxaMyIs8/7ujDC93hpdXgdbsh0dCIXnNIFVB+NyZ4d3OM5
         uaZAJRjMT6i3iaCWaj0zOD19CUMayhPqEyq3JtANsixJE81UJukPNXXhSPvDOE4Rq343
         4XbuNBgnLcOPMPfs5+RtrTV6WN3i49H1WZb9f64wH3pazOx62IvpAjbffGlj55fM4Gtz
         8WOb65SHeOqwbNdMdkI4jeiGHRYnFlkCQhb6FUpxo8x/lL7d7I5pHBtSJe2IJnZCz5PG
         Z/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697806389; x=1698411189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moavlk6YRHtKspsdtvWRNvgZw9RW3WZhaJrL4DoIz/A=;
        b=YySF2WYMtEbqdlKtI/MDa6QvCtYAik1IxXDjyH4XSnR/5RABrTeElVS7gdP0OZ7DwU
         AlqrhZ7r0fvM9thKvDR+WBS75fjZ81x9dWVZ+OXdCd7BXvWGIsWq/hiKuAoyen0yqQof
         7N/asOOBnka+OWKm5Dc+/H1LFynEfu5eQhdqfY+Ca8LF/9vEWsONCfjOzdRArXnomAl6
         826zvdwPuWq+K8/zanbVt2ghgwrUYcT9BAspeLpAF8ikNm7y/NwNFFTp4bVNdjIrINVK
         /SW6MVOHwC1hUa6WgMS+AUWTjVmXUa5pp7GH1MxVVBpfY6tTzvfDJu0HHqXzpxHogrOS
         qi7w==
X-Gm-Message-State: AOJu0Yxddi6+VmZPY0yewh2e7hDrWaBjJhj/+GMbLMD/vJuDBupN5NGI
	6RV6cUV0mp+SwCjdf893Cy2ctEoqqYwiElLv+dI=
X-Google-Smtp-Source: AGHT+IHC7hhXM8iOqszNjYqTZYg7lcL4c1IHbbxTQjC0etd4ppodxXEafU6LHcXyMmW7wjDZJTm/LTzAwlHRCfk+06Y=
X-Received: by 2002:a05:6602:2c83:b0:790:bc17:1c63 with SMTP id
 i3-20020a0566022c8300b00790bc171c63mr2227093iow.1.1697806389206; Fri, 20 Oct
 2023 05:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
 <a56768bd90877ba40e6856e1324e2ded90b62201.camel@linuxfoundation.org>
 <1603003d-f5a4-4293-88f0-4b1ea006404b@prevas.dk> <64a231dc3d22dfd4eb33ac10f107997dfc7477f6.camel@linuxfoundation.org>
 <ed261cdd-e97f-446a-97ee-f19e16d54aa2@prevas.dk> <c7ac9c5d66b59e6dfac098ae236847dd7d625a1c.camel@linuxfoundation.org>
 <ea0f9ae6-a9bd-400e-ae08-953055f4e927@prevas.dk>
In-Reply-To: <ea0f9ae6-a9bd-400e-ae08-953055f4e927@prevas.dk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Oct 2023 08:52:58 -0400
Message-ID: <CADkTA4OBb3Us37Cg3VvpwYDy5dai5Q-_+JAoV7a0KZ-jM8ziOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: lift TARGET_CC_ARCH modification out of security_flags.inc
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 12:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189524

On Fri, Oct 20, 2023 at 7:19=E2=80=AFAM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> On 20/10/2023 12.13, Richard Purdie wrote:
> > On Fri, 2023-10-20 at 12:03 +0200, Rasmus Villemoes wrote:
> >> On 20/10/2023 11.38, Richard Purdie wrote:
> >>> On Fri, 2023-10-20 at 10:10 +0200, Rasmus Villemoes wrote:
> >>>> On 19/10/2023 14.48, Richard Purdie wrote:
> >>
> >>>>> The fact this works suggests perf is ignoring TARGET_CFLAGS. Is the=
re
> >>>>> anything in the perf build system where we should be passing in cfl=
ags
> >>>>> we really want used?
> >>>>
> >>>> Well, IIUC, the normal way TARGET_CFLAGS would take effect is via th=
e
> >>>> 'export CFLAGS =3D "${TARGET_CFLAGS}'. But in the perf recipe, both
> >>>> do_compile and do_install start with
> >>>>
> >>>>         # Linux kernel build system is expected to do the right thin=
g
> >>>>         unset CFLAGS
> >>>>
> >>>> And perf's build system does indeed add lots of flags of its own, at
> >>>> least for most TUs, but nowhere is any -f(macro/debug/file)-prefix b=
eing
> >>>> set.
> >>>>
> >>>> So I do think that TARGET_CC_ARCH is the best place for flags that w=
e
> >>>> really want used. At least as an initial step, because this is known=
 to
> >>>> work when using the security_flags.inc file. Maybe there's some clea=
ner
> >>>> way where we don't unset CFLAGS, but that could be a giant can of wo=
rms.
> >>>>
> >>>> And yes, a comment should be added. Is something like
> >>>>
> >>>> # Perf's build system adds its own optimization flags for most TUs,
> >>>> # overriding the flags included here. But for some, perf does not ad=
d
> >>>> # any -O option, so ensure the distro's chosen optimization gets use=
d
> >>>> # for those. Since ${SELECTED_OPTIMIZATION} always includes
> >>>> # ${DEBUG_FLAGS} which in turn includes ${DEBUG_PREFIX_MAP}, this al=
so
> >>>> # ensures perf is built with appropriate -f*-prefix-map options,
> >>>> # avoiding the 'buildpaths' QA warning.
> >>>>
> >>>> too verbose?
> >>>
> >>> If it were me I'd probably write:
> >>>
> >>> # The perf makefile has "unset CFLAGS" as "Linux kernel build system =
is
> >>> # expected to do the right thing".
> >>
> >> It's not the perf makefile, it's right there in our recipe itself. I
> >> don't think upstream perf is to blame.
> >
> > Sorry, I misunderstood. I thought this was the perf environment that
> > was doing this so in that case your comment does make much more sense
> > than mine.
>
> OK. Bruce, should I resend?

Yes, let's go for a resend with the comment added. If we can avoid even som=
e of
the pain wondering about this again .. our future selves will thank us :)

>
> > Out of interest did you see what happens if you allow our CFLAGS in and
> > remove that unset?
>
> I don't think I've tried that, but I've tried a few other things that I
> thought would be cleaner but which then exploded, so in the end I
> decided that just lifting exactly what the poky distro does should be
> safest and have the highest likelyhood of being accepted.

This is not directed at Rasmus, but a general comment ..

For pretty much anything kernel, and perf has always strongly been in
that category, we've always unset everything and allowed the Makefiles
(and the nested mess of tests, includes and trickery) to set their own
flags. It has saved subtle runtime issues and this is one area that the
developers tend to know what they are doing.

When there's a chance to append, they've give us a variable to do so,
that's why we've always used EXTRA_CFLAGS, and that likely is the
right place to use here as well. But even then, we shouldn't pass ALL of
our flags in there, just what we think needs to be in addition to the
perf generated set of CFLAGS.

Bruce

>
> > I also wondered if EXTRA_CFLAGS in EXTRA_OEMAKE
> > might be an option?
>
> Based on quick reading of perf build documentation, yes, EXTRA_CFLAGS
> seems like a reasonable approach. What I'm a little worried about is the
> TUs where perf apparently does not by itself add all its cflags (-O6 and
> whatnot), so I'm not sure if they would be built with what is passed via
> EXTRA_CFLAGS.
>
> I will experiment sometime next week if I remember and nothing else
> preempts that plan.
>
> > I'm a bit worried that the current situation all feels a little
> > fragile.
>
> Agree. But the QA checks do help quite a lot here.
>
> Rasmus
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B05C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 14:24:29 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.55576.1697811859799614692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 07:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=avxlYEHk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c54c8934abso13011541fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 07:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697811858; x=1698416658; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z7IQ+/NC8R/UnQOfUJaApIzOH7zRBLonAynY5BAWmvs=;
        b=avxlYEHkkjXEH9XN4o2IXaoUPPPiZUzRsqLe+Xj1yOveXx7ClvRlN6zzmX/plnn7SY
         UWnANBaRMeiON+fH9Wr8eYzx99DH0W0SUovu83g4255ibYPtHT/iaxmd35GkVXNXHzlD
         dtsu+9elfLYXWzJZhJQAnghme6cTgIUjbWICA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697811858; x=1698416658;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7IQ+/NC8R/UnQOfUJaApIzOH7zRBLonAynY5BAWmvs=;
        b=wETVjvSKWhZzfRF2hqLEtJgJfNs/bTnIQ29JMhaUKlzQAYDw4UmmRE1gfVbvxIq46a
         ylHLsvZDfYkQ3V688F4ypCUcBjk28Ux++FlFxSm5qGylw+gRdBea/gVQqyvlQR7dWHoc
         xhph7znYGOaXpIsC6wIK+PL+ArP7mbxVrCXPzKoXs2YdfP8u6rDX+k/B2kVR9siAfK/R
         l4AojDxzvcRtUKT/YZGL8omNg0yGPG8/Ehqrj0YS1+rbf6soY6G0MQh2uIIVjd9TRWoy
         baNYU/6y4P9qFef0DcV6+r6MExJ20uEc5hpX1Ss0AsAG7SrcKSzq7S27clyPzsTcLQQs
         bqlQ==
X-Gm-Message-State: AOJu0Yz5a+JYNVgXwQ+Wsu0xq7yVVOoukVeWJbqbaorLQqTaPlV/xyQ4
	S9wKczVVMaMzWNVp8zm8vrgfOA==
X-Google-Smtp-Source: AGHT+IH8Vmux02XdG5tXBr6HFRm+uGf5r8BnxODL8BBiqFPez6LpRQjt9GNI7/bgjNIZmfc5Iij4vw==
X-Received: by 2002:a05:651c:504:b0:2c5:72e:6ff7 with SMTP id o4-20020a05651c050400b002c5072e6ff7mr1580446ljp.24.1697811857859;
        Fri, 20 Oct 2023 07:24:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e461:a77:598a:10d6? ([2001:8b0:aba:5f3c:e461:a77:598a:10d6])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c155200b00402ff8d6086sm2291399wmg.18.2023.10.20.07.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:24:17 -0700 (PDT)
Message-ID: <1b7ff0faa06fea9773d155f0dc5499302f494156.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perf: lift TARGET_CC_ARCH modification out of
 security_flags.inc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 20 Oct 2023 15:24:16 +0100
In-Reply-To: <CADkTA4OBb3Us37Cg3VvpwYDy5dai5Q-_+JAoV7a0KZ-jM8ziOA@mail.gmail.com>
References: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
	 <a56768bd90877ba40e6856e1324e2ded90b62201.camel@linuxfoundation.org>
	 <1603003d-f5a4-4293-88f0-4b1ea006404b@prevas.dk>
	 <64a231dc3d22dfd4eb33ac10f107997dfc7477f6.camel@linuxfoundation.org>
	 <ed261cdd-e97f-446a-97ee-f19e16d54aa2@prevas.dk>
	 <c7ac9c5d66b59e6dfac098ae236847dd7d625a1c.camel@linuxfoundation.org>
	 <ea0f9ae6-a9bd-400e-ae08-953055f4e927@prevas.dk>
	 <CADkTA4OBb3Us37Cg3VvpwYDy5dai5Q-_+JAoV7a0KZ-jM8ziOA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 14:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189539

On Fri, 2023-10-20 at 08:52 -0400, Bruce Ashfield wrote:
> On Fri, Oct 20, 2023 at 7:19=E2=80=AFAM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
> >=20
> > On 20/10/2023 12.13, Richard Purdie wrote:
> > > On Fri, 2023-10-20 at 12:03 +0200, Rasmus Villemoes wrote:
> > > > On 20/10/2023 11.38, Richard Purdie wrote:
> > > > > On Fri, 2023-10-20 at 10:10 +0200, Rasmus Villemoes wrote:
> > > > > > On 19/10/2023 14.48, Richard Purdie wrote:
> > > >=20
> > > > > > > The fact this works suggests perf is ignoring TARGET_CFLAGS. =
Is there
> > > > > > > anything in the perf build system where we should be passing =
in cflags
> > > > > > > we really want used?
> > > > > >=20
> > > > > > Well, IIUC, the normal way TARGET_CFLAGS would take effect is v=
ia the
> > > > > > 'export CFLAGS =3D "${TARGET_CFLAGS}'. But in the perf recipe, =
both
> > > > > > do_compile and do_install start with
> > > > > >=20
> > > > > >         # Linux kernel build system is expected to do the right=
 thing
> > > > > >         unset CFLAGS
> > > > > >=20
> > > > > > And perf's build system does indeed add lots of flags of its ow=
n, at
> > > > > > least for most TUs, but nowhere is any -f(macro/debug/file)-pre=
fix being
> > > > > > set.
> > > > > >=20
> > > > > > So I do think that TARGET_CC_ARCH is the best place for flags t=
hat we
> > > > > > really want used. At least as an initial step, because this is =
known to
> > > > > > work when using the security_flags.inc file. Maybe there's some=
 cleaner
> > > > > > way where we don't unset CFLAGS, but that could be a giant can =
of worms.
> > > > > >=20
> > > > > > And yes, a comment should be added. Is something like
> > > > > >=20
> > > > > > # Perf's build system adds its own optimization flags for most =
TUs,
> > > > > > # overriding the flags included here. But for some, perf does n=
ot add
> > > > > > # any -O option, so ensure the distro's chosen optimization get=
s used
> > > > > > # for those. Since ${SELECTED_OPTIMIZATION} always includes
> > > > > > # ${DEBUG_FLAGS} which in turn includes ${DEBUG_PREFIX_MAP}, th=
is also
> > > > > > # ensures perf is built with appropriate -f*-prefix-map options=
,
> > > > > > # avoiding the 'buildpaths' QA warning.
> > > > > >=20
> > > > > > too verbose?
> > > > >=20
> > > > > If it were me I'd probably write:
> > > > >=20
> > > > > # The perf makefile has "unset CFLAGS" as "Linux kernel build sys=
tem is
> > > > > # expected to do the right thing".
> > > >=20
> > > > It's not the perf makefile, it's right there in our recipe itself. =
I
> > > > don't think upstream perf is to blame.
> > >=20
> > > Sorry, I misunderstood. I thought this was the perf environment that
> > > was doing this so in that case your comment does make much more sense
> > > than mine.
> >=20
> > OK. Bruce, should I resend?
>=20
> Yes, let's go for a resend with the comment added. If we can avoid even s=
ome of
> the pain wondering about this again .. our future selves will thank us :)
>=20
> >=20
> > > Out of interest did you see what happens if you allow our CFLAGS in a=
nd
> > > remove that unset?
> >=20
> > I don't think I've tried that, but I've tried a few other things that I
> > thought would be cleaner but which then exploded, so in the end I
> > decided that just lifting exactly what the poky distro does should be
> > safest and have the highest likelyhood of being accepted.
>=20
> This is not directed at Rasmus, but a general comment ..
>=20
> For pretty much anything kernel, and perf has always strongly been in
> that category, we've always unset everything and allowed the Makefiles
> (and the nested mess of tests, includes and trickery) to set their own
> flags. It has saved subtle runtime issues and this is one area that the
> developers tend to know what they are doing.

For the kernel itself, yes, they do. For userspace binaries, we do in
general have a good idea of how binaries should be being built and
we're a bit ahead of the curve on the flags/features that should be
configured.

> When there's a chance to append, they've give us a variable to do so,
> that's why we've always used EXTRA_CFLAGS, and that likely is the
> right place to use here as well. But even then, we shouldn't pass ALL of
> our flags in there, just what we think needs to be in addition to the
> perf generated set of CFLAGS.

I'm not entirely convinced of that. Which CFLAGS do we have which would
be harmful to userspace binaries?

I'm basically saying we should at least investigate this as I'm not
sure which things we have in CFLAGS would be problematic to userspace
binaries in general. It may not work and that is fine but I don't think
perf userspace should be that sensitive to the things we usually have
set.

Cheers,

Richard


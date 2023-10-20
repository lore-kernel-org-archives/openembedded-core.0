Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A1CCDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 10:13:57 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.50979.1697796832248576852
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 03:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g6Fu6vK8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.179, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c504a5e1deso10235681fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 03:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697796830; x=1698401630; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PFK7jbkV6qxjpouewEtrdIRtQqnSqsQoU9pFle1Ve0s=;
        b=g6Fu6vK8AKg60GMC4sBAKEe4So3N02/gxYj05+817vVK7wwBsawlPjca1lSdP8EVJc
         IPbXTqDrz9yQ2zpr3hF/AKYwukhgaHEH+tuYjmxioMYlA+iGl5hHQrK8/t8gMnGBBt6Y
         Fc1K8OXw1mol6kJHmHGjh78qKk2hWn0JuTfxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697796830; x=1698401630;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PFK7jbkV6qxjpouewEtrdIRtQqnSqsQoU9pFle1Ve0s=;
        b=jo7GkpyplwrwQR9/DCgmpit6rfkAR5LSTGAqd/mu2RPMogxGpftuLf9N5+csEmWX6q
         pvPR0KslJBW1gvybKZ3841K/oQ1YunxnZnHuACpn0c8R9ZSZGXQRV2xL/FdJjiAxN7au
         f8pKstEJ7tESsEo5OY0aFxeXc5wbtNks6OvBOS2ccQ6GzAo/8jj4IJjDGRnvq08xiUN/
         X1Nv7r3mo6LsrGc5cDCIiTrfZVLJ0SMoBjev4I7HTKmQ8wuMfsX1ZkVBQ0atEKBhkURt
         /Qcuv1gGjNJ0vfednMTUZA/OyFT0Vt0cxc0LWte6u1nFu0YK4AV3UMRAL7kXzgpGZirD
         eOdw==
X-Gm-Message-State: AOJu0YwR3EgyyguhE2nUV3WywaEbogOlGLmeBBTk3L502bdXtt0NnhgP
	pQinRqBmTNPUGXkoxazOnoOXYQ==
X-Google-Smtp-Source: AGHT+IFxIJ5I/OqOALWxjKnaKs2vU8OY/7ANhmycTmN8Ygmm8B/wJZ7BcBeZ8QQDpyaDMP9LTm8fQw==
X-Received: by 2002:a2e:8016:0:b0:2c0:293c:ad12 with SMTP id j22-20020a2e8016000000b002c0293cad12mr958285ljg.17.1697796829764;
        Fri, 20 Oct 2023 03:13:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e461:a77:598a:10d6? ([2001:8b0:aba:5f3c:e461:a77:598a:10d6])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c45ca00b00407752f5ab6sm1835829wmo.6.2023.10.20.03.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 03:13:48 -0700 (PDT)
Message-ID: <c7ac9c5d66b59e6dfac098ae236847dd7d625a1c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perf: lift TARGET_CC_ARCH modification out of
 security_flags.inc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Oct 2023 11:13:48 +0100
In-Reply-To: <ed261cdd-e97f-446a-97ee-f19e16d54aa2@prevas.dk>
References: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
	 <a56768bd90877ba40e6856e1324e2ded90b62201.camel@linuxfoundation.org>
	 <1603003d-f5a4-4293-88f0-4b1ea006404b@prevas.dk>
	 <64a231dc3d22dfd4eb33ac10f107997dfc7477f6.camel@linuxfoundation.org>
	 <ed261cdd-e97f-446a-97ee-f19e16d54aa2@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 10:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189514

On Fri, 2023-10-20 at 12:03 +0200, Rasmus Villemoes wrote:
> On 20/10/2023 11.38, Richard Purdie wrote:
> > On Fri, 2023-10-20 at 10:10 +0200, Rasmus Villemoes wrote:
> > > On 19/10/2023 14.48, Richard Purdie wrote:
>=20
> > > > The fact this works suggests perf is ignoring TARGET_CFLAGS. Is the=
re
> > > > anything in the perf build system where we should be passing in cfl=
ags
> > > > we really want used?
> > >=20
> > > Well, IIUC, the normal way TARGET_CFLAGS would take effect is via the
> > > 'export CFLAGS =3D "${TARGET_CFLAGS}'. But in the perf recipe, both
> > > do_compile and do_install start with
> > >=20
> > >         # Linux kernel build system is expected to do the right thing
> > >         unset CFLAGS
> > >=20
> > > And perf's build system does indeed add lots of flags of its own, at
> > > least for most TUs, but nowhere is any -f(macro/debug/file)-prefix be=
ing
> > > set.
> > >=20
> > > So I do think that TARGET_CC_ARCH is the best place for flags that we
> > > really want used. At least as an initial step, because this is known =
to
> > > work when using the security_flags.inc file. Maybe there's some clean=
er
> > > way where we don't unset CFLAGS, but that could be a giant can of wor=
ms.
> > >=20
> > > And yes, a comment should be added. Is something like
> > >=20
> > > # Perf's build system adds its own optimization flags for most TUs,
> > > # overriding the flags included here. But for some, perf does not add
> > > # any -O option, so ensure the distro's chosen optimization gets used
> > > # for those. Since ${SELECTED_OPTIMIZATION} always includes
> > > # ${DEBUG_FLAGS} which in turn includes ${DEBUG_PREFIX_MAP}, this als=
o
> > > # ensures perf is built with appropriate -f*-prefix-map options,
> > > # avoiding the 'buildpaths' QA warning.
> > >=20
> > > too verbose?
> >=20
> > If it were me I'd probably write:
> >=20
> > # The perf makefile has "unset CFLAGS" as "Linux kernel build system is
> > # expected to do the right thing".=20
>=20
> It's not the perf makefile, it's right there in our recipe itself. I
> don't think upstream perf is to blame.

Sorry, I misunderstood. I thought this was the perf environment that
was doing this so in that case your comment does make much more sense
than mine.

Out of interest did you see what happens if you allow our CFLAGS in and
remove that unset? I also wondered if EXTRA_CFLAGS in EXTRA_OEMAKE
might be an option?

I'm a bit worried that the current situation all feels a little
fragile.

> > and security flags amongst other things so force our=C2=A0
> > # cflags in.
>=20
> This has nothing to do with the security flags. That file still contains
>=20
> TARGET_CC_ARCH:append:class-target =3D " ${SECURITY_CFLAGS}"
>=20
> and TARGET_CC_ARCH is included in the CC value we pass to perf's make,
> with or without this patch. So if the distro includes
> security_flags.inc, perf gets built with those flags as expected.
>=20
> But when that file is _not_ included, we do miss the prefix-map flags,
> which should be passed regardless of any security distro settings. I
> think the line I'm moving out of security_flags.inc have never really
> had any business being there in the first place, regardless of whether
> adding ${SELECTED_OPTIMIZATION} to TARGET_CC_ARCH is the most
> appropriate method to get those prefix-map options passed.

I agree. It was added as a "lets get security flags roughly working and
find out where the issues are" and has unfortunately stuck around and
not been properly fixed.

>  But since
> that's how the poky distro has achieved that until now, it seems to be
> the least invasive and least risky fix for distros that don't use
> security_flags.inc.

Agreed, however I am interested to see if we can remove some of the
complexity instead as that would be better overall I think if we could
do it.

Cheers,

Richard


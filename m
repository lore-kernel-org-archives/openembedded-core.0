Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2D8C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 00:20:00 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.7217.1699316391188203404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 16:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FlOomb4o;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7a66b5f7ea7so194294739f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 16:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699316390; x=1699921190; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDobf2pL4jGoqb8uFZRRGL5NyPtwlN2W9dCIYmH4pi8=;
        b=FlOomb4owN4RU8WtudOHy959d6llo1whSBUaazuBDMQjHFeVXVIf6x/qJKWbxeLcKs
         bCl8tbRSfgDrDwYmshEg++kazVH9G8meVZjXtTR6SLPDZ1oMRiRiZwGYdiFvff8tFnm4
         Ch2iJVJ587p3svOX0//35TXh8+mtIz8Glym5tVRm+GFqw8OKEu6B+dIuC+HzdzRl+7sw
         Z5jf40o5K6cT4OAhjdaI6We6E0kfRyfPjfDr3Ad8I57+yINB8Uu+vVc0WeqjNvnH3I3z
         QlAejQAvF+afGLNtUCLCfgeKkMB4GHfaZlidle8cniOqWSITkz5h0Hl73tmBkyn9FFEU
         8tuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699316390; x=1699921190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDobf2pL4jGoqb8uFZRRGL5NyPtwlN2W9dCIYmH4pi8=;
        b=uMuLUomDX4CJEq6FlDY8gUgTL/HghKa6IKm6NZkuAFWOAxkBlvpl4Tg8yKW4+dfLOj
         8J7D6klBYbDgNGXJjxUbkEQtwDIMI5ZTQxvXNgH0ThrNzhIyLeE2IQa4E2VpQ+S6JL5k
         dwtqbekDfTyu4nngiSy0/1T3eEmRUxmHbXrQOAsANS1XOVql4iHWMRJHSoYPEsmxOAPo
         eRnL/a4UFdYGIKPH9TdZuAVGU8vH3WWC/ChD46yXSKvQ9Qh667Vp/xnUyiyvobkPkHAp
         AHhmG0GzGi8XcwQ3OzOc9yKkLbTRRf3fJq2WWyqA2zvywWSGdcSaGSIqIfZqNW+TvGr5
         Jnug==
X-Gm-Message-State: AOJu0Yx5uUmm6Hz8rI//tJb/WNizpqF1UOp1bztIMBqNalbW48sQkpt5
	LkEajiDkk+0igOkOBp1CIhG8ExjyW0Ufp8xAEUQ=
X-Google-Smtp-Source: AGHT+IGfQZgSI9WZwugJKanzpcP1U1If/i/pNRmRyEaOBYG3EoWeS7+scLLO+3OKLtBTV4B1hgykabtFX1WawZQSFcQ=
X-Received: by 2002:a05:6602:2a44:b0:792:989b:c621 with SMTP id
 k4-20020a0566022a4400b00792989bc621mr40266997iov.1.1699316390303; Mon, 06 Nov
 2023 16:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20231106195219.3851918-1-max.oss.09@gmail.com>
 <CADkTA4PCD=g7fdu96K-yV=jrfGyP65yfhW1ByZR-kjNU=C4WQQ@mail.gmail.com> <CAEHkU3XnQxE09di9HruWJoxprFddpX3KcW+2CMGZnWzD+uZvaA@mail.gmail.com>
In-Reply-To: <CAEHkU3XnQxE09di9HruWJoxprFddpX3KcW+2CMGZnWzD+uZvaA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Nov 2023 19:19:39 -0500
Message-ID: <CADkTA4MQfqBrufty+Hxr6W5r0xCRFe0A5KH1iAgBM3Ksauc1qw@mail.gmail.com>
Subject: Re: [PATCH] perf: fix build with latest kernel
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>, mikko.rapeli@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 00:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190250

On Mon, Nov 6, 2023 at 3:40=E2=80=AFPM Max Krummenacher <max.oss.09@gmail.c=
om> wrote:
>
> On Mon, Nov 6, 2023 at 9:04=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gma=
il.com> wrote:
> >
> > On Mon, Nov 6, 2023 at 2:53=E2=80=AFPM Max Krummenacher <max.oss.09@gma=
il.com> wrote:
> > >
> > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> > > Kernel 6.7-rc1 commit 02e85f74668e ("tools: arm64: Add a Makefile for
> > > generating sysreg-defs.h") uses files from arch/arm64/tools/,
> > > gen-sysreg.awk and sysreg.
> > > Without the files the build of perf fails independent of the used
> > > architecture (confirmed with armv7 and qemux86_64).
> > >
> > > As arch/arm64/tools/ has been added with 5.13 allow perf to build
> > > even it that directory does not exist.
> > >
> > > Add arch/arm64/tools/ to PERF_SRC.
> > >
> > > Fixes:
> > > | make[3]: *** No rule to make target '.../qemux86_64-tdx-linux/perf/=
1.0/perf-1.0/arch/arm64/tools/gen-sysreg.awk', needed by '.../qemux86_64-td=
x-linux/perf/1.0/perf-1.0/tools/arch/arm64/include/generated/asm/sysreg-def=
s.h'.  Stop.
> > > | make[2]: *** [Makefile.perf:456: arm64-sysreg-defs] Error 2
> > >
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > ---
> > >  meta/recipes-kernel/perf/perf.bb | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > Hi all
> > >
> > > I see some other options:
> > > - drop perf support for kernels<5.13 and simply add to PERF_SRC
> > > - drop the bb.fatal in favour of continue and simply add to PERF_SRC
> > >
> > > Any comments?
> >
> > I just ran into this myself while updating linux-yocto-dev
> >
> > What you have is better than either of those options, but different
> > from what I was working on.
> >
> > perf already uses KERNEL_VERSION, so I was adding some KERNEL_VERSION
> > specific sources and only copying them when they match.
> >
> > I'm concerned that skipping or always allowing files to not exist will
> > lead us to more subtle errors with invalid/incorrect kernel source tree=
s.
> >
> > Another idea I had is to just skip if sources don't exist (like we do i=
n
> > devsrc), but bb.warn so the user is aware.
>
> I can change the commit to:
> - just add to PERF_SRC
> - change the bb.fatal to bb.warn with the existing error string
> - add a 'continue' after the bb.warn
>
> Does that sound like a plan?

That matches my 2nd idea to fix it, so I'm good with it.

It'll really only just be someone using an old kernel against master
that will ever see a warning, so I have no issues with it.

Bruce

>
> Max
> >
> > Bruce
> >
> > >
> > > Thanks.
> > > Max
> > >
> > >
> > > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/p=
erf/perf.bb
> > > index 675acfaf26..dae9320169 100644
> > > --- a/meta/recipes-kernel/perf/perf.bb
> > > +++ b/meta/recipes-kernel/perf/perf.bb
> > > @@ -117,6 +117,7 @@ EXTRA_OEMAKE +=3D "\
> > >  # honour a JOBS variable.
> > >  EXTRA_OEMAKE:append:task-configure =3D " JOBS=3D1"
> > >
> > > +PERF_SRC_OPTIONAL ?=3D "arch/arm64/tools"
> > >  PERF_SRC ?=3D "Makefile \
> > >               tools/arch \
> > >               tools/build \
> > > @@ -127,6 +128,7 @@ PERF_SRC ?=3D "Makefile \
> > >               tools/scripts \
> > >               scripts/ \
> > >               arch/${ARCH}/Makefile \
> > > +             ${PERF_SRC_OPTIONAL} \
> > >  "
> > >
> > >  PERF_EXTRA_LDFLAGS =3D ""
> > > @@ -162,6 +164,7 @@ do_install() {
> > >
> > >  do_configure[prefuncs] +=3D "copy_perf_source_from_kernel"
> > >  python copy_perf_source_from_kernel() {
> > > +    sources_opt =3D (d.getVar("PERF_SRC_OPTIONAL") or "").split()
> > >      sources =3D (d.getVar("PERF_SRC") or "").split()
> > >      src_dir =3D d.getVar("STAGING_KERNEL_DIR")
> > >      dest_dir =3D d.getVar("S")
> > > @@ -171,6 +174,8 @@ python copy_perf_source_from_kernel() {
> > >          src =3D oe.path.join(src_dir, s)
> > >          dest =3D oe.path.join(dest_dir, s)
> > >          if not os.path.exists(src):
> > > +            if s in sources_opt:
> > > +                continue
> > >              bb.fatal("Path does not exist: %s. Maybe PERF_SRC does n=
ot match the kernel version." % src)
> > >          if os.path.isdir(src):
> > >              oe.path.copyhardlinktree(src, dest)
> > > --
> > > 2.35.3
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


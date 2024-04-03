Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709C2CD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 16:31:18 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.16111.1712161874855031618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 09:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hi6X4LEX;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so48178a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712161874; x=1712766674; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njqMEDRgglVcYOEvJYI715S8H/gx+mL8jSqjOyZIZck=;
        b=hi6X4LEXCaCnPWcxqkKT4JsdJ6vUMi2DV05j4gHfS2NmPMUJs37/1+c1iQceFqoNe7
         i81M9WJWnMAySp7hgTUMGCPgf7wmgoDY8ULoMjKuMFx9XGvWJABlvQ6kB9yCH5xgnmuA
         5Kv7U4lOAh5Jy5V11D3PIainpN3SVeSviR/TRVt3AbcihGe0YpoXkph1eZQF7qFheLwT
         sIu9EUvahT8BBOjecU7od/wTWa3MGDPqUi34bkqfUFUkxQqCF/vGpfZ844i3cfPrBkCM
         xIzmo86S8WQe1Nfgq+MIlDUzKuFIcUr/0rgi6LOWIKeDKrhwX5kvNLHe+R0uWA3uuJ5G
         sHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712161874; x=1712766674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njqMEDRgglVcYOEvJYI715S8H/gx+mL8jSqjOyZIZck=;
        b=xMGIZtNUkcPP8nogSNE/1MFrUyToPmkx+3h0NDzoq2VeFGd/woPCKZOp0065QFCH3V
         sqZR32wjl98Alstugqj2gM8rG429lhgiuH/JOMpIYHfo8xJRwR5FNSCwyMeSVbjOT4+I
         hVSDGWuYV64B0f/2ZHf23LdUy70UDGzcuy6uDtZOsGhmpH+crUu9FaxTvsHZlzeDaJ+7
         sjLlhsZtNmoEqW7dog2eeVVy1x722wmnrJMp0ZbEMJrCa3qWmQV/fVlKp/tAHgNKqal+
         b4cvQA50fwCGrmw9BjtXXAyYkq0vvR6F+vTblwazaos6vV3/LalEJyQbL7lkMWI2GVtJ
         bb/w==
X-Gm-Message-State: AOJu0YycekR9iSoF3vwWUx2o1IXfp0ol8r0A4JDBiSWZ8GKstMQoSeUU
	cpyXh7Z4AFfKuUHPjOw/eKkMAZVk0XWDROKc29gP5+41JDIEsbXpgg64bXJvkucB5/9ndRLuC/q
	5sm9QpcofmISmmYsByXy6ydai6co=
X-Google-Smtp-Source: AGHT+IE25QP8XundadwjNkdEGi+uksavW+bdJor9gjDTB1E8qZhLxMMVQ8S7hXvK4e+lwb+sFqYsaF9ECqmaC88CdR4=
X-Received: by 2002:a17:90b:1495:b0:2a2:21a7:48bf with SMTP id
 js21-20020a17090b149500b002a221a748bfmr24093pjb.14.1712161874132; Wed, 03 Apr
 2024 09:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240325102055.1037135-1-max.oss.09@gmail.com>
 <CADkTA4PYLUCck7Y0evO_597xOvwooe1vn5kSvJ1pqq+ew98FKg@mail.gmail.com>
 <CADkTA4M9wf--yDs9+ggQuKwSKnGYVaV994RfK+L+Q5XhUhXT8A@mail.gmail.com> <CAEHkU3X2X=sC+xFd5DEwYChnBZcjcA_6+TxZHgASDOzL9cAkwA@mail.gmail.com>
In-Reply-To: <CAEHkU3X2X=sC+xFd5DEwYChnBZcjcA_6+TxZHgASDOzL9cAkwA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 3 Apr 2024 12:31:02 -0400
Message-ID: <CADkTA4M3xOOOKpdJsn25w-iws9mcsFR_gCq0ki2_ahJHPWyHdg@mail.gmail.com>
Subject: Re: [OE-core][Patch v1 1/2] perf: fix build with latest kernel
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 16:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197932

On Thu, Mar 28, 2024 at 1:55=E2=80=AFPM Max Krummenacher <max.oss.09@gmail.=
com> wrote:
>
> On Tue, Mar 26, 2024 at 6:48=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
> >
> >
> >
> > On Tue, Mar 26, 2024 at 1:46=E2=80=AFPM Bruce Ashfield <bruce.ashfield@=
gmail.com> wrote:
> >>
> >>
> >>
> >> On Mon, Mar 25, 2024 at 6:21=E2=80=AFAM <max.oss.09@gmail.com> wrote:
> >>>
> >>> From: Max Krummenacher <max.krummenacher@toradex.com>
> >>>
> >>> Kernel commit 9eea8fafe33e ("libbpf: fix __arg_ctx type enforcement f=
or
> >>> perf_event programs") added with 6.9-rc1 tools/include/uapi/asm/bpf_p=
erf_event.h
> >>> which for arc, arm64, loongarch, riscv and s390 includes headers from
> >>> the arch/${ARCH}/... directories.
> >>> Thus the build in OE fails as those headers are not present.
> >>>
> >>> Fix this by additioanly copying all files in arch/${ARCH}/include/.
> >>>
> >>> Fixes:
> >>> ERROR: perf-1.0-r0 do_compile: oe_runmake failed
> >>> | In file included from work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.=
0/tools/include/uapi/linux/bpf_perf_event.h:11,
> >>> |                  from libbpf.c:36:
> >>> | work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/tools/include/uapi/a=
sm/bpf_perf_event.h:2:10: fatal error: ../../arch/arm64/include/uapi/asm/bp=
f_perf_event.h: No such file or directory
> >>> |     2 | #include "../../arch/arm64/include/uapi/asm/bpf_perf_event.=
h"
> >>> |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
> >>>
> >>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> >>> ---
> >>>  meta/recipes-kernel/perf/perf.bb | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/p=
erf/perf.bb
> >>> index 4f26813de0..6408c65462 100644
> >>> --- a/meta/recipes-kernel/perf/perf.bb
> >>> +++ b/meta/recipes-kernel/perf/perf.bb
> >>> @@ -139,6 +139,7 @@ PERF_SRC ?=3D "Makefile \
> >>>               tools/scripts \
> >>>               scripts/ \
> >>>               arch/arm64/tools \
> >>> +             arch/${ARCH}/include \
> >>
> >>
> >> We've always tried to stay within the tools/ source umbrella since we =
really
> >> don't want to copy any more of the kernel than we have to, since other=
wise,
> >> we might as well go back to simplifying things and just building again=
st the
> >> entire kernel source tree.
> >>
> >> I'd like to see if there's a way that we could limit this to the uapi =
(and hence
> >> use our uapi headers), and avoid needing to make the copy. If we need =
a
> >> copy, then being as specific as possible would be the goal.
>
> I was too lazy to limit this when I came up with the patch.
> Currently the only header missing is
> ../../arch/arm64/include/uapi/asm/bpf_perf_event.h,
> so limiting to arch/${ARCH}/include/uapi should work fine, I'm unsure if
> the header file itself exists for every ${ARCH} so only copying the one
> file is probably a dangerous way forward.
>
> >
> >
> >
> > I meant to also add that I'm not talking about the libc-headers for the
> > uapi bits, as they are not tracking the latest kernel by design. Althou=
gh
> > it would be interesting to see how perf does treat the older uapi again=
st
> > the new kernel, so we can document the tested combinations.
> >
> > Bruce
>
> Let's wait till you give linux-yocto-dev a try run.Happy Easter.

I have linux-yocto-dev on 6.9-rc2 now.

I have a few non-perf packages to fix before I can send it to the list,
but to finish up this thread.

I tested with your patch, as well as the finer grained included, and
that does indeed fix the problem.

At a minimum, we should go with the uapi as the include addition.

I'm tempted to experiment with just the single file, and ensure that
our source copy routines in perf can handle it. The reason why I'm
focused on it, is that this is just temporary until I upgrade our
libc-headers recipe in the next release cycle, after that, it should
provide what is needed for perf and we'll have what is essentially
an extra copy (although harmless).

I agree that the best place for the perl dependency is on the -tests
package, as I don't see big gains on creating a perl-tests package
for the dependency .. since if it is used to process the other results,
most everything would just have the dependency anyway.

Bruce

> Max
> >
> >
> >>
> >>
> >> I'm not moving linux-yocto-dev to the latest -dev until next week, but=
 I  can
> >> look into this more then.
> >>
> >> Bruce
> >>
> >>
> >>>
> >>>               arch/${ARCH}/Makefile \
> >>>  "
> >>>
> >>> --
> >>> 2.42.0
> >>>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


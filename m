Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC52DCEFC26
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 15:35:22 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.12329.1728401719948502578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 08:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cLNrgYeb;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e30ee6788dso10462577b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 08:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728401719; x=1729006519; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xed4jUAvr2NygmNwyGg7kiu5v87h1NVAqAM0Gza+Ric=;
        b=cLNrgYebVCm6RSbYl5lN9o8AkfpekLFTU+R97Vi9uovVsGdcuOvfkzwJBKuCOSGv37
         kUttZlASzNT6JvWCJM0yP2cqT8SG31Eft2l0RFLzxAbKW+O4T/Mlddrm2+H3jAYZD/On
         Mg729lIUz7UAhgDv189Lx/arhNh6xP5xlh3SuIpcJrRJY02uYhtlbMMclAPCbcpAa7+M
         xVxvA9N00SM0Oetkwt7IPqKARRxMByrp8JSEbk1DNjSk+jfHoGjdYJqnki4OmQdAISfw
         eXhnDixsVCSBabpUznTLdaamHDxhJb6Xt0W9IwjhA1R42y4Q0v4jJiK85cEur82QMMde
         QnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728401719; x=1729006519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xed4jUAvr2NygmNwyGg7kiu5v87h1NVAqAM0Gza+Ric=;
        b=e/kJE6lVATyYY4UKTjhM0NNuCg9hR1c4pJd1OJYXCJsmCU21b3SMZ4SRqbDt49HKHm
         ggnyugLQ8ZoYnFOT3EO46p/HboQEGxoiYUek/pMTwpNpEWqYzNFT39B/6H6c3T0a8iMN
         l0y3vS5D8Mh/hgye66WopLP5btBPsETJ4iXZvfj+eRLwt4lvHo7emvAFsd6uDnhuJ64I
         1dJMTv6rwTw5x4hIpDeuP+kIDHmMRnmgmQEMhNpwFNBdABvJQwGpYW1WWjoEj4rk77Z2
         8Ba6+aehcw6eKom4NThi3H8Xczth+vauilizSGluw4Vg98H9vQIeVtXcp+Z0GC/I9GCm
         VXXg==
X-Gm-Message-State: AOJu0YzcisThNYeWl1PBM3rdjmJNG9GKznazPtcuaM7wmRG7mOC0m9Tj
	d1ny3IN68JEzaJHdxd9HShwnhIQewPkNU4aJR6n72C0yh5799x0tyB+TLmEstWq8h+RpWA5K/i7
	Xkvd/iowDIak7efUrfFWkXSz9w2U=
X-Google-Smtp-Source: AGHT+IHHBLy/oVNG7t1/Kmzy9DqWvD9VQ1KxS8CImGpwuNZBWCp+P5aA1zu73M1S/A42euwODvin/USBcQ0MIcrqMzI=
X-Received: by 2002:a05:690c:6287:b0:6e2:c962:75e with SMTP id
 00721157ae682-6e2c96211d9mr121891857b3.32.1728401719085; Tue, 08 Oct 2024
 08:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1727069614.git.liezhi.yang@windriver.com>
 <73daecdd8298f7cc64730877148ea11b3f113bc4.1727069614.git.liezhi.yang@windriver.com>
 <CADkTA4MjcpmOqarUHz2UnNwHZZgRtEB7c18stuuggLb+deu_Ww@mail.gmail.com> <dfe23bf3-0247-4f26-93c7-2eab26e0d408@windriver.com>
In-Reply-To: <dfe23bf3-0247-4f26-93c7-2eab26e0d408@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Oct 2024 11:35:06 -0400
Message-ID: <CADkTA4OEwgJT3sxb6Bd=7QRig=UDL-mxjF5At2Ct=NzzsO+xFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] kernelsrc.bbclass: Move virtual/kernel:do_shared_workdir
 to do_configure
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 15:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205294

On Tue, Oct 8, 2024 at 11:18=E2=80=AFAM Robert Yang <liezhi.yang@windriver.=
com> wrote:
>
> Hi Bruce,
>
> Sorry for the late reply, I just came back from holiday,
>
> On 10/1/24 22:42, Bruce Ashfield wrote:
> > On Mon, Sep 23, 2024 at 1:34=E2=80=AFAM Robert Yang via lists.openembed=
ded.org
> > <liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
> >>
> >> From: Robert Yang <liezhi.yang@windriver.com>
> >>
> >> The do_shared_workdir populates build artifacts to
> >> work-shared/${MACHINE}/kernel-build-artifacts, which isn't useful for =
do_patch,
> >> make do_patch depend on it will make a lot of recipes compiling which =
makes
> >> world's do_patch very slow, e.g.:
> >>
> >> Download sources locally:
> >> $ bitbake world --runall=3Dfetch
> >>
> >> * Before the patch:
> >> $ rm -fr sstate-cache/ tmp/; time bitbake world --runall=3Dpatch
> >> real    23m31.739s
> >> user    0m25.086s
> >> sys     0m4.630s
> >>
> >> * Now
> >> $ rm -fr sstate-cache/ tmp/; time bitbake world --runall=3Dpatch
> >> real    12m25.650s
> >> user    0m35.641s
> >> sys     0m5.699s
> >
> > The motivation for why this is a priority should be included in
> > the commit message. It helps us decide if any issues this may
> > trigger are worth the risk.
> >
> > I assume you are doing some sort of source archiving, or
> > licensing and all you care about is the patched source
> > for this, and not any potentially generated files from the
> > build(s) ?
>
> Yes, I'm trying to collect the patched sources for ip scanning, and there=
 are a
> lot of do_compile tasks are running when run --runall=3Dpatch which looks=
 strange.
>
> >
> > See below for why I ask.
> >
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>   meta/classes-recipe/kernelsrc.bbclass | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes-recipe/kernelsrc.bbclass b/meta/classes-reci=
pe/kernelsrc.bbclass
> >> index ecb02dc9edc..f23a1e6bff2 100644
> >> --- a/meta/classes-recipe/kernelsrc.bbclass
> >> +++ b/meta/classes-recipe/kernelsrc.bbclass
> >> @@ -7,8 +7,8 @@
> >>   S =3D "${STAGING_KERNEL_DIR}"
> >>   deltask do_fetch
> >>   deltask do_unpack
> >> -do_patch[depends] +=3D "virtual/kernel:do_shared_workdir"
> >>   do_patch[noexec] =3D "1"
> >> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
> >
> >>From what I can see (bitbake expansion and dependency experts
> > can feel free to correct the below):
> >
> > There's already an issue with the KERNEL_VERSION / LOCAL_VERSION
> > variables, in that they depend on STAGING_KERNEL_BUILDDIR, which
> > is populated from the do_shared_workdir. We are moving that population
> > later / to a different task with this patch, so those variables are now=
 going to
> > be defined at a different point in the build. There's potential risk in=
 that.
> >
> > Looking at the routines get_kernel* that the variables are using, they
> > gracefully return None if the file doesn't exist, so the question is ..=
 would
> > an impacted user of the variables notice a potential issue ?
>
> Maybe we should make get_kernel_* report errors rather than None?

That was the idea that Ross and I had when I was looking through
the series.

It would definitely let us know if this is an issue, and flag it in the
future if it becomes an issue.

Bruce

>
> // Robert
>
> >
> > One wonders if they shouldn't just propagate the exception to the calle=
r
> > so it could be dealt with, and harder to ignore.
> >
> > So while it does speed up do_patch, there is a behaviour change in
> > when the variables are going to be valid/defined.
> >
> > Bruce
> >
> >>   do_package[depends] +=3D "virtual/kernel:do_populate_sysroot"
> >>   KERNEL_VERSION =3D "${@get_kernelversion_file("${STAGING_KERNEL_BUIL=
DDIR}")}"
> >>   LOCAL_VERSION =3D "${@get_kernellocalversion_file("${STAGING_KERNEL_=
BUILDDIR}")}"
> >> --
> >> 2.25.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#204794): https://lists.openembedded.org/g/openembe=
dded-core/message/204794
> >> Mute This Topic: https://lists.openembedded.org/mt/108603063/1050810
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B884C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 14:33:47 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.11566.1720103624267942240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 07:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kCI9MJUS;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f9ffd24262so4258805ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720103624; x=1720708424; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2ZmYO3B5V5NTsKvItJxNUDTvO3C3fzRAPJc09jZoew=;
        b=kCI9MJUStycFLnjsOHHsPOPfsFXhrRYQKzSaL8LiNi6e69zAbiOvAgkPM0o84oj03J
         KF+cpv/l+45uA4x6YjUSrCjZldJhOGelV9oy1P/37yXbFATGBiKI5wxw5CA1IHlhe3bA
         V8aPPFc5zBEYF83BkE7K6IRcl5ZLh19DgAF8N6w786+vefkc5ggLVT2OZpOkkY5gDM6m
         u5aYIuGLngM9gHvhKR7iLU82mpyXMR04l6UZfSB+xuEc+zNGLDJH2NHcOeimI3P3oDDy
         ducXi7hChA0vKi7sGd6C0B2KMpX5t79lhEEvNrck6IvCPMxy4Y0OGzKN+KRFIvjWLT28
         REdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720103624; x=1720708424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2ZmYO3B5V5NTsKvItJxNUDTvO3C3fzRAPJc09jZoew=;
        b=WYn4DyfnrKgrAnX/dYQzBgZlDutq4J/fgYYZ2ytFmfLVaenfeVa0yPxFMfy9W9rgoB
         nmbIdGcF+NTo9nHYTphlgq3ad7sk94gebbdtv8jKKG2nHRBPcESqcgTku/35hgbQ9WoW
         Q5Q88EfvB9Io1uQPpd6suaOFtocqYeg3o1YCP8cRuXUMGEu5VVPtg9m1sLFIkFfA8Ds9
         ciXw1M0ytnWLvzuVIkOxfdDgk13/ob3dHsURaYSxb8kP+0OkrmkFDF9KynLOzjoaTsG4
         p7uqcjJF9ffNWVv+utEVv5lSkzLF+vYHAoyQPaqQE1MQjGxKXy5dZBz6sQ7ERckEqJJ4
         MXkg==
X-Gm-Message-State: AOJu0YwQbbfdj6SHdfz5gxDK9i65+nWcL/A/0xLk4A71taFHqiJr2TRx
	JspZVoBueIXRHT5R+2S5CF1vfw4PFcu9B9RkAlqJuHczwTh0pgqvNKiaC1s6/EKkRAAuj87/6KS
	F+ToHBtYAAiWxCDW+qIiPDTAsEoU=
X-Google-Smtp-Source: AGHT+IE9iEX2uGWwUTNgFTyO8Lj37t8J/t7NvOHOm1eMiQnc1DWSz3dDOkXVTmeid7yiB7abhKF/N6KD/GViqeM3Tmo=
X-Received: by 2002:a17:902:ecc6:b0:1fb:2eb3:7874 with SMTP id
 d9443c01a7336-1fb33e58856mr17010475ad.28.1720103623139; Thu, 04 Jul 2024
 07:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240703125244.1250173-1-Harish.Sadineni@windriver.com>
 <CADkTA4Mn9e2NpQ3ZupvPUWKffYcM4h5E91cbvq=Gc3TXuV5vdw@mail.gmail.com> <PH0PR11MB5658291B88E7AEF9BF8126AFEFDE2@PH0PR11MB5658.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB5658291B88E7AEF9BF8126AFEFDE2@PH0PR11MB5658.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Jul 2024 10:33:30 -0400
Message-ID: <CADkTA4OuLc6N0GFO5oHm1=TTiAf-zbX007U5iPaEJ92ehUiyRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux: Modify kernel configuration to fix
 runqlat issue
To: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, "Gowda, Naveen" <Naveen.Gowda@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 14:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201576

On Thu, Jul 4, 2024 at 6:25=E2=80=AFAM Sadineni, Harish
<Harish.Sadineni@windriver.com> wrote:
>
> Hi Bruce,
>
> Thanks for reviewing the patch and your comments on the same.
>
> >> This has to be conditional, it is only required in certain configurati=
ons.
>
> Can you please let me know which condition would be better suited for thi=
s configuration.

That's the thing .. While it is relatively rare, there are userspace
dependencies for
some kernel options, and of course it is more common to have kernel depende=
ncies
for userspace tools. So it is something that has been thought about and the=
re
are facilities in place to deal with it. But I'm stating the obvious,
I just wanted to
summarize that for the mailing list archive :)

What we don't want is to enable dependencies "just in case", since although=
 they
are usually small, it goes against keeping things to be only pulled in when
required. We also don't want fine grained distro or other mappings to indiv=
idual
kernel features. That creates a tight binding from userspace and the meta-d=
ata
to the kernel, and often  specific versions of the kernel. It becomes
brittle and
hard to maintain over time.

The way that we coordinate userspace and kernel options is via the
KERNEL_FEATURES variable. That allows us to bind distro / image / other
options into a named kernel configuration fragment in the kernel-cache. It
also allows us to group options and dependencies into categories.

You haven't fully explained your issue / problem though. What is the
exact issue ?
That you are trying to run a specific ptest, it requires the BTF debug
option, which
in turn needs pahole ? As you can guess, enabling pahole and those options =
for
all kernel builds, all the time .. doesn't really make sense. We may get to=
 the
point where we really do want to enable it for all kernels, and then it wou=
ld be
done in the kernel definitions in the kernel-cache .. but I'm not seeing en=
ough
evidence that we are at that point yet.

The variable to add that userspace tool / dependency was intended to be
the KERNEL_DEBUG variable (although the implementation is incomplete).

The main issue may have been that you didn't know to set that variable, and=
 the
documentation around it could be better, but trying to do something that wa=
s
really automatic, that grepped through .config files, magically adding
dependencies, etc, is tempting, but like I was saying above, it
doesn't scale and
causes issues.

So my simplest suggestion is: just fix the KERNEL_DEBUG enabling of pahole
as a dependency and when KERNEL_DEBUG is set, add the proper KERNEL_FEATURE
to the KERNEL_FEATURES variable. We could update the documentation
to describe that when KERNEL_DEBUG is enabled, pahole and btf are among
the things you get. The recipe that builds the test could also be updated t=
o
indicate that KERNEL_DEBUG should be set to run the test.

It would also be possible to test on debug-btf being set in the KERNEL_FEAT=
URES
and use that to trigger the pahole dependency. i.e. use the KERNEL_FEATURES
value as the trigger for the dependency, versus using KERNEL_DEBUG.

Either way someone has to know to enable KERNEL_DEBUG or set the
right value in KERNEL_FEATURES, and that's fine / expected.

>
> >> Fragments don't go in the meta data layers, this needs to be submitted
> >> to the kernel-cache and enabled with a KERNEL_FEATURE.
>
> Will submit it to the kernel-cache as per your suggestion.
> However, enabling the "CONFIG_DEBUG_INFO_BTF"  will result in the followi=
ng build failure:-
> -------------------------------------------------------------------------=
--------
> | BTF: .tmp_vmlinux.btf: pahole (false) is not available
> | Failed to generate BTF for vmlinux
> | Try to disable CONFIG_DEBUG_INFO_BTF
> -------------------------------------------------------------------------=
--------
>
> Can you let me know if the configuration changes has to be submitted in k=
ernel-cache after conditionally enabling the pahole in Kernel recipe?
>

We already have those options in the kernel-cache and a fragment for
this purpose:

% git grep CONFIG_DEBUG_INFO_BTF
features/debug/debug-btf.cfg:CONFIG_DEBUG_INFO_BTF=3Dy

If it is missing an option, you could always add it to that one.

Bruce


Bruce

> Thanks,
> Harish
>
> ________________________________
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Wednesday, July 3, 2024 6:33 PM
> To: Sadineni, Harish <Harish.Sadineni@windriver.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>; MacLeod, Randy <Randy.MacLeod@windriver.com>; Gowda, Naveen=
 <Naveen.Gowda@windriver.com>; Kokkonda, Sundeep <Sundeep.Kokkonda@windrive=
r.com>; Moodalappa, Shivaprasad <Shivaprasad.Moodalappa@windriver.com>
> Subject: Re: [OE-core] [PATCH] linux: Modify kernel configuration to fix =
runqlat issue
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Wed, Jul 3, 2024 at 8:53=E2=80=AFAM Sadineni, Harish via
> lists.openembedded.org
> <Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >
> > Running /usr/share/bcc/tools/runqlat 1 5 gives following error:-
> >
> > libbpf: failed to find valid kernel BTF
> > /virtual/main.c:92:15: error: no member named 'state' in 'struct task_s=
truct'
> > if (prev->state =3D=3D TASK_RUNNING) {
> > ~~~~ ^
> > 1 error generated.
> >
> > It is due to the modification of state to __state in latest kernels.
> >
> > The following commit addressed the issue which checks whether the struc=
t "task_struct" has __state or state
> > https://github.com/chenhengqi/bcc/commit/d3cf5dcecfaeb6d8d346e2228626a7=
dbe506ad38
> > The above patch requires enabling CONFIG_DEBUG_INFO_BTF in the kernel
> > and requires pahole.
> >
> > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto.inc     | 3 ++-
> >  meta/recipes-kernel/linux/linux-yocto/cg2.cfg | 2 ++
> >  meta/recipes-kernel/linux/linux-yocto/cg2.scc | 1 +
> >  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 2 ++
> >  4 files changed, 7 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto/cg2.cfg
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto/cg2.scc
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-k=
ernel/linux/linux-yocto.inc
> > index 0132fcffb3..d6b4794d32 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > @@ -65,11 +65,12 @@ KERNEL_DEBUG ?=3D ""
> >  DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powe=
rpc" ], "elfutils-native", "", d)}'
> >  DEPENDS +=3D "openssl-native util-linux-native"
> >  DEPENDS +=3D "gmp-native libmpc-native"
> > +DEPENDS +=3D "pahole-native"
>
> This has to be conditional, it is only required in certain
> configurations. You may need
> another image or distro configuration option to control the
> conditional depends, just
> like we did with KERNEL_DEBUG (and see my comment below, I think we
> still should).
>
> >
> >  # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole=
-native available before do_kernel_configme
> >  do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG",=
 "True", "pahole-native:do_populate_sysroot", "", d)}'
> >
> > -EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "P=
AHOLE=3Dfalse", d)}'
>
> You need to justify this change. It wasn't a mistake that we wanted to
> force phole off
> when debug wasn't enabled.
>
> > +EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "", ""=
, d)}'
> >
> >  do_devshell:prepend() {
> >      # setup native pkg-config variables (kconfig scripts call pkg-conf=
ig directly, cannot generically be overriden to pkg-config-native)
> > diff --git a/meta/recipes-kernel/linux/linux-yocto/cg2.cfg b/meta/recip=
es-kernel/linux/linux-yocto/cg2.cfg
> > new file mode 100644
> > index 0000000000..7c60e87a1a
> > --- /dev/null
> > +++ b/meta/recipes-kernel/linux/linux-yocto/cg2.cfg
> > @@ -0,0 +1,2 @@
> > +CONFIG_IKHEADERS=3Dy
> > +CONFIG_DEBUG_INFO_BTF=3Dy
> > diff --git a/meta/recipes-kernel/linux/linux-yocto/cg2.scc b/meta/recip=
es-kernel/linux/linux-yocto/cg2.scc
> > new file mode 100644
> > index 0000000000..7047be85f7
> > --- /dev/null
> > +++ b/meta/recipes-kernel/linux/linux-yocto/cg2.scc
> > @@ -0,0 +1 @@
> > +kconf non-hardware cg2.cfg
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipe=
s-kernel/linux/linux-yocto_6.6.bb
> > index 62c0f0ab36..cba61aa2d7 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > @@ -72,3 +72,5 @@ KERNEL_FEATURES:append:powerpc64le =3D" arch/powerpc/=
powerpc-debug.scc"
> >
> >  INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
> >
> > +SRC_URI +=3D "file://cg2.scc"
> > +KERNEL_FEATURES +=3D "cg2.scc"
>
> Fragments don't go in the meta data layers, this needs to be submitted
> to the kernel-cache and enabled with a KERNEL_FEATURE.
>
> Cheers,
>
> Bruce
>
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#201473): https://lists.openembedded.org/g/openembed=
ded-core/message/201473
> > Mute This Topic: https://lists.openembedded.org/mt/107018570/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


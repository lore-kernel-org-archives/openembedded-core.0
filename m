Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E36C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 21:57:15 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4044.1783893424838170142
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 14:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=CRiNJb+p;
 spf=pass (domain: underview.tech, ip: 209.85.221.51, mailfrom: vince@underview.tech)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47df6a5202bso1426923f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783893423; cv=none;
        d=google.com; s=arc-20260327;
        b=cNUvhSozUi/I5Ug7X5RFV5XaR762jSfy6dplgTvyfUEIc7xJzXQgSNC/wgRlUm3Oim
         x2hrXW0GKjK94iWtR41do1TVeyyD9T30smNqtNsE2OQwREVNMJf2LCXx4k/lIynILDYn
         3XKIT/Z04bNMGF75gqHCg4ZoMPCOMIGzBqNl48ntUuMiB9Nl9hCnlGj83wl5M0sniRbF
         +lmzv+k8BjDBwLeMb7SHnNA9XFvwHoXYAmJftxO83K7lq6wQuO14wdJMOPSti5PeKP9B
         3wG1leLASUPKbg2sdMsLJftLM8dZkdnF+tDyXsgOAwDYdvYCni5vgM/EVzXLavkB7dy9
         Bgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DJpT6Pr244rs1DWtf+iiYWyVfkchfeGh7Uhc8DwF4kQ=;
        fh=IbSkeshrUriXkTKTAZ5fskMQJDEoZAlOaNCk3Iw6+XY=;
        b=Xzp9RA+c3oGXISv22BGuuMWv3MUFVDmT2A3EeTKWTQ0m3L7skRCSuRjCYTVtkY/JBI
         bBAQIH05IxVLW4b+lJHQfWIPTEJIvsWnQZbzzaFG0X4wpctXarxDTyk+m8uGaWd+Ymot
         tc2DEPneSEWEjX32524ZQTOfEZSsnMNhObwNp0pyM7EScnTIC+AbddOTN7QlFSgd0vLp
         /NNadkLZtgDsrdWzP71CrVp8FkeDFaWOqwIxuiyiPMECOA6ynp3wlJk73wHMyGOzh4RG
         aLzc5a+qjzAWoaG6PWNI297EEbRKPGG+7BTU7kkSYxCzxcN2bBGf9sw4ONYszpU16y1m
         vC3Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783893423; x=1784498223; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJpT6Pr244rs1DWtf+iiYWyVfkchfeGh7Uhc8DwF4kQ=;
        b=CRiNJb+pPzw1eANMFq39YbqAFKQVexesy+EyZjeIvWcgCnA/2MLrPFu1XG3adxIhAC
         5Hud82MPbnud+Nlbqmsr0GcLJJp4ZYuK6C7BKh0DdfCEHSrxtlYn8U8Yrixlm4wzaqPM
         Z5Rn1moNXM7XOqpc/SIR0S+c0uOXnyW/zkD/tf7ASCTY4PpeY3558jkWtBxIBNdXx7FL
         boR38SXDGrjeaPBjCdMt209prTaHpNtHz4aRUFuMRVciyBvcwQsyyTPPwsKIfnaU0tEr
         b/VBHhIgUQaLaeb51SOZHxtNWv4adDvbPcT9ECR62TIwfnSFq73dNHCt6W/mN3SuVX6p
         t4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783893423; x=1784498223;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DJpT6Pr244rs1DWtf+iiYWyVfkchfeGh7Uhc8DwF4kQ=;
        b=D4HnTvp42+Jw57Uaqy4wDEDUe/EMWZRpTcq0iTX6hpqeWhhpRkYZ1C+4RQ1yR0m5fL
         XP/2nLxFT982aezy2SRyVg28PGW6DT/tIkelYx4JpsqymWT6a7xlFlVXlmJM1BVidG88
         QFfff0r92Nru9UXeH7olZVL3wDjR7uYksOnld5mzHiKWm1Dl6YuKAcw7PDiDDmLpWnAE
         TolZZD3g4HZYRAqA9rIgf3Fw3XkXTE5FGXTVYYdL9T2X8G4kScxmv/IW1g8h85TyqV46
         iHpmQ1g37Yzrdu+CdDEKYrrC+dBYMtKg7w6KQGoC+mD5H/s8HYspdt7cHatKXsJJbPNJ
         uPVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaGDrIZLVeqytHmjnCNjFftFHrokaHVtycDmpvn4nPAdBmszvtHu2WUl58s2ihqgiA8v/cvjavfbBsc4Z0vwlzaA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzcpKXhfqiYWlfUYLk7ileNF5a95J8MOFJIrJ2xh+EQOVXD8YHL
	LbwtpwsAevPed4hD8ybJ0LBKGqW26EyZYuc8TqJI95Fpu+hmx5HN7xMf/NFVvwSCy9zGRxA9zM5
	yVe6JwXR6wIhTNuUXmCq0ZPdjcwYgB/kBhfjWQishFQ==
X-Gm-Gg: AfdE7cncPSH+rnlldjPrDmkvxm4hdq6/11vPnplFwS/CKqB9E0RdKRlGuZDNnXyLYB1
	NKAfMoPOKdTnfR6oFIsCtZjj6A7E4qr34EMXoVeTZ7yT77llSohsudUj5vAetZJ72YFgcY31TD+
	J3DiUyCv32dQ9cm3umItIQCJ9B1CGSokt9etUXTjBcS+ljTxgLQ08FbWbEbKYC5N82qzyaZq1gD
	UjTfmwuAdM3iIQPIuemousyPmXyB/aEfwoI2Sh2bZ2+ZoiQLACpSIX3nkUI6gQKb/APnkHB9clp
	wBj2dLFLAtSRROM=
X-Received: by 2002:a05:6000:607:b0:47d:ef65:ae9c with SMTP id
 ffacd0b85a97d-47f2dcb5b30mr6693380f8f.20.1783893423068; Sun, 12 Jul 2026
 14:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260712184307.3259642-1-vince@underview.tech>
 <CADkTA4NiK9hp-12OrhOVMPfVZG3paH8bCqc8SwAtzXVX=tDWjA@mail.gmail.com> <18C1A8990286DFDF.2110461@lists.openembedded.org>
In-Reply-To: <18C1A8990286DFDF.2110461@lists.openembedded.org>
From: Vincent Davis <vince@underview.tech>
Date: Sun, 12 Jul 2026 17:56:51 -0400
X-Gm-Features: AUfX_myI_mtHkZtnnm2Vs9ct-haovU2BVFO8fPPhTQujVIrpMHdj516_c5FSetQ
Message-ID: <CAPQx_gO1-zH2RikqmH_CbUZ38e6kAD1Pp7dGsLEE=VACjOqBZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 01/27] bitbake: globally define KERNEL_PACKAGE_NAME
To: Vincent Davis <vince@underview.tech>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cca6f00656710d6c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 21:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240820

--000000000000cca6f00656710d6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To explain why anyone would ever want two or more different types of
kernels on a single partition.

Let's say a company requires you keep swupdate on a separate rootfs from
normal operation apps. You'd have to create 2 separate DISTRO's to define
separate kernel per DISTRO. Making it harder to place both rootfs
(kernel+initramfs is really what I mean) in the same wic.

If you can build multiple different kernels + initramfs in the same DISTRO
you avoid the problem entirely.

Can create a repo with mockup ideal of what I'm trying to achieve. If need
be.

On Sun, Jul 12, 2026, 5:38=E2=80=AFPM Vincent Davis Jr via lists.openembedd=
ed.org
<vince=3Dunderview.tech@lists.openembedded.org> wrote:

> Hey,
>
> There are 2 use cases the first being if the caller simply wants to chang=
e
> KERNEL_PACKAGE_NAME in their distro. They'll run into the runtime error
> described in patch description. This can be tested by just changing the
> name in the kernel.bbclass.
>
> The second being if you want to build 2 or more kernels with different
> initramfs contained in each kernel using one DISTRO.
>
> You'd have to define
>
> 1. Multiple kernel recipes with variables bellow so not to name mangle
>
> INITRAMFS_IMAGE_BUNDLE =3D "1"
>
> INITRAMFS_IMAGE =3D "<recipe name>"
> INITRAMFS_IMAGE_NAME =3D "<recipe image name>"
>
> KERNEL_PACKAGE_NAME =3D "<pkn>"
> KERNEL_ARTIFACT_NAME =3D "<artifact name>"
>
> 2. Multiple multiconfigs that have different
>
> PREFFERRED_PROVIDER_virtual/kernel
>
> Of course assigned to the different kernels.
>
> 3. Wic image or image recipes that pull in all the kernels
>
> do_rootfs[depends] +=3D "\
> virtual/kernel:do_bundle_initramfs \
> virtual/kernel:do_deploy"
>
> do_rootfs[mcdepends] +=3D "\
> mc:from_distro:to_distro:virtual/kernel:do_bundle_initramfs \
> mc:from_distro:to_distro:virtual/kernel:do_deploy"
>
> This patch series gives us the best opportunity for the cases above
> without brittle special cases. If you don't replace each kernel- prefix
> with a variable you end up with build time errors.
>
> Can update the description to explain use cases and why this change is
> needed, but are the above statements okay with you before I submit more
> patches? Or do we need to work out more of a justification for the patch
> series?
>
> On Sun, Jul 12, 2026, 4:40=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
> wrote:
>
>> On Sun, Jul 12, 2026 at 2:43=E2=80=AFPM Vincent Davis Jr via
>> lists.openembedded.org <vince=3Dunderview.tech@lists.openembedded.org>
>> wrote:
>> >
>> > A number of recipes rely on hard coded
>> > kernel prefix set by KERNEL_PACKAGE_NAME
>> > when including modules. This leads to build
>> > time failures such as.
>> >
>> > ERROR: Nothing RPROVIDES 'kernel-module-*'
>> >
>> > Commit globally defines variable so that
>> > recipes aren't reliant on hardcoded 'kernel'
>> > prefix.
>> >
>> > Commit also updates variables
>> >
>> > STAGING_KERNEL_DIR
>> > STAGING_KERNEL_BUILDDIR
>> >
>> > STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR get
>> > changed from default defined in bitbake.conf in
>> > the kernel.bbclass. The reason was to set these
>> > variables to directories under WORKDIR in alternate
>> > kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=3D kernel)
>> > so that they may build in parallel with the default
>> > kernel without clobbering. The issue is that the variables
>> > only get changed in kernel recipes. So, other recipes
>> > such as perf and make-mod-scripts don't know the
>> > location of virtual/kernel WORKDIR.
>> >
>> > Solution is to include KERNEL_PACKAGE_NAME in
>> > STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR
>> > so recipes like perf and make-mod-scripts can
>> > find virtual/kernel source and solve the
>> > clobbering of build artifacts issue.
>>
>> These descriptions cover what you've changed, and
>> how they are cooredinated .. but you haven't explained *why*
>>
>> What problem does this solve? This introduces
>> complexity throughout the code base, so there has to be an
>> appropriately significant use case to justify it.
>>
>> and "We are changing the kernel package name" is not a sufficient
>> justification.
>> a reason, that is obviously something you are doing.
>>
>> Bruce
>>
>> >
>> > Signed-off-by: Vincent Davis Jr <vince@underview.tech>
>> > ---
>> >  meta/conf/bitbake.conf | 7 +++++--
>> >  1 file changed, 5 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> > index bdf37d0da2..569b83a138 100644
>> > --- a/meta/conf/bitbake.conf
>> > +++ b/meta/conf/bitbake.conf
>> > @@ -479,6 +479,9 @@ SDKPATHINSTALL =3D
>> "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
>> >  # Kernel info.
>> >  ##################################################################
>> >
>> > +# Globally define base string for kernel packages
>> > +KERNEL_PACKAGE_NAME ??=3D "kernel"
>> > +
>> >  OLDEST_KERNEL =3D "5.15"
>> >
>> >  # SDK_OLDEST_KERNEL can't be set using overrides since there are
>> > @@ -490,8 +493,8 @@ SDK_OLDEST_KERNEL =3D "3.2.0"
>> >  # they are staged.
>> >  KERNEL_SRC_PATH =3D "/usr/src/kernel"
>> >
>> > -STAGING_KERNEL_DIR =3D "${TMPDIR}/work-shared/${MACHINE}/kernel-sourc=
e"
>> > -STAGING_KERNEL_BUILDDIR =3D
>> "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
>> > +STAGING_KERNEL_DIR =3D
>> "${TMPDIR}/work-shared/${MACHINE}/${KERNEL_PACKAGE_NAME}/kernel-source"
>> > +STAGING_KERNEL_BUILDDIR =3D
>> "${TMPDIR}/work-shared/${MACHINE}/${KERNEL_PACKAGE_NAME}/kernel-build-ar=
tifacts"
>> >
>> >  ##################################################################
>> >  # Specific image creation and rootfs population info.
>> > --
>> > 2.43.0
>> >
>> >
>> >
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240819):
> https://lists.openembedded.org/g/openembedded-core/message/240819
> Mute This Topic: https://lists.openembedded.org/mt/120238087/7072109
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [vince@underview.tech]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cca6f00656710d6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">To explain why anyone would ever want two or more differe=
nt types of kernels on a single partition.<div dir=3D"auto"><br></div><div =
dir=3D"auto">Let&#39;s say a company requires you keep swupdate on a separa=
te rootfs from normal operation apps. You&#39;d have to create 2 separate D=
ISTRO&#39;s to define separate kernel per DISTRO. Making it harder to place=
 both rootfs (kernel+initramfs is really what I mean) in the same wic.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">If you can build multiple di=
fferent kernels + initramfs in the same DISTRO you avoid the problem entire=
ly.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Can create a repo wi=
th mockup ideal of what I&#39;m trying to achieve. If need be.</div></div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jul 12, 2026, 5:38=E2=80=AFPM Vincent Davis Jr via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;vi=
nce=3D<a href=3D"mailto:underview.tech@lists.openembedded.org">underview.te=
ch@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div dir=3D"auto">Hey,<div dir=3D"auto"><br></div><div dir=3D"auto">T=
here are 2 use cases the first being if the caller simply wants to change K=
ERNEL_PACKAGE_NAME in their distro. They&#39;ll run into the runtime error =
described in patch description. This can be tested by just changing the nam=
e in the kernel.bbclass.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>The second being if you want to build 2 or more kernels with different ini=
tramfs contained in each kernel using one DISTRO.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">You&#39;d have to define</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">1. Multiple kernel recipes with variables bellow=
 so not to name mangle</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
NITRAMFS_IMAGE_BUNDLE =3D &quot;1&quot;</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">INITRAMFS_IMAGE =3D &quot;&lt;recipe name&gt;&quot;</div><d=
iv dir=3D"auto">INITRAMFS_IMAGE_NAME =3D &quot;&lt;recipe image name&gt;&qu=
ot;</div><div dir=3D"auto"><br></div><div dir=3D"auto">KERNEL_PACKAGE_NAME =
=3D &quot;&lt;pkn&gt;&quot;</div><div dir=3D"auto">KERNEL_ARTIFACT_NAME =3D=
 &quot;&lt;artifact name&gt;&quot;</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">2. Multiple multiconfigs that have different</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">PREFFERRED_PROVIDER_virtual/kernel</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Of course assigned to the differ=
ent kernels.</div><div dir=3D"auto"><br></div><div dir=3D"auto">3. Wic imag=
e or image recipes that pull in all the kernels</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">do_rootfs[depends] +=3D &quot;\</div><div dir=3D"au=
to">virtual/kernel:do_bundle_initramfs \</div><div dir=3D"auto">virtual/ker=
nel:do_deploy&quot;</div><div dir=3D"auto"><br></div><div dir=3D"auto">do_r=
ootfs[mcdepends] +=3D &quot;\</div><div dir=3D"auto">mc:from_distro:to_dist=
ro:virtual/kernel:do_bundle_initramfs \</div><div dir=3D"auto">mc:from_dist=
ro:to_distro:virtual/kernel:do_deploy&quot;</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">This patch series gives us the best opportunity for the=
 cases above without brittle special cases. If you don&#39;t replace each k=
ernel- prefix with a variable you end up with build time errors.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Can update the description to expl=
ain use cases and why this change is needed, but are the above statements o=
kay with you before I submit more patches? Or do we need to work out more o=
f a justification for the patch series?</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 12, 2026, 4:40=E2=
=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Sun, Jul 12, 2026 at 2:43=E2=80=
=AFPM Vincent Davis Jr via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer nore=
ferrer" target=3D"_blank">lists.openembedded.org</a> &lt;vince=3D<a href=3D=
"mailto:underview.tech@lists.openembedded.org" rel=3D"noreferrer noreferrer=
" target=3D"_blank">underview.tech@lists.openembedded.org</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; A number of recipes rely on hard coded<br>
&gt; kernel prefix set by KERNEL_PACKAGE_NAME<br>
&gt; when including modules. This leads to build<br>
&gt; time failures such as.<br>
&gt;<br>
&gt; ERROR: Nothing RPROVIDES &#39;kernel-module-*&#39;<br>
&gt;<br>
&gt; Commit globally defines variable so that<br>
&gt; recipes aren&#39;t reliant on hardcoded &#39;kernel&#39;<br>
&gt; prefix.<br>
&gt;<br>
&gt; Commit also updates variables<br>
&gt;<br>
&gt; STAGING_KERNEL_DIR<br>
&gt; STAGING_KERNEL_BUILDDIR<br>
&gt;<br>
&gt; STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR get<br>
&gt; changed from default defined in bitbake.conf in<br>
&gt; the kernel.bbclass. The reason was to set these<br>
&gt; variables to directories under WORKDIR in alternate<br>
&gt; kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=3D kernel)<br>
&gt; so that they may build in parallel with the default<br>
&gt; kernel without clobbering. The issue is that the variables<br>
&gt; only get changed in kernel recipes. So, other recipes<br>
&gt; such as perf and make-mod-scripts don&#39;t know the<br>
&gt; location of virtual/kernel WORKDIR.<br>
&gt;<br>
&gt; Solution is to include KERNEL_PACKAGE_NAME in<br>
&gt; STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR<br>
&gt; so recipes like perf and make-mod-scripts can<br>
&gt; find virtual/kernel source and solve the<br>
&gt; clobbering of build artifacts issue.<br>
<br>
These descriptions cover what you&#39;ve changed, and<br>
how they are cooredinated .. but you haven&#39;t explained *why*<br>
<br>
What problem does this solve? This introduces<br>
complexity throughout the code base, so there has to be an<br>
appropriately significant use case to justify it.<br>
<br>
and &quot;We are changing the kernel package name&quot; is not a sufficient=
 justification.<br>
a reason, that is obviously something you are doing.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Signed-off-by: Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/bitbake.conf | 7 +++++--<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index bdf37d0da2..569b83a138 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -479,6 +479,9 @@ SDKPATHINSTALL =3D &quot;/usr/local/${SDK_NAME_PRE=
FIX}-${SDK_ARCH}&quot;<br>
&gt;=C2=A0 # Kernel info.<br>
&gt;=C2=A0 ################################################################=
##<br>
&gt;<br>
&gt; +# Globally define base string for kernel packages<br>
&gt; +KERNEL_PACKAGE_NAME ??=3D &quot;kernel&quot;<br>
&gt; +<br>
&gt;=C2=A0 OLDEST_KERNEL =3D &quot;5.15&quot;<br>
&gt;<br>
&gt;=C2=A0 # SDK_OLDEST_KERNEL can&#39;t be set using overrides since there=
 are<br>
&gt; @@ -490,8 +493,8 @@ SDK_OLDEST_KERNEL =3D &quot;3.2.0&quot;<br>
&gt;=C2=A0 # they are staged.<br>
&gt;=C2=A0 KERNEL_SRC_PATH =3D &quot;/usr/src/kernel&quot;<br>
&gt;<br>
&gt; -STAGING_KERNEL_DIR =3D &quot;${TMPDIR}/work-shared/${MACHINE}/kernel-=
source&quot;<br>
&gt; -STAGING_KERNEL_BUILDDIR =3D &quot;${TMPDIR}/work-shared/${MACHINE}/ke=
rnel-build-artifacts&quot;<br>
&gt; +STAGING_KERNEL_DIR =3D &quot;${TMPDIR}/work-shared/${MACHINE}/${KERNE=
L_PACKAGE_NAME}/kernel-source&quot;<br>
&gt; +STAGING_KERNEL_BUILDDIR =3D &quot;${TMPDIR}/work-shared/${MACHINE}/${=
KERNEL_PACKAGE_NAME}/kernel-build-artifacts&quot;<br>
&gt;<br>
&gt;=C2=A0 ################################################################=
##<br>
&gt;=C2=A0 # Specific image creation and rootfs population info.<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#240819): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240819" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/240819</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120238087/707=
2109" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120238087/7072109</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [vince@underview.tech]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cca6f00656710d6c--


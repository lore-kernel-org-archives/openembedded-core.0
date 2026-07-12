Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852C0C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 22:44:15 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4648.1783896248057533698
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 15:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=X8S8+LWV;
 spf=pass (domain: underview.tech, ip: 209.85.128.49, mailfrom: vince@underview.tech)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso23201345e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 15:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783896246; cv=none;
        d=google.com; s=arc-20260327;
        b=fIm+MO3QpwkKbqec9Tt904/W/5PLJ2MRtUjySHdJVlFaqegyxiKzR8gNTRW7flIRWl
         Cpxr4ZdcySs/SkZNrejt+f+8hagKqyzu6D8U3fCMeaTnJV6btSJF1bg+6fpr2UJla5XM
         DnyXfJ+ihs2pr5WE32zlfRainbTy/6aZCRECT/SgrM5B+i6oVH7cwZ0uqnSJ1UJ4F7RT
         gVmopb7d+gm+3SvJPou4FVC2K4ieSRqk+0aDyoOMrw3gdXX8FSY62lIwMgLY6BGd3Lms
         3YT/wNKO5H1TbY8HaOFcseXZX7WyjRvZ5ajFNYKZhM6PWZ5Ky9hUSh2m/U18SSn9xbWe
         hA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+BAzSsoUsIZG/VRQ6Uxkqm0xWEcYhyAFcPYO04RLQK4=;
        fh=walQ4d3AcnMYov3/9DCo2hKgw+fnuxZ4wqB++TkwDvo=;
        b=RUHDRQpk3Z0DO6Hc1ix/aRE1hyGCUtXahsDvGtUlAhP2U9vjeRiFfREQWKuo4IIEo8
         gpWJgibdbIcR4xos/5fS4JitBD2pBKGWhRpwCvPH/zsPEZ1pGK/UNreYJf8MuBoYuR/H
         BN4sPJwfv9aGqJxwjdtXPw28NgwiqCNc0+0yOTdk8k9Ipjj0R53wpKNniiNgcx3F5zhb
         yndeDudOIJoJNc18KcqczvKVLcEKKzWbLltAO9FLgD1U9mUnSaTVAs/HQfvBaUpRyTQo
         LGE4kCON1L9erSPIkBPqH2SB4mTAOI18/+OySMMrRdDGfnANGhdbfiRVux+EGUFYLWr7
         spZQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783896246; x=1784501046; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BAzSsoUsIZG/VRQ6Uxkqm0xWEcYhyAFcPYO04RLQK4=;
        b=X8S8+LWVP+AbGM9KxcgVdcVujUcUUkfCWwqi5Oio4JfRe3NA5X8aB269KlTif//atZ
         w4hWi5eOYXaZAr+AYLUoR2k2MYfQizkW3HWVFZA7XgO+M3c8icW83pyz8vwHx8ynj0Ks
         SAsEzofEsGhjqPso4cFkaePd3kmzrkrWei5Y8xP1lcOTuH6glbpSLfP39OPg/ZqKIrxf
         NAZK72LWIoNQVX01VpXnWf0QeedHaMVyeaWUj3sRGLtn8FKF7EgKdgKhKXkN8iyFT7VW
         QBu34gViymAIcBWz2d115V6BVvIbBO+11L6lVP/oKGP/k/E1xMYi65l3dlftoFP14ikG
         31jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783896246; x=1784501046;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+BAzSsoUsIZG/VRQ6Uxkqm0xWEcYhyAFcPYO04RLQK4=;
        b=sbrfKeox3LDa5BidsySnenNAvDvvdMFqwq2T+iGKJop9m8YBG3PmejsEnkL6csNJBl
         mcnOSkgenQOLIckPNEMJn2ySNt8+geRgGcN/TM4yvJP7ru0LSHEC6Od3itPELS3n8bf9
         rbx7EiowyWbAqZP38xs85jyqHeMFClUOJjCWkKQM+2rbCfLxJLF3h1fFGSnMoiBufuhv
         eEVni8E8aHpxbWfx5rgn15kHdb4oN2p368NQuwraYgbGxMXEFs0TSmESQ+jGfH2Urodn
         vslUJlntG3mBGopq0Q28wj49PQT5UzohbQGEd+6sydQr3VOKP4w3+Tg3EoZzVg1nbAMb
         AYPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxNT0kKIMVr7BT8iGbPHpl9Hxh0kcOJcH55x1E5xwls1KOYO52M4KK8Gvln1HGJXhlGAM7CM+J4PBeu6w4a3ROtw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzWSzVfRNyU8bnfrAZMF9LA54G85hRKdW/Olcx/O59+01hGRDE4
	5OwL1Ef4s1Av9lEL3lve3UeT8Z+jIjwoGdYqUEs9jHCgPFaa3HzfNRfHAVfL+Z+euJKh1WcvZzo
	v86bDxMe1sLsKEk3oKFPKuy7moeX9wiQxRrd3fl5yCg==
X-Gm-Gg: AfdE7cmANMGjjd+DCbLLrdUMC30mB+tQ7EVzmgzD0DtAPVytefgSPo2+cORFrH8obkB
	erR8Z4DSZETFRAVDz/sl3xBV+QD+VQJ1gb2kuVi0cL+sFOVRzHKxIcpqw26QhW4yUkWzj7lkmGk
	aj7r9pQGvE4UdNsrh5y1RPPn9+ny3t37QA3QUcVbubrJEBq38dLmYxsHbQdg4s7WWQRLAgUKcqX
	U98Ta6ASJQUwLeQY2kwXCjNSvjq2wwkydPfOB82FFoIJfDgghkzTVJXj17QoQt1pNUhbbrAhkW9
	wu11
X-Received: by 2002:a05:600c:b99:b0:493:aaa2:f034 with SMTP id
 5b1f17b1804b1-493f882ae23mr70756795e9.26.1783896246077; Sun, 12 Jul 2026
 15:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260712184307.3259642-1-vince@underview.tech>
 <CADkTA4NiK9hp-12OrhOVMPfVZG3paH8bCqc8SwAtzXVX=tDWjA@mail.gmail.com>
 <18C1A8990286DFDF.2110461@lists.openembedded.org> <18C1A99E719D8F0B.2110461@lists.openembedded.org>
In-Reply-To: <18C1A99E719D8F0B.2110461@lists.openembedded.org>
From: Vincent Davis <vince@underview.tech>
Date: Sun, 12 Jul 2026 18:43:54 -0400
X-Gm-Features: AUfX_mxMpxQdv7_bhXMK_A8ZLtF6Z2SZrfTCKwgJ0y9yh3Gpf709ztRbrmuCGZw
Message-ID: <CAPQx_gP6so5xbzYJP4U4O3epQ5GADco-JKg7kt3DkW0Gs55x5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 01/27] bitbake: globally define KERNEL_PACKAGE_NAME
To: Vincent Davis <vince@underview.tech>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000010587f065671b6b0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 22:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240821

--00000000000010587f065671b6b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Correction

KERNEL_PACKAGE_NAME
KERNEL_ARTIFACT_NAME

Are set in the multiconfig files.

On Sun, Jul 12, 2026, 5:57=E2=80=AFPM Vincent Davis Jr via lists.openembedd=
ed.org
<vince=3Dunderview.tech@lists.openembedded.org> wrote:

> To explain why anyone would ever want two or more different types of
> kernels on a single partition.
>
> Let's say a company requires you keep swupdate on a separate rootfs from
> normal operation apps. You'd have to create 2 separate DISTRO's to define
> separate kernel per DISTRO. Making it harder to place both rootfs
> (kernel+initramfs is really what I mean) in the same wic.
>
> If you can build multiple different kernels + initramfs in the same DISTR=
O
> you avoid the problem entirely.
>
> Can create a repo with mockup ideal of what I'm trying to achieve. If nee=
d
> be.
>
> On Sun, Jul 12, 2026, 5:38=E2=80=AFPM Vincent Davis Jr via lists.openembe=
dded.org
> <vince=3Dunderview.tech@lists.openembedded.org> wrote:
>
>> Hey,
>>
>> There are 2 use cases the first being if the caller simply wants to
>> change KERNEL_PACKAGE_NAME in their distro. They'll run into the runtime
>> error described in patch description. This can be tested by just changin=
g
>> the name in the kernel.bbclass.
>>
>> The second being if you want to build 2 or more kernels with different
>> initramfs contained in each kernel using one DISTRO.
>>
>> You'd have to define
>>
>> 1. Multiple kernel recipes with variables bellow so not to name mangle
>>
>> INITRAMFS_IMAGE_BUNDLE =3D "1"
>>
>> INITRAMFS_IMAGE =3D "<recipe name>"
>> INITRAMFS_IMAGE_NAME =3D "<recipe image name>"
>>
>> KERNEL_PACKAGE_NAME =3D "<pkn>"
>> KERNEL_ARTIFACT_NAME =3D "<artifact name>"
>>
>> 2. Multiple multiconfigs that have different
>>
>> PREFFERRED_PROVIDER_virtual/kernel
>>
>> Of course assigned to the different kernels.
>>
>> 3. Wic image or image recipes that pull in all the kernels
>>
>> do_rootfs[depends] +=3D "\
>> virtual/kernel:do_bundle_initramfs \
>> virtual/kernel:do_deploy"
>>
>> do_rootfs[mcdepends] +=3D "\
>> mc:from_distro:to_distro:virtual/kernel:do_bundle_initramfs \
>> mc:from_distro:to_distro:virtual/kernel:do_deploy"
>>
>> This patch series gives us the best opportunity for the cases above
>> without brittle special cases. If you don't replace each kernel- prefix
>> with a variable you end up with build time errors.
>>
>> Can update the description to explain use cases and why this change is
>> needed, but are the above statements okay with you before I submit more
>> patches? Or do we need to work out more of a justification for the patch
>> series?
>>
>> On Sun, Jul 12, 2026, 4:40=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gma=
il.com>
>> wrote:
>>
>>> On Sun, Jul 12, 2026 at 2:43=E2=80=AFPM Vincent Davis Jr via
>>> lists.openembedded.org <vince=3Dunderview.tech@lists.openembedded.org>
>>> wrote:
>>> >
>>> > A number of recipes rely on hard coded
>>> > kernel prefix set by KERNEL_PACKAGE_NAME
>>> > when including modules. This leads to build
>>> > time failures such as.
>>> >
>>> > ERROR: Nothing RPROVIDES 'kernel-module-*'
>>> >
>>> > Commit globally defines variable so that
>>> > recipes aren't reliant on hardcoded 'kernel'
>>> > prefix.
>>> >
>>> > Commit also updates variables
>>> >
>>> > STAGING_KERNEL_DIR
>>> > STAGING_KERNEL_BUILDDIR
>>> >
>>> > STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR get
>>> > changed from default defined in bitbake.conf in
>>> > the kernel.bbclass. The reason was to set these
>>> > variables to directories under WORKDIR in alternate
>>> > kernel recipes (I.e. where KERNEL_PACKAGE_NAME !=3D kernel)
>>> > so that they may build in parallel with the default
>>> > kernel without clobbering. The issue is that the variables
>>> > only get changed in kernel recipes. So, other recipes
>>> > such as perf and make-mod-scripts don't know the
>>> > location of virtual/kernel WORKDIR.
>>> >
>>> > Solution is to include KERNEL_PACKAGE_NAME in
>>> > STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR
>>> > so recipes like perf and make-mod-scripts can
>>> > find virtual/kernel source and solve the
>>> > clobbering of build artifacts issue.
>>>
>>> These descriptions cover what you've changed, and
>>> how they are cooredinated .. but you haven't explained *why*
>>>
>>> What problem does this solve? This introduces
>>> complexity throughout the code base, so there has to be an
>>> appropriately significant use case to justify it.
>>>
>>> and "We are changing the kernel package name" is not a sufficient
>>> justification.
>>> a reason, that is obviously something you are doing.
>>>
>>> Bruce
>>>
>>> >
>>> > Signed-off-by: Vincent Davis Jr <vince@underview.tech>
>>> > ---
>>> >  meta/conf/bitbake.conf | 7 +++++--
>>> >  1 file changed, 5 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> > index bdf37d0da2..569b83a138 100644
>>> > --- a/meta/conf/bitbake.conf
>>> > +++ b/meta/conf/bitbake.conf
>>> > @@ -479,6 +479,9 @@ SDKPATHINSTALL =3D
>>> "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
>>> >  # Kernel info.
>>> >  ##################################################################
>>> >
>>> > +# Globally define base string for kernel packages
>>> > +KERNEL_PACKAGE_NAME ??=3D "kernel"
>>> > +
>>> >  OLDEST_KERNEL =3D "5.15"
>>> >
>>> >  # SDK_OLDEST_KERNEL can't be set using overrides since there are
>>> > @@ -490,8 +493,8 @@ SDK_OLDEST_KERNEL =3D "3.2.0"
>>> >  # they are staged.
>>> >  KERNEL_SRC_PATH =3D "/usr/src/kernel"
>>> >
>>> > -STAGING_KERNEL_DIR =3D "${TMPDIR}/work-shared/${MACHINE}/kernel-sour=
ce"
>>> > -STAGING_KERNEL_BUILDDIR =3D
>>> "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
>>> > +STAGING_KERNEL_DIR =3D
>>> "${TMPDIR}/work-shared/${MACHINE}/${KERNEL_PACKAGE_NAME}/kernel-source"
>>> > +STAGING_KERNEL_BUILDDIR =3D
>>> "${TMPDIR}/work-shared/${MACHINE}/${KERNEL_PACKAGE_NAME}/kernel-build-a=
rtifacts"
>>> >
>>> >  ##################################################################
>>> >  # Specific image creation and rootfs population info.
>>> > --
>>> > 2.43.0
>>> >
>>> >
>>> >
>>> >
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240820):
> https://lists.openembedded.org/g/openembedded-core/message/240820
> Mute This Topic: https://lists.openembedded.org/mt/120238087/7072109
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [vince@underview.tech]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000010587f065671b6b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Correction<div dir=3D"auto"><br></div><div dir=3D"auto">K=
ERNEL_PACKAGE_NAME</div><div dir=3D"auto">KERNEL_ARTIFACT_NAME</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Are set in the multiconfig files.</d=
iv></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sun, Jul 12, 2026, 5:57=E2=80=AFPM Vincent Davi=
s Jr via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</=
a> &lt;vince=3D<a href=3D"mailto:underview.tech@lists.openembedded.org">und=
erview.tech@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"auto">To explain why anyone would ever want two =
or more different types of kernels on a single partition.<div dir=3D"auto">=
<br></div><div dir=3D"auto">Let&#39;s say a company requires you keep swupd=
ate on a separate rootfs from normal operation apps. You&#39;d have to crea=
te 2 separate DISTRO&#39;s to define separate kernel per DISTRO. Making it =
harder to place both rootfs (kernel+initramfs is really what I mean) in the=
 same wic.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If you can bu=
ild multiple different kernels + initramfs in the same DISTRO you avoid the=
 problem entirely.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Can c=
reate a repo with mockup ideal of what I&#39;m trying to achieve. If need b=
e.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Sun, Jul 12, 2026, 5:38=E2=80=AFPM Vincent Davis Jr via <a href=
=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">lis=
ts.openembedded.org</a> &lt;vince=3D<a href=3D"mailto:underview.tech@lists.=
openembedded.org" target=3D"_blank" rel=3D"noreferrer">underview.tech@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv dir=3D"auto">Hey,<div dir=3D"auto"><br></div><div dir=3D"auto">There are=
 2 use cases the first being if the caller simply wants to change KERNEL_PA=
CKAGE_NAME in their distro. They&#39;ll run into the runtime error describe=
d in patch description. This can be tested by just changing the name in the=
 kernel.bbclass.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The sec=
ond being if you want to build 2 or more kernels with different initramfs c=
ontained in each kernel using one DISTRO.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">You&#39;d have to define</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">1. Multiple kernel recipes with variables bellow so not =
to name mangle</div><div dir=3D"auto"><br></div><div dir=3D"auto">INITRAMFS=
_IMAGE_BUNDLE =3D &quot;1&quot;</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">INITRAMFS_IMAGE =3D &quot;&lt;recipe name&gt;&quot;</div><div dir=
=3D"auto">INITRAMFS_IMAGE_NAME =3D &quot;&lt;recipe image name&gt;&quot;</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">KERNEL_PACKAGE_NAME =3D &q=
uot;&lt;pkn&gt;&quot;</div><div dir=3D"auto">KERNEL_ARTIFACT_NAME =3D &quot=
;&lt;artifact name&gt;&quot;</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">2. Multiple multiconfigs that have different</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">PREFFERRED_PROVIDER_virtual/kernel</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Of course assigned to the different k=
ernels.</div><div dir=3D"auto"><br></div><div dir=3D"auto">3. Wic image or =
image recipes that pull in all the kernels</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">do_rootfs[depends] +=3D &quot;\</div><div dir=3D"auto">v=
irtual/kernel:do_bundle_initramfs \</div><div dir=3D"auto">virtual/kernel:d=
o_deploy&quot;</div><div dir=3D"auto"><br></div><div dir=3D"auto">do_rootfs=
[mcdepends] +=3D &quot;\</div><div dir=3D"auto">mc:from_distro:to_distro:vi=
rtual/kernel:do_bundle_initramfs \</div><div dir=3D"auto">mc:from_distro:to=
_distro:virtual/kernel:do_deploy&quot;</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">This patch series gives us the best opportunity for the case=
s above without brittle special cases. If you don&#39;t replace each kernel=
- prefix with a variable you end up with build time errors.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Can update the description to explain=
 use cases and why this change is needed, but are the above statements okay=
 with you before I submit more patches? Or do we need to work out more of a=
 justification for the patch series?</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 12, 2026, 4:40=E2=80=
=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" rel=3D=
"noreferrer noreferrer" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Sun, Jul 12, 2026 at 2:43=
=E2=80=AFPM Vincent Davis Jr via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer nore=
ferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;vince=
=3D<a href=3D"mailto:underview.tech@lists.openembedded.org" rel=3D"noreferr=
er noreferrer noreferrer" target=3D"_blank">underview.tech@lists.openembedd=
ed.org</a>&gt;<br>
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
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#240820): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240820" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/240820</a><=
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

--00000000000010587f065671b6b0--


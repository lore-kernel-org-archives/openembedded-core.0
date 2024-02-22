Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F074CC47DD9
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 21:56:40 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.25498.1708638992991930098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 13:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G4BCeVi0;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-29a61872f4eso217498a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 13:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708638992; x=1709243792; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7J86+azZRvosK45ldcA1GN+GYnpXnHzzHLpoaby3+VU=;
        b=G4BCeVi0ENes4qE0lLw+WxXBwfGVgB0wj6tXLPVxcu3EFjghJ2hNQ1/8f5+nyqhxTQ
         Sxfo/kAKRGuTYvsDvWT1mteBG+7SgaXiW25sOsDjAu3C+t1rdo4fDLk9tIRlnhNU2qYB
         T/5lUKWYWd5kpmhKc8wOc6hy5e8AdfF0zQWaYLU9Ru/cQcL22b84l+JKl6cTu5EH6AOB
         fSwyXXAmJF6xihl2SA37b+ieLnY4Xxv+QF8FDvISHI8mBv/Dei9iT9WTCn2ikOdWXuXQ
         wMc63An8JAYcECYVFKhZOy+ryyjSt2vYZiuOYjyq2WFqK94NehlD9cGxGIpjnDQ8nkze
         AtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708638992; x=1709243792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7J86+azZRvosK45ldcA1GN+GYnpXnHzzHLpoaby3+VU=;
        b=fTLPvvV32IuXw1DbRnyG4tBxhj92p5/7ifk7GF12BdhDFHETF6GjCJCBINQp+49oAZ
         RVnixHim8v7e0wVIo9n7DetUD5gf/OhE3aJ4uLge3am8q/A+r5WarcGNUneJWVeMpVcu
         bo1W8DlqtFtwNiGCGj1LZTqrHNnff+AQ8oXItM+loqOiuFd6KmpuUikoRlTAuaMVf53W
         aYOO3QYg5M/7hMlP1WgU2kbu5BRws92bqTTRaWiEgGFC7XADW4LSxeXgPSaRY5e+WyiV
         6H0AYNdFzeTw4vMRcNYwC3iuT3TpzE9N4RkusvZAOacFXrNAuWKoMi6ys16ebLX12ySz
         OXfA==
X-Forwarded-Encrypted: i=1; AJvYcCX32wMi2x8C9sFJ9oY3HNph+/f8+Ttpe3w1bTw0k+Ftm8r5a6WM7WKY/y5hvCkOx9yDNOaffatltlkltokk6jNFku5kRungnaKJIQzbT064VcqnB0slYj+g
X-Gm-Message-State: AOJu0Yzyk6BHe6qx5uSra7ysdyl7+CpaEiyFKgKzF30NEmC5VZx+MkTJ
	6AqpnUOkscerLxLacd+ZBOHo5JZMBR8O7lnJX+Bq+oimneCgxKWKWcSOKYRDG11RArBtqHtFqQ6
	4yZ9OqdSRFk3ZgkPkI169pDRsD9AtEU2D
X-Google-Smtp-Source: AGHT+IFbiIpWbZz57xiFQpT4eJtKIzK8l6e4HKX1CgXspVo2kPe7aQ8dgPWxOT2eipWll5J/V2/z0HLG7wkgqikVHTE=
X-Received: by 2002:a17:90b:1902:b0:29a:427a:2c83 with SMTP id
 mp2-20020a17090b190200b0029a427a2c83mr99488pjb.29.1708638992340; Thu, 22 Feb
 2024 13:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20240222103545.2970387-1-andreaskleist@gmail.com>
 <20240222103545.2970387-4-andreaskleist@gmail.com> <b0eff6e6-f931-4fff-bcf4-dcff40562fc8@ti.com>
In-Reply-To: <b0eff6e6-f931-4fff-bcf4-dcff40562fc8@ti.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Feb 2024 16:56:21 -0500
Message-ID: <CADkTA4NqBZafroO5qVQ9ATM1_xNidxkwmkVTPb9msDhGiooceA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 3/3] kernel: make LOCALVERSION
 consistent between recipes
To: reatmon@ti.com
Cc: Andreas Helbech Kleist <andreaskleist@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 21:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196044

On Thu, Feb 22, 2024 at 4:51=E2=80=AFPM Ryan Eatmon via lists.openembedded.=
org
<reatmon=3Dti.com@lists.openembedded.org> wrote:
>
>
>
> On 2/22/2024 4:35 AM, Andreas Helbech Kleist wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The initial fix for localversion setting in 6.3+ broke older
> > recipes and also broke recipes setting localversion in a kernel
> > recipe, as make-mod-scripts (and other locations) can trigger
> > a regeneration of files and don't have access to the variable.
> >
> > Moving the setting of this variable to the global namespace
> > doesn't make sense, so we follow the example of the kernel-abiversion
> > and save a kernel-localversion to the build artifacts.
> >
> > Recipes that may regenerate scripts/dynamic files, must
> > depend on the do_shared_workedir of the kernel and use the helper
> > function to read the file storing the localversion.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >
> > cherry-picked from master b378eec156998eea55ba61e59103cb34fab0d07c
> >
> > Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
>
> I'm not sure what is going on with our meta-ti testing.  This set of
> changes causes the same issue we were seeing before.  Plus, now that I'm
> looking into it deeper, I'm seeing a breakage in master related to these
> same patches on there.  Not sure why the changes were not caught in our
> testing on master back when the patches were accepted there...  Clearly
> I need some better checks on the images as part of our QC process...
>
> I need to figure out how to fix the issue on master and see if the same
> change can be applied to these patches on kirkstone.  I'll try and get
> all this done as quickly as I can.

Please make sure to copy me directly, both as the maintainer of the
parts of core in question and the author of the patches.

We've had no reports of issues since any of these went in, and they
aren't exactly a recent change. Which obviously means there's
potentially something different in the environment or the kernel
recipes.

If you get a set of reproducing steps with linux-yocto and core, I
can lend a hand with any fixes.

Bruce

>
>
>
> > ---
> >   meta/classes/kernel-arch.bbclass                   |  8 --------
> >   meta/classes/kernel.bbclass                        | 14 +++++++++++++=
+
> >   meta/classes/kernelsrc.bbclass                     |  1 +
> >   meta/classes/linux-kernel-base.bbclass             | 11 +++++++++++
> >   meta/classes/module-base.bbclass                   |  1 +
> >   .../make-mod-scripts/make-mod-scripts_1.0.bb       |  3 +++
> >   6 files changed, 30 insertions(+), 8 deletions(-)
> >
> > diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arc=
h.bbclass
> > index 0a79dea0af..62c8211621 100644
> > --- a/meta/classes/kernel-arch.bbclass
> > +++ b/meta/classes/kernel-arch.bbclass
> > @@ -65,11 +65,3 @@ KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_=
KERNEL_ARCH} -fuse-ld=3Dbfd ${DE
> >   KERNEL_LD =3D "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
> >   KERNEL_AR =3D "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> >   TOOLCHAIN ?=3D "gcc"
> > -
> > -# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" i=
n
> > -# the local version. Having it empty means nothing will be added, and =
any
> > -# value will be appended to the local kernel version. This replaces th=
e
> > -# use of .scmversion file for setting a localversion without using
> > -# the CONFIG_LOCALVERSION option.
> > -KERNEL_LOCALVERSION ??=3D ""
> > -export LOCALVERSION ?=3D "${KERNEL_LOCALVERSION}"
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 940f1a3cf4..96e41b5192 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -541,6 +541,7 @@ do_shared_workdir () {
> >       #
> >
> >       echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-abiv=
ersion
> > +     echo "${KERNEL_LOCALVERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}=
-localversion
> >
> >       # Copy files required for module builds
> >       cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> > @@ -630,6 +631,19 @@ python check_oldest_kernel() {
> >   check_oldest_kernel[vardepsexclude] +=3D "OLDEST_KERNEL KERNEL_VERSIO=
N"
> >   do_configure[prefuncs] +=3D "check_oldest_kernel"
> >
> > +KERNEL_LOCALVERSION ??=3D ""
> > +
> > +# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" i=
n
> > +# the local version. Having it empty means nothing will be added, and =
any
> > +# value will be appended to the local kernel version. This replaces th=
e
> > +# use of .scmversion file for setting a localversion without using
> > +# the CONFIG_LOCALVERSION option.
> > +#
> > +# Note: This class saves the value of localversion to a file
> > +# so other recipes like make-mod-scripts can restore it via the
> > +# helper function get_kernellocalversion_file
> > +export LOCALVERSION=3D"${KERNEL_LOCALVERSION}"
> > +
> >   kernel_do_configure() {
> >       # fixes extra + in /lib/modules/2.6.37+
> >       # $ scripts/setlocalversion . =3D> +
> > diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bb=
class
> > index a951ba3325..a79bf18b09 100644
> > --- a/meta/classes/kernelsrc.bbclass
> > +++ b/meta/classes/kernelsrc.bbclass
> > @@ -5,6 +5,7 @@ do_patch[depends] +=3D "virtual/kernel:do_shared_workdi=
r"
> >   do_patch[noexec] =3D "1"
> >   do_package[depends] +=3D "virtual/kernel:do_populate_sysroot"
> >   KERNEL_VERSION =3D "${@get_kernelversion_file("${STAGING_KERNEL_BUILD=
DIR}")}"
> > +LOCAL_VERSION =3D "${@get_kernellocalversion_file("${STAGING_KERNEL_BU=
ILDDIR}")}"
> >
> >   inherit linux-kernel-base
> >
> > diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linu=
x-kernel-base.bbclass
> > index 73a6fe36d9..0e2a4a4abe 100644
> > --- a/meta/classes/linux-kernel-base.bbclass
> > +++ b/meta/classes/linux-kernel-base.bbclass
> > @@ -33,6 +33,17 @@ def get_kernelversion_file(p):
> >       except IOError:
> >           return None
> >
> > +def get_kernellocalversion_file(p):
> > +    fn =3D p + '/kernel-localversion'
> > +
> > +    try:
> > +        with open(fn, 'r') as f:
> > +            return f.readlines()[0].strip()
> > +    except IOError:
> > +        return ""
> > +
> > +    return ""
> > +
> >   def linux_module_packages(s, d):
> >       suffix =3D ""
> >       return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().r=
eplace('_', '-').replace('@', '+'), suffix), s.split()))
> > diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-bas=
e.bbclass
> > index 27bd69ff33..5b2fde8144 100644
> > --- a/meta/classes/module-base.bbclass
> > +++ b/meta/classes/module-base.bbclass
> > @@ -14,6 +14,7 @@ export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> >   export KBUILD_OUTPUT =3D "${STAGING_KERNEL_BUILDDIR}"
> >
> >   export KERNEL_VERSION =3D "${@oe.utils.read_file('${STAGING_KERNEL_BU=
ILDDIR}/kernel-abiversion')}"
> > +export LOCALVERSION =3D "${@oe.utils.read_file('${STAGING_KERNEL_BUILD=
DIR}/kernel-localversion')}"
> >   KERNEL_OBJECT_SUFFIX =3D ".ko"
> >
> >   # kernel modules are generally machine specific
> > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.=
bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > index f6f47cfff5..8727d003f9 100644
> > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > @@ -21,6 +21,9 @@ DEPENDS +=3D "gmp-native"
> >   EXTRA_OEMAKE =3D " HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFL=
AGS}" HOSTCPP=3D"${BUILD_CPP}""
> >   EXTRA_OEMAKE +=3D " HOSTCXX=3D"${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD=
_LDFLAGS}" CROSS_COMPILE=3D${TARGET_PREFIX}"
> >
> > +KERNEL_LOCALVERSION =3D "${@get_kernellocalversion_file("${STAGING_KER=
NEL_BUILDDIR}")}"
> > +export LOCALVERSION=3D"${KERNEL_LOCALVERSION}"
> > +
> >   # Build some host tools under work-shared.  CC, LD, and AR are probab=
ly
> >   # not used, but this is the historical way of invoking "make scripts"=
.
> >   #
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196043): https://lists.openembedded.org/g/openembedde=
d-core/message/196043
> Mute This Topic: https://lists.openembedded.org/mt/104505983/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


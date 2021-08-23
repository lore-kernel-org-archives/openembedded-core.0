Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.23240.1629723846682821187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 06:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jOIonUlk;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id i6so26103013edu.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 06:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q+ADLgiVv8pRXwDUA+AIu8h3cOq/HNXpjYAkzyQHCxM=;
        b=jOIonUlkhtBgI+40ToJu5TrFFLSPWQKxoc0iY4QinMaloP40H7GV0kS7WcZY4+grE8
         sxzRBdVsyMhLd34h79DFqs5Ecmyh3i1D15g6TExI0wlQSldinzLoSk2FZm1pkUssU/Z8
         XoE9CHMf9d2r+QvL69yr11YwbXLJdDmLvOn3D2Xq5QRv+4DQ8dddiNEQxi2daiO0TlgQ
         c5QdkCkXQVrRnC3IJKleQwLHNYZsy1C+SHVoJHrm3e+4ETbF1Rd/uM8fRBkSC3HdiOal
         0pP8tdvOCziI6kiUmnSiHRoNUG+miapuDrWwG7RHTVEfLhs2gC7YhVVyP6vcXvtDjq3g
         Xx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q+ADLgiVv8pRXwDUA+AIu8h3cOq/HNXpjYAkzyQHCxM=;
        b=gwFO6LJNmrCtYPaOKqmF0A6JzpX/rVPfIrqroz6HfIiCkhqOaSXUp3FdrR1x0jfXGl
         l9j/mDFLK/GY6aLyr+EaoqlpbwlQHrAiU7Q2Gl+nx8roQHvjZLlF7y+qvBZPTsdAET9y
         x4f41U0LY01Nhvph/oyq3nUR0Yv7VP7XGp6xI6dw1DjByUqe8+TZXp7Cka7h1/30EWt5
         9ZQVmp6OMQbsuRCP+Tnwd1Xw7BpDVpLNGiBMsufYv6kqZSlvojUd0A/+taO5nfwNJvHe
         BvyzaNg9QVsBkgfij0WIm7LHUyB5Z4Yg7hDvc51WlfpXk9AkD/DyPJ0JncK2I9NudcfI
         Pr3w==
X-Gm-Message-State: AOAM531i6XX23TVVmI/Uv5L8Zl+0qG2LZDvi8Y4MddZaIpJEi9PVRAOO
	cAMjGpIGUsivdDZDQC16uQ7B1g0EtuLDA01e72E=
X-Google-Smtp-Source: ABdhPJwmAhSIWcE3+gEM3lbzSkcZOLcRisx4lxJiK1MxvbD5rayITtrHWzhR2C+qeSEoBQvhbD4i9XVzj+r47HlhsVs=
X-Received: by 2002:aa7:cc83:: with SMTP id p3mr37660220edt.365.1629723845010;
 Mon, 23 Aug 2021 06:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210823122323.97400-1-zboszor@pr.hu> <20210823122323.97400-6-zboszor@pr.hu>
In-Reply-To: <20210823122323.97400-6-zboszor@pr.hu>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 23 Aug 2021 09:03:53 -0400
Message-ID: <CADkTA4NwEYtyROR_DDC=mK=7UCRR7eYeLi=KTEHBuc8-z9u7FA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] kernel.bbclass: Use full versions for inter-package dependencies
To: zboszor@pr.hu
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 8:23 AM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> Some Yocto users do use package repositories and sometimes the PR
> value is forgotten. Use full versions for inter-package dependencies
> for the kernel subpackages.

Can you expand this commit message ? What is the observable problem
with the full versions not being in the rdpends ?

I've run many different package feeds with different kernels and
modules, and haven't run into anything on this front, in my experience
the extended version in the package depends/provides causes issues
with some package managers .. so we'd need the testing for this
documented/provided so we could ensure that there are no hidden
issues.

Bruce


>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6dc5387a9b..9ec7daa17a 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -91,17 +91,18 @@ python __anonymous () {
>      kname =3D d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
>      imagedest =3D d.getVar('KERNEL_IMAGEDEST')
>
> +    fullver =3D d.getVar('EXTENDPKGV')
>      for type in types.split():
>          if bb.data.inherits_class('nopackages', d):
>              continue
>          typelower =3D type.lower()
>          d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
>          d.setVar('FILES:' + kname + '-image-' + typelower, '/' + imagede=
st + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type=
)
> -        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s' % (kname=
, typelower))
> +        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s (=3D %s)'=
 % (kname, typelower, fullver))
>          splitmods =3D d.getVar("KERNEL_SPLIT_MODULES")
>          if splitmods !=3D '1':
> -            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules' % kna=
me)
> -            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %=
s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
> +            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (=3D %=
s)' % (kname, fullver))
> +            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %=
s-modules-${KERNEL_VERSION_PKG_NAME} (=3D %s)' % (kname, fullver))
>              d.setVar('PKG:%s-modules' % kname, '%s-modules-${KERNEL_VERS=
ION_PKG_NAME}' % kname)
>              d.appendVar('RPROVIDES:%s-modules' % kname, '%s-modules-${KE=
RNEL_VERSION_PKG_NAME}' % kname)
>
> @@ -628,12 +629,12 @@ FILES:${KERNEL_PACKAGE_NAME}-image =3D ""
>  FILES:${KERNEL_PACKAGE_NAME}-dev =3D "/boot/System.map* /boot/Module.sym=
vers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KER=
NEL_VERSION}/build"
>  FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D "/boot/vmlinux-${KERNEL_VERSION=
_NAME}"
>  FILES:${KERNEL_PACKAGE_NAME}-modules =3D ""
> -RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base"
> +RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base (=3D ${=
EXTENDPKGV})"
>  # Allow machines to override this dependency if kernel image files are
>  # not wanted in images as standard
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-image"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?=3D "${KERNEL_PACKAGE_NAME}-image =
(=3D ${EXTENDPKGV})"
>  PKG:${KERNEL_PACKAGE_NAME}-image =3D "${KERNEL_PACKAGE_NAME}-image-${@le=
gitimize_package_name(d.getVar('KERNEL_VERSION'))}"
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-image +=3D "${@oe.utils.conditional('KER=
NEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-image +=3D "${@oe.utils.conditional('KER=
NEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (=3D ${EXTENDPKG=
V})', '', d)}"
>  PKG:${KERNEL_PACKAGE_NAME}-base =3D "${KERNEL_PACKAGE_NAME}-${@legitimiz=
e_package_name(d.getVar('KERNEL_VERSION'))}"
>  RPROVIDES:${KERNEL_PACKAGE_NAME}-base +=3D "${KERNEL_PACKAGE_NAME}-${KER=
NEL_VERSION}"
>  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =3D "1"
> --
> 2.31.1
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

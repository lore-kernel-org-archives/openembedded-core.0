Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D109AC433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 20:28:12 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.2048.1632860887395752742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 13:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DXhYra7J;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id ba1so30006551edb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 13:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Gu/yrtVWjLHgqXLua0824cKPWeYS7l4aDl9E0rZMa2g=;
        b=DXhYra7JxBva6F6Or+GBdNnELt43t1QUBlKYu1qQfxRGEVS0oI4j2A7QUY0LlS8KDy
         UFU8rdlCbftWWTup9eTMVR916H+Gh6nTzF8sT04cIVx/j4j+dgAzy5QcJ45wHV6TwHmc
         FN/Zg7djL+D98lOO9ZTcW//OX2PPU7eieOLPohSgYLguSbLjQ5cjHEO8beLOwgsGyln/
         5fZnfKvJIKFYMIkpyBzk1u8qdvFHs0iF/vWtXQZyb1tE+/alF7wTJIJKG7WMOtFjTAsz
         4h5x2Q9lF9kVw7E/GbZahP2nURilrfRBy/H1IdbIWbihDf4v+QPUr+PLFNIDHkw3va6B
         Vs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Gu/yrtVWjLHgqXLua0824cKPWeYS7l4aDl9E0rZMa2g=;
        b=mfdHHWwIwOs03GlGS8u1kYEpeh4WM9KKOR3NDg+uchhqoBImhsjchGfHxGVBVuJj19
         tciGIZNUal2uu6Ryu3qmGhyOOwjdlWO80cLFWsCkZdErzLCRj3hoxAVLCeTrjws2w9Gj
         Yi/3fevWJEErygU3ciGSZXa2ZCkXzDzV0R8xloCuPdDF5rWUOJPRkd2DI5/dMdDyXWq1
         hElD5LS+J+DUS1AlrcygbnowmkQSxc3ol7xnP8mQTr6FYQ5RJxiUIpgqGLEGjPJDGX4F
         EJWU5TKamGHO81kbaBBt/WTrmd8TADNT/DlFWYWTWqBi5+XBiONL9WMH4pPnUjB4c7Sh
         j9hw==
X-Gm-Message-State: AOAM531StwHN7fbSLYzLkATrXN9/fy8NMExIezP2h6xBmgPnjqxuYdli
	k6Qpv9KcSA/UB2lyxlEpr/cz822sPA2UFr2ses0=
X-Google-Smtp-Source: 
 ABdhPJz3NO7K9tDN3WVLCOvdJRgLI1y1zqB+vJWWrf/HBsLULaxMnYCD9jXrJZjQIIAEGa6ErYmSVzx+wXHvVmsFGts=
X-Received: by 2002:a05:6402:3088:: with SMTP id
 de8mr10113469edb.76.1632860885679;
 Tue, 28 Sep 2021 13:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210928141048.576425-1-zboszor@pr.hu>
 <20210928141048.576425-3-zboszor@pr.hu>
In-Reply-To: <20210928141048.576425-3-zboszor@pr.hu>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Sep 2021 16:27:54 -0400
Message-ID: 
 <CADkTA4Pd5_wDttx4WsR8VHXExUNv3gaArvjo0PDwxmeqA-5u_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] kernel.bbclass: Allow using
 update-alternatives for the kernel image
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 20:28:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156432

On Tue, Sep 28, 2021 at 10:16 AM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> When using dnf to install new kernel versions and installonly_limit
> is reached, dnf automatically removes the oldest kernel version.

What about other package managers ? Is there a similar limit ? And
does the fallback still work the same ?

I can't say that I'm aware of exactly what this dnf limit is, can we
either link to it, or document the value in the commit message ?

And just so I understand, this is on the install (not the removal)
that dnf is removing the oldest kernel (by its versioning checks) when
the limit is hit ?

>
> However, the /boot/bzImage symlink (or whatever image type is used)
> is removed unconditionally.

And this removal, that's on the package uninstall ? or is that also a
dnf install quirk ?

>
> Allow using the alternative symlink machinery so the highest
> kernel version takes precedence and the symlink stays in place.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index deccc0e58c..a687e5259d 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -43,9 +43,17 @@ KERNEL_VERSION_PKG_NAME =3D "${@legitimize_package_nam=
e(d.getVar('KERNEL_VERSION')
>  KERNEL_VERSION_PKG_NAME[vardepvalue] =3D "${LINUX_VERSION}"
>
>  python __anonymous () {
> +    import re
>      pn =3D d.getVar("PN")
>      kpn =3D d.getVar("KERNEL_PACKAGE_NAME")
>
> +    # KERNEL_VERSION cannot be used here as it would cause
> +    # "basehash value changed" issues.
> +    kver =3D  d.getVar("PV")
> +    kverp =3D re.compile('[\.-]')
> +    kvparts =3D kverp.split(kver)
> +    kverstr =3D str(kvparts[0])+str(kvparts[1]).zfill(2)+str(kvparts[2])=
.zfill(3)

It would be really nice to avoid this logic, since in my years of
suffering, PV cannot be trusted on this front.

Why can't this use KERNEL_VERSION_PACKAGE_NAME ? It is already used in
this anonymous python code, and as the vardepexclude (which may just
be what you need to use KERNEL_VERSION directly).

> +
>      # XXX Remove this after bug 11905 is resolved
>      #  FILES:${KERNEL_PACKAGE_NAME}-dev doesn't expand correctly
>      if kpn =3D=3D pn:
> @@ -117,6 +125,9 @@ python __anonymous () {
>          d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${K=
ERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>          d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
>          d.setVar('pkg_postinst:%s-image-%s' % (kname,typelower), """set =
+e
> +if [ "${KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES}" !=3D "0" ]; then
> +    update-alternatives --install ${KERNEL_IMAGEDEST}/%s %s %s-${KERNEL_=
VERSION_NAME} %s
> +else

I know it is just an inline postinst, but this is starting to get
unreadable quickly.

Shouldn't $D come into play here ? i.e. the existing postinst snippet
is taking it into account for doing the install, update alternatives
should also know if it is defined as well. Shouldn't this be in the
else block of the [ -n "$D" ] test ? if it shouldn't, can the entire
else block be indented to show that it is conditional on the variable
you are introducing.

Are there any situations where update-alternatives isn't available ?
kind of like how we test for ln -sf, and do a fallback if it fails. Is
there a similar case for update-alternatives ?

>  if [ -n "$D" ]; then
>      ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>=
&1
>  else
> @@ -126,14 +137,19 @@ else
>          install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNE=
L_IMAGEDEST}/%s
>      fi
>  fi
> +fi
>  set -e
> -""" % (type, type, type, type, type, type, type))
> +""" % (type, type, type, kverstr, type, type, type, type, type, type, ty=
pe))
>          d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set +e
> +if [ "${KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES}" !=3D "0" ]; then
> +    update-alternatives --remove %s %s-${KERNEL_VERSION_NAME}
> +else
>  if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
>      rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
>  fi
> +fi
>  set -e
> -""" % (type, type, type))
> +""" % (type, type, type, type, type))
>
>
>      image =3D d.getVar('INITRAMFS_IMAGE')
> @@ -214,6 +230,7 @@ KERNEL_RELEASE ?=3D "${KERNEL_VERSION}"
>  # The directory where built kernel lies in the kernel tree
>  KERNEL_OUTPUT_DIR ?=3D "arch/${ARCH}/boot"
>  KERNEL_IMAGEDEST ?=3D "boot"
> +KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES ?=3D "0"

We should add documentation around the new variable as well, even if
the existing variables aren't fully documented .. we can start a trend
of being better.

Cheers,

Bruce


>
>  #
>  # configuration
> --
> 2.31.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156418): https://lists.openembedded.org/g/openembedde=
d-core/message/156418
> Mute This Topic: https://lists.openembedded.org/mt/85925303/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


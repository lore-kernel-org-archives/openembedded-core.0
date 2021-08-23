Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.23343.1629723321917487055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 05:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NcoMd2M7;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id e21so20902516ejz.12
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 05:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZoVHxdWe/0B30iyq7PpL8OYo1VvlL6byNYfNuS+rY8E=;
        b=NcoMd2M7ly1C0LeBE/wVPjm7/w3Ib6DcTKz63lLOHpPToHrF27Ov6psdXWpWLJUw96
         HiNG94wjzAW4jzVZZUrsuM5+ZOMuj0bRKGeC/vPKOZym+mDpS5AJqe6tEXLtbTD4Rm39
         88vx+SR0uFj5hn3uDmdCvIeyLrkK3ShoVj0vut1bTGvtLA4ypOWo7ShgeYWF4qFxdDqb
         txz9V4s+iTj2KkQyQMqF300ubUU3NbVIuF+ydDKpdBTbgVejvvEXWH+coN68bIpZ7HiV
         6cr5mKgdbEmGtvUkxJgIkINsLExuS+3K5EHaWDOhyo5vZfgSqeQiZMiyLbEfc6voabeQ
         XqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZoVHxdWe/0B30iyq7PpL8OYo1VvlL6byNYfNuS+rY8E=;
        b=jpNqfNRplxvB+E5LbmG0QXX83PA6WQiS1pwU93uSEn6WGJ9dV/eIKN1btcqZRULPdV
         XHC3y0pe7bBnnqWRY8eLxDIUxUAvp97GL3h/+33T9clFbHD3ZeEyMUxbPEtAm5yxfb78
         qGAY7X9hYX47y90j2dF/swzC/bF7S1+GjGWu3QTf/O2MMr2prTeX61YjrxoLwz9EBjAQ
         XLp8eWRSnik85CQKh2cQuWMbCJLnCgUrIlCLynjxNli3MUjdq7PFZysXjjsL5lGD5zHc
         4Ig10PsY/4MY2n+egh4ekm1pRrK2WWSpSqY0um3viJtxiwVwm7Y5VBnva38kFDOKRPZo
         FN/Q==
X-Gm-Message-State: AOAM532Neynd6fgVf7x/oHYQtKGaNV9JrgpMrfoyt5gUOXkm+Ewtn6j/
	ftn9myIiN3EvALKhQggxnSXeqLO+nhRcrF96pgs=
X-Google-Smtp-Source: ABdhPJwirOG+NVDtyrd5GcMQnlwA1BZAOYtbF9u1AC6pSuhU1S1js1901wMn9ZwnuKCKodMZwEwn/8DjqB0QXeI1z2c=
X-Received: by 2002:a17:906:680a:: with SMTP id k10mr5076768ejr.298.1629723320225;
 Mon, 23 Aug 2021 05:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210823122323.97400-1-zboszor@pr.hu> <20210823122323.97400-4-zboszor@pr.hu>
In-Reply-To: <20210823122323.97400-4-zboszor@pr.hu>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 23 Aug 2021 08:55:09 -0400
Message-ID: <CADkTA4PC3Fi6y+OSFUWSxRgdbFQsc=Vfq4Yv_G86nmatnWirbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] kernel-module-split.bbclass: Allow opt-out of split kernel modules
To: zboszor@pr.hu
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 8:23 AM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> For some use cases, a monolithic kernel-modules package containing
> all modules built from the kernel sources may be preferred.
> For one, download time is shorter and installation time is faster.
>

There's still an outstanding issue though. Unless you generate the
provides/rdepends along with the monolithic package, any existing
rdepends on kernel modules break.

While that likely isn't something you hit in your use case, it would
be something that would have to be covered to make this part of core.

About 7 years ago, I was most of the way through a similar change,
that created on large package with all the rprovides generated (I'm
not sure I can track it down now, but I could have a look), since
doing an on target update with thousands of kernel module package is
very painful.

Cheers,

Bruce

> Set KERNEL_SPLIT_MODULES=3D"0" for this.
>
> The default is one subpackage per module.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/classes/kernel-module-split.bbclass | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kern=
el-module-split.bbclass
> index 6c1de4c992..a29c294810 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -28,6 +28,7 @@ do_install:append() {
>         install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconfdir}/mo=
dprobe.d/
>  }
>
> +KERNEL_SPLIT_MODULES ?=3D "1"
>  PACKAGESPLITFUNCS:prepend =3D "split_kernel_module_packages "
>
>  KERNEL_MODULES_META_PACKAGE ?=3D "${@ d.getVar("KERNEL_PACKAGE_NAME") or=
 "kernel" }-modules"
> @@ -156,18 +157,26 @@ python split_kernel_module_packages () {
>      kernel_package_name =3D d.getVar("KERNEL_PACKAGE_NAME") or "kernel"
>      kernel_version =3D d.getVar("KERNEL_VERSION")
>
> +    metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE')
> +    splitmods =3D d.getVar('KERNEL_SPLIT_MODULES')
> +    postinst =3D d.getVar('pkg_postinst:modules')
> +    postrm =3D d.getVar('pkg_postrm:modules')
> +
> +    if splitmods !=3D '1':
> +        etcdir =3D d.getVar('sysconfdir')
> +        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modprobe.=
d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
> +        d.appendVar('pkg_postinst:%s' % metapkg, postinst)
> +        d.prependVar('pkg_postrm:%s' % metapkg, postrm);
> +        return
> +
>      module_regex =3D r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
>
>      module_pattern_prefix =3D d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>      module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>      module_pattern =3D module_pattern_prefix + kernel_package_name + '-m=
odule-%s' + module_pattern_suffix
>
> -    postinst =3D d.getVar('pkg_postinst:modules')
> -    postrm =3D d.getVar('pkg_postrm:modules')
> -
>      modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descripti=
on=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3D=
True, hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package_name,=
 kernel_version))
>      if modules:
> -        metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE')
>          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
>
>      # If modules-load.d and modprobe.d are empty at this point, remove t=
hem to
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

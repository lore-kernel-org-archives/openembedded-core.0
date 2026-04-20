Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79682F36C59
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 08:30:13 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15348.1776673810672727816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 01:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pBSXyay3;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a40502e63bso2692491e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 01:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776673808; cv=none;
        d=google.com; s=arc-20240605;
        b=PwehRz7Ni+pHrrqg0wj+NRZspPQIkL2ZojwY/MFNIPSOw5TSevUgsrzm7x4JuNS7PU
         NTR0H36M5wo4OfKc89SZxWDJq6lfks5TSbrxY4+xIQPebdVa9JIgoQNuldFisUlweqJX
         G/amKLe1qhRx/KvPnamVf7egLZUFUYBndzTp9SYn45jnTvOkGYRj8WTW4NIhSyU3FUBw
         lmHurigwp4mf+BXaSKeNWbkgHrIkkcydFBSHwPpeLl1DsUCktYjmtGweFQJ9nxfK0xA7
         rs1ES+xsGRpzwg8v/ij1Y8xiESMfyfGwJ7EL/HzWAs7foJ5yM7q+aQqwxahHrbXqyYMX
         ytXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eT/WhXzsd/Zk8/ZwPstodaM83Ylf4CnpRnCfvmeGmzk=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=e8fMXr3KDt+xC03LYqBtt1ULGZH+MYwISiQX/aPDIMq/dAT3NX7U6HGf5IfNkexBAb
         m8tt4BNZftTSUAw1WT30MFQ4c1onThj9M3NWufo0U5TMUgseK6Cj1a4VN9bv1BmoJyM2
         adoaeOuwMpZtvbCBCKjKiJDE2ZXDTkWTKzOr+7rYP9Gju9Wbotyy3XLxCQxO24GMUVCe
         7AjdW47p54E5PWe5XA/A7zmF4FjnsHyhUaYNh+CQh2RCrbAvGZw0ag1/JU004pojG+Wy
         I+RfgJOetHfXA9RvSXQx37WRiTcCnBHwfl/Cr0vN53He3J5wa1s3ykN562nRWyjjT66c
         OG1g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776673808; x=1777278608; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT/WhXzsd/Zk8/ZwPstodaM83Ylf4CnpRnCfvmeGmzk=;
        b=pBSXyay3hVE4XdWb1nmAJ+/IKEGSJ8YHjN8vqpK0NlOFgMTT37Gx2FDNy9O6kFD77j
         ds6hBnsHdv8TDfslpGtdVU1s7WH1YNf5ZNdE3xc+kPP6KFkTcNChShEaSu5ufuHg+Fsj
         TSErhlyvD6xfa+53Ov8XHIPiXQeF9Chcbf8NfliCMIEHFwgB4MgERft02w1gWbDJ5HZ7
         8vovyYmXB2weMcGL/aaXwX0dfY6kGn7ywxHDdU+vd7kW5eUQTSrraYXIoCN0VhOPdqa8
         n0eGLmQjV2fAkOyj9xtfzM7fL6Cja5EA2+e2RfOTMgGGmqQtWHJtik2b5eFFHg4kbll7
         CMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673808; x=1777278608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eT/WhXzsd/Zk8/ZwPstodaM83Ylf4CnpRnCfvmeGmzk=;
        b=sUq5gt1jzd/VUA0lIBK3cvB+ImO0kJ9IE6JVKDLOkI62ZMNNvwCwWNV/5E3lSQom4E
         S4fBWbcnosFoG82EWd3Cq5bNwe4gK87M7EK9B4awR5jxpHXq2JY9P3HN3v+qvswuVC3B
         fPdBpcEXr6W8JKEPUg7v4KpRdi4XvZjVIrstrEQnJHMDuGoR6DijHDxZs06xr+OVTQj/
         OY1S19ZUKean2Poc/KSlLAvSHpSIi+HD5bNDmFCy2vEz9uDrF9blBG4BVPsDapx90slj
         M6KGYwrvuInzy29+7/AaBsgxPeyda+mV1a5PvnmFMU7fhflwtr4HEOApDtfDbBJqBmoa
         nCrA==
X-Gm-Message-State: AOJu0YyyV9wgqExPjIi8Vmebsjbc1FejJMjiecLHlIOjOGSdv8zheyWV
	LZ3dQgXAqMmE86vrhCgU+4t0mauCZDHK5+ofAFB+hCyD5oamHKBJpHCnkwScprwM2S78wL2mrb/
	NZYeerWdzg5RKp5EYpa9kExRp5W0JhNk=
X-Gm-Gg: AeBDietakr+Gv03UuRacFwZO2lwHeTl0rJ9XhnXMuR+dI7ldrB1Z0HDqd3xIMK70WsS
	TbTf5wsWJEFrZQxkZLMZc7QEOyaixdTh42nV97eMz3QuOzUvfFQXWfRaFhahXM6u7E7uqivRV5m
	qb7LCT1jo9xHl796N4+qlfCSF4Is6VVXWd+ztTSLes6c3/3B53QsZCTYQ7vSZONb1AyAPf+D/wu
	sXZnyAc1KH4aNgyYXZXDuzuumGZmjoOsx1+pZFVwzKRP1Qu0uECiaQuXPp/NB8AabcX9i0l1wj5
	MfBLQawp7wBXgL1SFwPa8QgRhp5uuTAF0JrrMcWRmxNyKqdWaggC+AQLjLpqMPzU44Y0V5srgGu
	tGtNZoH6wtvw=
X-Received: by 2002:a05:6512:2308:b0:5a4:2cf:601e with SMTP id
 2adb3069b0e04-5a4172c3f7fmr3813084e87.12.1776673807904; Mon, 20 Apr 2026
 01:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774824253.git.yoann.congal@smile.fr> <58ef52e9ee33c76689a57e6c39e91c00c257c43f.1774824253.git.yoann.congal@smile.fr>
 <DHG6XYWYS20G.3GXDCN07SKIGJ@smile.fr>
In-Reply-To: <DHG6XYWYS20G.3GXDCN07SKIGJ@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 Apr 2026 10:29:55 +0200
X-Gm-Features: AQROBzC7LmswmJIMk_991hBvVHVN9U5IsfALaR_UEpTNq4M-6DVggoJYvrfWPQI
Message-ID: <CA+chaQf17Z9yPRyqUip6xWjJwGSc6CadNdqVURBsLx7SMUvy3g@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 04/11] dtc: backport fix for build with glibc-2.43
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 08:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235554

Hello Yoann,

some of the follow-up glibc/gcc patches for ubuntu-26.04 are now in
your contrib/stable/scarthgap-nut, but the 6 changes from this PR are
still removed, is it intentional now when similar changes are going to
be merged in whinlatter? Should I resend the 6 on top of current
stable/scarthgap-nut?

Regards,

On Mon, Mar 30, 2026 at 4:36=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> On Mon Mar 30, 2026 at 12:46 AM CEST, Yoann Congal wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
> > https://errors.yoctoproject.org/Errors/Details/903983/
> >
> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98overlay=
_fixup_phandle=E2=80=99:
> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment dis=
cards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
> >   424 |                 sep =3D memchr(fixup_str, ':', fixup_len);
> >       |                     ^
> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment dis=
cards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
> >   434 |                 sep =3D memchr(name, ':', fixup_len);
> >       |                     ^
> > cc1: all warnings being treated as errors
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > [YC: upstream commit 28552a7b6c94060c7ab3899619ab8afb74124d02]
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
>
> Hello Martin,
>
> FYI, while it looked good, this patch and your whole series about glibc
> 2.43 support:
> * [scarthgap 04/11] dtc: backport fix for build with glibc-2.43
> * [scarthgap 05/11] pseudo: Add fix for glibc 2.43
> * [scarthgap 06/11] yocto-uninative: Update to 5.0 for needed patchelf up=
dates
> * [scarthgap 07/11] yocto-uninative: Update to 5.1 for glibc 2.43
> * [scarthgap 08/11] elfutils: don't add -Werror to avoid discarded-qualif=
iers
> * [scarthgap 09/11] binutils: backport patch to fix build with glibc-2.43=
 on host
> ... will be put on hold until I can test it: So, not until Ubuntu 26.04
> is released and the autobuilder gain an Ubuntu 26.04 worker (most likely
> after Wrynose release).
>
> Thanks!
>
> Regards,
>
> >  .../0001-Fix-discarded-const-qualifiers.patch | 85 +++++++++++++++++++
> >  meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  1 +
> >  2 files changed, 86 insertions(+)
> >  create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-cons=
t-qualifiers.patch
> >
> > diff --git a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-quali=
fiers.patch b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifie=
rs.patch
> > new file mode 100644
> > index 00000000000..c643410ae9b
> > --- /dev/null
> > +++ b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.p=
atch
> > @@ -0,0 +1,85 @@
> > +From 861cb43eb53afff83e28ba0e0f88ffa464ebe8ca Mon Sep 17 00:00:00 2001
> > +From: Stephen Gallagher <sgallagh@redhat.com>
> > +Date: Tue, 6 Jan 2026 14:19:30 -0500
> > +Subject: [PATCH] Fix discarded const qualifiers
> > +
> > +It's unsafe to implicitly discard the const qualifier on a pointer. In
> > +overlay_fixup_phandle(), this was probably just an oversight, and maki=
ng
> > +the "sep" variable a const char * is sufficient to fix it.
> > +
> > +In create_node(), however, the "p" variable is directly modifying the
> > +buffer pointed to by "const char* node_name". To fix this, we need to
> > +actually make a duplicate of the buffer and operate on that instead.
> > +
> > +This introduces a malloc()/free()  and an unbounded strdup() into the
> > +operation, but fdtput isn't a long-running service and the node_name
> > +argument comes directly from argv, so this shouldn't introduce a
> > +significant performance impact.
> > +
> > +Signed-off-by: Stephen Gallagher <sgallagh@redhat.com>
> > +Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > +Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dt=
c.git/commit/libfdt/fdt_overlay.c?h=3Dmain&id=3D9a1c801a1a3c102bf95c5339c9e=
985b26b823a21]
> > +---
> > + fdtput.c             | 8 +++++---
> > + libfdt/fdt_overlay.c | 3 ++-
> > + meson.build          | 3 ++-
> > + 3 files changed, 9 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/fdtput.c b/fdtput.c
> > +index c2fecf4..8deec7e 100644
> > +--- a/fdtput.c
> > ++++ b/fdtput.c
> > +@@ -230,19 +230,21 @@ static int create_paths(char **blob, const char =
*in_path)
> > + static int create_node(char **blob, const char *node_name)
> > + {
> > +     int node =3D 0;
> > +-    char *p;
> > ++    const char *p;
> > ++    char *path =3D NULL;
> > +
> > +     p =3D strrchr(node_name, '/');
> > +     if (!p) {
> > +             report_error(node_name, -1, -FDT_ERR_BADPATH);
> > +             return -1;
> > +     }
> > +-    *p =3D '\0';
> > +
> > +     *blob =3D realloc_node(*blob, p + 1);
> > +
> > +     if (p > node_name) {
> > +-            node =3D fdt_path_offset(*blob, node_name);
> > ++            path =3D xstrndup(node_name, (size_t)(p - node_name));
> > ++            node =3D fdt_path_offset(*blob, path);
> > ++            free(path);
> > +             if (node < 0) {
> > +                     report_error(node_name, -1, node);
> > +                     return -1;
> > +diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > +index 5c0c398..75b0619 100644
> > +--- a/libfdt/fdt_overlay.c
> > ++++ b/libfdt/fdt_overlay.c
> > +@@ -431,7 +431,8 @@ static int overlay_fixup_phandle(void *fdt, void *=
fdto, int symbols_off,
> > +             const char *fixup_str =3D value;
> > +             uint32_t path_len, name_len;
> > +             uint32_t fixup_len;
> > +-            char *sep, *endptr;
> > ++            const char *sep;
> > ++            char *endptr;
> > +             int poffset, ret;
> > +
> > +             fixup_end =3D memchr(value, '\0', len);
> > +diff --git a/meson.build b/meson.build
> > +index 8952e8a..ecb0ae0 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -14,7 +14,8 @@ add_project_arguments(
> > +     '-Wstrict-prototypes',
> > +     '-Wmissing-prototypes',
> > +     '-Wredundant-decls',
> > +-    '-Wshadow'
> > ++    '-Wshadow',
> > ++    '-Wdiscarded-qualifiers'
> > +   ]),
> > +   language: 'c'
> > + )
> > diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel=
/dtc/dtc_1.7.0.bb
> > index 0702fc16dfa..a2f41197fda 100644
> > --- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
> > +++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
> > @@ -12,6 +12,7 @@ SRC_URI =3D " \
> >      git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmain;proto=
col=3Dhttps \
> >      file://0001-meson.build-bump-version-to-1.7.0.patch \
> >      file://0002-meson-allow-building-from-shallow-clones.patch \
> > +    file://0001-Fix-discarded-const-qualifiers.patch \
> >  "
> >  SRCREV =3D "039a99414e778332d8f9c04cbd3072e1dcc62798"
> >
>
>
> --
> Yoann Congal
> Smile ECS
>


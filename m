Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A42D75BAC
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:11:10 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.3503.1732162264580109500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 20:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lcWIaFZ0;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-71a6c05dc10so819619a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 20:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732162264; x=1732767064; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKWWA0DCMhvp6pAafrVXch0AceeAzwU6Dchw5v3JJ/Y=;
        b=lcWIaFZ0LRgkfp4piyCEm2Z3z+pBKCW9td/5Ro39iNNqdLS4E6d241voHRhlpK6ydU
         vsgfZ7s/KgDU4veFK4LHH2CMLr/uuVEQtmoXXWiNPlrWvi4GPchE8FeJv4b+i8QobNxJ
         prGQTIh5S2m7wkZSKQ/ZKXacOEfWexuRMEGGZvR8C1sDXpshXC5w5F41/Jag+6J9iZ88
         WZG08CMI8Slyhwp58Ct77g/w5TWYf768d285FRMi11GvXdJxCqWgxkPKPa6AkbHDDAKt
         4YGkzuBcXDrYhmJ3mGpC7zLUO90nCD8oYbObxMYKXNEM+Dj4NvGpE3Xs4+2uhEWXHgdy
         Ya+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732162264; x=1732767064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKWWA0DCMhvp6pAafrVXch0AceeAzwU6Dchw5v3JJ/Y=;
        b=qLkPCWHghry+5yopOIHFpx1tSITycPdxExz9Qa51jcMtCJ4lbkGkzIW0f8Z9tYnu+1
         /ToH52up8U3WGziHVxg2wiIZVgHuXedfREJZwRMsTt1sGdj0Fdchen3J5P4gRWUf8wCI
         VBytv7urWFNyc303bN1ltRtws0Yh3eQLG82JQehIltnTWKgualBGqJ0Badz7E2DY1W48
         EzR3lnEDETgVe+t+dqUv+CKFk5zO1N69Buzx4aWyLbQUaoMOGwNjupz/rfya+Sp014Zj
         f3Dbs5qpQxLYZU44qdP00psk2PyAEXJFl+LUVJbtIryBgsxWg3XS6AbDsS8Kzou6nB5Q
         P4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXeOPJwhYVId9I97AaYzqS6R6TSXfP/fYW0OQiNDK1Fn+1KeI4NwcrdFEyCXF80U+f50yLKpfFEEUBnCgvYMZuNKg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxkp9GW5UFBN1XVH/OgxwZd9ksAw5+bziVxKvCPLoYi7iHI1qp1
	wa1jZX1UX0PCvOmCOG45CRCrWF1VcuiFBgEUWgO4v6BKsOT1BHYGeN+uexYdldy2HVBDt7srzG/
	IS4mAjW0UMrmX5V0p30p8ljubqr0=
X-Google-Smtp-Source: AGHT+IEtZSHT8TPux9Ido9E2WvFzmJEbi6vJQ0C5rN0y2x1KddbtwCzq+mV2uGJfILUk0d+A1trEgu32KiNHQt/K4y0=
X-Received: by 2002:a05:6830:1512:b0:709:3a3d:6cca with SMTP id
 46e09a7af769-71b037cc7c1mr1120340a34.11.1732162263693; Wed, 20 Nov 2024
 20:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20241105101214.4095063-1-changqing.li@windriver.com>
 <B3814EDD-D5B5-423E-AD39-BC71478CBAF7@arm.com> <f715fbb4-bcea-4ac6-b460-0d99d0603794@windriver.com>
In-Reply-To: <f715fbb4-bcea-4ac6-b460-0d99d0603794@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Nov 2024 20:10:37 -0800
Message-ID: <CAMKF1srb=9=zeN3J-DyYOySBKPwCCSmQHEc8p=iF=xZdhESecA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rxvt-unicode.inc: disable the terminfo
 installation by setting TIC to :
To: changqing.li@windriver.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207501

On Wed, Nov 20, 2024 at 8:04=E2=80=AFPM Changqing Li via
lists.openembedded.org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
>
> On 11/21/24 00:51, Ross Burton wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On 5 Nov 2024, at 10:12, Changqing Li via lists.openembedded.org <changqi=
ng.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> @@ -37,6 +37,7 @@ do_configure:prepend () {
> if [ ! -e ${S}/acinclude.m4 ]; then
> cp ${S}/aclocal.m4 ${S}/acinclude.m4
> fi
> + sed -i -e 's#@TIC@#:#g' ${S}/doc/Makefile.in
> }
>
> A brute-force sed feels ugly and prone to silent breakage.  Wouldn=E2=80=
=99t this work just as well:
>
> EXTRA_OEMAKE =3D =E2=80=9CTIC=3Dtrue=E2=80=9D
>
> Hi, Ross
>
> Thanks for advice.  But this @TIC@ cannot replaced by add configs like EX=
TRA_OEMAKE.
>
> TIC is defined in configure.ac by "AC_PATH_PROG(TIC, tic, :) ", so TIC wi=
ll be native tic path.
>
> and during configure process, configure will replace @TIC@ in doc/Makefil=
e.in with native tic path.
>
> So in do_install stage, the doc/Makefile already have a hardcode native t=
ic path, not variable $(TIC)
>
> which could be replaced by pass argument. Seems no interface for us to pa=
ss argument to change TIC.
>

you can override this via setting ac_cv_path_TIC=3Dpath/to/tic in
EXTRA_OECONF or CACHED_CONFIGUREVARS

> Regards
>
> Changqing
>
> Ross
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207500): https://lists.openembedded.org/g/openembedde=
d-core/message/207500
> Mute This Topic: https://lists.openembedded.org/mt/109403291/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


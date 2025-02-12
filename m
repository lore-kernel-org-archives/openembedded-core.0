Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D23C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 22:57:29 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.1928.1739401040698716310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 14:57:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B+ASVm/8;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2b8d604063eso119046fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739401040; x=1740005840; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtjOPXfCr5Tx9cgrJz47yUzgoFrM4cgftOFhVbeE7M8=;
        b=B+ASVm/8PdvwSDDIdPkkEUSsFn0fMgKJZ3TY2egz/HtMymF8HVvtIfnHAAQHlBlHNE
         PH5cMe/kQzyr6gUjk+Il5Zlk3weQ8H2rKQwpfI9+VZLVx6XKuFoUVIsdOBXF0a20kQoE
         vztex3Arzoc8eqxhX8b8Fva4uTqqnXgxYh+Wje9CBtQzgc/oRT1rmOy7xxMltNmfL1GW
         8ptNVaBQkU4g5Vz7JQg3ex2y/fzbZTCD7+R9yFysRnJSlG4Vc7qAFnveMLMLD60LHbma
         Qrg/V/8IJte7c9eKnwkpusRqDwX3vXFPxSvunHdICvEHFQ5BLkspCgc/HsetVoRssds4
         NMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739401040; x=1740005840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtjOPXfCr5Tx9cgrJz47yUzgoFrM4cgftOFhVbeE7M8=;
        b=WXK9Bszqq9AZK6IUFrAJ+yuc/kHsubJgso5TanBwibVvyyzdnFALUVzIN//enEPS9x
         aTJ84qDZfOZBrMZdEdeoA6oT7MBoiXPplwEyitEdlVLHSMPWb6OxAhTQOuWVKQqTBJH5
         mvNCTB76U9/N+tiWLWkQksdgbkHdj9Kbpw1VWC1iEF71ga0bgFXuV+dKAa1rZGVbHAvH
         q8UKhvIj4ypvh2DbyhG+lnczEEET1V9sYe1g1hEKhKjOfxqjV5+hHfS/KXeoSTs3oqot
         jqvz8aYazvrSRHFZWYS5RP9SWnrrz7tLC2+q+RB3hnppMgJtGCxwiouYKNRt6wTbWrHg
         9gDg==
X-Gm-Message-State: AOJu0YzF0J6N1mMhNi1EtnKnk/ylzbVOw3eyrHp3DBVpd+aAUiFo96Mb
	iLA3Jc9GMm1yVKwJxt2+ilgvEhkeL6Ez100ViPSHRm6ihlckETTjlRPpBhnwAVAc5+3R1JxtIl/
	7CEDrkTWbETV02/zYvaiCrWLLPTs=
X-Gm-Gg: ASbGnctJZZqpJdYhKg6JK/aHSdJ6OP1aVSIkgPVaN4ayE1z9ZZVfdXeWuUihXBT2LGB
	OAoWexRSZF1oCs2teLXVs0/plvteRCySbaKAsZf8lU8Njr53WbqfAKRF4abP8KcRqezIcJCgGAd
	N7oarKVY2loYtIHsfim/GX8HTiUg==
X-Google-Smtp-Source: AGHT+IGiVE5xo+eMDM7i04TnqCcJqLGIQp8OLI0YMbnJnWv+fd5YjmJUnUYzTcVpl9GOa1S/nge5TWUceqv9OoV6lsc=
X-Received: by 2002:a05:6870:c18d:b0:2b8:1d18:6f1 with SMTP id
 586e51a60fabf-2b8d65257ebmr3364336fac.10.1739401039917; Wed, 12 Feb 2025
 14:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20250212203113.398422-1-ross.burton@arm.com>
In-Reply-To: <20250212203113.398422-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Feb 2025 14:56:54 -0800
X-Gm-Features: AWEUYZmtPrbEJpk9IHVhZRy_0vdPerQ31Mnkva68tUj5DjJP5FYPFV979T5OMdg
Message-ID: <CAMKF1sqocgsbxwbn4FrxHXDLk2tKJYLWOA0zA=gh_UzusuUB7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-license-expression: fix ptest installation
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211281

On Wed, Feb 12, 2025 at 12:31=E2=80=AFPM Ross Burton via
lists.openembedded.org <ross.burton=3Darm.com@lists.openembedded.org>
wrote:
>
> This recipe was overriding do_install_ptest which is provided by the
> ptest-python-pytest class, so there was no tests or run-ptest installed.
>
> Use an append override, and minimise the installed files: use a symlink
> so that scancode-licensedb-index.json is found and install setup.cfg.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../python/python3-license-expression_30.4.1.bb            | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4=
.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
> index 649b53ea492..ec613f6eaac 100644
> --- a/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
> +++ b/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
> @@ -22,8 +22,9 @@ RDEPENDS:${PN} +=3D "\
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> -do_install_ptest() {
> +do_install_ptest:append() {
> +    # The tests need some files from the source tree
>      install -d ${D}${PTEST_PATH}/src
> -    cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
> -    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
> +    ln -s ${PYTHON_SITEPACKAGES_DIR}/license_expression/ ${D}${PTEST_PAT=
H}/src/

should this be ln -sf ?

> +    install -m644 ${S}/setup.cfg ${D}${PTEST_PATH}/
>  }
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211278): https://lists.openembedded.org/g/openembedde=
d-core/message/211278
> Mute This Topic: https://lists.openembedded.org/mt/111150628/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


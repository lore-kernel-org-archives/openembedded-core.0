Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0FFEC8733
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 14:16:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.14067.1694096187540894701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 07:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c/tdgPvJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso10991725e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 07:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694096186; x=1694700986; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2tap7UXB47rbg//AEfUnf+Q6gdudBWG9A+iHhxRymA8=;
        b=c/tdgPvJ/EcKZDKnj0af8OsbYb8d0F/VGWDmL2KFQ/DLqR7pB2syUIMal19CpB2qJM
         B3wSc2WowLLJGpjBAFXSF4Xf7AVRyVI2e9LHi+6pLrNvGiais6sQ1+qcIyxhKzVblYLC
         mm9S3L9111cMIYPPB3XT/UGThZFITscoWXvro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694096186; x=1694700986;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tap7UXB47rbg//AEfUnf+Q6gdudBWG9A+iHhxRymA8=;
        b=Rkt4bF+s2Frdtn3TzwwE0LGNJTdJfBidXGBb6/sllmorc4vzVrxO1QzxB3yivv0Ru9
         6RQfkU2qG5B6J7y3T/CvuAoq23PGVOVhR2IYB3gZifYIxNKf90Vd/yA3XjJMaEf5tumw
         kKNWM8rt4z28ADSWerD7MKBqGEEOrJuQhvnwS9FIiTd8I5xKBx+2G3pEOF/p503jxpVs
         jkX2oHQmsKJSYYSQ88PBihjwz6iuJAzFa41zwyso4CAihiaiH521pVcxVzXOiy4RNz3T
         N72QSUeKjgGbN1qZYqj+WE2tqC6OAuEuRFvygGo9gv941EpQfpr3ysFZIPkvjCHTkWBT
         hF3Q==
X-Gm-Message-State: AOJu0Yw5j9XMVmmtT4iE10129dvcOnAM2MrjJanJSAynh/L60SI8OhZt
	AaYPP5tZl6tG/EV3wYlV2IXHwQ==
X-Google-Smtp-Source: AGHT+IEOSh87/l64CTlWapFE/5MLAS4nX2dVVGIAcvGREmQx0suXAWBXf1388fRp2v2+0ksaZJ/sWA==
X-Received: by 2002:a7b:c855:0:b0:3f8:fac0:ad40 with SMTP id c21-20020a7bc855000000b003f8fac0ad40mr4833867wml.29.1694096185899;
        Thu, 07 Sep 2023 07:16:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f38:2f43:a165:5f10? ([2001:8b0:aba:5f3c:5f38:2f43:a165:5f10])
        by smtp.gmail.com with ESMTPSA id k9-20020a05600c0b4900b003fe2b081661sm2641642wmr.30.2023.09.07.07.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 07:16:25 -0700 (PDT)
Message-ID: <bf604882ff482c21044429a08a31fe07efc5b0e7.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] pybootchartgui: also match subtasks of the
 main ones
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Date: Thu, 07 Sep 2023 15:16:24 +0100
In-Reply-To: <20230829143541.3837919-1-jose.quaresma@foundries.io>
References: <20230829143541.3837919-1-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 14:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187386

On Tue, 2023-08-29 at 14:35 +0000, Jose Quaresma wrote:
> This will match other deviation subtask of the same main task,
> a couple of them can be found on oe-core layer:
>  do_compile_kernelmodules
>  do_compile_ptest
>  native_add_do_populate_sysroot_deps
>  do_package_qa
>  cmake_do_configure
>  setuptools3_do_configure
>  cargo_common_do_configure
>  python_pyo3_do_configure
>  python_setuptools3_rust_do_configure
>=20
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  scripts/pybootchartgui/pybootchartgui/draw.py | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybo=
otchartgui/pybootchartgui/draw.py
> index 3d1ff695c1..2beb3c7c67 100644
> --- a/scripts/pybootchartgui/pybootchartgui/draw.py
> +++ b/scripts/pybootchartgui/pybootchartgui/draw.py
> @@ -661,20 +661,20 @@ def render_processes_chart(ctx, options, trace, cur=
r_y, width, h, sec_w):
> =20
>              #print("proc at %s %s %s %s" % (x, y, w, proc_h))
>              col =3D None
> -            if task =3D=3D "do_compile":
> +            if "_setscene" in task:
> +                col =3D WHITE
> +            elif "do_compile" in task:
>                  col =3D TASK_COLOR_COMPILE
> -            elif task =3D=3D "do_configure":
> +            elif "do_configure" in task:
>                  col =3D TASK_COLOR_CONFIGURE
> -            elif task =3D=3D "do_install":
> +            elif "do_install" in task:
>                  col =3D TASK_COLOR_INSTALL
> -            elif task =3D=3D "do_populate_sysroot":
> +            elif "do_populate_sysroot" in task:
>                  col =3D TASK_COLOR_SYSROOT
> -            elif task =3D=3D "do_package":
> -                col =3D TASK_COLOR_PACKAGE
> -            elif task =3D=3D "do_package_write_rpm" or \
> -                     task =3D=3D "do_package_write_deb" or \
> -                     task =3D=3D "do_package_write_ipk":
> +            elif "do_package_write" in task:
>                  col =3D TASK_COLOR_PACKAGE_WRITE
> +            elif "do_package" in task:
> +                col =3D TASK_COLOR_PACKAGE
>              else:
>                  col =3D WHITE
> =20

I'm a bit torn on this as the patch changes the approach of the code.

Currently, the tasks are marked without any fuzz, i.e. it matches
do_compile alone. The code is entirely consistent in that all the other
areas match specific tasks too.

After the change you're changing the meaning to "any compile task"  and
"any configure task".

I'm not entirely convinced this is a good thing. Should do_package
match do_package_qa for example? Those are quite different. I think
we're swapping something which is currently at least quite clear for
something which is very fuzzy and not easy for the user to understand
without looking at the code :/.

Cheers,

Richard




Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FDFC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 16:28:44 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.55146.1699720122159752195
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 08:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ii55X1Bj;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1e98e97c824so2116590fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 08:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699720121; x=1700324921; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7QucvTawp+GiCmC/ofbJT7ulZL1wyvgsmiFRdVN7rM=;
        b=ii55X1BjW+TlFAw9ojI20HNdE18agDBQ1cSh2eQQrm10YJ8PUnNCjWGFGwfO1j3FfW
         XZQOyorJx3Twth9pEcR0KaLfovVv3YVyHowGAvKObgf4gZLoQeuc9uBJhrlpxfsfylNp
         3fV63Tp/+oJ717NVLLsQv2GxcCY5I+95XHqThB+16LH2XX2OLzHhCWR0VLl4PmktB0Y7
         672GI67Sy4p8Kyj5LbfL+5vAPy67CaiVkxiDcxfD9LbCFAgKjNKOQjsRDtKNgLLuMxon
         Yx+H79QXuO5/VlBLa87rZsUp037voJdzqmT+rFpAUZZphPm1Lk6h9+DA+wDAHTCvmuZJ
         bqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699720121; x=1700324921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7QucvTawp+GiCmC/ofbJT7ulZL1wyvgsmiFRdVN7rM=;
        b=pnRqOEFlUB0B9GXhQUZDhNouj/Mv8sArvDJ6QtDUwfN3RNEDgbOB3TzVV+6tcbFlDA
         FnEnx9PP4yOVEvygdtOC/Kq1m4VAfQ1DQ94MiQ29JwVNliDX3mKyBcogXgtCN8pI3Z6B
         wJ8KXk22HSqjkkNYlcTqOKal2z4nVyLHiFFmlHqk/2px3g+FzkpwfwVS3pxzvJt6NLXv
         Z9k4Ecm677SI9jNUZd5aAdG+S5q7EYVHW59o2sxHX6OELK4/jzxOcpZubfxMapte46hm
         WTLRd1J8kQuBr6sr4mxsv+5nObkum8WXGZ+WCaYI3chJhoXmChTn207X8XBKxf3w+KqI
         323Q==
X-Gm-Message-State: AOJu0Yz+p+YM3RcEk5xU4wPF/XEwE0GQGd5Clg4OaufogwX0k9/8d9Ew
	/LHNRkbYoIJiFsfd/sTVtcn9eU4wSKdK825bFyA=
X-Google-Smtp-Source: AGHT+IHznW0xjhVCloNyoxH9t3uA06pt4iD4rsn81WHMIVPgUbaqQJqlSCjXiTE0zcz9tVkN1tvzpTtpHqOy3P+DihU=
X-Received: by 2002:a05:6871:5223:b0:1e9:97f2:501e with SMTP id
 ht35-20020a056871522300b001e997f2501emr2970083oac.20.1699720121301; Sat, 11
 Nov 2023 08:28:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1699714834.git.steve@sakoman.com> <24b9da1a2332dd1dbc80006e36af693ed1161ee3.1699714834.git.steve@sakoman.com>
In-Reply-To: <24b9da1a2332dd1dbc80006e36af693ed1161ee3.1699714834.git.steve@sakoman.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Nov 2023 08:28:15 -0800
Message-ID: <CAMKF1sok8EKi8mVTzSPXThJ2n4pom2VSWW4OvAdkYkt7Bz42Fw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 14/15] lz4: use CFLAGS from bitbake
To: Steve Sakoman <steve@sakoman.com>, Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 16:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190432

On Sat, Nov 11, 2023 at 7:03=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> From: Mikko Rapeli <mikko.rapeli@bmw.de>
>
> Currently lz4 uses it's own defaults which include O3 optimization.
> Switch from O3 to bitbake default O2 reduces binary package size
> from 467056 to 331888 bytes. Enables also building with Os if needed.
>
diverging away from package defaults means treading a less travelled
path and prone to errors
this could be the reason for the reproducibility problem that Steve
sent a patch for.
how does it impact runtime performance ?

> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit abaaf8c6bcd368728d298937a9406eb2aebc7a7d)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-support/lz4/lz4_1.9.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support=
/lz4/lz4_1.9.2.bb
> index 0c4a0ac807..c2e24b518c 100644
> --- a/meta/recipes-support/lz4/lz4_1.9.2.bb
> +++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
> @@ -23,7 +23,7 @@ S =3D "${WORKDIR}/git"
>  # Fixed in r118, which is larger than the current version.
>  CVE_CHECK_WHITELIST +=3D "CVE-2014-4715"
>
> -EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' DESTDIR=3D${D} LIBDIR=
=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=3Dno"
> +EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' D=
ESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=3D=
no"
>
>  do_install() {
>         oe_runmake install
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190429): https://lists.openembedded.org/g/openembedde=
d-core/message/190429
> Mute This Topic: https://lists.openembedded.org/mt/102526883/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


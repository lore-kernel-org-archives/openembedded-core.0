Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF7DC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 12:15:09 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.11533.1700050502471411560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 04:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G3KfK+6E;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c504a5e1deso90758561fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 04:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700050500; x=1700655300; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVZa6QWnNgNFY4YzS8y3iKgn/0bdXO9WCgz0PQQGo0c=;
        b=G3KfK+6E9+E0R9rZTiUeghuockJYN1pDoU782osaQTorBttvePjC2/hXwqduV31E/1
         2RoDv3lLVJpVQSs0opEGYnPUpo38ow1C0dNeLxPkxIK7Qm5uEqE81yjC+VzfhmsDbHqn
         i2RZpPWP7LjPDen3p+PIQJXBYbOXr8k3ihC/Yq/Eo9MQY3hYhDn2neSCuYYGdmHmtAMx
         uXRaL/qIUEqJcSDqq2pIJFf4+p0/Q3LOuKg2/jAhOjCO72B8sZOo/09rUO+PJy3+bH0b
         XiRxNYoKn8XKJcBSOxu7VyIBvNDOziRLroY/3eMavsqQjcXf0mj85otdUypwm2bBpv0v
         1wCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700050501; x=1700655301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVZa6QWnNgNFY4YzS8y3iKgn/0bdXO9WCgz0PQQGo0c=;
        b=Wmo8WqNE2qQSL3Y/3OkAjwTwKPIZZ+a/6EmtbrQj29dj0VqtFQwm5WCAeuAveX6qMy
         h7JkVVORWWcVnXn7afvLtQ7IV1vlkCpcdRzg0sPi5jqyHiMNdSYGJNYmY1p8yyb9x0GH
         DpjMBeAA0Xowe6M0k5AF6afn8nm+JN2SSaOR/zkwPKbYgWOzVcubonVQ8Mg/uzEQUjGy
         pRphDLDfnWUxSA1PRBApWTWrSSOWc0pQISBlQf4GfHFEq2aZgEtMAS2ENKEwYeTU75JW
         jPupwZHXN5+8JuAu802eiMf3wSdDFIctf+R0DfQW3U8yNDReN6QlRW0SvdhdATBXub8U
         /rZw==
X-Gm-Message-State: AOJu0YyAGYoDp9LZmR94GhGdPD1Qvj4x2kUyMnBn39E98VonexxnOCir
	3Wiwb94j4e0dE3tlbgApj+1govqTSCnY/39qnf3zyILU
X-Google-Smtp-Source: AGHT+IFAqv2tjkwjoR5mjIVrknUbhtg5fVQM4Xa5yrzoRU2jm/RGm0vJ36Ti31Nb8JnNpY1Zuv8Gzb0G1aFBy5vpols=
X-Received: by 2002:a2e:9906:0:b0:2c5:23fd:9945 with SMTP id
 v6-20020a2e9906000000b002c523fd9945mr3820679lji.51.1700050500417; Wed, 15 Nov
 2023 04:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20231113125732.379010-1-zboszor@gmail.com>
In-Reply-To: <20231113125732.379010-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Nov 2023 13:14:49 +0100
Message-ID: <CANNYZj83rvjif+_Uuh+V92ZnodWWvoxXK57cRj2EGb8j=QKg1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-demos: Split *info diagnostic tools from
 the main package
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 12:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190590

I think the package names should be prefixed with {PN}, so that
there's a link to where they come from in their names. It's a common
convention.

Alex

On Mon, 13 Nov 2023 at 13:57, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
> This creates 3 new subpackages:
> * glxinfo
> * eglinfo
> * esinfo (for es1_info and es2_info)
>
> These diagnostic utilities are useful without the demos.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb b/meta/recipe=
s-graphics/mesa/mesa-demos_8.5.0.bb
> index 12f41d75a5..789e816f13 100644
> --- a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
> @@ -41,3 +41,11 @@ do_install:append() {
>                 mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
>         fi
>  }
> +
> +PACKAGES =3D+ "glxinfo eglinfo esinfo"
> +
> +FILES:glxinfo =3D "${bindir}/glxinfo"
> +FILES:eglinfo =3D "${bindir}/eglinfo"
> +FILES:esinfo =3D "${bindir}/es1_info ${bindir}/es2_info"
> +
> +RDEPENDS:${PN} +=3D "glxinfo eglinfo esinfo"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190467): https://lists.openembedded.org/g/openembedde=
d-core/message/190467
> Mute This Topic: https://lists.openembedded.org/mt/102560466/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


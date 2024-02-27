Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C57C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:35:20 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.10061.1709033715102320581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 03:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZnLZKMaf;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d22b8c6e0dso44794411fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 03:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709033713; x=1709638513; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orEpQUa9fa5+HtBt2TAeG9pAXhgJ1Pr2R1l4Ewpd61Y=;
        b=ZnLZKMafWIF3XrkdEs0oWgafc2nbfiKoEvPDqARGJQ3231vE9opY5EDfVMuqE2bZ0Z
         9r+E0zA5/TO96n3bDk73pqRoiht93JcwMkJEcMt/SOLSfP+QbTEfy4zb9ZRaWx2Wpo1C
         OwOaKeU6K065UYSGuthaEQqj4dCGD1hrzqO40rP/ERPtMNJyWPUGPXMZkVj/48Gc1alD
         9pYBQ6lMG2wG0O2z0xtWz3EtYrdSb3p4zz/S+F3dF1P26yE3HaKW3kleufakfNjkSQ8d
         qYeqpQ0GRNxqoagEZ+vnC03kLdnLWlyxQP47qwpLUNbujxN6oAc42GcTW3kav+0RUys+
         N5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033713; x=1709638513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orEpQUa9fa5+HtBt2TAeG9pAXhgJ1Pr2R1l4Ewpd61Y=;
        b=mdNKO6JeiwLBVCvwb0W5K+JQBPXccY7DEpq/Xr7pVg3M1Nof/SfiRDMJdpAhdTur7G
         +7d4HF8kH4+mQ49b9c+YkOl6CxkXKwRtTX61nySPFVHLfl8ZC8AFxqqqd3ffojXe7DU4
         Eg2UYbpRrDXwdGdzWYGf4zdG2blrfabbwpAylFsTAnc8+GISDRU06J9zr10zo7nclX/n
         6BtLeZ4FFCyPn+mIJmWfJ7YUK8Kj/iXa6z9C1p1lJ5oGxnQwnnn9V+tctecyl6JakL6B
         Fz6WxSQHQjS69u6As4m0jMdLa15il3nIwsgnN2yE4fLKhp9rwgwkx4BK4uy1uJ6WFj/o
         PIHg==
X-Gm-Message-State: AOJu0YzUvH4vMbUZ7zBxUyepGa1Qom5cdcr+KAXF5lqgBmsCSZoovjae
	rgAD/DpQWoZGtOE6OZXdfaqJ02O/GYx4AMZvKgaKRR36C+PrS/13WRLzs085oooNYTQqM7E8btK
	XGMdpWUF7/LBtKTF3DI2mNupHLcU=
X-Google-Smtp-Source: AGHT+IEnhDbVszNgne146HJjcLVKMGaoQqB/YILleFcc1jDSwvl8ZJRLXg5ouSlJ3/Tc1j33FmQMGqrLyqZjQYTIs8I=
X-Received: by 2002:a2e:3308:0:b0:2d2:438a:1207 with SMTP id
 d8-20020a2e3308000000b002d2438a1207mr5822600ljc.37.1709033712832; Tue, 27 Feb
 2024 03:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20240227113023.3194930-1-andreas.muetzel@emlix.com>
In-Reply-To: <20240227113023.3194930-1-andreas.muetzel@emlix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Feb 2024 12:35:01 +0100
Message-ID: <CANNYZj_o=2YCsDggZ+gCE93JXWuD6Jy+J2-fZx0q2DT3jN9FZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-bcrypt: allow building native package
To: =?UTF-8?Q?Andreas_M=C3=BCtzel?= <andreas.muetzel@emlix.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 11:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196263

What is the use case for this? Why would you want these variants? Why
not set them from .bbappend if it's something really specific to your
build?

Alex

On Tue, 27 Feb 2024 at 12:30, Andreas M=C3=BCtzel <andreas.muetzel@emlix.co=
m> wrote:
>
> The native and nativesdk variants of this package build fine, but the
> corresponding BBCLASSEXTENDS was missing. Add it.
>
> Signed-off-by: Andreas M=C3=BCtzel <andreas.muetzel@emlix.com>
> ---
>  meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb b/meta/=
recipes-devtools/python/python3-bcrypt_4.1.2.bb
> index 8328594bad..72216c39c2 100644
> --- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
> +++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
> @@ -34,3 +34,5 @@ RDEPENDS:${PN}:class-target +=3D "\
>      python3-shell \
>      python3-six \
>  "
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196262): https://lists.openembedded.org/g/openembedde=
d-core/message/196262
> Mute This Topic: https://lists.openembedded.org/mt/104600694/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


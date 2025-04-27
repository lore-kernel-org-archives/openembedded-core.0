Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D67C369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 09:14:37 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.23348.1745745267801801780
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 02:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GF7T2X9x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3913d129c1aso2404557f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 02:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745745265; x=1746350065; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZk5alvQroyzmsw7cZxu2Lm9G07RPUV8kJNFWQncGxk=;
        b=GF7T2X9xRYk94/gvMovtHqr5jkmXxJXksbOZXjl2MlDPo2hlapt+j6AY/7O8PZpUsg
         vhflTMCAvRt3FdZasWwVOGkN+RejuN6arligSJUfoPZUQseVQ4tf+kOGHfeY1kbMY1P2
         bl8uUo0SfuFv2b4UxbUV18H+n4wXzA3XDedDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745745265; x=1746350065;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TZk5alvQroyzmsw7cZxu2Lm9G07RPUV8kJNFWQncGxk=;
        b=TXN/MYAReXjpmqbsDUh3fhcO6m8QYiLdubHzemUDBrSQzjE44isERD3xtZgSjd3c5C
         Haq5vOC2c0oYbZc29Kn8a5nnAhyf55CjLLgljVjtU6WK1E72nKRwlLg0khjIIV9npXI3
         cgMJwSBGC9HJnxNtzd1PgoEgCHqPzBz6bVin6DGfN1HE/cTRa8wtGQUsOfuUaxxsyd66
         qXmMDj2uucG2U5bE358Sq29gsXD0KK2RYT7NL1zjzDxE1FXr+HAFDuoyBeMgNbRdwPwn
         iS7PY3pFmi368ndbKg9PxAsprXuiT1PcQpMwnlintU0WLIhR1PCibglBteFLzefhhJ8z
         4ubQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfN9qO85aavttxTuyUoySZC6wMXNdnkyewN3mf/YAP2ftXa/WAGObtpwAezrI9dbZEI5TRHLwxfbilk2HFdPQ6sw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwTP49nyXP8fAWQi+d2wPRPGuQfbawyDCfIa+QXGrI7nEk29U50
	lpXAyDVp1dk8Mb44FGDwhB9s22PfVw6c6AWBqLGYJUqAZcm0wAp2D/oU/kxSYPs=
X-Gm-Gg: ASbGncvgXfYPn1sDw660SNk760A+RCpWJPtADyB/z1Ue2Of3pqqgZp085fEz76Xmsc4
	EB4/K0/6oarxEmh66oJZrFxOD48f+C92HI7zD1jNNwKICGnuRmOH/1Lqh+96/ah1RbSdCi5jXeQ
	BkL2cT3qDyTg4bBLfrAV9owrdr2YlxRhXCGzSGpQTw51uD0XbeSxag6ULVZY1EvCwzglNuON8SB
	xU6eEznS6nE+45iLcDx4bynzYtD5YbS4hHnUFzDZSND+RRWMW3agCvSGpPG4xa7Ae0bbjXy4yJH
	wsgYraRByRUYMsPUjcDf+/lVsnJMLs+xZmPS7BSf2g3VgyQfjSLI0j93+FUMvU/LQb81loNJLuF
	UH/ork4rpj099LSdkw/sBi7aDZWxbTw==
X-Google-Smtp-Source: AGHT+IFHQZX96UuWkWDiIOmlDodrWm+A8pTjLQRekpfWGC5gIBPI1TCOS7hksEbEfNoBAsZ8NTvcew==
X-Received: by 2002:a05:6000:2b0a:b0:3a0:7a5e:d928 with SMTP id ffacd0b85a97d-3a07a5edab4mr2391168f8f.11.1745745265567;
        Sun, 27 Apr 2025 02:14:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb96:8b6f:956e:dc16? ([2001:8b0:aba:5f3c:cb96:8b6f:956e:dc16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46869sm7873450f8f.72.2025.04.27.02.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:14:24 -0700 (PDT)
Message-ID: <ae942e51f15de3980e9e0ba7232d1a43eb6fce84.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] harfbuzz: Upgrade to 11.1.0 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Sun, 27 Apr 2025 10:14:23 +0100
In-Reply-To: <20250427023232.2771349-1-raj.khem@gmail.com>
References: <20250427023232.2771349-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 09:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215546

On Sat, 2025-04-26 at 19:32 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> Changes are:
>=20
> Include bidi mirroring variants of the requested codepoints when subsetti=
ng. The new HB_SUBSET_FLAGS_NO_BIDI_CLOSURE can be used to disable this beh=
aviour.
> Various bug fixes.
> Various build fixes and improvements.
> Various test suite improvements.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0.../harfbuzz/{harfbuzz_11.0.1.bb =3D> harfbuzz_11.1.0.bb}=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.0.1.bb =3D> harf=
buzz_11.1.0.bb} (95%)
>=20
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb b/meta/rec=
ipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
> similarity index 95%
> rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
> rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
> index 8945467a001..645e1e42163 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3c2=
a67cfef01e99e4893d=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> =C2=A0SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] =3D "4a7890090538136db64742073af4b4d776ab8b50e6855676=
a8165eb8b7f60b7a"
> +SRC_URI[sha256sum] =3D "477f0d48c34dc32093b45304178eb9733361ca1832b51598=
79c99e6d40227969"
> =C2=A0
> =C2=A0DEPENDS +=3D "glib-2.0-native"
> =C2=A0

This doesn't seem to be quite enough to fix the compile issue:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1485

Cheers,

Richard


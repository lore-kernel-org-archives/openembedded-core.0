Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676A4C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 09:56:39 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.4420.1743587792012517725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 02:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JE2PFtBn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914a5def6bso3714301f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743587790; x=1744192590; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fbp7EzGUImQbLJeE6mbiAOF2KiB2t+xIJ/CHBNEs29w=;
        b=JE2PFtBn6XnbeRKmDPOspUazd06tmzRG+FDeZ/69cM4Z/YimKidW2YOoDI0OOKf8yF
         nb3K7bk47UKJbVgMhfcTxm4aTDdapcnoNvmOhAFlTB7vbgjdnD9i4zJYbchhmP4+n7ay
         TE3lP5jjv3MDuRhCuN37UXnmCQ57Ig4bfFej4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743587790; x=1744192590;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fbp7EzGUImQbLJeE6mbiAOF2KiB2t+xIJ/CHBNEs29w=;
        b=ZQozLXT53R6CmgLDkpWaZZKSYCg0M7j6sPLhczVPiBKy8K7uyc4XYzVvTynVOjpfnA
         x/Lt9/4Df6feOzqndcAfY4r3i98CYDzpnCJwYMBBcuRuba8ZDHyTd7fzzNMG+YtZNSI9
         ZE3E7RJgioP8adjgjJSQ4VYHWaZgufigkeKN4XaCdZsZRfApd4osJr91QqM16kNLMekl
         865E4uuhYIQnvK/gys/WvQktHanyX4WPFsTjbQgjyDRyqHbjiieFsrGHyzBML1oV7moD
         4BCi0J8TxT0xraJKM4R7n37EOTg/x9e67kJngaSIALT7On9rihoSTBCwAVT0egv9ydOB
         uG0w==
X-Forwarded-Encrypted: i=1; AJvYcCVUNCi3K4qjSBaXxF9arUlBxV8aS05skXh6ftIbsFYdHvdIfOz+1CdkENx86UUM3cP7XoTLOMDs6xlXCdceaF4JKA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz8/mnRvhWfocycGHrilMQ/SyNg6LaKOrlL7YGQrl7xKyw9Ts3s
	UxBCxpEv1tWxCyJbUvw8Ca9uqkZno54YnpurVor5VnzF+0D6Ar7yO0J6KOt34O4=
X-Gm-Gg: ASbGncvBYJJ2OGRS4QSU9DE1D3xt7YFdeXL2ItP5r4M1yHOlGARuFeIzY2LUO9wzJ2l
	6vBPb/Zvj+v/V5Oy5+lUQhF1/EvEpp3Jz2aDUb3fCmlzjIuiKOakYDs5hxuuCxe9g3czZWMnM3s
	WFbPg5ESfBQlxCHobBVi8Ghw7WS9rqpHxOwJ2Y1ngLPyBVdt73A0TVLK9pTOEwhwRnS3S4B4kTy
	WsgJkgdrv45dBCQskMxK0/TPikS55tdlIElubrv8zKsFczbT3vPh8TGJDmh7A4RO2sGSvNjWfyq
	VaMBPuSfVSXRrSQ7M9J+UnXh/qHU7n2mTpi9sySiaD5UvHvgHIb5CyzG37IipFOiU9LtDM02w+L
	CfRn/CEfCPQ72JGPQykPWqLggz16p35J+5A==
X-Google-Smtp-Source: AGHT+IHYMr1BWc2GoeXOlkQrVg1BCM/yDZ89Q9CZuaXk6t55RCsUbx0oHreFnqj+mT/NKKRcDR59Xw==
X-Received: by 2002:a5d:47c1:0:b0:391:ccf:2d1b with SMTP id ffacd0b85a97d-39c1211d566mr13135370f8f.49.1743587790344;
        Wed, 02 Apr 2025 02:56:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24b8:b374:749c:8558? ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66ab86sm16938410f8f.51.2025.04.02.02.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 02:56:29 -0700 (PDT)
Message-ID: <d59454214fc72c26186fc86f073b66fbef83d12c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 -> 24.11.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leimaohui@fujitsu.com, Alexander Kanavin <alex@linutronix.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Anuj Mittal
 <anuj.mittal@intel.com>, 	openembedded-core@lists.openembedded.org
Date: Wed, 02 Apr 2025 10:56:28 +0100
In-Reply-To: <20250402090749.2119-2-leimaohui@fujitsu.com>
References: <20250402090749.2119-1-leimaohui@fujitsu.com>
	 <20250402090749.2119-2-leimaohui@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214245

On Wed, 2025-04-02 at 17:07 +0800, leimaohui via lists.openembedded.org wro=
te:
> Fix the issue that:
> =C2=A0| Traceback (most recent call last):
> =C2=A0|=C2=A0=C2=A0 File "/mnt/test/build_auh/tmp/work/core2-64-poky-linu=
x/python3-webcolors/24.11.1/recipe-sysroot-native/usr/lib/pyth on3.13/site-=
packages/pyproject_hooks/_impl.py", line 402, in _call_hook
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 raise BackendUnavailable(
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 ...<4 lines>...
> =C2=A0|=C2=A0=C2=A0=C2=A0=C2=A0 )
> =C2=A0| pyproject_hooks._impl.BackendUnavailable: Cannot import 'pdm.back=
end'
>=20
> python3-webcolors has migrated to pdm-backend
> =C2=A0| diff --git a/pyproject.toml b/pyproject.toml
> =C2=A0| index 6fcec77..9f2dfa9 100644
> =C2=A0| --- a/pyproject.toml
> =C2=A0| +++ b/pyproject.toml
> =C2=A0| @@ -1,65 +1,110 @@
> =C2=A0|=C2=A0 [build-system]
> =C2=A0| -requires =3D ["setuptools>=3D61.0"]
> =C2=A0| -build-backend =3D "setuptools.build_meta"
> =C2=A0| +requires =3D [
> =C2=A0| +=C2=A0=C2=A0=C2=A0 "pdm-backend",
> =C2=A0| +]
> =C2=A0| +build-backend =3D "pdm.backend"
>=20
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
> =C2=A0...n3-webcolors_24.8.0.bb =3D> python3-webcolors_24.11.1.bb} | 7 ++=
++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
> =C2=A0rename meta/recipes-devtools/python/{python3-webcolors_24.8.0.bb =
=3D> python3-webcolors_24.11.1.bb} (70%)
>=20
> diff --git a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb b/m=
eta/recipes-devtools/python/python3-webcolors_24.11.1.bb
> similarity index 70%
> rename from meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
> rename to meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
> index c5ed4bd7d3..cda63d2a35 100644
> --- a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
> +++ b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
> @@ -3,10 +3,15 @@ HOMEPAGE =3D "https://pypi.org/project/webcolors/"
> =C2=A0LICENSE =3D "BSD-3-Clause"
> =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcbaebec43b7d199c7fd8f541=
1b3b0448"
> =C2=A0
> -SRC_URI[sha256sum] =3D "08b07af286a01bcd30d583a7acadf629583d1f79bfef27dd=
2c2c5c263817277d"
> +SRC_URI[sha256sum] =3D "ecb3d768f32202af770477b8b65f318fa4f566c22948673a=
977b00d589dd80f6"
> =C2=A0
> =C2=A0inherit pypi python_setuptools_build_meta ptest-python-pytest
> =C2=A0
> +DEPENDS +=3D " \
> +=C2=A0=C2=A0=C2=A0 python3-pdm-native \
> +=C2=A0=C2=A0=C2=A0 python3-pdm-backend-native \
> +"
> +

ERROR: Nothing RPROVIDES 'python3-webcolors-dev' (but meta/recipes-devtools=
/python/python3-webcolors_24.11.1.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'python3-webcolors-dev'

That recipe isn't in core.

Cheers,

Richard



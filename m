Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92931D41D4A
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 13:23:21 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.11209.1731504193371223116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 05:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iYaEhOoG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315eac969aso4596625e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 05:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731504192; x=1732108992; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=edpFySIR/QkRwDLyvDR92ITobiExnBEhIXR85oBXQwo=;
        b=iYaEhOoGV3yK5nykOXfODbXLAy/IyzS210t9FKapkNRXVNG9kuj808KiLmX0NA37xA
         Ku3H5/oVXSgi3r+sJXOWKRYBS4aMJW8nmx8HpQRVZ5c97z8tgyyxT32NMxr67WEOQQI9
         Ex9p9CgJoYjxTh3ZtcA+xp0YKl2o9jg+uvwJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504192; x=1732108992;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=edpFySIR/QkRwDLyvDR92ITobiExnBEhIXR85oBXQwo=;
        b=U3Hp/xhvmOghDy7OZ3rUbB2TnuZr8FSeSoBJn1yZg65sWe/FIwM+IKN58dcvwUdyZ8
         UmclHMooiFvGXmeFi8xHAjszzjLJBvIUQ8dGoDUpmRnhR4bT2f360CH+Ck+l0y8AmaiN
         dn69JFvliAlv8phyAsQityU512jACFEwIKvkAtULzJ0KEEUQX2OcMAXZyXuYr7ud7qyh
         YLPsd0YUDf3Cc/XOyHyDSFcBkPwH/W6Um7QwdcwDZN/knNWk5yLopqN+G1Xurp4kUnor
         Wi2k3gRW4hTOE3CDU192etF+d3nT/rB3gX3kwLK0iykgVjCXw4+pnDhr7CADZ8ngKw9D
         hbyw==
X-Forwarded-Encrypted: i=1; AJvYcCVWEKHJmhFm2d7RaCfdAHjXOGLJsFMVg4R/tGGd+/a3CoyeXwq/1S0HRAddVp/3RxLdv/EeaHt7WjZuKQTL0rJ3jQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyquy+D7osC0nuh3lr4HqRbUqcSKGjx7EGwzuQHP7TthrvtG+ua
	nxF/OhUWJxg9wcM7JNGl8JURn11nxJZHZg9k/1tDfJJuw3e/8I9YEuSCxBvXH6z36ZsF5br0fZQ
	0/Ms=
X-Google-Smtp-Source: AGHT+IF/2+l7gLlxvmZU3BnLpkBt883QeqD22anMsa4R2H7GhiqQObXlMmtPZiCAHKdA9TOUbp+StA==
X-Received: by 2002:a05:600c:4ecf:b0:431:405a:f93b with SMTP id 5b1f17b1804b1-432b686ec50mr173745225e9.10.1731504191675;
        Wed, 13 Nov 2024 05:23:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ab73:49b3:d413:b355? ([2001:8b0:aba:5f3c:ab73:49b3:d413:b355])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d55051easm25407155e9.24.2024.11.13.05.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:23:11 -0800 (PST)
Message-ID: <da8159be7e9d212681a4c2b52643bb2b019ab462.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc-target.inc: Fix gcc symlink handling for
 multilib support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Date: Wed, 13 Nov 2024 13:23:10 +0000
In-Reply-To: <20241113125147.4193489-1-Deepthi.Hemraj@windriver.com>
References: <20241113125147.4193489-1-Deepthi.Hemraj@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 13:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207102

On Wed, 2024-11-13 at 04:51 -0800, Hemraj, Deepthi via lists.openembedded.o=
rg wrote:
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>=20
> Enabling multilib support and adding both lib32-gcc-symlinks and gcc-syml=
inks
> to the image installation results in a conflict between
> gcc-symlinks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.corei7_=
32.
> Following error occurs because of the conflict:
> "file /usr/bin/gcc conflicts between attempted installs of gcc-symlinks-1=
3.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.corei7_32"
>=20
> The conflict occurs because both packages try to install files in the sam=
e location,
> causing installation errors during the build process.
>=20
> Updated the gcc target recipe to correctly handle symlinks for multilib s=
upport by using ${MLPREFIX}gcc
> instead of just gcc for the gcc binary symlink in ${PN}-symlinks.
> This ensures that the symlinks point to the appropriate multilib gcc bina=
ry for 32-bit and 64-bit configurations.
>=20
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/gcc/gcc-target.inc | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devt=
ools/gcc/gcc-target.inc
> index 6b47c10413..ff59eb1b52 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -71,7 +71,7 @@ FILES:${PN}-dev =3D "\
> =C2=A0"
> =C2=A0FILES:${PN}-symlinks =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 ${bindir}/cc \
> -=C2=A0=C2=A0=C2=A0 ${bindir}/gcc \
> +=C2=A0=C2=A0=C2=A0 ${bindir}/${MLPREFIX}gcc \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${bindir}/gccbug \
> =C2=A0"
> =C2=A0
> @@ -182,7 +182,7 @@ do_install () {
> =C2=A0		ln -sf gfortran f95 || true
> =C2=A0	fi
> =C2=A0	ln -sf ${TARGET_PREFIX}g++ g++
> -	ln -sf ${TARGET_PREFIX}gcc gcc
> +	ln -sf ${TARGET_PREFIX}gcc ${MLPREFIX}gcc
> =C2=A0	ln -sf ${TARGET_PREFIX}cpp cpp
> =C2=A0	ln -sf ${TARGET_PREFIX}gcov gcov
> =C2=A0	ln -sf ${TARGET_PREFIX}gcov-tool gcov-tool
>=20

No, sorry, but definitely not.

You can install one of these or the other but both doesn't make any
sense, just don't do that.

I also don't understand how this fixes things since surely all the
other symlinks conflict too?

Cheers,

Richard


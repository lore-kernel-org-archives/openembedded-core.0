Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8183CCF9E3
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 23:22:45 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8706.1762125759225674300
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 15:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EpxUh9vY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477365fbdf9so10779855e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 15:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1762125757; x=1762730557; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1QgOuFosHWssJcziHpLvGEn43HeRBRXABtj5LBb5+k=;
        b=EpxUh9vYbBBOa0zgqAA8aBj6D/t9rbiLoewwDdRb2Ak2bU19E5z25O+WtjSZp4trxH
         aZRrYa/wQN617/kc707iLlZSM/2j4b7A7TaK4OBAiu/iud/bvbtSYIps4goR69fhWa/W
         uINLYyQiImZIcmX5AxE7M97QmZAK6MerVX5hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762125757; x=1762730557;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k1QgOuFosHWssJcziHpLvGEn43HeRBRXABtj5LBb5+k=;
        b=MWSdgqXb690Zo4ovWplhtnC6Np4QnNpciM/5UHy9EujYc2Ebiv5qjK1dzFg2+Ak/Jg
         cpo1n2f0nt1G8EQUZbF/N/as+4In6UE1uxCYcpxqWuNNebcex2NlztKAc++F34yhWSYY
         tE88kI1IkofnoiO7kXuKLruLyd6MSXRhzTDGkQyFmbGrN7oplAsM77oMMdDkfs8RCrzN
         Z1N0N92qtD6YU+E60S/CPpailM9puxn6WrR8sOMyKU2He2XlrXjchdxs04XdEqirDNWF
         KAinpOkxcnvr/G9IWErzBDhJOYa203cB3uiAezICAi6RsibtmjqVpyvNw/L/fc9O74Nj
         Ok/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVh08ZW5UveOvzn05nKOEK3+Xp2A39U2GbsW3tb1n4n/Iewiofxe6h1ZqZWfEdokWNeRSbNyJI1bBX8mwy0AKBKHQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQ1TKDmVz8/ROF35px+3JSK72nyfAE8Yh2dS546HbuelIqTpAF
	igSDiHcK5jaI9Ft3m2g52dyfgJoFDFoFtuMjjUd/fJ8sKuOevCZGhwH5y0LSiAWvado=
X-Gm-Gg: ASbGncu5C8ecwUCy/Ypg+1u8Hpn8j3bKWquwOkA5TzQEsdq5IGfbDId71EigaowoVyH
	wx7KJqaCD0BphcE7eSFiBl+4aaSdH97gkY8m423cNYV28ZnbSh2nJUsakoLBFgQWeUwvWI/3Kv0
	CoboCUJDF7FFD4zQejKfCCMdqM+5uTtLWmH3+BiHwiEigvvx6FGxUYhZr9heIk93jZybFZDHpsN
	aeCQY+ntT7ytt54S+n9f4x7bG4sXegcGIKt2swyRPydapclV6cFq9zRUXSR6osHqwBLqjXwH+Lt
	/cE3w717xKz24bn/Tkvyefln+3QDetlaq7KRAZ9AedKdWRGaiOTOb4IXdxkRp5NZvx0L7MPmD7l
	KDBEESKl8EYAmH8zHKbQQkKqxKjpJDE2Nlh5sz1wYitSKy+4hrS2bl04O9ixdAfjYT20OHal1te
	eAYkXUm0wxVzBlASfSlXFtyLfICbZK99wheqwo38INRwB3e47INFOn9Jf2IM9r7A==
X-Google-Smtp-Source: AGHT+IFjn//adyKt/0Z6464y4hx26TZDL9iV4nEvJ4kr9JnHhRrbXPItx4JccZ1IzLeZTbDO1fa0JQ==
X-Received: by 2002:a05:600c:3489:b0:471:15bb:ad7f with SMTP id 5b1f17b1804b1-477307e1f05mr93348775e9.17.1762125756960;
        Sun, 02 Nov 2025 15:22:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ab5a:77c:f3d7:d70b? ([2001:8b0:aba:5f3c:ab5a:77c:f3d7:d70b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13ec105sm17138674f8f.36.2025.11.02.15.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 15:22:35 -0800 (PST)
Message-ID: <fcd2e330b64058ae60b478acf9f30d1f83ea72a7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] Avoid running whilst in a deleted
 directory.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gordon.lack@dsl.pipex.com, openembedded-core@lists.openembedded.org
Date: Sun, 02 Nov 2025 23:22:33 +0000
In-Reply-To: <20251102200653.3438957-1-gordon.lack@dsl.pipex.com>
References: <20251102200653.3438957-1-gordon.lack@dsl.pipex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 23:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225584

On Sun, 2025-11-02 at 20:06 +0000, Gordon Lack via lists.openembedded.org w=
rote:
>=20
> This caused a problem when building on Kubuntu 25.10.
>=20
> Whilst the real problem is the cp in Rust coreutils, it makes sense not
> to be in the directory you are about to delete.
>=20
> ---
> =C2=A0meta/recipes-devtools/perl/perl_5.40.2.bb | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-dev=
tools/perl/perl_5.40.2.bb
> index a78d2ed0be..ee6896b479 100644
> --- a/meta/recipes-devtools/perl/perl_5.40.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
> @@ -58,6 +58,12 @@ CFLAGS:append:toolchain-clang =3D " -fno-strict-aliasi=
ng"
> =C2=A0CFLAGS:append:toolchain-gcc:class-target:x86-64 =3D " -fno-builtin-=
memcpy -D__NO_STRING_INLINES -U_FORTIFY_SOURCE"
> =C2=A0
> =C2=A0do_configure:prepend() {
> +# ${B} will have been set as our current directory before immediately
> +# before do_configure is called. So let's avoid any problems associated
> +# with it being deleted from underneath us.
> +# We're being put back there (the new version) at the end of this code
> +#
> +=C2=A0=C2=A0=C2=A0 cd /
> =C2=A0=C2=A0=C2=A0=C2=A0 rm -rf ${B}
> =C2=A0=C2=A0=C2=A0=C2=A0 cp -rfp ${S} ${B}
> =C2=A0=C2=A0=C2=A0=C2=A0 cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* $=
{B}

Thanks for sending this!=C2=A0

The patch does need a few small tweaks. I'd suggest "cd ${WORKDIR}" as
I get nervous about going to / and running rm, I appreciate it
shouldn't matter. I've not looked but I'd also like to confirm this
does a "cd ${B}" at the end so the cwd is restored?

The comments should also really be indented too to match the cd, just
for readability/coding style.

Cheers,

Richard




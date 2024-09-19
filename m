Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ED4CE8D75
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 10:31:02 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.16297.1726741857867791942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 03:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bwhVkfda;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-374d29ad870so379021f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 03:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726741856; x=1727346656; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QQa/62aRvBdFUxHbeTuks1TV0gqMEphx4iAqrIObsW0=;
        b=bwhVkfdaFLTCeGADrDUlc577IMDUigIPffBX/9tjH20gUTxtJbmyrqZ0Dy3ziK9C5Y
         MVvplnvcUKVhXhj91ZrR50+otVibIDWPUIv/QPeOKDSUKHgZ+kKHQaaKTi6M2UvnZ9pr
         MY80ZR8L9AXC/Wu0W/KvNfbrecopkA8cQLgb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726741856; x=1727346656;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQa/62aRvBdFUxHbeTuks1TV0gqMEphx4iAqrIObsW0=;
        b=hoMhmlBt/2DnVwv2JnO7fYFl5utPzvHS67JS+BfYa2Py0DQ6AytiuA4SIBiNwydRg2
         4ySCsH0wRhTe0tD0pOfgscFD/0F0aULhaxA027QEqv8vTUxdfbXztDXkT2n3+uAIpLB9
         E9Amfm4EP7aHe4aVMbmRqB3m8ta96WLFGGp6QF6oqMby3xDeQxKyTDg1qDkGE0uOe1gX
         l06eUBSIlVP9cqZic+dxAl58TeVQA9xc0N+SnBFwnZcXT1ZNozzOVBjLgAbAbb52FH1z
         oZq7av7pUnlkr2W5EwDEeKbGXFF/1TTir+NjMFmnlx7GqvOBwRpzchpHNEwa59sWiYlL
         AbOA==
X-Forwarded-Encrypted: i=1; AJvYcCXeoU7jPqefT/FHz86syC9f9HRl1e4v/hBzr0JHS+gCowKK44ScGvdzdXJ82erGd++5PHzLJGyhI0s25Y0cknBE2g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwqgpvcSuTz5Bt1jU9uRmM03iozPmlx2XKYgzAChI9/yy58HrIL
	bXjSalPRY7ExO9tpV7SiaGu6Hd0tfDDRXVNWiAfpsnhQoYWK1cmEeYYPwUMH3JM=
X-Google-Smtp-Source: AGHT+IEMGVvTtahE6IXf9Ajl2i1pWl8zvFvsKMsLGpKhXn+TYFx26GQRWtEnDvpmUEakBeAONIq4eA==
X-Received: by 2002:a5d:6d84:0:b0:371:c578:3130 with SMTP id ffacd0b85a97d-378d61d4fdemr15037559f8f.8.1726741855923;
        Thu, 19 Sep 2024 03:30:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f722:770d:8a57:e159? ([2001:8b0:aba:5f3c:f722:770d:8a57:e159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73e8475sm14660753f8f.35.2024.09.19.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 03:30:55 -0700 (PDT)
Message-ID: <eef050148b32a57bcbcd0e3a34003f765c44a8b3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [scarthgap][PATCH] gcc-target.inc: Add RPROVIDES to
 resolve gcc-symlinks & lib32-gcc-symlinks file conflicts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Date: Thu, 19 Sep 2024 11:30:54 +0100
In-Reply-To: <20240919102241.178655-1-Deepthi.Hemraj@windriver.com>
References: <20240919102241.178655-1-Deepthi.Hemraj@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 10:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204671

On Thu, 2024-09-19 at 03:22 -0700, Hemraj, Deepthi via lists.openembedded.o=
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
> By using the RPROVIDES, gcc package can satisfy the dependencies for both=
 `gcc-symlinks` and `lib32-gcc-symlinks`.
> This prevents the conflict, while ensuring that both 32-bit and 64-bit sy=
mlink packages can co-exist.
>=20
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/gcc/gcc-target.inc | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devt=
ools/gcc/gcc-target.inc
> index 7dac3ef422..f31ea15740 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -27,6 +27,7 @@ EXTRA_OECONF:append:x86-64:class-target =3D " ${@get_gc=
c_x86_64_arch_setting(bb, d
> =C2=A0export gcc_cv_objdump =3D "${TARGET_PREFIX}objdump"
> =C2=A0
> =C2=A0EXTRA_OECONF_GCC_FLOAT =3D "${@get_gcc_float_setting(bb, d)}"
> +RPROVIDES:${PN} +=3D "gcc-symlinks lib32-gcc-symlinks"
> =C2=A0
> =C2=A0PACKAGES =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 ${PN} ${PN}-plugins ${PN}-symlinks \
>=20

This isn't correct. What if my multilib was "lib64" or something else?
This definitely can't be hardcoded like that.

Cheers,

Richard


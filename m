Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B89ECA0EE4
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 07:18:21 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.29933.1755328692156354562
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Aug 2025 00:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NfV7KIEr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so19315145e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Aug 2025 00:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755328690; x=1755933490; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=19hZcXIZR1Xj+SYp/jAidJfZp6K6bTmPz3LrMkNsU3U=;
        b=NfV7KIEr8HG3i4REIlwf5A0EYsWA/LBc61RrtWuFDicf2SvDZ16euPrWOoCooJx2Dr
         uhL6ZTtFXDw77onSO9b0XeGOhITxbVhgIk2j6F0prQamLBZbeERnqRlroD5OeFysihp3
         YHBj21X+IwyYJvXcFCVU3AWJh3Y8DIhYST+E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755328690; x=1755933490;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=19hZcXIZR1Xj+SYp/jAidJfZp6K6bTmPz3LrMkNsU3U=;
        b=aDoM10mf/exBh3L+po7kmJkRK5En1RCMJItD+vfVyHacPPQwHOUxzW7VsnkYpSWKSw
         n61tGBKqep3BH03brh0Ooi2UreVfpQSpmHhM13lWtmJ0lqY3Rcb+jc8Wnjd82qUc1NqO
         ezKtrGcnPDGxLU1QUkF9OAk1Mbvl1SU3/x4Kauy7AAmY9qJfH64OlDtoTaPmxW+VIAQa
         sCGMH6fJMFcfq4GeKXgp71J+xnowKzLcmxR4t+HgB+seqpb5wYQ54YviY0bqxLTUlQRD
         l8z+XFSyHRfx8IJOhfixu5NMl+47eZoEHEva3rVgwqT3eBp/w8fwNQSWqeC945hPp6Pm
         Q67A==
X-Forwarded-Encrypted: i=1; AJvYcCXGzleewlcpnR3+xBu1gXrqXNusFbkExeksWZ6XHKrmciNGnwkWr/Ac1Yjx0sOw8++tdJZYtV9ZxLXDExJmSzgzMw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwFtxN0A9x20Ud5TvCNdnCi77f4FKtvigvwcBrRzuhbA50vAr4u
	gF8SU5aZB7XuoMCXuJYH1kFSFiy7jZpI/hzqWWldjaG2YIoiCyma38XbNU3F4zDLs5Y=
X-Gm-Gg: ASbGncupwVKf1GiuSfrtJQu5IjsypxfJvuiXIJdEHfmsEBJ33f2IQkIwJDBGK7xm1if
	12JBIlPgtnI6UIPMDi2jt/yYt4xNx2qa1PVnzFoq9FydQXBiEA7c/6O/4oqhTi46HNH9iQInrfd
	dgnRzeJfB7cI2pAxb0WrtfRDqixP20JKuMDmOq+UFBpzYTnjxMTatJMvTUbZuds/ULgsydeZvDf
	TyEiSqvGhWnVfztFu1eeqqOhQaWL/94sMlQV56ppoboL/kgRj+YK+o2I2IFAYM97CEbvC5bCYbj
	oB8lp7LBni+HRyj6nwprM7exRa7oNJi0gnUxP+Ab0a+GImd9gFB1EF6Nqkm/Edy5srT69iNmipS
	cXA2mp4kGes/KBjwhj0+mJrcaEq4JU31274Wak9N0vxxwdjYd3FsxJKG6HwSrBHxT2l99juOnoi
	51WEKi7ttK29dzpOtnyBoSCQ==
X-Google-Smtp-Source: AGHT+IHkNOPcBPQqZSqrevzaWl+Y4FJVZ+m+cWP+ZIFfYXOdk0RStWwXF+q6IBd49bsTbnH9GLr2Nw==
X-Received: by 2002:a05:600c:1c96:b0:459:dfa8:b881 with SMTP id 5b1f17b1804b1-45a217f1b0cmr30880335e9.7.1755328689944;
        Sat, 16 Aug 2025 00:18:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e595:3934:6d31:4d26? ([2001:8b0:aba:5f3c:e595:3934:6d31:4d26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a2232e21bsm45145505e9.27.2025.08.16.00.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 00:18:08 -0700 (PDT)
Message-ID: <24dbb765a2f26ed125154af3993d4b56490165c3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] fragments/autobuilder: add go to
 SDK_TOOLCHAIN_LANGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Sat, 16 Aug 2025 08:18:07 +0100
In-Reply-To: <20250815102024.1664011-1-alex.kanavin@gmail.com>
References: <20250815102024.1664011-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Aug 2025 07:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221994

On Fri, 2025-08-15 at 12:20 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> For reasons unknown, only rust was listed, which means
> nativesdk-go was not built or tested, which lead to
> breakage like one fixed in
> https://git.yoctoproject.org/poky/commit/?id=3Da669cd2e0c760da9d7e872daea=
9590fc9e86d766
>=20
> Note that with this change only building and installing go
> into SDKsis tested, but no tests are performed with the
> toolchain itself in testsdk/testimage.
>=20
> For that, a bug has been filed:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15953
>=20
> Remove go from x32 targets as it will not build for them.
> (next to similar removals for rust)
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> =C2=A0meta/classes-recipe/populate_sdk_base.bbclass=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0meta/conf/fragments/yocto-autobuilder/autobuilder.conf | 2 +-
> =C2=A02 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes=
-recipe/populate_sdk_base.bbclass
> index e6685cde97b..a87e3c49eb1 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -62,6 +62,8 @@ SDK_TOOLCHAIN_LANGS ??=3D ""
> =C2=A0SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 =3D "rust"
> =C2=A0# libstd-rs doesn't build for mips n32 with compiler constraint err=
ors
> =C2=A0SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 =3D "rust"
> +# go will not build for x86-x32
> +SDK_TOOLCHAIN_LANGS:remove:linux-gnux32 =3D "go"
> =C2=A0
> =C2=A0TOOLCHAIN_HOST_TASK ?=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 nativesdk-packagegroup-sdk-host \
> diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/met=
a/conf/fragments/yocto-autobuilder/autobuilder.conf
> index e3bac343390..85987b08995 100644
> --- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> +++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> @@ -9,5 +9,5 @@ IMAGE_CLASSES +=3D 'testimage'
> =C2=A0SDK_EXT_TYPE =3D 'minimal'
> =C2=A0SDK_INCLUDE_TOOLCHAIN =3D '1'
> =C2=A0ESDK_LOCALCONF_REMOVE:append =3D 'BB_HASHSERVE'
> -SDK_TOOLCHAIN_LANGS +=3D 'rust'
> +SDK_TOOLCHAIN_LANGS +=3D 'go rust'

Thanks for the x32 tweak. I worked through the failures in my builds
(from multiple sources) and I think there are a couple more from this.

An easy fix for mingw:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/builds/2272

A hash instability this is indefiying once it is included in the SDK:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2303
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2154
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2082

Cheers,

Richard





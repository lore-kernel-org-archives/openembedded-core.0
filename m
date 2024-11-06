Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FBCD29FB5
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 07:50:45 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.40810.1730879442291413729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 23:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AcIwN7U2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43159c9f617so49943865e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 23:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730879441; x=1731484241; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t5tvuDSOTC5/ybSQwoO1h7Dv6FFuFybk+JjDdJ986dI=;
        b=AcIwN7U2SusD93KPRd7cPXvmws6mbGzS28dU0xMKQhL9VEFZpEl7TgWTDheoFOV37C
         L2RiRkw32n9jZDSj+7JyG1AOdttHVOGpil4Xf/JEWulz3uJPNFfD+gg+CIkoVrIOHmQC
         g5dlbq5kcGkAPMK2LZqcVmJCvpNnMtVi7w+xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730879441; x=1731484241;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5tvuDSOTC5/ybSQwoO1h7Dv6FFuFybk+JjDdJ986dI=;
        b=BrM8w/8ZtRItRq5Pce07mcYsKyzRrMl3FlyentFMxkiKaB/TKUUuH3Sqb48xL8DRVc
         jKgwPUC/Uods2mHzRXmOehJwHrcXT/idEQLcrYfaQvQ0IRATM0foxCU/0ZwFCbNIC8Hg
         wplFOgXZk2//2/jFAVY5ZCfW16qrBT+q2oWNZeC9V4w2R4qLkH6zAaQht09EGw61GeBS
         A/DauWtnE3KkBN3PDGUVXUo+7SwLO2NddCEvTaQ2VQWV5zqrPhBsI9cTUkbuhZbb3MGq
         A6rpEFlHtC0tqHgsj47zapgKripFI4YZ+z9FAp99cU3jnvbDbNGovKFJgVRnav/LM3QG
         ovrg==
X-Forwarded-Encrypted: i=1; AJvYcCWOzEN9kDjbxEcc+0B4Hwbr0KmwCt0t48gI2nm61R9GUrn0zhdYbgSaXyT4pvltl21f+0nVCBXMLyFm0MXt3eyUNw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4XK5ohH/T/kI7pl7kJJL0W3lTAl5FlnLP0qxFDnP/p+WQjIgK
	h87YNXLLggWkMFwp/q61gqRicDVvaVcPkbxtE1ee06Ybj0zBlmzzpqcW7kX5eLM=
X-Google-Smtp-Source: AGHT+IGBOvEpso6Ka1sHL4w4H76uNnTbVQhRubX3gkNk11+G1iOVgstDLEcLOJwa+kPXGfaBrkg4GQ==
X-Received: by 2002:a05:600c:500a:b0:431:561b:b32a with SMTP id 5b1f17b1804b1-4319acb8ce7mr347458035e9.19.1730879440662;
        Tue, 05 Nov 2024 23:50:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:de00:615d:c4fc:749b? ([2001:8b0:aba:5f3c:de00:615d:c4fc:749b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10ea7a1sm18130545f8f.62.2024.11.05.23.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 23:50:40 -0800 (PST)
Message-ID: <3ac4b13ff08fc83cb2e37fc7caadeb89115e7814.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: require lz4 instead of lz4c
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jsbronder@cold-front.org, openembedded-core@lists.openembedded.org
Cc: Enrico Jorns <ejo@pengutronix.de>
Date: Wed, 06 Nov 2024 07:50:39 +0000
In-Reply-To: <20241105153752.3610957-1-jsbronder@cold-front.org>
References: <20241105153752.3610957-1-jsbronder@cold-front.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 07:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206760

On Tue, 2024-11-05 at 10:37 -0500, Justin Bronder via lists.openembedded.or=
g wrote:
> With bitbake commit 'bb: compress: use lz4 instead of lz4c' we require
> lz4, not lz4c [1].=C2=A0 Going as far back as Ubuntu 16.04/Fedora 25, the=
y
> are packaged together so it should be safe to simply adjust the
> requirement from lz4c to lz4.
>=20
> Note that the two are largely the same, but upstream has considered lz4c
> deprecated since at least 2018 [2].
>=20
> 1. https://git.openembedded.org/bitbake/commit/?id=3D907472034b344e4eb73c=
fd43059a413469f52e1c
> 2. https://github.com/lz4/lz4/pull/553
>=20
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
> =C2=A0meta/conf/bitbake.conf | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index eda505c861..14e761e2e7 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -517,7 +517,7 @@ HOSTTOOLS +=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 [ ar as awk basename bash bunzip2 bzip2 cat chgr=
p chmod chown chrpath cmp comm cp cpio \
> =C2=A0=C2=A0=C2=A0=C2=A0 cpp cut date dd diff diffstat dirname du echo eg=
rep env expand expr false \
> =C2=A0=C2=A0=C2=A0=C2=A0 fgrep file find flock g++ gawk gcc getconf getop=
t git grep gunzip gzip \
> -=C2=A0=C2=A0=C2=A0 head hostname iconv id install ld ldd ln ls lz4c make=
 md5sum mkdir mkfifo mknod \
> +=C2=A0=C2=A0=C2=A0 head hostname iconv id install ld ldd ln ls lz4 make =
md5sum mkdir mkfifo mknod \
> =C2=A0=C2=A0=C2=A0=C2=A0 mktemp mv nm objcopy objdump od patch perl pr pr=
intf pwd \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3 pzstd ranlib readelf readlink realpath r=
m rmdir rpcgen sed seq sh \
> =C2=A0=C2=A0=C2=A0=C2=A0 sha1sum sha224sum sha256sum sha384sum sha512sum =
\
>=20

This caused a failure in barebox:

https://valkyrie.yoctoproject.org/#/builders/23/builds/409/steps/14/logs/st=
dio

Cheers,

Richard


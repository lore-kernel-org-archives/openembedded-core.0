Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E76AC3ABB6
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 07:10:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.44660.1746429026509784215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 00:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KmKshzSu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a823036so38234415e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 00:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746429025; x=1747033825; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03BqwYVWtRnueu13MQ7I9O1VJIlOgLZK58PXc4cz4/k=;
        b=KmKshzSuI3AqKxnZVktUXvhN1bWDSFrDjVYvCbuyhXrqMo/5/v/p44JuF5PvAfKdAF
         gfvbTfRAYpsIdGNrB2Tu6YQy2fsu/I+eLOq9zVikU0NF4kxeKZ3Wb5VK8fcFvsO1mSVS
         YvAroTXCKBh/X1xuoUSVFsuDki4M+ZwSUEBvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746429025; x=1747033825;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03BqwYVWtRnueu13MQ7I9O1VJIlOgLZK58PXc4cz4/k=;
        b=t4BbR8DfQtB9d/IA/ocyfp/lk7nf7eDB695rV0QP6q12bOVYixjMJx3Ds6tHC/0PCv
         O04xzToj7BrP4JJkYjGsZkbFNaaS2nhs85mE5kSGQfA/wSOm6bhoYiONdTHNWKnoBqdD
         EZe3YgAiyJISJzxW9fazyFNi7v8VS0BdqHRuHL4tgnW8DGeWHrZ/q/WzFQ4IZSVRKLzI
         5rr+lgS7sjzlsOmq9rOhEOetMhS17rYUseQ1FIVOj6yeat5CRrv6rfr7T0K9JZ9HPGXf
         pQ2aCmGRcwrodr40Pe7vRwpQj5Sw/8cqtLpG6XWaXIpIEpG6CtCJ3kdroC8rw1Lj3KM/
         QBLw==
X-Forwarded-Encrypted: i=1; AJvYcCWttUxwQhbdRP8RhpVN5uCZEhqoTm2Vn9DYchNZnwOkHm0L6yr+Vu56EAFzoqJmy+JSmle/d/vY/gmgtasduJcNRg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQ5pf7mg+sOSwDDASk/sDygT5NPD8/hvmpteDJ1Aair0oeKTAQ
	tmc025D++sR4kKmb1Avr+jEBs22ouugYNShgbyLZwCXzN5RmsC0nqf8PndNQRR0=
X-Gm-Gg: ASbGnctVZuANhuQJmJDtjtctkCCDBb755kDoPZQOCStZ+zljp+cbkVjx9z7w/ZRyWU0
	A+1EGxsRp0Dk6yVOfIrky6QWHX03LPPEwrv6RnEa71T+QwaXL+FVTTCEgtlre6D+6gdgBA1Qah4
	DJkhnIyeMHChK1gUTQMgMrAsWCzzWh22yq5+7N9f7sU90mDNnRgzsDzNVcRGGLINV0AU7xFbu5m
	t99iyJxucY1jwxDd7hIRfEAn9+BA5cVpVooIJR4VE2ucaNTfhPX0CxIKs9nQGzGv4gU+zohfdkx
	Mg/07ptwAkXR2CUQMJxH7buEGRLEPgjzNlQ8AMFkuA7VCqD6LNgNv0fe55V0ZkBcktlbjC/XB/K
	ZBtjpuev7LjBz9Fvu6GkbNuezuuKSX/sOH5wr/knE
X-Google-Smtp-Source: AGHT+IHooIPEkCQH7Ezo8mNo+zXkfGnsJoTh+L+PhhbChqXKFUdn3GCyyT4ZL0Bl9KodGlzLewIOzA==
X-Received: by 2002:a05:6000:4205:b0:3a0:8a1c:ef0 with SMTP id ffacd0b85a97d-3a09ceb8728mr4916176f8f.24.1746429024539;
        Mon, 05 May 2025 00:10:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4146:97bc:575c:a2f9? ([2001:8b0:aba:5f3c:4146:97bc:575c:a2f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286dasm122474515e9.31.2025.05.05.00.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:10:23 -0700 (PDT)
Message-ID: <24ec9d9d4bfe39a1d1e3f7d0d00e18cd11f41cfa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: pseudo to ignore vim and less
 config files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Mon, 05 May 2025 08:10:21 +0100
In-Reply-To: <20250505064410.896233-1-mikko.rapeli@linaro.org>
References: <20250505064410.896233-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 07:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215988

On Mon, 2025-05-05 at 09:44 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> vim and less always write to these files in users home directory.
> Using vim and less via pseudo in "bitbake -c devshell recipe" and
> outside of pseudo triggers pseudo aborts which makes interactive
> use of devshell difficult. Fixes vim and less crashes and related
> pseudo log entries:
>=20
> inode mismatch: '/home/builder/.viminfo' ino 33270730 in db, 33269736 in =
request.
> inode mismatch: '/home/builder/.lesshst' ino 33270625 in db, 33270730 in =
request.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/conf/bitbake.conf | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b1dae17267..9cb70ee999 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -748,6 +748,7 @@ PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,/run/=
,${T},${WORKDIR}/recipe-sysro
> =C2=A0PSEUDO_IGNORE_PATHS .=3D ",${TMPDIR}/sstate-control,${TMPDIR}/build=
stats,${TMPDIR}/sysroots-components,${TMPDIR}/pkgdata"
> =C2=A0PSEUDO_IGNORE_PATHS .=3D ",${WORKDIR}/deploy-,${WORKDIR}/sstate-bui=
ld-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/pkgdata-sysroot"
> =C2=A0PSEUDO_IGNORE_PATHS .=3D ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPD=
IR}/cache,${COREBASE}/scripts,${CCACHE_DIR},${S},${B}"
> +PSEUDO_IGNORE_PATHS .=3D ",${HOME}/.vim,${HOME}/.less"


You can probably make this ${HOME}/. which would match all config files
in $HOME and save us getting a load more of these being requested?

I'd hope nobody is doing builds in a directory starting with "."!

Cheers,

Richard


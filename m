Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8690AC19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 15:28:20 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.13317.1740670096404779208
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 07:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L8+L5/4b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43989226283so7721495e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 07:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740670095; x=1741274895; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tjm1h5FtqELoV78tLKa5+mP0BIyassP0QXFcx3cGcq8=;
        b=L8+L5/4b5FHNVwJtwZDuEMTm4f3QPd5inZJci53qSKtMHUn/z/8RbrKR3d9lKpi1jL
         AQqE33gtvKaGtwExGcxxqoBl1IfznX5Ki43koOin+X6q9OFA9i+x5ZCxL0bPfBfwu7oP
         KLDoNSbGEgV6szb6+/uU4kCxn+m/OadoxIwb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740670095; x=1741274895;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjm1h5FtqELoV78tLKa5+mP0BIyassP0QXFcx3cGcq8=;
        b=pRL2hcMMPMuB8EBcQMwOmwnL+P5qv1vqnc1e0AY83IAKNldyrK67kDqABcv4Lw/4d2
         EbsJKuqIDPc8hyOtqAAIpPH63k9Y2a1J2gAvwa66kP1nKT/xmFg9YRbnp+Xal4erTaEs
         2YuHRfBkYOkjVa/V+M9lshdImFM9qczkA9ND9YTtACWA2G9lGUzWc0mFnSQp9kYLEkFI
         Qtdq3ABg8qgavBMhvSV4KLWusJMtP8onoBDs1ojbI3HuH65rpZs1tOsN6YF5d72v54r1
         GOyzj79qX/ZWINyWgWPWrUbXLiBsNx9LqMf4Cohis5tWZxsi+0Qgti+VyN8+XDJf2jz+
         RmWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdNMIFeULnfAFwoxdEnUyfuE0LYwDiPCLlpw0KQSUs2E7m1yvjZmJpnj/SrQfu/KMpLrUnuhSpZWEForM7f9EyAQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzEmLxEVVZPYSt/bSOG3rmjKqD11D5Q/TiyO796jx4pQ2Xpr2wT
	Ej/JurlNzkyW6Mlx2ivBBjHHUoGPorRjr8MAqYFnYDIRkaTRjfM5quzthrPcOVw=
X-Gm-Gg: ASbGncvuarJfl6eCqznuO14X4is6354cP4CRiZ8VsA87S5Al3w08WnvYm65mjpgnrnv
	36hASgMkIbgFgz1t/wu4GtQ9or/tICt720vkPfj7QsODcJKTY1JXh+3LGMisBH22X2cYN45o78Q
	1myRpI5ASP/BA1984fQtAKnsb5DLX5o+WFOY5Q2qmvnjIS6r6BocRvCNJeIUgyN/7RiSi6C8igS
	zv6JIc/8ZdFvoho9uBHRUpfNGGNNGhahskB0b6QEHkCJd2E89piHd1z0kCG5vuVCl5jxsh/DqjQ
	Qu5QwXcoFLb+c+s1O+xYIxas/EnDyDBNIjZa4g0RxuPNowQ6ZfxHbBeXjVwc8voQR5KnjzisWEq
	iGrzMNYocOgdWe6M=
X-Google-Smtp-Source: AGHT+IECjzmD0+W5iXNvBI3G4CIhtSGIK7MzODTl34vaFDExjdlAaqvtOd9SL7Yt1rwM10O2b5BY8g==
X-Received: by 2002:a05:600c:1396:b0:439:7dfe:f12 with SMTP id 5b1f17b1804b1-439ae1d9704mr241617485e9.5.1740670094740;
        Thu, 27 Feb 2025 07:28:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:af40:c449:3dc9:d155? ([2001:8b0:aba:5f3c:af40:c449:3dc9:d155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5329besm57664685e9.15.2025.02.27.07.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 07:28:14 -0800 (PST)
Message-ID: <11f5d7bcfd74d901e8001e7316244a037ae1860c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section
 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: othacehe@gnu.org, openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Date: Thu, 27 Feb 2025 15:28:13 +0000
In-Reply-To: <20250204103744.27883-1-othacehe@gnu.org>
References: <20250204103744.27883-1-othacehe@gnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 15:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212016

On Tue, 2025-02-04 at 11:37 +0100, Mathieu Othacehe via lists.openembedded.=
org wrote:
>=20
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 1af10b7eb0..468f331fce 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -18,7 +18,7 @@ import shutil
> =C2=A0
> =C2=A0import oe.cachedpath
> =C2=A0
> -def runstrip(arg):
> +def runstrip(arg, keep_sections=3D'', extra_strip_sections=3D''):
> =C2=A0=C2=A0=C2=A0=C2=A0 # Function to strip a single file, called from s=
plit_and_strip_files below
> =C2=A0=C2=A0=C2=A0=C2=A0 # A working 'file' (one which works on the targe=
t architecture)
> =C2=A0=C2=A0=C2=A0=C2=A0 #
> @@ -27,12 +27,7 @@ def runstrip(arg):
> =C2=A0=C2=A0=C2=A0=C2=A0 # 4 - executable
> =C2=A0=C2=A0=C2=A0=C2=A0 # 8 - shared library
> =C2=A0=C2=A0=C2=A0=C2=A0 # 16 - kernel module
> -
> -=C2=A0=C2=A0=C2=A0 if len(arg) =3D=3D 3:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (file, elftype, strip) =3D ar=
g
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extra_strip_sections =3D ''
> -=C2=A0=C2=A0=C2=A0 else:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (file, elftype, strip, extra_=
strip_sections) =3D arg
> +=C2=A0=C2=A0=C2=A0 (file, elftype, strip) =3D arg
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 newmode =3D None
> =C2=A0=C2=A0=C2=A0=C2=A0 if not os.access(file, os.W_OK) or os.access(fil=
e, os.R_OK):

One of the reasons this has stayed as pending was this messy argument
passing, which I appreciate is pre-existing code. I've sent a patch
which cleans it up a bit and this patch will need rebasing on top of
it. That should at least make things cleaner.

I'm still a bit unsure what to do with the stripping changes this patch
makes. One concern I worry about is having "magic" options users need
to know to set. The other is whether there is really a binutils type
bug underlying this and that there really should be a fix made
somewhere else. I don't know enough about the issue to be sure whether
there is an underlying issue though...

Cheers,

Richard



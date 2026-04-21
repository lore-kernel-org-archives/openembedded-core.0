Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BF1F327DB
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 11:42:04 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24867.1776771721235180051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 04:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iSUBHJAw;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d7645adbdso2279933f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 04:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776771720; x=1777376520; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi9SZNsbQof1VYOGjyL04dLjRR7h31CV1CSWOEJoUI0=;
        b=iSUBHJAwqyY3YdaHuFXomPsX4ar/tb0Mplie9ySj7snGKZ02AT9+NEyPNxkXvCX7Zn
         F8+PUf2eufSiPkAS8DmTMQ4F9CHFsda2VcGMtepnMaS2yTonf/EylLXSJXhjnHHFUTYg
         AmG1Ct6+yHRdJXyvQDhrkUJ7wV8CtvzeBzfS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776771720; x=1777376520;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yi9SZNsbQof1VYOGjyL04dLjRR7h31CV1CSWOEJoUI0=;
        b=gan9QIewO5DS4/IsThdBebPdIyS48mV2+EKWzWizTkOp+MAZuL1VXiABVsT/rI+aoY
         98m/LiSF0Bo56CwHyYzYPmROK03SKRqC87571Oy1EvjR8LHCSkXobGJw2oHesII4wsKS
         WyNairngZlkyzwlIZjXW11hmB4UPCXONpVs+Te6Ny7kaqvF+FB4E1XVWPhpjDIGN9Kvb
         BOl5QVdsQvWaT2JAUMNkb9CPXjMvbbmobZ4B3/1EKjlldzpkAbYgNYY9m9cMA0pUEpQq
         ZsORfayZXQe2EVTjCNNJNo3Q8rZqEQpqUT/JmQ0zxK3W7I8cS1naT/TcACbpaL1R7n1s
         eYJQ==
X-Forwarded-Encrypted: i=1; AFNElJ95ML+nFxRNvf2SwlGY6EyDHJPbAnf+AV/V/xn5CN+RJgPpZv/8lYeJEsKjJO6+RDHa4huF70tpxqN9S9dmnGOr1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzgldUgIxZcwJLu/qDxspUXZ5yTOed2clprqUMQfRkrgXmurlkt
	EG+K1lRunLpcxTxm1NhkCqt0veq8CUQRyinRTVqM1c7HDLd1ctkGvvIqNOn/cOY66UY=
X-Gm-Gg: AeBDieuBlcho4X84rUB675lWjpVagJ14tQG1s6X1UpORLalSuPSa0edl9qRsLvirx8T
	0tyx+9yRCDVqZgW4jFAtUZFve+/25lbl+P5RQIiCmmLpkhhMF75PJrotuI/wvWD1a6cltm5tV0/
	aFMUDcKGmXk5RYfT+cZSbuabrDwSTf6ldT4QUuLnLw5FFpfyPOMzIbzPeD4iy6pacfg1qb2OK4q
	kAbY2SbXRzhrNDD5qCPhTuB7W+Am1MY/zO8kjVtaZvS5usro3WJefxiL6QI7osXYVZlN0tCexzP
	5dNeCGx/RPxlA06J2iHkyfPohstE8cJ9bDmZMhNLVR+LVZCUEdSiqG/VlW1A9X35YzXt+Ngq5/e
	nZ+E2tybhomT5eeer8+DCvseChpqb7GWI9qAp389RoBcN4s3aAAzwJr2H7jJZF2WsmwNMgeQbny
	cucYe1GP0o/8Bebrhl4eV23tNmIFujRvgmJz2nNv8kx4/Zv6O8Qc32EykO5UBz7zMWaEha36BXY
	q9qch/3d42Fw2hu50OHlg==
X-Received: by 2002:a05:6000:1a8c:b0:43e:b0f8:66f1 with SMTP id ffacd0b85a97d-43fe3e0b86emr26855011f8f.43.1776771719571;
        Tue, 21 Apr 2026 04:41:59 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a166sm36083548f8f.19.2026.04.21.04.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 04:41:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 13:41:59 +0200
Message-Id: <DHYT0BFAQ60N.1D1DQU2X0D05W@smile.fr>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] pseudo: Update to 1.7.4
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260421104147.1994119-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260421104147.1994119-1-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 11:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235672

On Tue Apr 21, 2026 at 12:41 PM CEST, Richard Purdie via lists.openembedded=
.org wrote:
> Update to pull in a full openat2 wrapper which works on Fedora 44.
>
> This update includes the commits:
>   * Makefile.in: Bump version to 1.9.4
>   * test: Add renameat2 test cases
>   * test: Add openat2 test cases
>   * makewrappers/openat2: Add preserve_path option
>   * openat2: Implement openat2 wrapper
>   * ports/linux/guts/renameat2.c: Add comment why this isn't implemented
>   * Add b4 configuration
>   * pseudo_setupenvp: Handle malloc failure safely
>   * pseudo_setupenvp: Allocate space for new env vars if needed
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

There is a typo in the commit title : 1.7.4 -> 1.9.4

>  meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
> index 4d316299033..68b311cb916 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk =3D " \
>      file://older-glibc-symbols.patch"
>  SRC_URI[prebuilt.sha256sum] =3D "ed9f456856e9d86359f169f46a70ad7be4190d6=
040282b84c8d97b99072485aa"
> =20
> -SRCREV =3D "56e1f8df4761da60e41812fc32b1de797d1765e9"
> -PV =3D "1.9.3+git"
> +SRCREV =3D "6c0d8c6b81ca7c2ef2b5a9a996605e1a51814442"
> +PV =3D "1.9.4"
> =20
>  # largefile and 64bit time_t support adds these macros via compiler flag=
s globally
>  # remove them for pseudo since pseudo intercepts some of the functions w=
hich will be


--=20
Yoann Congal
Smile ECS



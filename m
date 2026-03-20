Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D52A1093183
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 07:49:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7526.1773992982095603657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 00:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CIq9USsM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso14840885e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773992980; x=1774597780; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k1K/hvOI2XT9hThCa1Qgya00+Tcn4kbWWLrMSgrbGIY=;
        b=CIq9USsMFBQ/k1rmUO7OkfDcjudQS+COYSHfESlDwG208VQyJxZmQHze5SsfhLEHo7
         evFwlJgf8zwPAB0nrJ+sC5taS3VsiamQiMNHbZNj6snapV2b3a1+nJ3B8zYFZLyfvtu1
         ZWBppUbY6iVndKRdjj/umI/GfwUT51bxM60ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773992980; x=1774597780;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1K/hvOI2XT9hThCa1Qgya00+Tcn4kbWWLrMSgrbGIY=;
        b=BX2tWb5XG36Fo2wmBiGOruAdLyELXAPfmlGCVnkwjLv3+G80Yt0R7vntdNU2UYKhh4
         t6l0Zi79oPoM41lQdWo46K+rzlqroCc5MaGj5iJ9M/ED4g5R/NmOL9fEUm1JwuDsZ2M/
         raYIr+0ZA/xRWCXI78DnemkJ2daEZ58YsCyRiEKPOdnlswJLtJbjyBM8QNvGZjEhDxFO
         d1oDHwP3PzUc3bhb6C2ZReVn3o9ym6YXYYksV3gDYtcPU10AlbuclizH37Zj7wuBdjqf
         I/KfDNUbuHX9SGfJXyKFeziyY//I9RAlk2QwTr20jF34BSFhcD2jYfRBsLa702nmwFNI
         9pgQ==
X-Gm-Message-State: AOJu0YxcVBCLJV5hUFuKDMKg3ly96qT6qbCgMAaYCX+QV1+0gzjYdaGY
	yid8VKs2UORxRuw0Tr5zWF+jiZBPHIfBvM8s3ycMWNTZfecHWyRy3JE2uA1218gVUzI=
X-Gm-Gg: ATEYQzwIO03DasvaB/X1+hdhJX1RItlV4cibgfCrB4U4LAK0Gcmgw0aLEKjRXV05WpF
	Gb9AuBEsc5jFyHvyP4P0M0VPZe1Ojal3/YzvUBF9wnNvD0138ntqQt3ZZ7kYlg5wd9emN7NcLLY
	PWaWRgq+pytrnGhbnpRj52hNO4xRUdt+z8iUtTL68aFncbPGxmd16XnQYLPfYg/XYrv1YICLUlZ
	xGsKVgstMEws3cjp9Zfxa3p7GtxERyWdqvnc62KPSlISDo11urmzcIBy/RlI35n57tsycCni19r
	0cVVfqoqxmE4MbVmhq/nleTTMvyTpdR5YmIRkIyDtyx2O9AgEnHWx9NzSkLsj5b0Ym+CPOAvLwr
	egI8ZeyvyGssgH5tYgrHgn7Vz4HbGh5EqIVOX7T92RAaG/XLTMX0HPG/E5EOh0bJWySRveJq5Hv
	3sme/gaySrJnfN5v6zNQa183d9iW+LlfTE0ZNPt/2heMVsxhrgeft5QZPc8GjZXMpPNIwLZt5AN
	mW0O1El8xfHdvEL
X-Received: by 2002:a05:600c:310d:b0:485:3b00:f93b with SMTP id 5b1f17b1804b1-486ff03db6fmr26782685e9.31.1773992980217;
        Fri, 20 Mar 2026 00:49:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:72df:cb96:568c:f7d8? ([2001:8b0:aba:5f3c:72df:cb96:568c:f7d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe85ed6asm12593225e9.1.2026.03.20.00.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:49:38 -0700 (PDT)
Message-ID: <220d88e1be8b340913eeb0bd748b862d72517457.camel@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] packagegroup-core-tools-profile: add
 lttng-modules to LTTNGTOOLS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2026 07:49:37 +0000
In-Reply-To: <20260318101025.2718647-3-kai.kang@windriver.com>
References: <20260318101025.2718647-1-kai.kang@windriver.com>
	 <20260318101025.2718647-3-kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 07:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233583

On Wed, 2026-03-18 at 18:10 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> It has removed lttng-modules from lttng-tools's RRECOMMENDS, so add
> lttng-modules to LTTNGTOOLS in packagegroup-core-tools-profile.bb to
> make its dependent packages unchanged.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> =C2=A0.../packagegroups/packagegroup-core-tools-profile.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2
> +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-
> profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-
> profile.bb
> index 9c09f5ab44..42c15772a0 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-
> profile.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-
> profile.bb
> @@ -31,7 +31,7 @@ SYSTEMTAP:libc-musl =3D ""
> =C2=A0SYSTEMTAP:nios2 =3D ""
> =C2=A0SYSTEMTAP:riscv32 =3D ""
> =C2=A0
> -LTTNGTOOLS =3D "lttng-tools"
> +LTTNGTOOLS =3D "lttng-tools lttng-modules"
> =C2=A0LTTNGTOOLS:arc =3D ""
> =C2=A0LTTNGTOOLS:riscv32 =3D ""

We probably need a:

LTTNGTOOLS:riscv64 =3D "lttng-tools"

here since LLTNGMODULES in the other file doesn't support riscv64.

Cheers,

Richard


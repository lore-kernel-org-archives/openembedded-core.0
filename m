Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEE3CD4F3E
	for <webhook@archiver.kernel.org>; Sun, 16 Nov 2025 16:27:26 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11074.1763310443281842161
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 08:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ee5rSuOx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so10440125e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 08:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1763310442; x=1763915242; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoqdtsGrUv0sOvyopgSNz292N/a8qYx5VnfOmGFr1g4=;
        b=Ee5rSuOxbDLkT0xaksxXR5r102YBfYBt7j0TIwXnwtIWPJr0gSLSr524b+hiYfQclv
         10SIZUW2nBKZfkAzeCBlWtRALLANxqAKqXVPXWblO1OssnfCnkcGE04xrSG6kXS31TRN
         Sn8xFBrRB7JIhm9UEueHt2zK1kOKv8rtFfY5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763310442; x=1763915242;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eoqdtsGrUv0sOvyopgSNz292N/a8qYx5VnfOmGFr1g4=;
        b=R7zsz5bq3nD0ctJ+2HPe5tqbgUftIePtiI6QXCsn1Rjs8onJQdhG5VekxdGS/LywNn
         2g17XVY8U0mHWkXatbwnwiBFFEvpSnNAtTHlcJEmg2vKBOFr4O3UCyvVzK8kS7xuOVzF
         IcEx0zLRE085oKg6e9Gq2Vf/1GQCQ7iNqfxNSTG6bj0t3sUR1Ms8YbOKQ9PkQ7+GN+hY
         ajcPS9t8NkCJLYFJK2l+lfwozGu2Retj04ngI673Yn/BYis8ScxIfxM26/OwkeoPwkf8
         233EapzKukaT2wPsylmDlhVnqhMBfVuPC3K5LuXEyh0r7u1vgi++iwT77G3Q984gomOK
         5JYg==
X-Forwarded-Encrypted: i=1; AJvYcCWfN9r3PZZVySd+PW+hMdcXERdUiUpY8uz8FJjcvh7I58zzRBfZw372Z/B6qr9SJBsPktFVwTaa9fNShiMTCKV7Ig==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz1VbleQcZbA1aLbtlPSXe0u76pvVZoe8/SyQuQmodLp3PcNlqn
	8sBt3EOJDDKdk8ltoTLOfz/6fI9K80Pi+oB9b1iwbnMW0D25byL6gz9YBX5V2S+jhzw=
X-Gm-Gg: ASbGncsjEPVrjLaoerS+eQcLo3Suw/PfRvImoUqkpSbReIt3nGyW/Ga8jIhKwpsmNh9
	gusdJLNEJBYJE7GUO8DOzfg9nbFAfmKyxlQlgPMuEkO/Tn/d/58Aw9tnUtrF125XxGChHxRmn5+
	DtNBN7h3WGEQ9MRcEfDJlC6Nmwnw58RVr74owJuUBE1BxxEtfTCLCmcdTOyJ+d8VxDIRayalRJ3
	tSwnX/gLsLt6+gwxdpKsGX/08WgFLNo0cDGvZ2kVGi2p3H/mNYmN14VR7QCDCZcMSXaeO2ZTK7q
	+CERXK0Yr6hwZ54jU9+K3ClEQzUwLm8vh4pEOXdNrIs5SWVmQiawsSX4H2hQVHyoNiElOJuZztP
	tK87RUuiPhQDZTEIXqdG/iQ3hYlwHf5al1i9kpAPy9VyXT/aHQzyq2e9OePWKZireaMIDSE1LRT
	KPKk+ZpeMr4XxJyLY2MtZofuPKjkH1QhrKvuryJ6Tj6p2kG1iAavxnYhc6hH9c8OqHAcCaaK4pp
	sA=
X-Google-Smtp-Source: AGHT+IFe21Xr176WEQlo+lK0/PFkx9wD0Wuh7UqUu4PzsEYWvj963uVcRDgnu6xt4yhqvCiolosjww==
X-Received: by 2002:a05:600c:6287:b0:477:7b16:5fa6 with SMTP id 5b1f17b1804b1-4778fe604e6mr85246965e9.3.1763310441677;
        Sun, 16 Nov 2025 08:27:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e709:ebbb:d3ce:b049? ([2001:8b0:aba:5f3c:e709:ebbb:d3ce:b049])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47798dd2e8fsm39751655e9.7.2025.11.16.08.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 08:27:20 -0800 (PST)
Message-ID: <87cfd519da6bba9636c4f2d0806916fb15179b8d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] buildhistory.bbclass: Warn when
 PRSERV_HOST is not enabled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
Date: Sun, 16 Nov 2025 16:27:19 +0000
In-Reply-To: <0468feeac5c3c42078b6cf9085f7707de5f09cc9.1763295498.git.liezhi.yang@windriver.com>
References: <cover.1763295498.git.liezhi.yang@windriver.com>
	 <0468feeac5c3c42078b6cf9085f7707de5f09cc9.1763295498.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 16:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226475

On Sun, 2025-11-16 at 04:18 -0800, Robert Yang via lists.openembedded.org w=
rote:
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> The version-going-backwards check may fail without PRServer, and it's not=
 easy
> to debug, so warn for that.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> =C2=A0meta/classes/buildhistory.bbclass | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistor=
y.bbclass
> index 4a380c10c6..859fded472 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -57,6 +57,11 @@ BUILDHISTORY_PRESERVE =3D "latest latest_srcrev sysroo=
t"
> =C2=A0PATCH_GIT_USER_EMAIL ?=3D "buildhistory@oe"
> =C2=A0PATCH_GIT_USER_NAME ?=3D "OpenEmbedded"
> =C2=A0
> +python() {
> +=C2=A0=C2=A0=C2=A0 if not d.getVar('PRSERV_HOST'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn('PRServer is not enab=
led, version-going-backwards check may fail!')
> +}
> +


Shouldn't this be conditional on that test being enabled?

Cheers,

Richard


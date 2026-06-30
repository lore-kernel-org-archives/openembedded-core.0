Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A542C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:19:13 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21230.1782825546787223018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 06:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pOXvCNHH;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-461edb387ddso4393210f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782825545; x=1783430345; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7F/TzUBr7XbEg00nYC8+I+9tfdc8zgMRgOLMt9Px8o=;
        b=pOXvCNHHQ9ElYNSJV01arg2usBrDLTjXT45pHXz6Hw+imLbzTSb4nkrtAVYpAMh5WU
         ozCRNvh6FEtMLYGigtFPd8icDyxsfw9WeAThNtMMuscvoTB3C2YuNj/MAKOM4Ln3h1bQ
         pn/KPckLB2juVnPWJJD5DUu/6VyWazfc/kYrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782825545; x=1783430345;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+7F/TzUBr7XbEg00nYC8+I+9tfdc8zgMRgOLMt9Px8o=;
        b=I5FYCXpZ+Q6ArSPCNR1SAQ87Ztnny7Y3tTaSXW+DBaYEDUtUriQQ2b5Ltg+IHBBrM9
         ejCjbdz1VGMb/rkhrxZbxtDsZ8N2I7+tPMzZwxVVjcICnEoWdZpiLNbckBlfGwfIC35X
         IctNJeQ/Ku8vhItKDPcUDIwNZrZHodEW9XRbE7+nbNNHMNws/D2UbJzEA7hPooxq23p8
         hNLR3RMFiLA8bfJ0lp0ivNAbBu+m00dPaO7aSQ6MJ1tp/fdOmri9JNKNjrX0eirNIWNc
         OBlK7K0MeejE6a5WhVNOXaOiTviuj4ItlaO1vgabonwdTg1AwfQ40/Lt+vx6DE2S5s3o
         Y2zw==
X-Forwarded-Encrypted: i=1; AHgh+Rqf+QB/k511VXnQ7VhKKRDbF4bKmuVwCmK7tkJQb94uQLn5ZNSoVcYw85Z1muRvqeMCToSoz826V1bgJezC/I0X7w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKgb40LUyb+qeEY3Z8NABsKDoppawp5X7K1tCNU55ToZNZJHLt
	dJrXmyqEuVKWONfCJbJouAay9JBteMgHtkTQ3DvcaVgWrdSCxjqZkKDnmCvJ30DVzLI=
X-Gm-Gg: AfdE7cm3sD+29NWXiEhFQqytYjw1ytwpEDkPN3c85vUMLjzLq0gqXGeOdkFDEih0riW
	fXOtmOEmEWUYb1bB/0lQAuof7LSOmp6KDPRtE9tX/WeAxT1sTBFgr9MD82jm/luNqiA1NzyvlZ+
	QJs6zvmRZ+064Jcgf2e8YvNAfbHz6jB5XgV99a3Vjug5dhlBrWJrARtwfUWj+MBmRdLJl9gCaGQ
	iQ3ESHzDt+gAQzpzArK/T0ED8WqAvISH3U3+dHkiR8nb8LdYNcL/64ctCZHx4dnPdH/YDfkp5Nx
	T6nbzUHBg9QtNRW48wl5HqRYjoDPIJr59YBlhJxRW4uAieWlcEcOzBI53/catNU7ytdAhfdAvuk
	qSEc5HF5wiCUIYodqNUtebOdDClo4ZjI2E4YfVYO8sRj34iLQ/zTTJQPJ6kdMj3jwZKm9f95RxT
	ic4bWFzs7VdcK7sZ+mg1nWhwsu+Dd1JbZq8S/EC6WF1iFi3UAouXiirpzLhJPimsczzeG227zo/
	QOG/A==
X-Received: by 2002:a05:6000:2893:b0:44a:be4:d0e4 with SMTP id ffacd0b85a97d-475524a86aemr4926712f8f.25.1782825544706;
        Tue, 30 Jun 2026 06:19:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa0041d7d5fc68d4e77b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:41d7:d5fc:68d4:e77b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475641e4618sm7615653f8f.9.2026.06.30.06.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:19:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 15:19:04 +0200
Message-Id: <DJMEWS9R1XRF.1VEP9G7EHB1S6@smile.fr>
To: <roland.kovacs@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH 1/2] gnupg: Upgrade 2.5.17 -> 2.5.20
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260630130358.71091-1-roland.kovacs@est.tech>
 <20260630130358.71091-2-roland.kovacs@est.tech>
In-Reply-To: <20260630130358.71091-2-roland.kovacs@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 13:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239895

On Tue Jun 30, 2026 at 3:03 PM CEST, Roland Kov=C3=A1cs via lists.openembed=
ded.org wrote:
> Bug fixes included in this release:
>    - gpg: Fix wrong assertion failure which could very rarely occur
>      during key signature checking.  [rG693f5642f6]
>    - gpg: Consider certify-only keys for revocation signature check.
>      [T8196]
>    - gpgsm: Fix possible double free in the CMS parser.  [T8240]
>    - gpgsm: Fix possible too early removal of ephemeral keys.  [T8236]
>    - gpgsm: Avoid emitting a final FAILURE status line if --status-fd
>      is not used.  [rG69c27fe377]
>    - gpgsm: Fix a regression in 2.5.19 for password encrypted GCM
>      data.  [rG60a823c97b]
>    - agent: Fix not using cache for pinentry loopback.  [rGd4b608a31f]
>    - agent: Fix command PUT_SECRET by saving input line.  [rG1875bc185e]
>    - keyboxd: Mark keys searched but not imported via LDAP correctly
>      as ephemeral.  [T8048]
>    - scdaemon: Avoid buffer overflow with SC-HSM cards providing RSA
>      keys > 2k.  [T8244]
>    - dirmngr: Fix uninitialized use of the dns_any union in
>      dns_rr_cmp.  [T8251]
>  Release-info: https://dev.gnupg.org/T7997
>
> Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>

Sorry but that URL also contains:
| New and extended features:
|  gpgsm: Implement GCM encryption. Note that decryption works since
|         version 2.3.2. [T3979]
|  gpgsm: New option --attribute and server command SETATTR to include
|         arbitrary signed or unsigned attributes into a signature.
|         Enabled only with libksba 1.7.0 or later. [T4537]
|  gpgsm: Introduce system attribute _signingCertificateV2. [rG0335a9cb04]
... which are new features, and thus, that upgrade is not acceptable for
stable branches.

> ---
>  .../recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb} | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta/recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb}=
 (95%)
>
> diff --git a/meta/recipes-support/gnupg/gnupg_2.5.17.bb b/meta/recipes-su=
pport/gnupg/gnupg_2.5.20.bb
> similarity index 95%
> rename from meta/recipes-support/gnupg/gnupg_2.5.17.bb
> rename to meta/recipes-support/gnupg/gnupg_2.5.20.bb
> index fd6588769c..a1a50e2384 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.5.17.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.5.20.bb
> @@ -16,6 +16,7 @@ inherit autotools gettext texinfo pkgconfig upstream-ve=
rsion-is-even
>  require drop-unknown-suffix.inc
> =20
>  UPSTREAM_CHECK_URI =3D "https://gnupg.org/ftp/gcrypt/gnupg/"
> +SRCREV =3D "343d0cb8910441aa44c56ce8673a78e137040c87"
>  SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://0002-use-pkgconfig-instead-of-npth-config.patch \
>             file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
> @@ -24,7 +25,7 @@ SRC_URI:append:class-native =3D " file://0001-configure=
.ac-use-a-custom-value-for-
>                                  file://relocate.patch"
>  SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
> =20
> -SRC_URI[sha256sum] =3D "2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4=
af4bc3a10888685d"
> +SRC_URI[sha256sum] =3D "6461266e99c308419a379abe6c356d54c214136c4589bd65=
951091138989ffc6"
> =20
>  EXTRA_OECONF =3D "--disable-ldap \
>  		--disable-ccid-driver \


--=20
Yoann Congal
Smile ECS



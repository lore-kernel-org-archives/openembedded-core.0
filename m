Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066E0FF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 08:04:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6506.1777449836195241496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 01:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WUuu0NMu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4480f9b5efbso242103f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 01:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777449834; x=1778054634; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xS9ClFpFsGrb4+aCr47UDvo1BJEA/Iy2hYBQecM4y+c=;
        b=WUuu0NMuBaAMM6XI37M/rphMHYHtVcrq/7AdMgRI98b6GJsLihFXsjWrb0SADf69R/
         Nty8C8VwzyJeXD4zEkMdv+LNi/Tr5moChiJ77tqU3CEqxpCp/8hqLwq1hvY6rn3w8SYu
         mUnaymzP6jO0gSS91MXiDSgH2nX93ptTWmZ+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449834; x=1778054634;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xS9ClFpFsGrb4+aCr47UDvo1BJEA/Iy2hYBQecM4y+c=;
        b=jVYSEWqkvEbjcb2YckDh0FTZN7eDBnwt0k9gxnxkJ3nziDbayvVJycBBSnJA67mlUM
         Ckiuk5BW4c9QL32iZtMU8Mn8ws5HwWGqIkVeayJBzB3NPq/v+pHQlT2KRZ512tzqQsgO
         Ey2MhzHSsb0ynqjefuLUB7ZZDfpd5D5NAcr5SHp23tPrfrctnsYFXfYfqk54IsN9ZjyZ
         tlSvlOCkZUOIvv/VCFD1SfRIxysJ1uk/KmUDT8RHPB9zfZHLid/qkpv5YFSriiDEwsvt
         dA8iAhhZupe/vZU4R0i0si3plXBxO6wCr8f8skQTWc5vZALLbNWzBmPfyhan/VbekWWw
         R8KA==
X-Forwarded-Encrypted: i=1; AFNElJ9pfrxX7d3sv/7Y9FgMpicj0Vqvfs6L2fyAWUxZsyL85kPyUn7gJbAabTkwg40JSYOfU/KgmoMw9/0vBI+NwIE/XA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwEPnIBRLyXPIufL7/f4rI4egrmtjuPAdsb8LnOaAddNQHc4Ts5
	sRaWvcu7QbhrEQUwfWedtqu6IH8UKc/WRwvgp7W10W6PGbG4pElyr44yXwNEZ45OERI=
X-Gm-Gg: AeBDievH0MfH4V3J6OPMSoCc9JRerKfyYT6yR6wF3ZhFYO6t9NqjIKzHTixGc58QlaP
	qONF/yZdQbZnqJPKNZthx61bPELxR/MqBfZR7idm5JekRZg6OEGmJcg0AsyrB3LBHcpN3A8GVlw
	5uSlczFsZvY7V32JiAwk7wt3ZSTbDrmcV6Gyfhr2p+jSqc2PgAfnIxGKlYWB9JLXAiUfR/TwtCS
	yg3HxTHDZL4eMp9jSaV3z1fo92/rXYv7AYk0MwZ4hbxx0Bp+CNvJeC0uo04jejx+Wyoz8K6845C
	dSzxitYyhM4phCu0dTxmbZmxEs1r2Yg8oUCLGwJqCr79E86qzLNuFwibfQWFsXOSuRmqV2dYabS
	3isTlbJWi25yJFYjUUtf5X+wwPvoNxhx3JLzMbEqOJTmxGbcka0u9ueG5cqD75ohyyYbC5yzIob
	kkLNJLb/VUGPe4g26B8M6nNyIy5r9aU+XZbNztl/Q/C+9vgSeNKuvZa70pHiOoslVfl/Io8HMiQ
	sNZG1HUpa7+ipZ1HaHKcpEg5tU2ILi+TrTPgA==
X-Received: by 2002:a5d:64e9:0:b0:43d:7c6c:a0dd with SMTP id ffacd0b85a97d-44790a3274bmr4688451f8f.35.1777449834291;
        Wed, 29 Apr 2026 01:03:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9fbc:9565:c749:f838? ([2001:8b0:aba:5f3c:9fbc:9565:c749:f838])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d4843bsm3962779f8f.7.2026.04.29.01.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:03:53 -0700 (PDT)
Message-ID: <516fab60f06521e2335185dc20d8b8c1d1330730.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] u-boot: Fix u-boot-tools-native build after
 DTC update
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: festevam@gmail.com, openembedded-core@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com, marek.vasut@mailbox.org
Date: Wed, 29 Apr 2026 09:03:52 +0100
In-Reply-To: <20260429001811.2723886-1-festevam@gmail.com>
References: <20260429001811.2723886-1-festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 08:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236084

On Tue, 2026-04-28 at 21:18 -0300, Fabio Estevam via lists.openembedded.org=
 wrote:
> From: Marek Vasut <marek.vasut@mailbox.org>
>=20
> Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
> build will surely not find host /usr/include/yaml.h file and
> will disable yamltree build. For details, see U-Boot commit
> 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot").
>=20
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> =C2=A0meta/recipes-bsp/u-boot/u-boot-tools.inc | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/=
u-boot/u-boot-tools.inc
> index a055409c2cb0..071746b64e24 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
> @@ -1,5 +1,5 @@
> =C2=A0SUMMARY =3D "U-Boot bootloader tools"
> -DEPENDS +=3D "gnutls openssl util-linux swig-native libyaml-native"
> +DEPENDS +=3D "gnutls openssl util-linux swig-native"
> =C2=A0
> =C2=A0inherit python3native
> =C2=A0export STAGING_INCDIR =3D "${STAGING_INCDIR_NATIVE}"
> @@ -88,3 +88,8 @@ RDEPENDS:${PN}:class-native =3D ""
> =C2=A0
> =C2=A0BBCLASSEXTEND =3D "native nativesdk"
> =C2=A0
> +# Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
> +# build will surely not find host /usr/include/yaml.h file and
> +# will disable yamltree build. For details, see U-Boot commit
> +# 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot")
> +PKG_CONFIG_SYSROOT_DIR:prepend =3D "/invalid/"

This feels a bit like a hack. Is there not a config option we can pass
to u-boot to make this deterministic, i.e. always disable libyaml?

Cheers,

Richard


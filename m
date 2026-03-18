Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F37810775F9
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:22:47 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19947.1773854562426697016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IVM6GWDP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b4915161fso20152f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 10:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773854560; x=1774459360; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3UwZs6XicQ7VlcNkmxxswop3ZtKnKur8VA2xCnXHTI=;
        b=IVM6GWDP3HnJM9Zvy3us5dUUKe0MVuZqRiZjU+ucAeyHodLHs4K1BxX5MKmx2YwkNh
         l817V4BTis98yxKlhlRfC55oDyamntEWANewQDFqHZPGtmT6SpuGWHi4u3NJXfTrZ9sv
         6XSNnjdF30VUBMMtANF5wVCxFNMSW4EN4Ct7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773854560; x=1774459360;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3UwZs6XicQ7VlcNkmxxswop3ZtKnKur8VA2xCnXHTI=;
        b=W+avIGIo1jSTdveVYzqtmAEVjYIWSNnIyw1SbgO+OdG/8GbyB+7fZQad5KznINPJGg
         U5otMUNXN+Oa6xNTjJ7+IyeMkOTvtqB+J4i9TfEpRhC+NYptbUZcIQ37Hfj2uO/SsrXE
         cQgpEJoV6AR/mW1RxwmzdWriJCIm4G+AZnUitd8Vnf0STH5ztLyfafAXWVYdaMeIjSVr
         5V3ZO0xRxPQS1xR6OAM1zmpbj8k0nZeQ49jjjn1MC0vci6BASNCRsgljuT95SxQ7Uc0N
         2JyWWlnjgjTDEXIDZ74S5Lpjr9hxRrJrLhG11VV4o+Z5wTj+DKybWCz+U/0HaVkqI1jw
         SQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLnbbjvs6mw4EaZnXNnXiqawzOe0OwpHL1sqolxksqq07QQhhSKQcjiUT0BMbuE+Zo0tc6hF1CXOomXyG7F+Twug==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6OfYsq2GUCg+KtpmrDxOzIo+QVxt1915qf7iCwuxlJTOOjI7l
	5Yc/0GLhoUeO2livrWLJoDDz3CG9r5/4UfMcMPu8LurUpoc61xcNRf89WRgauQgmUJ8=
X-Gm-Gg: ATEYQzwqoT/OH5pvUmBzbJOj7yELpQE6jjQnOmsF4QyqK3bpfr/UGtOUli/jH1Asw7+
	kUJeg1snTWiRrrZatMGWt7krZhqXLEh6UZ4+bWOc3wLPj7VgrxjFcJn4pyK+eXWh87MtSLzAUSS
	6PKJaLZ8wgR99JvMRLNogOVRJY+ecFCK9NnfGvEj8bvzcvw3oGqwqnXlDFgws1OedoT/0sTQZAx
	yYCxKqR3Sg6QZ1GqX9Xpyx6KaRlcDwxpkdAhkWNUb+edFVUARSNvRA82VqdugSrlhv9C3cdrxdg
	V20aLy6+l4PQSKMIHhqZ1LahKzs53E61YzlqNGqdYVd6Xa/Rhfu9DHRGgLq4+zbRqTVgX/raeoX
	FsSdXWqD+Y0fkln0BWLtNgfNIA7nyauF5IvgHBJV/NzdidrsQKErvhJskksNzoTEiUBb5JMUFtQ
	6UcgxszcfxCOfbuvQw7uG8vgmC58sK59ad5ByyUuCYuQ5ilGUu3Hf3GD1ZsEPdNEMDW8K1IxArb
	ZNNAgDzjRQHMhg=
X-Received: by 2002:a05:6000:2509:b0:43b:436d:77f6 with SMTP id ffacd0b85a97d-43b527c8f48mr7061605f8f.37.1773854560477;
        Wed, 18 Mar 2026 10:22:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c5d8:efeb:ae8c:c686? ([2001:8b0:aba:5f3c:c5d8:efeb:ae8c:c686])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518986fcsm8630231f8f.26.2026.03.18.10.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:22:39 -0700 (PDT)
Message-ID: <b29e8565403d5666a6b17df55379c143cf22932b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 08/12] initscripts: Make SRC_URI arch
 independent
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: paul@pbarker.dev, openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2026 17:22:39 +0000
In-Reply-To: <20260318-fix-checklayer-2-v1-8-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
	 <20260318-fix-checklayer-2-v1-8-388ba6ce47cd@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233431

On Wed, 2026-03-18 at 17:14 +0000, Paul Barker via lists.openembedded.org w=
rote:
> Avoid making SRC_URI unnecessarily dependent on the target architecture.
>=20
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
> =C2=A0meta/recipes-core/initscripts/initscripts_1.0.bb | 4 +---
> =C2=A01 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/reci=
pes-core/initscripts/initscripts_1.0.bb
> index c984257c5c8f..23411b6a7149 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -32,14 +32,12 @@ SRC_URI =3D "file://functions=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/save-rtc.sh=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/dmesg.sh=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/logrotate-dmesg.conf=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://alig=
nment.sh=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.=
utils.contains('DISTRO_FEATURES','selinux','file://sushell','',d)}=C2=A0\
> =C2=A0"
> =C2=A0
> =C2=A0S =3D "${UNPACKDIR}"
> =C2=A0
> -SRC_URI:append:arm =3D " file://alignment.sh"
> -SRC_URI:append:armeb =3D " file://alignment.sh"
> -
>=20


alignment.sh is pointless outside of arm. The commit message needs to
mention that the installation of it is still conditional on the arm
arch.

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD41109B474
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 14:12:32 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21043.1774966348838766926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 07:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XFhWAqKO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso1628991f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774966347; x=1775571147; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eyfX2JxXN7EKJJfubhAcPCoI1iV/SNKnL+74aTY7T7Q=;
        b=XFhWAqKOSVjC3T6J+2IAkkCCWcioIhfGwvHjHK810mgSkGB4B0IFyqxhFnG48U04al
         Y/MoRT7+lUL7y1qjNk74Z1TSYqZ9WPRlQ6oOPrktIaE/UeKqVyS3HzIa2V5cNEfgofuK
         n36PSpCilTNQIrdbbUXVvmE6nETx8s74IAbUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774966347; x=1775571147;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eyfX2JxXN7EKJJfubhAcPCoI1iV/SNKnL+74aTY7T7Q=;
        b=NuCgcj8COocQ+KWQMuSRcPCfjc4kPZcCSqhqzzhFUOgkiW6KppLj339LTwiWC/GV8b
         Vl5CaQC6bc2vVJ+pQ8CJaW/JHtpNLdBXlz5tmtCNCf7/Re5mDaSD1jy1qItV6dJ1W4QV
         jFj4xpuL534ZeHlO5FxkWdrgPF1iM8iKrLCat4HEu/e9IWHSa4XEK/QTQdtMapWLp1Fk
         E+7fZwuisl4yMTI4zFUoTerIPPSE4We8xXRi4RJqWMeLheUvurXecyALknY9CAf5k3cC
         z+XuIS870/jJmAUH5cAQp+BFQclDpsRshYOIhJXI6ZMJEIwaAzeHO+z+bQtE6KkHvKds
         SMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb/OjvGHz9tYwc+3x1T02F7sABqZgtTyta8N0Lso+NJKNJQarSy7OFLBkCUUPNMBtIRuP3lraf+7HSOBYRpN10Bg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1h2UOcqsgBY1xn03lacg8KbhOAjJ+mP2iS49Kv0bBy5Bnz8hw
	dElre5AzCS0stiR99cQGNrLUI7RwwTlPjjFPGFPdEtxH05y6W5MLjoOTPFqEzWLzmmI=
X-Gm-Gg: ATEYQzwsFWDxcTTopB7QVY9k1pRd0Bf31dPP4HXK+gEa135DXuygRxrPGP4hT4XbxUC
	oEXFa2BGdrXb4TiIBp1eZMp8BBcX4/Y8AXQxhCRECCj8EEDfn/h8ID8EXf5zddR+i4D1ZD3emh4
	4QKVSoQDkuVaoaWpbIon8spr+5MoqeVTg7ax9EEpVuGqpK6NHH6TfcKalHPMgDUdFuMR9pBt7i1
	1jmkjp/z/qh6i88RtDFM+flBnoIMpUnuauECo8SWfhCqUq2s6ydJBRJf3NlRlKjF/kNqcoGimr3
	uW4NHC2Pepj2uxCUd5Uo767p8/NQhVM1GoQWiZkbzjK7npYR2L4lzTdVdDhlWlr2RExWcrQ9mkE
	Y3PepHO9lIHV4xyTRPmRV1VUahNiTik3obudmjYFtOf8MoG/S8QIrZpTwebkNn7JXd97zPt+cNn
	VN202eMn5skftRkrFafX6rDCN6eQGtTVNUNIBOLzL64nKiL7MY4r7iRCdysdpIzddrCozSTqi7E
	A+tCvwDg1SLN4Q5
X-Received: by 2002:a05:6000:144f:b0:43c:ff58:35d3 with SMTP id ffacd0b85a97d-43cff583775mr14367982f8f.17.1774966346920;
        Tue, 31 Mar 2026 07:12:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e29c:9e31:f797:402b? ([2001:8b0:aba:5f3c:e29c:9e31:f797:402b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2580194sm25672104f8f.37.2026.03.31.07.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:12:25 -0700 (PDT)
Message-ID: <56e03e1e7a5a7a51fe34ad6b099ff7a7f1afd587.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] lto: disable for expect and add
 DEBUG_PREFIX_MAP to ldflags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
Date: Tue, 31 Mar 2026 15:12:25 +0100
In-Reply-To: <20260331081246.73406-1-thomas.perrot@bootlin.com>
References: <20260331081246.73406-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 14:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234289

On Tue, 2026-03-31 at 10:12 +0200, Thomas Perrot via
lists.openembedded.org wrote:
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>=20
> Disable LTO for the expect package and append DEBUG_PREFIX_MAP to
> TARGET_LDFLAGS when LTO is enabled, ensuring debug info remapping
> is applied consistently alongside LTO flags.
>=20
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
> =C2=A0meta/conf/distro/include/lto.inc | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/distro/include/lto.inc
> b/meta/conf/distro/include/lto.inc
> index 8752249685a4..c66dfc5a8074 100644
> --- a/meta/conf/distro/include/lto.inc
> +++ b/meta/conf/distro/include/lto.inc
> @@ -4,6 +4,7 @@
> =C2=A0#
> =C2=A0
> =C2=A0# Disable LTO for following packages
> +LTO:pn-expect =3D ""
> =C2=A0LTO:pn-glibc =3D ""
> =C2=A0LTO:pn-gcc-runtime =3D ""
> =C2=A0LTO:pn-libgcc-initial =3D ""
>=20

Is the commit message still correct for this? it doesn't add
DEBUG_PREFIX_MAP?

Cheers,

Richard


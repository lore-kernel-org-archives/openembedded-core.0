Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60753C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:29:42 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.17752.1743510580761722008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OoAg8o3I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so55001205e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743510579; x=1744115379; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PYJtsWyDLcU8A59WANcrDioslrAnCMYGZCH0lnR33rk=;
        b=OoAg8o3I2uiNScxLp3Ely4nOPwtwJrXQtthByXaNN0sDFZnHURvW1/611A88JIvrIm
         G50aD1AbcH5zGyx1jvYN1RkZmlMc3yyk9ceo/lB7mclZEq6+5A/fQHsd9MVBZJPCi+MF
         t+12OtIDBTCuhbIVkYmt0LZSDCK0d675cQBDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743510579; x=1744115379;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYJtsWyDLcU8A59WANcrDioslrAnCMYGZCH0lnR33rk=;
        b=AS2vXbwqZ5A6zqHYrrjPROeP3tif2K3wjo/WJgN/GaY07QU+HpmqmG8I/zuHJ2hKRN
         JMMtA3x7IyrKa2sASgv6MLhhRVlvjFeLetL1U6PwVh87J66d57MzyG6e+OlbrPPpD86f
         uy5v8nO0UerAvQGKgPmCzstIt5zHRaIWm+zPrY+cwKNtU+zyi4IGCg+0vBdX12rFQ2xB
         MxaGTpvqLobrKsqzTP9OfAkotbI1ZMGtJiY2eMXaCMuSeYlb93oTsN7cAUgiutyVB0Id
         4q6a46mpR7az87m52url23DUkGwAFoR0JqL/a7gSlhJt2x/qYjqtdi6l1wmZtKW5SS16
         tq8w==
X-Forwarded-Encrypted: i=1; AJvYcCXJ8dZy+s6+5xnZRtuxu0uzejjb+HjxQDy5k5fk4fQubu3LBVymHngsbVN1TiC27ZdsnSBHOYz52l61Twv0R2GRpA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxn2Llek+bfzuQdlrB+EnzHKZzyboRGxuw2Z9Y3kqXGuv+XJB1q
	sIP21b/6wrqOc33O1xImvs0cHahbU+Oo+fDHcY7Hczc+ANBmUrh/en0VQkLxYm8=
X-Gm-Gg: ASbGncvFu5zRXeDGGVQwJf1srqm1PnbHb0YYp0qWDuYcL2DE1yvXT6RXADs9mg+OkQT
	n3xYb+f6M6sm8EHwBvuyMUdbsEe7NZzgnTm7HQQUM1Zaoh3s00+jLpYEkhFFOu/oS6kleqQdT2j
	VMvKegWRxqr+beoOTjs98rtPw66GfXxO6iMtjh4+8Dwf6jAZ9OBhYcQRByvgOLy8xzMpGRSG46M
	OH2YSi+cbKwxeahibRWbQRI4Sb31Evlefm8QR0IsB9XT/UwHuEuHBmV+nKDF/I2MXh9QbAMFDnr
	Ao652fCGlO7U+/LEAtKxxKVzjG0vGyh/GtuwWMFOsEN4gkF3NV9OxTFGRZ2enzXFeTTFW4t8kvg
	hgQjQhNuVJI3GGeVeJ5m1i9E2vYJY2McXQA==
X-Google-Smtp-Source: AGHT+IFUIS37c3DGGkvo0M9FwSgYT2/BQHvcCl8QcICUzhE5O8fMmgzkiIOXWvHEe9o3/0QxZqoCVg==
X-Received: by 2002:a05:6000:1a8d:b0:390:de33:b0ef with SMTP id ffacd0b85a97d-39c120e3ca0mr8590146f8f.30.1743510579134;
        Tue, 01 Apr 2025 05:29:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:60ad:c9df:333e:6173? ([2001:8b0:aba:5f3c:60ad:c9df:333e:6173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658b7bsm13821767f8f.20.2025.04.01.05.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:29:38 -0700 (PDT)
Message-ID: <26c4befa690a5d824489710d5ed8c5e66ac4d2df.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 3/6] dbus-glib: Support using alternative
 runtime D-Bus
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com
Date: Tue, 01 Apr 2025 13:29:35 +0100
In-Reply-To: <20250401113129.3531757-3-niko.mauno@vaisala.com>
References: <20250401113129.3531757-1-niko.mauno@vaisala.com>
	 <20250401113129.3531757-3-niko.mauno@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214023

On Tue, 2025-04-01 at 11:31 +0000, Niko Mauno via
lists.openembedded.org wrote:
> In order to facilitate oe-core users who wish to use e.g. dbus-broker
> as their runtime D-Bus implementation, decouple the target specific
> dbus-glib runtime recommendation to honor the new VIRTUAL-
> RUNTIME_dbus
> variable.
>=20
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
> =C2=A0meta/recipes-core/dbus/dbus-glib_0.114.bb | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/dbus/dbus-glib_0.114.bb
> b/meta/recipes-core/dbus/dbus-glib_0.114.bb
> index ff7c2d6613..7908a02747 100644
> --- a/meta/recipes-core/dbus/dbus-glib_0.114.bb
> +++ b/meta/recipes-core/dbus/dbus-glib_0.114.bb
> @@ -38,7 +38,9 @@ LICENSE:${PN}-bash-completion =3D "GPL-2.0-or-later"
> =C2=A0FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-gli=
b-
> tool"
> =C2=A0FILES:${PN}-dev +=3D "${bindir}/dbus-binding-tool"
> =C2=A0
> -RDEPENDS:${PN}-tests +=3D "dbus"
> +RDEPENDS:${PN}-tests:class-target +=3D "${VIRTUAL-RUNTIME_dbus}"
> +RDEPENDS:${PN}-tests:class-native +=3D "dbus"
> +RDEPENDS:${PN}-tests:class-nativesdk +=3D "dbus"
> =C2=A0

This looks convoluted and probably incorrect and unnecessary.

I'd suggest changing this to:

RDEPENDS:${PN}-tests =3D "${PN}"

and then relying on the main library having the right dependencies
(which it has). The tests need the library to run anyway.

Cheers,

Richard



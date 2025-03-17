Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F098C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 22:26:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.4075.1742250367968796560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 15:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hWAN+2oN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so20012875e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 15:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742250366; x=1742855166; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Wlt82HtZAcnpEw+Ia3fjqWb3BFhYWD7GMbfFveL2jA=;
        b=hWAN+2oN52U0IMV+mewzpajieJBv418A8OWAZNepSzdYFmck2jQa8PNNai8jeUxNs9
         Asdlfgu62PY2Y1DbY5U+AfueeA2Sh//uFJAof5BD8Bo6IQwkN+Fgbs5wHKhbLwGpzngV
         vRk0+BTWVYQk4wf+VBNirinIMKVnt9kWR8WdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742250366; x=1742855166;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Wlt82HtZAcnpEw+Ia3fjqWb3BFhYWD7GMbfFveL2jA=;
        b=M3+6eX0kyUFtOurP2YHgRcIL8ZDIJ3xO4M1LqYKR8puJ48MHRR7aiUNhths09pnury
         HofM8GqNMClfMkejecyYsffOQvUTKsIwJjkpkK2kddhzsrLrOGA8KREJWojqo/6WWuKp
         VxX54O47GzPGar3RwgG/D5CdV5s6bsP/QtBQpb+BsEQTAl6rGqOtsceTEwBqP9CZB9vf
         laAt2TZh91RMeq3EcR+8YWUgFj9H5z/VTwCEtfUhjlZacivyEV4XhyDJMmVO5d/Hg+IV
         eE3e3heSmWO9GYWSWTGB6Tu/SCCEipqMfTjDvhehW5vX6SOJ+Aw6IqHBjF/ceItOWURW
         wC9g==
X-Forwarded-Encrypted: i=1; AJvYcCXsdMpS9xs3DZShWWHGS605ggHBhXPSIwP1coWB2+lZe0mIo+R/Tvl5aOc4yD7pK47rYaUYLYQ4kGXDNdpgecYwrQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzLcrA7sfnFGpS9LhUljaVyK/1q76vE/CLNYST7Fj+iAPtXHitG
	x4Px6nucg6uDJddaiEUMBATCyNaES9EVvmrBb4S1WoMBLuZV+j2B4vH+rzxhYFk=
X-Gm-Gg: ASbGncvMqWlIFjkNlMrj3tCN1GCWhYWG1k11GufJlDY4XcXCBIz5wY50rxXS8PmlOo+
	aNLnFsFuOqAvRlkuTtDMo37gC0UXRz/LFXddiOBTbRZnjGgdDM5rAUZGU5Ahal8/1DKpJJSe9yX
	rXiv/2GCskWpSJ/IfFkym8tXdmS1Jl1598qRAoh1VIvMVLLuREHK5PxgGqqmlIerNYzBvgDHXhm
	kDBa62SA9TybREJLr23GxH3iDQJpAbcpfkDOFmK/DKaEWkXUoOGC1bH/EhKHxd1t8C+pDKl8Yqs
	tpv/gDobLs4XmoITx64hFYX+lvZ5rsDMhCYO07WKRCS92ox3skIA/Vcgfrp7i2geaNzwPPUy6Di
	lUSuzSx5UPcrR5j4/s2IenCE7hIwW4bRopw==
X-Google-Smtp-Source: AGHT+IFGjKYWLMmXOrKrjlxbv8GptyKoH6AUeK3dvcYzYALPrswlFZEeWV/3biy/qh5oRcTilOQD7Q==
X-Received: by 2002:a05:600c:4587:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43d3b9a9ac2mr193695e9.16.1742250366169;
        Mon, 17 Mar 2025 15:26:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:90a4:7359:f9ee:7774? ([2001:8b0:aba:5f3c:90a4:7359:f9ee:7774])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe524ccsm117077295e9.0.2025.03.17.15.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 15:26:05 -0700 (PDT)
Message-ID: <bd402e1219d81b9a5b4d801a1c4e19d4713c511d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] packagegroup-core-x11: depend on dbus,
 not dbus-x11
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2025 22:26:04 +0000
In-Reply-To: <20250317134738.1826161-2-ross.burton@arm.com>
References: <20250317134738.1826161-1-ross.burton@arm.com>
	 <20250317134738.1826161-2-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 22:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213127

On Mon, 2025-03-17 at 13:47 +0000, Ross Burton via lists.openembedded.org w=
rote:
> dbus-x11 hasn't existed as a package since 2012[1] and is just a
> RPROVIDES in dbus, so depend on dbus directly instead.
>=20
> Also remove some non-ASCII that had sneaked into the file.
>=20
> [1] oe-core c02364f36e228835ea5d7fd4e1d347fd451f8544
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb | 4 ++=
--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb=
 b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> index 91db7ed33bd..4a3590e3e79 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> @@ -30,6 +30,6 @@ RDEPENDS:${PN}-utils =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 xrandr \
> =C2=A0=C2=A0=C2=A0=C2=A0 xmodmap \
> =C2=A0=C2=A0=C2=A0=C2=A0 xdpyinfo \
> -=C2=A0=C2=A0=C2=A0 xinput-calibrator=C2=A0\
> -=C2=A0=C2=A0=C2=A0 dbus-x11 \
> +=C2=A0=C2=A0=C2=A0 xinput-calibrator \
> +=C2=A0=C2=A0=C2=A0 dbus \
> =C2=A0=C2=A0=C2=A0=C2=A0 "

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1209

:/

Cheers,

Richard


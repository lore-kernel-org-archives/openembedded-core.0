Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B3EC982EE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 20:27:14 +0000 (UTC)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6079.1790022425511580338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 13:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DdfJifWj;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso524036566b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 13:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790022424; x=1790627224; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T27WgmR3JJnuVwWkpYx9kaH2z4GFFxOs1yG8aaEhdxI=;
        b=DdfJifWj/+/6D2nkQRkYSD2HPNtcZBQaxSpUQuxUCjIeAFmOMLaYG/VRL4o8sldDzJ
         2OvqJG40eWVV8RNGHE9orWa7llLcP4WBHe76up1dC2HxBAi76FaXTa5zbft9zOY9Rwkm
         zSMeb6i0wvlQIhT3oEVt/CzxggHnnksQjUAlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022424; x=1790627224;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T27WgmR3JJnuVwWkpYx9kaH2z4GFFxOs1yG8aaEhdxI=;
        b=oqWzYs/S7BxeFB6qxZO2YcXha3mvKiHyqAYoq6cTshTRM0gc+OA0WvZuubIf7YJ/ua
         XiXyjlmHOCxkFHBShGhbAHtrUQpeZujsY/D+e7aefbA6dk0Rpk4zcOswyBn26+ckNG9f
         iY01Oto8peVcsA4F6l90a96PqpxS81EolsaqIdjWaV9wRA60q3IXP8jsHVgSCxxd2hma
         mOZFBbytHZBqdvtiyxHEIL/FRLi2g/L5Q+V0Zf8Eppu4kQs1ML/aoFZFVyUqRvL5B9lp
         uCcAcy8Tw3NjOI8Yf/3IvtMI+Bg+bj/kfF1tsS6SyqKM6HiOlU/UAQF5BL2I3RN74NKk
         s0Lw==
X-Forwarded-Encrypted: i=1; AKwUvBynTkiduJ3fVYWhEPQVaXq0zdYkX6QyNBXi9zR/lwoI1FV/IvyMIlDxOs/C8Hx6luHop+6N/h1zmKb70uQwpO6oVA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lOykro8n475ElKiCfzQxMiQcnCo4ZQ3G991VCFuQpRJlL31ueR
	2LP0GWb4MqESZ7Xgs/0H2v24zqvkh3RWcCXVx2wQfR9XAwA/iDaQXYttLMfEgzl9bXR8Xu5/R6Q
	UyNIdKw4=
X-Gm-Gg: AYBFou1VwQGXrDg/8z65hAX4d0gR+dK1zjBgcPMfCgUFsJ95nAvyQAlNcX6wb6PGmHf
	ou1dhGa9IY3PBv00Pv8WKPcV8LmUImwRUJYMGeOd4f0jmImWj5s8sjbx6hCLrdeXQHB+4+3dfTh
	dKZFn/uKZ1+wQyGaVKh5iSYrcmVgzHyAU4cQJexfV5SUICfKFm//ggom4+crwXK196GhkDprlTl
	ah02s6VhFvvnakZCmBiWoTCq7SpRCV5f71DjYe3/ryirgaTA8SNHr+P/kbZs04Yx+tQXp+Uc41c
	be15Wbrti80gtBFLW3+H5RpZoo0KWKAPsc44cWMeUWZ5LO5oF6tMNWGAOWBqti4O5Ee7vCGtqhA
	y7SzYHoNe8KJLe+1UmBkq7M96Q8n/rMvWTNs+fMWMzx48i5ZRX7JBtz92RnGKG6+Jd8SPSwivu4
	xnyBoBIMAXWYxBf6WbyxuC+SpxzUfX2IZ31loY3zOtIdtME9LJIOzzD0uCfWkP3qckht5kUm3Tg
	lbGRJXk3VWTgRqpHfBhwkl8LkraSis3PhE2ugnPdLej/pM10sHQmiibSpG2lpg=
X-Received: by 2002:a17:907:7296:b0:c16:84dc:9607 with SMTP id a640c23a62f3a-c2a156d8cd4mr860333466b.19.1790022423660;
        Mon, 21 Sep 2026 13:27:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a46d:d671:f81e:e5f1? ([2001:8b0:aba:5f3c:a46d:d671:f81e:e5f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a96318181sm1555966b.43.2026.09.21.13.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:27:02 -0700 (PDT)
Message-ID: <4c99bdf9c131457e45a054e74e4ef2d658a7cbaa.camel@linuxfoundation.org>
Subject: Re: [oe-core][master][PATCH] libgcrypt: Update license for dbg
 package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: UpStream_IP-SK@bmwtechworks.in, openembedded-core@lists.openembedded.org
Cc: Sana Kazi <Kazi.S@bmwtechworks.in>
Date: Mon, 21 Sep 2026 21:27:02 +0100
In-Reply-To: <20260917080632.1039202-1-UpStream_IP-SK@bmwtechworks.in>
References: <20260917080632.1039202-1-UpStream_IP-SK@bmwtechworks.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 20:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246356

On Thu, 2026-09-17 at 13:36 +0530, Sana Kazi via lists.openembedded.org wro=
te:
> From: Sana Kazi <Kazi.S@bmwtechworks.in>
>=20
> Set LICENSE for libgcrypt-dbg as "LGPL-2.1-or-later"
> as the files used in dbg package use LGPL-2.1-or-later.
>=20
> Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
> ---
> =C2=A0meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.12.4.bb
> index 1b2b1dc13b..27b9d7fa15 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
> @@ -9,6 +9,7 @@ SECTION =3D "libs"
> =C2=A0LICENSE =3D "BSD-3-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-late=
r"
> =C2=A0LICENSE:${PN} =3D "BSD-3-Clause AND LGPL-2.1-or-later"
> =C2=A0LICENSE:${PN}-dev =3D "GPL-2.0-or-later AND LGPL-2.1-or-later"
> +LICENSE:${PN}-dbg =3D "LGPL-2.1-or-later"
> =C2=A0
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D570a9b3749dd0463a1778803=
b12a6dce=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://COPYING.LIB;md5=3D4=
bf661c1e3793e55c8d1051bc5e0ae21=C2=A0\

How are you deciding that none of the files in the -dbg package are
under just that license? The cipher/sha* files are likely a issue on at
least some architectures at the very least?

Cheers,

Richard


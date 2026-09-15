Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA4DC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 09:57:40 +0000 (UTC)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19554.1789466257170370176
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 02:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zu54nsNp;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so706186066b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789466255; x=1790071055; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w+WUITTLruOw5x6h5xPDKq+xqd23I92Cg7ILMmXa8GA=;
        b=Zu54nsNpz4YQ9y/n80obSSFBh58kk0lSFTK9fSy+tEn3H1dhFMm0XfclUkASXnc2g1
         3A/AzdMPCrDtUZOHSG5HtvKyu2YHTS8MhvBCrh3jOBjSJAUK9tGmJs9C2z/7xGX46rNH
         eLKTPojbaRyfP2ZCUABoP4qpx6H6fHgvsHi48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466255; x=1790071055;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+WUITTLruOw5x6h5xPDKq+xqd23I92Cg7ILMmXa8GA=;
        b=x3O2FUx7B09Oj01RFvY6VEk8QFwAS07iD1rOYEVf8bO6g5Luqfr/QyGDf6lRwGCMUg
         7rQlk33C1l00BWv2BfP791efMRqYRVY3G6z3k+PwuYsjZKU22VVGStFjiRUIwUUbNzzi
         +DT4D7Rsgf9H/zgYuE+GVivgPE41QTemYnUnY1ubQMOXC154cvjRWMFa3K7K0ght8yWT
         wIL13Br/gV0njBnvXpy+7OkRkBiT7aCM8kj8VU/KLXYXOymshL5e+HXjsmSHuaWnVEm4
         uLA/hOV8kd6jqpxng3c38BdZ+t6EqE5CZX9E3hOZn9C8Pmwo1CI8MOu47lCGnI95yItW
         qMFw==
X-Forwarded-Encrypted: i=1; AKwUvBxqAxBLCz2r6nBxa2X6A+JhxB0ddbPXi4/5eh9wa9o3IvTJl/kasbLElqxq8rBDGSG50VcURQFew8GjJtOV7hmHXA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lsopCnsRUpQFFpP+PoOwSssw1voAkBsh+AEiMtyOMhxhcPrYI1
	LrK1FJu5vn+weCzSIq0VpdlEDzf8Fs2bq+Ko+JOQhfEdjdZfx0Wu6HAcqgtQC4oOE6g=
X-Gm-Gg: AYBFou1u6lZk4z0IeGUghvlSiEhyuIdpmoF4SJAL6TW5kYeSYsJLuNHcOYNafoXJke7
	/6B59Wp9a0D8Vym+3e6oQEJeKIsJw2JYx7dv3UbxxcbcwN2L7MmssWII8FQlPoftrOhDq0vMoF8
	zjnNqD37SL5FjwZjxICaW7lDmkj5MvJIVFF0tp6DrQgH94tZUPz+/oq7pNDwx3MdMC5W6wsKeVE
	FF9eqXlR9M5RMjN3y4A9AnXcdZx+SOkI+dvI/D6eDCZkT9jNxTk8g8Fn4LvOgqZdhzAW8poFOTp
	ymbuYEJeWjRIIN/Edb4IHLyqz+/NQgqOTnt9K8I0uInvToPNTA9IXR0nrz3mzpEM7JOFbOYvE++
	XJu0y/HNVYxA7OTz1zYB++U4zR6534kCOx+QpMXgkW+qObrHiBzzaKXUxsF0i9u29ARG0CTzkTO
	8Qf2d37a7fcZ89rlDDnnyHhOTEz0P/M/5OXEqzRtoC1OOtbNRLqqmdQjePgZ7Ieg8yiAFoWlIlx
	nDGi9VZ4AJNkEEbnqNClek5KL5/7+S5sYeP0fYL+26TwgE7F/X29sH6k3ozoVVc
X-Received: by 2002:a17:907:9804:b0:c29:5215:b2d2 with SMTP id a640c23a62f3a-c29b8724ff9mr470310566b.23.1789466255379;
        Tue, 15 Sep 2026 02:57:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fe92:a101:5d63:1ea8? ([2001:8b0:aba:5f3c:fe92:a101:5d63:1ea8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660654f2sm547179866b.28.2026.09.15.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:57:34 -0700 (PDT)
Message-ID: <e58a04cb8fa7a28860a4e3c82a7c5c11e993ed64.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] epiphany: upgrade 50.6 -> 51.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2026 10:57:33 +0100
In-Reply-To: <7617622fbf8dc6a97c32605ef2e408d77d1c2599.1789116540.git.jaipaul.cheernam@est.tech>
References: <cover.1789116540.git.jaipaul.cheernam@est.tech>
	 <7617622fbf8dc6a97c32605ef2e408d77d1c2599.1789116540.git.jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 09:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245836

On Fri, 2026-09-11 at 10:51 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
> CompareLog: https://github.com/GNOME/epiphany/compare/50.6...51.0
>=20
> - 51.0 adds a new mandatory dependency on pwquality [1] so add
> =C2=A0 libpwquality to DEPENDS.
> =C2=A0 libpwquality was imported into OE-Core in the preceding patch.
>=20
> [1] https://github.com/GNOME/epiphany/commit/683e9a076fa3
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
> =C2=A0.../epiphany/{epiphany_50.6.bb =3D> epiphany_51.0.bb}=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> =C2=A0.../0002-help-meson.build-disable-the-use-of-yelp.patch=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 +-
> =C2=A0meta/recipes-gnome/epiphany/files/distributor.patch=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0meta/recipes-gnome/epiphany/files/migrator.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +++---
> =C2=A04 files changed, 8 insertions(+), 7 deletions(-)
> =C2=A0rename meta/recipes-gnome/epiphany/{epiphany_50.6.bb =3D> epiphany_=
51.0.bb} (92%)

Just for info, upgrading to a new version of gnome will probably need
to wait until after the current release now so we'll need to wait on
this for a bit.

Cheers,

Richard


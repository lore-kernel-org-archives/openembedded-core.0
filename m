Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853C4C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 12:20:04 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11519.1788351602837215075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 05:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CMlkh4VA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482fc3327fdso687133f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788351601; x=1788956401; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D0GQm5LUdlcOGIGUCgX/qYaJqLNhayjmq3gcNDCgOWo=;
        b=CMlkh4VAWOTDHF0eRaZXs6c7+K6eqKyKYugaflH2T0ZAw0kCv3fX1RjAtFo4D9yrPd
         IBz+3+v4Pu3sY7gPDAPwv0tv1HJnIW84cveEAtRro6ODbWV5PipYh13+xQrp7AUezvzl
         ICeGJX/eZjLCK2MG74t256/zweBzmrfR7cK2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351601; x=1788956401;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0GQm5LUdlcOGIGUCgX/qYaJqLNhayjmq3gcNDCgOWo=;
        b=rxfy75LVH7EuTotaPMCoUZw7ZFiwYDJY4r+Tyz3JFAOY6c9aX0LVplIwU3SyvCuk3Y
         P1TMXEzdgYcSZsvLnVpTZLXN/7V6EgvjG/K5dIUD2LFKYZGH/jX7e2VxvD7za4ks1nZC
         29Q7FXfwDqB8+v43vup8Mnm4YftJe2U6l33oUJFQGb4BWXe5gcqKueZ3D2xGNUbx/KLO
         mNo+LJiQOQ5sGvw1ebtbwaBXnyya9rm/9A+LzsU0CN5gB6wfufOw7LS4AtUZplYtkYC2
         Zt+u9gFi/Fe9Mlv0khiivTVM0spQpvMPN5cYDSGg7IlXun27Nuw7Yg4SPOZuiF60oPU3
         Cb4A==
X-Forwarded-Encrypted: i=1; AKwUvBzbzQpj42uC0O77idZxP9uwB5jqXGLtQnsOg9bwTFZV0CGU9ZrOSX4NqC+QQo5VygNqqop8tA5+wgdYKChOHOv9Ew==@lists.openembedded.org
X-Gm-Message-State: AFuF++mALDcFZPLFa9YDru0BJvoHZn4gQPKfA8iQTMVKfEG1oggJLMZL
	JR8kby6HAob55T1c7eKVU2Ixk45oxIv22JIm95KtgF1axK0XFccsNVs5mbYiTrimoJ/KKw6lTYK
	vUNyF1Ls=
X-Gm-Gg: AYBFou2xT3zpHVLdYssjB7UKzLhiqNg4AtKMrY+SHgZPbcJAFWh2j76w/jn+v6di/3c
	HloDM4avzkbayTafmIoxi/w+Vlqagk7BRyJisPKj/qWkxVZIDsjqbArOPo/eo1Kh0St913CHyIA
	NSCuIkFo/7sRTULYrcQyll7rNWxpPMjlh+tvqY96lHF6qJAcznVSlBSHGMEzCFOALY5U2jPLii0
	QvGuV8SRLhFKW5mc9DPjXe1En1pH3j8zdfePx3VjKA9HpGcxabElLkgwiu3W8M4EflELZUP0NRM
	omU/l1XX44YYekSbp5R4KsbxXyRY9+1VpDVwTPLqwHaEV4dX87vTMXMizZA6ZfgLgv+sASt2LmU
	xH+GM6m2eL0aAsfwsoiu9qDtX9T8hanjBshV699oLjohgkYM9P8upVEU10j1cMK2F3oxrr0Atxq
	qI21kmD7xcRyulK5LenCqfwuvXFAr45Wn+uZE1uhXbxR2Nvv5c2M+fTU0KGKuaUygGexO2Jfuu/
	XvyPDAXFvcKvztDM+0fxCwOFHIw6HMTjMfrCDyotT8VStpEti3FIw==
X-Received: by 2002:a05:6000:4819:b0:47f:e748:3ae3 with SMTP id ffacd0b85a97d-48488deedc7mr8368543f8f.3.1788351600876;
        Wed, 02 Sep 2026 05:20:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:89b1:8875:2e41:59f0? ([2001:8b0:aba:5f3c:89b1:8875:2e41:59f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea5b4sm6160101f8f.27.2026.09.02.05.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:20:00 -0700 (PDT)
Message-ID: <20c692768ef0b8ab15d6b884c11b5e0c5eb1f3ce.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wpa-supplicant: Build .config from fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kiernan@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 02 Sep 2026 13:19:59 +0100
In-Reply-To: <20260831060120.399342-2-alex.kiernan@gmail.com>
References: <20260831060120.399342-2-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 12:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244940

On Mon, 2026-08-31 at 07:01 +0100, Alex Kiernan via lists.openembedded.org =
wrote:
> do_configure built wpa_supplicant's .config by sed-ing upstream's
> defconfig and echoing CONFIG lines onto it, this is both fragile and
> makes handling anything not covered by PACKAGECONFIG tricky.
>=20
> wpa_supplicant has no configure script and no kconfig - it's just make,
> so switch do_configure to build the configuration from a base file and
> .cfg fragments, which matches what CML1 recipes do (though this isn't
> CML1).
>=20
> This should have no functional change; the effective configuration
> should be identical.
>=20
> AI-Generated: Claude Opus 5 (Claude Code)
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> =C2=A0.../wpa-supplicant/wpa-supplicant/mbo.cfg=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +
> =C2=A0.../wpa-supplicant/wpa-supplicant/suiteb.cfg=C2=A0 |=C2=A0 4 ++
> =C2=A0.../wpa-supplicant/tls-gnutls.cfg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23 ++++++++++
> =C2=A0.../wpa-supplicant/tls-openssl.cfg=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++
> =C2=A0.../wpa-supplicant/wpa-supplicant/wnm.cfg=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +
> =C2=A0.../wpa-supplicant/wpa-supplicant_2.12.bb=C2=A0=C2=A0=C2=A0=C2=A0 |=
 46 +++++++------------
> =C2=A06 files changed, 55 insertions(+), 29 deletions(-)
> =C2=A0create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/mbo.cfg
> =C2=A0create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/suiteb.cfg
> =C2=A0create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/tls-gnutls.cfg
> =C2=A0create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/tls-openssl.cfg
> =C2=A0create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/wnm.cfg

I'm not convinced this is an improvement. It takes one relatively
readable function and turns it into many different files spread all
over and complicates the SRC_URI.

I appreciate it isn't easy to add new entries currently but that could
be solved by making this function a standalone function which a
bbappend could add to, if the additional PACKAGECONFIG really isn't
suitable for core.

So no, I'm not really convinced this is a change for the better :/

Cheers,

Richard


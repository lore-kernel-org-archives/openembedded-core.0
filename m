Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A17ECAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 16:42:23 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.2299.1757608941671265848
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 09:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ruK7xthg;
 spf=pass (domain: konsulko.com, ip: 209.85.210.52, mailfrom: trini@konsulko.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-746d754f656so748104a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 09:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1757608941; x=1758213741; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2IxprHD9eSAx2OLihhNZdgNfLr3u0svHcafCKLBY0qg=;
        b=ruK7xthgMCEPHKKqTS+ERIYe5M9d19fJIxmqQpFbW74aIV/mlzOBCJPYK2eldjDNIt
         o9XIuHBMMOLIng5qkuKZuhgrxjg/KW1f10fcB+mOz3kgi1bO8azc+dLHyEPRrBnVPFDZ
         LevteLcKMFxObhsYUDfNXlmkBj6TNANbqKzPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757608941; x=1758213741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IxprHD9eSAx2OLihhNZdgNfLr3u0svHcafCKLBY0qg=;
        b=K71WiiIh5wkrnxZtsZ7wmOPs9QUBfwVKfetcZjMj2FCFPkUe3b1UbRj/KkcNGiferh
         itRZ2Kl/xWe3G0k90s0bUVuDmCm0QzYttWiOkHvzSDCbB0Vr/FcoPvsJsl0GFiPdVinP
         GIfYJBgfPLRAiPrrYM42/Rp4DVUWEFSjr23xMCxFeJ30cmXmCJ6xnsOVxsOErr2w9wJq
         DqTTyKzkAs72YxxdNRWrAyhPhqGQ5/tMbi24b5FBbMnlBud3bPwuX5mE0UA87jVIugXn
         dX6JLmajNtk+cSM8hpXZoGhT2bFJ1ymygVQoAqrYklqU379v7l7eduP2xE/jl1IbPVEw
         GbPg==
X-Gm-Message-State: AOJu0YzcZZAERIuzcFl4dHe613XhsqmSHk+ThnWh3/RathH6Nwgjrc3C
	zR0FiNp4jTkiOJnL7XWVq+xzYyz6SU42PEZiBzFSnFxlu8kypYsAXuhM03fgHynAiVw=
X-Gm-Gg: ASbGnctPqIWebn2rroWUOgrO+pkxjHlljMuXpAKyzL67XGUpLaUjvC6wmbOxqMiQjoh
	RZvMrulAF31YuBn8NBKjEcRNxYJEHht1MbgPDQp5QFsZi9VgMryKshcbSk6on3Z6CdZvx2rUaop
	EeEDWXkYV+Z6ICRJudo9QER2/OyXCXOAJKY6mZFhYbHIB5PIQ40+7cJoutVPS3TLjfov+yiilxL
	8WCsVVg5n3FPRdl0YlbEkLxI1YNetFAqobJt1f6kcFKSqbMUrdnEjuidkdUUoOhrdzvPW0m0zzo
	UuRiq4bPNkcV5mx5GNzZ9Oj8hUsGbvpVJi/YnEVOFyewhGoMW3fJsdrGUixxiptozcOEQ9AvI9r
	xqhRZW+syzjuHtu89rrAd74tPtSzAHd/5oer9WMJVR4SIJAq+BVRqSj3UOPV3GfkEUGs=
X-Google-Smtp-Source: AGHT+IE9WOQGR7HUZKZN0/+O9RoCnJW2NvUFEnaeiXgtnUJRIH9nHcFjYUf/twaKMmwyYscM4mh58Q==
X-Received: by 2002:a05:6830:64cc:b0:745:9d36:4841 with SMTP id 46e09a7af769-7535481d89amr54861a34.19.1757608940906;
        Thu, 11 Sep 2025 09:42:20 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-42.totalplay.net. [189.203.97.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-752492987ccsm442036a34.4.2025.09.11.09.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:42:20 -0700 (PDT)
Date: Thu, 11 Sep 2025 10:42:18 -0600
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [PATCH] maintainers.inc: unassign Tom Rini
Message-ID: <20250911164218.GR124814@bill-the-cat>
References: <20250911163359.1766373-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tG1o+Yt5H2G9BOQr"
Content-Disposition: inline
In-Reply-To: <20250911163359.1766373-1-alex.kanavin@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 16:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223290


--tG1o+Yt5H2G9BOQr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 06:33:59PM +0200, Alexander Kanavin wrote:

> From: Alexander Kanavin <alex@linutronix.de>
>=20
> This was requested via private email.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Acked-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--tG1o+Yt5H2G9BOQr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaML75gAKCRAr4qD1Cr/k
CgEMAPwI6MeAgqcFHPYpQatPVbELIDObhXpf4Xw1ZT5vu2htnwEAlhFnMyYarDOM
lEDAqbepa22wuU7o6bN9IO8kCDtLCgw=
=QEK0
-----END PGP SIGNATURE-----

--tG1o+Yt5H2G9BOQr--


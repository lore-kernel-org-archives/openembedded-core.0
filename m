Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9244ECD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 06:58:42 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148688.1781593116478982929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NrLxWRSc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4908b92904fso51482295e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 23:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781593115; x=1782197915; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOh5E/I5tT4JpZ6Z5C6tgrPcHsVtA5j+IhRsDmzLvEk=;
        b=NrLxWRScQSYooHzzhoau6DB3ISTb3vY6RIbuUOntbqmG//XCDy7u6yQgL/0cJQtTvR
         UD/RKJEMWXxaoNgBg13dXSVyhEYZcuN8cxjbf7mvPLfir0IYEsjclTiFPi9NPch2VEEa
         6xvN8zYyO3qCixTvspVz5zYHaESAUZ+5tIpgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781593115; x=1782197915;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOh5E/I5tT4JpZ6Z5C6tgrPcHsVtA5j+IhRsDmzLvEk=;
        b=CbAXmTCfc5O8heaTlw/yM/P1jgiOogRJUNU4z6o0A8G+JHc3vEqSac7F/cC8+nP30y
         NYrxZVKQvUjeIdu6RLgIMEn6SqjnQ238X+QklYmwIvfXoG5N85JnpoTtqmxPIpOMzrJf
         wo+aFu2clrNKJ5544kciOfUpMAsf6yZgb4hPXgEk7f8iyufuxDQgDBA8tOxl+qYf9yOJ
         pxIutLoSgUtlCNldeUX06YxskYXyG6DJ5K4+93k+4VEIQu4NKzQ3ekCB8WWgTT8bym0i
         lY34wt0Ne6EE8htIdQ6U1VayGFyqHSHQ/0ToOnSn/lXY0yeEBOY4Uh5Tzt1XVtAJj1fh
         sKYg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZIZCzi4zvE/yT4TULwI3Pd67IF612TPqcmb6FzXfv6PztkuQ4eAbthyW3GNOWtbcAFtXyBFBQD0BTjFEQ37Xp0g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWSryTZZMLBwVRPUjQyeEdh/xGtgN6pB2wZOmj9pRojyVpgo7A
	EIf2wd42bf+n2xp9Pn9ZAprKFy1oYHsgChpodyDBNVBy/dyChphjKquN65ka8ZPkUt4=
X-Gm-Gg: Acq92OH7voOskKlio2PXn9bTkpGYm0YgpQKMx+RnSFB5OPYUlOtmaSDw8KLs3vg2ehh
	N1hNm7JtQi7Dzp/uXw6//um44ggflUZfUKgydA+TGwgQ9vC9ZAP7VW6G5oQ/xoW6+qxUhNxTvLZ
	iwrAqPPGUnUksJ1X1VeWkPU0NF9UIba5sEHNufcACgOd+L12tr0E3Uw4Acr7ZmBnkwTroANwC2m
	Oc3ZXzCkR9j9V8RnvYv/IfKj0bQiaqZkljjQxA2hZAzM2p5DP6TdZB/DFhnJcGnkAdrPpDyy2yt
	KMlI8A2onUUxBXwE58z8/kb34gRGkIP/jfOGUqUt0C9A/HDQYRTyDn7QrQkhoRX1KGh2LKti2Uw
	RDE6rrB6UTyJ1U31N4QVYvLFIE+00p/N/DholYE6OVuTZATOHGhEx2qdbWd91KznL896SCFn/26
	/8wN+21B602ineE1RIKo81Xkh5p9z/n1J+kS1wErfCfVviK8hpyiFOO/VXnJiIeHt7N3n0TmjRP
	1fr3qddrXHZnC5/CgUUwOqGof4=
X-Received: by 2002:a05:600c:4743:b0:492:1e36:bafd with SMTP id 5b1f17b1804b1-4921e36bb83mr204789295e9.37.1781593114529;
        Mon, 15 Jun 2026 23:58:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3fda:ff4e:923e:e0cb? ([2001:8b0:aba:5f3c:3fda:ff4e:923e:e0cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922f9cd140sm48423965e9.0.2026.06.15.23.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 23:58:33 -0700 (PDT)
Message-ID: <b19e6b2517895eb45121f4ecfca77edf5d1f29b0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] install-buildtools: make SDK name
 configurable via --sdk-name
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2026 07:58:31 +0100
In-Reply-To: <20260615121653.96009-1-jaipaul.cheernam@est.tech>
References: <20260615121653.96009-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 06:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238871

On Mon, 2026-06-15 at 14:16 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
> The environment setup script installed by a buildtools tarball is named
> environment-setup-<arch>-<sdk-name>-linux. The script hardcodes "pokysdk"
> for this component, so any distro that ships buildtools under a different
> SDK name gets a FileNotFoundError after an otherwise successful install.
>=20
> Add --sdk-name to let callers specify the SDK name. Defaults to "pokysdk"
> so all existing usage is unaffected. Invalid values (empty string or a
> value containing path separators) are rejected early with a clear error.
> A friendly error message is also emitted when the resolved path does not
> exist, pointing the user at the --sdk-name option as the likely cause.
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
> =C2=A0scripts/install-buildtools | 41 ++++++++++++++++++++++++++++-------=
---
> =C2=A01 file changed, 30 insertions(+), 11 deletions(-)

Given we're installing this and there should be only one of them,
perhaps we should just use glob.glob to find the name? We could error
if more than one is found?

Cheers,

Richard


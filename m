Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8A2C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 10:25:49 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28264.1785147939695856179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 03:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oEx6b0uK;
 spf=pass (domain: smile.fr, ip: 209.85.208.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69f7af97316so3908199a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 03:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785147938; x=1785752738; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ytH5lpSTgGWTaEiyTd5kB9gD8uEerw4o/2zvLe+VlYk=;
        b=oEx6b0uKYRTmnLqylG0r5pQuR1oNIevUD+0Br2kMQ1/gkeZDIVXvImRc64q1Wkh+Z3
         zItoG4hq/0jVjGwt8csLXcDM5FNU7c/RvGuY7bBf/CaNp5AdjSg2QhcLg6hZtjiDTZD4
         8btoic7Em3Y8DmCGVy8dQYTVA3X164L7nbkGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785147938; x=1785752738;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ytH5lpSTgGWTaEiyTd5kB9gD8uEerw4o/2zvLe+VlYk=;
        b=SgtQL+0tD3qU3riMXhq4MeIEBGglMaYXrBuYIsHYzEMPtLgvR4Q2GRD82XL0FTkQ/B
         Zq75eSK6jXpjAEA8ExmxPV/QvPOepH0wzdcpOiu3CtlBSkEvPDetCGoo+l+5Lt6w6VVZ
         yUKlBYoHq3mQgW68MCRPkCTwvVfqJSjTdJH4rOMv+GlHSh5V3sUiDJtaI2nwgvFUHY3I
         8OxXRAlGX9wuujCDmtSdDZ6cMPVLgxyH2J6aZqQvtXNjY/OB5cxIZn2RMmSqIalNRHKK
         Gu2TrWeMETKF/+/CpsqY6nzHzm3FQ+wNJd2DsLJwbwLOzK/wyqppW/+XTHGNABB05VPg
         yVOw==
X-Forwarded-Encrypted: i=1; AHgh+RrFiFOzE22Pi26Z8Bb1R3opIPqZp1/rXCuQOXSawuZTZlod6xuBSGulstqdQjDWpmElcPpTKCYq9A4M26NcD1E+hQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxA0slKpUl+UhjUAQh+UkSH1hYhALDSLRHbT/VXwOJ+zvOtkziO
	cgmJ5GkQUg6dxlABV9wwew0hfApMaHxQEl0eR2WxMEkAYRU2syOVFOLZnjICVKWIVbE=
X-Gm-Gg: AR+sD12OBnw2Wc6XUQGBBTRXkFbSN8nvASAZ/42YhLNPGFIohaJaJ8piJn1Qr9WGtE0
	2a7pE1A3KEeG8+qYJCPjKFzWQlsW58Yku0yrO84PBjhPb4mZyxjkE/+f8f9xEvs7sPwZAZgF6Vc
	dPljO9L7RVrD3GdjTn88+CHkwuPouzmZhMIjo7iq+/Vx6BcSRQSeBZD2OMnbX2ZjTMTZksmVkqv
	NIiSc8CEzV6pIeI7XKu4ZUXVyd5tXBW20uwFiMK+K+GwPcXC86c4plu084YOfd1X02TOBlxomz6
	Szf2MGedrLTGpvUJGpRIuyyW26jX/BnexBjr1hJVQScdG2xBtXTFvad9Jv0KzVmCPBms3XcJMDO
	c+MHntaYbX730cX/QGtxOKDErogDcKb8CYkfZj3VKHwhBLFwDGX42SwLm+v/YWsENiTB2NVzCBC
	7e12p/mVTaXw4FnYT6uD1MjqyPP7UIXZBVAuqR03a7XjmzpfVM+X6qP7ghvez2cg==
X-Received: by 2002:a05:6402:28c9:b0:699:6d24:e298 with SMTP id 4fb4d7f45d1cf-69fc0ff58f9mr2785271a12.8.1785147937780;
        Mon, 27 Jul 2026 03:25:37 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb50bd467sm2366370a12.1.2026.07.27.03.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 03:25:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 12:25:37 +0200
Message-Id: <DK9A4OUNIHYT.2N2PWQCBML2U5@smile.fr>
Subject: Re: [OE-core] [PATCH 1/5] wget: fix CVE-2026-58469
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Hetvi Thakar" <hthakar@cisco.com>
To: "Amaury Couderc" <amaury.couderc@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260722081709.14764-1-amaury.couderc@est.tech>
 <DK8SR59VW59C.13WTSX6Y2PQ8F@smile.fr>
 <AMBP189MB3196359C30BDACEB176F05B2F8CC2@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <AMBP189MB3196359C30BDACEB176F05B2F8CC2@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 10:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242082

On Mon Jul 27, 2026 at 12:00 PM CEST, Amaury Couderc wrote:
> Hello,
>
> I reviewed the patches from Hetvi and they seem good to me.
> I would propose to go forward with them instead of mine for
> scarthgap and wrynose branches.
> For the master branch I can send a v2 of the patches which
> include the follow-up regression fixes so that everything is
> covered.
>
> Would it be fine for you?

Sounds good to me. If Hetvi could Review this next version that would be
even better :)

Thanks!
--=20
Yoann Congal
Smile ECS



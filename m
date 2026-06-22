Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17552CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 14:58:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45245.1782140295438288670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 07:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vax7sxAv;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49249707788so15908055e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782140294; x=1782745094; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv62sWIkyj8du7GqfY623pEIuHq/GyiCU4S4Vr6BjTU=;
        b=vax7sxAvSxJXu/biPfbv68pxjXw30DDb1C6KUA01hIAIUo8+m3HKkYxi/jLkkgWaVJ
         ljC2BBKiZuuFGUiU1jFkpe0UFX0YVBzoOJcDPkngKbLAgUGblTLn+2qqE6aFaSURLq7l
         Lr+REQkq2ibcuTqWTURrJ4AXprU3mOhH1xFFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140294; x=1782745094;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yv62sWIkyj8du7GqfY623pEIuHq/GyiCU4S4Vr6BjTU=;
        b=G08PBxKTazZVLyTvDnlEVAP/KgY8RMUqWCI0a4IJwj5R/+NDcueAXUehfKKiuqNTyI
         C3b6UOhA1zUZbgo+7f65TZ23kO773ClDfthGxJpRhja05Eb5gDrh4YcEtQsMKQiyrRFC
         ndmXnhWNgyFhtbppjIGbX0YdwgXL+FiXvO9E6Yp1olo0LAI7xt7XTzEcnAE2t9n5NJID
         TU+6E7a2eFaHfn8ZeTmAkIoKSv7nIGQYLS8vpnUS7LC+/EzAU2Yeb3w3Edo02MKQ5wR9
         rKMdQoqFxIl6652ph53zMGMOdnf7ME5Bkn1ZsduIsMyDNujkdRe5ogeQfXkKYG0WfVS2
         J1+w==
X-Forwarded-Encrypted: i=1; AFNElJ+556WacJJS7FEjSc1/pRtpQTNLf/IERKzAKZFAgpNSjLdKanTM7HM/c4Tlffpyy43Dt5k5XSFqWhd5zQoWi9hkEw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZ6huerEKe4M0TXDgwC3MlL8+sJPlfeDaopJGMA/d0Fquz7P2R
	erYuzil4aKeymGAlV6fJxkF58FIWUwrk3GefZ0eGBUN/lWzaoDTvxpPNZI+2tOFKJwI=
X-Gm-Gg: AfdE7ckHQ91flAT64vtUBkbTxsbMT6q3SuEzhTY3bB9iDZfqmk5zzZNNGz/4ZLcZxuh
	17FHDUXRsN0HvdonVHwyEq199r34rLbguJAfDYL0NLx7u+lL+UEWlB0Z4cA1env3IXdA131uxxp
	PbFX2qD/DLBaUx+ZeTClyxnyf/TyW/chyKXki86xV5LHJJsNgyvZMb9lIrzqnOYd9XU6/pn7KpD
	uASiob0g7M58D9PITzY8pLQzyIzy+j5UrrlGS/6x+7sB6XMr+bdOwE4ediIB9acrzq7lcpAQmk4
	Lg1PvkTkwScciGKZ5UcMKelgN9UBZojaszE0DAJtmNxGYfDark0FRe2Qk76fVLHivaivA47v1y4
	10xh0N6ffjZBFDvd+MjuNz0TUh96YKE0JahYaHANVgvtc8r8yaAT2c1x0r6ZRaRSLQlKn8pVMKp
	Ll5fdLG3ZhKJU7o2REfgG4dIEZvxg4M2cin+kUQrpG2ds8yf9busZ7hA5/sctGsudx2yoIRS706
	ajr
X-Received: by 2002:a05:600c:1d1a:b0:492:425b:c773 with SMTP id 5b1f17b1804b1-4924908abfbmr146670335e9.10.1782140293588;
        Mon, 22 Jun 2026 07:58:13 -0700 (PDT)
Received: from localhost (2a01cb001331aa00ae343d7f26e6048e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:ae34:3d7f:26e6:48e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221de7sm26148666f8f.33.2026.06.22.07.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:58:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 16:58:12 +0200
Message-Id: <DJFO0C5H4J4B.2E5D9ZA8FAU4F@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] gnutls: set status for
 CVE-2026-3832
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260613102520.3703528-1-sudumbha@cisco.com>
In-Reply-To: <20260613102520.3703528-1-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 14:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239305

On Sat Jun 13, 2026 at 12:25 PM CEST, Sudhir Dumbhare via lists.openembedde=
d.org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> Analysis:
>   - CVE-2026-3832 affects GnuTLS OCSP multi-record response handling.
>   - The vulnerable OCSP response handling code was introduced in GnuTLS 3=
.8.8.
>   - This vulnerable code is not present in the current GnuTLS 3.8.4.
>   - Hence ignoring the CVE for this version.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-3832
> https://security-tracker.debian.org/tracker/CVE-2026-3832
> https://gitlab.com/gnutls/gnutls/-/issues/1801
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---

I think the CVE applies to wrynose. Can you send a fix there, and then,
ping back here?

Thanks!

>  meta/recipes-support/gnutls/gnutls_3.8.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.4.bb
> index ccb6a2b4b2..6d43c58df2 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> @@ -124,3 +124,5 @@ pkg_postinst_ontarget:${PN}-fips () {
>          ${bindir}/fipshmac ${libdir}/libhogweed.so.6.* > ${libdir}/.libh=
ogweed.so.6.hmac
>      fi
>  }
> +
> +CVE_STATUS[CVE-2026-3832] =3D "fixed-version: vulnerable multi-record OC=
SP response handling was introduced in 3.8.8 and is not present in 3.8.4"


--=20
Yoann Congal
Smile ECS



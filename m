Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440B8C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:19:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8462.1788340741225813280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aoMPW4xV;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482e067e908so743147f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 02:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788340739; x=1788945539; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oU2me2TBGQTpW4Nda/pXuSdyZR4QJdXzULD8a58zGOY=;
        b=aoMPW4xVeHtsNk23IaYDZ0g4IVzKqW5psMBP26D0oHocG069fEOV803QkTo0kC9Xkf
         210ZEkAZHZ0ulW8UMy0dL57Ryd3HttK6KP4p2uTrf0tjuMu7QN4hQhVZOtAkiIO8mcE6
         nZd1BpHqBZNuIf2NmQTGx+zOeewYyrY98tmTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788340739; x=1788945539;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oU2me2TBGQTpW4Nda/pXuSdyZR4QJdXzULD8a58zGOY=;
        b=l46nE6O9+P35xXIEceJbRjfmWmpwL0/4adl7zmjQi6Iikwsi53FEiVXoZg32Sd4mq6
         h4No14Fz3ly+vByUGvAyYEcYnGBEmUEsF31w5OzpSfNkRzneFGFqJ/GmGZs1te9Y14Qt
         Vnm0IKc7U2TbMbq4d5SDKTVT6yxtlhMO98htDIpgsFzrWxmw7DR9CoJDrx7EAwKV+ml8
         SHti32p/xZAOnsYRsWrZHd7WDfP3gfFmCBEF7+okWNMnjGBGeJ7TGLeg79ooG59KNL25
         GxdfZYOAIFT+bC67gIogm3UpCG/p22EwLvvTqSbYCpSfwDpwBp3S7V62QQe4m4hHADdh
         x4fg==
X-Forwarded-Encrypted: i=1; AKwUvBxfhjNPZAuDBVE5roneMsmkE+Qsmbel3Qf8G8QoKV4Ch1RrW275TrCzST/SVSR84mkALshwJboaWRxvi+naDtTgaw==@lists.openembedded.org
X-Gm-Message-State: AFuF++kUb76uRTm6rDWohEfwgEjiIEdDYKDYbzCEj4g1jaBnxgVwEEky
	py8eZd0Uz+KQa0c8JxAei/O717h59uT4V1fWGn4V86Nrf7HiyTJMYhCLgoUCtdfLvXI=
X-Gm-Gg: AYBFou2oprgZvbMI2Z/xcEAh1PZ9TqQRM+VwcW4AwJPg7TOL3AzvCOi7ALNrpkJ6YRO
	tIfNDcXqN0ikLlhmdgwmOr+EFx+Cij+KwYP7dzHzjS/71872temOpWzxn9g7Ni/fys73Za/S0rp
	Uzn7wq+hPxIuem9kWeN6VdYIIVQNE0jWb0cCpxPFZJrZcrknztN9W1/IOiaCVFDHu09KssaRcUh
	vvQic4KmIFJj3XRPdrGMpQ4QD8kAXfH3qX4XwfaXsQ9IsRki7olwxycxsezlfQ2b7ihA5DNRDjP
	iZ3tbDLi0bV+1TQP9FLXxLt+GW6A5+sI/ZcwJ2lWTIcm4nlrdvlA4AkcUW1Yd1nKCixD8EHxFmR
	g9InpTirVLiCSOCU/euzTqo40O1akQPJZf5aIc9cFTS7aRnAeK8t9H0z71kGiBj/nO7MvlyYVe0
	YvwKmrrPTxLatUUqS1u3HJRTIPOXOxOyK2JaVMn6w5l9RNQysBcCaT1XkeGWuykjIDxwtE3c97o
	l2007zd/zsuqrMtoj6dlB3P1SprsgblrgTGM0Z8SFc1anWd3bewuTIJIzHX
X-Received: by 2002:a05:6000:4208:b0:484:3315:1a37 with SMTP id ffacd0b85a97d-48488f223eamr6459025f8f.27.1788340739290;
        Wed, 02 Sep 2026 02:18:59 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ee9cf7sm5295342f8f.25.2026.09.02.02.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 02:18:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 11:18:58 +0200
Message-Id: <DL4PVTP9830X.2T1UL0PBOMPPF@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] libarchive: mark CVE-2026-14164 as
 not-applicable-platform
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <paul@pbarker.dev>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260817105942.2295192-1-daniel.turull@ericsson.com>
In-Reply-To: <20260817105942.2295192-1-daniel.turull@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244907

On Mon Aug 17, 2026 at 12:59 PM CEST, Daniel Turull via lists.openembedded.=
org wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> - The RAR5 double-free in init_unpack() is a regression introduced
>   upstream by commit 620bdafa on 2026-05-16 and existed only
>   on the git master branch until it was fixed by PR #3071 (commit
>   1c914cdf) on 2026-05-24. It was never part of an upstream release.
> - The upstream release tarballs (3.6.x/3.7.x/3.8.6) use the older
>   init_unpack() with unchecked calloc and no early-return path, so the
>   freed window_buf/filtered_buf pointers are never left dangling and the
>   double-free cannot occur.
>
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-14164
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/recipes-extended/libarchive/libarchive_3.8.7.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/=
recipes-extended/libarchive/libarchive_3.8.7.bb
> index e8c3a3bfe3..0926acd8f9 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
> @@ -92,3 +92,7 @@ RDEPENDS:${PN}-ptest +=3D "bsdtar bsdcpio"
>  CVE_STATUS[CVE-2026-4426] =3D "fixed-version: fixed since 3.8.7"
>  CVE_STATUS[CVE-2026-5121] =3D "fixed-version: fixed since 3.8.7"
>  CVE_STATUS[CVE-2026-5745] =3D "fixed-version: fixed since 3.8.6"
> +CVE_STATUS[CVE-2026-14164] =3D "not-applicable-platform: Double-free reg=
ression in the RAR5\
> + reader's init_unpack() was introduced upstream by commit 620bdafa (2026=
-05-16) and existed\
> + only on the git master branch until the fix in PR #3071 (commit 1c914cd=
f, 2026-05-24). It was\
> + never part of an upstream release tarball."

Hello,

I don't think not-applicable-platform is the right flag for this
CVE_STATUS. See cve-check-map.conf[0]:
> [not-applicable-platform] use when vulnerability affects other platform (=
e.g. Windows or Debian)

How about "fixed-version"?

Regards,

[0]: https://git.openembedded.org/openembedded-core/tree/meta/conf/cve-chec=
k-map.conf?h=3Dwrynose
--=20
Yoann Congal
Smile ECS



Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B4A104891E
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 21:52:45 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.107781.1772229158526669161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 13:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=c0b7JIjt;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso20007315e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 13:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772229157; x=1772833957; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oeXi6cRJRNYGsv8/oqxftV9oFdVp1kdH0nulS4ZjuA=;
        b=c0b7JIjtBYm/6VpUJkJVVLOz0BZiLGjip0VGshL1kMxYtdVeMytsFlCNJyVkjxf979
         PEY+kh8Tw8RrScK4R362Ti9X596NIQpJuo14N7V5V+xn+e5a7YUUKs+6Ja4eX2fEKeOe
         fURpPKs9Q1wfG540UbSKdmfbQa9owa4vt0uzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229157; x=1772833957;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3oeXi6cRJRNYGsv8/oqxftV9oFdVp1kdH0nulS4ZjuA=;
        b=q/mVsicI+yVdYD/I6U4BChkuMhT/2jydynBRQOGGy/Vk1xwsJm0h59efvI6m67GeYd
         RwHpjIpycNGlKeqpn9aoRuTtcoaDelkEbzecUR5k8R+VPlyvGeGlPynf2wDzNGoFiYwC
         q3NRfS3iklMO9a1lUH8QZSYYTZ/Qd70MRz286S0cJ+M+FXrs4Vd6cmbOce8aYlfoavSt
         ziFT58+RcjJngNGqFfhtWCsbJaQwskWqu7smiGc3xsylnQBVC4XUeBIibvuDKqFtjEj5
         XNHLq94QW2rJNRjM62PL51rUNs1ixuWKoc36O9O7Y7zT3DmxfUMZrfsvxHja6ClrAQm6
         IlTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy2oda9JgV/B5YBFnSlAj8Y5jDhzRj7JBdyWIR0v8EKtdCv1Q0LmxgqsLsCx8nYN5cmWc7AW7URfj6x2OdpxZOzQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwuttlfyPpWAv17KteVglmlwPNPDL1fp8rQ6/cfzeVVp8q4ejEu
	plPD2J/4BdZMRwRAlGnthSnWwyVYdUZxQYcg2+FLR6mRU9RgicGAVNZ7HM2AlgMqJHQ=
X-Gm-Gg: ATEYQzwB9l/TyuFdR/T/N76S00EpQXFmQZb8hKHciC6JoidP6ARphxu2mEoGLK8yia/
	veFCjsfUtkMOcQIuPg2iF6ToP52nK+pcQDZpcKJh/8JEimrcPK6cBmfd6x0Q+vCpZUNnt+gd+5+
	Pq9VDK3G0tkqy2zJKljoBQeCwt8t0hfdyxM1qjTfP7v+RMKa+ftieQqsqOkN8FBvK337I529PTw
	hU3bDOoK/pSexHW2+TfFzPJlHrE71WkZOF3kaSBTCAe1HsHZVA1dFUGSpbq8BaP0suEi93RPWNX
	NSNlGGMn+vzrBFJ3FO1eJQr1QdhAkk4ZHT5092tK0HirfpWU2BfZjyjb2BpWVBfAtw5ZZVlofQA
	ntND5r7b8/69lttNaZjlA86hbAck2nNmo4uJr7CXQun6EFVAbwLnKLGBLiJkQ3wukkpk8KzfNxM
	qYJYdcA0NQwpcr5vVp2zSGHPjn2etV/65980vZ9/1Ak8y/qtl3mC286KG9Ndv0ONJPZparUspj7
	3onAkAbhX3YuZZfBFHI0oXC2c4=
X-Received: by 2002:a05:600c:4f07:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-483c9bb1d2cmr63887605e9.6.1772229156785;
        Fri, 27 Feb 2026 13:52:36 -0800 (PST)
Received: from localhost (2a01cb001331aa0054865075f82f42ae.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:5486:5075:f82f:42ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c7657c7sm10126279f8f.28.2026.02.27.13.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 13:52:36 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 22:52:35 +0100
Message-Id: <DGQ2SYPAGFDN.MW7TC3XUQ8WX@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v1] libevent: merge duplicate
 inherit statements
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <pratik.farkase@ericsson.com>
To: <pratik.farkase@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260209124253.55440-1-pratik.farkase@est.tech>
In-Reply-To: <20260209124253.55440-1-pratik.farkase@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 21:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232116

Hello,

On Mon Feb 9, 2026 at 1:42 PM CET, Pratik Farkase via lists.openembedded.or=
g wrote:
> Merge the separate inherit statements into a single one for
> improved readability and consistency with OE style.
>
> No functional change intended.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

Sorry, but we ultimately did not take this patch for stable inclusion:
This is only a cleanup and there is little to no advantage to merge
this.

Regards,
> ---
>  meta/recipes-support/libevent/libevent_2.1.12.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/reci=
pes-support/libevent/libevent_2.1.12.bb
> index 25388fb4d7..58502edc32 100644
> --- a/meta/recipes-support/libevent/libevent_2.1.12.bb
> +++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
> @@ -28,13 +28,11 @@ S =3D "${WORKDIR}/${BPN}-${PV}-stable"
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
> =20
> -inherit autotools github-releases
> +inherit autotools github-releases ptest multilib_header
> =20
>  # Needed for Debian packaging
>  LEAD_SONAME =3D "libevent-2.1.so"
> =20
> -inherit ptest multilib_header
> -
>  DEPENDS =3D "zlib"
> =20
>  PACKAGES_DYNAMIC =3D "^${PN}-.*$"
--=20
Yoann Congal
Smile ECS



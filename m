Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6397BC624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:53:05 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4233.1788429183049544475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mvVSRsLx;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so23828305e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 02:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788429181; x=1789033981; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQaoNK+NZJcAcqBfBpge8XMDNLOnEeuEatJk/YQVNDc=;
        b=mvVSRsLxvqiS+noyxvMcWEY0Swhm5pQP1Ch8RTWfLXyABm3yyPje4vyP/hPnmyt3ZT
         QYPuRWpsgpsyHyM6RZzIAO7oaWlHA2eTUOhIb3PwQ30LvAGvK5tz//uVT0iG0lSDe5vN
         DktOgRcUXuvvLPlI3jRs9+yN3VQR1OdxLHtok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429181; x=1789033981;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQaoNK+NZJcAcqBfBpge8XMDNLOnEeuEatJk/YQVNDc=;
        b=PqDa4i2+/LJgvurKsbcx/6UUlCYUEzTisc1Wi3CQWo534oAKjmREaD0l4TH/7Zgbi3
         vUTTkZH2QTCm6hxwB9NB/ZpkNNmnfUC+9N/esZy8QWe33L4tFYIYR3+uDwx3fWHJ1UQU
         ZRTHNM5BCMSwkfYpmFSMkg8eaR495Ct31CK46SaHYil3/cu0QTwIUe0yqSUOA3pq94ZV
         osmnlydgpIk1Wp5pZ8ex5370lxF1S8cc0WPA8tZopGi0QWWo+XPkvrBEqgk7QsufkYz4
         PNw4KVi7OSZCgChCUJ0SsT6JX1qBxwGwyQ6JJ/m/lQ0BhaFFsxRLh6DF3v+iZCrwiXae
         vxbw==
X-Forwarded-Encrypted: i=1; AKwUvBxU1RPgZGO4zVj64k5ymc1Lp2KnqyM9fTjUY9Q1yXFGRM8KSbzxPuFAZo9Ghbwsd68WWN8mVoD/xLb1QjxFrh7YFQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++mazffZEu2N1oqfnySbarkGLENoLhpF2BHEvfZJ9YwXmAd9F204
	WPrTM57soAyII+ZQiam6DSCc1YK0LBcs7LQYBOUHpXcXM3uoNIuEA5pknl4J+rpwn/o=
X-Gm-Gg: AYBFou1Jkv048Lt7xG0GQVAt56IsgDhIvsw2Mug2W91NIQVp92X1UELwpIyOf1+xzwd
	Ys/63TAQUNe3aR9n2s4m3AmJuCcESkm6ndz66fgvLIcpWGFh8xkEdg0sz1ePV3oayzzTf26ZKZv
	R4k1v3tRj7xIWowIMfxsOhOv/5mzRoV1dAjzGWNdf4gsNlX8kXENV3iEK06qWUENTwZ5wHQWzLj
	hCrpdngwpeHlP3sMxJtWl2Q6ALOfg4833kRIBf6nOwf9wgKuyuzl/u2bBlz38l3XhQCRdoyRaNG
	ohdhdUhiTgxENWcb4iGg4G4OvpamNevisTjisnT7ZlDswe9rluOn71w13kBVyFXyOPh/2XOZ/jO
	F95T/N/KaIzfR0zcQCkTQbhDIUXFhoMe5LvESrEbs7StF3AEkcafCETER3I+15pshc9pBKaVRUb
	a38+jddzkwM6oGloSkiudoQPI4aCd9se2iF44zqa24W/BXGGTMn41EYjnZnyrl+9MaYDKnMAd1Z
	OozaKc69hc2oAb6VrWrmtoZru7lMSL8pnp6gsZgNFddkjzYWNGQsOgjl654Lw==
X-Received: by 2002:a05:600c:530e:b0:49c:d618:e341 with SMTP id 5b1f17b1804b1-49ce584bb4amr217603165e9.14.1788429181185;
        Thu, 03 Sep 2026 02:53:01 -0700 (PDT)
Received: from localhost (2a01cb001331aa00939d825f00cb3861.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:939d:825f:cb:3861])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf2abe1basm27534965e9.10.2026.09.03.02.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:53:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 11:53:00 +0200
Message-Id: <DL5L8F9SYPOM.1BPAKA4Y9B8LB@smile.fr>
To: <sumanth.gavini@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v18 06/16] rpm: 4.20.1 -> 6.0.2
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
 <mattware@cisco.com>, <esparlin@cisco.com>, <peter.marko@siemens.com>,
 <randy.macleod@windriver.com>
X-Mailer: aerc 0.20.0
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
 <20260826214548.3002838-7-sumanth.gavini@windriver.com>
In-Reply-To: <20260826214548.3002838-7-sumanth.gavini@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 09:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245021

Hello,

On Wed Aug 26, 2026 at 11:45 PM CEST, Sumanth Gavini via lists.openembedded=
.org wrote:
> * Add a tag to SRC_URI so that there will be errors when only change the
> filename during upgrade it, as suggested by Alexander.
  ^ this part of the commit message does not match the code below:=20
[...]
> diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devto=
ols/rpm/rpm_6.0.2.bb
> similarity index 96%
> rename from meta/recipes-devtools/rpm/rpm_4.20.1.bb
> rename to meta/recipes-devtools/rpm/rpm_6.0.2.bb
> index 17e75c3e14..e8977aa31a 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
> @@ -24,7 +24,7 @@ HOMEPAGE =3D "http://www.rpm.org"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D066ecde17828e5c8911ec9eae8be7=
8f4"
> =20
> -SRC_URI =3D "git://github.com/rpm-software-management/rpm;branch=3Drpm-4=
.20.x;protocol=3Dhttps \
> +SRC_URI =3D "git://github.com/rpm-software-management/rpm;branch=3Drpm-6=
.0.x;protocol=3Dhttps \
                                                           ^ not "tag=3D...=
"
>             file://0001-Do-not-add-an-unsatisfiable-dependency-when-build=
ing.patch \
>             file://0001-Do-not-read-config-files-from-HOME.patch \
>             file://0001-When-cross-installing-execute-package-scriptlets-=
wit.patch \

As discussed during the patch review call, Richard will most likely
merge this with a commit message tweak.
Maybe consider sending the tag=3D addition as a followup patch.

Thanks!
--=20
Yoann Congal
Smile ECS



Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77137E9D409
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:18:58 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24368.1770221930313742914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 08:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m+/IlyP8;
 spf=pass (domain: smile.fr, ip: 209.85.218.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8ea3d15580so121440166b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 08:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770221929; x=1770826729; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XD4McmMiEMpXaHA1YpaLNyHmBukPbBpq1nc50jEm+SA=;
        b=m+/IlyP8U0u1/NAOiS55qdSEQajVsqomq71m1UchkyWrqCJ7giXn+np8oFuAdZYrrY
         XIRCqDRk/CQ78VFewUVVMRDP4qUIMksMHSppEPFVCdrkJT+WpnMYbHZh+DTEDYtdxaHw
         J29/GyHUNJbtc9LAcgrbhNzOf1kNLKK8jBXtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770221929; x=1770826729;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XD4McmMiEMpXaHA1YpaLNyHmBukPbBpq1nc50jEm+SA=;
        b=FTu+KAzwSIiFjKHtEdZpnANvgAoTgZogVQ3OoLoNCb3Z5wZF4/DNXzkV7wGgEQ6W3H
         wSLoNPkQ+6n1q6NWJwS94zYVHtvDnIy1/OMle3sbmu0bJSUXgWYLvUE11dJPnDIMF9u5
         u1O8Cc0ZgsJg7X9IeAIceAuytTpWLbBgR9x0bQsTzpzU2S3qK7WJA54TL2P2mqzYMZx2
         VrVHX6McCO3ufi/4j8b3R/KObqgtPhY5If9ou66haTXGH4RNfv5aMBBYz7+Ba5LId1zN
         s6LaIle2AOx1M7KJm42RM9J4zfbp0OWCWAth92fwSDKGtmiHw8xcGQPBUt84tD/DF1Gb
         GJNg==
X-Forwarded-Encrypted: i=1; AJvYcCX5GiyJwnPIui91ahzYD0TIQwUQ2wiMO2rED7Rg781ybzd1DWoCAhTHmoIdkrqmQTPBsEAZNJ+jy3g5C8s0kOiXPg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwicyU5Be9KkKr1imNJuiLUuc5MQMaFtW3XY9oQdrjViscDjb3n
	t1SvZwoJXLbkZApA26zgP2F6ZCzkD9HEpwMS6FTN0kgOaC9GcDQZNzxXtibqBgBjk3g=
X-Gm-Gg: AZuq6aLX6Qd1mITrLoKYddNPRrNZ1LS3+HeA8CrJenKvrPbsFs76CsJhwHFuVOKTmx7
	gQ7Q7vGoYTYTDOTOLOtILflC7exneooWfM/NTtea0Htv7ZXByPfpCr87b6UUgyBK6FtBQe2kXOH
	ilTHVzMuJpSoaOmRMUz7kTnzwmfQuCYwqIf8tDkvGBqtbuBV2UgZv+XESlcSygUEdAVIY9tTgHg
	9HJqjlSeI5NTsx4koCPUWdpAE0z0srCIplUzpv6u8HjgXTWHCS2If+42cNOC5I/HAV+scAWFtPB
	FHdvM57cnTtcfk+kVDvRWP5ND8OTYWcgUXyC9eOtRd8X/le9H+xkPtsvCB3bN1hZUi6uqzuDeeR
	vhiq36vzh+5BZNOmR3vKyOjtEXBUoZC7gPnvt6NUY7NgRXEuUxgRwm2EYzdzmvind8J5fJga4o2
	O3fTWsWFlxNuSJhYs70+8Pv5H+bFCJ6uOytkzZ+SAvY5W/xvokWRAfQ/VoPqnlu2OOs6/FGxFkk
	zw=
X-Received: by 2002:a17:907:e84a:b0:b88:4efd:6cbf with SMTP id a640c23a62f3a-b8e9ef220bemr244967866b.12.1770221928479;
        Wed, 04 Feb 2026 08:18:48 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0044a09sm134915466b.56.2026.02.04.08.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:18:48 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 17:18:47 +0100
Message-Id: <DG6BAUTW3L85.3TDKYV5M7DWIO@smile.fr>
Subject: Re: [OE-core][PATCH] libxml2: add follow-up patch for CVE-2026-0992
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260131145137.3770911-1-peter.marko@siemens.com>
In-Reply-To: <20260131145137.3770911-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 16:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230551

On Sat Jan 31, 2026 at 3:51 PM CET, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> References:
> * https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
> * https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/377
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  ...2026-0992.patch =3D> CVE-2026-0992-01.patch} |   0
>  .../libxml/libxml2/CVE-2026-0992-02.patch     | 336 ++++++++++++++++++
>  .../libxml/libxml2/CVE-2026-0992-03.patch     |  33 ++
>  meta/recipes-core/libxml/libxml2_2.15.1.bb    |   4 +-
>  4 files changed, 372 insertions(+), 1 deletion(-)
>  rename meta/recipes-core/libxml/libxml2/{CVE-2026-0992.patch =3D> CVE-20=
26-0992-01.patch} (100%)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.pat=
ch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.pat=
ch

Note to the master review team: I have related CVE fixing patches queued
for whinlatter and scarthgap.
This patch is currently in contrib/mathieu/master-next-success.
--=20
Yoann Congal
Smile ECS



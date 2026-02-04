Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0575DE95379
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 10:53:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17877.1770202435748925419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 02:53:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WQBUQhIb;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so4274068f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 02:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770202434; x=1770807234; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+DRbWH7f+YQbQzOtSUeRIw79UsshSeOAJpjLQDD93E=;
        b=WQBUQhIbll66+csi707VxWO6FDS37t26fiE4+XBaemWq6ig6fBbChE+ACtGw5ba/Pf
         9TqJaD79raL7Rs4ohcmFpLOch2mYBr7wg6SSkHxd+Op4o9j1ovYspLXomwENhWUggk9Z
         DJVdX9wA9+P+PyjTap1x8uTX5tluitZJRg5WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770202434; x=1770807234;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+DRbWH7f+YQbQzOtSUeRIw79UsshSeOAJpjLQDD93E=;
        b=cW1NLsYinHFO0SwqIFprjwiWKWhKnTryMh8EwXcptXtCc3TO++0za011n8BKtQ1ca3
         IFx6cfOiHAvS+7XmRBkYx7RqX/6eZFhhxLrOgpgPTy4M5cMDIaiMRfFVUgyVjVEJo+UE
         s7+KwPrLYfZdAl0En+aKcFvmM6Dt0dUYDZfyRyOQJPt09B6km8f5vHxd5ZQU6vQtyLCB
         eV2h36vlb8zvL8ojD4lhnWccSutWDjBsRQD+1Q81F7LZ1IOCPs3KJuyRBEMMf4rG08ct
         Ja1o6DvvTkrBDBjZtteaauUc5ryhzrMXnAXP5QAiYIS/iJLvKorOf4qstkUWkW/0NLPP
         4qmw==
X-Forwarded-Encrypted: i=1; AJvYcCVGayzaMQpVH3Lx9h8ZDfGnG7oZUHVxAZHQbPV5VWcAKP9PlH70C/vg42fu4Quy/3nMlGkxzNbeUwJMTZeSg29AKA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNutIwu5Pn7BIpHtXcDI/6YiPUULXMNfsa8pDq/lc9oBjizdgX
	vS9SEtZdOfbffHazx5iV2tfRwrhC2UpdRQD6RA1ntH1c3j0PUSS6gQgizlTY43h4Yd8=
X-Gm-Gg: AZuq6aKgh0kLuKefa7FT0Fj7BGvM0GTAl+VFyI2qRnvMJ//8Wi5S5zoRp3L5WwysCnM
	h4zqQ+6lk3eikJl/pdrczaXOctmQ6W1nXwk8OZmqxCYHsq4+u8WnRcA2oyQFxGVD5odoQk34zxG
	xg+Mx/9x+csfP5lWKG8Zrd/MSZoqpbGRcROC8vQGn59ZaEKduLVpxkuCQ4kgwaSPw8wE3ZNGsxE
	pCk/N5TTYTMTzKTvZYdJ+b/elu1t3T/lRgsIbza/p/MS5X16utJRzKYHcv4yYScxQCPNkb4KnSG
	MHZ3XAT2ksHTd2SPkx+avQPG7VMN6OqDLQunCM8jYasub+H9nIdP+fyHhVdSluIxf+PhR/sw/Xd
	lcUbcZ90XmTZ3a1XakQNjb7psZtmUXKrt0MySLZOrnfYYgYaN8+ZJvHqgt7wBJudZISqHeI5Qgy
	9pgIYCh71Br5y4v8Cy+j0ShehJ2D3yG1vheS+LBZaodexjTj6zLJsL7x6xr4LwzSbRuvrVXBZsj
	vU=
X-Received: by 2002:a05:6000:428a:b0:435:95ce:84cd with SMTP id ffacd0b85a97d-4361805db71mr3635971f8f.54.1770202434030;
        Wed, 04 Feb 2026 02:53:54 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805faf7sm5439445f8f.30.2026.02.04.02.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 02:53:53 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 11:53:53 +0100
Message-Id: <DG64E3A1Z773.2J4Y398TR4E3C@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-68468
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260123103715.32186-1-amaury.couderc@est.tech>
In-Reply-To: <20260123103715.32186-1-amaury.couderc@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 10:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230508

On Fri Jan 23, 2026 at 11:36 AM CET, Amaury Couderc via lists.openembedded.=
org wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> avahi: fix DoS bug by removing incorrect assertion
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  2 +-
>  .../avahi/files/CVE-2025-68468.patch          | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.=
patch

Hello,

If I'm not mistaken, this patch does not have a master equivalent.
Please fix CVE-2025-68468 on master and whinlatter (by upgrade or patch)
and, then, request a backport scarthgap.

Regards,

>
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
> index ffda85c0e7..8f8f4a0d88 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> @@ -37,6 +37,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-$=
{PV}.tar.gz \
>             file://CVE-2023-38473.patch \
>             file://CVE-2024-52616.patch \
>             file://CVE-2024-52615.patch \
> +           file://CVE-2025-68468.patch \
>             "
> =20
>  GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
> new file mode 100644
> index 0000000000..3635cc8d53
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
> @@ -0,0 +1,32 @@
> +From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
> +From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
> +Date: Sun, 2 Mar 2025 18:06:24 +0100
> +Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
> +
> +Closes https://github.com/avahi/avahi/issues/683
> +
> +CVE: CVE-2025-68468
> +
> +Upstream-Status: Backport
> +[https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b672401=
79d309a]
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + avahi-core/browse.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/avahi-core/browse.c b/avahi-core/browse.c
> +index 86e4432..79595fe 100644
> +--- a/avahi-core/browse.c
> ++++ b/avahi-core/browse.c
> +@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
> +                 lookup_drop_cname(l, interface, protocol, 0, r);
> +             else {
> +                 /* It's a normal record, so let's call the user callbac=
k */
> +-                assert(avahi_key_equal(b->key, l->key));
> +=20
> +                 b->callback(b, interface, protocol, event, r, flags, b-=
>userdata);
> +             }
> +--=20
> +2.43.0
> +


--=20
Yoann Congal
Smile ECS



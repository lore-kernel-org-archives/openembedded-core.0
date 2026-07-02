Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7238BC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 09:26:19 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65555.1782984368875939391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 02:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WNXnPsJP;
 spf=pass (domain: smile.fr, ip: 209.85.218.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1268f71572so52585266b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782984367; x=1783589167; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oleV3lUGgvOXOZteyGBWzbikUJxz4v3AeK586ioKciE=;
        b=WNXnPsJPaCi0adWuo4uWYiFKBqF9zzcJ3NRQns7zDqKpt0u6DhBe7Uj9W28OJL8meh
         Xn5WpY0PNGLJAcpDekfJGWKx868iFGuzm9ORTA9DFbf+bah0E2EKwwyzYaHOLJFkEJXm
         UEfwCNjUjBVqAPkz10RjWEMRQt6e3K51Hxbm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984367; x=1783589167;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oleV3lUGgvOXOZteyGBWzbikUJxz4v3AeK586ioKciE=;
        b=WCgsLH0rgT/sgT4DJ65pA0Q2/pt5bS0CseHnk+xP44tyRYCklL7EjUPk6nUT1uOVN3
         mf+DyhVZnDV5eJDkNcGqbam0e/zZ7jIu6amSbj5QntAJZiSEVrAc9Qvzj0C/nmu8Nm+1
         xJWCh+IK9Xtcr+0PvNMCgmrjSbof8NH4462YeAuTta9IRDvBsXYRBo2zEM4UGVSGtT7r
         7+T+GMpiLt6UOtrEuYV49XvyeW9rvyLz6R9J1axEIljClMgkm/OvF5Js9Jye9aUwlbWb
         RB122ph9idegl9XIfcdDHaAKWSEktM04MV7SwmL8byI2qroZNGR0QInLjhtFutAckrXj
         pPjA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3eMDBj6Dyuib1PgnJVh5Z0pDh3O6ZYxS5Yh9ikestGyi7CO6Ts+BJHUhd2sufaFFHA7UnBymVhc9tEYI0ywQMng==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzC1oKafhkf2Z74KGT6fuv27qfdzcq3j30aB1xCAAFSMGJ8cWZ
	+dyo/0pNyV8eJVU7YM9OU0DrPVCup7war9+KCIXu1Xq0UEBOYl0RoKiA7TZLV7IITvQ=
X-Gm-Gg: AfdE7clp7GY/PrYRhrU2D6GYa++Z+67yS5Lx7sX+Hg27QiAJfPPQgBs6XFQ9W821eeC
	USSZjMKLQ13yOHH9UHs8Xv0dW2HuFrYCVKCbhAkJylMA3F+F6dWombiecB9YkcVC2ePsx7yZrTD
	funxAbEJx9oh7D7lybUTIg/rukXOr5ZRR9/tV9NO2MPGmZvH91oOa32mbpJQ+1yXnUSZnoVU354
	uJ5WkKAg9x27/pZdeEsf++snWaxyLe2L3A3qXnuQJz90kGTFKYaknrRQsk3ciKkZ5LubcWEe9wj
	oRvQQDl7G9VuHjHKkMNHWfe0yhJ/05JlGdWM1mYIRZ2iJyL1pT2vdBkN0u6i5kVGan3kkhBXjsM
	UqoDu7O2QSUSoA09gMWcCAgg2SzW/4+arIkdwUZu022ztj3n5LCx+oy9CqQnMsOK4nzWofzvUzY
	BvI8fP1sZBdD90PPpzcqQMOU37Vu7QDmrV/AmVplv7vqNeuKu+uV+M0tayehpPuzDS5//3v23HN
	W+2tQ==
X-Received: by 2002:a17:907:c50e:b0:c12:a556:6713 with SMTP id a640c23a62f3a-c12a55673d2mr252873466b.31.1782984367044;
        Thu, 02 Jul 2026 02:26:07 -0700 (PDT)
Received: from localhost (2a01cb001331aa00c56cc01f8c3c1c95.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c56c:c01f:8c3c:1c95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091b60sm97161766b.14.2026.07.02.02.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:26:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 11:26:05 +0200
Message-Id: <DJNZ7HW9JULC.2NPED8271HJO6@smile.fr>
To: <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/8] gtk-doc: upgrade 1.35.1 -> 1.36.1
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Alexander Kanavin" <alex@linutronix.de>
X-Mailer: aerc 0.20.0
References: <20260627075532.3153679-1-alex.kanavin@gmail.com>
 <20260627075532.3153679-2-alex.kanavin@gmail.com>
In-Reply-To: <20260627075532.3153679-2-alex.kanavin@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 09:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240028

On Sat Jun 27, 2026 at 9:55 AM CEST, Alexander Kanavin via lists.openembedd=
ed.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> Convert to meson, remove autotools-specific tweaks and patches:
> - conditionaltests.patch adds an option already available in meson
> - 0001-Do-not-error-out-if-xsltproc-is-not-found.patch
> (see below).
>
> Add a patch to avoid unneeded check for runtime python
> module dependencies.
>
> Move dependencies needed to run gtk-doc to gtk-doc bbclass
> (so they aren't built and pulled in until actually needed).
>
> This allows dropping the 'working-scripts' logic in the recipe,
> except for xsltproc-native whose location is used during build.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-recipe/gtk-doc.bbclass           |  2 +-
>  ...t-error-out-if-xsltproc-is-not-found.patch | 28 -------------
>  ...code-paths-to-perl-python-in-scripts.patch |  2 +-
>  ...not-check-for-pygments-at-build-time.patch | 37 ++++++++++++++++
>  .../gtk-doc/files/conditionaltests.patch      | 42 -------------------
>  .../gtk-doc/files/no-clobber.patch            |  2 +-
>  .../gtk-doc/files/pkg-config-native.patch     |  2 +-
>  .../{gtk-doc_1.35.1.bb =3D> gtk-doc_1.36.1.bb}  | 33 ++++-----------
>  8 files changed, 49 insertions(+), 99 deletions(-)
>  delete mode 100644 meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-ou=
t-if-xsltproc-is-not-found.patch
>  create mode 100644 meta/recipes-gnome/gtk-doc/files/0001-meson.build-do-=
not-check-for-pygments-at-build-time.patch
>  delete mode 100644 meta/recipes-gnome/gtk-doc/files/conditionaltests.pat=
ch
>  rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.35.1.bb =3D> gtk-doc_1.36.1=
.bb} (51%)
>
> [...]
>
> diff --git a/meta/recipes-gnome/gtk-doc/files/0001-meson.build-do-not-che=
ck-for-pygments-at-build-time.patch b/meta/recipes-gnome/gtk-doc/files/0001=
-meson.build-do-not-check-for-pygments-at-build-time.patch
> new file mode 100644
> index 0000000000..045b7a74a9
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk-doc/files/0001-meson.build-do-not-check-for-=
pygments-at-build-time.patch
> @@ -0,0 +1,37 @@
> +From 80b4f8edc4273803a89d02bb6209734f7cfcce3e Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Sun, 21 Jun 2026 11:11:04 +0200
> +Subject: [PATCH] meson.build: do not check for python modules at build t=
ime
> +
> +pygments and parametrized are run-time dependencies, and should
> +not be enforced at build time as they are never actually used then.
> +
> +This is especially useful in cross-compilation, as the modules
> +are checked in the python installation on the build host, and that
> +has no relevance to the target environment that the build outputs
> +will be executed in.
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gtk-doc/-/mer=
ge_requests/105]
Hello,

I just noticed that this patch merged but was modified.

Can you refresh please?

Thanks! :)
--=20
Yoann Congal
Smile ECS



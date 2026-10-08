Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07234CA6007
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 10:27:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12218.1791455267376201064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 03:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pWCCJ0vP;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so28635375e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 03:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791455265; x=1792060065; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZgjUMDV6Y7NAo9OFYAVOp2tQw/GzEBPRbOgRYEp5mY=;
        b=pWCCJ0vPA0D3pe0yAqBwi7BI2/y/wgT4CjYpX2CTrs/89488ypqd+ZAwPNO2FtQZEy
         nz4k+4qnZ+XfTxVkfmY+raBzm36pMdxO2Tnyx3AfmcXjcDS7g9XiXh1oh0qmB4rbrQJe
         xxT/PjXz3AUfFL6vUmgDWFoS0oG8dlY78rKQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455265; x=1792060065;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uZgjUMDV6Y7NAo9OFYAVOp2tQw/GzEBPRbOgRYEp5mY=;
        b=fWMJHVVfrlzKAeY8rblUHtIeM2mo2pD175G9jJvvZCj0GBcGlZKfbItc0gG9NB6vd9
         ZmZmWCldUG4dwCsoxWZ0wGQDCdLwTjwuk9YzmVGR/e8gyP9E9Cd9/NtdW6BMKx701Gso
         r2qVJCSSjVe9vFmL5Av8FYo3PJQswnKQj0GeO359Yyj3tTnvN41l85iUtsqT8736vbCJ
         3DQGOGvhpG/TUADsifEZ6iphzCVXox+oaldSgalmKFPh0Wbmbr0qaAmuqdAaEsTVS8An
         22KckR2qn9CpvNN65qeXOxl3QfkbSbR/bzeIE0OIX6HxdLQXLxmZbCGEjFhgpRe1P1+T
         J3Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwGOvXAoGy7wNBR6jaEi6QT8F8IXNF2gDLHj5VvNDyHuN4oiOQrZ6Xeojrc+xif4R+qjhmi80OJKu0V4gnwvFW2bA==@lists.openembedded.org
X-Gm-Message-State: AFuF++msYvMxUUWKcTFEopNZmcJd3p/9ltUO0u0deLh7jkvSQEdGBo02
	9szOLkgwaU5Kc6zRxOYZvKbf5M9Q8lflnUhHcZIrtOWnLahrIpw28qhGVUF0h2MGbMw=
X-Gm-Gg: AYBFou0Z0Orb/iT8zMCTKxqKENpHUjAflThcel7aNhEUtOZg0Kr6TmQY559pQJzmsad
	6JC3ekgatA4dH9GIDB1YSjGFAPisAZGlWpQkyUKAShDUcoA6OayxutQ1fxVIykssHo8laLg6e02
	1AYxZ0MiBxYfJhLN7vQ11MfV009F9+LEUZAhLHb5pbYqOyTxjShIFIEzaz8r5C3nI80UR+kDplN
	lvoVjj/I5LnjIPkGMPj5oEzaNBVVxHiRc5d2SeH6GQi+BcqyjK5t+tM/yjUv9DQx6iQqrfD0o+3
	oWdQnQahNLm/UkmSM1ALhoCmgIfMBfMbnVudX9xEgyotUDrJ7LOrArkYEAXUlllKGLUbZpaHnbn
	8K5dJzB7/KXgO9+e6L7cmKgr3PoaJTWtWAnVmgxrcofh1tokFZk0HQV1sRUCZYwZgaMAKXDlluE
	gECfZLG+PNSaXAZgDh8FPftiyu6toO/ZvHcnmY4zHR0InOELlacCdHgF1W4/VEPfKiSGBfLLHC1
	Ve6tlBQDOfjcz8QzwT166yNvARhrct5R1v5T9n26oVJ2oOjcgTuVQkNQOGeYQ==
X-Received: by 2002:a05:600c:4e87:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-4a18045565cmr87772495e9.19.1791455265532;
        Thu, 08 Oct 2026 03:27:45 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4480a4sm102453685e9.0.2026.10.08.03.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 03:27:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Oct 2026 12:27:44 +0200
Message-Id: <DLZDW37D1K2V.84GGU5PC3QZN@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] weston: fix VNC backend build with
 aml 1.0
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <frieder.schrempf@kontron.de>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261008101805.2770110-1-frieder@fris.de>
In-Reply-To: <20261008101805.2770110-1-frieder@fris.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 10:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247426

On Thu Oct 8, 2026 at 12:18 PM CEST, Frieder Schrempf via lists.openembedde=
d.org wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> meta-oe's aml 1.0 installs aml1.pc, but weston 15 looks for aml 0.3.x, so
> enabling the vnc PACKAGECONFIG fails at configure time. Backport the aml
> part of the upstream fix from weston 16 and add aml to the vnc
> dependencies, as weston uses it directly.
>
> Tested by building weston with PACKAGECONFIG vnc for ARMv7.
>
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  .../weston/0001-backend-vnc-Use-aml-v1.patch  | 23 +++++++++++++++++++
>  .../recipes-graphics/wayland/weston_15.0.0.bb |  3 ++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/wayland/weston/0001-backend-vnc=
-Use-aml-v1.patch
>
> diff --git a/meta/recipes-graphics/wayland/weston/0001-backend-vnc-Use-am=
l-v1.patch b/meta/recipes-graphics/wayland/weston/0001-backend-vnc-Use-aml-=
v1.patch
> new file mode 100644
> index 0000000000..b767c9ac07
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston/0001-backend-vnc-Use-aml-v1.pa=
tch
> @@ -0,0 +1,23 @@
> +From: Frieder Schrempf <frieder.schrempf@kontron.de>
> +Subject: [PATCH] backend-vnc: Use aml v1
> +
> +aml 1.0 installs aml1.pc and neatvnc already uses it. Only the aml part
> +of the upstream commit is taken, as the rest needs Neat VNC 1.0.
> +
> +Upstream-Status: Backport [partial, https://gitlab.freedesktop.org/wayla=
nd/weston/-/commit/8a1c91e7]
> +---
Hello,

This patch lacks your signed-off-by.
Can you send a v2 with it?

The rest of the patch looks good at first glance.

Thanks!
--=20
Yoann Congal
Smile ECS



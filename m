Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E837BCA5FBE
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 10:47:07 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10564.1790765217713931802
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 03:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ceRKwCCM;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso38401685e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 03:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790765216; x=1791370016; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRFEWa6lkgf5HPeET42Y6Foo7xyRsmsFFL1XS0hNnxs=;
        b=ceRKwCCMkX+lAc7IW/HftGoZwCFGLI0Yp6T6gFEuBjdPsxZeKPMf/LDSNCCrB6kZG7
         D8wqcqo6aYE8KOOgX8dgyOK8WtuK0fD+NbrVfMsujuGeoK8JliHA7D2feFMETO2kzPcA
         cLYYdNPEC+x4VaMwAh9q/osinrcPk8VVKE6ZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765216; x=1791370016;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LRFEWa6lkgf5HPeET42Y6Foo7xyRsmsFFL1XS0hNnxs=;
        b=J5CWwQ1lvTXsvtAuOePpNaTdf2E71GsAiGm6Pie/4BEXkHns79J/wZyMJRC06DL8Ml
         Bm9G6BnRH9GcW7/BWZ19aGOIdyBormfnEfezh7ku5dLWUBY9mZlpJQD+2frbATK5gnzd
         C/XudkdaeJf+Z31XGmWDpdShaNmvPEbbtorPK2N9hphM1VJOlj6bqC/DQsgP5neXLgVR
         oKs3sRiEEIGQcJs+IJw4fQLRIuNhafDGMGw8XKdDkLfjCBTTmS+l6v9RbnbHXgLs3QFV
         5GP4dZ9oUKzJ8GZojAXLuauRg9AlbgUBN94maBuc13kxY3MC6w7UcMroto+uB9KfPkr8
         2EPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEvbABvklB68XwhmuFjaQ7Un8fxdSlmMiIyAWmxPpCyutNSv/USDfkGElfxg7N757IHBvrD1Szl3SUSOKunOiYHQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++knKua3GF+TIScGGKh5dfRrEwRYfed68o4Obtj6NLk4GWaJ7ZO4
	jyHxffS6P/y9fD7X8mSFiD2PT4wC9uJmPOOk3AF+3JbJ5UG0QuGsZqxS+6QV+XZa3ag=
X-Gm-Gg: AYBFou0n2QOcvjAkqOwp3+iBWsbrrZbwclpSN9ym+rRG3pKdxLkqxNVeaL/4i40Yg81
	4jkR2uxcxdGLXphSGlGy3OoWinYZ9C50N1vRdtfgtOpeh5Fgv2PnuoH6maFTUry2oJ6InPvDRhO
	vqwLEqRwgtBn2KbDMHKiwKpNGiMQZjNLtWU4Eq9t5wLL5Qah1WEaJsfHDMDECJtA/+XmypHr93e
	oiobpOHglTWE2zSsfMkafvqF+icfq7YvXEiBRtoXWQ2W19kXeE+g7ghfMvg9LZkNcqv/Nz6pI9n
	kTcFjqAvUsrfWXfN1yLDrNORt9shSjS6sR+YusrPP6xATH8dUNryltwzoV+1VW9KOIp5SVE8P6p
	uC8ewh7yE1BrXsSL6ys9YA5F0aFatGTjzSxpyaSEG5KzkuG8Fg3TD6+0sxbzWhpnpa0b0x4dHYN
	HQffXDknjMZ0s2OdN3kfa7G4+sGVwhDEbXE6DcoVHALmGLXNZVYNyJs4ZC/Ln5yVtzn3Ils/ecU
	5nz/nlchZdnn0/7YGZtwGnM47fP/bwg63REBZikHaopQmtiR9BvMxYJcesa2BpN+maaZQ==
X-Received: by 2002:a05:600c:3b99:b0:49d:1840:4fd2 with SMTP id 5b1f17b1804b1-4a01aff6a1bmr20673525e9.23.1790765215642;
        Wed, 30 Sep 2026 03:46:55 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174d886dsm52935635e9.1.2026.09.30.03.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:46:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 12:46:54 +0200
Message-Id: <DLSLAEQ18M21.2MXGOB4YKO212@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 1/2] dhcpcd: remove obsolete explicit
 debug packaging
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260914121121.81692-1-jaipaul.cheernam@est.tech>
 <20260914121121.81692-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20260914121121.81692-2-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 10:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246953

On Mon Sep 14, 2026 at 2:11 PM CEST, Jaipaul Cheernam via lists.openembedde=
d.org wrote:
> From: Ross Burton <ross.burton@arm.com>
>
> The .debug directories are packaged automatically by default, so this is
> redundant.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 8c3e8394c53581fd6b1d69669f6e0668c5af9d13)
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/rec=
ipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
> index eb257cb27c..065451c065 100644
> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
> @@ -67,5 +67,3 @@ do_install:append () {
>      chmod 700 ${D}${DBDIR}
>      chown dhcpcd:dhcpcd ${D}${DBDIR}
>  }
> -
> -FILES:${PN}-dbg +=3D "${libdir}/dhcpcd/dev/.debug"

Hello,

This is a cleanup and is not acceptable for merge into stable branches
per stable policy.

So, I did not take this one but I did take the following dhcpcd upgrade.

Thanks!
--=20
Yoann Congal
Smile ECS



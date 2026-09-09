Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ED2C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 17:00:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17727.1788973226356827141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 10:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FiJD+RG+;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso41452425e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 10:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788973224; x=1789578024; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3M1N8faazCgeg5/6csAoOtAaUcevU+K1zwrRYE0oMM=;
        b=FiJD+RG+pk3hNGCluwmQmdq9nmlEseRx3uir2rvUm05sfFDhFONcdRLiju7w9SgWc6
         vz45UWZ59xLBKBt4XsdXjzKmmlw1+0zocOpGlJeLYwBjI+GdwjRMF1NwPkudOdG7RLs8
         aFdEyU46Y9gU5G73ETI8cctP+3dkEwYQ8ZW6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973224; x=1789578024;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z3M1N8faazCgeg5/6csAoOtAaUcevU+K1zwrRYE0oMM=;
        b=bNWBiS8b+wcCzyUfG5MfJXxtJvt+A6tHgwScaOjP8QNT1Jmv+jyj7MDV2xCIPBLvIQ
         Q6EjxPwywXTfLwu/twCI6hwulQksT2ZrvsK/BHtwwr3XLCp5ou5BNHeCrFb19AAq07P+
         AU4psOPvWMP1eAqZoibB38TtlyHOvJpIpUzdP2lFFmZGlAHOjYAc70rz2HPVSRNIerbH
         Kw+RRmMoYJfTBPMn01J4cfd0PaiJJVJbm7xBHuPtjf699d25WEk82CCIHiHpLVUnSe1Y
         d51V7oImtrF39B5Z3y8BVjRTm/VlKcTGz3wCzmPypoSg5/bnLfgVHoFo9HhCq63BsTm3
         h1xg==
X-Forwarded-Encrypted: i=1; AKwUvBztDmaDwMbDc95mhmu1I+BnEJ61bWHfbXxXFfJwABKnLCKDEOmsdON7iiTfJUb5Qll+UMotwWZlg+Wqcndb72yrJg==@lists.openembedded.org
X-Gm-Message-State: AFuF++lxvl3Yycg+3PYGBjxsrplEjjZHV/xSiUE1AfqIziw2OGhgcnYw
	/bsf1hOZXGJf4Yyj2HTVvPHSVm0idHrpGnC0Eo/9L21mOslvjDrEPeLiht1QfXWbqJk=
X-Gm-Gg: AYBFou2RCBeiu8Ewp6iK7cfDQ2sJmvTR7bPsnQk0vB7OCCBuHejqj0MdxZbgNxWvNdC
	jo1x6JIKs+WIqwUZaG39XxN+FgsCOwlKbN25fnjl8A8K7qz6uqvz+UvSo1B/3t9LQ26z/uq/Riu
	oGNsKqgE5SybNjlxPg/HUZpfKufntI+Hx8qR1tlDG7dR7On3iimIhKkfYgotDuqb9aOIgYsPgAs
	u5+Iiadpg0t+cy5BV2M6LaHrYfYpCF6q5qNc1LHWdJUO1YLNFVv2FmTkf8XwEUrqZxYbQuPwaZQ
	WXG33vHfeA/YWGLqp/4plvLBPtyghrGchaxR4yBx4RDmfcQC9hYq2jcZEi2wklbh9EStqGIY+gX
	ek9V+KrrPndjVJBP/EFfKJWKcO/JrIxzfJXIQgoR7Pf5/2Lao98zy0gxtcxwtPAAYM2OFpyCCvD
	ohkaDWsyDEALXtOITm/Yq78OJrlDoVEEuucd4QKo3hhD3UszGvWesaKjWkbHqJRNKOSWqxiJIg5
	GBqa06G7q2nDUBDFjVvkzpyFZX/qusCLU/QK4CiptHHV2MTZho0ZU4C/VVaDaM=
X-Received: by 2002:a05:600c:4fc9:b0:49c:fc6e:8cb9 with SMTP id 5b1f17b1804b1-49cfc6e8e1emr336137035e9.29.1788973224427;
        Wed, 09 Sep 2026 10:00:24 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc1be3sm32268795e9.4.2026.09.09.10.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 10:00:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 19:00:23 +0200
Message-Id: <DLAY2X2SD4KP.1P28H8QUJJ1P8@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose 27/38] u-boot-tools: Ignore CVE-2026-29007
X-Mailer: aerc 0.20.0
References: <cover.1788938908.git.yoann.congal@smile.fr>
 <3d02f9f0f0ac74275633f2f9eff9c568e351457d.1788938909.git.yoann.congal@smile.fr>
In-Reply-To: <3d02f9f0f0ac74275633f2f9eff9c568e351457d.1788938909.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 17:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245483

On Wed Sep 9, 2026 at 9:29 AM CEST, Yoann Congal wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> Analysis:
> - NVD identifies the vulnerable code as net/tcp.c when
>   CONFIG_PROT_TCP is enabled [1].
> - tools-only_defconfig disables networking, so this code is not built
>   into u-boot-tools [2].
> - Hence ignoring the CVE for this recipe.
>
> Reference:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-29007
> [2] https://github.com/u-boot/u-boot/blob/v2026.01/configs/tools-only_def=
config
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb b/meta/recip=
es-bsp/u-boot/u-boot-tools_2026.01.bb
> index 7eaf721ca83..0e57bb88849 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
> @@ -1,2 +1,4 @@
>  require u-boot-common.inc
>  require u-boot-tools.inc
> +
> +CVE_STATUS[CVE-2026-29007] =3D "not-applicable-config: tools-only_defcon=
fig disables networking; net/tcp.c is not compiled into u-boot-tools."

Hello,

I just noticed that these CVEs are not visible from our tracking because
the CPE is "u-boot" vs the PN "u-boot-tools".

To fix this, I plan to add to this series the recent patch:
[wrynose][PATCH] u-boot: share CVE_PRODUCT with u-boot-tools - Hiago De Fra=
nco
https://lore.kernel.org/all/20260909-uboot-cve-product-wrynose-v1-1-072b994=
b426f@baylibre.com/

Regards,
--=20
Yoann Congal
Smile ECS



Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4404AC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 08:54:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.170124.1783414481767452088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 01:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tpR2Ugy+;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so22162925e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783414480; x=1784019280; darn=lists.openembedded.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBPRWGiYNU4TAQG3dQVXEDxubsi9aDnSTeoB9xLj/vA=;
        b=tpR2Ugy+HF6K7uOLKFd9DtjTt3E8BQLi/L0HPCC6jZ6riPLU01rGPUI3qJNSMqh+ct
         1skii/IFEMsOkFY/KfweqjS/kFlkSnKOi0HSartBd3BqTUP4JlpAnyPd4ImnMOUAN7mL
         E/IAS/axO/fd8xSmekYPabgIClcDvwQ/Qc0ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783414480; x=1784019280;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBPRWGiYNU4TAQG3dQVXEDxubsi9aDnSTeoB9xLj/vA=;
        b=PcX/VZT1tmmxpiV2ehEEDkPKlAmA1ZGfgkuzDotrZ+Q36utgRDtnW88YUP3q1pqzcp
         3MULAW9Fz5omSR9hI4jmvqqOK5EoLpj7yAlreUTq7M1wdlNYHsotp8zGi8LCvvxoCwI3
         DFTNblaiTwuNBmglHDaGy81+4EbsiM/FKwhbRIvB0//u613R7mM+ptcE/Mi8Lyzqh9lW
         HkAVchCViT9C9i4/dCaBh+9d/I/y2Kw3Ap3qLk+LHJ7mXx6C3Mp24R8tk3zIUIuD9/pI
         fNli0pxPq6pvOpYt3gGRm9mTwCmm6meJK0+Vl3a7enEiMgWH09IQdAhs+N6uc4zQyRPZ
         8Z/w==
X-Forwarded-Encrypted: i=1; AHgh+RrKaMRe8xVJUFR+aNRbZGqDVfHkOLuewCigIjBDQKmnozfnEzdh3tVI7HIn7izc8ArXe7N+5pVx9jv4AIEX3xcBaw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyGO42J1p9aGul0VsnHamqxuq05galEpLguonvkm/DwJKJktI3L
	PtV1zgEeyOfRv6OUPsQhJbi6WxylJsllmbXbGEqX6Pj7lJKZoTTBnfJFqCVjZLXV+Go=
X-Gm-Gg: AfdE7cmxKbooV5QKIkYdWdRw9LZqbwXj7+uErRQPzRvtETL6NOLJx32eRctmvMbnjdt
	8KnvPz+LQqRFYXcdfseR+ViHsIF/U+nVSy8ghG1zEAIwzrPAVKdBk3/SW6h6Sy605bwVmUrwLii
	AquAupH+ssza+eZWkQF/qQIAFjNlK0mVXGzjqcuR3u1r9tmQJxfNM17QhNQxlKrWr/DZitTLBSP
	okb8xFYfdmfvFgJHSqQ1SYTth/k+NZjrjFofnTmSrg3XSP9jgIPwctvbGHiXb7Yk3vrjk74XWph
	3BuSp090nM4sko6CevHRQsBsnhD0MQk+W+wE8zpUW9Vk7r8Nf5hS1yg1RO9lIeP3q3JKUdHItok
	t6uMahubpDjHHHAB+TGWQjJmf2pqHYcTtG7v4wR/AocVAL0EtYvDf5BjMxdy6xW4jQLKD3dAFRD
	DzGhyzH3fJaFcIEXepW5K1cI1p7K35r/mv31C23s+XEg7p7cnEaHkI9Ya+FV6E8evBuvMSU0Pi
X-Received: by 2002:a05:600c:529a:b0:493:cfd2:cd06 with SMTP id 5b1f17b1804b1-493df063deemr47719905e9.6.1783414479978;
        Tue, 07 Jul 2026 01:54:39 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faed92sm38248595e9.9.2026.07.07.01.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:54:39 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 10:54:38 +0200
Message-Id: <DJS7O5671XMZ.OZRLCFBNZFYP@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] dropbear: Disable DSS correctly
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <mac@mcrowe.com>, <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20260629165056.2489582-1-mac@mcrowe.com>
In-Reply-To: <20260629165056.2489582-1-mac@mcrowe.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 08:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240369

Hello,

On Mon Jun 29, 2026 at 6:50 PM CEST, Mike Crowe via lists.openembedded.org =
wrote:
> From: Mike Crowe <mac@mcrowe.com>
>
> Take upstream patch that stops sysoptions.h unconditionally turning
> DROPBEAR_DSS back on even when it has been disabled (which is the
> default).
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  ...PBEAR_DSS-is-only-forced-for-fuzzing.patch | 29 +++++++++++++++++++
>  .../recipes-core/dropbear/dropbear_2022.83.bb |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPB=
EAR_DSS-is-only-forced-for-fuzzing.patch
>
> diff --git a/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS=
-is-only-forced-for-fuzzing.patch b/meta/recipes-core/dropbear/dropbear/000=
1-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch
> new file mode 100644
> index 0000000000..b9705a2bbb
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-onl=
y-forced-for-fuzzing.patch
> @@ -0,0 +1,29 @@
> +From c7dfaebd5f6a4cde4198f4d2a7baabaa1f632274 Mon Sep 17 00:00:00 2001
> +From: Matt Johnston <matt@ucc.asn.au>
> +Date: Tue, 6 Dec 2022 22:34:11 +0800
> +Subject: [PATCH] Fix so DROPBEAR_DSS is only forced for fuzzing
> +
> +Regression from 787391ea3b5af2acf5e3c83372510f0c79477ad7,
> +was missing fuzzing conditional
> +
> +Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/c043ef=
b47c3173072fa636ca0da0d19875d4511f]

This patch is missing your signed-off-by.
> +---
> + sysoptions.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +

Regards,
--=20
Yoann Congal


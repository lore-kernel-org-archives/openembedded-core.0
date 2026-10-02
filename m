Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49964CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 14:55:12 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14229.1790952906475049277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 07:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RaE4AVgh;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0280d4f56so1054545e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790952905; x=1791557705; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LzZJoA8iflI8vhblM2yJEjAGiTP41xCvEQq5BqWZUgg=;
        b=RaE4AVghhmGQq5IEZv+QyCTmTBr/EVxRmIyJm3hSLSpds2NyGtxbegdkXAHqfrWhTl
         wlIQBSTbdLN17LnTo+6kXYFhKxIgG2nXYhtfv2UaplpKLeWMLC9d49EkF5GSE7AC/TQ5
         2bJuXipd/7LkMZ9kuy+m/5bAkYn/k4B5sZsH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952905; x=1791557705;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzZJoA8iflI8vhblM2yJEjAGiTP41xCvEQq5BqWZUgg=;
        b=yU8RN+AZy2zPy8BThiQGcFIG5ibLdZjHpd6f+xIzoQEdrXNw9Vu7ZyGoDSu9/LCmOD
         EL+AfhZJZRDUXjJWRh12tEBfI/2K8O2fjg6cw9n25ZZGCKeeSYUVkR/yVbr75QM+hQAD
         3nvUBflAQigT51AG4oT/Lu56ZumVU2jp+NutARvAqNX3tODXBclsIN8ZYvtZ1xoCYzTd
         FHi5aCwD3dy4WCGC7CLzFT8WBdpxZPOEPfxTAPan4WCAUTHMtNtd7dy1cKvvnHb83Unr
         dqY3J4Q+BehEinVkcwv73OKWGAJkjqSgMDRM0uHiOULEjXQjtR8RMp2z9fdnkpTyHNnG
         q8gg==
X-Forwarded-Encrypted: i=1; AKwUvBxoRhszjvmDprrBeZxHqM0Qduwna0X5cqg9OoqbFuSqjA2MqUIEi7SYk/n2oMgnVYgfZq+0QqaazIywdg9iCk/uLA==@lists.openembedded.org
X-Gm-Message-State: AFuF++ke7txJowUBFMEEY5/hQa4AAjGmXrF2ClRl2jHUY4cniaq5GDml
	Gike4LxQ5s75aBouehSEjetlCxhKJsmsl+7Boi6cFXTl1YCC3ZAnzocrh5ZxHkUJsNI=
X-Gm-Gg: AYBFou1uQ7/TrJrJrVHR5rGgT5hJCtRRmNm0cpd47AYYPMAaBFUGSrAeV+orRvliQw6
	TSJ9NOBqQED95pcgPJy/VuxkNhA1ob1ibrgK7674TxCjh7Otw4GT5hoCpx/xi05V3M1iraFlO/k
	7z4DZJgUYw1RiYNTUTjw/lx4jYekSG6OceKmtVusKFv9a19A6spDfdsA0w1kuR+A2NRAPFAYzu6
	8vKt+IYUzK2b6aDrlWmMAY6dMMM2e4I7uj6nBWmGJ5p69Tw1Ft6yc+BiWkm3eelCAFZjM/vg77M
	cZYktL0q9Bj0ahvf3i22XMpyqB26zGTsK4OjP+Cyqhu33nG3fB6XEEex6uS8njaihQC7X+72/Dm
	xAOqvS8eqZUXEnu6HMV0aiEewQI3yaG0KacNnIHUXUqE7KVytTpMcv8VcvVWPeUjtCSM/eKtLd1
	3Ec/b8Unztn37rcHVzSWKNo0Yn5tBHCvHxDpmWJa7OyeE8yeavZGNkjwrvV+RTmtkKBnP1bnigK
	/bNeV59Sqo9ZKIZQWAHHRa2v213Ef3dUTcbmiCyp/XMna54S2IIQR4IUeNRl/MMSiIBkwYm
X-Received: by 2002:a05:600c:1387:b0:49f:ffd0:9a9a with SMTP id 5b1f17b1804b1-4a02769cc07mr52633875e9.25.1790952904451;
        Fri, 02 Oct 2026 07:55:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c8bb0sm94927195e9.11.2026.10.02.07.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 07:55:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 16:55:02 +0200
Message-Id: <DLUFTHDDHEZP.26Z4IYE48HPZT@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/8] libxml2: Fix CVE-2026-86137
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260929041836.2217090-1-hthakar@cisco.com>
In-Reply-To: <20260929041836.2217090-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 14:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247129

On Tue Sep 29, 2026 at 6:18 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/GNOME/libxml2/commit/76fe08d97de88bfaef2f7d5cd27f1=
1954cc5bee2
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-86137
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../libxml/libxml2/CVE-2026-86137.patch       | 59 +++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch b/meta=
/recipes-core/libxml/libxml2/CVE-2026-86137.patch
> new file mode 100644
> index 0000000000..a756883d46
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch
> @@ -0,0 +1,59 @@
> +From a9d489b86e46188d1c0fde7dbd0aa8281596e6d6 Mon Sep 17 00:00:00 2001
> +From: Hieu Le Minh <leminhhieu.opensource@gmail.com>
> +Date: Sat, 18 Apr 2026 21:18:24 +0700
> +Subject: [PATCH] xmlregexp: Prevent out-of-bounds read in NXT macro
> +
> +Fixes: https://gitlab.gnome.org/GNOME/libxml2/-/issues/1099
> +
> +CVE: CVE-2026-86137
> +Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/76fe0=
8d97de88bfaef2f7d5cd27f11954cc5bee2]
> +
> +Backport Changes:
> +- Add the parser-context length field and allocation-failure guard requi=
red by the Scarthgap 2.12.10 source, which lacks both pieces of the upstrea=
m context.
> +- The allocation-failure guard is completed by the subsequent CVE-2026-8=
6141.patch, which moves strlen() after the xmlStrdup() null check; keep tha=
t patch after this one in SRC_URI.

Please wrap this at 80 characters, we are flexible on this but, here,
this is too long.=20

Note that this also applies to other patches in this series.

Since there are actual dependencies between patches in this series, I
hold the whole series and wait for you to send a fixed v2.

Thanks!
--=20
Yoann Congal
Smile ECS



Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A25FFF5110
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:12:04 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85174.1775578317815662582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z+KaDnTa;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso43938875e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578316; x=1776183116; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZ3g4njpFgS5hFwmnG6dWQuPxTCMqMTi5lmfEl95Ta4=;
        b=Z+KaDnTagbzwYPBZSLUO0YOvm52AjTI37NMAu25WBpO1Zw6rfwVnbJ232nLTQjLA/R
         AuWE8BrdeQQdjUy8oUzj6KqLX5AAqPsYBqq3lk2K4ZiZj8/lGEvco2LLlGPeKivVNM9m
         JN7csL6Qw3374khcgsbBkNVXoDdQvbYr6Yc44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578316; x=1776183116;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZ3g4njpFgS5hFwmnG6dWQuPxTCMqMTi5lmfEl95Ta4=;
        b=Z3QLGxpZKwuEenA7WcuLVcZlIX3CUMRdg7n6YYCo5+sefr7Dv6qPbnTZZrTT52Ga1r
         emxZwgH91DKc5NjhwGvXAxtD43cJptUVkle392gnByh8Yy5Nn41JP+oCmx8YELGPUDja
         dEk5HnHz6dDU2Gw0y8moEgBQGnQgE1qZ0enBB6CrQfpHVLiN/qpaS5ucn7DrOf82fmAa
         /yjLX9tSRLHwyo+GgOn3EkmyoCVSqenqbrJMug9qXxG4Cp33kE1gq2AnYlz2mpsbdq9l
         x7y/th4VXe3duA38J1PVrdN8nAbS4HrmamVj1cLI72eZbHVBFwIEpRx+I8JN2B7kWITH
         FzQw==
X-Forwarded-Encrypted: i=1; AJvYcCUE/7qPd6mJAW6nSbInvFORG6ALo4k9W9kUA+eJWVBTTP6hiYG7cCICtBAqkTFY1ytL1fcwzEclhhhKGj0IAjQbbQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx0y5G6idNMeh/zzvVcbmL00eAAILqAqWX11DM44wsa0dz53f51
	HxAp+yWxxxQofvqt8ENFIcUILeeEw9bqVu+3bjq5N/Rgrl/HhB0ZCF6taiXEgZgNrb8=
X-Gm-Gg: AeBDietyYtZ7CnvyK6HW5cY56/F7m6gUKy8ikjrpBljH5k7BVSQ8OOk6LSvxMupelyb
	DPcBK4ksJx6oqGgraHGIYMneZPZFpejyU42iixLwYL8LihghumGXu1Rw5fVoYKQghCkzsZoC4dk
	qiK70wMPO7DAHsYZypv1Xzi5xZuP70iGqLosHKyNluWQqcKAzOe+8juWNBfaAM1bai9pycyUG41
	5h5VeZTFYaASfMbv2FfIHFuS3C+8YOWqVDDis5y+dKzI1USJ1MBOa8z72h+L1waF2xhoA/d4Xvz
	heiV6yPBHf3E8DN+zkrYwtcgwFADX//nuh6KHoefnw5XB7AHvML2GPs5halRbYbW4q1IETzGT/8
	Vv8r7sfpgs/02K+2t4gi1FRKwYUuGISIGQTEa+DGXxTLAFPnLv15xPfyR9POlXEadzDewOL7+y+
	AFtiASZOX7a92dZGD6zP2cBlPYtF4Po0ybLlqopt8+caRCNvPauJ02jRd68PTaccGdr79MskS0O
	miV307F2FCa2vRJ
X-Received: by 2002:a05:600c:3f08:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488996d22f4mr280256575e9.1.1775578316049;
        Tue, 07 Apr 2026 09:11:56 -0700 (PDT)
Received: from localhost (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm636068675e9.4.2026.04.07.09.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 09:11:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 18:11:54 +0200
Message-Id: <DHN1ZCZ6DGXQ.3NXSCVCB7CZ7W@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCH] ncurses: fix for CVE-2025-69720
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260407054403.21041-1-hprajapati@mvista.com>
In-Reply-To: <20260407054403.21041-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234752

On Tue Apr 7, 2026 at 7:44 AM CEST, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Pick relevant part of snapshot commit 20251213, see [1].
>
> That has:
> add a limit-check in infocmp -i option (report/example by Yixuan Cao).
>
> [1] https://invisible-island.net/ncurses/NEWS.html#index-t20251213
>
> References:
> 1. https://github.com/Cao-Wuhui/CVE-2025-69720
> 2. https://nvd.nist.gov/vuln/detail/CVE-2025-69720
> 3. https://access.redhat.com/errata/RHSA-2026:5913
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---

Hello,

As far as I can tell, this CVE applies to scarthgap. Since this is the
end of kirkstone soon, I'll take it into the reviews series but can only
merge it if there is a patch sent for this CVE for scarthgap.

Regards,

>  .../ncurses/files/CVE-2025-69720.patch        | 42 +++++++++++++++++++
>  .../ncurses/ncurses_6.3+20220423.bb           |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-69720.patch
>
> diff --git a/meta/recipes-core/ncurses/files/CVE-2025-69720.patch b/meta/=
recipes-core/ncurses/files/CVE-2025-69720.patch
> new file mode 100644
> index 0000000000..d570b2007a
> --- /dev/null
> +++ b/meta/recipes-core/ncurses/files/CVE-2025-69720.patch
> @@ -0,0 +1,42 @@
> +From 6f6db0e8fd14e40096a0ee6f8bdf32dedbd3fc9e Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Mon, 6 Apr 2026 18:08:09 +0530
> +Subject: [PATCH] add limit-check in infocmp
> +
> +origin : https://invisible-island.net/archives/ncurses/6.5/ncurses-6.5-2=
0251213.patch.gz
> +Refer: https://github.com/Cao-Wuhui/CVE-2025-69720
> +patch by : Thomas E. Dickey <dickey@invisible-island.net>
> +
> +CVE: CVE-2025-69720
> +Upstream-Status: Backport [https://github.com/ThomasDickey/ncurses-snaps=
hots/commit/6f6db0e8fd14e40096a0ee6f8bdf32dedbd3fc9e]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + progs/infocmp.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/progs/infocmp.c b/progs/infocmp.c
> +index 0ee0b958..538aca5a 100644
> +--- a/progs/infocmp.c
> ++++ b/progs/infocmp.c
> +@@ -816,7 +816,7 @@ lookup_params(const assoc * table, char *dst, char *=
src)
> + static void
> + analyze_string(const char *name, const char *cap, TERMTYPE2 *tp)
> + {
> +-    char buf2[MAX_TERMINFO_LENGTH];
> ++    char buf2[MAX_TERMINFO_LENGTH + 1];
> +     const char *sp;
> +     const assoc *ap;
> +     int tp_lines =3D tp->Numbers[2];
> +@@ -846,7 +846,8 @@ analyze_string(const char *name, const char *cap, TE=
RMTYPE2 *tp)
> + 	    if (VALID_STRING(cp) &&
> + 		cp[0] !=3D '\0' &&
> + 		cp !=3D cap) {
> +-		len =3D strlen(cp);
> ++		if ((len =3D strlen(cp)) > MAX_TERMINFO_LENGTH)
> ++		    len =3D MAX_TERMINFO_LENGTH;
> + 		_nc_STRNCPY(buf2, sp, len);
> + 		buf2[len] =3D '\0';
> +=20
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/rec=
ipes-core/ncurses/ncurses_6.3+20220423.bb
> index 68a845f27c..15ea2756cd 100644
> --- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
> @@ -7,6 +7,7 @@ SRC_URI +=3D "file://0001-tic-hang.patch \
>             file://CVE-2023-50495.patch \
>             file://CVE-2023-45918.patch \
>             file://CVE-2025-6141.patch \
> +           file://CVE-2025-69720.patch \
>             "
>  # commit id corresponds to the revision in package version
>  SRCREV =3D "a0bc708bc6954b5d3c0a38d92b683c3ec3135260"


--=20
Yoann Congal
Smile ECS



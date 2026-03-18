Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57927103E17A
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:42:39 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14315.1773841348883486695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HoV+2jEJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso62175395e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773841347; x=1774446147; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acpSSMpRpE52ME6nybfmfGA65fBIK5A9KRgYCD6283Q=;
        b=HoV+2jEJz+L0qCAe/KvDd6+oNxagyTBFMLmpfYruCzW75NaKvcHH1cxr2/8a6C6/dF
         98Y9W2lcgeMghhQEffz2Uc6xpV3wUB1iIREDftwQlUn8qrinYrz1ldwhQEXDCeigU536
         YSpgOCgTAwhmo8HiICL1Soff7P5mNdBzQT8yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841347; x=1774446147;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=acpSSMpRpE52ME6nybfmfGA65fBIK5A9KRgYCD6283Q=;
        b=AQhFHqiRbdM8hwYIuVL1r5A9BbgBqyZH4yyWA3edGDuPtF5O4Q/G4KgjbukAS+fM6j
         nlXoN3J/ihObcy5klvSQEaSJAxM2rymADhz8A5e5nreZ5T+yLpixDxe+Dj8nJIV1HHNS
         s1zR5jvUa3e6KOxRIft3kX1i/aHArBgqpVwaDTeUfKKIJDJlzXl0JbDVvoc9mwyJollv
         bWAWV+U1HopmrvvNdz2cDeoKPdodV40kQ1OUQihySMVX+BtjpEBU5Mi2LuELV0eUsSai
         faGe5rvovDdjdkO5L2RtKK7VF8QA4iKtwUei741ubl+G1UaDkMoRUr8vFo61oDYesvlF
         +JAg==
X-Forwarded-Encrypted: i=1; AJvYcCWhuJDHolZ6jApdUGplbelpusObsfvc7y+cVUlEdA7AZmdfSNcjPhwCpWjETn1u+LcKjmd/hUKdmAVQeMR6l1bRVQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwR/O/wDMVzI1Vsnhl2V5/6+XaTOPxdmpwTxUjsGF5qcGwoplPh
	KBTawnWvicii6Cwf87/IETWn4yym/FHj018AnrcYD6HaVpnZ8LlDBR1i6JjjioF59Ss=
X-Gm-Gg: ATEYQzyYDGyVL8BzPxhOzuXFlsqjZRKqJ48+UXGRqHockz7IMwm01GqeUF9Kyg/YoKs
	iUCO4gQUjZc7xLy1JOAMlkbO0on6VZ9zC2vQxj8XpDFGxu45+2ruedr7mMGAk4WrV/XNj6MY9Id
	60/sfhGMzEo+ERVjD/lTxVqFIRHEYBA1QU8rBxEMYtFLo6vy30OjqmQH8V8IuilHyuRFPbIyPCN
	m55qc6P7BNYSyB1kQtE/j+SnYNu/vaOO8qDVHRSV6f8vDdtfFGveiaARCmSjVb8tPnEk5qbH7D/
	5E42mdlA8kxtUejU7VEws5eNTezB/BNU16lFDjhlwXZY8m3qfw9tDh5Sd+e9N1+1v6KoHDhEmUQ
	yGj5aAqpFKmqry7mcNDCGT+48DXS5P5djJTmnqB/PBI4BhgnzzHqFdLfut7et2Mol/iLvcfias9
	eKTZJGGnMs6eNGQUdYCNlBOMaoNjXdSZheZPCZ66CMMyQkkyMVSxpbYMHcwwUGm2Xqjq0f0vFBP
	kjUj1cEdaDpLQo0W96juQ==
X-Received: by 2002:a05:600c:a08c:b0:485:3a86:6392 with SMTP id 5b1f17b1804b1-486f445317dmr58433535e9.20.1773841347040;
        Wed, 18 Mar 2026 06:42:27 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f5e23874sm29872625e9.6.2026.03.18.06.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:42:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 14:42:26 +0100
Message-Id: <DH5YA0P6BUNT.1ORBJDTA4DDT3@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 3/3] tiff: ignore CVE-2025-61143,
 CVE-2025-61144 and CVE-2025-61145
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260307064540.1257672-1-ankur.tyagi85@gmail.com>
 <20260307064540.1257672-3-ankur.tyagi85@gmail.com>
In-Reply-To: <20260307064540.1257672-3-ankur.tyagi85@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233389

On Sat Mar 7, 2026 at 7:45 AM CET, Ankur Tyagi via lists.openembedded.org w=
rote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> These CVEs are for tools which were removed in v4.6.0[1]
>
> [1]https://gitlab.com/libtiff/libtiff/-/commit/eab89a627f0a65e9a1a47c4b30=
b4802c80b1ac45
>
> Details:
> https://nvd.nist.gov/vuln/detail/CVE-2025-61143

This CVE: "libtiff up to v4.7.1 was discovered to contain a NULL pointer
dereference via the component libtiff/tif_open.c."

Despite tools being removed in the commit you mentionned
libtiff/tif_open.c was not touched and the patch linked by NVD apply to
files outside of "archive/" were the removed tools are...

Are you sure we can ignore this CVE?

FYI, Peter patched it on kirkstone:
[OE-core][kirkstone 07/17] tiff: patch CVE-2025-61143 - Yoann Congal
https://lore.kernel.org/openembedded-core/944f481d214bebeaf51769d77fe16cd93=
cbff351.1773652940.git.yoann.congal@smile.fr/

Regards,

> https://nvd.nist.gov/vuln/detail/CVE-2025-61144
> https://nvd.nist.gov/vuln/detail/CVE-2025-61145
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-multimedia/libtiff/tiff_4.6.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.6.0.bb
> index 777783d7cc..07540692fc 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
> @@ -29,7 +29,7 @@ CVE_STATUS[CVE-2015-7313] =3D "fixed-version: Tested wi=
th check from https://secur
>  CVE_STATUS[CVE-2023-3164] =3D "cpe-incorrect: Issue only affects the tif=
fcrop tool not compiled by default since 4.6.0"
> =20
>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_REMOVED_TOOLS"
> -CVE_STATUS_REMOVED_TOOLS =3D "CVE-2024-13978 CVE-2025-8176 CVE-2025-8177=
 CVE-2025-8534 CVE-2025-8851 CVE-2025-8961"
> +CVE_STATUS_REMOVED_TOOLS =3D "CVE-2024-13978 CVE-2025-8176 CVE-2025-8177=
 CVE-2025-8534 CVE-2025-8851 CVE-2025-8961 CVE-2025-61143 CVE-2025-61144 CV=
E-2025-61145"
>  CVE_STATUS_REMOVED_TOOLS[status] =3D "cpe-incorrect: tools affected by t=
hese CVEs are not present in this release"
> =20
>  inherit autotools multilib_header


--=20
Yoann Congal
Smile ECS



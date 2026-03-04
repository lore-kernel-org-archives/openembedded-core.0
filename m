Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B904EFCE3C
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 19:14:20 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26644.1772651657153479743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 11:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SwUELk4G;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483bd7354efso96389005e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 11:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772651655; x=1773256455; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg6OGYJC7Xdzt7Ucb/PSviv6fK21wVKNsJKY/rotzy0=;
        b=SwUELk4GY8rUhMaay4RpfS4OfH0DJMBl4Go1ML+Udwn9Bj+zJ6KiH14IDkhn3439IK
         I82DYr1LqXlAiJb+zDbvEJxIMEmRKkrbcLWOoryuR9aioejHcrWx5C8QXZyhM3thp2YP
         TzJonOGJnJBwoFJMroQiA6h5etX0je4/qNYHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772651655; x=1773256455;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bg6OGYJC7Xdzt7Ucb/PSviv6fK21wVKNsJKY/rotzy0=;
        b=YxzLRQ9eo4WEGA/yq7uYYezNJQt3Clp2B38oegJh/vkRjZiOYMAOmeRF9rh8sTArDy
         2NLnIejlFzyKPxcxBdfXgeozsoXkhLwa/TokqLPk7rI2LtkRsfKO58NSw6StmZFwrALF
         qQBCbkKHB4LXN0jZnYdBRDSr5radW69IPeceihC7psMrSA4exziiak5rfgoK2j3kCTbF
         dJdEJNuWBS0FtMnyMQSU6hxAvvLRKpfSiPCXBvbd418IU8PSnrr29stMIJkafUuRws+Y
         Popjn1LKi4hUj4hB9vb+4Xu5pii5GmXGlscCk67dwnzb1fV9XhuRytynEW1FcisUpn7D
         ALpA==
X-Forwarded-Encrypted: i=1; AJvYcCVXNiKTTFf7sOkvOmAF1O/81rLoanLLBVDCNDOCtEZtNzAKx9HH1zFmJ+vTVUFHp0pEyPGDft/fAQDocgsiE5OaTQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YycqkTbgyVqrbWGYormy3GzJkAUTobh+0C2b62vjHQYSMbWY1mG
	WvDdUzxbOANW+vKOjr2XaqmBsN/8VUXFWmHWjREld8ucDrLnM9bzsiofj/40lvuPSEw=
X-Gm-Gg: ATEYQzzWf1Eq8ZDwtezwJr5ZUYQnWiVjWOXyz1VKHRHbzS/9ylqZsDO8+1s6HyKhbcV
	TW1ecliaTGbbVVbJmuesaoA1g4305tTtY23fBYzqVhVAD607tOSE+uhNkgbAj5FPj2H0AwJy+E6
	LbWBsVfN9+CcFPUmSjb2kHdFXg8GJUuOptmKIqaWVk048IZOrAqQOVL39LFo5FHdpBYp8JbknJs
	U380Z6NwASTe+Ku4+3+vZefLRSXV9cIfj/wQQbIH03MAxSgHTe/YCrUZ77lB2N6OIWyT2tFAcCg
	e7Xw5n3knEbPtd/f5QQqemnaPnxKJbsBDtwz9E8aYFBXxJ6hhFwpVTWC85ONe/rjVOYCoYvIyH6
	7jFOzfJ/otRTiF0Pb8hxvoUn5eTZ4HUkYxRPiYP098U//35aGaIBOU6UrYNdSnUXMM+EdIyu/RE
	WO1zmFArA81FGLfisGthy+NjkzsqEgUNzB1vl1KRnUGdc26VVVXSRZCxuiWN+UMgEiw7ACiDb20
	i6VIvYJSC3MMw==
X-Received: by 2002:a05:600c:3b29:b0:483:afbb:a077 with SMTP id 5b1f17b1804b1-4851983a5c5mr52828605e9.1.1772651655528;
        Wed, 04 Mar 2026 11:14:15 -0800 (PST)
Received: from localhost (2a02-8440-b50d-618f-20be-2110-8e83-ce30.rev.sfr.net. [2a02:8440:b50d:618f:20be:2110:8e83:ce30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187b7851sm122395145e9.3.2026.03.04.11.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 11:14:15 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 20:14:12 +0100
Message-Id: <DGU8KF6C5AC8.3PXRYKVMHQIBZ@smile.fr>
Subject: Re: [OE-core] [PATCH scarthgap 0/3] meta: Backport rejected CVEs
 and SPDX3 fixes
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <mathieu.dubois-briand@bootlin.com>,
 <richard.purdie@linuxfoundation.org>, <JPEWhacker@gmail.com>,
 <thomas.petazzoni@bootlin.com>, <pascal.eberhard@se.com>, "Ross Burton"
 <ross.burton@arm.com>, =?utf-8?q?David_Nystr=C3=B6m?=
 <david.nystrom@est.tech>
To: <benjamin.robin@bootlin.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260303-backport-fixes-scarthgap-v1-0-2dc803f921a9@bootlin.com>
In-Reply-To: <20260303-backport-fixes-scarthgap-v1-0-2dc803f921a9@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 19:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232437

On Tue Mar 3, 2026 at 5:46 PM CET, Benjamin Robin via lists.openembedded.or=
g wrote:
> This series backports three patches from `master` to `Scarthgap`.
>
> Removed references to rejected CVEs:
>  - Removed references to `CVE-2025-62813` and `CVE-2021-3502` in patch
>    files, as these CVEs have been rejected.
>  - This change prevents rejected CVE references from appearing in the
>    generated SBOM.
>
> Fixed kernel `CONFIG_` generation in SPDX3:
>  - Backported a fix for the generation of kernel `CONFIG_` values in
>    SPDX3 output.
>  - This is a important fix, as the generated SBOM file might otherwise
>    randomly omit kernel `CONFIG_` values.
>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---
> Benjamin Robin (Schneider Electric) (3):
>       avahi: Remove a reference to the rejected CVE-2021-36217
>       lz4: Remove a reference to the rejected CVE-2025-62813
>       meta: fix generation of kernel CONFIG_ in SPDX3
>
>  meta/classes-recipe/kernel.bbclass                 | 27 ++++++++++++----=
------
>  meta/lib/oeqa/selftest/cases/spdx.py               |  2 +-
>  .../avahi/files/local-ping.patch                   |  1 -
>  ...5-62813.patch =3D> fix-null-error-handling.patch} |  1 -
>  meta/recipes-support/lz4/lz4_1.9.4.bb              |  2 +-
>  5 files changed, 17 insertions(+), 16 deletions(-)
> ---
> base-commit: a9a785d7fa0cfe2a9087dbcde0ef9f0d2a441375
> change-id: 20260303-backport-fixes-scarthgap-c8d4140edfa0
>
> Best regards,

Hello,

Can you please send the equivalent series for whinlatter?

Thanks!
--=20
Yoann Congal
Smile ECS



Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6221C4451B
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 17:26:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1787.1784481975255074123
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 10:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VZRpFlqx;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954d383e64so10483175e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 10:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784481973; x=1785086773; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Rdl0oBbpFmC7WYicKFBlHpzCH07XaFI+kkyrLyWeAw=;
        b=VZRpFlqxiWLfeSWxVjUtiHA4FAFXaMUwIUUGhip3IffxxSX+Hn0/Kuu2t/YxBIcFc+
         MEIy+m/n4axJ57a8X8DNbFKoiSm15leQhYgZEFD4v9Vw0rLlsnDVzl16txIB4O0Gq+lY
         GncOBOsJPCSXVQZ4Na4xInrrQQSayhk+XfqLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784481973; x=1785086773;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Rdl0oBbpFmC7WYicKFBlHpzCH07XaFI+kkyrLyWeAw=;
        b=WTjzQ4CZpj9bu4jj6Fre1R4p26/Jc9dSKqYzipQYHOLB0877XeXTrkJdAx6ujMvb4x
         1NSKYPg5CK8/z5ZiiCQgJybkJr+ePgHW0cOdHJj0QviiTCV2hNj6aPDD4gotPTor+nUu
         n/fESzMzyGhFsJIWHXR2V/9tMLvPyFupkErB+O+9Lnj8FNDw1TFB/yMsOsgGAknhulF9
         lGjF2ybagZ4Wbr5wPZQEn1yRx8iZMPu4B+W6CnLZuyblDiFeoWtpyTJPcLj5BuJrON9p
         DioG8grPanXUlQ6qqxxVPV/TtoNIFHIlTzNTswsZCQ2T/n3aSU0QrYmk9tz4JF4fWr1E
         eeug==
X-Forwarded-Encrypted: i=1; AHgh+RrS4EE2GKZCvyaRAzEdUzewhcrYaA23wbIbiZmYNStc2kqp0sEFfU9EcoRKlK431mGiqNcR9jTkTJuoQDHDolEyFw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwDZW40od++ICvD4InBGR7yRwUrq6spttNQijpefoWKOaEti3bJ
	1nuU4kKuM+7FMUbVOLh8LHdl2mD2GtkMoNJ0Pi/AqqK17mzhde6oFXzU6wUBIEctFsI=
X-Gm-Gg: AfdE7clEtqpf7mxV9qe6+pGuXVeV56Tu2jdoROD0QdUBiuFhOcFNx3XQw9gkvz2UBsl
	LqJAmOPAVoB1FcysND1ChvMq/KSY1uaMHaYincYG8HFxCv6MLXit9/jmZihvO1gyIX+vkiTW8dj
	USAwLkB5WuueW+Gy6ceOZglWVw30WSqSm9ct7Rd4yldIG8+Kc6MqS69S9nHDvXraJkGXtF7BGph
	kNyk6m0Y3tSDs7v/cvUcicxR3aI3RNAvT4BegcQTGuidh7dfiPBTi5o+AmssbWI3gUDYy2aVH0M
	6ZsbALkjp+6pY1Y0aTbbF9FvuXR2bcHY07xkJjJ55w9OZGJz+G4qBLx5ySryBeVAqi+m7uCtuaz
	tM59hCwZ0VcNWWb1bFaXreV3IeEs2BAtMLrFqai/IGbEjbNySRlxqCkvuv4k0Tbyo3K1jyX5ep9
	ZvQm3Pzm3gIROR/LWP2BlG//bQOxLmPpO1fZO6uEasmXmnICyUBYqhi6ILi6+KtCOB81iFis4AH
	aOgFw==
X-Received: by 2002:a05:600c:a42:b0:493:eed4:7210 with SMTP id 5b1f17b1804b1-4954a3ef700mr122098315e9.11.1784481973397;
        Sun, 19 Jul 2026 10:26:13 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954ba2abd0sm187202205e9.15.2026.07.19.10.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 10:26:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 19:26:12 +0200
Message-Id: <DK2Q2D3DOPR0.1PPO4DOF1JPZL@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc-testsuite: inherit nospdx to
 fix do_create_spdx failure
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260708115052.71740-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260708115052.71740-1-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 17:26:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241297

On Wed Jul 8, 2026 at 1:50 PM CEST, Jaipaul Cheernam via lists.openembedded=
.org wrote:
> The glibc-testsuite recipe fails during do_create_spdx with:
>
>   ERROR: glibc-testsuite-2.39+git-r1 do_create_spdx: Recipe glibc-testsui=
te
>   is trying to create package sln which was already written by recipe gli=
bc.
>   This will cause corruption, please resolve this and only provide the
>   package from one recipe or the other or only build one of the recipes.
>
> This happens because glibc-testsuite includes glibc_2.39.bb via 'require'
> to reuse its source and build configuration for running 'make check'. As =
a
> result, it inherits all of glibc's PACKAGES definitions (including sln).
> While the recipe already inherits 'nopackages' to suppress packaging, the
> nopackages class does not disable SPDX tasks. The do_create_spdx task the=
n
> attempts to generate SPDX data for packages like 'sln', conflicting with
> the real glibc recipe that owns that package.
>
> This issue was exposed by the SPDX 3.0 backport (commit 9c9b954504,
> Nov 2025) which introduced stricter package-level SPDX generation.
>
> Fix this by adding 'inherit nospdx'. glibc-testsuite does not run on
> target or factor into the build supply chain, since its purpose is to
> run tests in QEMU at build time.
>
> (cherry picked from commit 32801348ca231978498612f3ebee121ca27459c1)

Hello,

That is not a straight forward cherry-pick. Commit message and author
where rewritten.

If you need to add backport info to the cherry-pick, add them after the
"(cherry picked from ..." line but keep the rest (author, title, body)
the same.

You can either send me a v2 with proper cherry-pick procedure (only
append, no rewrite) or just request a cherry-pick for me to handle
(looks easy enough).

Regards,

> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  meta/recipes-core/glibc/glibc-testsuite_2.39.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb b/meta/recip=
es-core/glibc/glibc-testsuite_2.39.bb
> index 2e076f4b0f..e0e3e8ba84 100644
> --- a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc-testsuite_2.39.bb
> @@ -31,6 +31,7 @@ do_check:append () {
>  }
> =20
>  inherit nopackages
> +inherit nospdx
>  deltask do_stash_locale
>  deltask do_install
>  deltask do_populate_sysroot


--=20
Yoann Congal
Smile ECS



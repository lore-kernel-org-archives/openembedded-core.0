Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC7BF41997
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 12:08:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17360.1776254884273450546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 05:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=08G/ZFZ5;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a29e6110so72193425e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 05:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776254883; x=1776859683; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk9KhklPUaSSKL6Rb8SMfcIbqnrP1kvQAvwtxsY3/Iw=;
        b=08G/ZFZ5RUVAlkO+EX9p8jpXlggMwCvG0zB2ibdg/IMgnwIxnLjos8pV1j5EMcQrBz
         SHviJkPRHGcGwZYVBON+YYnfdr3aC/Dwmi5sX0g4XrS3jXeuzZpWhLeLV8kRNqz0mYAb
         FJO3Oszr42c54qmAotVJSggeqWUbxOz+TWA9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776254883; x=1776859683;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pk9KhklPUaSSKL6Rb8SMfcIbqnrP1kvQAvwtxsY3/Iw=;
        b=FvP8TwR7MkZwAJoBYvJG31WyznvAsJ16X/34RjNCwPjge3qV0YNVbW/LuvLYjRxCUm
         XLMWRT+RiC6t2ZvWB30sM/bKjsfTEvWsZhlPGtitSZRMnFs/EYbkqd06O2AYSHXJkrF9
         fU/Unn387BxU/TQfBWaCI4Msk7iTQxwKLNXrayL3Sw4G9CSRD3NF6Ay9j49kO5BQ2bbB
         RnL3zRIVZ/wsrruLK7ZjUZAHi4ZYqogE4hjgNwt7GvEvvUOu0MxKGmAz5lWXUGR2Bu88
         AL+I5k+et+z/rmtW1u3Kr+oKmxjwO9m2N4jJREAyI2eNXbn4x+x5IzKWfk3DGNjtmjN3
         f5EA==
X-Forwarded-Encrypted: i=1; AFNElJ8M6xrrzNAkz9R7xroLmg3AMjPf5CxB3OSVPP1oFT5beXPrIBEee9a+g37w9bkKVgIq1I4mpVl6AlC8JVQ4LrZYKQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyxDy7tNIxUgCdEUK2qqZF+B06TCKvaUvFIwJ/MP5Yk8iCDirt4
	x/U9k1NU/UWEcGUu26wTzFBUo17v7w7/UY0dItt4S8KYtYXonHitzA8olNRCHRnREd8=
X-Gm-Gg: AeBDiet/pNtstedzQWAU9AWbqQFpGPn7wF+m+QluHfNtzKoaAwIVN/wwDSlMC7Jvxie
	Dq/hLnl4SWZSIonOVRsTctR4zIBnTPYcgxmzJm4WMeKvH3lnhzMcDGNvXYexk8/TQPHMAqLlddL
	KDmrDIMzwQOoWmDkLjC+jBQQ5K/oenfLszliKZVYlhklmzsQwnkvk+aSekuf3kYKxePNyaXxUZR
	fc+hiH5kecB67RN0mGHYU3bLDdUBR6gOb++4fbaWyOGj0zBMVjRsffG0iAJqqV/NwsyLbf+WxxR
	+ZAm4RcWD31uows0a6whUlG/L7kv5JBtXzcoep+f1p+papTpmYaRYPrKz/Thso4nDRTKOZgNRYf
	+nyRVqBEHjrOddtqwWqrwB2yBlqLjrD1eDIhm5EoTCO3aEF5kjDphKecsMXg2iT3Dnt8uBLyJV9
	JFLxgkL3em7ukYbJnbJFp0/l2U+GE04snknuTlXycuqB1bGijvP6ODsRkS04a1G8itJVlAdFw/h
	R6hW7n7GKtT32ypYZ+CnW9pkc8CnPm2
X-Received: by 2002:a05:600c:8585:b0:488:ba19:da25 with SMTP id 5b1f17b1804b1-488d6822a0bmr211868515e9.12.1776254882573;
        Wed, 15 Apr 2026 05:08:02 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d665sm4819352f8f.7.2026.04.15.05.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 05:08:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 14:08:01 +0200
Message-Id: <DHTPSZKC2PI0.XUOD6LAATX4I@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH v3] nghttp2: upgrade 1.66.0 ->
 1.68.1
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <ashissh7@cisco.com>
To: <pahaditechie@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260402154556.3688170-1-pahaditechie@gmail.com>
In-Reply-To: <20260402154556.3688170-1-pahaditechie@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 12:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235194

Hello,

On Thu Apr 2, 2026 at 5:45 PM CEST, Ashish Sharma via lists.openembedded.or=
g wrote:
> Upgrade nghttp2 to 1.68.1 which includes upstream security fixes and impr=
ovements since 1.66.0.
>
> Changelog:
> https://github.com/nghttp2/nghttp2/releases/tag/v1.67.0
> https://github.com/nghttp2/nghttp2/releases/tag/v1.67.1
> https://github.com/nghttp2/nghttp2/releases/tag/v1.68.0
> https://github.com/nghttp2/nghttp2/releases/tag/v1.68.1

Thanks for the patch but this upgrade mixes features addition and
bugfixes and can't be accepted for stable branches.
For more details, see https://wiki.yoctoproject.org/wiki/Stable_Release_and=
_LTS#Stable/LTS_Patch_Acceptance_Policies

Regards,

>
> CC: <ashissh7@cisco.com>
>
> Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
> ---
>  ...xt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch | 28 +++++++++++++++++++
>  .../{nghttp2_1.66.0.bb =3D> nghttp2_1.68.1.bb}  |  8 ++++--
>  2 files changed, 34 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLi=
sts.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
>  rename meta/recipes-support/nghttp2/{nghttp2_1.66.0.bb =3D> nghttp2_1.68=
.1.bb} (62%)
>
> diff --git a/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt=
-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch b/meta/recipes-support/nghttp2/ngh=
ttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
> new file mode 100644
> index 0000000000..f7cc4fe539
> --- /dev/null
> +++ b/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NG=
HTTP2_CONFIG_INSTALL_DIR-pa.patch
> @@ -0,0 +1,28 @@
> +From eb5812d018eb96284aa6ef82569d0b6b75bcd020 Mon Sep 17 00:00:00 2001
> +From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +Date: Sun, 9 Nov 2025 12:45:25 +1300
> +Subject: [PATCH] lib/CMakeLists.txt: Fix NGHTTP2_CONFIG_INSTALL_DIR path
> +
> +Remove hard coded path to fix installation on 64-bit arch.
> +
> +Upstream-Status: Submitted [https://github.com/nghttp2/nghttp2/pull/2551=
]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + lib/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
> +index 98e3dbe7..3b6a4400 100644
> +--- a/lib/CMakeLists.txt
> ++++ b/lib/CMakeLists.txt
> +@@ -51,7 +51,7 @@ set(NGHTTP2_GENERATED_DIR "${CMAKE_CURRENT_BINARY_DIR}=
/generated")
> + set(NGHTTP2_VERSION_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}Con=
figVersion.cmake")
> + set(NGHTTP2_PROJECT_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}Con=
fig.cmake")
> + set(NGHTTP2_TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
> +-set(NGHTTP2_CONFIG_INSTALL_DIR "lib/cmake/${PROJECT_NAME}")
> ++set(NGHTTP2_CONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT=
_NAME}")
> + set(NGHTTP2_NAMESPACE "${PROJECT_NAME}::")
> + set(NGHTTP2_VERSION ${PROJECT_VERSION})
> +
> +--
> +2.43.0
> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb b/meta/recipe=
s-support/nghttp2/nghttp2_1.68.1.bb
> similarity index 62%
> rename from meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
> rename to meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
> index 49d6d7e632..71d5eef8d6 100644
> --- a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
> +++ b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
> @@ -4,8 +4,12 @@ SECTION =3D "libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D764abdf30b2eadd37ce47dcbce0ea=
1ec"
> =20
> -SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
> -SRC_URI[sha256sum] =3D "00ba1bdf0ba2c74b2a4fe6c8b1069dc9d82f82608af24442=
d430df97c6f9e631"
> +SRC_URI =3D "\
> +    ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
> +    file://0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.pat=
ch \
> +"
> +
> +SRC_URI[sha256sum] =3D "6abd7ab0a7f1580d5914457cb3c85eb80455657ee5119206=
edbd7f848c14f0b2"
> =20
>  inherit cmake manpages python3native github-releases
> =20


--=20
Yoann Congal
Smile ECS



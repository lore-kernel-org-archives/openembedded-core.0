Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F48F41999
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 12:11:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17406.1776255109858473335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 05:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=D77kv/JY;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488c2690057so67611345e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 05:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776255108; x=1776859908; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLob+iVuZeKgaZKk9fw9Orrhpx6ASRRtEMeD3EgbWK8=;
        b=D77kv/JY7AIyhe3QIdI0pso8uj1z2AEk0wP+nROnn1sRmeG99yu+wKV+YAEkqs3OGA
         +DVBQJj7RO/E2s3R2lXnLgZvUFWb0tWZAG6Y81AZAItculcmmT+qE8wd56FDIX8aY8sJ
         PQDvKoecpEVnmsdVrggPLPl4w9YfcQLcACXtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776255108; x=1776859908;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLob+iVuZeKgaZKk9fw9Orrhpx6ASRRtEMeD3EgbWK8=;
        b=RGKsUxEdnopiu6XAvOiSj46Ob8Ko5JV3X08KjyukPmWwn7onSVIryM1WikCrwVEYeL
         jcYjkP/FcK0O/GJn/7z2gvAA7rGSvw9GvIElGtCbHS97ZYpgvqxXN2bsNA6sIeF5vEYa
         c5sYPrYUxlX4UnLLiEZNh0MXoboyoxe06cOOjuts7w/SCU3l1l2NTUEPk54W/8uSnCWm
         xw0zfMsB9deAPEHv/0IwDo3AFj0YoY0O2sWiHWb/iZEA97y2RDSiC+gDII1f04P5xkqj
         UR7ReLXfMUNrmB4wYi5X1W0GiI0TH50aYO3Ks/ZPOXLKKiP1xZ3oCcXud5nFq6h0/Hxr
         l86w==
X-Forwarded-Encrypted: i=1; AFNElJ+7Q588sdTPPt7iyvSDzVEiLWTPa700edltKbpiosfHT7I/BWtGjOJ/sIk28fRRwTgD/V8V4WH55/W4a2kkDYTw2g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxM98bgWlZtIT7hhGSq0FgmoiKMeDq/uBnq9ML9PMSGZ7JI89B7
	Y7DecyTsl6uk/U38i/9+KIEu6bR1FlHpIicF0+L6kEujTiM/VJLGErNmAchmu0X1UDk5wgsk+PH
	5ZA2RtjQ=
X-Gm-Gg: AeBDiet8QUQPrzxHFaKJjkO1hURHUJ3HP72VfOxQNIqDiFnIcPGO87i0qCIeBlggTtc
	Cwk5Vkm5Fs62vVaiCQZnSE22ite25scH8ojMJpySQ8HJbfsqyqD2h7TFgzkZsaDdd3r+2OBE8Ik
	kSsFVn9YVj93eRxxLDcUcTehvnBpEQqJ0/dJascfO32EtpDH7bAzQe13NqulhNFTT5b1h+wPmGU
	gugVnPegWHd07Y23rIb24mbyBD1FR5aj3FS+2ccxy8ELrJExuZVW7xgk4BW4LDptXFr3x+b9M70
	faMUuwGUY/6u5/9aLMJbAyjdJGQzNb98h1Tk8n6Ri+Qy/A1QmghPzA3SJ0FQ+S/1Mqak2Hk7krh
	DbpqxHBhA8wVHuU9ez74bctaf4fqkPNJi474/haUaVy3lHOcWsVS/Tr4g7SR8dlk0gHYmCfnqxg
	O5zZG2vLMWn+svNY93A163qCee6xgrukSr6SWTSEzrS7Hc8aw5aexr6AwgI8kBbugZ1f9R7MUcU
	VZ8rryilDws+pz0E7gAXQ==
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-488d680577dmr285996755e9.2.1776255108126;
        Wed, 15 Apr 2026 05:11:48 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f1de4ffasm51087035e9.5.2026.04.15.05.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 05:11:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 14:11:47 +0200
Message-Id: <DHTPVV82PBGK.1GQOZI9EH0GOS@smile.fr>
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
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 12:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235195

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

... and I forgot to add that this patch was corrupted (even if it
applied):
There should be a space ending those last 2 lines. Those should be (with
'_' to mark spaces):
+_
+--_

Some tools might warn about lines ending with spaces but in those cases,
it is legitimate.

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



Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6758FC369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 08:32:49 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.12201.1746001960497521729
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 01:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gODLSyfR;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso1135360466b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 01:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746001959; x=1746606759; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YbK3gowfEPcuWxmp5f++tRI8g9v7kDLW9LU6jpwrVXc=;
        b=gODLSyfRc4Ftahc3wf8I1Y8TIqxGHZ7sjIgWNUPuUw02X9chkRJy5XTteOpNaKfPBS
         U2sWomEkGQ9FCfo09FEYcyVCfbHeKaVnwocCfX9NVg3oS3XcbG0r50Kt2Us4BEt29DPf
         NyUkW32oBsmMIE8ItpQwLbVf13kymx2hCogxOyZFyr87aA2UdV0eCUdAEyUUNEZfQk/I
         PfJ9rXFOOAhleRBSZu3S4V68BgswSBbKEcLY9Sfy5XPiOJzXdygt5zjoVHCWEfq5C1kq
         x3e52Fv5ktAY05DsIfZ+xMMLcSguEjGh4ufWt9Z7mCw1LZkexhmIbYBspB4jwYB8JRBN
         iuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001959; x=1746606759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YbK3gowfEPcuWxmp5f++tRI8g9v7kDLW9LU6jpwrVXc=;
        b=GS/B7NqnfDWwjnqznUtBNXMW4bISsOTJoGiLctFghsliFVxa1NYDMTC0bbc7MapV/o
         kyhr25k1iVJoUyPx4E6YXGTyJeJeKJkJtoPO7frVo+6+hLckEI7svu58vdqSd7+a/QSM
         Sh+mus2tSGQHJKcm4Qr9ekjkFlM5KubpwQfJot2u/l2G8kjgWRSuTEgnOFwPPS4y7unT
         wamGBlBLtPzaq/CZz8/4WUjP0472K54JfwBWsxwRgxb+vlyP0xxAMvzvWP1obTCrZsSB
         zNdzt/E9znVq3ZHGPu8KxKgN5GzO8mtR6ssx5aVXr9aUKgILwOE308FRLJ3fla9/yhpC
         H1nA==
X-Forwarded-Encrypted: i=1; AJvYcCVTgkmcjVCMrnF4YIzHmUfIWelf+pnsz90kdVDhSTiiUjGlYZNN7QyKVh8JgV/sU8uAazhAg+idRdVwqG8F7ik+RA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YygmPgJ8KCcjHnvR2OskuNAVafDoz09A2H9hV65cVTRyDISjFNC
	z1OAoc26S0ljg+fJQIRmrCep3y3kTyS5RjKUrdjybXsCMjeckCKs
X-Gm-Gg: ASbGncvrhDjEwxgV/fxmkt5sNqFc/yZXv+vV+aW2FDqofJt25WIfaH+xkdYPd9XPIpE
	sq4I7+ms1UjT/+rlT2u532R0oh5DTDhbes2m6a+1kgidKks5WZ6MVZ8Va+Ty+pNXRTY058pozwH
	42Fb6p5TUMorzrnRQiES03yzfeXIFPfUXgvBAPXIFZQ4FnaM4ZqlH+/psVlxLKtAHfVvJiXpv7V
	YnN3HEmxgHOQDlIDqnE96uQKXH0OIfQec6u2ZuwDxOW1fj9MA/diL+kyscTu1JtBB6r01SKeIlv
	GwrXqQqMoTf23bblO5uiMIEQQziXa0Tj/QXidZOkEYSJhB5m
X-Google-Smtp-Source: AGHT+IH1qlCuTsXC7hXC5F2Dq616K5gSB9aM6iaaSfa9WWsvS1SpCVWtPEOxCM0OKMSYZRkRc2vLhw==
X-Received: by 2002:a17:907:7d87:b0:ace:4197:9ac5 with SMTP id a640c23a62f3a-acedc612cf0mr246607566b.27.1746001957168;
        Wed, 30 Apr 2025 01:32:37 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aceccc1cad9sm203977866b.46.2025.04.30.01.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 01:32:36 -0700 (PDT)
Message-ID: <50f1c4bb-f7a5-461d-9222-a0b0ffaeb7ab@gmail.com>
Date: Wed, 30 Apr 2025 10:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libmatchbox: fix version mismatch
To: yi.zhao@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250430003941.561146-1-yi.zhao@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250430003941.561146-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 08:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215730

On 4/30/25 02:39, Yi Zhao via lists.openembedded.org wrote:
> Backport a patch to update version to 1.13 to match current version.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...ate-version-to-match-the-tag-version.patch | 30 +++++++++++++++++++
>  .../libmatchbox/libmatchbox_1.13.bb           |  3 +-
>  2 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/libmatchbox/files/0001-configure.ac-update-version-to-match-the-tag-version.patch
>
> diff --git a/meta/recipes-graphics/libmatchbox/files/0001-configure.ac-update-version-to-match-the-tag-version.patch b/meta/recipes-graphics/libmatchbox/files/0001-configure.ac-update-version-to-match-the-tag-version.patch
> new file mode 100644
> index 0000000000..093adc89ae
> --- /dev/null
> +++ b/meta/recipes-graphics/libmatchbox/files/0001-configure.ac-update-version-to-match-the-tag-version.patch
> @@ -0,0 +1,30 @@
> +From 18a5c0969cdf2e6e2e20ad29e7b23c6fb58dcd6c Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@eng.windriver.com>
> +Date: Tue, 29 Apr 2025 10:25:29 +0800
> +Subject: [PATCH] configure.ac: update version to match the tag version
> +
> +Update version to 1.13 to match the current tag.
> +
> +Upstream-Status: Backport
> +[https://git.yoctoproject.org/libmatchbox/commit/?id=18a5c0969cdf2e6e2e20ad29e7b23c6fb58dcd6c]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index ab9f60f..0ef4977 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1,5 +1,5 @@
> + AC_PREREQ(2.53)
> +-AC_INIT([libmatchbox], 1.12, [yocto@yoctoproject.org])
> ++AC_INIT([libmatchbox], 1.13, [yocto@yoctoproject.org])
> + AC_CONFIG_SRCDIR([libmb/mbtray.c])
> + 
> + AC_CONFIG_AUX_DIR(.)
> +-- 
> +2.34.1
> +

I wonder if instead of carrying a patch in master branch for a
Yocto-internal project wouldn't it be better to create a new tag with
the correct version info.

> diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
> index f212eb5e96..af3aa23110 100644
> --- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
> +++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
> @@ -14,7 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87712c91ca9a2c2d475a0604c00f8f54 \
>  DEPENDS = "virtual/libx11 libxext"
>  
>  SRCREV = "35cd78efa3120efc46497f55c04382be960d1864"
> -SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https;tag=${PV}"
> +SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https;tag=${PV} \
> +           file://0001-configure.ac-update-version-to-match-the-tag-version.patch"
>  
>  S = "${WORKDIR}/git"
>


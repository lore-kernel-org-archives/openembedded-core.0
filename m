Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628B3C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 06:58:55 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.75815.1753685932726612894
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 23:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dTBdXW/g;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b7825e2775so1685051f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753685931; x=1754290731; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o0oTLYQ7P7FFb06F6b9+5b14bFL86TuTqhl2Ze4c0Xw=;
        b=dTBdXW/g0GHkLSJ/ODEaI6zU73x/c3z2AjZpxwpQ9ABfUkfT3dRAkP0p4txnkX3d6l
         vhnGH9XJfRmV3SQNtqrKZcJmW+fFzrpxq1/4vhtpvSaB73KPFcaM6/sovC1A4zDatY4v
         lMMaS6J0Rn6DvS79hcQgbLlgYRsnF6o+ZEXmPzEj6SYdWurvoFfLqJnu+7Ir+t0q12Uw
         IsSfPW/JNuyIc5LViMHvD76EOp9LhbmLgT/FFl9IAc63HXY84aFiaKGYAH/abAElgZwd
         bsvuZLGz4twYPDS+qTFVR/wNohBi1ig4Y+otnlWksqA1UmpQscrIxo73LfVnz5/ZtBFY
         hd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753685931; x=1754290731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0oTLYQ7P7FFb06F6b9+5b14bFL86TuTqhl2Ze4c0Xw=;
        b=eYN+fbgt5vjLT4joxN27MSjBY8dGf49wiIytTI/TKQxd2gp3+FATHckHkOxcqmhg/p
         H3WlrNoFFGo546W+jJSphNrDkp48qqp+jZfl4/tbKtRhN+c+GT7+/C8ZoHwKdbxqTehs
         8ipyDfAIg0GqGmjP6aethg/WIf0A5NqmShK+EL4D3CZpPDX+ZFdeJOrHBu55ScpsqysZ
         /cDew6zvde0IcH6bijhM5Y3wPHQLw47etK/46iCvxiUE/BTXijOhpBunek8FgRoQxoR+
         XTSWIZpM4w+NjIlLIOKwXGUfk/rtI0kWJYCAFtfU9Cc3Gqna3EzC58hbKXJrX9TM62mJ
         8wJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqpfG7wo9BCK8MrzYHDNsfiw2CdbbXgKTlp/ZqMsXZ/qlJW6rMfEdRGyatPmVpj8zudqLV6eoYST3p/T40L0GSAg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyaNeNM2JDmjtkhlJCHqpxILfdUuZNMeaimTSe5f3tRZcYpzp6T
	nD2f51AcetROCcjYe/4GIdgE6KYKMU9BqUJf6GnOw3VkBrFYZraHuQBE
X-Gm-Gg: ASbGncuDUOSuryXE+CVQ2Ld/NgcARYnvRPgpZBXvDy4/ygO9raZrkpAoULZ7FPIR8o4
	3WRvsDPBEv8yHPhQ+jgo0P/2PLXDXhlX46ETpu+vAw1At46Yap1ho+jxcrJq0iwI1ED2T99a6CB
	jClp1E2veBAcVRv8qyyzDsCPpQD2cLktjJaeyc9WlHh31BKbf4Jlmw9sd3vDWoiMEZMPzsg5Q6h
	USTBung4ABBb5K+0T3x32RrBCogbj6w+24/g9VhKKRD0xariE+ewUUVrmyn8WYAvUzWOMRE6QNl
	kqL4TOe99nnb9VQ3NQ9prtjyp3QRWeDRTPqVgXAoluTvI0zYdyeVfI8iv/OmswPq+BuXtp4kjuk
	zJn1Yjr3dtK9aKmFE8kA5YDNuoPCKjA==
X-Google-Smtp-Source: AGHT+IHrGPFmpc1YsYlOcU4nEl36pKtgeKvhjUd9nUa5+QR+8mQ8VxTKhWAc3JGlDghVvbak0OHnEw==
X-Received: by 2002:a05:6000:26c1:b0:3b5:e714:9770 with SMTP id ffacd0b85a97d-3b776733877mr7808867f8f.14.1753685930862;
        Sun, 27 Jul 2025 23:58:50 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb9c7dsm7748982f8f.21.2025.07.27.23.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 23:58:50 -0700 (PDT)
Message-ID: <efc50221-0504-48ab-abf9-0a76e5f076e1@gmail.com>
Date: Mon, 28 Jul 2025 08:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/5] spirv-headers,spirv-tools: Update to tip of
 trunk
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
References: <20250728032045.2783514-1-raj.khem@gmail.com>
 <20250728032045.2783514-3-raj.khem@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250728032045.2783514-3-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 06:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220992

On 7/28/25 05:20, Khem Raj via lists.openembedded.org wrote:
> This is needed for compiling SPIRV llvm-translator from llvm 21.1.0 rc1
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb | 3 ++-
>  meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb   | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> index 1da2e74f93b..b1cec77080a 100644
> --- a/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> +++ b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> @@ -4,7 +4,8 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
>  
> -SRCREV = "2a611a970fdbc41ac2e3e328802aed9985352dca"
> +PV .= "+git"
> +SRCREV = "de1807b7cfa8e722979d5ab7b7445b258dbc1836"
>  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
>  PE = "1"
>  # These recipes need to be updated in lockstep with each other:
> diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> index 319b25b7f43..f66b25c60db 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> @@ -7,7 +7,8 @@ SECTION = "graphics"
>  LICENSE  = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  
> -SRCREV = "33e02568181e3312f49a3cf33df470bf96ef293a"
> +Pv .= "+git"

There is a typo in PV

> +SRCREV = "a983ab19d6f91a07a8272767427b6c5208576d08"
>  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
>             "
>  PE = "1"



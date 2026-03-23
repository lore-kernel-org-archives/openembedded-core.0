Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BB2EC01C3
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 10:26:31 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13957.1774261584164618202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 03:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DZ9CtcZK;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b3f91a7abso2353722f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 03:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261582; x=1774866382; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6LVQOtAXfytgFdkOw9Dw9G+3rbcPik4lqUCcx9EtkAQ=;
        b=DZ9CtcZKOsNgacoGlKQMZJuGLHQcLDyjAbs2DXeLM0RaFT27NKUEFZNyuAS1cxRTkl
         cVib76ElI+st+1EAgXE815DVLu0wglJ2dpWfODIC7aJUQ3ge6XS7dbVmADRWqUbvdlNP
         l1QrPXMT4LbJS1XRfgOfPwP99J6cXNOxGjs6+59vZn7fND0qIfJAXqMx7DgUQ9SVtZms
         MUMbH7jAQtai1Tn7DJDFCJWrbUDbj0eMA9hE/On2W7P4zrYxN6A7tNp69+ZbHsjrRDWm
         /8zv+c70VB8dbXLHPvOfGTZRmeurTycmhSNJxhvZBNuD/uMm8lvK06UkMRZ0+vHJFKcR
         rCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261582; x=1774866382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6LVQOtAXfytgFdkOw9Dw9G+3rbcPik4lqUCcx9EtkAQ=;
        b=iTVWyCX1rr2cGmkCl7BKRjp+r/Nm9w+xCbs3hzT+QZkWLQZVeAS6RHNpy/97xrBudV
         a5E86y5mUP8F2wLsaAAdzvUw+gVYMjGuiso/1kYl3mj2x7dFo29CcfM2+962LyzFfPmE
         /e4ZQUA8y3ijnXsmvhpoI1EdBqJUsY5p4PnwvULZ8nRvhaR/5nnhlOx+wPNI9Mz6yTu5
         g5JfeGFmr7570NLbdNI0xyvg1p7wKSEflwINtp4xbcv4fuzPa+ATIKV88+kSZ/7daF2z
         d/wfyJ3R5tSV+LoZtHf1DbcmV1jgeVTn8TRjv2zQqwaxSb2SVc227Mr7w6b2Zz17fkO4
         RVtw==
X-Forwarded-Encrypted: i=1; AJvYcCVtXqIw+2tD86bBgDytYRn4bYpAEaFll6YaCjxMuoRAlRCqe+25zga3S6h00kT3BsR4dPJiMRlxOlyn/gM94QsPZg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7b00fnBbqM6+dyr4eLt+IMS82t2s0NqDafqT9kImROhukHoZ5
	1uNEZDKuIJfatUkEbCZXCp7Fm6+hyRGc27i1l5r+/0U0coeBl3xGh2Ec
X-Gm-Gg: ATEYQzzSm+WBZfCp7xkhGdBABoOGFIdotB5uP/0wzkMvBAUjsecX03Jy1XnuXghy3Il
	6oGAr161+u+Ai7Gjl7NR8qDX0lUyUwCWVat5ZojsjOmo2LWrOrMb+jl75REctHGSV4DYF0Sfm/2
	RbjHHoYIAtdzue4ETE0AhGx9qBdn9PbVgccexlIqX0dAHXrtXq5l7QfWWzJkWa2WbyI0WIc+ilJ
	U6S7mG2bWGKWpvkecsu9yeS65g5vlat5eZjGTVUMUFP8RBAcvh/pKsxZQKGMHp0AmEixi2F+dv6
	YMySxDHYSGBGzsUdjkHpn68BJlDq3hhcJJvC0pKWhyBPy9MVlVC/ONZffHyxW1gV8FE7oy55LZa
	Qge0VbdiZ25yp4+Y3rngdd/ryCVuaUQKqpsoimQ4mmrfOHpfi8xWqk//AEL4o3KY/M0VzSwq2x2
	5pmfLgWwtcCI7PaP2XhW9/8K+gJYuhYhVIqyMF4UfMrQo4U3ua6j34zl+v8Pq0SfvOQA==
X-Received: by 2002:a05:6000:144c:b0:43b:4153:c2a5 with SMTP id ffacd0b85a97d-43b642919f7mr18567784f8f.49.1774261582111;
        Mon, 23 Mar 2026 03:26:22 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm28409725f8f.18.2026.03.23.03.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:26:21 -0700 (PDT)
Message-ID: <3f1ab09f-344a-4d04-b40e-ac25af38e8cb@gmail.com>
Date: Mon, 23 Mar 2026 11:26:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 21/40] mesa: upgrade 26.0.1 -> 26.0.2
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
References: <20260319101332.2067-1-wangmy@fujitsu.com>
 <20260319101332.2067-21-wangmy@fujitsu.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20260319101332.2067-21-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 10:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233709

2026. 03. 19. 11:13 keltezéssel, wangmy via lists.openembedded.org írta:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   meta/recipes-graphics/mesa/mesa.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 14dc7b6c51..a95adfc960 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
>              file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
>   "
>   
> -SRC_URI[sha256sum] = "bb5104f9f9a46c9b5175c24e601e0ef1ab44ce2d0fdbe81548b59adc8b385dcc"
> -PV = "26.0.1"
> +SRC_URI[sha256sum] = "973f535221be211c6363842b4cce9ef8e9b3e1d5ea86c5450ca86060163c7346"
> +PV = "26.0.2"

26.0.3 was released last week.

>   
>   UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233502): https://lists.openembedded.org/g/openembedded-core/message/233502
> Mute This Topic: https://lists.openembedded.org/mt/118397670/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



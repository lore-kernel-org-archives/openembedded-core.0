Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACC1CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 12:03:31 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.15630.1757505804478985936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 05:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mykfxt9a;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b042cc39551so1200171766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 05:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757505803; x=1758110603; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qxu3XwFyKJFr2oYrfo3rJxhCZr0X1OCc9tdLaA6LOD4=;
        b=Mykfxt9aI8myGtqv+QsNEObCXFar1qFrOnWuEihbY7WO6fGJYfmNsvfyFi2Dlc2N0K
         FDfIN3vNi+6VuGwTzJo2lLhq9W4l0aOEu2bOgR47NSNUxKi9Jb8JLcQhLKCgfE2UnKXJ
         8fF5CTjNQ8grxNGM880y+Jh3vEt5Np5R4+v5XqM1ObMIkB6n10ScL+t8T76nooZWYj9O
         pnsBu7c2SrwB1GQdU6p5qa94/B2ytQmOxrJ6oWLM+zLvXl/Ts55HcDpmxFnZG5qy5qUO
         NDkBAtVe2YeqdxkfoaDwXSWLZzvQLYxvmI9W2B1xq617Ija3Q/hIcuAodfUaTTviCytG
         eClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757505803; x=1758110603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qxu3XwFyKJFr2oYrfo3rJxhCZr0X1OCc9tdLaA6LOD4=;
        b=gEq4cZASJUpLa2L2bRMS8X2p6+akM2g4yvZLzlazQfl1xEHSKBmQQwTKDNsV4ZQCyA
         OT9JXX0a3pTs5P/tkm4lvUsrAwU0Kal1BuqI/blKKPwiUZtQGp8saBdtFAeUqCWvL5hK
         B1D/qBJ4LAz2nbwWlKjZnhEPSbqxSRTPHU7bVQDIrUgIo2oZkXuCEdA770J8OngFO6sb
         70czwc3nvf1NSnZBbBmGvKB1iCPWwQ6rLTpGSj67qSLrFCD+NJH0zVBnisfmwjkHOCon
         LvXfoAArWHAsJCgR9PDXjdAww90MBZW0yh4oktsWbZ5xoe1YbR3RtLjupWfM2ipS4EaZ
         KU8g==
X-Gm-Message-State: AOJu0YyF9I6FDlR2clxJ3jMCooaNQLwE1zIWFGQLKDKkTuL6IuTMLFCu
	P8fBPpC0dBpAB03O0lApXtIt7sQ5TWfPAphXtMt9m9BzZF68djGCjAPCzgZ+9EWw
X-Gm-Gg: ASbGnctfZRCFASvnGd+2Ehwc44RRR/0WD7Sko7Bq47nmEloBN5gLLQjWlA7n1TeRYZD
	tz9c2AFbkZASdvxqxVpKGmYD5Ocx3f9bS+51mAdRU2tHyDdh2jOCfUj3IXckKph9ZBqX75nSxpu
	H+czseT4eBgp7voQfYLpXIvypHH8rXOP1nxKv0M8uxRt78UMBxk7+xo7vZ0xej5d/ujxF2bC45T
	gGdaybqcVa0QwYcE7N5ZTPIA86CpaJAMntOtOMFmzfAUc8pfVp2V7s6mREL54w4+MvTeCjR2CkB
	X4Zh4DigRz5ekp2waKYisI55Q1zznpX4x9+bvVN1jSA2rUcAYXuQ73IkuEdxSH52mIOHKuUh/1d
	/vfyKijNM1HPhn2m6cHvUpin+wI6o7GWS+JAmrynkNg==
X-Google-Smtp-Source: AGHT+IGr6cufqsmu502XfzbAY88twbRcFuDyg2XFrzK4eIQcqvwbAAIcJdtFWN5wkfSWtcOh1VJ5ug==
X-Received: by 2002:a17:906:b790:b0:b04:b94f:6915 with SMTP id a640c23a62f3a-b04b94f7824mr1315314466b.11.1757505802311;
        Wed, 10 Sep 2025 05:03:22 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830acd07sm157852666b.32.2025.09.10.05.03.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:03:21 -0700 (PDT)
Message-ID: <fbede54e-1365-4cf1-91d7-10d937e46439@gmail.com>
Date: Wed, 10 Sep 2025 14:03:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] libpng: upgrade 1.6.48 -> 1.6.50
To: openembedded-core@lists.openembedded.org
References: <20250722152701.1718859-1-skandigraun@gmail.com>
 <18549C5120596710.28644@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <18549C5120596710.28644@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 12:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223206

Out of curiosity, did this patch only fell through the cracks and that's
why it wasn't applied, or is there some issue with it?


On 7/22/25 17:27, Gyorgy Sarvari via lists.openembedded.org wrote:
> Changelog:
> Version 1.6.49 [June 12, 2025]
>   Added SIMD-optimized code for the RISC-V Vector Extension (RVV).
>     (Contributed by Manfred Schlaegl, Dragos Tiselice and Filip Wasil)
>   Added various fixes and improvements to the build scripts and to
>     the sample code.
>
> Version 1.6.50 [July 1, 2025]
>   Improved the detection of the RVV Extension on the RISC-V platform.
>     (Contributed by Filip Wasil)
>   Replaced inline ASM with C intrinsics in the RVV code.
>     (Contributed by Filip Wasil)
>   Fixed a decoder defect in which unknown chunks trailing IDAT, set
>     to go through the unknown chunk handler, incorrectly triggered
>     out-of-place IEND errors.
>     (Contributed by John Bowler)
>   Fixed the CMake file for cross-platform builds that require `libm`.
>
> Ptests successfully passed:
>
> ============================================================================
> Testsuite summary for libpng 1.6.50
> ============================================================================
> # TOTAL: 32
> # PASS:  32
> # SKIP:  0
> # XFAIL: 0
> # FAIL:  0
> # XPASS: 0
> # ERROR: 0
> ============================================================================
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../libpng/{libpng_1.6.48.bb => libpng_1.6.50.bb}               | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.48.bb => libpng_1.6.50.bb} (97%)
>
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb b/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
> similarity index 97%
> rename from meta/recipes-multimedia/libpng/libpng_1.6.48.bb
> rename to meta/recipes-multimedia/libpng/libpng_1.6.50.bb
> index e603df1edd..aa2dc99f10 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.48.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
> @@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
>             file://run-ptest \
>  "
>  
> -SRC_URI[sha256sum] = "46fd06ff37db1db64c0dc288d78a3f5efd23ad9ac41561193f983e20937ece03"
> +SRC_URI[sha256sum] = "4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307"
>  
>  MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220753): https://lists.openembedded.org/g/openembedded-core/message/220753
> Mute This Topic: https://lists.openembedded.org/mt/114288160/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



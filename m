Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CC4C8303F
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 07:24:30 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.9268.1756279463785455398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 00:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nEXt6bSW;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afec56519c4so36830666b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 00:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756279462; x=1756884262; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNqRpTm1Z1k1iG9ltvm0XOZAWvkNCcqmPCrfesYLh8o=;
        b=nEXt6bSWeuzUZ6ws/XvfAE6quRx6l7RMSbYdCbpXdVLSPgsvYWkgi/33GbBMwMMZ2+
         VLJz/WNZtFBiuQ1m+Kl0PyYEG51vLraQsvgWBxmP5ZoywN6Dw2WCEq7jJG6W5L868TZn
         oiaYPC+jSihTuFSVfiC1YseWeKnB3i6NwbmiXfvPQ+bH7k8mws/A9QzD9kMGBtjT8309
         pE6Tfn158cNniVzuuhut7yaq0WJUgOWtottsV9ELoou79u+vGEMsKWANhpIKLgyWogPi
         R18Zwwy/8W9TtTkfj05RALRNkDnmoq1y0JBiGbvWd4sV+/do/fRncugr/yqu9Nd48Gri
         Dofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756279462; x=1756884262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNqRpTm1Z1k1iG9ltvm0XOZAWvkNCcqmPCrfesYLh8o=;
        b=hlFLyiFkSOrrnC2srZBSUSTAD+q8TfxX2RM0HuDhaOeakCYTFOUJ4DsTDhQ+E9rK9H
         BERzCayjRKIceW8FX+3nZtY6mHaSqzLhGaXHtC6lRF3Zu7jJGvsQTeiFuD5MjDREHeVN
         vIcm6KCT63KGx/EOha+u4qgtU92K5ASs2O619+KeSayP0k2Ht4HgktbVyO1SoEPCS6fZ
         QB7mOhpQZYvJ3wZc/OmIXcxfug7ZWdtu+ZIbA1ZgaNIdmu/i4Y1ueYMavQI8qD1Z2ubf
         g03/qk8oes0RvrYiZt7zlHOcI3/FskNu4K8/J//pxesKPBzuGLCHluXMmtO8WF65Ss/o
         IFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/OE0lMUpT5t3GARDBkC1KMBwIbTmryeyqCT9wbYJwfmI7U+4ozlssv+udGOCRX2A9NXB9lmkku4v3PK/gTKFhMA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzhC6iD0b4JnY+s8OnOFaeb5/Y6OtHlraT09AzZAMlsknzQ/ATl
	pkOnVWttLtNAPHRhuvXlyBM+NMwCqswqFx8Rm8Ch8aMqw0M7Km9e8oUs
X-Gm-Gg: ASbGncuWj/QwGygSePsDgge30F9Wg2STvI+tZzVVfh5Lp9fPgYUg3SU4K3soJgq1hsC
	P6xEdWZQoCt855Dc5Z7vAoCnljdMozDP2g2Rsc8JqOSPLsk6Ap+SsdYQp9peAieqJ82YRMC/W+b
	2O6CfAIlIYE7xnhZ/M8d35Lk68wJVWBW6j8QT3jYH1Esu+6YMFjvwv0f4dGcrwkrXgPqxmEcmYR
	F+OwfB1YR4CupQy4v3aD5Loy8ttmMSsIA4KlCPaRFjnVMitTPFSBXc667Ms3B4SbfBYVjSyEH71
	PAd0Px8WuVuDrtmwgihanR/j3FHPaXdqhM1sooMszQyXYr/NzWdUc+eMSrCkpnm4oIm22d0ml6Y
	DkrNcxrsuUdXX1xAhutoygR04podOqFOXo7iUe39qHw==
X-Google-Smtp-Source: AGHT+IHSTjrYE7mA0CkJls91Eaz6+IPYAStDDWK0OO//oRa+SL7NoRGZoc/0DyeuCRHYyrtKLpE8+A==
X-Received: by 2002:a17:907:1c09:b0:af9:3341:8dd with SMTP id a640c23a62f3a-afe295c07dfmr1808142066b.31.1756279461769;
        Wed, 27 Aug 2025 00:24:21 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cbbdac046sm251905a12.30.2025.08.27.00.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 00:24:21 -0700 (PDT)
Message-ID: <689b7dfd-a379-41eb-889c-e680d03e55d3@gmail.com>
Date: Wed, 27 Aug 2025 09:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] spirv-llvm-translator: Upgrade to 21.1.0
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
References: <20250827043603.2833795-1-raj.khem@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250827043603.2833795-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 07:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222497

On 8/27/25 06:36, Khem Raj via lists.openembedded.org wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-translator_20.1.4.bb => spirv-llvm-translator_21.1.0.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/spir/{spirv-llvm-translator_20.1.4.bb => spirv-llvm-translator_21.1.0.bb} (88%)
>
> diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
> similarity index 88%
> rename from meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
> index 64a73ce55aa..6a6c6ac77c4 100644
> --- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> +++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
> @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
>  
>  # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
>  SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
> -SRCREV = "74843f2186bb63b6802758222084da17fcbe603c"
> +SRCREV = "acb023b63a4bafd53d0ba6a1a452b1f0e5671458"
>  SRC_URI = " \
> -    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
> +    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH} \

I think the "tag=v${PV}" tag was removed accidentally

>  "
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> @@ -20,6 +20,7 @@ inherit cmake pkgconfig python3native
>  # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
>  # for CMAKE_SHARED_LIBS=OFF see https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/1868
>  EXTRA_OECMAKE = "\
> +    -DBASE_LLVM_VERSION='${@oe.utils.trim_version('${PV}', 3)}' \
>      -DBUILD_SHARED_LIBS=ON \
>      -DCMAKE_BUILD_TYPE=Release \
>      -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222489): https://lists.openembedded.org/g/openembedded-core/message/222489
> Mute This Topic: https://lists.openembedded.org/mt/114912974/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



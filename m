Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5341DC83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 01:07:29 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.2363.1753146440913897106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 18:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FdxZ/8Xu;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-236377f00a1so40578695ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753146440; x=1753751240; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=op8vLz7mcShsL5qgv0gezoHz6vhw18rJ+ZdG5N0g5h8=;
        b=FdxZ/8XuDjidRasSYt+szoKZes6zQ/0ZVo5TETgE+BAKbbT4upYVrE14cix/YboIBr
         yl8jZZV/S70LiOsuTxkdroK/4S/2o1zMh02Aka5dncThE4LaMjoIeXYhtMpCR7mQ5rIa
         82QXyg+F3OxryqBOqmoFzPk+jHmeajXBdLazmaSaYvK5XR7KyyVIbfsRd0bH6nq2ctpF
         HStV4SA/AgQJzEv8FBqOhdY0/Lk245EsET69IBFNwHFTWYiKzUrPE5/CDaEO/E1VwHpv
         U8/skvYnTNKxWrBoTv1nqDygk7xsnoNmOK3aF8ZH8KaW34Ns5IMd2kZ+CkHd3/KrDD/V
         VyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753146440; x=1753751240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=op8vLz7mcShsL5qgv0gezoHz6vhw18rJ+ZdG5N0g5h8=;
        b=DuGChERePnQAmy007e7plyjwer7w05UUnMCmti7zJwCDhWg7INyzVOQjSiF/TnwaBR
         viUgueaLDVxki+P1AvZEb+fmhzkLibJco24NwkCFKG2UtcEs9hxppZ5hbifwGPjsMd71
         mOBRME3jrqabKtcN1DfB7nkxRun/2x5EPW8VnlCZWVTA4xFmf7DxO2jJjKKODkJD+w0M
         ZDq3Z1NZnhMDDYBO9kZVTjOD0ZXA8lDPxPJAqsTz/B7WvvfuRWa0FM+9C0RgcoO5qZBc
         TK75mgnHYRGfxybugosvT0gdMOgTjzcx3ThknlIrqP3StjXsbVw7+C4tlz481OI9pVNv
         9iIA==
X-Forwarded-Encrypted: i=1; AJvYcCVQCmik/C2LKzpJJZ/LKxy3rdQtW5NKkFNfCnWmfGcRftq769l7FY12/m1wwh6g2j67jS2vb4rmJ9rudDcRUU/oYw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywex72xOrFhPwuIqubHFsW0JDyubNslMUKShUIonb04G2WqxeXK
	62FgYJSmZYPc7b2njSyIrlQMtQQ22yOzz7USRzi4w3YVPRJt6ZHNg4Bp
X-Gm-Gg: ASbGncsn32BWaZ0PbkONqzxEGyh8wFP6huX5HpdAY4N8HlZWvJPQhTTB+JEopAbfDJH
	SEGyPRWteQmk8ms0Qm/Lymc0fuDaviWBJc4MUbyReCm1+UzsLTnzu+KPyPBuqFafFbd1sgU9Z0w
	1iPbGpv63BUD5jXVnFjSFH3d+izOfJzSrFOA45jfVHBMpAub637Y8KkDBTg3VyCaTjIomsZjH53
	B5vBhXFJWSz4vlnEmcnq+5TNN8rPrOZxP1rIZayuwL1mOgZmRWCkWInUURcEEJ6kguaGGRvaOI7
	IYQU5kWctF25RyINJzP80t/rUIFOSbE8AeHBM39334kJmXgbNwSp6GIZtEs+yn6pQezCve3iDar
	xbXl4v4iV0PukgF2M4zH/YIsccINab0llxfBI
X-Google-Smtp-Source: AGHT+IGVnOwT9O7MECMmCgddOA9wquDOfMBYjaJFak7CIUHgxOaRo1xaMeiUsH770VFtrWvvx/qZwg==
X-Received: by 2002:a17:902:e804:b0:235:779:edea with SMTP id d9443c01a7336-23e24f56b2emr374217735ad.38.1753146439996;
        Mon, 21 Jul 2025 18:07:19 -0700 (PDT)
Received: from [10.15.13.154] ([209.129.148.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f2b7sm64473835ad.79.2025.07.21.18.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 18:07:19 -0700 (PDT)
Message-ID: <8880286e-04d1-41b8-a1d9-55b7b5278cd0@gmail.com>
Date: Mon, 21 Jul 2025 18:07:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/4] readline: 8.2.13 -> 8.3
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250721082103.2262095-1-hongxu.jia@windriver.com>
 <20250721082103.2262095-3-hongxu.jia@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250721082103.2262095-3-hongxu.jia@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 01:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220712



On 7/21/25 1:21 AM, hongxu via lists.openembedded.org wrote:
> Remove obsolete patch:
> - 0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...ages-that-are-not-compatible-with-C2.patch | 29 -------------------
>   meta/recipes-core/readline/readline_8.2.13.bb |  7 -----
>   meta/recipes-core/readline/readline_8.3.bb    |  6 ++++
>   3 files changed, 6 insertions(+), 36 deletions(-)
>   delete mode 100644 meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
>   delete mode 100644 meta/recipes-core/readline/readline_8.2.13.bb
>   create mode 100644 meta/recipes-core/readline/readline_8.3.bb
> 

LGTM

> diff --git a/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch b/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
> deleted file mode 100644
> index 3bb4d539601..00000000000
> --- a/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 9459ee899a291c55f08341df63e9a1b9b7af200a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 16 Mar 2025 12:48:46 -0700
> -Subject: [PATCH] Add fix for packages that are not compatible with C23
> -
> -Fixes builds with GCC-15
> -Sourced from Fedora: https://src.fedoraproject.org/rpms/readline/c/c47eb813afb942128253213ad5b8221770557e48?branch=rawhide
> -
> -Help getting packages like bluez5 building
> -
> -Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-readline/2025-03/msg00001.html]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - rlstdc.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/rlstdc.h b/rlstdc.h
> -index 2aaa30b..a7a0ef3 100644
> ---- a/rlstdc.h
> -+++ b/rlstdc.h
> -@@ -44,7 +44,7 @@
> -
> - /* Moved from config.h.in because readline.h:rl_message depends on these
> -    defines. */
> --#if defined (__STDC__) && defined (HAVE_STDARG_H)
> -+#if defined (__STDC__)
> - #  define PREFER_STDARG
> - #  define USE_VARARGS
> - #else
> diff --git a/meta/recipes-core/readline/readline_8.2.13.bb b/meta/recipes-core/readline/readline_8.2.13.bb
> deleted file mode 100644
> index 19b5cb6f583..00000000000
> --- a/meta/recipes-core/readline/readline_8.2.13.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require readline.inc
> -
> -SRC_URI += "file://norpath.patch \
> -            file://0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
> -            "
> -
> -SRC_URI[archive.sha256sum] = "0e5be4d2937e8bd9b7cd60d46721ce79f88a33415dd68c2d738fb5924638f656"
> diff --git a/meta/recipes-core/readline/readline_8.3.bb b/meta/recipes-core/readline/readline_8.3.bb
> new file mode 100644
> index 00000000000..ff5dec6c0a6
> --- /dev/null
> +++ b/meta/recipes-core/readline/readline_8.3.bb
> @@ -0,0 +1,6 @@
> +require readline.inc
> +
> +SRC_URI += "file://norpath.patch \
> +            "
> +
> +SRC_URI[archive.sha256sum] = "fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220666): https://lists.openembedded.org/g/openembedded-core/message/220666
> Mute This Topic: https://lists.openembedded.org/mt/114264832/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



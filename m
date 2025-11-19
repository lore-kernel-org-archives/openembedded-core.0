Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB000CF397D
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 17:20:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12672.1763572824344999657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 09:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N51kLT8H;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a219db05so26643675e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 09:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763572823; x=1764177623; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F1P7j0G1VMW9OlYyVYseyywMVtSjt9gR/Q8YjgvmLbk=;
        b=N51kLT8Ha5vyXOn2XeLIy9v6oYJuqjt9D50XahsgLMqkW59RuUcKbFbLTUhBF9aQfO
         7VyB64p9hVOa9Ia2F9DATSiK2eyvXE+MJTVelzHMFZQL7pdRkY2IKO2cg82hsmrv+iQv
         suFVLz2RpwjXs0CiOzo6226VfsrE0RUjPQXq1YYW/lbKr4iSoqxAFYw4DnyxtEiepnIj
         Nk/FK5fcXN1PbA5ltscskySxjVT491/SK+B4ViVU0k1GkfVHW1iyrzgX3TEHwLDa6C31
         3plVx7OpZjmJ9DNz/zNSPgj4Y3IVMV75arEJcIqda4wWuxQIyBds2LVWzaMoyBPHjJSE
         xTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572823; x=1764177623;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1P7j0G1VMW9OlYyVYseyywMVtSjt9gR/Q8YjgvmLbk=;
        b=aBkswXLWnbf+AZwPrfZbQ/T4BaSTcFEq/CkQD6bQ9txvGPnv/gexyeMHL2axOkttHw
         sSx0JCWCpUeM07GtVstLr0rDY5eS0UG7BjNwV1sOQ3hzREnBm8x9Qy0a9LdPeVkxf3ba
         bvajPvsQAC4VdbS1IxmouqUJzXMTtWKfiEv8RS3rOETGq/9FehL+u3wio0gXBbe4pE+g
         Xi1zqYK/V+/mUPKrf34XYJvu0324BrvwzYzH+YC9DLL3mZL61Xg+9pYRpPPhkmR2gc/L
         r6yLTXecSHkG0T79SNdtxvIZ7qPSVCFYF/c6t+CgwwBSpxprU8xYmf2BJR+cSIbxwVL2
         2n/Q==
X-Gm-Message-State: AOJu0YwYwcStYvPTeIF6rcFF0tTdK1rR3Nv79ovwf5CMHMMVITiWJ7ZX
	ptn9/jMcEmlTQt9ME8528XfyPZ+GerzGTP2XfxGKi+pJGD+5P75oAFRTVKs05odl
X-Gm-Gg: ASbGncuuTChUlankRsE+EExo55ZT/BVRpcAVQ0BEK4D0usZNtqpcAIrrWST65Xc/x08
	ATfFtRB6C/DDxDyuQNvc6qRNj62hg9ZGN8RbwJtRUQ7OTzb/BEFF4noz5r5qt+wUuj3UXhsbQnW
	XDuK1xX9iRal4RD4LzAvbrfuZsx/0gShiXuda3BomIzw/vjOMyqa7VL5eTAmasUToVN8qViyrG7
	XQLc10q6iUqny0io49IsJmlfPdhovnTvJzlWIo1zBL2LcU4Yku5mtNFuHYKjMKCLnalhSIF6Ul6
	n9FFIxR+JSzQBr4ogrkd9lqcww7qW559O1e72J+xJ4FA9XHBRaA+qrwWjuDVrTXC8S1km87Q/tt
	kBpes81MkQAF7GeLEFa5IUOJ2LjIPthZCTLf8dzcp35ynV+Ur2RmZBJHiy/opvY/Mq7hhFTrmrQ
	+Z/8N6G4nHi9nRbdhkL+x5npE7snTzdw==
X-Google-Smtp-Source: AGHT+IGwKbqcr20/SEWOPJFxwcnXzxEPWndAGvuOnE6yHTZcdRZwkPBZqaUPX4Al7gsE5LPGyzZQzQ==
X-Received: by 2002:a05:600c:548d:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-477b8671c96mr250735e9.5.1763572822509;
        Wed, 19 Nov 2025 09:20:22 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1025707sm57051765e9.6.2025.11.19.09.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 09:20:22 -0800 (PST)
Message-ID: <e327cbe3-7980-4806-8a1e-69d3910d3eb4@gmail.com>
Date: Wed, 19 Nov 2025 18:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bitbake.conf: add canon-prefix-map to DEBUG_PREFIX_MAP
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20251119101959.2603691-1-skandigraun@gmail.com>
Content-Language: en-US
In-Reply-To: <20251119101959.2603691-1-skandigraun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 17:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226573

Hmm, I just noticed that this flag wasn't omitted accidentally at all,
but because clang doesn't support it.

Please ignore this patch, will try to come up with some conditional
patch or something like that.

On 11/19/25 11:19, Gyorgy Sarvari wrote:
> When the debug-prefix-map and macro-prefix-map compiler flags
> were change to file-prefix-map[1] the -fcanon-prefix-map
> flag was removed, most likely accidentally.
>
> Due to this the file paths were not canonicalized before
> substituting them, so they did not always match the corresponding keys.
>
> E.g. relative pathes were not converted to absolute ones:
> ../../sources/foo.cpp doesn't match ${S}/foo.cpp, and due to
> this some debug sources were missed.
>
> This patch adds back the -fcanon-prefix-map flag.
>
> [1]: https://git.openembedded.org/openembedded-core/commit/?id=ff73fa7ef7666a6dbe34f15515bc3ab6e574c5b0
>
> Cc: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 52ceb76bbb..f789b8e326 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
>  ##################################################################
>  TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
>  # Beware: applied last to first
> -DEBUG_PREFIX_MAP ?= "\
> +DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
>   -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
>   -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
>   -ffile-prefix-map=${STAGING_DIR_HOST}= \



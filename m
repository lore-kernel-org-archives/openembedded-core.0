Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF28C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 10:05:07 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.10984.1645524305833052775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 02:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bqbx4dKp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id s13so3524324wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 02:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=sWtz57KRL1Q2kZ+hbzqkUCz+uE9qF50Zd9eRuefbw34=;
        b=Bqbx4dKpGSUc2z8CGaWT3aMxCIXrqDWVzpNryMHX0WS2syGsX4Z5cw3NsDPfQNCloA
         ZIzbnOP8g5cNuoBlCWPTSy8395PaTVSrOrmRczpNuCBEGAfykJu8JupM3ZR/lulUkIL2
         I/udlhUvy7rD/KUv/b1PnM2Xf4aMYY38PPxEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sWtz57KRL1Q2kZ+hbzqkUCz+uE9qF50Zd9eRuefbw34=;
        b=fgxgsE3k+BAcEfvys2P4gxfgq9ugY8vO2gSWw+o4hnlw1s9iA4bu+3p/U9KlX9PCbc
         D5iBbAgTNPAxLKpCragWV9u6FZGnAO8AcuF77GvE06IMROhSSUIV9DyFDiuOz4cSvKfn
         APP1F7fNpSu85OkpSDJ393vhEEAoazny6rlulb3B/kqDfh/B2nYGAcbspjJtyFFsg4D7
         M3XP9mXV+UGrIeCUHj+0fX3xgHY6+GaM9vj0mMvi3z2HbdDzr8PyY6LIclER55W1Tesg
         hKMXjRUIyAtlXW6ui2YhAyHnOIfYzt2QSpnmV3Vw81QwONAHymTcXa81ArSOBFs/u+/m
         jdkA==
X-Gm-Message-State: AOAM532fe7b7eJ//Fg3y1HZXIwUBM9r9xYcGDDmJrNxot0ZI3Z22XecT
	SG+Wz5UgfEDLc1Q8KYESVIHQdA==
X-Google-Smtp-Source: 
 ABdhPJx11bj+AYP6c2EyTHNgd2/yR0ozrDSBllx90TjwbBvcFvMGBEpGlLtiGLPmwwwFMIVKiIm3Ow==
X-Received: by 2002:a5d:6284:0:b0:1e4:9e4d:8488 with SMTP id
 k4-20020a5d6284000000b001e49e4d8488mr19326080wru.75.1645524304145;
        Tue, 22 Feb 2022 02:05:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:26ce:ff82:5c7d:d03e?
 ([2001:8b0:aba:5f3c:26ce:ff82:5c7d:d03e])
        by smtp.gmail.com with ESMTPSA id
 az7sm2407533wmb.14.2022.02.22.02.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 02:05:03 -0800 (PST)
Message-ID: 
 <0ee2484cba7068b4b43330ff2d371ccf14bc94b4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 1/8] rust: Migrate
 arch_to_rust_target_arch() to rust-common class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrew Jeffery <andrew@aj.id.au>,
	openembedded-core@lists.openembedded.org
Date: Tue, 22 Feb 2022 10:05:02 +0000
In-Reply-To: <20220222035234.463162-2-andrew@aj.id.au>
References: <20220222035234.463162-1-andrew@aj.id.au>
	 <20220222035234.463162-2-andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 10:05:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162129

On Tue, 2022-02-22 at 14:22 +1030, Andrew Jeffery wrote:
> This will allow us to use it elsewhere for architecture name
> translation. This move is motivated by powerpc64le support.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  meta/classes/rust-common.bbclass           | 16 ++++++++++++++++
>  meta/recipes-devtools/rust/rust-common.inc | 16 ----------------
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
> index 98d65970e8c0..2f2a31867ad0 100644
> --- a/meta/classes/rust-common.bbclass
> +++ b/meta/classes/rust-common.bbclass
> @@ -1,5 +1,21 @@
>  inherit python3native
>  
> +# Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to something
> +# rust's internals won't choke on.
> +def arch_to_rust_target_arch(arch):
> +    if arch == "i586" or arch == "i686":
> +        return "x86"
> +    elif arch == "mipsel":
> +        return "mips"
> +    elif arch == "mip64sel":
> +        return "mips64"
> +    elif arch == "armv7":
> +        return "arm"
> +    elif arch == "powerpc64le":
> +        return "powerpc64"
> +    else:
> +        return arch
> +
>  # Common variables used by all Rust builds
>  export rustlibdir = "${libdir}/rust"
>  FILES:${PN} += "${rustlibdir}/*.so"


If we're moving this, it may be a good candidate to move to a new
meta/lib/oe/rust.py python function library for rust. I appreciate that is
slightly move involved and will likely need the imports in base.bbclass to be
tweaked but is probably the better long term fix.

Cheers,

Richard





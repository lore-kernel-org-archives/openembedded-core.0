Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD2AC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 21:59:20 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.954.1643925559591847655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 13:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CqBv24P0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id s10so5102984wra.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 13:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xB1DVjtnRCcoc5M+QUYg8cMaVPZkN6siH9KBGOh0N6s=;
        b=CqBv24P04OipCZKngketOResgntupp254DhWLdL3aamZrMUJRdYem6cwIYwWZkRaUF
         H9MVI1mz+nePnuVnJ1JqXnI0h1xutN9qVl/uDoDDmYLwMad+hvZQhFzqduUAgTp0IEUF
         l4CYc/mMsBVCIo0d5PMeLskburxUNyU6lYNPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xB1DVjtnRCcoc5M+QUYg8cMaVPZkN6siH9KBGOh0N6s=;
        b=c4DnZWNQZ0HlPsoDHqgRVbcqSNmZPL1dTt7ynJMRGyooTh1VWxrQRjjdIDLvANbiqz
         tFPrfJUVLRWN9NHFEnLzTBXwHsHjkaH2sQ59Lo8HGjuBx0k/J7ygqoZ4iqT/B4l7Hmu4
         n6vfCCP9g1k/NuCvqfJxh1ltEIp3iuVbtGu3FzY9lQJ9++V3Gl9ckYFgwAs6UNBqRSzg
         z+QMXqY5+ov8S4ALAFVhPskQpXSyv5Zx3PyLEaNmSKPn2Bhscp926bwclZsA8+25iZac
         ILDBI0X3Sd/k9OeqSs+WKZir0H/nVOvfLaQZ52F+LZLwt+1ZJg/sU38FYfF9C1ZMi+ex
         EsiQ==
X-Gm-Message-State: AOAM533pfZJ00uUxJ2z6NxDR/13XByrQKy5d1c0pYBYW+8I417apB/uQ
	uDxzCl3ujhxIP491aHdPYtuJ5w==
X-Google-Smtp-Source: 
 ABdhPJwW5eosmndAAtyy/2gedtyhrdX/uI1y3eJ4YgJJaNs+1QZExSAzYQLxKcuBsXvbQNqyUWwltA==
X-Received: by 2002:a5d:6acf:: with SMTP id
 u15mr20496297wrw.483.1643925557844;
        Thu, 03 Feb 2022 13:59:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7818:26e5:4f1b:504a?
 ([2001:8b0:aba:5f3c:7818:26e5:4f1b:504a])
        by smtp.gmail.com with ESMTPSA id
 n13sm8813813wms.8.2022.02.03.13.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 13:59:17 -0800 (PST)
Message-ID: 
 <daba354376a2183ff81594c226a5a4bae1cbe96e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: enable zstd compression of LTO bytecode
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: enrico.scholz@sigma-chemnitz.de, openembedded-core@lists.openembedded.org
Date: Thu, 03 Feb 2022 21:59:16 +0000
In-Reply-To: <20220203172619.1299363-1-enrico.scholz@sigma-chemnitz.de>
References: <20220203172619.1299363-1-enrico.scholz@sigma-chemnitz.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 21:59:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161323

On Thu, 2022-02-03 at 18:26 +0100, Enrico Scholz via lists.openembedded.org
wrote:
> gcc-10+ supports zstd compression of LTO bytecode.  Install the
> corresponding package to enable this feature in a deterministic way.
> 
> NOTE: previously built LTO object files (without this compression)
> must be regenerated; gcc will fail else with
> 
>   | lto1: internal compiler error: original not compressed with zstd
> 
> in this case.
> 
> NOTE: it seems to be possible that zstd support is enabled non
> deterministically (perhaps by host system pollution).
> 
> I had the problem that the SDK gcc was built with zstd while the
> cross gcc was built without it.  Libraries (built by cross gcc and
> uncompressed hence) could not be used with the SDK gcc.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/recipes-devtools/gcc/gcc-11.2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> index f07a5be507b3..62db035760aa 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -11,7 +11,7 @@ BINV = "11.2.0"
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
>  
>  DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
> -NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
> +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
>  
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
>  

Should we be passing some flag to gcc explicitly to configure this
deterministicly?

Cheers,

Richard





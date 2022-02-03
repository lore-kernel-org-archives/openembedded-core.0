Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107B6C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:24:10 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.2549.1643916248768691750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CoWK3L+X;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id c189so2856328qkg.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oFw+QnAZVo6djtSdjJ/4efq/4MD/TcZuoQ64sL9ONkI=;
        b=CoWK3L+X4nCzdb5bA1WtdVHgn9Yfk7BZvgmfmLJ36JHnHpi/pINv8XFFO+2ykNHys/
         e5atwN1gCrijJx4JxkFCLR+WtbXiXQH/tftxBSQls5Ywd0v53xlMVP4e7Dn5rccsmgbR
         Sy+jFv7UvuYPBaxqTufKfqtVWw+FO3xKcDeSiZ3ea5KwksyjZZf21M32cZviLdUtDSJc
         eUBQ1HfhOUnBbdHz8bkorAnl8W1JdMfNjd5c6uPpdXYSQbdMxCiIJVaJVIV5/Em7aTe+
         bbJQMGYzJHlGyOwglNsdoNs5NVSqaH74t0Zy8k5rm+Ws136p9qRD4tzz6+FSzLjszXbp
         +1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oFw+QnAZVo6djtSdjJ/4efq/4MD/TcZuoQ64sL9ONkI=;
        b=zgpRnenYOpSW7R4R72zOHwgcs50R7nq5IWMWLuF275kAVsjr2yAvrs+JtzV8FSa7AI
         dWy4Y9B6zHjt42NOtQoyhbZJZZmf4Qwr+5Se1WUIwakmXtXBedXxafF/UufL3f8iZuz7
         kl1c0Y7OFnj0tN9pMnxMK1J9Bypoh58ElNMD4pwT5l1EH9si6a8MH4fORrh9+s0W/AgO
         +nSn1Y/dXxEGDE53kYLnBR7MpZLOlxNFjIoY8Ann0YMnhdpKESTxpj88iTEAm3m2qF05
         IgMNazGHo5dMCyA6NdpQVSzWJ6RQpAFjgSo4KLFB3y+2O2ngAx63KA2S7A0NEHCtTQ97
         70LQ==
X-Gm-Message-State: AOAM531U+tXRQH6b58l0qz/ETkWsyDp0pSJYz40jD2HzfPYaBwBoAR4q
	vJzEPcaZnLb7c86wrCJTb6UAV6f5m83cpvIaTmhVFZMp/u8=
X-Google-Smtp-Source: 
 ABdhPJw/G+L5j/18vf5m0t4d7lwMSkUyIvUst8YHORAPDH1H0JgjJjgZUW8tq+nmIslJK2OArvUGycf3CAwImjOnCk0=
X-Received: by 2002:a37:63cf:: with SMTP id
 x198mr24893603qkb.72.1643916247647;
 Thu, 03 Feb 2022 11:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20220203172619.1299363-1-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <20220203172619.1299363-1-enrico.scholz@sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Feb 2022 11:23:41 -0800
Message-ID: 
 <CAMKF1sqp=KjKrgVb-FCLr29UTmxaGQ4_w=qrOU+6wvdR5NA_oQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: enable zstd compression of LTO bytecode
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:24:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161293

On Thu, Feb 3, 2022 at 9:26 AM Enrico Scholz via
lists.openembedded.org
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> wrote:
>
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

this means regenerating entire shared state isnt it ?

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
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161292): https://lists.openembedded.org/g/openembedded-core/message/161292
> Mute This Topic: https://lists.openembedded.org/mt/88888010/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


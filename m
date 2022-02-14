Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7064AC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 15:43:31 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.35608.1644853410323545340
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 07:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NkojrObs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id o24so24883454wro.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 07:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=0mzKA0bcEFsRBnTMWkno87gasNCwzEqcMNtf2crEf3g=;
        b=NkojrObsmzljdbFm/hy2hix6y2GPgSbChs7B70TT6VhtY++Bpd0Vyr4WYLiJAftpHx
         0BD0gi52vYwojXITI1QjMfJERhQO3aVyZJ2ppkwQmLknd1Ybfq+PYagLHmt3MXWNJoEu
         6ZUTzY80Gpau5QyLlZtCsHdq/kOQhS87o/M+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0mzKA0bcEFsRBnTMWkno87gasNCwzEqcMNtf2crEf3g=;
        b=neMZnrxDzSlsPEN+18sxM/PZmay4F0bV6hJ3A3AyfqpIf9oZRcW7XR7l9hOFOawSN0
         B7hev/eyVQhMLv6ILfrSQEqwFksz4+wqIPD8taoVzFvAPB5qKLmjqabvGdhhJ1Qbu7ys
         YvYm/zoOSFc9YOkEZzP22lODFE0Jr6hdhIajV3nqnOD96taQ0StDBt/Q28vBlQREz7UW
         fCQisK8g2n5vQO/In1z4yFczoJ5PmEQpOSdPaQb8UN8X4gKYFRpwWSe/hPVgMplDzO0B
         6SCqUQqKCLXrUDpEf7o9nsJ4fPbz0gUnbAYgbhmoZ/bLmKmq1yieAqcjNdfh5Ou64UKg
         w0GA==
X-Gm-Message-State: AOAM531/QdseBequpaE1DFwSO2WQszYlPSRI3J1TGBFvPjgm634RZVZP
	rcYF2cdsRHbA8GOeuOv8npgtdQ==
X-Google-Smtp-Source: 
 ABdhPJxBrRj2IkJNbTGKZz5BfviRYoUKodlppFP0JjzfXagWnsBLfYyS87Wyu4QdMJX05Mq+scgUcA==
X-Received: by 2002:adf:fdca:: with SMTP id i10mr183537wrs.251.1644853408790;
        Mon, 14 Feb 2022 07:43:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8594:17f2:9d48:b842?
 ([2001:8b0:aba:5f3c:8594:17f2:9d48:b842])
        by smtp.gmail.com with ESMTPSA id
 x17sm3352234wro.68.2022.02.14.07.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 07:43:24 -0800 (PST)
Message-ID: 
 <ba611eefa813d1edeccea304b96937943113270e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cmake: read asm flags correctly from
 environment in toolchain file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Beeger <martin.beeger@online.de>,
	openembedded-core@lists.openembedded.org
Date: Mon, 14 Feb 2022 15:43:20 +0000
In-Reply-To: <20220214153807.21216-1-martin.beeger@online.de>
References: <20220214153807.21216-1-martin.beeger@online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 15:43:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161714

On Mon, 2022-02-14 at 16:38 +0100, Martin Beeger wrote:
> As discussied in [YOCTO #14717] cmake contains a OEToolchainConfig.cmake
> file to configure the toolchain correctly in cross-compile build for recipes
> using cmake. The CMAKE_ASM_FLAGS are the configuration for inline assembly,
> and these are set in toolchain environment via the ASMFLAGS variable.
> This changes the toolchain so cmake correctly picks up the given ASMFLAGS
> instead of errorneously forcing the C flags instead.
> 
> Signed-off-by: Martin Beeger <martin.beeger@online.de>
> ---
>  meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> index 86446c3ace..3513d05b2f 100644
> --- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> +++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> @@ -1,7 +1,7 @@
>  set( CMAKE_SYSTEM_NAME Linux )
>  set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
>  set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
> -set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
> +set( CMAKE_ASM_FLAGS $ENV{ASMFLAGS} CACHE STRING "" FORCE )
>  set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
>  
>  set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )

I'm a little more puzzled on this one since whilst we set CFLAGS and CXXFLAGS in
bitbake.conf, we don't set ASMFLAGS and it wouldn't be present in our
environment.

Perhaps this should be $ENV{CFLAGS} instead of ${CMAKE_C_FLAGS}? There are flags
in our CFLAGS which like need to be passed to the assembler too?

Cheers,

Richard



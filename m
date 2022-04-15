Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F4CC4707F
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.7037.1650027766296417626
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 06:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ANzea62s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id u3so10626309wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 06:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MHy7BtVux5ddYaPkT449M6IO53kkvxeQIqc1s/F9T58=;
        b=ANzea62s/ioU4z94RkmcJFG5I/dyYtMIx585dCDoV0MSEs1bospkqhiBp8fc9OmsdF
         m7BLJvDxbnTn/zZfId26PKRso8lMH12IhPCsQRrCyH/sM2cPXXChUAKBCFgC2fJUqTEx
         wsL1ZB73zRR8ODmFqBmWL4kjVP46qSX59KWHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MHy7BtVux5ddYaPkT449M6IO53kkvxeQIqc1s/F9T58=;
        b=IVcHYUSL13FpKXPkGNwdSdlAOOnbYYgifxWv4z6G9WIfs3w7e27GQ92Z0ueMOnZsPC
         3MlsLGqPEdVglxcODDGMdiOmaSsQUGGzCuOhgNliND60N8kt3cIBsO+0dW35CTDZ7Vs6
         gC5+aOS48GcNhLPSAv6e6IJkRbv/68nfSIQWh6l6NotugqK1M6VZ1kI/u5BksjJlsnW7
         WmbPf7qNOWKyn9WxA5F8pPmj4NtlS3xjJRfmYhetl56QbItPKV+cKiqkrw8CwsP82CWd
         hqR+tolfy7gk8/0x8bMcSUk6fP+smMNla2GYe+PsdmIagLWb/DquMOSNves/6+YenBiF
         shUQ==
X-Gm-Message-State: AOAM531aLy5YQ66BBMrM0J3x2HA3yP599ARsqK4RmoMDDWmSFSiDK9Jz
	9BKB0t3j6niT8kq0s5k3MXzxbQ==
X-Google-Smtp-Source: 
 ABdhPJxgcNsCt5GX87ZuOYGXGfWov5MJsleqtmkKl2VIF34TfXjlEz2lD+ocwzp9zpG2QC/iASvmfg==
X-Received: by 2002:a5d:4b52:0:b0:207:a53e:fe56 with SMTP id
 w18-20020a5d4b52000000b00207a53efe56mr5420085wrs.22.1650027764663;
        Fri, 15 Apr 2022 06:02:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:11b3:ac79:b941:ad48?
 ([2001:8b0:aba:5f3c:11b3:ac79:b941:ad48])
        by smtp.gmail.com with ESMTPSA id
 w12-20020adf8bcc000000b002060e3da33fsm4138060wra.66.2022.04.15.06.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 06:02:43 -0700 (PDT)
Message-ID: 
 <a9c706aeb3190c88e52eafd215a2184d3dfd5446.camel@linuxfoundation.org>
Subject: Re: [PATCH] [PATCH] glibc: ptest: Fix glibc-tests package issue
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com
Date: Fri, 15 Apr 2022 14:02:40 +0100
In-Reply-To: <20220415111159.120195-1-pgowda.cve@gmail.com>
References: <20220415111159.120195-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164428

On Fri, 2022-04-15 at 04:11 -0700, pgowda wrote:
> The current default DISTRO_FEATURES does not support ptest.
> Hence, the following error is generated during "bitbake glibc-tests".
> ERROR: glibc-tests-2.35-r0 do_package: QA Issue: glibc-tests:
> Files/directories were installed but not shipped in any package
> The issue is not reproduced with "DISTRO = Yocto" as DISTRO_FEATURES
> in Yocto supports ptest. However, when we run "glibc-tests" using
> Open-embedded master sources; it generates the error as default
> DISTRO is used.
> 
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>  meta/conf/distro/include/default-distrovars.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This isn't quite the right approach, we should probably skip parsing of glibc-
tests if ptests aren't in DISTRO_FEATURES?

Cheers,

Richard



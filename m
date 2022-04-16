Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82B0C4321E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:57 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.16660.1650096576169039607
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 01:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=da2GBQcW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id e21so12936585wrc.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 01:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=42jDnvIO20ND3tnYDd7JuDhYUz9b9FZ0p53X35BrkL8=;
        b=da2GBQcW7Uyh7WkUVLtQ9quaZVedtlvkF/UCxYiyE2rNeS0MjfxjuBiJEbUo8r51Q2
         QTKS7N4I8k5vWKBUzbdQSijwhG3PvwsefJ6L0Ow/ifyjmFctyGySIO0YAwyjrU8aebUQ
         2WWFh0DH9ZidrGeDRpiEvFJUtTUbleBK0gbgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=42jDnvIO20ND3tnYDd7JuDhYUz9b9FZ0p53X35BrkL8=;
        b=YnQKAK0qbeLVynD/AKdib12ZObnVzyYaacZpjvEG7wKcf2dVcxTiOoxixE54fKm73/
         Y/AoGS1qZka8OI4JJ3rEuIqhGX80zH8kYTi9f0c7MnacUt8JwuZJswiHCS7zoeQwlrNj
         j9o+HEu3MQjnEhwBGb/av+sDqzeZ2u0VyYj+vqM9EN7nsiMVdnyrS733iA8tvqmC2xqP
         +8yjDCJshm9uAJTtLGsl4xp7cyTDcwXlae4z/jW5nMt+kIBxJDgLprywoedUDWp9kzBm
         0EO1FqeP34HhvLnRFtbtDTvEvuiaGiyFMw6ce5efANlNsbH0u9N/py7gNh0fkdQ3VWdY
         USlQ==
X-Gm-Message-State: AOAM5315GmCtLZErrs/t+nOlim+Ss6+4PaNPv+j1HVnXgyHUPr0nOczi
	cq6FWQ/ot6uQUuxguFj3AXorDg==
X-Google-Smtp-Source: 
 ABdhPJyWah+gMKL61EEgSzYui6O5kwdfWJWp2GX3tlL+hEDb2z/0XT8jraKV+jNR5XHeUUDP0RQEpA==
X-Received: by 2002:adf:f20d:0:b0:207:9a8f:ef9e with SMTP id
 p13-20020adff20d000000b002079a8fef9emr1836204wro.618.1650096574557;
        Sat, 16 Apr 2022 01:09:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:78b1:67ef:e54f:6288?
 ([2001:8b0:aba:5f3c:78b1:67ef:e54f:6288])
        by smtp.gmail.com with ESMTPSA id
 v15-20020a056000144f00b002079acb2349sm6137933wrx.1.2022.04.16.01.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 01:09:34 -0700 (PDT)
Message-ID: 
 <3aa271b71caa6d88f326fdacdf49143ff119b81c.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] glibc: ptest: Fix glibc-tests package issue
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com
Date: Sat, 16 Apr 2022 09:09:32 +0100
In-Reply-To: <20220416075413.158057-1-pgowda.cve@gmail.com>
References: <20220416075413.158057-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164527

On Sat, 2022-04-16 at 00:54 -0700, pgowda wrote:
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
>  meta/recipes-core/glibc/glibc-tests_2.35.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
> index 8c7ecf89ba..fc6eee91ec 100644
> --- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
> +++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
> @@ -29,6 +29,8 @@ RRECOMMENDS:${PN} = ""
>  RDEPENDS:${PN} = " glibc sed"
>  DEPENDS:append = " sed"
>  
> +DISTRO_FEATURES:append = " ptest"
> +
>  # Just build tests for target - do not run them
>  do_check:append () {
>  	oe_runmake -i check run-built-tests=no

This isn't what I meant. I meant something like:

REQUIRED_DISTRO_FEATURES = 'ptest'
inherit features_check

Cheers,

Richard





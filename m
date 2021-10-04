Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759D9C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 20:49:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.16076.1633380574332757111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 13:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=epHYj06x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so588707wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 13:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=QXc6wdNk8TNKf3A2GRQvDotKpgq0hhUjivQMwFdGTsY=;
        b=epHYj06xcB2YN/CKefRM8du1FQYaFHQXZvG6af9jpUw9CDcfMeY2S0LyFZN1MIAZFU
         w2cPUx/k8E7vxHBAYYsYXPi2HJI8Epw05waUCxPMFNhFLARqxU0wlJkvL4T/P4iFIZH7
         bVDGWQO7hIGbOIYqDPYMVHr13l653NfjsK0jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QXc6wdNk8TNKf3A2GRQvDotKpgq0hhUjivQMwFdGTsY=;
        b=Wmfjx8xEIdvU7+UKxW3lDkyQSmlZWvfcf64vmN/FcseXZ8zLYL2bVRrOywDszfGtnk
         3IGVJxnpaJhRlLFVSEPcODYEyZ4FtfIvdZBiPtEmke6XPkdbsviVpn8QICmt6u7f6O+6
         JT0FaY8l7eaEjtNWKhqUa1FXlBv+UNkYsMTqL4mj7iiY2BKTd1sozYN4SC3wKfO8zgar
         ETod6kCP70vN85TFsfEkd5h6qu7LG08l+2TwxRuAEkzuMSqM1k1iMXhFAPLbRDGmF4A0
         gaLZGnVE+rzN03UKBjeUHIBzMQyInHNR/HPiFi6DDZ1iCVeSufcv5Prnu/4w1/e76Jpt
         WWFg==
X-Gm-Message-State: AOAM531wbBkiV4Dhqlo0XCRAt1yUomadnGGB8zYFQ0y6h9tL4RGdjafu
	+46gYRZ014pntwAhJ4S4fWJ4uA==
X-Google-Smtp-Source: 
 ABdhPJxee21HXlEgPEfBZLo7/f4Tt8K/MsOcG2ShGt0gPTbz4oFXBCzhSYkCxN26GbWQR5dk4h/Rnw==
X-Received: by 2002:a05:600c:2101:: with SMTP id
 u1mr8366743wml.117.1633380572876;
        Mon, 04 Oct 2021 13:49:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3440:8498:daef:94bb?
 ([2001:8b0:aba:5f3c:3440:8498:daef:94bb])
        by smtp.gmail.com with ESMTPSA id
 x21sm18276389wmc.14.2021.10.04.13.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 13:49:32 -0700 (PDT)
Message-ID: 
 <1f1a0901b9d5cadf03d304180186c27657b493ba.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] buildhistory: Fix package output files for
 SDKs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andres Beltran <abeltran@linux.microsoft.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Oct 2021 21:49:30 +0100
In-Reply-To: <20211004201331.28401-1-abeltran@linux.microsoft.com>
References: <20211004201331.28401-1-abeltran@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 20:49:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156632

Hi,

On Mon, 2021-10-04 at 20:13 +0000, Andres Beltran wrote:
> Currently, installed packages are listed for images in image-info.txt, but
> not for SDKs in sdk-info.txt. Add TOOLCHAIN_HOST_TASK and
> TOOLCHAIN_TARGET_TASK to the output variables in sdk-info.txt.
> 
> Moreover, package output files for the SDK host are empty because
> PKGDATA_DIR defaults to the target directory. Fix this bug and create a new
> variable called PKGDATA_DIR_SDK which stores the correct path for the SDK
> host package data.
> 
> Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
> ---
>  meta/classes/buildhistory.bbclass   | 21 ++++++++++++++++-----
>  meta/classes/cross-canadian.bbclass |  2 +-
>  meta/classes/nativesdk.bbclass      |  2 +-
>  meta/conf/bitbake.conf              |  1 +
>  meta/lib/oe/package_manager.py      |  2 +-
>  5 files changed, 20 insertions(+), 8 deletions(-)

The patch looks like a good fix but it doesn't apply against master since
package_mamager.py was split up. Could you rebase against master please?

Cheers,

Richard



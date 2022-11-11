Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BBBC4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 08:03:22 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.3214.1668153796770906332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 00:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fbgi4vxD;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id u11so3684490ljk.6
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 00:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKIeSTb+4X/zxp+GzTDh0i/fGXNxo+WBIkm6Zg1LP+Y=;
        b=Fbgi4vxDa6nA0K59ublG5tOvYWfT//Fwq9xA570P6GGREkArTc9+Gfvq1nj7myZDj1
         SPBpk9fTcmZD3LyyPjvkwWyNy6RoHllTlGiyPFSOUIblQtpC+IhrENIqk7GxjB32sfVj
         NCcGI9RJanV7Tp/eCylbJlPrvMJ66y4RX06qmkEiY1PHAoWLAFPigUfJtyVmYO+M0JXR
         Uhdzc8J++H3e+slOBpFTNvqIXMzZ8ROzCxxcAax7X4s0qnU7j5q1CofQwwwAZB//UTpH
         LsUueS3nwUOeo8PBxiUCtew2e3qyPSkPB8AcXTxoG0lCB/vQTgUxnjy91Z0PHOLqHIt9
         gmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKIeSTb+4X/zxp+GzTDh0i/fGXNxo+WBIkm6Zg1LP+Y=;
        b=CmEVVt2FcyvXBn7G8ZfAZ17Nrwd5ehYFeUA2PmQAsysBEqeewd0RyVEXCV/q3INMq2
         asYARQYDtuhSAo35nZS920Jrb342NUedJSwYDJ20dvMKL19ed/kBFjyDREhNZzx3p+5t
         ralawe1y6+k+OJBNJL9jdkpOC2Gh5v9k2JHqhkx767b0YQsonNU2TjrRajMXsffR4z4h
         YfRMLN7IbxCB5EZw2pFH3L78CiVG1wCD6bXfpCHQ0jsrTD6PbAUWHRV2ruxd/tp2cZ8Y
         IpRqznnokLDFK7XmpGPwtcwUkQ9SCX4bSrNPSpYNS7NAmFRYf8fIb3o9iEmoiKJcAQ3h
         9OXQ==
X-Gm-Message-State: ANoB5pkykovMSpYT2tzwxHMHxNQnv2h9GOv6AdvyInUQ0+ryTsU+k1QA
	hQ1M6Z5u1HZTxrHDgUo3Ii7DQ+Vj/c+pcLwhQY0=
X-Google-Smtp-Source: AA0mqf5u0QuwOvweksxYYcB5+nQbcS/RsacorSuvZN1ybe9I+NK47pt6gNOercwdhu7pUujb6toRaSNrVVUDKvr4cgI=
X-Received: by 2002:a2e:a5c7:0:b0:277:8759:bf65 with SMTP id
 n7-20020a2ea5c7000000b002778759bf65mr265504ljp.108.1668153794344; Fri, 11 Nov
 2022 00:03:14 -0800 (PST)
MIME-Version: 1.0
References: <20221110204232.12768-1-jorcrous@amazon.com> <20221110204232.12768-4-jorcrous@amazon.com>
 <CANNYZj8Q4yDjr-=-u4VCMYf8khBDUmwu9+c7qKezqKSx-9grZA@mail.gmail.com> <20221110213024.ob3bvz4g2hsixmu3@amazon.com>
In-Reply-To: <20221110213024.ob3bvz4g2hsixmu3@amazon.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Nov 2022 09:03:02 +0100
Message-ID: <CANNYZj8v2Ps2GTJv_4hhGr09VjPWO2LwHPOFUcncenX8SfCY8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] vulkan-validation: Add the official Vulkan
 validation layers
To: Jordan Crouse <jorcrous@amazon.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 08:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173118

On Thu, 10 Nov 2022 at 22:30, Jordan Crouse <jorcrous@amazon.com> wrote:
> ERROR: vulkan-validation-1.3.231.1-r0 do_package_qa: QA Issue: -dev package vulkan-validation-dev contains non-symlink .so '/usr/lib/libVkLayer_khronos_validation.so' [dev-elf]
>
> I borrowed the QA inhibit from vulkan-loader (since they are built
> mostly the same) but if there is a different path forward, that would be
> great.

Thanks. I am not seeing QA inhibits or any special handling in the
current vulkan-loader:
https://git.yoctoproject.org/poky/tree/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb?h=master-next

Can you find out why the /usr/lib/libVkLayer_khronos_validation.so is
built unversioned and where in the source tree that decision is made?

We generally require that everything in $libdir is versioned, and .so
is a development symlink to versioned originals.

Alex


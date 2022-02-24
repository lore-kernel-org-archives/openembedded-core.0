Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399DDC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 21:06:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.1157.1645736773568624198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 13:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UOIAupwz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id i19so558584wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 13:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DX2Y92Nf484cbq7TvJhrmeNS2JzPyquGONKcO4jtfA0=;
        b=UOIAupwzRHqxpSmdZ4RJKG7ipUS1fwCqqnmtkuvAhhoqEuCEMSGgOUG6ZEC/JHTy2L
         nhqn0/zTQP8CuEb+NwLD7/PZBnZFKsQ9+8DqEgq7E2NW6CNA6adxKf4zqOU0Qn6lYdhx
         oBN2WNBR8mZGnq862VIqNhQAfu63YUH/PeP6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DX2Y92Nf484cbq7TvJhrmeNS2JzPyquGONKcO4jtfA0=;
        b=yr/cBil370WJTJNxtYQNGX2w/9itI1bZajnNo6CS9V1un5LIkhMBN/DAANGJQjQSb8
         eijsTeiuHIVx9OsnN27re5KrHbkC2NRbVBTUoItZr8yBX+69J3fPakIO54j+fPfCNsUg
         4JOjWl3HimQjHR1wut0X1UgDldBNKsRSJeppg9NrM+WZ+pwF8QRFRq2PPg1Rws9uvV9O
         qgojuEpdJWUVXe+Y3d6sq5lM2l59jllvIaFnGDrC/Td+HmCtxmR/5M9ci/uFGP4vWnya
         v/6cRxJWm1F4AGAduQChn+aeWGbGtqztXdx2F23P6IQPvOcccyt7/UQH2C0aggavlvIX
         av/w==
X-Gm-Message-State: AOAM531OVAvDweAQTi5i5DVoM+u5mgdmUE/NilCQU3wkxi5wnoqfHYaE
	E8lOjMDYZ+M0Jht45zmIIEUnlw==
X-Google-Smtp-Source: 
 ABdhPJyauYR8osa/J6VDn2F9hcCW0To1+nTpZajob5V82jVTyw18JvFfqN8ZhYRebCTQs+L6Dduyiw==
X-Received: by 2002:a1c:7419:0:b0:37b:b96e:81a6 with SMTP id
 p25-20020a1c7419000000b0037bb96e81a6mr4564wmc.8.1645736772022;
        Thu, 24 Feb 2022 13:06:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c05:a731:3c1:5d08?
 ([2001:8b0:aba:5f3c:8c05:a731:3c1:5d08])
        by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm406799wmz.43.2022.02.24.13.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 13:06:11 -0800 (PST)
Message-ID: 
 <af819494e57fe7da1b44786b004488a72f3f4c48.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] systemd: move systemd shared library into
 its own package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	openembedded-core@lists.openembedded.org, mingli.yu@windriver.com
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Thu, 24 Feb 2022 21:06:09 +0000
In-Reply-To: 
 <20220223161722.14256-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
	<20220223161722.14256-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 21:06:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162330

On Wed, 2022-02-23 at 17:17 +0100, Stefan Herbrechtsmeier wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Move the systemd shared library (libsystemd-shared.so) into its own
> package to prevent a runtime dependency from udev package to systemd
> package and thereby to a second init manager.
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> ---
> 
> Changes in v2:
> - Fix SUMMARY override

This did trigger a warning on the autobuilder tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/2657/steps/11/logs/warnings

Cheers,

Richard



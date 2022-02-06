Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EEAC433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 08:10:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.6658.1644135011696277687
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 00:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ab06Zqp/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso6525200wms.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 00:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Vv0eIY/IIFHFmznDK3EdH4KG6Zu25njoyTyUYIdufcE=;
        b=ab06Zqp/zYxqdDOO9f5rxY4ifDXxCoZiWej3xuelBcYV9bN6YAGOTfUWjLRmLoAtRP
         pelxqlG6j3+7gMp/0gyt2FjSBzRlmW333cT67nrXI6uADTS8hnwBUtZzu4lMbdY0cvdk
         lRBtxrATeWW/yGVyOKm+YPnuw4RDcVSZy2cuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Vv0eIY/IIFHFmznDK3EdH4KG6Zu25njoyTyUYIdufcE=;
        b=Qx9B8pufqkzffh26joI/hyXfCEHEXg7oPQ4J+6kRUB4DhoRoSc1LsTL07vC9cMm4PE
         FgQmPLbYbjy0wON9FGgtO6dPnRVsSMmgtrfsWGFSQ0tEUf1Ew7lHBPLyg25VWCSpwEPI
         LalV71XEWUuTKJByS0UZLq4IwVcNY/0BU0sTrH2MSQUzeieawwdPIoCoI3gGKY3NTGad
         uDCEwnUvrIoyD1iDKNYUvb+QlfvIN029cYHGDkYpF6fWkOEYpqgW1wmdRAx9O8oInb89
         BFSpDxULsuqG+w2spYUJYvVWG9d7e+pQxR9bKwlbTEvtCyl/G2lgqiIbFgpx4hSIpO8y
         CEqQ==
X-Gm-Message-State: AOAM533ytgljUnwRXuwuuKooOR6K1Qo5OMa2C1eQmgiV9MzvWJ9BGstV
	EBIA1YcVl+Xk0cxJfOVW0HZJeA==
X-Google-Smtp-Source: 
 ABdhPJzmHgTCYG1Fm5OILl7bwFwAv9Bvd38CJYmPwsXGlCdKLjOlBTz5kz+He9IxyDgbQmPa2ooK+A==
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr9468348wms.101.1644135010143;
        Sun, 06 Feb 2022 00:10:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aabf:a020:d9fb:13aa?
 ([2001:8b0:aba:5f3c:aabf:a020:d9fb:13aa])
        by smtp.gmail.com with ESMTPSA id 1sm7327478wry.52.2022.02.06.00.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 00:10:09 -0800 (PST)
Message-ID: 
 <4cd9f1953e5a5a3287325f4cbec5c2a9e9aa84fb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Sun, 06 Feb 2022 08:10:06 +0000
In-Reply-To: 
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
	<20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 08:10:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161392

On Wed, 2022-02-02 at 08:35 +0100, Stefan Herbrechtsmeier wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Link udev shared with systemd helper to minimize the udev package size
> if DISTRO_FEATURES contains systemd.
> 
> It is only usefull to link udev static with systemd helper if udev
> should be installed without systemd.
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> ---
> 
> (no changes since v1)
> 
>  meta/recipes-core/systemd/systemd_249.7.bb | 1 +
>  1 file changed, 1 insertion(+)


This seems to break some of our tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/4708
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3121
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3085
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3089
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3127

Presumably it causes extra dependencies to be pulled in causing the file overlap
where there was previously none.

Cheers,

Richard





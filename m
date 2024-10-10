Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5659ACF07DA
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 09:02:08 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.39116.1728550920516794503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 02:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=t8ghiPhH;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5398e53ca28so672972e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 02:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728550918; x=1729155718; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MaSXUSX1otopCR8BbHtSoIU35TMM0XXOQ2j86fZb1UA=;
        b=t8ghiPhHLseAgge1PomsziAG3ASgHnf9GBuDKiEu0rGWyXmRl0IU/ZjHtFvUQ5VQjy
         k5u5IwygYRudGbgqBMOVmBoyB1eXNzgMP2ofzjLPFq0GNGbN58inje8yi6X3FUyB/ccV
         lfhuBEvrLFudZJ+uYtKCyzJISoit2gy7vQqFvOaTZlqO5LNFUBqoYV8DvjF6Nl4wDBFL
         om76/fT61b8ZtA1E5lguSlRTq3jENkMEws7akpbFQu3clvGXxOEmTX+hoJeDitt1u6Rh
         RtoDVCigf9K1VC9Y0lmQk2dVvad1Mcm6KTz5L5yrAWTxUc17Uewu+lpKVD91eGTAappq
         q/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550918; x=1729155718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaSXUSX1otopCR8BbHtSoIU35TMM0XXOQ2j86fZb1UA=;
        b=u2KxEF0r7f/clvaOYakWmaWf3/DNSh8OIBH1KH41xSg7GbSKRJGJ5UM11jrnNZEcpZ
         q7P5twDh5alF5UuEhBhwGtTjOVcJEgMsrPuGVoaATiBdk9HlJ7W6UUgo+LedYfC0rIAr
         FKfMgiX4Ce1UuZI340EW1sR6VkaPX/h3OEthxRxw/q0WULsthj8FXln9C5Bi+8ihWO+j
         8UE4TDaXx/LZGtoo4Vs3KIkiyqf9ArmXPAUJ4kjoGNZOmfd2pL/66EsswF/gdevQ/9Ai
         4RiUksnJanhftNW0mTSUeN4rLAjkH/nyzaK4EqinyYFrpvVg9rJ09z2E6Ot7/1zt4Ry9
         NuWA==
X-Gm-Message-State: AOJu0YwAqIGYHEqKWVqP7Ujz4Myrs40RgIDbprSateNHl/qoAj9ceskw
	MDQlUIvDorI9JZa6p5LE1MAKpAW2ET8OvOKFAqFMq+az/Z3TYTF7SsutUDyhRy7icWIeEf4F4++
	x0C4=
X-Google-Smtp-Source: AGHT+IGD+SZa85qKWyws+xP/HYt0k05pwgSprh/gFI9opMncnSWl6wCZhYdPVh6OmjHPC0S3CqCzVw==
X-Received: by 2002:a05:6512:10d6:b0:539:948a:aadb with SMTP id 2adb3069b0e04-539c4967e92mr3791444e87.42.1728550918011;
        Thu, 10 Oct 2024 02:01:58 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb9053absm167005e87.267.2024.10.10.02.01.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:01:57 -0700 (PDT)
Date: Thu, 10 Oct 2024 12:01:55 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v7 0/8] systemd uki support
Message-ID: <ZweYA7ffNHbgoo7k@nuoska>
References: <17FD0BA3A2CC876F.19251@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17FD0BA3A2CC876F.19251@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205398

On Thu, Oct 10, 2024 at 11:56:39AM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> v7: add missing "ovmf" to runqemu argument to
>     test_efi_plugin_plain_systemd_boot_qemu_x86 to fix boot hang

This test is passing now in my local build. Running full wic and uki
selftests on qemux86-64 MACHINE takes a long time so I will try to setup
hash server to speed execution and run full tests with that.

Cheers,

-Mikko


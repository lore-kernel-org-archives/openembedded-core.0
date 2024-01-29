Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C53CC47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 18:25:26 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.2495.1706552724371490686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 10:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=czxAwDNY;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5102e2ab56eso2307206e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 10:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706552722; x=1707157522; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MnkeFWVTevRBmgn1D1/Rro+LBVG/Ap6NQoH5nPwk7Zg=;
        b=czxAwDNYbkM7Rojp2dhcUnGJ3IOXFkYurFq+cg7qBFUb8pPNV4sD3R8Xv3dUbkavPe
         Ik5jLPKrQpEmm4r0pCuRHZ3OvJZ03rQC+EizensHSnx2Y+RodoDCpCwthg9DWssyxmbK
         SFihsiuhPfNjHE0g3t0bFbaVDtL3vxVlAsiGHDFSpkyd1b+8xTCt31MtoxW2PW80nsfS
         HAhdaPUIXg4dkvI2BBbc3yY77ccB/70yuwvBIYRQ5szntKMeS0Ewk9oQtrQud2nKykPR
         +e+rOj1oKlgCH/OILOnaeZDJV8bpTbTPCBUsity3CKDIB4A/VxJQWsZOQXlmJZ/U1QhQ
         KTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706552722; x=1707157522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnkeFWVTevRBmgn1D1/Rro+LBVG/Ap6NQoH5nPwk7Zg=;
        b=fGjG0RQvI2fRV3G4ZLLKotnJwqyB9djixrIrFw/bok4SRb050C2TFwWjRjOo1pHi8f
         M2ZUhbSLPcBxKH+2iUr1u15Eoc4FX533FRjU+qNFVWiUCtygP49+7RYpI2A+3gush/vK
         DM2KZmTjwqO+FisxPjLyJr1JrQvUoRpGCAS3PL6M7Wd2cY58XtYUqtteQqqX0EsAA0Qq
         M8fP4rS95Kbr4d+AWJF+cvRErUEAYQWR7DPEUhzUQPFf58dYijCUnZmUfy9gIholx0iZ
         R2q1CLN92+tRTtuvxT5U0pW8TTwRYCYKqGcsWEbFF+aFBugo2GrnRopqH0/2HiQ2u+ES
         TBpQ==
X-Gm-Message-State: AOJu0YxKTvBdJnRvbfFo/I78HOcux6LUtjUCvJEJIyUm+emR7M9YMetF
	SM3/WWAx85QwSOKBCWps8WlQDf70/74/x5bb1W68r9g1BDxsxfzH4ASh+9fy+TNvecMx2mR2FOZ
	axbXsinbnc7tvZ6w+Rx4omwGot6g=
X-Google-Smtp-Source: AGHT+IEwJC6PoN2ubcNQq+/myM0F5uQr3kPfLeYKSQh4mq4UFrt/4W1ous7Dt+ff9Inh5++muhErjMFsbtJcLwawmNs=
X-Received: by 2002:ac2:5b11:0:b0:50e:6c1d:5dee with SMTP id
 v17-20020ac25b11000000b0050e6c1d5deemr4100641lfn.33.1706552722389; Mon, 29
 Jan 2024 10:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20240129181920.2171316-1-ross.burton@arm.com>
In-Reply-To: <20240129181920.2171316-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Jan 2024 19:25:11 +0100
Message-ID: <CANNYZj_7ROqgkvknTb3P9-GYZjq=pD3SiwRUF9ipSWx+-earBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub2: ignore CVE-2023-4001, this is Red Hat-specific
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 18:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194478

I can't help but notice there's a kind of irony here, given Red Hat's
major marketing point for RHEL is security fixes. Patching things one
doesn't fully understand without upstream review is not a good idea.

Alex


On Mon, 29 Jan 2024 at 19:19, Ross Burton <ross.burton@arm.com> wrote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-bsp/grub/grub2.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index 5685cae0ab4..47dc9217985 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -25,6 +25,7 @@ SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154
>
>  CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
>  CVE_STATUS[CVE-2021-46705] = "not-applicable-platform: Applies only to SUSE"
> +CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedora"
>
>  DEPENDS = "flex-native bison-native gettext-native"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194476): https://lists.openembedded.org/g/openembedded-core/message/194476
> Mute This Topic: https://lists.openembedded.org/mt/104037170/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


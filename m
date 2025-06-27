Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3ECC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 15:54:28 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.17222.1751039664762761100
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 08:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g33VYYqL;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d20451c016so134502085a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751039664; x=1751644464; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zp3frUPq8X30V/7RwOoUzwNZ3UE3q5pkBDA56m1WbWw=;
        b=g33VYYqLCI2Oj5YaVMSSh0TBNE63dzqUFHQ6mxCpZvFLjgs0aPG2PZLECLbLpZSXB1
         ekibhaG+2N+l4Du7datN+jMias+xSkmexmVB30y83ssr20hLL2EKj1GQyOVx5RPTKvMe
         eILm6AxJ5X1Rd1MWy2+GRWmCholg6EWDKaV7MSAduKZp5A6B65SLicq9X691KBBSNwc4
         g2mm8o0CxpuIr6bcWsIdRjaM2gkHtxTVd3mKlsWL8rDnzquDLi0cORm2zJOT+0z3Kjj9
         +4aOFnwwdIkZVaglZkJgWjAw8I6YcBpGNpMoofHfyGzQRMmEWfUNlcqL7Osa+plpOMUm
         Ysvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039664; x=1751644464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zp3frUPq8X30V/7RwOoUzwNZ3UE3q5pkBDA56m1WbWw=;
        b=l6pfWg0AMLeC94J+R2XtHUgwqyQsxSZTVDB4D4I9PikuuVrcS4kelyweS3UULxwPBD
         ZAPtUIfmyRaW5SLZ+C+6t/HmVdA9fmQcDS4erKCUReORM3tM9YuKxcn2UOS1K8QDFlFm
         lTf6Xrkv4KmOqzQ1ukJu2TtZnAADEYOlYfhlyDoJ4U0vKDLe0JxeS26mSvWz+weDgKEE
         9o+i7DZclEZuTD31/aLNHxKp1VL2zNMtn0+l6adWd2FOIJUIagsaOUHoWZ8E41kKIHEM
         x6x5oQTLGurAy3SCXNTkiVl0JFa5yq7TN1JuEZFIXRCQcThuIp9NaCePzN6BijWUBE9G
         iQqg==
X-Gm-Message-State: AOJu0Yw45yJ/V4+IrrHlOZPqvl27u98RVp6VomN4xjR7c1W8LcLddEs8
	OFvlyySA1AillCBsR220R00TxQsJhL0NSDKQTegbY6NvkpG4NKovN0zgO51i0S5lM4r9xKObm6z
	KimjVyVJfyijYLfdQ/7OBlrl9arq32yM=
X-Gm-Gg: ASbGncsma2ID1yndNXmy4LfdY4c4h6emW/5pfOVnlZWshjQkvJf9T/TiK7TI3dBtm1J
	xRfNJms+hmn5eEGuAcB+ET0nAluft9nvx3zUOCkb3nJllBoxb6YR7TPDRdswpYpAadcCg4JB91E
	+xm/Og9SZSogTSvHSmGmvK4rNBNLNljfg+o0Gm92sUqyyWl51TH8nVGVxXiK3zQX/0I0WQxS2NM
	aFIZQ==
X-Google-Smtp-Source: AGHT+IFbvfpkmNUPiMWU1lVt9RT85ZJWdyVqj9y790ZFbwebKZLAxcPRldabMnin/IO2PBAg5K7g9jx1F/3g+kcLf7k=
X-Received: by 2002:a05:620a:4414:b0:7c5:65ab:5001 with SMTP id
 af79cd13be357-7d4439fb3ffmr521835985a.39.1751039663571; Fri, 27 Jun 2025
 08:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <35468b8f-96e3-ce30-2365-9d72342407f1@crashcourse.ca>
In-Reply-To: <35468b8f-96e3-ce30-2365-9d72342407f1@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Jun 2025 17:54:12 +0200
X-Gm-Features: Ac12FXwZHT5O5uF1wMcg3XCXvnkB6V-yIYubirXX5lNTLbAWlbdXKWusfxj_ubU
Message-ID: <CANNYZj_E1G8BimqHf7mJe+exq4bmkrj1V91-kTw_0EAtjFLOyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] local.conf.sample: drop MIPS/PPC, add RISC-V entries
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 15:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219427

A similar fix is needed for meta-yocto:
https://git.yoctoproject.org/meta-yocto/tree/meta-poky/conf/templates/default/local.conf.sample

Alex

On Fri, 27 Jun 2025 at 17:50, Robert P. J. Day via
lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
wrote:
>
>
> 1) Drop MIPS and PPC lines since we should refer to only those arches
>    tested by the autobuilder.
> 2) Add entries for both 32-bit and 64-bit RISC-V machines.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/templates/default/local.conf.sample
> index 3a9706c1d5..749bab9883 100644
> --- a/meta/conf/templates/default/local.conf.sample
> +++ b/meta/conf/templates/default/local.conf.sample
> @@ -21,11 +21,10 @@
>  #
>  #MACHINE ?= "qemuarm"
>  #MACHINE ?= "qemuarm64"
> -#MACHINE ?= "qemumips"
> -#MACHINE ?= "qemumips64"
> -#MACHINE ?= "qemuppc"
>  #MACHINE ?= "qemux86"
>  #MACHINE ?= "qemux86-64"
> +#MACHINE ?= "qemuriscv32"
> +#MACHINE ?= "qemuriscv64"
>  #
>  # This sets the default machine to be qemux86-64 if no other machine is selected:
>  MACHINE ??= "qemux86-64"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219426): https://lists.openembedded.org/g/openembedded-core/message/219426
> Mute This Topic: https://lists.openembedded.org/mt/113863951/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


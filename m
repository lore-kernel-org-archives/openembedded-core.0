Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156F3C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 07:40:37 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.22587.1659944426706311922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 00:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=at61HnaZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id j15so9893078wrr.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 00:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=665PQf5KbEOUxeR+oLyNG4xy8+nmNB6Dgw1oi7+rzsU=;
        b=at61HnaZprCMDYhS8qy4oxlAjtoNobkIdFP6UDtjVk0S8Mk21p+rz4eUW8n1aKNBbG
         6+efkL2oRlz9pPInusXOdJFKLBGja8B0nuPWf3e0PDumu5EnxO+Easj7WMMeIA2tipA0
         xx+XeQIQiuwb1Wk+T8NYNMLuvMUXZypiQ6NyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=665PQf5KbEOUxeR+oLyNG4xy8+nmNB6Dgw1oi7+rzsU=;
        b=jKowQ1zafvWMymyZM7fi8/7H83aGg52/4PiZeXk1Hgg+mlbKdOnDmOtlE+7Uv3bJaE
         fAg4hdvHECOiYoRgUkSott3aJM1du0M7KntoVx7TgzBdl2LWOpBe5hp3wCtUnqbt3Jbt
         TheDG2qpRY7wu1Hucg+5C/IICCCYH9d2bARlE+Teej6k++OQE2HClt7PeLUuEclnBEXi
         u3PrPjSn48ZcSD1ZwqXmQE+u7xdULvuhHPBtY597so7qhfmU66st+IpMvX9IVPiB879v
         wnQf7UUCjbhFFW6S9U+FcKj4R/oW+RiLOvgssgzWmIZnpbTD9Uj3stSAUiuWgzOgTjRX
         RrFw==
X-Gm-Message-State: ACgBeo2G327IeJVNiZcsgEq2IQDbb+t6C0vDo9xegY5fg60EGK48A71h
	RKs0WMNBtr7D82lNDgB9IRl5l27RtclThg==
X-Google-Smtp-Source: 
 AA6agR75JRGIHXG7U+NiVmY7wP5KZ3NCtoFLXlLvYSUarherZXkUaHBJ24zecD4wOg0idIWUS6bY8w==
X-Received: by 2002:a5d:6d88:0:b0:222:c8e2:f5fb with SMTP id
 l8-20020a5d6d88000000b00222c8e2f5fbmr3203059wrs.35.1659944425202;
        Mon, 08 Aug 2022 00:40:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d3ed:8697:1d83:a16?
 ([2001:8b0:aba:5f3c:d3ed:8697:1d83:a16])
        by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b003a31c4f6f74sm19300322wmq.32.2022.08.08.00.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 00:40:24 -0700 (PDT)
Message-ID: 
 <a114991e21f7e88229cc67fe7d76f3dcb765184b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] syslinux: Fix build with glibc-2.36
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 08 Aug 2022 08:40:24 +0100
In-Reply-To: <20220806120939.3750329-1-Martin.Jansa@gmail.com>
References: <20220806120939.3750329-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 07:40:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169071

On Sat, 2022-08-06 at 14:09 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...binstaller-Fix-build-with-glibc-2.36.patch | 53 +++++++++++++++++++
>  .../syslinux/syslinux_6.04-pre2.bb            |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-devtools/syslinux/syslinux/0012-libinsta=
ller-Fix-build-with-glibc-2.36.patch

I think something in this series is breaking on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5647
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5662

Cheers,

Richard


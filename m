Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4D9EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 05:57:42 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.5139.1686722261237791108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 22:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qzN0CIZH;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f624daccd1so7541872e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 22:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686722259; x=1689314259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jDmOSeqmmuH7jPvkwZHCI1DpwFl0md+W8rZfAS2XomQ=;
        b=qzN0CIZHxCJhEOQMf3YzpwO87REU9CuVITEW7LbXm0ZRRRDlCPZAMRwWUJJnxWrDr2
         KZExfpT/CobybtzXJCu5sRFxD+HbSSa/AY8RBoCiUYdvcqzlbl8msxMEQC7NRstSyCvh
         Axz6KlqPwa99j2SbizCeZws56X/7fNA7fVFDmBW/YyW36UFezRJM+E+H8arCRHLJgg3z
         YpC8yngwIQpzkgnD48tE5cfoMtkB3BCz7Vk+9wan2PwZglu/AVbVkCqJgz0mrN/AQNC3
         ojRH5yb/fi6RDPAw644i0JuPmkJMqSkuGjvlXlBysPiCpjSSEzKWop8lbeoqAJhdoPt6
         +3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686722259; x=1689314259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDmOSeqmmuH7jPvkwZHCI1DpwFl0md+W8rZfAS2XomQ=;
        b=XbdZAclN0zlPFBKx2+K5M8Co6QlkLYtVjOQdM5Yvg80+yYJPD7KPAnOsUjrFOD1qUm
         xosBPg+tt5fi6N/hjJKlZtFxXZcJqb0+ts6iWCqqUo6Iozo9jQ9iNv8N3x7rTm4tZXd2
         RaJJWow609dwqOCi/xFacWg91DB3VabbALymL6u72eA1vyvEZwkRMN07qexVcKmLkukP
         nhhv6JRMVeF3SJkSezrNCHKHhimz1yvNYG7wXuOezK/yjIy/HoelxL+WTP2z2zfVlRie
         wtHgGv4w+h5I8U9uTIe8V4YGRMvQAQjELwqbH3H7z6ElkSoWok5Ai1tJ42Uf/1b/DF+m
         m3hg==
X-Gm-Message-State: AC+VfDxPDk6GTI5QTDpGSW7qDVtLEWcUbeFRVTq7L66RGKH6JVTkPByt
	ynNug1Fyto+mX0kEQMB3PbeN9sbXWY3sT/Asmx4=
X-Google-Smtp-Source: ACHHUZ54YUwDkXrWx0Q3Vv58Dgeyd0dKDjA1P91j/8Pfto6mQpqhHqnKgcTZS5z4xclFC8luhD1VLSLesm1aXrx8DBk=
X-Received: by 2002:a19:5e10:0:b0:4f6:3ef4:5c7b with SMTP id
 s16-20020a195e10000000b004f63ef45c7bmr6929172lfb.50.1686722259026; Tue, 13
 Jun 2023 22:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230610011339.3716428-1-rs@ti.com> <20230610011339.3716428-5-rs@ti.com>
 <DB5PR02MB102136F50D6C9E9121C9FD08FEF57A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj99QKDuDc7oPaytFOUAeaiSL9y6WMT2Dmo5nLUTNNOLKQ@mail.gmail.com>
 <DB5PR02MB10213D04533C11ED783E5335AEF54A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj-UnVQmJYeYY=zHq2xEKXZXoSNJtraAor1HEkdGVqJFGw@mail.gmail.com>
 <176801038AB94927.4582@lists.openembedded.org> <a834239b-83d7-11cf-3ecb-c2ef53b8e6ab@ti.com>
In-Reply-To: <a834239b-83d7-11cf-3ecb-c2ef53b8e6ab@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Jun 2023 07:57:27 +0200
Message-ID: <CANNYZj-4BAtc1F-ocrcqKb+OHAbrC9GKznHNt1utCtrA1+oF5w@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [OE-core][PATCH 4/6] weston-init: fix the mixed indentation
To: Randolph Sapp <rs@ti.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, "reatmon@ti.com" <reatmon@ti.com>, 
	"denis@denix.org" <denis@denix.org>, 
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 05:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182733

On Wed, 14 Jun 2023 at 03:16, Randolph Sapp <rs@ti.com> wrote:

> I noticed master didn't pick up any patches past this one. I take it you
> want me to reformat this to the current tab shell block standard?

The remaining patches are still in the staging branch:
https://git.yoctoproject.org/poky-contrib/log/?h=abelloni/master-next

If they're dropped from it, there'll be a separate email explaining what to do.

Alex


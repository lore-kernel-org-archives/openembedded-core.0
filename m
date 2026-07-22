Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC378C4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 07:57:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42950.1784707037035849533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 00:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1q5DXuCY;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so32262365e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 00:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784707035; x=1785311835; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fYJSv8xsFiiE1NqZwtETSnu5Mzvxa1uaTviwLTLTX7s=;
        b=1q5DXuCY1iohA1p/9zFFLhAScOXadHJL9JetAmxrnND3YwKq6YoIICXDjlPPZkJ3IJ
         7ejFV0QXOg3fKf3h/Rj9p/EuLwFLWZ4T+x2xeay4I6C4wkhwrayi5ApWdHQv25pLL59W
         wSRNvFBM1DrzjkZvXEShcOsVOlOBibHXvKO78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784707035; x=1785311835;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYJSv8xsFiiE1NqZwtETSnu5Mzvxa1uaTviwLTLTX7s=;
        b=nJdVNSF1RimRAyfrlnIOdBYfUjnu9sZhVEAeQdsKsuuzray1C6lpBF3+VJixmUch7Y
         7HkGOscQO9Kk22YlBbV3er4uIbwcn7ED8yjSZya7V6CupTY1Mv6b2Co7T3S3sHXPpTY9
         34xGpLBSLDMLy13xHYbic7gq0BCHWDs0A7koCqJlI6VfCO9fWyx3ScFQaKxvvDF4R/IO
         e0LwKArm9N74onZ1CU2CUHSXxDUR1+4UaklDK0Y/Ti38Vih9znmERdYkprVveBR4vHgu
         2Crdzsym9W3rPBOh/Zt+Ds3elddXJ8IuLQoZkNlZs9DxS8o+V9z6kAYcft7FrBELX8C/
         iiHQ==
X-Gm-Message-State: AOJu0YxI6O2yFR7nQGzW/NJtnyI3UBjilmKs3AvMOkhTy841rdd/h1x7
	jBTb5PRJ7T3YpP7vDUpuxrHaFjRa9u/7+SPhZbJ2zFHy2D6SUVmDylHk+egJ6W4gdbs=
X-Gm-Gg: AR+sD1094AsrT1R5Uf7ESls9hleDz5Q9H3ClXtFg1tkD3IBuuyMXMBR2gLywc+UCwwT
	GiwQPz2wwn8zu1Er08iYqexbDPEm93aHA4uD1forSlLVVJzbXCKNJbcwHL00SsS6JT0Z25Z/You
	nm7av5mciBF4+Xf8BxY6KGMRmLVgv5GFXf2J5b0+ZgpaXwZHmefEZsePAKFUwXCsyXUMslj0Z2x
	C1dQof57Wwg7jsR0GWUhWzZ73p1xUNKFJTBv7vXlHNGLX4Rwh+IVl51LCJOsJAXZeibEneFYjht
	Ax6O9jS+5xOiHk7Ma5f5dER7xdVHDmJ+iSnFvXRkwNskBNNiqzC0Z1Gozft9C3QIZEA3jy7WA4c
	82ZIxEW/FQdvmcQCavEWTFeJuYNiY89QBsGWNL0tzSfxW/XH7y23uuLmjEvAT8Askc7HX48TYEs
	6NHU9d7wTj5YAEQE7+5rkLP1hxI9XylhYYln6NaryLt6MJogESjIYs/q+GC3nUiA==
X-Received: by 2002:a05:600c:4f44:b0:495:5b02:23a8 with SMTP id 5b1f17b1804b1-4955b022588mr147697495e9.34.1784707035137;
        Wed, 22 Jul 2026 00:57:15 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bffefsm114925525e9.9.2026.07.22.00.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 00:57:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 09:57:14 +0200
Message-Id: <DK4XUCZ5OA0V.3T7IGSRDSI1PO@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
To: <daniel.turull@ericsson.com>, "patchtest@automation.yoctoproject.org"
 <patchtest@automation.yoctoproject.org>
Subject: Re: [OE-core] Patchtest results for [PATCH 2/4] Add tag in SRC_URI
 in multiple recipes
X-Mailer: aerc 0.20.0
References: <20260721144811.323786-3-daniel.turull@ericsson.com>
 <0101019f85332a41-715bc4eb-5531-4e75-b229-00eb43db757b-000000@us-west-2.amazonses.com> <0d61576c6efee1814a1faabf68d32c6ccdcfcb4e.camel@ericsson.com>
In-Reply-To: <0d61576c6efee1814a1faabf68d32c6ccdcfcb4e.camel@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 07:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241606

Hello,

On Wed Jul 22, 2026 at 9:08 AM CEST, Daniel Turull via lists.openembedded.o=
rg wrote:
> On Tue, 2026-07-21 at 15:02 +0000, Patchtest via lists.openembedded.org
> wrote:
>> Thank you for your submission. Patchtest identified one
>> or more issues with the patch. Please see the log below for
>> more information:
>>=20
>> ---
>> Testing patch /home/patchtest/share/mboxes/2-4-Add-tag-in-SRC_URI-in-
>> multiple-recipes.patch
>>=20
>> FAIL: test shortlog format: Commit shortlog (first line of commit
>> message) should follow the format "<target>: <summary>"
>> (test_mbox.TestMbox.test_shortlog_format)
>
> The patch affects multiple recipes, so I don't know which target it
> should be.


FYI, those global patches are often tagged "meta:"
For example: meta: Support opting out of any machine features
https://git.openembedded.org/openembedded-core/commit/?id=3D3194d6868dd14e4=
0ae670db089e5bf6f862d3044

Regards,
--=20
Yoann Congal
Smile ECS



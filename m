Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC76C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 11:26:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67363.1782991570960335226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 04:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XeMAlMNQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b779003fso8421415e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 04:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782991569; x=1783596369; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mZYN8c/W8GUsxwjV/Ua9670kJFlzfmu8OYRG7DYuo0=;
        b=XeMAlMNQl72IJx1x9T25gy9jicEapMUqIiesqxWsi+2m15jjo+N0v1MavjvXGwLxLQ
         xlf9WH9PkeHatduSlf4ji5ctw5GDiORQUdyFrzAtbd++8rExZKUuRbFSCeXAwESk8E1K
         8+xffrJT3pVC9BulKp3R9bZeqLYnHUaxQIWpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782991569; x=1783596369;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6mZYN8c/W8GUsxwjV/Ua9670kJFlzfmu8OYRG7DYuo0=;
        b=k/QczZN8Rlv66Dy2KpT953AuTrXcuWHGCbp41TD3f+oiUuinqbdFq33aVCsDJ4QHcp
         ugf8Zwo/W//EM573+lJsUkTGoSXvgy1JYgvUqPhmLzvgU7hR48HVsMAf6BSIP1RQH+qk
         Yloz2xlxZWF0Ub1Al39+trepKnhEP5rjnoRfYRYDhMFIU94iHckGpLQcTHo+sp8AGY7T
         fBbmL3lxJ08K1b8D2l+0QJnWuZ4xs2idm7qN798PPdu2dacBscsuR0FwvNQwrmkhi7HP
         Q4eiSZ2flBKfHaTfd0HtoQIy98uhv/xG7hiBFZCl59JWRvMUFRif69sFHRINWd6TYZgc
         U4Hg==
X-Forwarded-Encrypted: i=1; AFNElJ/+ZK2HnQPiazrIS9/OSPdZHgQejJ5Re9nshueLL/QS7YzoYOyhuNmu0AXXP6Kaf6Lftp05/fb3UzxJJrlGoLNt7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwWZ4rox60/wuea4UK74FJgXUz7AqCKS7BYVypKg+WTXhyHYydm
	e2U/o5RtRenA1W/pUygjPN4Ht/XfIuKrs9JMOcJ+tbnnYIN8/0KXvxFxv+fBgyvXGcY=
X-Gm-Gg: AfdE7ckebbOT6Wr79sJJ8AF0RUONOpyYzCeNisVLvMkC5/yQaEQGHpZj/JLBe4WCIT8
	2ja6iKsf+9jsOMgIqv3puMsICEDl/quKjFKtjfoRTwMSAqLicpfbD5TN1WyN2+JFmTJTBnp74FI
	RBjSbS1vffKhSjgK0xqL0sZaSukMlWOJydHzF7vPuqD51taqxCmiM/KEcjVf/x2zZW0av9lnILl
	bUx4u1T0aq6hSt6fcgwXNhUUV84H+ZsNhubqmJ4TcIuAJLtHM651JpvO7nEJmMy2qx9OOIhx0+y
	gCrttz1Fw9tKEGbsDxoiH0EXfe5X+Pxtq1uRVvfj7NHTfF5i6NONUHLLMcmFYzHk+1XzMd4bQaW
	inqvSyEFHlVnZUFCrrY/EFZOv2M0zU02xP4fAjNcOyg/Gjd5TTinLLGTeF9mL3tOPF9EFJZKNTY
	jlTI43+ZcmTn18zVqIism0dfssVBaZkR+QgLQxt1slin3q0k/Pr8azUFuMuLQKTxX3FgV7JgV76
	bULJg==
X-Received: by 2002:a05:600c:5010:b0:493:72d3:4a81 with SMTP id 5b1f17b1804b1-493c2b5161emr78504275e9.16.1782991569124;
        Thu, 02 Jul 2026 04:26:09 -0700 (PDT)
Received: from localhost (2a01cb001331aa00c56cc01f8c3c1c95.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c56c:c01f:8c3c:1c95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm37348225e9.5.2026.07.02.04.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 04:26:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 13:26:08 +0200
Message-Id: <DJO1RET2JWA2.2H0HY5TPUI2T5@smile.fr>
To: "Marek Vasut" <marek.vasut@mailbox.org>, "Freihofer, Adrian"
 <adrian.freihofer@siemens.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH] kernel-fit-image.bbclass: Do not include
 kernel property in DTBO config subnodes
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Ryan Eatmon" <reatmon@ti.com>
X-Mailer: aerc 0.20.0
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
 <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
 <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
In-Reply-To: <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 11:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240033

On Tue Jun 30, 2026 at 2:58 PM CEST, Marek Vasut wrote:
> On 6/30/26 12:51 PM, Freihofer, Adrian wrote:
>
> Hello Adrian,
>
>> I guess, before this patch can be applied, this one (or a back-port of
>> it) is required:
>> https://git.openembedded.org/openembedded-core/commit/?id=3D85e0408a81bd=
ca0411a8625061e5e343c05f92d9
>> Otherwise, the oe-selftest fail.
> Thank you for staying vigilant.
>
> Yoann, can you please pick the aforementioned commit too ?
>
> Thank you for your help !

Hello,

I missed that discussion, sorry. But was reminded by Ryan (thanks).

If I understood correclty, the set of patches we need for wrynose is:
* kernel-fit-image.bbclass: Do not include kernel property in DTBO config s=
ubnodes
* kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED =3D "1"
* oe-selftest: fitimage: Do not expect kernel property in DTBO config subno=
des
* kernel-fit-image: Add KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB=
 (this one is not merged on master yet)

Marek, Adrian, Ryan: does that sound correct?

If yes, Marek, when the 4th patch merge, can you send an updated series
with all 4 backport patches?

Thanks!
--=20
Yoann Congal
Smile ECS



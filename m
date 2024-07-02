Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C07DC3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 08:59:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.19884.1719910790523326902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 01:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qlzj7/va;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-424a3ccd0c0so28102785e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719910789; x=1720515589; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9swm90xGci9IB5Jd+8O1biOS5/xn4jz3yr3iSUSozq4=;
        b=Qlzj7/vaDjwI1EC3H1WLs59KpOAWHh2S6n3HC9yHz6lRxl3Z4Oe6jizjsP7abMkizF
         vGO0TujidBfR6stPe22WAdP1T3rPXJeBfz58F6IxSdsut2U+ysE7YGbbWRYkcMJQ/EHm
         6is+8BL5JG9tgl0XMtmZzBkVgWKhS4vclFiHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719910789; x=1720515589;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9swm90xGci9IB5Jd+8O1biOS5/xn4jz3yr3iSUSozq4=;
        b=vifQh/b9vhlq5n5MljBCXrZm0oLLuW1ATtYudld/id6gI2Z0IzuvDT7EYTR9S/I1jO
         YNNnxZUe5HdUv6dn94I1qgRfSOg3YAwpl1HvBA54xBw/XWh2yg24Bn6Rsy3PIiotZ2Tu
         ml0UVt+sJaFk2SCaIoxnb4HZFxjv6ZO+T9tHEfRXdKNUTisg3u0jaYWK1P+0O94kveTy
         hb3BxKyhrpRfTfCcb5XoIl4AZAjIaq3IKq1CFjtoRE/B8NUPJrqUiU3KazaI1ACg5pym
         BMYO9uphIFnujl7ebNdoU/YzF8iZ6zUOk5mZhhZtuZq6Ve35jIGDJfH+HTe5PDS4TA3T
         TFow==
X-Forwarded-Encrypted: i=1; AJvYcCVIfdQwm/bl8fQD8zCCPPFr0ekY9A6DM9S0TloKY9WUQgMhJ+CRt2uMr7jzWU75a2NHvIyt0EQQGM5TWxrbpamS05O11m7RH3DyLS0fXE1Xip3cgPe+UFXv
X-Gm-Message-State: AOJu0YxxoZwqW5rI5RBqG4Cz9rrGGyAM+Zc38aD/98o3SvSgEXhNX5UC
	XiDN3Uvc5x4irmc5mMU8tRw4tGZu/ZuX0q/Xrq+Qs/DkWO9pW9cBxUb4eNVhH3w=
X-Google-Smtp-Source: AGHT+IHOInTg7esdyo1PT5nGSchLME8GWZXN6SDMazNj8cpR2WZ0OS+gBam1M3DP2xIXAQjlpGizAA==
X-Received: by 2002:adf:ec49:0:b0:364:7f42:1b66 with SMTP id ffacd0b85a97d-367756b7073mr5355494f8f.16.1719910788712;
        Tue, 02 Jul 2024 01:59:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e0e2:4d33:6557:e74f? ([2001:8b0:aba:5f3c:e0e2:4d33:6557:e74f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e174bsm12585616f8f.63.2024.07.02.01.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 01:59:48 -0700 (PDT)
Message-ID: <9f5ad0498ee04abc2cdcbfdde1e4db867f741096.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 9/9] rust: Upgrade 1.77.2->1.78.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	alex.kanavin@gmail.com, alexandre.belloni@bootlin.com
Date: Tue, 02 Jul 2024 09:59:47 +0100
In-Reply-To: <17DE24B76261B84E.14163@lists.openembedded.org>
References: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
	 <20240701092639.1498856-9-Yash.Shinde@windriver.com>
	 <17DE24B76261B84E.14163@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 08:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201418

On Mon, 2024-07-01 at 17:47 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2024-07-01 at 02:26 -0700, Yash Shinde via
> lists.openembedded.org wrote:
> > From: Yash Shinde <Yash.Shinde@windriver.com>
> >=20
> > * Drop the following backported patches which are merged
> > with rust v1.78 upgrade.
> >=20
> > - 0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch
> > - repro-issue-fix-with-v175.patch
> >=20
> > https://blog.rust-lang.org/2024/05/02/Rust-1.78.0.html
> >=20
> > Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>=20
> With this series applied we saw the following failures:
>=20
> https://valkyrie.yoctoproject.org/#/builders/4/builds/66/steps/12/logs/st=
dio
> https://valkyrie.yoctoproject.org/#/builders/60/builds/66
> https://valkyrie.yoctoproject.org/#/builders/2/builds/66
> https://valkyrie.yoctoproject.org/#/builders/19/builds/67
> https://valkyrie.yoctoproject.org/#/builders/41/builds/61/steps/14/logs/s=
tdio
> https://valkyrie.yoctoproject.org/#/builders/18/builds/59/steps/13/logs/s=
tdio
> https://valkyrie.yoctoproject.org/#/builders/6/builds/59/steps/12/logs/st=
dio
> https://valkyrie.yoctoproject.org/#/builders/3/builds/66/steps/12/logs/st=
dio
> https://valkyrie.yoctoproject.org/#/builders/67/builds/62/steps/13/logs/s=
tdio
> https://valkyrie.yoctoproject.org/#/builders/67/builds/62/steps/16/logs/s=
tdio
> https://valkyrie.yoctoproject.org/#/builders/67/builds/62/steps/19/logs/s=
tdio
>=20
> and the builds haven't all finished yet.

The build completed and there were a lot more failures. Notably
reproducibility failed:

https://valkyrie.yoctoproject.org/#/builders/37/builds/74

but also:

qemuppc-tc: https://valkyrie.yoctoproject.org/#/builders/49/builds/54/steps=
/12/logs/stdio
qemux86-alt: https://valkyrie.yoctoproject.org/#/builders/20/builds/52
qemux86-64-alt: https://valkyrie.yoctoproject.org/#/builders/95/builds/52
https://valkyrie.yoctoproject.org/#/builders/45/builds/52
https://valkyrie.yoctoproject.org/#/builders/31/builds/54
https://valkyrie.yoctoproject.org/#/builders/32/builds/54
https://valkyrie.yoctoproject.org/#/builders/36/builds/55
https://valkyrie.yoctoproject.org/#/builders/30/builds/58
https://valkyrie.yoctoproject.org/#/builders/16/builds/58
https://valkyrie.yoctoproject.org/#/builders/68/builds/70

Cheers,

Richard


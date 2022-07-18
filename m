Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8E7C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 12:45:42 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.26543.1658148340349501587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 05:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FviJ26rp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id n12so4016973wrc.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 05:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=zr46UzVQXzbactopwpAFwl+1W9D3a9RktSpwJhZPoSg=;
        b=FviJ26rpazmS3aPtNmxsbVj6+gc670GlflNpbv831Pv++6q5PCsE0ShXPCYQxPALT4
         NE7RdlBCgyjAmRlCSI/JZ6cvkxOljj408DVgCh1mhgLDt9sMmZs/tGAc1zsn6F12ILrt
         Ez+1Chj+bz3hZFyRSCx5SwO3KOj9byvs1LcxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=zr46UzVQXzbactopwpAFwl+1W9D3a9RktSpwJhZPoSg=;
        b=vPZv/f//gtkjhqgxhhLab1mUAJNUyTcZJyD6chDo9MhMBGZju/kq8YCXn9dFy+mkOk
         T/VtfkZXfi+/UQ9sIkZfy8h9l0wZ9putkwZOutDsWgzH3owooe3cMHuzWRaYdZotXkrm
         sUuqsP0ykywd/ICIZSw9Hzkm2YuDeAXmmT07nG7JtCWAFVVvlPTV2Y4DY0KmD94EqccR
         NU2CI02ek9tB9h021wZo7qDKGwJn7AivOuw0WWVpum0wx/0r64TSpRfOaHjrAgCGSy0H
         XG4KgUNMY6LFwTiww9RCY2JOh3onusNBFJw8zwBTlTeFWsc524EnISQZ6BNaHzXsP+SK
         qgVw==
X-Gm-Message-State: AJIora+GrvRyKTZTpj+p5mnU6noywZpVAfDs0lCsB53DP4O/ktkIXMbh
	XmStMpy3jbC+WI8f1c8RO9l6gA==
X-Google-Smtp-Source: 
 AGRyM1t9KMrIzx78AkIJCSkt8zeTl8QQFt6g7ZB6+aE+L/RiqyxyQ11Yi4yhYD7pkADfk8oSfPq2OQ==
X-Received: by 2002:a05:6000:1f0b:b0:21d:6dae:7d04 with SMTP id
 bv11-20020a0560001f0b00b0021d6dae7d04mr22904194wrb.414.1658148338550;
        Mon, 18 Jul 2022 05:45:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5ca2:743d:43c8:8a3?
 ([2001:8b0:aba:5f3c:5ca2:743d:43c8:8a3])
        by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003a04722d745sm19861116wmq.23.2022.07.18.05.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 05:45:38 -0700 (PDT)
Message-ID: 
 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags
 during target linking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2022 13:45:37 +0100
In-Reply-To: <20220710164300.953098-2-otavio@ossystems.com.br>
References: <20220710164300.953098-1-otavio@ossystems.com.br>
	 <20220710164300.953098-2-otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 12:45:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168196

On Sun, 2022-07-10 at 13:43 -0300, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>=20
> (no changes since v1)
>=20
>  .../cargo/cargo-cross-canadian.inc            | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)

I did look into this with some local testing. With:

SDKAMCHINE =3D "aarch64"
MACHINE =3D "qemuarm64"

bitbake rust-cross-canadian-aarch64

still fails so there is still something wrong with the SDK builds :/

Cheers,

Richard



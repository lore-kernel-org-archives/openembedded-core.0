Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0C1D149DA
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 18:07:22 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.2087.1729879636301851718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 11:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZvGQWg55;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e3f35268so3068818e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 11:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729879634; x=1730484434; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=irYb5odEeU1ZifgvCNfHsm6BUm4WWE2nb49ocjpH7Io=;
        b=ZvGQWg55fW20dfCcCXDXrJ4+vXN4G22tDxSIzsAgJmE7p1m70clc63RSiZBEK6vlr9
         qSD7VcWgXLqathibrQe9b0w2hgHc8sKYwnYfYej9E5ETDvlcy7ycP9dCxXBMW/B7btwY
         jQaE5UW9sBvP2YSBeIRj6TnXxeXtN1eC7Zeao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729879634; x=1730484434;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=irYb5odEeU1ZifgvCNfHsm6BUm4WWE2nb49ocjpH7Io=;
        b=Qv0jBX8irRDL3hWv+j6P828KvO/ow6yRyN24sFpDf4DCkAk/peQQfZ3MSsH9L9mwv1
         0S3PplL7CbA4rtewxEYV24mjwtIogVRlEGK/G/T1V4CxFSq/d3zwkNAveBpmItQfT7oJ
         UGCipk/P5tCemxtA/eXO90XxGEB+71lIv5GwGoarMRWImhJcwE8e41QaLIGq1OJ0xN9X
         Kpk0u1bReHLAsPa6ypmD3BnWHd2UZQyZHjSV0OMiWDOtx62jQwVRalfDytEJkAnVVbKm
         DFJQ5OY6HZj+ZRHuCWhoHBp2jnFvUAOcK5A8PfciHG0OHOK0Q8E+Ka5SaSp/0l4xGLO4
         wLag==
X-Forwarded-Encrypted: i=1; AJvYcCU7MA6Paj7fByVqqpGsDDXPUuqGA2eRv+psEQgIfo88ydIY+BlT2tX0TdrQFYyn/hOk5Kk9D8Soz5/X0uuW530qHw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yygd65ASAUkh5SuaGnZTvG8wfipmrwUZsL7Xse0MBq6KiJeL5ib
	m/xj1bIpuriOtrGKypzy9EcZBcyD6MLTyycd6+6nWlyzA1KqPnOA6JW+vR8ok+I=
X-Google-Smtp-Source: AGHT+IEIBVmPtnaBdznxk2+RWYUvntJYe9zC6mlcJfMjS0VUfZEBhQbln77WGiHhQNjMxJipDc92kg==
X-Received: by 2002:a05:6512:3043:b0:539:f10b:ff93 with SMTP id 2adb3069b0e04-53b348dd502mr64638e87.27.1729879634243;
        Fri, 25 Oct 2024 11:07:14 -0700 (PDT)
Received: from max.broadband ([84.69.197.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4317d03b8b4sm102722735e9.0.2024.10.25.11.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 11:07:13 -0700 (PDT)
Message-ID: <3aa923c643b7536db0280c02df6f4fd69e5c9657.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto] [PATCH 0/9] busybox: cleanup and fix config 
 fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej <andrej.v@skyrain.eu>
Cc: ejo@pengutronix.de, yocto@pengutronix.de, 
	openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2024 19:07:11 +0100
In-Reply-To: <SLX9SS$38183D9630E103129BF22210DCF67086@skyrain.eu>
References: 
	=?iso-8859-1?q?=3C20241007120950=2E975803=2D1=2Dejo=40pengutronix=2Ed?= =?iso-8859-1?q?e=3E_=3C86710f995a94387b6246fca883d5669acef032dd=2Ecam?= =?iso-8859-1?q?el=40pengutronix=2Ede=3E_=3Ca30ee7e5=2Dbc6c=2D4490=2D9?= =?iso-8859-1?q?c10=2D2972138051b5=40skyrain=2Eeu=3E_=3C0eff54fc7c7be4?= =?iso-8859-1?q?f7d5ea956d7209a2a93fa0aca4=2Ecamel=40linuxfoundation?= =?iso-8859-1?q?=2Eorg=3E?= <SLX9SS$38183D9630E103129BF22210DCF67086@skyrain.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 18:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206358

On Fri, 2024-10-25 at 19:26 +0200, Andrej wrote:
> Ok, I was thinking that it was done by intention, but it happened 14y
> ago=C2=A0
> https://github.com/openembedded/openembedded-core/commit/615a98ed9a02
> 1da245513790c064761a0a5a67e9 . So I guess not.=C2=A0
>=20
> Enrico, no=C2=A0
> =C2=A0problem, most=C2=A0of them could by integrated into defconfig. Plea=
se
> squash it into one commit if you're going to do it. Or let me know
> and I will take a care of it=C2=A0;).=C2=A0

In many ways I prefer having multiple changes showing an evolution as
those patches do, it does make review easier.

Cheers,

Richard


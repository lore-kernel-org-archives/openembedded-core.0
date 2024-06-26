Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81BEC30653
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 12:41:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.25457.1719405681963479377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 05:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dm0PTMFY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-366de090da9so3024446f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719405680; x=1720010480; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LL3tHjfpEgl2U9T7D3MQQpbkgxH3YpVIPBXOucAsPeQ=;
        b=Dm0PTMFY/Ffv6Q+g3Tdcww1Zh5Chw90d+n1+x+XCPPBArDdwdBBITWAALx30d7Dkkl
         jP12x7lWj8gM7B298PT6r94XFhMDlPVT1wNO06d61hGJOESikvPFz7C9/BnIhJm8vDdl
         AtAIuwMBhPZBgovEaF27dbmTCXKTtw3xT8Tx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719405680; x=1720010480;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LL3tHjfpEgl2U9T7D3MQQpbkgxH3YpVIPBXOucAsPeQ=;
        b=u44eFDmDjaB/ZUWHZtHtLKbcj7O9CGOYF3KOBZ1vMkdVXYRs5Sp8Upmn4zmfpLH0eJ
         rJ0nKtEZ1mcQXxgFv/koxoV4jbf6Py10ac4I5KyhYkW3p1buqtTbOxFp/oqZKg2igYVQ
         jc+DCWqvHG0xbBIWK9IiRbMAkD2vbzIA06R8jkUD1t4QuvfqeE9V6RTycWtK3JPifu3W
         kg4gAApwdfNCXc7An/MHUnOra9XVMsfZ/IS3Q+km8U9hzW4XmqCUbdK3JMJYUIIBYEMG
         ixrYaWgeqr6wTxBwMoAeyFqLwf5WTNsXTISioOWAb3XTaFnEkd/t5ZNKb5eEBC2SUYoD
         rOUQ==
X-Gm-Message-State: AOJu0Yz20K5iraSEIFqMbK9WbmG8hIv2RodepZb2kQXyNQivcw1zP/u0
	BhUEJG8zYM5RMrRhM3fW062cZpV7yd1bBcwE3AaXQMujfB2xY6G+0iaR3skfoCA=
X-Google-Smtp-Source: AGHT+IFM8l76B+g94/wE5bnDbn3LbUDg66qn3aMlfVGK7Ln/S5TmhhS9DPHjhXsGsJMu/1Zdpfl+FA==
X-Received: by 2002:adf:f182:0:b0:362:a01:5f1 with SMTP id ffacd0b85a97d-366e9630071mr6056291f8f.70.1719405680054;
        Wed, 26 Jun 2024 05:41:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e301:b0b7:be9:7182? ([2001:8b0:aba:5f3c:e301:b0b7:be9:7182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638e90ccbsm15720989f8f.59.2024.06.26.05.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 05:41:19 -0700 (PDT)
Message-ID: <13694d136a74e995646135f17fa1e3320d133889.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package.bbclass: Add Requires.private field
 in package_do_pkgconfig()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sreejith Ravi <sreejith.ravi087@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2024 13:41:17 +0100
In-Reply-To: <CAFt4JuG1QWoyoi0gja4hNVb9NYeiGo=DQ2_a=ijz1XUZK6regA@mail.gmail.com>
References: <20240625191513.22142-1-sreejith.ravi087@gmail.com>
	 <77c5ad08b533613dbc8d57fdf565d53a373160d2.camel@linuxfoundation.org>
	 <CAFt4JuG1QWoyoi0gja4hNVb9NYeiGo=DQ2_a=ijz1XUZK6regA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 12:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201160

On Wed, 2024-06-26 at 10:07 +0100, Sreejith Ravi wrote:
> No, static libraries were not enabled. I am using only the -dev IPK,
> which has only the shared libraries. With this change, it is
> successfully building. Also, if it links to the static library, it
> will fail as I am not installing the static IPK.
>=20
> In the latest pkgconf commit, it looks like Requires.private is
> needed for header inclusion also:
> https://github.com/pkgconf/pkgconf/commit/2d26db3a984e7a69cedc6274c22119d=
e4bcf1b40

We standardised on and use pkgconfig which does say Requires.private is
for static linking.

If pkg-conf wants to change the "standard" I really wish they'd use a
different file extension so we didn't have two incompatible
implementations :(

I'm reluctant to try and mix both tools since they behave differently
and one form will end up being broken.

We should mention to them this change of behaviour makes the
compatibility situation worse.

Cheers,

Richard




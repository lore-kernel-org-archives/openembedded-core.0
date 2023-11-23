Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66902C61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 12:50:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.90067.1700743823057052032
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 04:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RUQXiJGE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40842752c6eso5217905e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 04:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700743821; x=1701348621; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVkzte+qlfGVP0Sayk8kgRQDMCK8r1MlXHbkWSTMeJg=;
        b=RUQXiJGEGhffc3ZuORGAxCbGZu2uRnqKX2qlH59Y3cPCVdEbBYwJKV3oKds+hNRYLb
         3w7lm77roM+2OQjECJPiZA+ALil9odLAANT4loAVYG6NsIAQlZfUJW6XXKiYscAXDT8w
         QW8iW0lpuV3cBsssbQRpx47RMSdmJ7weHH1rI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700743821; x=1701348621;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bVkzte+qlfGVP0Sayk8kgRQDMCK8r1MlXHbkWSTMeJg=;
        b=ruVKGM+47bPCrXIaN/WAnEPmVizOZlYnKCdApvRQJZUkrUyqIEhvQrWllOTqTRzEoP
         R9BsfQFudoPBwd60tHTxDQ39HDm0Q8RXPM2xwSchEpEFo4Lmtx45cvcMxRxQTLBlGRFC
         10ztZaNbjYAbgRMuSVzrbMrV3CkChpDC15t0jOgOJ/UZyvqhgp+7ZKB22dG7BHHQRTUF
         VH7I2uoSd1nd+vWNm7tGJwleURzf9DFCi8UwSsGcS9GVhV9TDs1Yr7LmC2xIPprKTGp9
         yWzCQdxQnvIbt/y78M/d4Uo0lqHe5SQOkq8E58WvKbBhcYFmDXF/stZLKO2ZjdZeZR4Q
         f3xg==
X-Gm-Message-State: AOJu0YycywvJkd0sBbWmh+rgvA0KqbuUvNEXwyiH0RU/Ms+kn5A11Zuq
	JcRsu4G/545Vkzah90hnI4p2/A==
X-Google-Smtp-Source: AGHT+IHUngR7PTNFty6lX6SS9/LY3BcMrSMk8rpTlPS+cCG/FpzyYIx8ewCGwV43ydy5dQHN/477uA==
X-Received: by 2002:a7b:c3c6:0:b0:409:2c5:b2cd with SMTP id t6-20020a7bc3c6000000b0040902c5b2cdmr3560104wmj.14.1700743821376;
        Thu, 23 Nov 2023 04:50:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id b5-20020a05600c4e0500b003feae747ff2sm2650370wmq.35.2023.11.23.04.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 04:50:21 -0800 (PST)
Message-ID: <aa9e1e82072027c73d4ce2b787a0a2cc9e4ada79.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv3] cups: Allow to be controlled by root and
 users in wheel
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2023 12:50:20 +0000
In-Reply-To: <20231120161848.1461683-1-f_l_k@t-online.de>
References: <20231120161848.1461683-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 12:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191148

On Mon, 2023-11-20 at 17:18 +0100, Markus Volk wrote:
> This would be the cleanest way I can think of to enable the configuration=
 of
> cups in the user interface
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-extended/cups/cups.inc | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

This definitely needs more explanation about the problem being solved
and why this is the right way to solve it...

root could presumably control this before so even the current commit
message doesn't quite make sense to me.

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CECECA0ECA
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:50:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.23045.1694519429517489073
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T7G6gi2C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-403012f276dso33215555e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 04:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694519427; x=1695124227; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8wzKggarrc6lpt6MgfvYuu44usmDFfupNixj9I9tlws=;
        b=T7G6gi2CesT/fJ3FNbejd0IKlsNb72EDw9KdBAaURyIkgczzaPxsp08X0srHtjBopt
         +du8OqYpSKP1vNfSQFhymXKI8XI1im5wP8MQyhLK+pWMINmsHgsez4gRohWOG31SyPo6
         yqgQwkl/+sfcA7JvnVfEnGjgkwYZfYre0fJGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694519427; x=1695124227;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8wzKggarrc6lpt6MgfvYuu44usmDFfupNixj9I9tlws=;
        b=U47fY7kl0DKhnHPT8Vv8fRCmqbTJTrFXgYzJSz1t5v8IqCNxtBwP7AFsZJFSQq67PJ
         oE8EKw+Sx1Y3fbPreSjUrB75aHO09FpIkeXENLa4gfACfXQ7EvwprVJxc1+zrQc/ip9r
         48GsutUumAe87Wr1gHu9SzEg6pL5yjSz3k2OB1oXd0xqeynVcEfHDBfOcupIe0z24ekk
         VjpboSmpVESjWjwY/thDh1Uft6g3q+44hn/5zW7YCoJOBqD60f1GfhgJG4PpRANiFTRV
         ksrrAJlm2bK739uuTf1l1kALAEXSFiMiKwXLvaXXffQfWosyiGV7I7SGb//S2J1elob2
         n3pA==
X-Gm-Message-State: AOJu0Yyf4DzNWktDFrzHxPDo6qO+j1O93YlWppAXnqZUjK7zzuUYZqoD
	0nA2AICXOxe10klrK3j/kE/5Yg==
X-Google-Smtp-Source: AGHT+IFc+GKKiEmPOfkUP5eiHwoItJPrwi3NMY6GWwraenruKX2Gdd+tpPS/hHp/lXK53L1fqS00XQ==
X-Received: by 2002:a5d:6812:0:b0:31a:d90d:8d9f with SMTP id w18-20020a5d6812000000b0031ad90d8d9fmr10885483wru.25.1694519427404;
        Tue, 12 Sep 2023 04:50:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c19a:2e97:b04:7abd? ([2001:8b0:aba:5f3c:c19a:2e97:b04:7abd])
        by smtp.gmail.com with ESMTPSA id g10-20020a5d540a000000b003176c6e87b1sm12564387wrv.81.2023.09.12.04.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 04:50:27 -0700 (PDT)
Message-ID: <c33d61dd74726e6f11b2ad78f43f1d0d439b6615.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/runtime_test: No need to use
 append with TEST_RUNQEMUPARAMS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 12 Sep 2023 12:50:26 +0100
In-Reply-To: <ZQBPnpWNx3iyWfnV@nuoska>
References: <20230912113242.3994352-1-richard.purdie@linuxfoundation.org>
	 <ZQBPnpWNx3iyWfnV@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 11:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187510

On Tue, 2023-09-12 at 14:46 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Tue, Sep 12, 2023 at 12:32:42PM +0100, Richard Purdie wrote:
> > A simple +=3D operation is fine for working with TEST_RUNQEMUPARAMS so =
remove
> > the heavier append override usage.
>=20
> Ok, but I was being consistent with the other variables in the tests.

Fair enough, I did kind of guess that. In general we want to try and
reduce the amount of :append use over time though so where we have a
choice, we should just use +=3D.

Cheers,

Richard


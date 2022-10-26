Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D6AC38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 17:00:14 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.9972.1666803610043604053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 10:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UQta+BAY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id bp11so26885184wrb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 10:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xRtd8u6A2hHqFYtpuzcC5l76OpWMCQUiIdP1P//cFuM=;
        b=UQta+BAYtgk6kBSrDLBgNZFlZIi2IGZ67sTwhsRnd5ows0r61SJEUGzvz+uo8fKRSK
         VrzJoC6RxRG8CQopozkNNU8btmzy2Go/grQKz1rE/q0nF7caRNzrQD4fF5MdsqkM+g8b
         aN2nxJ4H2mRcDr4KOToeYAVbIpkGzOcUjjeBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRtd8u6A2hHqFYtpuzcC5l76OpWMCQUiIdP1P//cFuM=;
        b=pZMJ36c7Sz7VhkOLGYawyKtXS06+tOpQWpsLx924BrWwJXnE13aderaRf61LTzmInf
         Ea2xc4oiDXbr+bsVzSI0NVYXNqVNAkUZs9ayyEtYPOiImDCUhya6YPey+8VNlk0bqMK0
         YpTmv2wTiUkLdz2t4p+QFVahAN65H5rTkkDzTkZs6q/VThIlxEie+zVzsrzjrXsXBO7R
         uppjKciFgQMzzBszZ9f7RTU3unEaarxd7dzbmSd3wxRQVMiPHr1yHvQtSouWjjppvFNw
         pE+Kqi5x7YOjWlqcvPFTMMSOsF/wd3gXVzXVQnI9j87NBV7VumDbJfho8EokcptDwURY
         ipxA==
X-Gm-Message-State: ACrzQf0mz5rBaZJxmYMWiLhB2JXHDnq0zRoe80h1OEL/vWCREvR04Io/
	m6gZKe7qCmaYYAlzF5iJKv7NHw==
X-Google-Smtp-Source: AMsMyM52YL0PF2vNh5E7tahnQAFRD+OLthiw1kkejghI6qA48fc/GCG8EVYrv8On8s0i0Rknf3+eIQ==
X-Received: by 2002:a05:6000:810:b0:236:8a6d:e4e1 with SMTP id bt16-20020a056000081000b002368a6de4e1mr3404704wrb.661.1666803608369;
        Wed, 26 Oct 2022 10:00:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd65:7511:b73b:c094? ([2001:8b0:aba:5f3c:bd65:7511:b73b:c094])
        by smtp.gmail.com with ESMTPSA id k11-20020a056000004b00b0023657e1b97esm5924656wrx.11.2022.10.26.10.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 10:00:07 -0700 (PDT)
Message-ID: <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
Subject: Re: [PATCH 6/6] u-boot: Rework signing to remove interdependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Luca Ceresoli
	 <luca.ceresoli@bootlin.com>
Date: Wed, 26 Oct 2022 18:00:06 +0100
In-Reply-To: <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
	 <20221021233726.1751124-7-sean.anderson@seco.com>
	 <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
	 <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172164

On Wed, 2022-10-26 at 12:49 -0400, Sean Anderson wrote:
> On 10/26/22 10:08, Richard Purdie wrote:
> > This looks like a pretty nice improvement, I've been worried about how
> > entangled all this was becoming. Is there anything better we could do
> > with testing of this code? We rely increasingly on the tests to spot
> > regressions and I doubt the testcases we have cover the code
> > complexity.
>=20
> FWIW, I found the test suite to be fairly helpful when debugging this
> whole process, if agonizingly slow. I found many bugs in my initial
> implementation which were uncovered by the test suites,
>=20
> The best way to extend the test suite would probably be to have QEMU try
> to boot using the Linux and U-Boot. This would help cases where all the
> artifacts are created correctly but e.g. the wrong U-Boot is packaged.
> However, I am rather loathe to add more test cases like this, because it
> already takes around 10 minutes (with sstate!) to run the tests. This
> basically kills the speed of iterative development.

Out of interest how were you running the tests? Did you look at the
parallelism options? Were you just running specific tests or specific
suites of tests?

I do think we need something like you describe and adding a linux+uboot
approach is something I've wanted to do for a long time. Usually the
time is taken on our automated CI rather than impacting users, unless
they're working in that area at which point the tests are hopefully
helpful.

We haven't really had anyone try and optimise the tests either, I'm
sure there will be things in there which can help. Please don't let the
speed put you off trying to improve things and extend our coverage!

Cheers,

Richard




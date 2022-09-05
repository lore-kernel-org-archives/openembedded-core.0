Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBC8ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 11:54:02 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.23691.1662378840021655085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 04:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I/xM235Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id t7so5997944wrm.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 04:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=TPvJQtZtrvbjA6U+NxE/Xkj7AdZH4Cs6l+1eJUln+3g=;
        b=I/xM235QnyIDUJ82Lu6sdzoXpgktDTev6SRmN3lDSTXn4XMgXlvCrLL7b4hY52mvXp
         /SDac0Dvcr9/KFLSYVj3P/282+eg/f7oYYlCINLNuEISZ4+BCWlJBlRusy2nfB7BUEfd
         YCvLzE3mrimqKENiJ0ba5nPWi2NP9Ncaevqo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=TPvJQtZtrvbjA6U+NxE/Xkj7AdZH4Cs6l+1eJUln+3g=;
        b=KaOpeHrM15frVCwNFFteV7pMJ6vkpnp1A6ZW4VIWeXB5YMKHwJF1Hv1VLnrAXc3y1Q
         mn9dKn1eVs8cEIUOPWdwzZ7ZSkdKVXhvqLirEqO71riT1w7wvLnweiYfmLoVTNdPQyKc
         geCfmyW69s1D/syXWE1Ggg+e6oYeaX6joec5ned86HEqCYx3dgj6yNr4KCsXtJSFpb2m
         7toA4KJL9mbYkUVAm2fT/tXZcm1iocX8QNLPG/U0227R6OnmI7KLDPYt3beMI8qNcZVh
         AXqc1nkxe2qvCiiwihp7BumH5sVKkqHLHBaZV2JhW3tZC57Q3o0YnXDOYP5Kcq3GR8nM
         MRow==
X-Gm-Message-State: ACgBeo0O5uTGOJFLMsuEkW3ektk7y07uYR/3XoGBNBqHleih1Z0AJ25a
	QsBEGTL0s1wjsjevZV37ybxOxw==
X-Google-Smtp-Source: 
 AA6agR4F8DBkgVnk9gukN+AZnYAnes2PvSFycys+u2NXZj6l5EUibr7eqXo/Z7shs8q+KzFIUpZlyw==
X-Received: by 2002:a5d:6202:0:b0:226:d797:6e29 with SMTP id
 y2-20020a5d6202000000b00226d7976e29mr22270601wru.696.1662378838272;
        Mon, 05 Sep 2022 04:53:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9134:78de:7ad:e0e5?
 ([2001:8b0:aba:5f3c:9134:78de:7ad:e0e5])
        by smtp.gmail.com with ESMTPSA id
 x5-20020a5d6505000000b00228634628f1sm5004514wru.110.2022.09.05.04.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 04:53:57 -0700 (PDT)
Message-ID: 
 <c8062dc0c019bd8d09ef417d26cd7e83630baae4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: Fix for the linker
 issues caused by using the shell
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	openembedded-core@lists.openembedded.org, Randy MacLeod
	 <randy.macleod@windriver.com>
Date: Mon, 05 Sep 2022 12:53:56 +0100
In-Reply-To: <8827.1662361955840912678@lists.openembedded.org>
References: 
	<a4f110ea41a9653e8fe894fabc7bf5a180bca30f.camel@linuxfoundation.org>
	 <8827.1662361955840912678@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 11:54:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170312

On Mon, 2022-09-05 at 00:12 -0700, Sundeep KOKKONDA wrote:
> Using CC args causing linker error "unknown executable format" so I
> called linker directly.
> Also, I wrote my initial code without any hardcoded symbols and that
> test code works in my local machine but when the same code executed
> in Yocto build environment SIGSEGV faults are reported. And to debug
> the issue in Yocto build environment the printf/echo outputs are not
> shown in console/log file. So, I modified my code to check whether
> this solution works in AB machine or not.
>=20
> Can you let me know what is the error in AB machine
> with=C2=A0unsetenv("LD_LIBRARY_PATH"); ? Is it the same relocation error?

The issues would be due to the issues I mentioned in reply to your
patch on the mailing list. The fixed length string and number of
arguments issues.

In the interests of moving forward, I put the binary shim in front of
the shell script which can make the environment manipulations more
easily.

https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D7a1bfb2f800c=
00d3d2bea9e20e5d31d32f247129

The version of the code above seems to work, I ran some tests
specifically on ubuntu1804.

I added in some comments so we know in future why the code is doing
this.

I wondered if we could make that script MIT license rather than GPL-2.0
just to try and keep our licensing fractionally simpler?

Cheers,

Richard








Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8742CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 07:16:18 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.112359.1697440574035372346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 00:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kz7IiTC9;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507a62d4788so1977518e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 00:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697440572; x=1698045372; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DbPYbKLlJ5BiSO4wtuS6smxtQmGTNqq7d+35QDKzymY=;
        b=kz7IiTC9P3pIEyB6v9xyCAvGrk5AOzO7Mu7zlho20qHR5pzl16cufbtKwnoN8/8TOo
         qLpTBZ74rLrZr7+WqAsGnN+878EulHyla47boxiy1xsy3YoHR07dwQss2xPTQsFJ/RYm
         rj3t8ouwZYAAvw9WH9JBP4L8cM8uBxOLCYWAyjkLqUBu3FxzGdqoD6OIKxRvXjDSmJGe
         GXak08+7Hlqbfe8o2VhiVoVGtVtKMghse4nGwH6g+cxlfbftYiA4L34s7faOfG2pQLy1
         /v+TGCtk+ruOhPiPSZ7Axk8pKctQeiTifkxP5f9m/55ZXm50zMABn8+fBSIXzL79aktW
         PUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697440572; x=1698045372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbPYbKLlJ5BiSO4wtuS6smxtQmGTNqq7d+35QDKzymY=;
        b=HyVSSQILSkTjPJMGb1XNJa4U2v8x1lHZJzyGQeMyTA65YTE0IzZkuAiWTf9bDCLGXW
         RmAURaU0oiVqhznNdlfCpXCXpNmlhm4UrNCrWJJ6SG4Nsmbj5mv5M0M651a+eCU1RFn6
         D63jCJIb6ihoAU68RYuvle0aypKa/iyaR+T0XxIuMMYnt+p8x/adBtZ/HsxlJG2UJeqn
         SqiJCN4v7IP4FFBJLwFlHOzIAWFskszkjqZueul4+ribNavfDlpOiB+kWqLCJglUKmeG
         Rbe6DnaU5TTUDh6hdbTJpErXsWR3e59RR8Hl3uvyA0IswpD3fu0fxIsnluaR+8cM0BMR
         ZqRw==
X-Gm-Message-State: AOJu0Yxx3eHQ8qXVAYH3ClZdyJj/SL8V5GuSH13R50V49y9hha+RLRHJ
	+StngInZA4Cl2R7sBuz5/JlhwA==
X-Google-Smtp-Source: AGHT+IE0Ow54vtv7ZyDXScGFdC8M5BizsL6ucXJsyxMusg7/XktNiy+qr5BqVm3Svcuu2vdpacBUXQ==
X-Received: by 2002:a05:6512:48a:b0:507:984e:9f16 with SMTP id v10-20020a056512048a00b00507984e9f16mr6198600lfq.36.1697440572036;
        Mon, 16 Oct 2023 00:16:12 -0700 (PDT)
Received: from nuoska (dc7g6tyyyyyyyyyyyyhlt-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::193])
        by smtp.gmail.com with ESMTPSA id b10-20020ac2410a000000b004fe432108absm4444893lfi.182.2023.10.16.00.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 00:16:11 -0700 (PDT)
Date: Mon, 16 Oct 2023 10:16:06 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-serial@vger.kernel.org,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: Kernel 6.5 ttyS1 hang with qemu (was Re: [OE-core] Summary of
 the remaining 6.5 kernel serial issue (and 6.5 summary)
Message-ID: <ZSzjNgdCH_wmB4u2@nuoska>
References: <178BF2895FF685E6.5378@lists.openembedded.org>
 <a2ad67a0575548b6d5d8d187e597dcd72ae07f64.camel@linuxfoundation.org>
 <ZSPQY6UYg21Z0PnN@nuoska>
 <1520ecb5f4b6959af835a7781b94694913f76912.camel@linuxfoundation.org>
 <178DF50519C11C84.8679@lists.openembedded.org>
 <b208c9c6b72be4ef0f2aadb7bed103280bff60a0.camel@linuxfoundation.org>
 <2023101516-unmolded-otter-e3e0@gregkh>
 <214757eca7f4cd639a7a8d9a822476c1ec30f01c.camel@linuxfoundation.org>
 <20231016063501.GL27774@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016063501.GL27774@atomide.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 07:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189261

Hi,

On Mon, Oct 16, 2023 at 09:35:01AM +0300, Tony Lindgren wrote:
> * Richard Purdie <richard.purdie@linuxfoundation.org> [231015 21:30]:
> > On Sun, 2023-10-15 at 17:31 +0200, Greg Kroah-Hartman wrote:
> > > Can you try the patch below?  I just sent it to Linus and it's from Tony
> > > to resolve some other pm issues with the serial port code.
> > 
> > Thanks for the pointer to this. I've put it through some testing and
> > had one failure so far so I suspect this isn't enough unfortunately.
> >
> > FWIW I was looping the testing on the complete removal of the
> > conditions and didn't see any failures with that.
> 
> Care to clarify what's the failing test now?
> 
> Is the issue still the second port not always coming up after boot or
> something else?

Yes, data from the ttyS1 getty is not coming through from kernel and qemu to
the test framework looking for login prompt after qemu machine boot.
Workarounds like sending "\n\n" from the test framework through qemu to ttyS1
or "echo helloB > /dev/ttyS1" via working ttyS0 don't seem to help and wake
it up.

Cheers,

-Mikko


Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DAFEE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 13:28:27 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.11432.1692797304966823653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 06:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SwjbU10N;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-500913779f5so2386491e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692797303; x=1693402103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NKCFZPbQsCFqAYoKYwQfrZVUYahB1utsXedkolCSbp8=;
        b=SwjbU10N8tzf0ESIte56z23MhtysY4qOR61VExbvozBtvcTRzzSWANs+SVL+2YBoTO
         FfSPXzjVyMXuK1OQH/I4vM5QjM3Dl7J7UI1OQ0myrG3EgEF4BWUaaOPXJ49z6ZUl58Xz
         ROme3sZAFhWTycXQ9bop20Yq5WDUgC+fPAPZj41uE7gWnmcIKrfU04gYFEqaq8vEFPnb
         h49U1ulaeuYQePGFwwxk7DrYPgYQLnnu0WDz1jyX+oLrFtXf6QtmlqUaYWNqgLP5lI/W
         jcEG4VArK70CSKoiJrh/tz+6hbAfLXW7zWoDcVYTAFzwqXi0yFIM3FnlPlDupZ67PI8m
         yjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692797303; x=1693402103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKCFZPbQsCFqAYoKYwQfrZVUYahB1utsXedkolCSbp8=;
        b=P6GRe3T58p93mEyB+5HR3VmJ+GzhPbNNf/5JYHQSnnFSgAdlv7cIbljo9mtBXKmpXd
         5fqv/Lv8ghaKSxpc/CdqoaRhIske9F8KI9p5pvxVZ5rs1xms9aY3fnAV1gCvzFxLZ+Ws
         SJmob3Ajfx8BYf7yamB6gbsRAOVL7HMH6gVDkfKTKP9xFQd5IDS3LX3rgNailqQ+urLV
         QuWk+nf7JpVidcEnoJoQTEvsvd7Qk9FWnl+S13TKWm4d1I4zrF+IjsL1HX57dkCfIZap
         1mWP0twVlnIBk6f96woiAEjOlF/+SHJ6KYz+tfIKVwfSu5t1YDjY5+muhE5+9ffAkprn
         PUOg==
X-Gm-Message-State: AOJu0YwRaOml2uuK5MuQZkmNG3OGB5bjWD8m9MfIND9TGuUzvpEuUYCs
	aUP5pnh7KFoCK3QVp+HpOSjLzA==
X-Google-Smtp-Source: AGHT+IG4OB8ctZADGMkRDMn5y0Pm7b8Nly+UsZ5BpOMoZqxQ+BaAR5Of9WAdt0OVdQg0fqQ+8ptorw==
X-Received: by 2002:a05:6512:b94:b0:4ff:8c0f:a745 with SMTP id b20-20020a0565120b9400b004ff8c0fa745mr10658128lfv.54.1692797302404;
        Wed, 23 Aug 2023 06:28:22 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id x26-20020a19f61a000000b005008286c06bsm1338639lfe.91.2023.08.23.06.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 06:28:21 -0700 (PDT)
Date: Wed, 23 Aug 2023 16:28:19 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: openssh ptest banner failure (was Re: [OE-core] [PATCH v2 2/9]
 testimage.bbclass: detect slirp from TEST_RUNQEMUPARAMS )
Message-ID: <ZOYJc95AeCqqA2Kj@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
 <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
 <ZOW1tEl+PiOK09l/@nuoska>
 <44b46fe9ef454e80895ce2b0ecbdac1bea9784bb.camel@linuxfoundation.org>
 <ZOXVyxiqDDnjCp61@nuoska>
 <CANNYZj_q-DgNoGL6JLP+XQv-3+2QFomNTYeUY9WF8FcpfCXgNQ@mail.gmail.com>
 <177DFD85A9F91D1D.28529@lists.openembedded.org>
 <ZOYDPQgCfD8PyWmD@nuoska>
 <CANNYZj_q1Y=78wBmVp20Rb6166FvtvzYMyo8eoQQjoGGgHX3rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_q1Y=78wBmVp20Rb6166FvtvzYMyo8eoQQjoGGgHX3rA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 13:28:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186578

Hi,

On Wed, Aug 23, 2023 at 03:24:43PM +0200, Alexander Kanavin wrote:
> I've just seen this too. I think to trigger this you need to run the
> test via bitbake -c testimage rather than directly over console - the
> output is then piped over ssh, and something goes wrong due to the
> large volume of banner data perhaps? Would *really* appreciate if you
> can get to the bottom of it.

Ok, I'll try to have a look.

I also just found out that:

https://wiki.yoctoproject.org/wiki/Weekly_Status

-> https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT

-> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
   Reported: 	2023-08-02 14:32 UTC by Alexandre Belloni 

So it's a known issue.

Cheers,

-Mikko


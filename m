Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.5065.1596832007195249427
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 13:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cJFrsIjC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id r4so2759324wrx.9
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 13:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=YjM96UlNXcIBKAQWUIWJkyvcZdmLugOxGXI7GV5XgIw=;
        b=cJFrsIjCrXchlbkOrjlAeVU9khX+wOyrGrAWag2OlbToVfUlC/mdtxAppHFYQSl7OL
         aB0lPzPoNnl9XJhHIvVq7YMLJBa11ubxVh9FnA/WHLD/ygL/bh2vTEvj2zqOTvDIACDE
         VP5DhQieUxXP5Nx2hbHVFwZcbH4TRHElymw4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YjM96UlNXcIBKAQWUIWJkyvcZdmLugOxGXI7GV5XgIw=;
        b=P/kFhys/wsslciFQRj4dZmKuwzq2UweleNFU79XtTl2fkBn5+Lm8YG09sG/KIvyTad
         T9/XoC26EGzwEfbEHpAw42yx5gZ3j1DPyUvpiL21k4wqGA7lReAHI1zr55BY06IssbLK
         tbTmSjwp0R4rLCBkOChcHUu2nZppy1E9uBkIpnj0vPCNbJ2qCwdji/OaCymV+ax0au6p
         uPcAl4qXCTezNdSacrh3+bceWMncNzDF8veS0dHucwiUhnpS93xlKKghmYfDRFAC5mbB
         odrXPYKHnptdrpAa4nBKzJa+WETg6ELe4cLFXjjrLCD8np7HgRkvC2HYE9PEwYEu0MPN
         Q4PQ==
X-Gm-Message-State: AOAM5330zFjJzm0lvaDnQsdbF9ZdrQBSV2M21TuG+NvfzBhCZCL1echZ
	xuG/2Wh3CVjlxfMv46JGs1PFwiQ2p9N2aA==
X-Google-Smtp-Source: ABdhPJywcC/6KkDJNrx1z4Har0BqSSQDqXWq/vBzjvBw4ou7HXVCRK0aGLQEO5UG3BzxZGsRIiFoKA==
X-Received: by 2002:adf:81c5:: with SMTP id 63mr14023966wra.185.1596832005747;
        Fri, 07 Aug 2020 13:26:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f98f:bfec:7aa3:2ba9])
        by smtp.gmail.com with ESMTPSA id o3sm11620573wru.64.2020.08.07.13.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 13:26:45 -0700 (PDT)
Message-ID: <6bdcb00e1d96b010e8154ef5b41eba6383050a12.camel@linuxfoundation.org>
Subject: Re: [OE-core] environment-setup.d usage in SDKs and eSDK
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Cc: Jens Rehsack <rehsack@gmail.com>
Date: Fri, 07 Aug 2020 21:26:43 +0100
In-Reply-To: <1629056739E54D82.5649@lists.openembedded.org>
References: <1629056739E54D82.5649@lists.openembedded.org>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-07 at 16:17 +0100, Richard Purdie via lists.openembedded.org wrote:
> I've just spent far too long staring at this so I'm going to write down
> what I found out. I may as well share it publicly.
> 
> An eSDK can be used like a normal SDK with an environment file that can
> be sourced. The challenge is that an eSDK contains native binaries
> rather than the nativesdk variants in the SDK.
> 
> This means that where an SDK has nativesdk environment.d files, an eSDK
> ends up using "native" environment.d files which are not used in any
> other context.
> 
> Some recipes like cmake implement both. Some others like icecc or
> openssl only have nativesdk variants. This probably needs cleaning up
> to be consistent.
> 
> It gets worse when you find that buildtools is included in eSDK and its
> environment file is sourced. This means you get a mix of nativesdk and
> native. If you set OECORE_NATIVE_SYSROOT in buildtools, it corrupts the
> eSDK's variable of the same name. This why buildtools has a hardcoded
> list of variables it puts in the enrivonment rather than using
> environment.d.
> 
> It would be better if the two sets of environment files (native and
> nativesdk) referenced different variables as currently the two can't
> coexist. This also really needs to be fixed.

I have figured out a way to at least fix this last bit so we can
convert buildtools over to using the environment files too. Patches
sent out separately.

Cheers,

Richard


Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.1435.1611873886908195151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 14:44:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BXee4rqe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id m2so5511150wmm.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 14:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6oMSJ2Zbk73JKgOW/vdEDi4NtjYBWu9qiinQGRehvOE=;
        b=BXee4rqeR1EVK7G9iWSC1vUKlDydDJuc3D6ikK7fJOcWKjxNLbrSLJ92cm39q8psNF
         6EONsdF4INfPOw40eM1cDqUFC7spIax2EU7YwYy61ULjvB8gbToTS7QuBt0cyvbl2qCQ
         lzQbp5iiWsbVUw0XTtHsJJp+BMNdSWUJUlXlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6oMSJ2Zbk73JKgOW/vdEDi4NtjYBWu9qiinQGRehvOE=;
        b=PLxxJetx7X/7a5DKkWqnAODKTzEVjp3sYwzeL03O6u4e9k6DLAF0RwlP6jpXdX5s2t
         GZUux44096LsIpKlnDgv/Oz1kpERe0NZ1zdGnlXr3FBr+afQOW0/Lg64T6h/FptPi1/d
         ph4X0KhZzhzhyXlR+OzAIASlPmHcs5LIVhb7OTyl81N7EHGtoqKekD3QZY+gt3AJiFp0
         VieB7yJxPUofSzTTA0ITnSvNfFzfBE8/PVbxE9H1LJKvNA8jjdBGFB7q/KMZkLBs5Xvx
         dEJYbX4f50snaYIw5bA/zu3co2NOksRdPteYVsBANO1xuSjKO2MdR+7YomoAkMMAWq9C
         fPoQ==
X-Gm-Message-State: AOAM530nldnhJgUdrh52rSZnfomvbuT/RbLwzSTZW1/ajMO5t/mcFC4R
	Ut7Uv0aXCKtVHEO03tPXCD9nKQ==
X-Google-Smtp-Source: ABdhPJwwNG6H4SYv3D3g5ikqD9XpPyr4uIt9BDq4VSyP6FV27kio0f2AbHWIibzo4Y8XS+n2NFc5KQ==
X-Received: by 2002:a1c:98c3:: with SMTP id a186mr1171577wme.147.1611873885184;
        Thu, 28 Jan 2021 14:44:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:93ef:509c:4f16:14ff? ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id n9sm9040007wrq.41.2021.01.28.14.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 14:44:44 -0800 (PST)
Message-ID: <4af03c39ce342ee647d8932bb1ac4f2f4cf6c2fc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 4/4] shaderc: fix the build with glslang 11.1.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jose Quaresma
	 <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jan 2021 22:44:43 +0000
In-Reply-To: <20210128223834.GA2544418@piout.net>
References: <20210124180758.1610301-1-quaresma.jose@gmail.com>
	 <20210124180758.1610301-4-quaresma.jose@gmail.com>
	 <20210128223834.GA2544418@piout.net>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-28 at 23:38 +0100, Alexandre Belloni wrote:
> Hello Jose,
> 
> On 24/01/2021 18:07:58+0000, Jose Quaresma wrote:
> > Drop patches:
> >     * 0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
> >       is rejected upstream and is not need when glslang as shared libs.
> > 
> > Update pacthes:
> >     * 0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
> >       renamed and refreshed from 0003-cmake-de-vendor-libs-and-disable-git-versioning.patch.
> > 
> 
> It seems there is still a linking issue when building shaderc-native.
> The full log is available here:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2978/steps/11/logs/stdio

I have a suspicion this happens on Ubuntu 18.04 systems since I've seen
issues like this locally with 18.04's binutils version and OE generated
vulkan-samples binaries, I think Joshua Watt reported the same issue
too with 18.04.

Not sure what we can do about it, can we disable the debug symbol types
causing problems in that -native recipe?

Cheers,

Richard


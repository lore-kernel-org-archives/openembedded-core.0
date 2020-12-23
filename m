Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.2751.1608761168282887734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 14:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OawOGGhZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id g185so154969wmf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 14:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qtH5xoUY/8s2Ueg9DRjg89B3I8pUYvVPH2AIcHxBX4o=;
        b=OawOGGhZTmLanUScP/vxyZQFmM7opzIHGs0M+FDSB5r/C6XBaPN5W33adWtCaZo0uK
         n38aAYMpZR/8Iq+Cx5RkRpPFtcy7RdObH5OO6K/t9TgMtS7ANDqF0Yj3U3uHhRnto/C4
         +HAtwJ2rft/mAsWwT/EO/AZbpnXNAKnVfxksI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qtH5xoUY/8s2Ueg9DRjg89B3I8pUYvVPH2AIcHxBX4o=;
        b=mrb7+vIXKrCL200kDOttJ4lPlCPeORHT/gyZJA2RBI+AMheYaICxDfhHpdcCjBUTLJ
         mHVX7HKaCBMwGFmsywo4vjaZ8CRUdjTXdIdj79CBglcdW3W1rtkTCR/NYQRn2D1pQQ/W
         xcbGas0W7hTVvSpXcMY+Pafnk2Dq8Yw0qG04Yqdt+G3WoQrwvkY2V1XEfVDWj7kpt/6a
         08XH4raerWrbzn2rIlHLWePNDAS5rhYVdjDsSD4IgazYFxTxCGbtaoOZp6WRu7vaO+Vs
         crjh2QFiSHwV/S6WqpZOQZw4WVG7fJLebW6hp7ZFIbOSyeTd2MdvzefN9Gdbk02GUqE/
         atzQ==
X-Gm-Message-State: AOAM532bFn5tbvBjP6KX4cbuBanhQf/I0bRkldx3lAFxZ8ccA2+mkJz0
	cZIAuAgp9nBcFtxh4S/BhBdn8g==
X-Google-Smtp-Source: ABdhPJxDlzLR5MaCSQ0+4v0m0I5O+KSkpv2z3LSQYcs6p+AaZSRvXmh9TvXx7k9tjeO48qfLOF4eiw==
X-Received: by 2002:a05:600c:2255:: with SMTP id a21mr1568119wmm.122.1608761166749;
        Wed, 23 Dec 2020 14:06:06 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.7.9.f.e.b.4.7.3.0.6.1.b.d.b.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.7.9.f.e.b.4.7.3.0.6.1.b.d.b.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8bdb:1603:74be:f976])
        by smtp.gmail.com with ESMTPSA id o8sm36278528wrm.17.2020.12.23.14.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 14:06:06 -0800 (PST)
Message-ID: <4a7f64f4a7a6e458974fd411b68a1075ba7204a7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master-next][PATCH 2/3] psplash: work on first boot (sysvinit)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2020 22:06:05 +0000
In-Reply-To: <20201223215005.GA9542@localhost>
References: <20201223170621.35727-1-twoerner@gmail.com>
	 <20201223170621.35727-2-twoerner@gmail.com>
	 <743d9e91ea6fb99193e315f8b20778e418109da7.camel@linuxfoundation.org>
	 <20201223215005.GA9542@localhost>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-12-23 at 16:50 -0500, Trevor Woerner wrote:
> On Wed 2020-12-23 @ 06:00:21 PM, Richard Purdie wrote:
> > Personally, I don't really like the idea of having a top level
> > directory called .psplash,
> 
> Neither do I, which is why I also added the code to remove the
> directory once
> the psplash program is done running. Whenever psplash is run the
> directory is
> created just before it starts and removed when psplash is done.
> 
> > is there a reason it doesn't work in /mnt?
> 
> This all works fine (without any changes) on the qemuX machines, but
> on a real device (e.g. rpi) when the image is booted for the first
> time everything is mounted, initially, RO, when using sysvinit. At
> the end of the first boot, and for every subsequent boot, the
> filesystem is R/W, so everything works on
> subsequent boots.

Right, but why can't psplash create /mnt/.psplash? Why do we need / and
not /mnt ?

Cheers,

Richard


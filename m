Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.2941.1596017600328005987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 03:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TlkOFhKB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id y3so21072046wrl.4
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 03:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=OdnUMJnr+priA9FmGU7gXAFCW5DDAaXrZG2vMS9jFn0=;
        b=TlkOFhKBbvtAHP37kFY3glRMCdGCxIsJNm+d0p4KvkTbOLrSI6ODpVjIytUOQc+y07
         hC+b6g7FpqkVtdlgjZdemXlQqvIqh5bXz0V4Zu2As05apjfqXyJHv6Q31oW/BWHym0cX
         frJuu/3VSJZ0Rxc5NV3Ge0dBdjgWwK5Q1YpOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OdnUMJnr+priA9FmGU7gXAFCW5DDAaXrZG2vMS9jFn0=;
        b=Hk8zzzrSPAWJf9vXy9BBZhC1MgiBb1hwj76mYVBrWM/AtvUQU8ddasugBkHNwhw39r
         Dpf/awzPb1cAVOglTO2XSIPFueVc/Lip8oaP7KFgQ/LT0ESvDNF8pnGQskcZnp5u9a+Z
         5TxAUYYbBtIHsFoBW/wLEWvUl8EGP/lCWlMUI0jWTFWYtP9NyJecmZ8heNv56Va+LDTV
         SOtT/5vv0hsYtbzceq+ETkMbAAHqlRKgg5F8N1AqQT7eyglYTg57uvElmXsZK8bDeI1t
         RlEx/4DsPWZ77c8t8pRH/exNhOGM3cWoKb/BkSj5mK8iJ4vuI6m+9X21a+arcYoq1iS0
         8nmA==
X-Gm-Message-State: AOAM532RBX7+I5RW9ZfG7nisqotqYBgpM/9/3yoI9QMFpRj24Rbr9UvB
	AhJ8lf66dB4VkKnTX7dL3V8tAA==
X-Google-Smtp-Source: ABdhPJw1QkfLdL6yFdV4sWte7vBbfNSPXIIZZXBNOt3V9331D/IWMfgGwZKg34UvXOC7tcuKQ9nr6A==
X-Received: by 2002:adf:b1ca:: with SMTP id r10mr31241705wra.150.1596017598672;
        Wed, 29 Jul 2020 03:13:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:20af:3d2:ab93:e15b])
        by smtp.gmail.com with ESMTPSA id 62sm4634463wrq.31.2020.07.29.03.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:13:15 -0700 (PDT)
Message-ID: <e3b4f4fd4a29514b30cd8f170d5a518acff0fa02.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemumips: Use 34Kf CPU emulation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 29 Jul 2020 11:13:12 +0100
In-Reply-To: <162630A032FCBA1C.9067@lists.openembedded.org>
References: <20200729022852.1792061-1-raj.khem@gmail.com>
	 <162630A032FCBA1C.9067@lists.openembedded.org>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-29 at 10:56 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2020-07-28 at 19:28 -0700, Khem Raj wrote:
> > Few years ago we switched to using mips32r2 tunings for qemumips
> > however
> > the default CPU emulation still remained 24Kf which is not optimal
> > for
> > mips32r2 ISA for qemu [1], therefore switch to recommended 32Kf for
> > CPU
> > emulation when running qemu in system mode
> > 
> > Boot time to console is ~1s faster with this setting, hopefully
> > this
> > should speed up qemumips in general
> > 
> > [1] 
> > https://www.qemu.org/docs/master/system/target-mips.html#preferred-cpu-models-for-mips-hosts
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/machine/qemumips.conf | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/conf/machine/qemumips.conf
> > b/meta/conf/machine/qemumips.conf
> > index 31ad754483..4617c3c7b6 100644
> > --- a/meta/conf/machine/qemumips.conf
> > +++ b/meta/conf/machine/qemumips.conf
> > @@ -12,3 +12,5 @@ KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
> >  SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
> >  
> >  QB_SYSTEM_NAME = "qemu-system-mips"
> > +
> > +QB_CPU = "-cpu 34Kf"
> 
> Thanks!
> 
> I did run some tests locally, timing core-image-sato -c testimage
> before and after this change. It took 999s before, 1018s after but
> the difference looks like noise rather than any speedup or slowdown.

Another try at "after" got 986s so who knows :)

Cheers,

Richard


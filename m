Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.2773.1596016582069902645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 02:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c5ARbqwg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id c80so2160146wme.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 02:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=sZdSZY8lN8pfb44vdTdCvrMtyfLspgr+QMHpeVDkcrE=;
        b=c5ARbqwgXiYuuIES0eHavESGXmFMA5Sj46NAa5CS0dpAPbNyltz2v63XwKWgndBSBm
         i1vTfoqiie+Cqyut9TUnKy3mbQhFSmvRQY7frMIYeRB4ToPq1ITvwdO2Tqdw/zcJNTEQ
         1Fqxsw1aZ2D89z52O6YQGhWELvG79LIX8XyMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sZdSZY8lN8pfb44vdTdCvrMtyfLspgr+QMHpeVDkcrE=;
        b=bZ4wXKDUOQriDjIEd982AgSZ6oudp0qypyYqQDVX2OpBOaNDp6pnau/9QxSM9rkGFF
         DUMQCyeORrvaCWGMmQlGtb2tBE4lmHtGDxzT3ZP/94IWwfXHdkJ0ZcWPhlZNi0HZS0Gv
         TK8afZvxGOGQyF1QI5IB/UYbzx+K4yvv2P0/T4U8HAhNh8fYGwM8s6lHt6GTJ7JSD9he
         0hSw/olU9e34q3fmrEMmjNqQLOFoPS/HsAHpCXHIsYV3Gd5ColK/89OPOUfZaajzH1tS
         hQztK+WF/XOHJC+coTWmERXGKlMGjDWoVPjfQuGIp5Z9BeevwPuAkBOykDQ/zsLhl5Ed
         KVMg==
X-Gm-Message-State: AOAM531lVHdnJExncrK9PBomSLU6E1lKOgPGwkurEZbS3wrquypO2yzT
	ffaYN8JXCEDBPzy8nhFu27Bxrg==
X-Google-Smtp-Source: ABdhPJwdor2LRjzF8BLtp4nTrt1+XrGvFY0fCh8T8LfTtF7gBr2Abtma4JByFZXbBjYbSEzUfbTDcw==
X-Received: by 2002:a1c:ed05:: with SMTP id l5mr8088125wmh.68.1596016580550;
        Wed, 29 Jul 2020 02:56:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:20af:3d2:ab93:e15b])
        by smtp.gmail.com with ESMTPSA id t25sm3643350wmj.18.2020.07.29.02.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 02:56:16 -0700 (PDT)
Message-ID: <227aa8701444b9568576b7edda84cc136dc587c2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemumips: Use 34Kf CPU emulation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 29 Jul 2020 10:56:15 +0100
In-Reply-To: <20200729022852.1792061-1-raj.khem@gmail.com>
References: <20200729022852.1792061-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-07-28 at 19:28 -0700, Khem Raj wrote:
> Few years ago we switched to using mips32r2 tunings for qemumips however
> the default CPU emulation still remained 24Kf which is not optimal for
> mips32r2 ISA for qemu [1], therefore switch to recommended 32Kf for CPU
> emulation when running qemu in system mode
> 
> Boot time to console is ~1s faster with this setting, hopefully this
> should speed up qemumips in general
> 
> [1] https://www.qemu.org/docs/master/system/target-mips.html#preferred-cpu-models-for-mips-hosts
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/qemumips.conf | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
> index 31ad754483..4617c3c7b6 100644
> --- a/meta/conf/machine/qemumips.conf
> +++ b/meta/conf/machine/qemumips.conf
> @@ -12,3 +12,5 @@ KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
>  SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
>  
>  QB_SYSTEM_NAME = "qemu-system-mips"
> +
> +QB_CPU = "-cpu 34Kf"

Thanks!

I did run some tests locally, timing core-image-sato -c testimage
before and after this change. It took 999s before, 1018s after but the
difference looks like noise rather than any speedup or slowdown.

Its certainly worth a try to see if it helps the intermittent failures
though.

Cheers,

Richard


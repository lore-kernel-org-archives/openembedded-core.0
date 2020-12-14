Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.34168.1607953121033648543
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 05:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TO/gAWPM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id m5so16426849wrx.9
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 05:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=u/43Nmb+kIvZTNTmm3Z2EmOGr7iv3Sk/7npgr5NkVo0=;
        b=TO/gAWPM09iwgCcl12t5bMQi0tcmKQfNxMgctPGcTafOYL/GFHgIA8LJx2K5jlapCL
         c7+a6S0QQdCfkHMj2uHeYq1ynHyhCMqq0BdSssG0oymRwbOnS0D3bzMmeFfdirIrtIMn
         DlkDNtpZJTsw5rlt0e9E8nvNgte90RvNRyFGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=u/43Nmb+kIvZTNTmm3Z2EmOGr7iv3Sk/7npgr5NkVo0=;
        b=D4MR6Ml6yzNdkuQvtx5UCY42GIszKOgBcRlE9iR8wffpAPrqckR7xZi3xetB79FGZM
         FsTTgd29QHTvMFBF4BNZbUM36Nz5nvaayofuf/GhmTXPGqrNBm3Tgyn9UfnsInQNoLoW
         0MzKjxyB89PwR8nCL+L7tWc+RQfF9EHi8fxR7wuRBzO6ApA9ivE2ucp6vyJMFbuQaTXH
         1d2sHvGGmhP8YgncOs801JYuU8Iv5WOHpD7i9CvZSQhj/XD4oYQEo3YmuoQoBVP5IwFL
         oM1O6OIvNV0kidSdogFRMpUxyzxTHv7ugcEQruzQ/I1wLvMM6t2Ix5+8EX4gVX04hp+N
         ruSw==
X-Gm-Message-State: AOAM532ThAqMRKvvn4ER5l1mDoviB/Cys6KfUX+iMEd9ijPVjdHJwTuz
	/yOgoK5ye41F6KDqAWaHvcRXGw==
X-Google-Smtp-Source: ABdhPJyFzTUiBFVgILc7RY+eLGzpHhTYITL14EX177lvmEa53+lO4BKVqGC1VUX337f4GPXn6g6Zlw==
X-Received: by 2002:adf:8b15:: with SMTP id n21mr28536493wra.426.1607953119717;
        Mon, 14 Dec 2020 05:38:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id h5sm33922646wrp.56.2020.12.14.05.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 05:38:39 -0800 (PST)
Message-ID: <005e33e150decf8db347a58325a6fd4446acdb6c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] syslinux: rewrite recipe so only target code is x86-specific
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alejandro Hernandez <alhe@linux.microsoft.com>
Date: Mon, 14 Dec 2020 13:38:38 +0000
In-Reply-To: <20201210150211.1505531-1-ross.burton@arm.com>
References: <20201210150211.1505531-1-ross.burton@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-10 at 15:02 +0000, Ross Burton wrote:
> Currently the syslinux recipe set COMPATIBLE_HOST to 32/64-bit x86.
> Whilst this makes sense for the target binaries as syslinux is
> x86-specific, this also affects the native recipe which should be able
> to be built on non-x86 build hosts (for example, arm64 build host,
> qemux86 target).
> 
> syslinux itself has a somewhat fragile build system but with care it is
> possible to build the installer for native/nativesdk, and the bootloader
> for target.  Despite claims the documentation to the contrary, not all
> of the bootloader is shipped precompiled in the tarball which does
> complicate matters.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../syslinux/syslinux_6.04-pre2.bb            | 80 ++++++++++---------
>  1 file changed, 43 insertions(+), 37 deletions(-)

Something isn't quite right in this series:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1654/steps/14/logs/stdio

(and all the other selftests in that build)

Cheers,

Richard



Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.6138.1587935254230749556
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 14:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MFMxzkQc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id g13so18194804wrb.8
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 14:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cGnw9kiEGFH4UHlbC9E7lq6Kep74V/WOltJe3rEL23Q=;
        b=MFMxzkQciNKzhxYW40Xp+pSDBCf7WHs7s9nZxk8jsvYF86mVlhod4r5hnKh0s4jCbU
         WR8JuJJLPps2zfIrmd4ljB/9Qk/NjI+wqt0nfmePVtf5o7mjFxwJ5RmC+IkXWqBOhqGg
         KHrIeMGi+R0k10ue/CyNsS5P0ZWMEw3iDrQXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cGnw9kiEGFH4UHlbC9E7lq6Kep74V/WOltJe3rEL23Q=;
        b=mC1iiDEcYMkLkshoouDDTnyjhltA6U+K7vYC1CA5bgmGbTLdk8UJNT35IW4enOtiUL
         qymDtf2MvpMVZ/F2S96EZrrGc1M57LdPkryJRtBTjTxBPMxNLmjrE9iEg34pCoCfodQx
         KiA3OjL683iKSullpBpFi2r0Wc5QecVPy4+HgayFPXYpV3uykacppTr2JHb7St/U6U0d
         wSg+vLbu/56X+ZbUKKJTzfRnqbU0MmSnxtHVShccA9hujoBGLgLapJclJTUApVKBQfi+
         1j0pbh0X8JS9g9fQX/VI/WkZjmInlT1KYL8AOsNkQCoNvCgu80EFXZ4UCJ2NdZzC3vDJ
         LJTA==
X-Gm-Message-State: AGi0Pubt5Rj5lV8i50soXicG5b5+7jH/fFyP+IvFBeWHVhWzKkMRSIe6
	tLTPMU58QuaW67uxMmaKZLTyXg==
X-Google-Smtp-Source: APiQypIxKApyVb6K9R9bul9Tb4W58Fib7okTTvrX4XAobrc66a2Fa1JEuVAf93VzWtfZGpvYPgsL8g==
X-Received: by 2002:adf:94a6:: with SMTP id 35mr23269046wrr.420.1587935252577;
        Sun, 26 Apr 2020 14:07:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a187sm12916747wmh.40.2020.04.26.14.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 14:07:31 -0700 (PDT)
Message-ID: <a2ee87b585ad797813c6985218ae0e3ea360597e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/15] rpm: upgrade to 4.15.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Apr 2020 22:07:30 +0100
In-Reply-To: <CANNYZj9MJiBPZE+-MYLVAe2nfR5rwCsE9fONwXM5omfT4Y1sWQ@mail.gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
	 <9121b61b00747df8d326b422d2bb34258dd6665c.camel@linuxfoundation.org>
	 <160972188EAFC253.2907@lists.openembedded.org>
	 <CANNYZj9MJiBPZE+-MYLVAe2nfR5rwCsE9fONwXM5omfT4Y1sWQ@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-04-26 at 22:40 +0200, Alexander Kanavin wrote:
> I started looking into it, but quickly found that all or almost all
> the failures are all due to the rpm upgrade, and the failures all
> happen on three old distros: centos 7, debian 8, ubuntu 16.04.

I did notice there was a reproducibility issue with libinput too but
that is a useful pattern to have for the rpm issues.

> What is particularly odd is that the centos/debian failures are non-
> deterministic: in some cases rpm-native fails to build due to missing
> omp.h, in other cases it builds, but the resulting binaries segfault.
> This non-determinism seems to happen even on the same worker, e.g.:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1812
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/2073
> (one is failing in do_compile, another compiles fine, but then
> produces segfaults)

I think what may happen is that sstate may become populated and then
builds proceed further than they did previously.

> Ubuntu always segfaults, but maybe it's just coincidental.
> 
> I am not sure how to take this further, but maybe the best course of
> action is to defer the rpm/dnf update once more, until those old
> distros are finally retired. 

We are aiming to support these using buildtools tarball which should
already be active on centos7/debian8 (but not ubuntu1604) so I'm a
little worried this may point to a problem with the buildtools tarball
:(

Unfortunately I think we need to get to the bottom of it. One
possibility which I'm wondering about is ehther its possible that some
binary is not being relocated by uninative but most are and that could
be causing some of the issues. That is just a wild guess though.

Cheers,

Richard


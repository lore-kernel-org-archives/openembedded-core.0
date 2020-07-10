Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.4655.1594412489881271508
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 13:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TyR4zs1Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id a6so9181340wmm.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 13:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=l+gnqamC1KeClSDsunaaz/h1uRKGn8dtF3Nibf4zwu8=;
        b=TyR4zs1QH4N+hfn0t3AD8M6pZnY29E8dPOPWuscL8UfAPt6l8OWsJUcLyID7GE6YRZ
         93z1O6s312aAwCpFftXFv+1zzLrk+bxHEtJu3ifElKqzwMmis9rNIWCPR3p5M+xb7Jcw
         ovy2e1U77ZD5Ah7m3E49UzSyBqHNsOvuRi0LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=l+gnqamC1KeClSDsunaaz/h1uRKGn8dtF3Nibf4zwu8=;
        b=hHdGzhKp0OVsBoX4LANg/l+YL+PppEoalfWasVfIqTa3QbsAaOBOXwqNS5DjUvyFlN
         iTbP+rvhZI+vlONLuiEmVlufGYM800bSt8IzrilOZewNwTX761vaCLCIOEOMvP1IjyUN
         jO0SVP/Au4hTaWDdAwin6vAhg0b62eKqqwqKIou7QHGlpr8HLgwA/DgjOP+6x564Gipn
         f5cUvYg0YTH8DJXcO/GaE6mIrHeLdz8ap5UDtWwEtiKbqE/J8lEGsWrymg7C7aYef0jm
         /X1s+3+6ZVW+i8P5QXTIj1H9vKT/F1Dy62310vLe4j/MJyEmx7+ejYvD4yDSrf3g9D7m
         kuYw==
X-Gm-Message-State: AOAM532YSF6cA0UpPjo/RxwXpKou0PVfILjigU2Lkwf0FWZ7QURNoLC3
	+qvaU5GSy6/Shw3PHtXKoXw/8g==
X-Google-Smtp-Source: ABdhPJwzf5KpY97ENhlWp5QQWbwxjomLQsxwaelIMv898n9qQw3PAfqGRgqPv4xcEvJepNtJSGSM5A==
X-Received: by 2002:a1c:a589:: with SMTP id o131mr6372935wme.12.1594412488330;
        Fri, 10 Jul 2020 13:21:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id n5sm10578758wmi.34.2020.07.10.13.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 13:21:27 -0700 (PDT)
Message-ID: <3d63c868f4e94dee8c7ee05a3afa0f0620f98a15.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssl: add rdcpu to rand-seed
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: takondra@cisco.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, xe-linux-external@cisco.com, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2020 21:21:26 +0100
In-Reply-To: <20200710193957.1969769-1-takondra@cisco.com>
References: <20200710193957.1969769-1-takondra@cisco.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-10 at 12:39 -0700, Taras Kondratiuk via lists.openembedded.org wrote:
> Native[sdk] openssl fails to initialize RNG on systems where native[sdk]
> glibc is built against pre-3.17 linux-libc-headers, but runs on 4.8+
> kernel:
> 140737348333184:error:2406C06E:random number generator:RAND_DRBG_instantiate:error retrieving entropy:../openssl-1.1.1g/crypto/rand/drbg_lib.c:342
> 
> Commit 3ff98f558157 ("Start up DEVRANDOM entropy improvement for older
> Linux devices.") in OpenSSL 1.1.1d has effectively disabled devrandom
> seed source for kernels >=4.8. The assumption is that getrandom(2) will
> be used instead. Getrandom syscall was added in kernel 3.17 by commit
> c6e9d6f38894 ("random: introduce getrandom(2) system call"). So on a
> system with 4.8+ kernel and pre-3.17 libc headers both getrandom and
> devrandom can't be used.

Where would we find a system where we're building with pre-3.17 libc
headers?

We updated to 3.17 in 2014:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=be50d1dc1c03b709e60d2493df5890f7556852b7

If I remember correctly this change was added to avoid problems with
different host OSes and I'm worried we'd see those issues return if we
change things like this. Whilst the syscall may have been added quite
early, the glibc wrappers for it are quite recent and where our source
of problems was.

Khem's concerns about this being x86 only also worry me.

Cheers,

Richard
> 


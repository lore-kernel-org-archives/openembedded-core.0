Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.1882.1601418075456803149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 15:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IBmGeY5B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id v12so6431505wmh.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 15:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=mUKFvWfo+PUVL7VYaorFc5b71mPjO4G7R4zq7qOLODc=;
        b=IBmGeY5BzCPueUKJP8VYOjURpIYVPfx2NCu+hQaMcU2BtbK6QqoqENpY6/KUo8o2mJ
         PQU9oRXJl/s5oFnFXnxiDTNEKXHKKh5XZG1hyfWql07ulqaJecZvEjK3M7xNKnyIC8Yo
         JbOrqQt03nwPgO4Dt6d1c1fMbX5UdWpKuqg9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mUKFvWfo+PUVL7VYaorFc5b71mPjO4G7R4zq7qOLODc=;
        b=YCcXVqFftiPyZSpgkb0CR2lkqIUBy70o/90tsW4HvXcTXomRrW07J8hOKsMNmkkijB
         VYhmaXHTBjqLuEFoSgDYhccJgreoGe62P6YmtcxlEAa9Ig3gEbj+UjwpHfQfwL77AY9E
         SvGT+hWmMOvcyUrdltKXwtw75HbmN4rFZ8aoBN1q6NiO5ZrdwIoKBAA34xOIPjYtcyPh
         nlknMeWfe2toXf5dtCUX/3moOOI5DMwQo1FJwGVMosn02mqVc/D+gJ4bjn6AV0yP7/Ig
         z6kBcE1fQaz9tdEsDghNh//sFdPlmW5wsKe87G5y8A6OD/UxHcPdWvN+sp20q4ezmjcu
         tlTw==
X-Gm-Message-State: AOAM533RMZxdOSxRYeBR/kQbhcIbIjCqVjKHlqF1+3rdSaV4MAnrjpLo
	l1pBRoelfC1CZTrsnTqLRt/N/A==
X-Google-Smtp-Source: ABdhPJzdScDWgtdkrANaQ0cerUuH5uLLmBGkQKHI4fZy8ouGBciJeXE4fzPhl7CoyjCExwONUyfX6g==
X-Received: by 2002:a1c:3588:: with SMTP id c130mr6583365wma.94.1601418073795;
        Tue, 29 Sep 2020 15:21:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9c3e:7322:3204:3cf7])
        by smtp.gmail.com with ESMTPSA id m12sm6877060wml.38.2020.09.29.15.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:21:13 -0700 (PDT)
Message-ID: <b4990a266f48396e83a13279b3c557e9d8b8d3bc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] bjam-native: don't do debug builds
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2020 23:21:10 +0100
In-Reply-To: <20200929221638.2114178-1-ross.burton@arm.com>
References: <20200929221638.2114178-1-ross.burton@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-29 at 23:16 +0100, Ross Burton wrote:
> Previously this recipe was changed to do debug builds because
> otherwise insane
> warns that the binary is already stripped.
> 
> However, debug builds for boost.build also pass -O0.  It turns out
> that given
> how large Boost is (or, how bad boost.build is) doing a release build
> with -O3
> knocks a third off the walltime for a Boost package in my test,
> mainly by reducing
> how long it spends deciding that nothing needs to be rebuilt in
> do_install:
> 
>   PKG      TASK        ABSDIFF  RELDIFF  WALLTIME1 -> WALLTIME2
>   boost    do_install  -330.7s   -69.2%     477.6s -> 146.9s
>   boost    do_compile    -7.1s    -2.7%     269.3s -> 262.2s
> 
> Replace debug mode with INSANE_SKIP=already-stripped.

This isn't so simple unfortunately. If the binaries are stripped, we
can't do the debug symbols processing, the src packages are empty and
so on, it has knock on repercussions. 

Can we stop the -O0 in debug builds somehow?

Cheers,

Richard


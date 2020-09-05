Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.18624.1599315183829639707
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2020 07:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Uq8AFgey;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id a17so10190254wrn.6
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2020 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=fZej2OP/XU+eLGcFn0mt1KLcYKHpjkU09arn4SZSjwg=;
        b=Uq8AFgeyBHQbX+Lz2+/2zbEEDzfas/2aEMYp5RdTVfDSlyodGfCBXaWSkqae/1dhXt
         jPD9OIbuQSYZ+ZynUFRrIudnKnDEkbmUpmuSRxi1wmTWX2HWg+/I7y35Ca8yKdyNSYan
         0l1R2hWxH3fBQwXGOOURbkpW5eYEF1GUUpn3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fZej2OP/XU+eLGcFn0mt1KLcYKHpjkU09arn4SZSjwg=;
        b=s3GWoZ+EI6N8c2gRn3fG3n/yehzeCX5/YjoZXc7Bpo169BIEbuZh1K3XXsW5ef4bdX
         2zCExnOhVzamtrgFGGxEHLCo1Nav/unR1tbhcMXI2zyUgQftdG7aJ3TAlco+bPN+UdyR
         eLn+8wrU5XkQzK02Nc/ESCNmfVHLV9u+QK442BgFReWI5kqwgf9lprGhpAnkNl//7lry
         SWkXwj3WTR+iPyd2rkBi8rMQqRBf68lrlDH6alRvs76tMtNprHQnXbPxhwQLj8wEd6Ww
         ERX2QYYNK4v3yVqUudP4xr/YBKRXZOiH56wR4aKbsmz8WeeLXXzY8+Wxw2XUxorv2Bwo
         KU+A==
X-Gm-Message-State: AOAM533mUnGrfoviSt/05dmj81/wctJ60nrNXtGBTA1XgkmQSqY8pEQB
	1YYD/wq69mv2StyP7EMyxiEUe5ekkPWoLQ==
X-Google-Smtp-Source: ABdhPJyRLs/EqnYR9YOBecWywDSDj9n2A4tQVRdDNCKRlDXuxWf6CI6Bo6awTPEjbtKkBkunB/D7zQ==
X-Received: by 2002:a05:6000:1282:: with SMTP id f2mr13482089wrx.251.1599315182041;
        Sat, 05 Sep 2020 07:13:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7cb6:1620:605:fdfd])
        by smtp.gmail.com with ESMTPSA id 188sm37408798wmz.2.2020.09.05.07.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 07:13:01 -0700 (PDT)
Message-ID: <3abff8aeaf22c72f1afa5597c497b413f988b909.camel@linuxfoundation.org>
Subject: Re: [yocto-infrastructure] Autobuilder qemu process nice/ionice levels
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	yocto-infrastructure <yocto-infrastructure@lists.yoctoproject.org>
Cc: Michael Halstead <mhalstead@linuxfoundation.org>, "MacLeod, Randy
	(Wind River)" <randy.macleod@windriver.com>
Date: Sat, 05 Sep 2020 15:12:57 +0100
In-Reply-To: <1631E2D733A062C6.10958@lists.yoctoproject.org>
References: <1631E2D733A062C6.10958@lists.yoctoproject.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-09-05 at 13:25 +0100, Richard Purdie via lists.yoctoproject.org wrote:
> 
> I have a new proposal. I think we should install a file onto the
> autobuilder workers as ~/runqemu-renice and on that, run "sudo setcap
> 'cap_sys_nice=eip'". We then add in some code to runqemu such that if
> this file exists, it runs it as "runqemu-renice <runqemu pid>".
> 
> This file will renice/ionice the specified process to -10 nice and
> 1/be
> ionice, probably as a python script.
> 
> It should be simple, minimally invasive, backportable, as secure as
> it
> can be and hopefully not too much trouble for Michael to setup.

I decided to test the idea. We can't use a script since the
capabilities would have to be set on the interpreter so I wrote the
'renice' program in C. I've put that into autobuilder-helper:

http://git.yoctoproject.org/cgit.cgi/yocto-autobuilder-helper/tree/scripts/runqemu-renice.c

I also put a runqemu patch into -next which allows this to be used.

Michael: To enable on the autobuilders it should be a case of copying in
that script (or using a copy from the helper repos which are already
present), then:

gcc runqemu-renice.c -o ~/runqemu-renice
sudo setcap 'cap_sys_nice=ep' ~/runqemu-renice

Cheers,

Richard


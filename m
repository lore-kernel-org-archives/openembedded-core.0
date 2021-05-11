Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.10566.1620727187757628482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 02:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LmOfEmjL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id v12so19476623wrq.6
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 02:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zlOZ4BCCKW1iCc33nGzN2r6d0ykWztgLb6ByBfg+/Pk=;
        b=LmOfEmjL6ilp34MZPdENe1xK+Uoca45BNwRIv5wqlelYpQRGUYrFXu6Z9hYHhYqlwM
         MWxtMNZwMcTvRgWnrAgNfX7f2m59hNKhygiO84TCYwPXsrt8v+iJDOpYOX5XlPYlYguN
         WAocAMC9C195zTONKtJ3WhKthzkRHZhKrr22k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zlOZ4BCCKW1iCc33nGzN2r6d0ykWztgLb6ByBfg+/Pk=;
        b=UvwwPGM/oFWtIcnEIiyPIqNAhIoozbWcT+Oo14gCsgqNVtlWfG4UmrE1u/swXbZ7ht
         TdcYYrEEx6JqhjuYcWFRttXOWB6LMuq/+U7PP+hEkf/RNdY/xIB7WQ4YoxL38V2PRXSu
         DGBvquAJUEda0nx2tv62gbbz+T7gzGp0Q9cWaskCr5QIE3yW+4hLQQ70AkcMHZz0ewTo
         Abcy/I0boMqppXxzDEPuApr//bJQVY9r5xg6EUMNqhBMzeM90qiazmrNRB56Py/JNC50
         vq6xNKwyKX0KA69jVezyBXkrvFcC5eF8hd3R1dQuw4gNP2UrEI1NMmG4G3tNO6IxAt7E
         18CQ==
X-Gm-Message-State: AOAM5311ENchxo27RFXm+c2oZkIycYYu0Dv6PqUzpacPKl59LCZ0Vhm4
	Qn7p7jqZij7NkpzN5jXjmYU1BQ==
X-Google-Smtp-Source: ABdhPJzROOn1uJIXiuVdPuyJnw3sCLjFHgGcxJWNK0TgM4jul5e1sOxq4slsh/8bWs5Uqr1i4tBxOg==
X-Received: by 2002:a05:6000:1a41:: with SMTP id t1mr36585216wry.265.1620727186301;
        Tue, 11 May 2021 02:59:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:29c0:3873:464b:b647? ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id p5sm22660969wma.45.2021.05.11.02.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 02:59:46 -0700 (PDT)
Message-ID: <82398336819fe90e1645fb2176037e28b11eb360.camel@linuxfoundation.org>
Subject: Re: [OE-core] QEMU rcu stalls on autobuilder - not what they seem?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Cc: Tim Orling <timothy.t.orling@linux.intel.com>, "Mittal, Anuj"
	 <anuj.mittal@intel.com>, Randy MacLeod <randy.macleod@windriver.com>
Date: Tue, 11 May 2021 10:59:44 +0100
In-Reply-To: <167DF913750C3E0E.1178@lists.openembedded.org>
References: <167DF913750C3E0E.1178@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-05-11 at 10:28 +0100, Richard Purdie via lists.openembedded.org wrote:
> We have patches in master-next where we test enabling SMP for x86 and arm.
> This has resulted in a few build failures where qemu crashes with an RCU 
> stall. The SMP output is different to our non-SMP case. For ages we've
> been blaming the autobuilder load/contention. The SMP case does appear to
> have it happen more regularly but it was happening before.
> 
> As an example, this morning I awoke to:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2123/steps/14/logs/stdio
> 
> and I've pasted the full boot log below. It is easy to blame the autobuilder
> load as usual but I'd note that the kernel messages stop after about 1s after
> the tsc clocksource message.
> 
> I'd argue that the RCU stall message is just pointing out the kernel is mostly
> dead, its also interesting the RCU stall handler crashes before it can print
> the process traces.
> 
> I read that the tsc clocksource message hang is notorious as it is where the
> kernel starts initing other subsystems so the issue may not be in the tsc 
> clocksource but elsewhere. I'd also note it is using the kvm-clocksource and just
> inited the tsc clocksource, it isn't using it. The TSC clocksource appears to be
> know it init slowly.
> 
> I think we may have some other kernel issue going on here and blaming the 
> autobuilder load isn't the right path forward. Is there anyone who understands
> what may be going on here or a way we could debug it further?

To follow up, some qemu literate friends looked at this and asked why on
earth we were using a machine type from 1996 and why such an old cpu which didn't
support SMP and had a broken TSC. I think those are good questions. The current 
options we're using aren't tested by others. They also suggested some qemu boot
options which if nothing else could speed things up.

It is time we changed the x86 qemu types so I've put a patch into master-next
for testing moving to IvyBridge and the cpu options. I think these are changes
we should be making anyway but I'd be very happy if the help the AB-INT issues
which have been plaguing us.

Cheers,

Richard



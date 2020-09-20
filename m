Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.19411.1600609376358789711
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2020 06:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Btx9MrBt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id z1so10083085wrt.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2020 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=DX9ejDxFYPrK4LUm42raSzVraaA7OO8jFN7SY990drc=;
        b=Btx9MrBtTjIpONPbpc/xpuzIQf8dreiqzqInQpR8mr9wQXpljQuwuXgSxUc/ZxyIrx
         /feaQ3cTTzq5FKOPSeVZOBx7S0gxHz7sIe7J8Yd8PhjRfZGcpEkz8JoqSGudGWoYHprJ
         jpEFfFKJ4ghEe0yJ42HrTHdUxRk3/H2DE2hZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DX9ejDxFYPrK4LUm42raSzVraaA7OO8jFN7SY990drc=;
        b=iaZVbPTPzlHZaskyV3t7qiaWcFWL0y55TLxRp8SH0SVB0uoRhmESyFluOzprf4NJkL
         WepzDFPNrbOd28+DyLW+qXjopM48bgyrg0Lq+N/+DuPe3XychGxn2IWZGntDEftJghV2
         DjnF1BQPIfVTtB2hTBLG8B3veP1RiA3+Zlw2VUmoSYMtjIyFIdoLnhmnrqGIWlx8iz7Z
         EmM0IlRvdG1y2otbwOjXR5yjF8cjS/cpt1kuRrOHWtlDWZWAYTJ6m65+xAEofDSmXIH7
         epC5k/9nwvvN8wEG1/4pwyEZO9EutkSx8lPBm0qelvK6gAypfvDRhRfJOB1LxrRYBQ36
         kPEg==
X-Gm-Message-State: AOAM532nIXEcwhuFLw5iPQzBC2UMwVeHajD/xGIMyjUH/3K6XPSy071V
	HYNKZGMzF6nu6s/NSSKL9aJGlw==
X-Google-Smtp-Source: ABdhPJxgU6FE+iFf5tOQ138adzQcITf2hqLr1s5sphF5lU/1vS4ZyddYOA/Kf95Oc2jN1pVTAqNw+A==
X-Received: by 2002:adf:fcd2:: with SMTP id f18mr47157272wrs.78.1600609374700;
        Sun, 20 Sep 2020 06:42:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.1.a.4.b.6.6.4.7.f.7.9.a.9.8.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.1.a.4.b.6.6.4.7.f.7.9.a.9.8.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c89a:97f7:466b:4a17])
        by smtp.gmail.com with ESMTPSA id q12sm14958550wrs.48.2020.09.20.06.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 06:42:53 -0700 (PDT)
Message-ID: <190055f95ca61297ef4c524d0c15578457d46703.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: Disable support for shadow group
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 20 Sep 2020 14:42:50 +0100
In-Reply-To: <20200919001608.1241434-1-raj.khem@gmail.com>
References: <20200919001608.1241434-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-18 at 17:16 -0700, Khem Raj wrote:
> enabling shadow drags sshd key generation service into boot path and
> serial console launch over getty gets delayed until ssh key
> generation
> is done, on slowers platforms eg. non-kvm qemu this can take minutes
> to
> get ssh keys service to finish on first boot.
> 
> On qemumips
> 56.963s sshdgenkeys.service
> 
> Disabling shadow, pulls this out of boot chain, and ssh keys are
> still
> generated but this time it will happen when ssh'ing first time into
> the
> machine.
> 
> [YOCTO #13646]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_246.2.bb | 1 -
>  1 file changed, 1 deletion(-)

I tested this locally and disabling gshadow didn't seem to affect the
qemumips serial login time. That matches the fact we didn't see it
blocking on ssh keygen in the traces :/.

Cheers,

Richard


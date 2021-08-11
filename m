Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.12435.1628710841622222163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 12:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H+zes7hr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id k38-20020a05600c1ca6b029025af5e0f38bso5229560wms.5
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QXsKFoen9ezwap+s5+3fTaS+LzyDPbDfdHS0DdtR//o=;
        b=H+zes7hryzWqeyyxvHOp5EYgrcq61MfzZF89kzHT2rFX9VOQnB5MJ2yrOU5PH9WJjT
         8ld6bq8BGseuce2LyqcL+I9xdugKZmtE95gjVTPj074BOIr6iFq+EqM965Lavfi3VmSm
         WRtJwC5JDZbr1y/hYqEcJdAMaFtqsgAoTsVLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QXsKFoen9ezwap+s5+3fTaS+LzyDPbDfdHS0DdtR//o=;
        b=o0xw0NNU6GKpT+ogJiLY8sAhBDvFQcMtWXmREHr/f/s0xalPsr4C6YK/fAA91TGB6o
         ZzpfykgSlcX2drRuWujkklXJz/0KHQub3otkZD8s5dmH59JE8wkJ31wCBFRhTb8Z2Xug
         c18S+eu+iR62a9JUniouXzA2LxXKP87ioJKo5enUCeO0PUD3xNYQ2gixTVp71Oc+wr6x
         E41pMBv0j0OLDf5yQbvoUS3yA/qsDWsiGnlOHJRhFBxIZHU0yvrvH3M5VC9xAnZsvFAo
         z9p+zoRdiSqDvqxgzaVqmzEEFYs9oHZJDKvK19BL9pyN97YFXWAfMCTcoUlHphL/t6ye
         jIMw==
X-Gm-Message-State: AOAM530QB+pDsUFbEVGrRGPVlJ+FDyc+X/SRLn0HBissmKmwzhRoHSFf
	I2ZZoaoIPGPe1lT9Vauz03Cmzw==
X-Google-Smtp-Source: ABdhPJx3H8WlEC98Z99yiA82J85al6dSaHXSK1Pc1WtqLS/2XE6qFbNYPZ4N9MKF8JyLnqKOoMPouw==
X-Received: by 2002:a1c:2904:: with SMTP id p4mr182902wmp.178.1628710840010;
        Wed, 11 Aug 2021 12:40:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4282:face:6a07:1a9d? ([2001:8b0:aba:5f3c:4282:face:6a07:1a9d])
        by smtp.gmail.com with ESMTPSA id h9sm101863wmb.35.2021.08.11.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 12:40:39 -0700 (PDT)
Message-ID: <55b8a86a8662b7221aeddc0da5c3589afd62f9d6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/5] sstate.bbclass: disable thread lock if we don't have events
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 11 Aug 2021 20:40:38 +0100
In-Reply-To: <20210809094853.3619155-4-quaresma.jose@gmail.com>
References: <20210809094853.3619155-1-quaresma.jose@gmail.com>
	 <20210809094853.3619155-4-quaresma.jose@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-08-09 at 10:48 +0100, Jose Quaresma wrote:
> commit f2053844958325496a9387874a8f3182400b71ca
> 'classes/sstate.bbclass: Enable thread lock when checkstatus'
> adds a thread lock to don't lose the events from multiple threads
> that runs on the ThreadPool.
> 
> commit 1444b8a2ae226829e719d3d184fca27e5940ae0d
> 'sstate.bbclass: Only show sstate mirror progress bar for >= 100 objects'
> disable the events if we don't have a minium number of objects.
> 
> So we can only use the thread lock when we have the events in place.
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 63085a7f3a..948779386d 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -969,17 +969,17 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>              if len(tasklist) >= min_tasks:
>                  msg = "Checking sstate mirror object availability"
>                  bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
> +                bb.event.enable_threadlock()
>  
> 
> 
> 
> -            bb.event.enable_threadlock()
>              pool = oe.utils.ThreadedPool(nproc, len(tasklist),
>                      worker_init=checkstatus_init, worker_end=checkstatus_end)
>              for t in tasklist:
>                  pool.add_task(checkstatus, t)
>              pool.start()
>              pool.wait_completion()
> -            bb.event.disable_threadlock()
>  
> 
> 
> 
>              if len(tasklist) >= min_tasks:
> +                bb.event.disable_threadlock()
>                  bb.event.fire(bb.event.ProcessFinished(msg), d)
>  
> 

This patch series somehow breaks the build in weird ways, typically:

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/3789

i.e. the sdk-update from an eSDK somehow fails to get sstate objects from the 
network. Michael and I spent hours trying to figure out what was breaking
things and whether this was an infrastructure issue with sstate or not :(.

I dropped this series and builds look much happier. I think this patch
isn't correct as the threadlock isn't guarding against just progress
events, it guards against any events from threads. There are debug messages
in the code which turn into events too. As such, when threads are in use, 
the lock is needed.

I therefore suspect it is this change that breaks things in weird ways
but I haven't confirmed that.

Cheers,

Richard


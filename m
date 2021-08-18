Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.59620.1629315241438905637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 12:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eGMYuGr5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id q10so5237668wro.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 12:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=RJLCFUKOjy4eU2IkZeGQFSlN3ankvXdhgERr8MoqZd4=;
        b=eGMYuGr5e420rwH8Yccheh+jYnq8WGfiLsrKaGh2MLgbmIehDodOrDOnjxTk76AiSn
         BCdSmnXujsGcSCbRKd9KxyW1Fvmwn+VWZI53+mnex46r7ORqv0IawZnsu2Sbji+VHCad
         1ioIKfXsv7KPugFdH4dfB2c/fNufVTUp18ujc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RJLCFUKOjy4eU2IkZeGQFSlN3ankvXdhgERr8MoqZd4=;
        b=jG1LoI36eWALFKLSCUUeR1eAYuiYm3vqDBYmQTtQpNhGV2/TJ3Fs28nOWONkjrHzZ+
         IV/4eN65BIQK3vH21X5bA+7xMdbC0GCgW3Epnyl4bh2C0Ksn32/YPBRlasz2WiBHNy0p
         IWWqN+FO5vycPCjJBfomYCB8JT409mYFjNNDCVghU3ygWMSgvpi24dfB+FO3yHe/H4oY
         kNB83ruBPz4DlA4ek0P8LOF57T+1OA13j8FaFZqhLGP6v8rwyIKJl2uR/3sMmVfWbD0V
         0ZQps+tXqdDaKFlyg01l0G5e+RFYmrt9ytlXILY5tCUpAvKcoGZ7HW+UClReaM3X/sB/
         ElwA==
X-Gm-Message-State: AOAM531SbrWn45a44f/8wzqei5WT0AStIX3IkynicKvpVL+dbPF73/vi
	XSEc/+LfDb41g8D30MDVaMEa8A==
X-Google-Smtp-Source: ABdhPJzcgtsrpMOh2nRm1TO2XwOMqgPioG8XM6MME3ImIGhuBZNILjwaBpuIOsAI8Plg/Re2CRRo/g==
X-Received: by 2002:adf:f6ca:: with SMTP id y10mr12831556wrp.218.1629315239859;
        Wed, 18 Aug 2021 12:33:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2c5b:67f4:375e:5ae2? ([2001:8b0:aba:5f3c:2c5b:67f4:375e:5ae2])
        by smtp.gmail.com with ESMTPSA id o8sm3680003wmq.21.2021.08.18.12.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 12:33:59 -0700 (PDT)
Message-ID: <20aae4083e94dc9706e83c5ecdd95348c710b4bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 3/4] sstate.bbclass: get the number of threads from BB_NUMBER_THREADS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 18 Aug 2021 20:33:58 +0100
In-Reply-To: <20210818162404.130067-3-quaresma.jose@gmail.com>
References: <20210818162404.130067-1-quaresma.jose@gmail.com>
	 <20210818162404.130067-3-quaresma.jose@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-18 at 17:24 +0100, Jose Quaresma wrote:
> - bitbake BB_NUMBER_THREADS uses cpu_count from oe utils that uses
> the python os.sched_getaffinity and it is more acurrate.
> 
>  grep -nH ^BB_NUMBER_THREADS meta/conf/bitbake.conf
>  meta/conf/bitbake.conf:806:BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
> 
> - multiprocessing.cpu_count() returns the number of CPUs on the host,
> not the number of usable CPUs on the host. If the user is using
> scheduler affinity then the number of usable CPUs may be less,
> so when determining how many cores we can use check the affinity instead.
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index c3c145e7f3..bc14b5e264 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -964,13 +964,12 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>              tasklist.append((tid, sstatefile))
>  
> 
> 
> 
>          if tasklist:
> +            nproc = min(d.getVar("BB_NUMBER_THREADS"), len(tasklist))
> +
>              if len(tasklist) >= min_tasks:
>                  msg = "Checking sstate mirror object availability"
>                  bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
>  
> 
> 
> 
> -            import multiprocessing
> -            nproc = min(multiprocessing.cpu_count(), len(tasklist))
> -
>              bb.event.enable_threadlock()
>              pool = oe.utils.ThreadedPool(nproc, len(tasklist),
>                      worker_init=checkstatus_init, worker_end=checkstatus_end)


https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/3825/steps/17/logs/stdio

Cheers,

Richard



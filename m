Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8993AC6370D
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.23170.1650146273377317707
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 14:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ShUbQJWp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id g18so14445782wrb.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 14:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=wuce2aPy5ExOYoXzRHStt1v/QNY7EN4XkMvP9mrOh+s=;
        b=ShUbQJWpOBGb3tQzhq6ZZH9b2ZhDJzt58g887q+bcDh3Dl4uOYXEeApvVE15PN/qDu
         eOB4z7b6Rfz1IVnfRJf0Emhi7dAkm9CwTpmHSGvid9Yy4IECAhTtw7w4ZNN2+QZpcH6y
         4+tcaQfY4R7AtgHySecVtm1spicB2Na01aP/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wuce2aPy5ExOYoXzRHStt1v/QNY7EN4XkMvP9mrOh+s=;
        b=qSw9eCAuiEDnrItK68iJRk4j5QPEo8oMR6Hcgh8Af9Od5Ot2WY8KW36CLuhES/0Pp7
         8PLEzsMimFPT2gY1XCtNZTrKAh9Iv21EDWPWQrRallklpuSigu5uEdKYVyVp7oQKjggr
         rJFMAIyg70LAl0Nqf+qSpomxDvpoHJUfUhEEtd077SyHmpG/2WG5mmwrcoWJ2JgEhQdb
         fOYhucdwmi6cJjbcqVa3Rs+aBCllmjgRiY8gawDzbwWC1xw2UoLHqjRyxp2f+eGnKqcP
         fBE5UBqmHiJ9RaDRvMnuQGfbfozw2IIHouNghoxwCTUZ+dDbUTYoUgYRC0Kk1wYFdf1G
         1dQQ==
X-Gm-Message-State: AOAM531tQq+rCujGZ05O2NMKk6irAVDbXaNmr+gb4On/kwbOZy0bpQgx
	RUMVM1Uzk4azmwhkc1cNiFYcYw==
X-Google-Smtp-Source: 
 ABdhPJwXQmadMU4FuiaU2dWz0iVklKmzazRRa8JYUFtwJRuz7DaGjLqDXcNktMVqxEn8KXRKs3oAQQ==
X-Received: by 2002:a5d:4523:0:b0:207:a6fc:32eb with SMTP id
 j3-20020a5d4523000000b00207a6fc32ebmr3614832wra.275.1650146271681;
        Sat, 16 Apr 2022 14:57:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af33:9195:2d77:ff68?
 ([2001:8b0:aba:5f3c:af33:9195:2d77:ff68])
        by smtp.gmail.com with ESMTPSA id
 e9-20020a5d6d09000000b002087d2dca52sm7702302wrq.24.2022.04.16.14.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 14:57:51 -0700 (PDT)
Message-ID: 
 <3040f0d6eaabad9a0ec2632e49336af0ff189533.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH 1/2] sstate: use the python3
 ThreadPoolExecutor instead of the OE ThreadedPool
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 16 Apr 2022 22:57:47 +0100
In-Reply-To: <20220416202401.179351-1-quaresma.jose@gmail.com>
References: <20220416202401.179351-1-quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164561

On Sat, 2022-04-16 at 21:24 +0100, Jose Quaresma wrote:
> for the FetchConnectionCache use a queue where each thread can
> get an unsed connection_cache that is properly initialized before
> we fireup the ThreadPoolExecutor.
> 
> for the progress bar we need an adictional task counter
> that is protected with thread lock as it runs inside the
> ThreadPoolExecutor.
> 
> Fixes [YOCTO #14775] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 44 +++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 16 deletions(-)

Are there specific issues you see with oe.utils.ThreadedPool that this change
addresses? Were you able to reproduce the issue in 14775?

I'm a little concerned we swap one implementation where we know roughly what the
issues are for another where we dont :/.

I notice that ThreadPoolExecutor can take an initializer but you're doing this
using the queue instead. Is that because you suspect some issue with those being
setup in the separate threads?

You also mentioned the debug messages not showing. That suggests something is
wrong with the event handlers in the new threading model and that errors
wouldn't propagate either so we need to check into that.

This is definitely an interesting idea but I'm nervous about it :/.

Cheers,

Richard



> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 1c0cae4893..0ede078770 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -977,15 +977,22 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>              localdata.delVar('BB_NO_NETWORK')
>  
>          from bb.fetch2 import FetchConnectionCache
> -        def checkstatus_init(thread_worker):
> -            thread_worker.connection_cache = FetchConnectionCache()
> -
> -        def checkstatus_end(thread_worker):
> -            thread_worker.connection_cache.close_connections()
> -
> -        def checkstatus(thread_worker, arg):
> +        def checkstatus_init():
> +            while not connection_cache_pool.full():
> +                connection_cache_pool.put(FetchConnectionCache())
> +
> +        def checkstatus_end():
> +            while not connection_cache_pool.empty():
> +                connection_cache = connection_cache_pool.get()
> +                connection_cache.close_connections()
> +
> +        import threading
> +        _lock = threading.Lock()
> +        def checkstatus(arg):
>              (tid, sstatefile) = arg
>  
> +            connection_cache = connection_cache_pool.get()
> +
>              localdata2 = bb.data.createCopy(localdata)
>              srcuri = "file://" + sstatefile
>              localdata2.setVar('SRC_URI', srcuri)
> @@ -995,7 +1002,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>  
>              try:
>                  fetcher = bb.fetch2.Fetch(srcuri.split(), localdata2,
> -                            connection_cache=thread_worker.connection_cache)
> +                            connection_cache=connection_cache)
>                  fetcher.checkstatus()
>                  bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
>                  found.add(tid)
> @@ -1005,8 +1012,12 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>              except Exception as e:
>                  bb.error("SState: cannot test %s: %s\n%s" % (srcuri, repr(e), traceback.format_exc()))
>  
> +            connection_cache_pool.put(connection_cache)
> +
>              if progress:
> -                bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
> +                with _lock:
> +                    tasks -= 1
> +                bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - tasks), d)
>  
>          tasklist = []
>          for tid in missed:
> @@ -1016,6 +1027,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>          if tasklist:
>              nproc = min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))
>  
> +            tasks = len(tasklist)
>              progress = len(tasklist) >= 100
>              if progress:
>                  msg = "Checking sstate mirror object availability"
> @@ -1025,13 +1037,13 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>              fetcherenv = bb.fetch2.get_fetcher_environment(d)
>              with bb.utils.environment(**fetcherenv):
>                  bb.event.enable_threadlock()
> -                pool = oe.utils.ThreadedPool(nproc, len(tasklist),
> -                        worker_init=checkstatus_init, worker_end=checkstatus_end,
> -                        name="sstate_checkhashes-")
> -                for t in tasklist:
> -                    pool.add_task(checkstatus, t)
> -                pool.start()
> -                pool.wait_completion()
> +                import concurrent.futures
> +                from queue import Queue
> +                connection_cache_pool = Queue(nproc)
> +                checkstatus_init()
> +                with concurrent.futures.ThreadPoolExecutor(max_workers=nproc) as executor:
> +                    executor.map(checkstatus, tasklist)
> +                checkstatus_end()
>                  bb.event.disable_threadlock()
>  
>              if progress:
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164558): https://lists.openembedded.org/g/openembedded-core/message/164558
> Mute This Topic: https://lists.openembedded.org/mt/90512350/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [richard.purdie@linuxfoundation.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 




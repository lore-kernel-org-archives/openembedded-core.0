Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.9148.1632048139012031695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Sep 2021 03:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c9T/pAv3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id y198-20020a1c7dcf000000b0030b69a49fe9so1450190wmc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Sep 2021 03:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=hSf8LNgP0flnC0DR9kmMp7R8uE+OSGIN9kis3Ieq3c8=;
        b=c9T/pAv3PQm3Svg4F1R3UVJv4OYu05AvrQisLSQnsm0LI2yEb12We+Cy55Ijh9tVr4
         C4XFxBJLcd0KnkF7wRdXqmr0VgU03tzT4H2f891gfiL9NEQVTyC6+4VEEvMawvd/ar54
         BesWjXH0aWcyufPJHj/isDcZgnVCah2jeFhWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hSf8LNgP0flnC0DR9kmMp7R8uE+OSGIN9kis3Ieq3c8=;
        b=Wc3IJnJI82qp8Ys9xAX5DBYJ6Fpgl8qctEhw9fA7aQ1AuxDvfRzqNNYkkWupYJeSDv
         VQiHU+VmE9+TPz5P/u12TqNdRlsAXYsteMF7X6RLXqiP7VfsRPlgkPcG7u4J3BEhHRdM
         HY6RmYCYwFAeZyBQQcJiFnDpPKUu5pqIQWQqqmvlxPbRkso9a+cexhY4xE5iSsBhBN4D
         ab5zNuPRezqKo0oypCUkRViQiUbaj2ZM59TRfX1a9qkBFVDm7tJpbZCAFhJogubhmLPq
         pBw2rhZSFg6jB2Y/TDOtjyx3DRLZPzs3fHdm1X/1DxOvQQMZv9/xwKdANY+FRjL09zex
         Wz5g==
X-Gm-Message-State: AOAM531cfaivfms0lFVfAIk7fwDuSbNn+V0UxAfeZWK2xXFtruXr5u3U
	ni33Y5TdsPozAze5gX0h7xhNag==
X-Google-Smtp-Source: ABdhPJw6FaP6qkHU5ntg9NXibg5M3NWCPyKYQ8buVZVa2Hx+kptW1DAXRpuYAjk6BuN6yEFDa/hjMA==
X-Received: by 2002:a1c:9a8e:: with SMTP id c136mr24461359wme.191.1632048137523;
        Sun, 19 Sep 2021 03:42:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f583:326e:a3bb:7da1? ([2001:8b0:aba:5f3c:f583:326e:a3bb:7da1])
        by smtp.gmail.com with ESMTPSA id y9sm19083844wmj.36.2021.09.19.03.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 03:42:17 -0700 (PDT)
Message-ID: <5d13249a5165d1417d50cdb78f153524afde66fe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] testimage: copy the task log and qemu console log to tmp/log/oeqa
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Sun, 19 Sep 2021 11:42:16 +0100
In-Reply-To: <20210917125922.2435721-3-alex@linutronix.de>
References: <20210917125922.2435721-1-alex@linutronix.de>
	 <20210917125922.2435721-3-alex@linutronix.de>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-09-17 at 14:59 +0200, Alexander Kanavin wrote:
> This makes it easier for the AB scripts (particularly, collect-results)
> to access and archive these items, as they can contain useful information
> when ptests or other qemu tests fail.
> 
> [YOCTO #14518]
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/testimage.bbclass | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index 3c689aec913..305e26d24d6 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -201,6 +201,7 @@ def testimage_main(d):
>      import json
>      import signal
>      import logging
> +    import shutil
>  
>      from bb.utils import export_proxies
>      from oeqa.core.utils.misc import updateTestData
> @@ -408,10 +409,17 @@ def testimage_main(d):
>                          get_testimage_result_id(configuration),
>                          dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
>          results.logSummary(pn)
> +
> +    # Copy additional logs to tmp/log/oeqa so it's easier to find them
> +    targetdir = os.path.join(get_testimage_json_result_dir(d), d.getVar("PN"))
> +    os.makedirs(targetdir, exist_ok=True)
> +    shutil.copy(bootlog, targetdir)
> +    shutil.copy(d.getVar("BB_LOGFILE"), targetdir)
> +
>      if not results or not complete:
> -        bb.fatal('%s - FAILED - tests were interrupted during execution' % pn, forcelog=True)
> +        bb.fatal('%s - FAILED - tests were interrupted during execution, check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
>      if not results.wasSuccessful():
> -        bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, forcelog=True)
> +        bb.fatal('%s - FAILED - also check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
>  
>  def get_runtime_paths(d):
>      """

I'm a little torn on this too as I dislike copies of files in multiple places.
Part of me wonders if we should move the files to this location at generation
instead. That would break any existing users though and make it less obvious
when looking at WORKDIR for a given failure and I think having WORKDIR remain as
the place for a given task's execution is important for user expectations.
Symlinking them may be the lesser of several issues. Perhaps they should really
be in ${T} (in WORKDIR) too.

I did wonder about moving and standardising on tmp/log for more logfiles a while
back but came down against as it would undermine the usefulness and user
expectations of WORKDIR.

So symlinking here may be the best option?

Cheers,

Richard


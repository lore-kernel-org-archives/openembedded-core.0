Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.11612.1619789691080898091
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 06:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JuW6wpjF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so796152wmh.4
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 06:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=AA2BlxRMcSoltdMjSUA2pOgMbt1/qlEs0fd6PgAYgGY=;
        b=JuW6wpjF/0gLl68orFSkf3NG9EO6MoHOAehfM3aggrzhT0GhWTgpro83ho6bUHYNag
         ZimSiTotFRwh+biC8GGqZHxjbFqpsyabz7ActKIvIjQyMkzBG417WTAteuJbKMyooycM
         BryBpKuYrrH9UJJ9kefVmjlFj9sVLNu2Zr3Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AA2BlxRMcSoltdMjSUA2pOgMbt1/qlEs0fd6PgAYgGY=;
        b=Ztj4job9maaxU7Algm115Raif5M0VAdHy6cVBnCvarbvsqevQNc1i+6C+/CWTE+i98
         9JoGspmnZLd2hacBWxoDUcRjUwql6lkW1AfMYo4HuKQlKh5iywCxWeCaz4PusF/ujcNi
         /HzBZcgrHmP/nezVa6lNnZ8TzrTnNhFYROUkuNsOoS3qwFWW19rSU+B5eqWQffg9E2kv
         SS5QTb1p7FRun0StUHgnUVSVHIVFiDvG8l4kPHDnRCXIctejmR32fy3aMcZ4jZr1EMAa
         mR7+BwKDppm2vKoMXdimjp/ArP2Z69OiPmtZGGs93Q5ZShXOrDhP/bQN8e0WDSEZq0kE
         x5qQ==
X-Gm-Message-State: AOAM533FH3p7/xd19BwjGYBQBKqjZh7GpyVoKDzVa72OLx6R6rY10okb
	E/G6MoiCLkOxWByJcYE7nZIAEA==
X-Google-Smtp-Source: ABdhPJwB9XF6elkB9pfG79ssZsj0vRFNkLjfoWgccfvSDAtUzNakgWhiO+HwoLoLOxzDcb/aXOGZKQ==
X-Received: by 2002:a1c:720d:: with SMTP id n13mr15898120wmc.89.1619789689313;
        Fri, 30 Apr 2021 06:34:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:38ed:4baa:ed1c:e489? ([2001:8b0:aba:5f3c:38ed:4baa:ed1c:e489])
        by smtp.gmail.com with ESMTPSA id n5sm2261520wrx.92.2021.04.30.06.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 06:34:49 -0700 (PDT)
Message-ID: <1340f9b6c44a0c6b62dc2cbb37474e9d0a4b8253.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] oe-pkgdata-util: ignore SIGPIPE
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 30 Apr 2021 14:34:48 +0100
In-Reply-To: <20210420083756.11588-1-Qi.Chen@windriver.com>
References: <20210420083756.11588-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-04-20 at 16:37 +0800, Chen Qi wrote:
> oe-pkgdata-util sometimes outputs a large amount of data. When used
> with pipe, it's likely to get the following error.
> 
>   BrokenPipeError: [Errno 32] Broken pipe
> 
> The problem could be reproduced by running `oe-pkgdata-util list-pkg | less'.
> Type 'q' after running the above command, and we get the error.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/oe-pkgdata-util | 5 +++++
>  1 file changed, 5 insertions(+)

This is far from clearcut. 

https://mail.python.org/pipermail/python-dev/2018-June/154191.html

Not quite sure what to do about this as there are pros/cons...

Cheers,

Richard

> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 75dd23efa3..4aeb28879d 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -17,6 +17,7 @@ import re
>  import argparse
>  import logging
>  from collections import defaultdict, OrderedDict
> +from signal import signal, SIGPIPE, SIG_DFL
>  
> 
> 
> 
>  scripts_path = os.path.dirname(os.path.realpath(__file__))
>  lib_path = scripts_path + '/lib'
> @@ -615,6 +616,10 @@ def main():
>          logger.error('Unable to find pkgdata directory %s' % args.pkgdata_dir)
>          sys.exit(1)
>  
> 
> 
> 
> +    # It's possible that this program will output large contents, and when used with a pipe in command line,
> +    # we will get a 'BrokenPipeError: [Errno 32] Broken pipe'. Ignore the SIGPIPE to avoid such error.
> +    signal(SIGPIPE, SIG_DFL)
> +
>      ret = args.func(args)
>  
> 
> 
> 
>      return ret
> 
> 



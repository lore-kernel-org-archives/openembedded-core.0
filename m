Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.9220.1617974956294909237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 06:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bjZPE4zD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id y124-20020a1c32820000b029010c93864955so4737363wmy.5
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 06:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=c3FxJTAaqhkUeDRCEYKNtTPPu2nsGaABm+zIQKxm1+Q=;
        b=bjZPE4zDj2h2M0nMX69sQEyD7jhGYdsLQ81Kh+DkAEE1+i/aKZx7QZfHBztMOkmyEB
         8chEzn6vjd5t+YDJ91Tzrg6lQ7s1sLObJ6F7K0y9ae9sRKwlzb8BIOkWgZ1ezqw1fGih
         R0gssk7V1s1/0TEQAz55StctTb49rmPqeZuLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=c3FxJTAaqhkUeDRCEYKNtTPPu2nsGaABm+zIQKxm1+Q=;
        b=b7TkM5XhDd4R3aTeUmYb8eDoNTn2vMyXFC4XOiTwFu/Y48QcpAWH3KIT+onya4zTR7
         VzEFMJ79d4Kc2QG8lXQw6peZjH6zZfAPEL9fhmd3am40+njwryKZpiJtqhxeCVfo71sA
         7Do345MmQNu3W5mzEzWhmdDn1460aTSlTsIxg9E4X5iCSuNvPvS2UgCz/tgffKGS4r+g
         /laToMd92rtJwpf5BBV+t21qOtKXOC7e+qcZhTDxiemScN9WwN3OTT8GOnq70N+myEHY
         CeIT+SbOio4bsu6417QqQ5uwq0KpG0+p2RcWPdzLxbA3Q5LvyZSi1oFRmCOtDCeOOYLw
         lJpw==
X-Gm-Message-State: AOAM532GoEkSW1K9gyX1JGwXL+Eae+0PDRafmFUJU3QFy1zX2LfJHCU0
	KmeTmmMwqjFJWtvNgr0sLY0kV7rPX04uLA==
X-Google-Smtp-Source: ABdhPJzRrMRSN0hg8m7661YMSWT6TDNNmWRGx6a4wHbTIt7ibj52l4XydnpvU7R/nUy5BRly6KRT0A==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr2210581wmb.183.1617974954925;
        Fri, 09 Apr 2021 06:29:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:434b:3ea0:b8b8:6ecc? ([2001:8b0:aba:5f3c:434b:3ea0:b8b8:6ecc])
        by smtp.gmail.com with ESMTPSA id d7sm5062685wrw.63.2021.04.09.06.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 06:29:14 -0700 (PDT)
Message-ID: <14155d492f56b0a462173ac631bef7944b14194b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][pseudo] client: strip trailing slashes when opening an ignored path
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 09 Apr 2021 14:29:13 +0100
In-Reply-To: <20210408162509.4016524-1-ross.burton@arm.com>
References: <20210408162509.4016524-1-ross.burton@arm.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-04-08 at 17:25 +0100, Ross Burton wrote:
> The pseudo client path map stores paths that have been sanitised, but
> in the ignored-path (PSEUDO_IGNORE_PATHS) codepath for open() calls this
> sanitising wasn't performed so it is possible for paths that end with a
> trailing slash to be entered.
> 
> This then subsequently interacts badly with path manipulation, resulting
> in the situation where doing:
> 
>   fd = open("/some/path/")
>   parent_fd = openat(fd, "../)
> 
> results in parent_fd actually pointing at /some/path still.
> 
> Solve this by ensuring that any trailing slashes are removed from the
> path when adding to the map in the ignore short-circuit.
> 
> Also add a test case for this to ensure that it doesn't regress in the
> future.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  Makefile.in         |  1 +
>  pseudo_client.c     | 11 ++++++++-
>  test/test-openat.c  | 55 +++++++++++++++++++++++++++++++++++++++++++++
>  test/test-openat.sh |  7 ++++++
>  4 files changed, 73 insertions(+), 1 deletion(-)
>  create mode 100644 test/test-openat.c
>  create mode 100755 test/test-openat.sh

Merged to the oe-core branch, thanks. Bonus kudos for a new test! :)

Cheers,

Richard


Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.1997.1599031040136270224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 00:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NdLp/eFH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id s13so3313831wmh.4
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 00:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iFEjA6XycRjzhwrBhZQZbM16tgis/01PpVlHYs+ICe8=;
        b=NdLp/eFHxERbEAlma0GXlWGPJopG93F312Q+Ok+dSv5RRZmOVKVJNPxCRHmJNRtuHt
         EJ373E+PjF2CJdqDDElXrTU1bc/hmle2snC4HwnhW2cZl4GJa2I8Bi1CjmdX4n2Rg+dZ
         gzPd9t9p7yQ/RG0xz2iNSQn5wAlPATBIy/Zps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iFEjA6XycRjzhwrBhZQZbM16tgis/01PpVlHYs+ICe8=;
        b=G+KrnSItJUIdnZm0ziTsqf7L2Ymp+x7jY/hW3N+B8QvEWaYE5ITBjiEkZkwI6regxq
         gX35Knd99rge8kNKw0qMoJT2h10jg6qBq2N9oH4njgVENd8rr5pWwosfWsjJHGTM2K62
         +lhhC7TIkQb993wZV48js+pzezQq+ecfbq7HDC2+39RjzmI7dRn5wU7eMDjRimcnfv4D
         yB3lu1CfwnI339/4dTGh/33/ANvegFznkNPEy6rba6E0hzNhMSiY/Y6gcijJ1kfFwHgm
         7Wqq+2Qc/XwfLbh20RZdwid4sDDmZJgaz7Wc56jPKLoNDALdCnPHEawFWjgXWRPPogem
         wgVg==
X-Gm-Message-State: AOAM532hFUPTtLk9v9xRHbrt4+nl75vJVXODEiM6wuVik9yhuGOCHqVe
	+HH0iKaeyaeLHhD/bE0psxqdqA==
X-Google-Smtp-Source: ABdhPJz8s68zUWE8r5Fnp8SQD/WIKJH3w8qM1mAA5C2YZ326nQJCf77ccQdj4BKeULrQ6/R7fyXrFQ==
X-Received: by 2002:a1c:f709:: with SMTP id v9mr5565660wmh.165.1599031038502;
        Wed, 02 Sep 2020 00:17:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d5a2:f86:9f9a:72df])
        by smtp.gmail.com with ESMTPSA id v128sm5254282wme.2.2020.09.02.00.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 00:17:17 -0700 (PDT)
Message-ID: <974f2e0195871d18ce60b3ed2472ab634f100642.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libpcre: fix occasionally do_package_write_rpm error
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: "MacLeod, Randy (Wind River)" <randy.macleod@windriver.com>
Date: Wed, 02 Sep 2020 08:17:14 +0100
In-Reply-To: <61b74cbe-c228-c206-9155-0e3a0d866e4f@windriver.com>
References: <20200828061434.2943665-1-changqing.li@windriver.com>
	 <389322665bc193ed7bace452717e02dd80aa675d.camel@linuxfoundation.org>
	 <61b74cbe-c228-c206-9155-0e3a0d866e4f@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-02 at 10:36 +0800, Changqing Li wrote:
> 
> On 9/1/20 7:08 PM, Richard Purdie wrote:
> > On Fri, 2020-08-28 at 14:14 +0800, Changqing Li wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > > 
> > > Error info:
> > > ERROR: libpcre-8.44-r0 do_package_write_rpm: Failure expanding
> > > variable
> > > SUMMARY_libpcrecpp, expression was ${SUMMARY} - C++ wrapper
> > > functions
> > > which triggered exception RecursionError: maximum recursion depth
> > > exceeded while calling a Python object
> > > 
> > > this error is hard to reproduce, only met one time. Seems expand
> > > SUMMARY with reference to SUMMARY cause a dead loop.
> > > 
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > 
> > What is worrying me is why we can't reproduce this. It should fail
> > or
> > not fail, why do we only sometimes see this?
> > 
> > I'd like to understand the cause as it sounds like a determinism
> > problem somewhere.
> > 
> > Is there a sequence we can reproduce it with?
> 
> Unfortunately no, we also hard to reproduce this, only met one time
> on 08 Jul when build a wrlinux image.
> 
> And don't see it for about 2 months.

I'd like to have a better understanding of the issue before we merge
potential fixes as there are probably other recipes which also
reference SUMMARY like this and I don't want to patch them all without
understanding the problem.

Cheers,

Richard


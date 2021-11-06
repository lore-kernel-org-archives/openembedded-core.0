Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1181EC433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 09:27:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.17087.1636190860288330146
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 02:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pz5ZdPY2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id u18so17511245wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rbPbkiPwqhyVyr5EW/IE6mzl75sfRcOyAhcu1/dMHpU=;
        b=Pz5ZdPY22H9yyJQncsPFATJ/xP42umuiWcHCilkoMIelWS4X/7i6JDJSnA4c9ueEZ0
         VO7zrA00n682OR6tMyCnCn0ko5t5fOmDKC3qLfNZx/QyvlTruUrjpIm6qrukPC1wnede
         gFJyjJzwrmFinS7NY19ZomI/Uq2pM1iRaCixE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rbPbkiPwqhyVyr5EW/IE6mzl75sfRcOyAhcu1/dMHpU=;
        b=QMcUx+URXsKISH1qZJRCb2PgZlHB78nkdmPkraCqNdIkdJ/Gvnfv1u8IqtDDZc1sRg
         sAHqToBsgurYXe5/R2cl8VKFPXkmHC32vSBxIz7KuRYmNHCu9Qp9bz3i2xAEojLjhutN
         5Yj3VpeSxI5EDwtQULiMGH14htS0jA2lX0y3K8cvg37nWt83WV2iLJ8HM9T+I1WdhMLz
         9WZukfbQPU4MxJno7s+11qT6Dnf+yNZVbb3euNhu4Cw8AO7BII2dE/CHmwhTSHWRqTv/
         uw8GWlIEnViCKFL2h2UmXdgMvBm3/P82cMCojO6+7wWn+nUSIov80xSadtBL9C8BH8I7
         kR7A==
X-Gm-Message-State: AOAM533Sjpe1aXT3PxutyCt20QeS1UoUzktHfOlw6G3lGgNgCSMUSCUM
	9aVPfFHYhiCs9lODkh2AeUPLLA==
X-Google-Smtp-Source: 
 ABdhPJz0qjnYFRV6mPP6WCzsSOncoH6CaiPlbsvLTYm3eKYUhVZhrcJoSP3C1+EQalPYxVkres8ZAw==
X-Received: by 2002:adf:fb09:: with SMTP id c9mr23303378wrr.223.1636190858588;
        Sat, 06 Nov 2021 02:27:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:23d0:3dc5:c03:c6aa?
 ([2001:8b0:aba:5f3c:23d0:3dc5:c03:c6aa])
        by smtp.gmail.com with ESMTPSA id
 l15sm5801002wme.47.2021.11.06.02.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 02:27:38 -0700 (PDT)
Message-ID: 
 <69bc0138e89d4f77b6062e451dc6fd81e48becbc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [V3][PATCH] ruby: workaround ptest hang problem
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 06 Nov 2021 09:27:35 +0000
In-Reply-To: <20211105021848.6807-1-changqing.li@windriver.com>
References: <20211105021848.6807-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 09:27:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157935

On Fri, 2021-11-05 at 10:18 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> since openssl 3 not compatible problem, ruby have disable openssl
> extention. But disable openssl extention make test_smtp.rs hang at
> test case "test_start".
> 
> Net::TestSMTP#test_start:
> NameError: uninitialized constant Net::SMTP::OpenSSL
> Did you mean? Open3
> /usr/lib64/ruby/3.0.0/net/smtp.rb:195:in `default_ssl_context'
> /usr/lib64/ruby/3.0.0/net/smtp.rb:552:in `start'
> /usr/lib64/ruby/3.0.0/net/smtp.rb:475:in `start'
> /usr/lib64/ruby/ptest/test/net/smtp/test_smtp.rb:199:in `test_start'
> 
> temporarily remove the hang case to make other testcases can be run.
> 
> Meantime, move ruby-ptest out of the PTESTS_PROBLEMS list.
> On 48 core host, run ruby ptest in qemux86-64:
> root@qemux86-64:/usr/lib64/ruby/ptest# time ./run-ptest
> PASS: test/test_set.rb
> PASS: test/stringio/test_stringio.rb
> ...
> PASS: test/did_you_mean/test_tree_spell_checker.rb
> PASS: test/test_mutex_m.rb
> 
> real	5m42.872s
> user	3m50.923s
> sys	0m44.136s
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc | 3 +--
>  meta/recipes-devtools/ruby/ruby.inc             | 4 ++++
>  2 files changed, 5 insertions(+), 2 deletions(-)

Unfortunately the success rate isn't like that when we tried this on the
autobuilder, it failed on both arm64 and x86_64 with multiple failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2791
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2507


Cheers,

Richard



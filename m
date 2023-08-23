Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3FCEE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 13:01:57 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.10809.1692795713813295785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 06:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kv3pXmS+;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so45280701fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692795712; x=1693400512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QCK2gMSqT7MeFFY8uVUmkwvJJYB84Er0TyjFP1TfQrg=;
        b=kv3pXmS+eooyhpOU5X+N7CM/LDSlP0PpLryrS+uHp1x+M5wruPNDdyyAoDjBI/6AMg
         d+bqj0VeuN5VY2XrezBlftv0BJ5hnMKQ8B3U/m/4B89h4Bw6tCOXdEbHVK9yEIOSlmDh
         AYegX6jpK1YzquPQioDfSQU5fq4wi0XglNaVeR0oSwNnM8oojX8DUskvLSB/9R+KWn7H
         fSDkLaSerRCPUe4K7UxzcN3Zm7eaZV2JxkhM3gLYARPyM//OVnwlbke0ua/+qViqiceK
         E2PrLZpUtqUiQPmPFQPWDJW24LBxnOrbIbq09nIZ1PFP38Y5t+z6vtVoFC6UciZIleQU
         epFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692795712; x=1693400512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCK2gMSqT7MeFFY8uVUmkwvJJYB84Er0TyjFP1TfQrg=;
        b=Ud5w9+1fLBpWwI0Z9AQiysiatFep4YA2oTCeYcAdJZUwqlmsiKmqSqsuOtXOXVTeB4
         +QJU4Z2pz8tcrYofY4xfjvW4mSmrIoZA+BXlfWrbuKSEvrM1tQjGj5gMYuugXILbyRDy
         tpbgKJhbWfjqmzkIaL3ejLCLnDt76rbqtBpLKZGPlUrbSCmttk+3r7Y6C1IUxRlgG8z9
         nBfIC1N7fAWjVreKgMe6oaV0I0zyW65rP5yhCoob0rEF9jDZdvsUcU/W80QShZqyq1YL
         gwA9AqyXXgvV14OsykLsc9p4prqA1TOwAldXta7kgvhQfadGhOUz4UvWwdkkhHYaI8YY
         QBXQ==
X-Gm-Message-State: AOJu0YxohM6HEXamWibDKBU3nVFXDiRurDJ8fHKK/LiwoVbNF3fF4wq7
	6eeynYB0vSGGUiIN4LY/KRrSYw==
X-Google-Smtp-Source: AGHT+IEiY99j09MeUeKS4YVz4LAAbT06o1Ew6qzV0O7Ub8KWy6ySiEJYNmkivV5YybYVwl1h/9jO+g==
X-Received: by 2002:a2e:3817:0:b0:2ba:18e5:1069 with SMTP id f23-20020a2e3817000000b002ba18e51069mr9120572lja.4.1692795712016;
        Wed, 23 Aug 2023 06:01:52 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id x25-20020a2e7c19000000b002b97fe43238sm3222556ljc.19.2023.08.23.06.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 06:01:51 -0700 (PDT)
Date: Wed, 23 Aug 2023 16:01:49 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: openssh ptest banner failure (was Re: [OE-core] [PATCH v2 2/9]
 testimage.bbclass: detect slirp from TEST_RUNQEMUPARAMS )
Message-ID: <ZOYDPQgCfD8PyWmD@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
 <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
 <ZOW1tEl+PiOK09l/@nuoska>
 <44b46fe9ef454e80895ce2b0ecbdac1bea9784bb.camel@linuxfoundation.org>
 <ZOXVyxiqDDnjCp61@nuoska>
 <CANNYZj_q-DgNoGL6JLP+XQv-3+2QFomNTYeUY9WF8FcpfCXgNQ@mail.gmail.com>
 <177DFD85A9F91D1D.28529@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177DFD85A9F91D1D.28529@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 13:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186574

Hi,

On Wed, Aug 23, 2023 at 01:49:39PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> The tests passed with one warning, which I'll try to check:
> 
> WARNING: core-image-ptest-openssh-1.0-r0 do_testimage: There were failing ptests.
> Traceback (most recent call last):
>   File "/home/builder/src/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/home/builder/src/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/home/builder/src/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/home/builder/src/poky/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunner_expectfail
>     self.do_ptestrunner()
>   File "/home/builder/src/poky/meta/lib/oeqa/runtime/cases/ptest.py", line 120, in do_ptestrunner
>     self.fail(failmsg)
> AssertionError: 
> Failed ptests:
> {'openssh': ['banner']}

Has this openssh banner test on x86_64 been failing on yocto autobuilders?

Log tmp/work/qemux86_64-poky-linux/core-image-ptest-openssh/1.0/temp/log.do_testimage
shows:

PASS: environment passing
run test transfer.sh ...
PASS: transfer data
run test banner.sh ...
test banner: missing banner file
test banner: size 0
test banner: size 10
test banner: size 100
test banner: size 1000
cmp: EOF on /usr/lib/openssh/ptest/regress/banner.in
banner size 1000 mismatch
test banner: size 10000
test banner: size 100000
test banner: suppress banner (-q)
FAIL:  banner
make: *** [Makefile:223: t-exec] Error 1

On manual execution this passes:

$ runqemu slirp nographic novga core-image-ptest-openssh
...
root@qemux86-64:~# ptest-runner
START: ptest-runner
2023-08-23T12:04
BEGIN: /usr/lib/openssh/ptest
...
PASS: transfer data
run test banner.sh ...
test banner: missing banner file
test banner: size 0
test banner: size 10
test banner: size 100
test banner: size 1000
test banner: size 10000
test banner: size 100000
test banner: suppress banner (-q)
PASS: banner
...

client rekey tests are still running.

Cheers,

-Mikko


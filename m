Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.17120.1599308756505778260
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2020 05:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FYDzG29p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id o21so9173217wmc.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2020 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=z9ldmg6GQPKJzRUzoNZuZyIx4qB7jyjVJn/tKftbKEk=;
        b=FYDzG29pvjqmCex8znwXve4M1rY9vH5vUstwwSNQ+GjYedzox/YoB2kbbCI6NgKTYA
         dWldN9kTrygskWSmx/ympwSUFvGAgRDwkHAPUiX8u2dtJW/XGh4JpuDaWakW6OVtV+Ej
         eQjCEStPxM0vKhBN+n1RsndOakefNZeQ6jctE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=z9ldmg6GQPKJzRUzoNZuZyIx4qB7jyjVJn/tKftbKEk=;
        b=ZM5dwL6dALuK1bOAiJcqygW1mYPMHOWZs9jLZU5uHjWKk+QGNQMvKJwUQ5dderTw7t
         HkBVssiHmnhw34fwu8rZeZie2scku1CSJEx22yWnuumVNpz3c7Mh+ogRijYJLSvcCTLn
         U+hXwdlwYgh7kQYYRL+4o/CetPz338p08ptEoXO8dAtNRvT061TKbosDvRYfmTFOy4HI
         GztDagCSpQCNYvRPdO8+9NHaMl5MRf2KhM7vFvs2WWcDxLKbwoZuXeaCWd445VTM2iNS
         id5HD1UPj3XhZdZQP/0kTZWTsfCFGtzpGxYPCoJrMb7tEU3268a2oUeztxF1odqcXkdC
         1cbg==
X-Gm-Message-State: AOAM532eT0M0hmMwBmkjTsA86/v8qtUu9IwAondNkwxk3jpxVDn6F3c3
	kQNWyft0YyohUcAdctm9GB7PcqSKtw2OrQ==
X-Google-Smtp-Source: ABdhPJxhVVfzXhNwDcXOO0PyWS6V3coF5MIe2RRy/pOkUWTytiPyTgJtSSJ7lpamM64OJAHI+Dk50w==
X-Received: by 2002:a7b:c095:: with SMTP id r21mr12780570wmh.133.1599308754521;
        Sat, 05 Sep 2020 05:25:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7cb6:1620:605:fdfd])
        by smtp.gmail.com with ESMTPSA id w15sm17042510wro.46.2020.09.05.05.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 05:25:54 -0700 (PDT)
Message-ID: <07b8b687efaf8b72a23210d44292acbe9a36a066.camel@linuxfoundation.org>
Subject: Autobuilder qemu process nice/ionice levels
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	yocto-infrastructure <yocto-infrastructure@lists.yoctoproject.org>
Cc: Michael Halstead <mhalstead@linuxfoundation.org>, "MacLeod, Randy
	(Wind River)" <randy.macleod@windriver.com>
Date: Sat, 05 Sep 2020 13:25:49 +0100
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi All,

As many will know we're having issues with the qemu processes seeming
to suffer resource starvation on the autobuilder. We currently try and
lower the nice/ionice of builds but watching iotop during a build shows
there are a lot of things which don't see that, including:

* devtool kernel test builds
* bitbake parsing
* oe-selftest outside of the actual bitbake task execution

We're simply not going to be able to renice in all these cases.

In case people aren't familiar, you can "nice" down but once down, you
can't nice back up. This means we can't just raise the priority of qemu
and lower everything else at startup.

I have a new proposal. I think we should install a file onto the
autobuilder workers as ~/runqemu-renice and on that, run "sudo setcap
'cap_sys_nice=eip'". We then add in some code to runqemu such that if
this file exists, it runs it as "runqemu-renice <runqemu pid>".

This file will renice/ionice the specified process to -10 nice and 1/be
ionice, probably as a python script.

It should be simple, minimally invasive, backportable, as secure as it
can be and hopefully not too much trouble for Michael to setup.

Any concerns/comments (particularly from Michael)?

Cheers,

Richard


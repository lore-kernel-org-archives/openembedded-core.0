Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78943D743C2
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 18:58:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.22945.1732129131416816225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 10:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iO9ubloE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so127055e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 10:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732129129; x=1732733929; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rhnWlCt3psgjR7S+L0XRh8BTYHow+EnhxR0LQ17jQ08=;
        b=iO9ubloEImNXelYqqSKMpXcFhnLWU7gJ2UkTmdZp1sFpcY5Boh+PX6HzFAmxQPqK6T
         Dhu4h+npKs91zpuZ/HwIr87IRlQJn1I0NG9Tum58QB2RVDpx/YewvVbNw1Q433MU64/0
         UPE+vhl+he5d4TU9PepZkPV2fj59X92lGvWNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732129129; x=1732733929;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhnWlCt3psgjR7S+L0XRh8BTYHow+EnhxR0LQ17jQ08=;
        b=EdK+34T1BIZYyMbMuH7TGKX4ir6Ps4XaPNtAW55FpxikFuX0M+8crFgtoTekLWZK0O
         v8ky6qoUq5Vh7N+1zHGYlr0RuSEnUMs2SprN3L5Yf3Zyh6xttEwLvG2Upeohi9bxXng+
         qox+IS2JAIicBdVV9is5alIs5Q1TUuRZQ9z8LUx0gXxCk4UmlTS6QzJKKqH92NzYpJFz
         P6Rpfdl1keBOqF1ebosoEOHSWFwPHzVM9Dh6DmbqGguIy2AKct/2kBUWrowT6xwFUeX9
         vMYkjqeWtBhgl5v8rIEGZIgeDAnr+O+/ukyjGK6Mw/SJCxDn5p8lIG4gkbwWSlRrnAk+
         9fhw==
X-Gm-Message-State: AOJu0Yz8KJ9+EkoGJERfpqkGIBwrHkmmFARnsm5NOpfJNlddLde9Ht98
	86waStK89eJIJhAT8N90MjiLZN7QEfF6yI+kWeL+D5s/hbdYIAb6LRgl+p8oJ13iwNnX0gZZHWy
	F6G0=
X-Google-Smtp-Source: AGHT+IHCMBMG5xfvnhp2/W1cwA/o1cfPoQzSQ1f/3EsgZ2ib5PiUsxQTsLMr8YnMJzyP/D0r7hP1pA==
X-Received: by 2002:a05:600c:3d8b:b0:431:612f:189b with SMTP id 5b1f17b1804b1-433489b6929mr38076545e9.12.1732129129470;
        Wed, 20 Nov 2024 10:58:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5abf:50dd:d6fd:8415? ([2001:8b0:aba:5f3c:5abf:50dd:d6fd:8415])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b463af85sm28156555e9.41.2024.11.20.10.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 10:58:48 -0800 (PST)
Message-ID: <6347cc15edc0856d027673233214ba7876befe73.camel@linuxfoundation.org>
Subject: An interesting cascade of failures in ptest
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Randy MacLeod <randy.macleod@windriver.com>, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Date: Wed, 20 Nov 2024 18:58:47 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 18:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207476

I was recently asked why an strace ptest build/testimage was going
slowly. I've looked into it and it is perhaps worth documenting the
cascades of failures that were causing problems.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15651

The first step is strace creating a 43GB sparse file in it's test
directory.=C2=A0

There is nothing wrong with that as such, until an strace ptest failure
happens. We then tar up the directory as part of the image post
processing and archive it for debugging.

Taring a 43GB sparse file with gzip is not efficient at all, it will
sit using 100% of a CPU under qemu+kvm for over an hour, I gave up at
that point.

The data is transferred over ssh to the host and each chunk of data is
printed into the task log file (as binary). The 187MB of data ends up
as 1.4GB tar.gz, so that is over 1.4GB of data dumped into the logfile
as binary. The code uses string concatenation to do this which is slow
in python.

Worse, the logged data is also set over the worker IPC mechanism to the
bitbake server. This is done in 64kb (pipesize) chunks, with a memory
mmap remap being done between each chunk due to recreation of the
bytearray.

In summary, the time taken to do this is around 2 days. We did let the
build finish as I was curious to see if it would!

There are multiple patches being sent to try and address this:

* switch qemu images to include GNU tar
* use --sparse option to tar
* increase bitbake's pipesize
* avoid many of the bytearray remap calls
* don't print large/binary data into the logfiles
* use bytearray in the ssh code

So hopefully we get some general performance boosts all around.

Cheers,

Richard







Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C90C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 17:47:18 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.28172.1707241636644545709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 09:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S9MkCz0i;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: petr.vorel@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso7139220a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 09:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707241635; x=1707846435; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdqnVuOiYW5dvjmoOcvUUUCFwuFyvsBFagfjHk1TVuU=;
        b=S9MkCz0iiWE0d6NQ95IqOHpKNYP1DGh4yqTLFQzB3oIA3pgb0vejWl/l3OknQNJzsM
         PLYQkqpWZe3KC2WhZDizIIAPvRQTwyqsQ0L5+Gw9DUc7p7b7QrKU8BEeKhDv6VWMFtpE
         mhX9E1F8ho9xS0mzGRhm7tql4gq/BXp4GOOIj3Tgyly8z1HvH5tr5ULdH42jCvtYtmY3
         k7Z47S1USQPgP6zrVDP+RNdxSu1nGVKfpSyOysSe2WxN7CUjPeSU2N15SCevMkOY0VAn
         c8ZKvz/Qp8+NXQQzxQh+vahqER62uFBlofBdpC9csQ5SoYL+UKIByQVeUWRI0iI+qfsN
         XaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707241635; x=1707846435;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdqnVuOiYW5dvjmoOcvUUUCFwuFyvsBFagfjHk1TVuU=;
        b=phwZ9T+IZYPv4BiRo2y0wKs6XHZaAQD5GMsNcd3dwp6kR7vmKpF8gRqfcN8Ijo/QQT
         LRhe1iIPzPnd9AAR5iquV2/ppo8r1RhGPSY6euy8zHzQdPQWfiliDHg8Gk7ejEh7ycfp
         WvmWngZL8LXkl4Ed/ZZcp9WLghJSJaX4C/Fh6xDIns6Phw/mup9ykSPgxHKZC2vcJeyA
         9h1wYkBHsGZPSGlMNFA921DVb3auO+MRQ2GueVOYuCb09xs+HnEdtewsAKFP/qURdRWr
         B6KewSThBQQCyRvrH223OIKJAXrjLjs5/37dPW0F7Gt6MAL42h7wIZHVPlc1hUPKi8s8
         5gig==
X-Gm-Message-State: AOJu0YwMIi17fqZ+fEpW1LwKJqnT+IDsi633lpwkpfTo1VXXC1Qsyk3M
	h+8fASgXs49CsDjQaxTURncxNOPDlKhFWiMj0hCmttffpDeiKEoI
X-Google-Smtp-Source: AGHT+IG07UISWgCa200Ppz7Qp2F4E0H9ALX1y4xI3fkfyiN2wCT22s8pkzYdpOCqSlk9MtuP7Rdeew==
X-Received: by 2002:aa7:d047:0:b0:560:c6a8:e7dc with SMTP id n7-20020aa7d047000000b00560c6a8e7dcmr272152edo.1.1707241634867;
        Tue, 06 Feb 2024 09:47:14 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id d16-20020a056402517000b0055c46f452c2sm1233810ede.65.2024.02.06.09.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 09:47:14 -0800 (PST)
Date: Tue, 6 Feb 2024 18:47:11 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] ltp: Enable extra test groups
Message-ID: <20240206174711.GA43734@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20240206102246.2569704-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206102246.2569704-1-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 17:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195014

Hi Richard,

> Petr Vorel (upstream ltp maintainer) recommended some extra tests we should run.
> Enable these for extra test coverage.

> -    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "commands", "net.ipv6_lib", "input","fs_perms_simple"]
> +    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "commands", "net.ipv6_lib", "input","fs_perms_simple", "cve", "crypto", "ima", "net.nfs", "net_stress.ipsec_icmp", "net.ipv6", "numa", "uevent", "ltp-aiodio.part1", "ltp-aiodio.part2", "ltp-aiodio.part3", "ltp-aiodio.part4"]

nit: Sorting alphabetically or even list single item on it's own line would made
list a bit more readable.

Suggested-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks!

Kind regards,
Petr

>      ltp_fs = ["fs", "fs_bind"]
>      # skip kernel cpuhotplug


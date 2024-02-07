Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0371C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 17:24:18 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.3558.1707326656322581707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 09:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HFVrIe/H;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: petr.vorel@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3832ef7726so111290266b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 09:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707326655; x=1707931455; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xukb+NnM08jvWQKNdoiyBZL0qmyQspyOzb9oA85/iOI=;
        b=HFVrIe/HWfH2wG3oI2JjVY7wyO4mhfIJUYHv6uj1uM532pq2PbIU6sCoOvFj/Bmfaf
         MR0YRSaGyEzTWQHhiPZ7KdZjRVYkT/5a0WfW6SIMYv0QwizoYkp+pqA3H41tV36KFu9E
         4ke95ClAfGzcfvf5ms4EcilTGYFOA/br7OBlBaJqnwcn6YoJ+oQnlukzMMRJwbVK7rN/
         U5v3V+kG/qyh94foOTHtSEehxwxQdZbFekLbG3f4G63zBmS2+TcvChj68wyQtGBXgqhK
         19d+KHprgaMUHXaZh73ISHRnpS9nSqUFRmMW7Ql1ByoFqDWKgv8cvMgylDNM+qSNhFbr
         8zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707326655; x=1707931455;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xukb+NnM08jvWQKNdoiyBZL0qmyQspyOzb9oA85/iOI=;
        b=gJWC0ZXW7W6OjADEaiVZHjSzL962qFxRMcB14VqdQgkayz3WIQOvV/UwcsdE6PYxsb
         Ns/zojRbqzLXz4aEWxzzp2npHPFInKAMoAbyedHGcWCMow2rxa+Ogqn5jmjeKeE0XXj+
         HPqgR3jn2Ija0dKjdRpolhz4YPCmaa2Z3aKKkabSSXCNvB3PNTC7fEEtsVmWyfIr7Vke
         RjsQLTNH7LUf0mhVxOyKk4lhIADbxlLB/dPNkPVOOkyv67VVWNT6SLjVAYwYyKwjqSJi
         GJy041zgjsNdClucSio805e5k6WPzSmNZC99h/tFslxvRpGJVkKdJsCE0TMpY80tXAdF
         NJbA==
X-Gm-Message-State: AOJu0Yy2nlWxyeB/LjqnENJIGkhmCiX1jMWQ1d9QfkF9j6q2HLKZS5Nq
	3V1GSWr/9HVT/E07KrapP7cphlwgJCrwJdOaOKJ157bJJqN0Ndpd
X-Google-Smtp-Source: AGHT+IGnQ53B2anE1Fqv09OtJvCIcisYp1K1xHfL2IKaEv76xLby3LkBcELllRBsOV1gcdcDRAwpAg==
X-Received: by 2002:a17:906:168e:b0:a38:41bf:f6f6 with SMTP id s14-20020a170906168e00b00a3841bff6f6mr3258926ejd.77.1707326654568;
        Wed, 07 Feb 2024 09:24:14 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id jl16-20020a17090775d000b00a384365e3b9sm954394ejc.195.2024.02.07.09.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 09:24:14 -0800 (PST)
Date: Wed, 7 Feb 2024 18:24:12 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] ltp: Enable extra test groups
Message-ID: <20240207172412.GA134440@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20240206102246.2569704-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206102246.2569704-1-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 17:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195075

Hi Richard,

> Petr Vorel (upstream ltp maintainer) recommended some extra tests we should run.
> Enable these for extra test coverage.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
> index 9d93d314537..f588a93200e 100644
> --- a/meta/lib/oeqa/runtime/cases/ltp.py
> +++ b/meta/lib/oeqa/runtime/cases/ltp.py
> @@ -57,7 +57,7 @@ class LtpTestBase(OERuntimeTestCase):

>  class LtpTest(LtpTestBase):

> -    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "commands", "net.ipv6_lib", "input","fs_perms_simple"]
> +    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "commands", "net.ipv6_lib", "input","fs_perms_simple", "cve", "crypto", "ima", "net.nfs", "net_stress.ipsec_icmp", "net.ipv6", "numa", "uevent", "ltp-aiodio.part1", "ltp-aiodio.part2", "ltp-aiodio.part3", "ltp-aiodio.part4"]

Also one thing comes to my mind: would it be possible to list all files in
/opt/ltp/runltp/ to detect runtest file names? Then it would be the most
reliable solution to find available runtest files.

>      ltp_fs = ["fs", "fs_bind"]
>      # skip kernel cpuhotplug

Also, is this ltp_kernel even used?

    ltp_kernel = ["power_management_tests", "hyperthreading ", "kernel_misc", "hugetlb"]

Kind regards,
Petr


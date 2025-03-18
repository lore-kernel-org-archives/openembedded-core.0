Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0862DC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:27:34 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.7483.1742290046307798396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dQqJsG0C;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f7019422so47207276d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 02:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742290045; x=1742894845; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ij+rK82hFJJQ/EnFITVEDDYuR/4sxSAFMI81CWq5UT0=;
        b=dQqJsG0ChoOdOlc4N6SPiz8WTuwz4tbQN8YHVgmAhvbqtqD1MZLlZ6qPG1LL8lKoaW
         q4ZdgQXwMKqs3n9zF8rsLeG8/LeybRRV7sEkEYIEWeRJ5e1MeHmXApHTJYNlIVnqmL4c
         m8z18VUUrPQ5G/QuM9MC+lfQn0GzqXebndBfrLMZJnpNUeKiRi39NaToKR8puAtNCheb
         54HpaCC/HjHrokp7KIKCss0+e0QQOUAWHjAyMJteBkAei8Ge3GRh43f71AzPdBSfFgRG
         tDwjyIkr6W7V8DZu9zyZ77SxXpPu53LqWRv/8U7GBEjQdpNb+XmzbEeTu6egr19B02rQ
         9VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742290045; x=1742894845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ij+rK82hFJJQ/EnFITVEDDYuR/4sxSAFMI81CWq5UT0=;
        b=s6rSjRtJnZ+jzoy8rAB/9mztHx4ybmIevYGpAbVqWsePJS7LP7cj3r+YKKyFFhqkfA
         h1UnWey0ybD4fGUtmBtXQu4vUvhLigvxfv4laPdL49UTeghbpM8/OPk/GDvenrU2mw7c
         Zt8S9GVIKOVjA+GRXMNCCoRrEQN51tmQz0cPqjVsNIH2LGAn/smxD+GFcDfJyRwTbYLi
         ZFp6tCKewYiguMqP2zZ51x+GpkeOOMWGa66l+iRTxhhIwijZYVOWcTtGNIZTBmNEnxIK
         V20sASl47hmjyrAPe/EPn+1Kic9Iyh7rWxf42jCiPSSfmxFW0CGRvN122jUG/tzT2S+k
         nGRw==
X-Gm-Message-State: AOJu0YzATotGwfrup5Dx9iCezEWYkkc0YD2JDFkkpwthcawd6/yjjtXH
	BwRdGqNmIRzmFXXP5PUu8am/1Qh+aswXTxl64pOYnNGoTklig/ES+7YdVVUri1shecfCMTU1kdy
	AzURqYyiGmm0cC2ReYcTcqo4xH1E=
X-Gm-Gg: ASbGnct2SuL4e26NdEq9EdPQXv4c+qTpJdVC46aASMii5dBjLGmESLHHStRfc5b7Y90
	3ioc27ezAJzuEQBwdpIBgs3cbAzXSema4Gc13eXx4+Q6Io+83LMRJh4xewOBxY3JX5hQayvGnON
	ww5dlIC/2aRP3l9JgrDBxFdcV+y5vPePp7Y6Skne+IzjU/OMm1PqhNVL9rrgPS
X-Google-Smtp-Source: AGHT+IEN69zpuPJBhhtaL+Ga35DvMIt4GN/uOQ8aknNPP3SoRpic8B17IOr8PsPC4BM/R7W2sWw05wJwkXSXNWwVE28=
X-Received: by 2002:a05:6214:768:b0:6e8:f4a1:68a4 with SMTP id
 6a1803df08f44-6eaeab12231mr199368806d6.39.1742290045305; Tue, 18 Mar 2025
 02:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250317014144.2113-1-maxj.fnst@fujitsu.com> <20250318020104.1864-1-leimaohui@fujitsu.com>
In-Reply-To: <20250318020104.1864-1-leimaohui@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Mar 2025 10:27:14 +0100
X-Gm-Features: AQ5f1JoolUPFdg_97Rc-EkN-2U8Q1KWNWYyKFriJFqb1jlPAdpoavfTQdB0Pm-g
Message-ID: <CANNYZj8yHZmUQGx_0285gf_37Qm3t0euAMYoQFg507cNBRa-_w@mail.gmail.com>
Subject: Re: [OE-Core] [PATCH v2] kea: fix conflict between kea-dhcp6 multilibs
To: Lei Maohui <leimaohui@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213189

Thanks, this looks good to me.

Alex

On Tue, 18 Mar 2025 at 03:01, Lei Maohui <leimaohui@fujitsu.com> wrote:
>
> There are conflict of config files between kea and lib32-kea:
>   | Error: Transaction test error:
>   | file /etc/kea/kea-dhcp6.conf conflicts between attempted installs of lib32-kea-2.6.1-r0.core2_32 and kea-2.6.      1-r0.core2_64
>
> Similar to:
>   | 8cc65e7eb0 kea: fix conflict between multilibs
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  .../kea/files/fix-multilib-conflict.patch     | 28 ++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
> index 5b135b3aee..763639327a 100644
> --- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
> +++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
> @@ -8,17 +8,21 @@ Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
>       lib32-kea-1.7.10-r0.core2_32 and kea-1.7.10-r0.core2_64
>  |  file /etc/kea/kea-dhcp4.conf conflicts between attempted installs of
>       lib32-kea-1.7.10-r0.core2_32 and kea-1.7.10-r0.core2_64
> +|  file /etc/kea/kea-dhcp6.conf conflicts between attempted installs of
> +     lib32-kea-2.6.1-r0.core2_32 and kea-2.6.1-r0.core2_64
>
>  Because they are all commented out, replace the expanded libdir path with
>  '$libdir' in the config files to avoid conflict.
>
>  Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/2602]
>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>
>  ---
>   src/bin/keactrl/kea-ctrl-agent.conf.pre | 3 ++-
>   src/bin/keactrl/kea-dhcp4.conf.pre      | 4 ++--
> - 2 files changed, 4 insertions(+), 3 deletions(-)
> + src/bin/keactrl/kea-dhcp6.conf.pre      | 4 ++--
> + 3 files changed, 6 insertions(+), 5 deletions(-)
>
>  diff --git a/src/bin/keactrl/kea-ctrl-agent.conf.pre b/src/bin/keactrl/kea-ctrl-agent.conf.pre
>  index e6ae8b8..50a3092 100644
> @@ -56,3 +60,25 @@ index 6edb8a1..b2a7385 100644
>       //       "parameters": {
>       //           "identifier-expression": "relay4[2].hex"
>       //       }
> +diff --git a/src/bin/keactrl/kea-dhcp6.conf.pre b/src/bin/keactrl/kea-dhcp6.conf.pre
> +index 271021b..5b85854 100644
> +--- a/src/bin/keactrl/kea-dhcp6.conf.pre
> ++++ b/src/bin/keactrl/kea-dhcp6.conf.pre
> +@@ -201,7 +201,7 @@
> +     //       // of all devices serviced by Kea, including their identifiers
> +     //       // (like MAC address), their location in the network, times
> +     //       // when they were active etc.
> +-    //       "library": "@libdir@/kea/hooks/libdhcp_legal_log.so",
> ++    //       "library": "$libdir/kea/hooks/libdhcp_legal_log.so",
> +     //       "parameters": {
> +     //           "path": "/var/lib/kea",
> +     //           "base-name": "kea-forensic6"
> +@@ -218,7 +218,7 @@
> +     //       // of specific options or perhaps even a combination of several
> +     //       // options and fields to uniquely identify a client. Those scenarios
> +     //       // are addressed by the Flexible Identifiers hook application.
> +-    //       "library": "@libdir@/kea/hooks/libdhcp_flex_id.so",
> ++    //       "library": "$libdir/kea/hooks/libdhcp_flex_id.so",
> +     //       "parameters": {
> +     //           "identifier-expression": "relay6[0].option[37].hex"
> +     //       }
> --
> 2.43.0
>


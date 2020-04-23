Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.2600.1587631094228473769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 01:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VVA73M3s;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id z12so4748971ilb.10
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kUYE59WJDtkLPUfYXO6afoGTRY3tqf1B0nBzD3nSD/U=;
        b=VVA73M3scpV9r336RzRyVSQdPckzlvyWP8OT2OhEvgPv+OG3pj0Bqik4tSd1OQAXpw
         vt2b2YCqywOkAj55Pq7PYs/BNNraQ4dJ2qHd5JOUTFaGuSWa47JczA16eEyUp6IDQyIH
         nqM8jUxgKXOjnItjizv+LMyNX4lh3kxy9+2zbFAGyVXxYtnu68s/8UTzW86RyT5cKAdJ
         FijoOZ6j6ZkrORdEUt4UCAPpmw3GsuP8pajSXqV72xJN8tKd+M0ENrZmCeuX8Ji2EOoy
         Pvyw29zjK87VOnxlCFvof0t+s3Bggw13pX2UKAmvOeFgbFN+k/lhSR619gqa6lMUiSYE
         COiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kUYE59WJDtkLPUfYXO6afoGTRY3tqf1B0nBzD3nSD/U=;
        b=Kze4hm4sGImV46iEz0+PKzAdHGzakwjs67YHs8WNHcILNevtmq320gzy2HCFcdgdNN
         3y2H5C9hk7hyFUysFvPhFuBJaMUSXd/3k0LKT1i20DQS+7ooJzryrDptZZpM5nqw6f8K
         AIRC76xdzxAuVpolnJjhuAxGsbUxismdRjdflFAKHL2PGOsx7gCWbUwLzzqkupjiixad
         bV7X9fqtNvJFp0/ckoTpTOqHAKkdP5po+GxEZqbcNXlCsWQn24RaPqkey37xVQvb6PZW
         LBIinKTOJALaCfz+8SgQHRfvkLFsYiZOlt5ZKcgCihP2GQEY3vOS01CMzuXgA2nt9NEM
         yJMA==
X-Gm-Message-State: AGi0PubT2fmE6m1cB2WHIK9uHXzO5pSlLDIydcKfnItGgrlBplSMvdwy
	ibRxgFKn4z2vhHPDooCQQIfteq7xbIgmnYoCxBM=
X-Google-Smtp-Source: APiQypI8TmexpM1LR5KQCfO2AgL4I7X57dvqhfPv6cd7Ke8SGlt5R3zUNyzMZkWQI2CpRrPDaf6qloi+N0sl/4+BCV0=
X-Received: by 2002:a92:d90b:: with SMTP id s11mr2352999iln.295.1587631093660;
 Thu, 23 Apr 2020 01:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200422135211.121292-1-alex.kiernan@gmail.com> <160828A1D0F44509.29104@lists.openembedded.org>
In-Reply-To: <160828A1D0F44509.29104@lists.openembedded.org>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Thu, 23 Apr 2020 09:38:02 +0100
Message-ID: <CAO5Uq5S=+5QVHcB6gaTQ+gz+zW0Ce9i8BaB88yN0n++A2jW8KQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 3/6] rng-tools: Restrict rngd.service
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 22, 2020 at 2:52 PM Alex Kiernan via
lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org>
wrote:
>
> Whilst rngd has to run as root, we can significantly constrain its
> permissions (AF_INET AF_INET6 are only required if nistbeacon is
> enabled).
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  .../rng-tools/rng-tools/rngd.service          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> index 084322ac40aa..604e9500665e 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> @@ -8,6 +8,25 @@ Conflicts=shutdown.target
>  [Service]
>  EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
>  ExecStart=@SBINDIR@/rngd -f $EXTRA_ARGS
> +CapabilityBoundingSet=CAP_SYS_ADMIN
> +IPAddressDeny=any

I missed removing this constraint when nistbeacon is enabled - will send v2

> +LockPersonality=yes
> +MemoryDenyWriteExecute=yes
> +NoNewPrivileges=yes
> +PrivateTmp=yes
> +ProtectControlGroups=yes
> +ProtectHome=yes
> +ProtectHostname=yes
> +ProtectKernelModules=yes
> +ProtectKernelLogs=yes
> +ProtectSystem=strict
> +RestrictAddressFamilies=AF_UNIX AF_INET AF_INET6
> +RestrictNamespaces=yes
> +RestrictRealtime=yes
> +RestrictSUIDSGID=yes
> +SystemCallArchitectures=native
> +SystemCallErrorNumber=EPERM
> +SystemCallFilter=@system-service
>
>  [Install]
>  WantedBy=sysinit.target
> --
> 2.17.1
>
> 



-- 
Alex Kiernan

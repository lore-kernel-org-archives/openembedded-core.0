Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85357C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 11:18:29 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.5922.1644578308222808720
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 03:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=Ve888JbM;
 spf=pass (domain: burtonini.com, ip: 209.85.221.51,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f51.google.com with SMTP id d27so14646436wrc.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 03:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t3Q8GKSd1y1vVkD3fbnEbADeIK//RicP7Qutp+o3ep4=;
        b=Ve888JbMPPpPU7idZ3WGFXtUkiEXxjnIGqLWkIdgci1r6aJjCeNiImWwCOVCqs7WHw
         mw8ep8ULL3m3mY/Gk33dzra1dmI8zwuIWu2+MQLpU4pGNRa5GjaF+9TRI+T5DHbyfZPd
         sv+pP7ssRuK01OKYkNn6M3X64HEcXjN7T/RdaV3L8bpffkIAvs8Y/Fn5NNSSQSH8EBu0
         6iRiXstI22RvHWawB+us+8kX92XqBPVJhb1mJ3tNgPBs6jmWJHOlSXStslVByVnEa2bq
         Sd08eyvrtbZjHzYhep/0enu8M9TB8MJpGCREI5PEhFQSMfQacF+08zYfwgo+a/TJ8oYn
         nZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t3Q8GKSd1y1vVkD3fbnEbADeIK//RicP7Qutp+o3ep4=;
        b=hkpOJpxjjqCqTz6e5ATLJEEhfg7wE6C9OwVQv4C/P5ClRSLIKGLmH426BXawvu+MAY
         Kf6eGKB9osahVCN79ViODnypsODNr/QH+r7j8RyB2ZcEaXPWuHiJu/wrOsOY55mf7fyw
         8oK7LvSJ20gSXaOlI4NshgJc7cyu6q6/mkgojPGznRMjUtx+e8mQFUoAcJ7uDqikREnR
         5Jqe64sIdAw8Cfk64qu4IYJEtFiamXbt/JbjEzirX5DaiQ59kwYGK1Ivmb2Zp6ajdj/L
         LeQrwXI6T0zA6uTKDaNqxZil75U/9xM0pEMz0tlEeXGLYh9rGL4tbUZhOARXaQMt8QB6
         kTCg==
X-Gm-Message-State: AOAM532yISka80IgLZ2mQy4p4wQ3M7YcQVsURuNiwtGPlQhYNjnh3Znq
	31WmXyry9qG3xEhXCcXjf/X0X5ykoJ93KzasxpnA/w==
X-Google-Smtp-Source: 
 ABdhPJzNEqoguNmLla/sJzbJT+I+GDeqLj8o1kmwi4nFbZR1X8T/5vt1czO582n7cRVK6Iy6ZXEBA9lerc04T9ArcOw=
X-Received: by 2002:a5d:61cc:: with SMTP id q12mr963400wrv.497.1644578306413;
 Fri, 11 Feb 2022 03:18:26 -0800 (PST)
MIME-Version: 1.0
References: <20220211084433.10614-1-pavel@zhukoff.net>
In-Reply-To: <20220211084433.10614-1-pavel@zhukoff.net>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 11 Feb 2022 11:18:15 +0000
Message-ID: 
 <CAAnfSTsvaGZ2khtFLNdkqbMRK_Yx_CmOLtSj_Jt4PSJZOb970g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity.class: Add possibility to configure
 networking check
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 11:18:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161641

On Fri, 11 Feb 2022 at 08:44, Pavel Zhukov <pavel@zhukoff.net> wrote:
> +        for uri in test_uris:
> +            try:
> +                if check_all:
> +                    fetcher = bb.fetch2.Fetch(test_uris, data)
> +                else:
> +                    fetcher = bb.fetch2.Fetch([uri], data)
> +                fetcher.checkstatus()
> +                return retval

This seems like it's overcomplicating things to me.  example.com was
having uptime issues, and we can change it to www.yoctoproject.org so
that we know in advance of expected downtime, and have direct contact
with the people responsible for keeping it up. So let's just change
the URL to www.yoctoproject.org instead of adding more variables and
non-trivial logic.

Ross


Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B8EC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 17:40:23 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.404.1646847622299550566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=BrSlVpS6;
 spf=pass (domain: burtonini.com, ip: 209.85.221.46,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f46.google.com with SMTP id r6so3791872wrr.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DHdJoUNOHTTiSeY48EAU/uR5Lp99qBYlBAyI3H3CCvQ=;
        b=BrSlVpS6liPpzwss8SPi3mXwZyO3WXM1GJDKIFltUXqPvD9f9Et+aFlq35ssyun7DH
         8J3iyfPqyN7q8RZeS0PNXqeRLUEykDGhTgEMkt9FnmM99azJx2j/uVaU1Uc1eEM/lOSp
         JckvZDaU+4Ij5/C4FPsENXhYMNPLhc0dfW5iDJf5E7F4gLs+xPIgzhwQaJoMZPIjB58v
         l/3351HuYVyB2x5GtMqi/BjAfSDily4dK+HIGUrL6CVyLgA4G53VAlzERp7nRdozEt6N
         6YFvtCDgQWufCS7ABF0DpRoj9dgzAvjf1FIQ/viAOz+xFE+HSJfDUo7QfeFq9xD0GL9F
         FP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DHdJoUNOHTTiSeY48EAU/uR5Lp99qBYlBAyI3H3CCvQ=;
        b=NDD5kuqUk0v/0ivRPNwxlpbXRZEYjxGUBSls64j6IwmnshdQoyVn+Iqiqx6TlRI3WL
         3CHpaU6n7N67Ge/lWbFfe6LbdRxc72Ico4Xg4WDAhbMP7xk/tCHoYyk5bwAiGjGRyBDD
         HP+j31KnHtHu/P3Kg1nKQeul1uk6lk60GJCiv2OGseRlxRuY3MoRlh4XPjA1Od+Sr3gr
         C7Ql7ztGZVvj4wYnXAoQF/wsV2JXpO4TB1xPh5C0B/+LGzgw/u+tRrf5itGCNqr8vAM+
         FOkGvY8HzAhTgB94qnDJYXKHOrzXwG+8SVkS64+gZRBnnRU352CG0ikO7JCT9+Na7COn
         P6uA==
X-Gm-Message-State: AOAM530u5zamgNnOBNQWlCQsZsCQGXKzoKY7f/sP6cV+SQ8kQixoFqFn
	AJnLfhgdrvSaswEiny8mqtw9ReEzbURYvU2NZpPpWg==
X-Google-Smtp-Source: 
 ABdhPJzpiRMXpEbQE2ed9ujbbIAC74DayEkPb0oONDpl95gGcZNodr6StFixEYTEblhN5GhGZoq3nZArb+0u+RtPXQc=
X-Received: by 2002:adf:e74a:0:b0:1f0:25cb:3ad5 with SMTP id
 c10-20020adfe74a000000b001f025cb3ad5mr536271wrn.231.1646847620616; Wed, 09
 Mar 2022 09:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20220309150224.2661618-1-ross.burton@arm.com>
 <AM9PR09MB4642C97B03C03260CDB40D66A80A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTspNY6Davnnh1A+E3awnz4q4_=E2OdCZx_VbVZeLMtQLg@mail.gmail.com>
 <AM9PR09MB4642BB663E7CF8E1324DE136A80A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1spMok7M-7oFS0FN2SE1e2BzYaF00pccDr_2NDe1LQohFw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spMok7M-7oFS0FN2SE1e2BzYaF00pccDr_2NDe1LQohFw@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 9 Mar 2022 17:40:09 +0000
Message-ID: 
 <CAAnfSTtqGUqdKOsG5+vnCvqn1xnfJvBXNsh1j7u2UH3xD+hBCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pip_install_wheel: install wheel with a glob
To: Khem Raj <raj.khem@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 17:40:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162984

On Wed, 9 Mar 2022 at 17:20, Khem Raj <raj.khem@gmail.com> wrote:

> will install work if there are more than one .whl file expected ?
> I think we will get install failures, in that case it maybe just an
> over optimization

I confirmed with Python developers that a single project (ie a
pyproject.toml) will build a single wheel.  If a single recipe builds
multiple wheels then it's already doing funky things, and we can
revisit this then.

Ross


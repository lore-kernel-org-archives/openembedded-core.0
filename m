Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C9FC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 17:50:50 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.718.1645552249479392239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 09:50:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=lbHgH/A/;
 spf=pass (domain: burtonini.com, ip: 209.85.221.43,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f43.google.com with SMTP id f17so10028822wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 09:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aSl5vMCOBNK61qot+cSGz5/EZOiL0kJbYkG684Em1Vc=;
        b=lbHgH/A/MXEA+CAgvsKORbaxaMs4NzoINNvEajw/8AhfmcTXxZ0yhde7dJjQkauD8V
         YHRdhxG0klPms1nERyIGv1I0EQO7BJvEZm7kirWwirQQGW5vdq0eGZKMDvDwRMU6D2cw
         ktd7HAyLEKSxoXRuX54L49DuhNlOuOTA8FQsnal4dhkyvWgRv/UD2//ONJU+xRhE/vbr
         Qux+LdGWpHcJAzbbA4CKJkzoXSWEshc9C17LmRuVujmC9XNXD3lqrfL6V2dQ6uJG2o3H
         y0EcwedQHI2EJUV/ZgVpPuCTsRlpQeE/RHnYC2XVrDaKhNjITa8zo9nnrbNG/dg70Sq5
         XRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aSl5vMCOBNK61qot+cSGz5/EZOiL0kJbYkG684Em1Vc=;
        b=yUySZbWVvGfJC1z6TDYUVcXIGrHAmjmrCgaBNg4tlZk/hNSN/yWhooUikXUjeCsbDQ
         sR/WvmvAmEJVNew6yyEQofduNPJfek5CtpNAPpssl6Is9yjjWq0GM2vk/kctDKrD9lR/
         FsmyW5dJz46wrIeyPmrqWhCBS7F89pDVxKoYi7K4m5GWtb8DgRGIOMqx105npmQjvFFn
         Vo0UPIxJoty9H1Fj3TigP0l1X3zwlmCAz14hMU/lKUTO6/Nzrye2fwZpliUwapmcrWg2
         EY+fzfEpmdGrb3qt9LMmJE47b5u04llFnR5S23Zlm9dg25y1cAPJ7g+ud/YBz/JhhySl
         cqdA==
X-Gm-Message-State: AOAM531lcj4EiXRIoE2g5AixMH5Hf4DEe4tFLvE92/J2xzO/vRy5f+ya
	EdCN0fElEr9C6E8ReJgsAYqIGeQYwMXwG76lcgKjOg==
X-Google-Smtp-Source: 
 ABdhPJwGeOB+c3ZkuvV10HO1Ub/kWAv6I+2QZMc2/yf4ri9BReJswwBv27F9vylSJyQ170XckeOz7H8mdB9kW4XzP9k=
X-Received: by 2002:adf:9dc3:0:b0:1ed:9ecc:adc0 with SMTP id
 q3-20020adf9dc3000000b001ed9eccadc0mr436007wre.405.1645552247863; Tue, 22 Feb
 2022 09:50:47 -0800 (PST)
MIME-Version: 1.0
References: <16C7F41596656732.11018@lists.openembedded.org>
 <AM9PR09MB464246FE3202004DD91EB054A84D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CANp-EDbCpBLQ6t8SKwu9k50imsBM9oeOBBfuRXHdnKg3P=7SZQ@mail.gmail.com>
 <AM9PR09MB46422A261797175C38175112A83B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46422A261797175C38175112A83B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 22 Feb 2022 17:50:37 +0000
Message-ID: 
 <CAAnfSTvup472badm4syJMSu5z4VpkJVsMdVNHNouxyTR6iC3Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][RFC] cve-check: add lockfile to task
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 17:50:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162182

On Tue, 22 Feb 2022 at 17:01, Konrad Weihmann <kweihmann@outlook.com> wrote:
> This is somehow expected from my side tbh - as the lock file disables
> any kind of parallelism - so just one instance of cve-check-task can run
> at a time.
> One thing that came to my mind is to move the created CVE_CHECK-sqlite
> db into the recipe-sysroot before running the task (currently it resides
> in DL_DIR), so each task would run on its own copy of the db - that
> would avoid having multiple access call to the same file while enabling
> us to remove the arbitrary task lock.

Hang on - surely the cve_check tasks are read-only, so why do we need
to lock the database?

Ross


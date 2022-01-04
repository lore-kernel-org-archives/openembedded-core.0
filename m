Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A289BC433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 17:47:21 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.10381.1641318440531321939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 09:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EecHZS7Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id h1so24360694pls.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 09:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=vDeK1ARh0K7u4Mvml0qlD1/IlpjDZ6dcVT7OISGkU0s=;
        b=EecHZS7YUmRdn8Hxkyg+2A85rDymXzML4q+qSJQMOiV+CuvDDQeJA39vgD9GeNuSsH
         XxqR3nTODCqi8v8ABj96YCpM8sHhQWDPaaqgBJb7bE2+7H1stZL0QhM8/OJLrkt3cwcZ
         bBc55W9OaoL1KdOxftOYPPkY0rMWmkoPwTLsZoyFvvMO7LLcWaGgFkJI7fj6L9UG30tV
         yn4QlWpaRUPbX62uFxsppSVrCf4bJ3oFnF9sD3r1HJmTDKcSMxaXH2W1btM069x95FNJ
         MacdZtZXCwRnox3w8vWcs34lahgFig2CKESPOhk2OYxD/U1kX36lVJXZugvIO4QbEb5c
         Adjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=vDeK1ARh0K7u4Mvml0qlD1/IlpjDZ6dcVT7OISGkU0s=;
        b=6B9H+3glW3PEORlbgwT9SjqQkvTgbdI1ZtbMeotDqYoZZaqYfrcLkYkqPg4XfrzEEK
         e2TfHWklvJRQUtvRS/zsKhP9mn6G6n3tVm7picQhss5qC/7bHnTAh97c3p6PIVmyuCxM
         HsjUPi8J2oF3HSOosbPktuUTL/rRwfkGC5eREfNhaOE/9fa+vTTRxqWIiI464A+eGrNn
         oZa5jHTfFkItieNl2LvBSBre9k4OVHG4IXIL724PKlK6qWFTM74pcNRm8RiwrQqoLHZZ
         cChuaBRQc5THMGyAbAF3M5K9n/EarvJHmSPHi8dGoDoFHmhIcgwtKCklcrS69xVFPxFQ
         Fa6A==
X-Gm-Message-State: AOAM533kdenSGT2xYL+4Lz+uNMpMOWbXySzXZEgxvrot4oz5lPU7k37g
	d5SOuC9Md8XOoNgT2fOagAsAjgYelhlCYhJO7Xk2Ik3wonU=
X-Google-Smtp-Source: 
 ABdhPJyhfUchs8dUG+qJFBRnNVOvRgv23RPr55SeSqEBH7Cn3A57A5NXgTxnWaI0bJz6RKkqEsQtF8zvKuea1PD51Vo=
X-Received: by 2002:a17:90b:180a:: with SMTP id
 lw10mr61881338pjb.57.1641318439946;
 Tue, 04 Jan 2022 09:47:19 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 4 Jan 2022 18:47:08 +0100
Message-ID: 
 <CALbNGRR2505FQJDcO9ydqaiW==uM7O-RpdFJmKyWZbw=yqXfLw@mail.gmail.com>
Subject: do_prepare_recipe_sysroot takes >5min @100% CPU
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 17:47:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160170

Hi,

with relatively actual states of layers/bitbake I see huge delays in
my builds on tasks do_prepare_recipe_sysroot and sometimes or do_patch
- even if recipe does not have patches.

The time the tasks take is 5-10min and each of them load one CPU with
100%. Is this something others have noticed or even better: any hint
how to get over?

Cheers

Andreas


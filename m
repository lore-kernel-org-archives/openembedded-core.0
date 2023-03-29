Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BADC761AF
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 19:04:16 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.5951.1680116656013334634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 12:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lTOfvGzx;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id o20so14310716ljp.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 12:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680116654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4kYmNgtxp3gjsHvZgvePBhYUCU/ueDRLLUgJjLItYbo=;
        b=lTOfvGzx+yZL5AdkeaCfv+sGovR+TN2J72DdKsYeDj0BmyuL0YUaU8YHfpbYyUek8K
         F4ffPJLLmUbo3S4LnEZYTGWY3b7ou3N6khylDB9LJ0ajsYi5sa8MwjgP/opJJc8EgxRk
         dohTixR0gWHssYEtOpVZKS3JZEETTK0PgtiA23UK+/d3yJB2C3uNSO6V7WCeH5Y5znZ2
         tNhJl2MMzawynOuhb3xcq/wite+qLvyB1Yy0XHUz6AHMLzAi0Er1IblthfW9idnV4lba
         WCuVlXz+sKqtDx4/keAKvls5NwEGbzN6uckWqvqBcICEZGMxRZsE3cF30nd2I8JIW6tL
         /cMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680116654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kYmNgtxp3gjsHvZgvePBhYUCU/ueDRLLUgJjLItYbo=;
        b=hM9vXSnxrMLxp2ldCfltq/npiM0vOAajAkxwmidKCEKpnhaPPNr1C2HQhEyOKYAyS8
         1shjRsRMV94BHbX9gNu+mQ7PSDmvcdoyhQyHLBRG+kgIgfaXqRNwZQtD3JjexZDaTLpG
         Cm8ZaeeO6wdQ1zL/1wJes44xJsrDl07PsfeScAn7izBHKwnu9YjewjXGSXlf55+BL0wr
         nP7ye+YwP2B1jc2cEjlG0VPwjzmsBierbf2PnynWcYBT3dovlY5rm3f58kT2zsiTMOid
         f8Qdj66r/hM1dKwkQsfbQrPWbme4SQnQ7zoccsNIxmCD3qhFitXUINeEIG2hzhpB+DR5
         V3/Q==
X-Gm-Message-State: AAQBX9eV6pnlDoae+/VWIXtlJDH9MKDUSz4hJsvWANJw+nVmg9r3Lxzu
	9BVRPfgpOdo5SKk/yFYPiMSO5CRUXkrcbKGCCLs=
X-Google-Smtp-Source: AKy350ZzpHxMjl7F9CJNerFX6Gf6jx0ONVvgHEd02G13rRS0i6P6IQwUvUFsiblEwgt4CREUE0Mly3zKmbYi9lcCbzQ=
X-Received: by 2002:a2e:a0c7:0:b0:29a:4cf:4bec with SMTP id
 f7-20020a2ea0c7000000b0029a04cf4becmr6337363ljm.7.1680116654038; Wed, 29 Mar
 2023 12:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230328214351.3666478-1-raj.khem@gmail.com> <CANNYZj8zb4PnnhFUpPKsmcWRHJjjv7ATWzi61EU+YuaJrNLGvg@mail.gmail.com>
 <CAMKF1spkAdAHgzRzKwsL_i6_a9NqsnP4Wybsw5=2zkpOmTq8PA@mail.gmail.com>
In-Reply-To: <CAMKF1spkAdAHgzRzKwsL_i6_a9NqsnP4Wybsw5=2zkpOmTq8PA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Mar 2023 21:04:01 +0200
Message-ID: <CANNYZj8PNKJLz+r9XTUbEan2c-MY3db7iiNzxeOpA0-ATtLUBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Fix build on 32bit platforms without
 64bit atomics
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 19:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179295

On Wed, 29 Mar 2023 at 17:07, Khem Raj <raj.khem@gmail.com> wrote:
> > 32-bit specificity is not in itself inappropriate for upstream
> > submission, can you please either submit upstream or open a ticket and
> > refer to it in the patch?
>
> did you read the message trail on the gerrit review I added to commit ?

I did - upstream suggested a workaround that was submitted here (in an
already closed merge request), but they didn't definitively say
whether they would reject a ticket (or a patch) to solve the problem
properly, so I think it's worth to at least open a ticket.

Alex


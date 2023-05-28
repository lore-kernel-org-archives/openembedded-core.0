Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC72C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 15:16:38 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.30831.1685286989646479546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 08:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QvCLhXAE;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2af29b37bd7so25258181fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 08:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685286988; x=1687878988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ywlBbeROJyQHaOt6lG0OUq5Bq7+HFMzgOAkHUAITANM=;
        b=QvCLhXAEqyf7R2T3FreLNQDvmo2fJIWEdqzTm/cDmqHDwyv/Lj3c5M11RbhgZRGlFq
         40GiSlUbZ/9TPpRESrXn8KlMqLljpapho0t2zmxwhDmgMTQ0EQnWarJG4dnnrbl8/xtl
         Ppb/eb4e/xxGQmrX7T21fPKib21j1yoIaV2iKszvTKm6m6H9moe1Ie8p9ZqiXQduVE2H
         Mj2vyYyqK7+VJ0GwyVlzXDw0z0YwIrRuRDLq80B6cwxavNHV80hMtQToNxKMNmMgQk4c
         5pB9I5PsFrLAwmI7Nv73hwXwBtqeOsT84qypJY63DlyHRtEUis3OFb7OWrV/W06yj6vP
         vvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685286988; x=1687878988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywlBbeROJyQHaOt6lG0OUq5Bq7+HFMzgOAkHUAITANM=;
        b=HUVnsMdJmmOpM1oVj7zXmOQ8VePMvVReQi/7odQox3+5Pch6KsPGEnBEHZKd2WOvdC
         x9hSj0voJoX9E32kJC0cRDsYJ76PtOErdvXX0zugZbHZFvD1XYFxSHX5nmuGv2wucNlU
         cVI4HTiuCqiOTStRMKRcrj6ZnopN3gNxcjR6kF0oKUvu4lyvslWvL59F2d7Pt+0kQxNx
         5rb+iu5kQoSo7MWlERZhlBIU4ytVHqRBBfdMXN/3v9luv7UKXiiEx18vg5jVGNmZXJW+
         dxG2kfK70mGaGfEVBzSConvBvxEP4Qoxo5zZ+DafqKZwB7icP01DOwHW7BygeCjh9Mud
         m2VQ==
X-Gm-Message-State: AC+VfDyd5zrxjRrjBz/qqcE7v1fXzeiOyEf7iUjerSYy5er0oRKeFi0B
	ZpGzpqKYeGgfEu6ALm5eR1mCx0Z3jcgtrlC8eQk=
X-Google-Smtp-Source: ACHHUZ5f4wHmbr682o+FtJgV9WmZRBwtKFJfDwzIhd0FqtOpeghOOqT6H6LUkm+9rh1odvvbnXCxtv3Letf+fJ1Pi2Y=
X-Received: by 2002:a2e:960f:0:b0:2b0:47a3:51e3 with SMTP id
 v15-20020a2e960f000000b002b047a351e3mr3427652ljh.49.1685286987514; Sun, 28
 May 2023 08:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230527133252.284132-1-f_l_k@t-online.de> <20230527133252.284132-2-f_l_k@t-online.de>
 <17635252DFD4EDDE.6918@lists.openembedded.org> <CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
 <VDGDVR.YBUKQ953M2TP3@t-online.de> <CANNYZj_0ASF5ERsCgrB3W3qYgGJFwJzXn35cgc6ojQf0fi1Yxg@mail.gmail.com>
 <POIDVR.URDIMNIKV0SE3@t-online.de> <CANNYZj-megU_4p_eR84XiSt7YvwWu57tWBEZDKoBFkjRj8ZKVQ@mail.gmail.com>
 <MEJDVR.WDZW7MFB3W9N1@t-online.de>
In-Reply-To: <MEJDVR.WDZW7MFB3W9N1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 May 2023 17:16:16 +0200
Message-ID: <CANNYZj_-ptiJqvmf+cU0qV7VkKG0ds=guN9aTU1VirjcG8WjQA@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 15:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181834

Adding libxcrypt-native to DEPENDS definitely isn't correct, so you
could check why virtual/crypt dependency isn't working properly for
adding the needed headers into native variant's sysroot. If all fails,
adjust DEPENDS:append:class-native.

Alex

On Sun, 28 May 2023 at 17:08, Markus Volk <f_l_k@t-online.de> wrote:
>
> Am So, 28. Mai 2023 um 17:01:44 +0200 schrieb Alexander Kanavin <alex.kanavin@gmail.com>:
>
> Thanks, then all three recipes should add libxcrypt to DEPENDS
>
>
> But wouldn't that lead to multiple virtual/crypt providers on musl ?


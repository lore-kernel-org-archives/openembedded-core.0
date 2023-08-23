Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AC5C27C40
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 18:38:10 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.837.1692815880526757520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 11:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LMroh22m;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50043cf2e29so6649876e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 11:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692815879; x=1693420679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8r6aMr6FSOITw/BzqzyU6mrkx/H4+547hnai9RMTnhs=;
        b=LMroh22m72mRotdm23Kyw83eWbyVr7G5lFJajGvOZO1ShMjbtiO3XvlKFR87zpWozq
         1ESnOss1oPd2Ew/y84jhog3ztamu5Rdg9d1yxIp9PDDFM/D0adRnoCFELUgVLtNz3hWA
         VP0/X5PBK3YG8bUv9lWH+oylXWBwjs+3EsuUXWrPd4NcDGjiJpKDpPCwTyWxFBGuXyQ/
         10HcAe+9sEZsu28QMBo7Ar4L17QrgyFG9nWji/lZfnZ+/waWhykOa93NKk5VsZa5A5P9
         aLZ2QxMIirqyxOCAYXjFfgtzMz9FcSXByr2wSebkTCcxcAaJh9ls1A3JI9cs7Pi+5eq0
         taag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692815879; x=1693420679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8r6aMr6FSOITw/BzqzyU6mrkx/H4+547hnai9RMTnhs=;
        b=jZTgANxMbvbqXsgCwFkYn8aBY90CIlyZwBimUez3DYSEVFXTBKNJGlNkQrdyxmnSa6
         NANaxWQep97/FMrp8vSnkRrrnIOLpVb22xV7q8AZ9P6ZvhBj0ikZNUYki1YUEm1HY4yd
         L9yLoYw3MU/QEIp+L6ypvWIBSJHrN9k3oZaizaUszVumMRQfHrhEiLF+CQdLl7b3CwGX
         3H4fy8DpmyySIDf+ME/auOBUey+PA1utc+I4qUApjVXaldyFzp0zwSmKr0GKcOhRT/Oz
         2DBgmrugnD3tvHJrRLZyWloMGJLMdwEVeUDxJL04bCBOBP1d6kmBL4aDwpO0aO3NWmE0
         3WVA==
X-Gm-Message-State: AOJu0Yxd9Y9uwwfV5KiwXtuZm/wS72pt7FSlDPcMw4XRV1NStGPQa4TX
	ekE6jx0854ypfG9UebP6sW8iMipRDywwy1RxFDE=
X-Google-Smtp-Source: AGHT+IHeJy1xftgwpTstZ1X7kpPi041x0lEG1PVvtA2en5+3Z7FX37AYPmyTu3eh8CTpzQGud2K8ktFv2C0E0P3Ryb8=
X-Received: by 2002:a05:6512:2110:b0:4f8:6ac4:84 with SMTP id
 q16-20020a056512211000b004f86ac40084mr9060441lfr.8.1692815878395; Wed, 23 Aug
 2023 11:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org> <20230823061025.3952909-9-mikko.rapeli@linaro.org>
In-Reply-To: <20230823061025.3952909-9-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Aug 2023 20:37:47 +0200
Message-ID: <CANNYZj-FK42Y4+cZNg2uekOPipQDPAq8HmXn4r4zLSiUTq8DeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 9/9] oeqa selftest runtime_test.py: skip
 virgl_headless test if /dev/dri/renderD128 access fails
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 18:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186627

On Wed, 23 Aug 2023 at 08:10, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> If access to /dev/dri/renderD128 fails, then qemu with 3d graphics will
> fail to start and errors are rather cryptic like:
>
> qemu-system-x86_64: egl: render node init failed
>
> To fix this, users likely need to
>
>  * modprobe vgem
>  * add their user to "render" group to write to /dev/dri/renderD128
>
> If access is not available due to missing HW, driver or failing access,
> then skip the test:

This should be a failure rather than a skip. Otherwise, autobuilder
testing will silently regress and no one will notice. The error
message should include information from IOError as well so that it's
clear that the issue is device file permissions.

Alex


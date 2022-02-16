Return-Path: <dlsitzer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE25C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 13:57:22 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.11882.1645019841556934100
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 05:57:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iioZ6pHQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: dlsitzer@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id q17so4086529edd.4
        for <Openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 05:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=foEXcJfuSfy81d4rjp3gB1TzMJR9J+7ugWtxVOdf584=;
        b=iioZ6pHQ1dEGys+DVP1j+5+KDkwv9bDiKWiO7Bt4Zc9w/fukJh/Y/qpeq3VX1Fs7SJ
         DA+9zLLQZpuwvAFD6l3SCEoCN0yleb7t9k8/A1Ivvw+ci5dkCy2f21Py8saF5UcMgJ+w
         EoPI7umkoM/B5CwgbtxrpQkNtnN8hGchEPFyhMHOsfC+3Y6uQ2SoJRiXEPrT6sv5j8ra
         8rsUa7FpLwIrAwKVXEUMJCJmUAqCwzEqEzukHX1QfAzNUeT7JTqMdthbAKijOO1d17Gr
         F8nXWzuVEYlX7EvAJSYz6f1jvei3qaqpwLOZ4iaPpWWaB0C2Jm5YMsMQioDWOMnFgOvK
         hPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=foEXcJfuSfy81d4rjp3gB1TzMJR9J+7ugWtxVOdf584=;
        b=AF2q8/NQdyd2XN6r0AFrGY34/w+uwsgDF8ev9Gv0J9y9dqYidDKqhb7VsIL9zVDI/d
         SvXvfXejgLcyJspmzzCxfM3ox9YCnrbrJtBg9P3TkbHxn0LEEJ4DjQIL8P2hN9R/LXMd
         /kCDpRfXI0L0rjxfYPgGfHPEsAn/NL4LQUNSmUNG4oKT3idIrJgWVNDshS/T8n5cDrdu
         fcSNg2eesUuOVzYkoby4W0uLI/9o8GGwfPBKVHJSTzcPCAJh7Dxeeyq1VHHjoadDwl5n
         Lna4L2ga383fX4MU2VouJPO4YoOPZCx7gdfLElFWIq3tzip3OVvSx3bEGwAjDjpCaBnB
         TXiA==
X-Gm-Message-State: AOAM533CbzcBrBU2SRvRuK7Naow/MPMNfXzw0sZqckue8eZr1OvMWedP
	AAcjG1ZymSGwrNCW6FnlI7AE9hHJcNbJASFJouEnrbYfesc=
X-Google-Smtp-Source: 
 ABdhPJyZHMwuAPddfMyruPMTDkPq90M4X+J2Uhlq5iox2GklUtGkpqGcalt5zDrHvFCpSg46y5QqHGS+0EZzHCYW4Bo=
X-Received: by 2002:a05:6402:1910:b0:410:8060:e4a8 with SMTP id
 e16-20020a056402191000b004108060e4a8mr3118855edz.221.1645019839514; Wed, 16
 Feb 2022 05:57:19 -0800 (PST)
MIME-Version: 1.0
From: Laszlo Sitzer <dlsitzer@gmail.com>
Date: Wed, 16 Feb 2022 14:57:08 +0100
Message-ID: 
 <CAFiv7xF9fTYmD=DMFpj8D2xjBVP_a899zugaK9Xsk+OVQhFmvQ@mail.gmail.com>
Subject: [wic] non-rootfs partition content owned by build-user
To: Openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 13:57:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161777

Hello,

I discovered that when building a wic image with /home on an extra
partition, the contents will be owned by the user running the build.

The problem persists with the master branch of poky.
Last known version to still work was dunfell-23.0.5

Steps to reproduce the issue:

1. git clone it://git.yoctoproject.org/poky (yes, it is on the master branch!)
2. create a build environment
3. add IMAGE_FSTYPES += "wic wic.bmap" to your local.conf
4. adjust  scripts/lib/wic/canned-wks/common.wks.inc like below to
create a /home partition

>>>
# This file is included into 3 canned wks files from this directory
part /boot --source bootimg-pcbios --ondisk sda --label boot --active
--align 1024
part / --source rootfs --use-uuid --fstype=ext4 --label platform
--align 1024 --exclude home
part /home --source rootfs --rootfs-dir ${IMAGE_ROOTFS}/home
--use-uuid --fstype=ext4 --label home --align 1024
>>>

5. run bitbake core-image-minimal
6. flash wic image to a USB drive
7. check contents of /home on USB drive

Would be amazing if anyone familiar with WIC and pseudo could
recommend how to proceed.

Best,

Lazlo


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEF7C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 08:42:09 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.124014.1683016923066129311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 01:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PkKtJLoY;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4ec8eca56cfso4240990e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683016921; x=1685608921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=piTImIYk7JdkiUWaBqb9ZZZKiN3bbETY9vqrptd3clQ=;
        b=PkKtJLoYRbTFPaVuzRZedOeUw636KhWSAUYUk11UIO5diLiwGvg7H5JEm87RzaywtL
         po9i4MqKBd81ocEPhfR5qnhnJERWW8yBMLqdZ25rhtu/wJe/+fR91DowLbmNJpD5AzoD
         WnMpx/Ei1MvaalGGVBcfNXEsakkpFoZ+uLaaY8zDmMJQaiolu8TBGH5ApMDWwbAoU7c7
         2Y5bMbtXR1qXz0eHJmaBhuT3gOOxFV3wIdCefJeddRHZaDavIEh2u7a/jLN+knS9ksMu
         GDJqYS6NfFjdq+dEFh2Z4Dxh9HHX4EPCHb1mzUPxk3j/mYsid2RNRh95V1VJIGlNbIhe
         C9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683016921; x=1685608921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piTImIYk7JdkiUWaBqb9ZZZKiN3bbETY9vqrptd3clQ=;
        b=cS8oQaaPqpU16Kj7kPXQdo69bGzkYbFGtmJdkJL+d0sGV/9n9KEJa0yMwNwZEL0vT/
         eUUN/28tY/w4SF3l1Mb8hxqiFeuRm8ayYlCC27lpFE/OttPpFqMf0GKB/MVGp+mkc9QO
         kYvl95vCHV4vWsXZ4CdNvsyhgp3yAXiqG6kB8mlufslUw7EpKh3HL09YyVBnzwZUK21U
         3iMpVQsnzMutIlX/PRor8RvZbM/b5ibnQBy9+TqdQMmE2upvLei9IyCj5p1D+wf10Xjb
         PoXfTb2t5hsLn+m2KJmbDMXb/6H5dTZOe0icrnPrtTEIdWRv7/wmN+QXd5ReV77CztUj
         CyHw==
X-Gm-Message-State: AC+VfDxbnroa8rZs4PXRcpijaZbZULmXoqgy+B9zBrrbhO2Yqgm45WnF
	DRQ5/51qygk6PaASW+MgslkbZYxvRBvcla/5J0c=
X-Google-Smtp-Source: ACHHUZ6AggCITz5YxVjcHLt5H+ebK1Tdu1ZyQBVmXBV2SHn0c/2FlGDi1I5oxxvYuUR3B/NZUBW8Uue06wKh6mMa3VA=
X-Received: by 2002:a05:6512:38aa:b0:4de:f9af:475a with SMTP id
 o10-20020a05651238aa00b004def9af475amr4082037lft.6.1683016920742; Tue, 02 May
 2023 01:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
 <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
 <CAMKF1soV_hmE+f7ed0r=jo+rQcWyJ4SU1vG3T2YGAqZQsgReWw@mail.gmail.com>
 <CANNYZj9X+dTmBN=5WQdA9af5E7m+Ov9vO=bOjR0p=BeBADMEAg@mail.gmail.com> <CAMKF1sq=YOzoqyRzn1bhRwxqWSMV1SnzRKNDutBDiKqw+PjhXw@mail.gmail.com>
In-Reply-To: <CAMKF1sq=YOzoqyRzn1bhRwxqWSMV1SnzRKNDutBDiKqw+PjhXw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 May 2023 10:41:49 +0200
Message-ID: <CANNYZj-Kt+JMU1BfhqDnFv_S28=-K8ozPFP=3NBPwOYL-PZQ_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required kernel
 to 5.15
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 08:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180715

On Sat, 29 Apr 2023 at 21:28, Khem Raj <raj.khem@gmail.com> wrote:
> I am also seing some segfaults in qemu usermode runs
>
> | /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/16.0.1-r0/qemuwrapper:
> line 2: 1592564 Segmentation fault      (core dumped) PSEUDO_UNLOAD=1
> qemu-x86_64 -r 5.15 -cpu core2duo -L
> /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/16.0.1-r0/recipe-sysroot
> -E LD_LIBRARY_PATH=/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/16.0.1-r0/recipe-sysroot/usr/lib:/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/16.0.1-r0/recipe-sysroot/usr/lib
> "$@"
>
> this happens when building libclc from meta-clang

Does not reproduce here (qemux86-64/poky/musl/gcc/meta-clang master).

> I also saw random build failures in qtbase which is perhaps unrelated
> but could be this one too

This needs to be investigated on your side.

> Third issue is https://errors.yoctoproject.org/Errors/Details/701889/

This is from a misconfigured CI on your side and the error is

"clang-16: error: unable to execute command: Segmentation fault (core dumped)
clang-16: error: linker command failed due to signal (use -v to see invocation)"

which may be unrelated. Is it still happening, and is it going away if
this patchset is removed?

Alex


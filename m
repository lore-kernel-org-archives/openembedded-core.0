Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BC4C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 14:29:35 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.28282.1653316173864291378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gA5+Wa4+;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id w14so25843933lfl.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2hd1OVMj1pUVLZxU40bRy+v4eV7xxi4ycyma9SHXyjo=;
        b=gA5+Wa4+yQ12Q4hAoULAY19tXOQGMDGW/ySXN7pCHmjAVvHaGmwXLaushX2wKDI9Yp
         JMYXI6QUMaEDzTZ7ZGVt/Hc/bMqqy9oVHbJJIEp3v08nFPe3FLTNKmm3/utvTuYQPho6
         r8TfsUyMlOr/CxyAmLcpTEa5smxoKVGwTxLH1/PPj/ytECSyft2C+xDR8V4JpJ+DBCXe
         Gy707/AqvBbjJX7yuAD+mF05khQJIkFU8iHH4rSxs0r8KUWRBY941fPc76Zo/LMybZPu
         10FF2BShU/KWz4df5jY9AHAq37g38ltZtgckDYmpokwHLZeK25D8pL9OW1UhlQ5VcrC2
         GGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2hd1OVMj1pUVLZxU40bRy+v4eV7xxi4ycyma9SHXyjo=;
        b=PNTQdlJog/oJXeaOtesAyVdbGaiFsOGcPuPkUi2BHAvFpwIFQ6XUOo3FmVBufChqRe
         k/EJ2R0yt8qBHH7X+55pKHELoZ8hYONOmxV6rahfwh/1reOH0UESilzL+K2jDG+TbpIN
         JpvfCOUCo8Z4/HdBguBUseVp692nLONGcZWmh4ti/idpqwW+xBasF+WL20Qs2cN5ciM9
         C2LrjG4yH49Mke3WpTiPkAhQPFhJN0B+nlhn9eFSWEfACTmgFTnxW5FoTcN50cHgQLqZ
         sM88TJnhgnSN5pARFHVXCwNgIcZDRcFyJ7qialsQdu7knemyG0D1/eB0TOR+Fai4lWuh
         oUPQ==
X-Gm-Message-State: AOAM532uFGkFkUi442QWugdtPJ4EFvznYeV9pXntAky8xzFM10/TxLFr
	nw0VUsFYany0vweckWqb2l7g8ssO8NEijuEdi4muH0gNLYE=
X-Google-Smtp-Source: 
 ABdhPJx8hsXwWgkdXP1t2TaOkP5QCo7Bm/3R2hgwouQAAszoLOUhOUXX+fp3MQgxLJ+45o1I9jAQlN9ZBDLQDZGcBOg=
X-Received: by 2002:a19:e203:0:b0:477:c1bc:452 with SMTP id
 z3-20020a19e203000000b00477c1bc0452mr16389452lfg.534.1653316171812; Mon, 23
 May 2022 07:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220523133419.2216713-1-jiaqing.zhao@linux.intel.com>
 <CANNYZj-Mvf2vCdMQipyhPxnfBxB-rLniGBhckkj8ELOc+ZvLQA@mail.gmail.com>
 <37b2c6e6-6f5a-ea40-2349-b03f1d5599d1@linux.intel.com>
In-Reply-To: <37b2c6e6-6f5a-ea40-2349-b03f1d5599d1@linux.intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 May 2022 16:29:20 +0200
Message-ID: 
 <CANNYZj-L5jLi-sTpPB=XEFujhzFCYb8YVbrxYzoabQCSPNKZiQ@mail.gmail.com>
Subject: Re: [oe-core] [PATCH] systemd: Correct
 0001-pass-correct-parameters-to-getdents64.patch
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 14:29:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166034

I guess so, please do.

Alex

On Mon, 23 May 2022 at 16:21, Jiaqing Zhao <jiaqing.zhao@linux.intel.com> wrote:
>
> It's an musl-specific issue I believe.
>
> man page defines it as [1]
>         ssize_t getdents64(int fd, void *dirp, size_t count)
>
> But in musl, it's an alias of getdents [2]
>         int getdents(int fd, struct dirent *buf, size_t len)
>
> Shall we report to musl instead of systemd?
>
> [1] https://man7.org/linux/man-pages/man2/getdents.2.html
> [2] https://elixir.bootlin.com/musl/v1.2.3/source/src/linux/getdents.c
>
> On 2022-05-23 21:59, Alexander Kanavin wrote:
> > Inappropriate still means the issue needs to be reported to upstream,
> > can you do this please?
> >
> > Alex
> >
> > On Mon, 23 May 2022 at 15:34, Jiaqing Zhao <jiaqing.zhao@linux.intel.com> wrote:
> >>
> >> Current patch removes the uint8_t* cast in src/basic/recurse-dir.c:57
> >> to fix musl build, but it changes the value here as pointer arithmetic
> >> is type-depended in C. This patch corrects the behavior by adding an
> >> extra cast to struct dirent*.
> >>
> >> Also changes the patch's Upstream-Status to Inappropriate as it's musl-
> >> specific.
> >>
> >> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> >> ---
> >>  ...0001-pass-correct-parameters-to-getdents64.patch | 13 ++++++++-----
> >>  1 file changed, 8 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
> >> index 028f50b243..9ebff9825a 100644
> >> --- a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
> >> +++ b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
> >> @@ -1,4 +1,4 @@
> >> -From 8c8899b4641125cfe8e7baee32e5c5f452545d2c Mon Sep 17 00:00:00 2001
> >> +From dab02796780f00d689cc1c7a0ba81abe7c5f28d0 Mon Sep 17 00:00:00 2001
> >>  From: Khem Raj <raj.khem@gmail.com>
> >>  Date: Fri, 21 Jan 2022 15:15:11 -0800
> >>  Subject: [PATCH] pass correct parameters to getdents64
> >> @@ -12,16 +12,16 @@ Fixes
> >>          n = getdents64(fd, &buffer, sizeof(buffer));
> >>                             ^~~~~~~
> >>
> >> -Upstream-Status: Pending
> >> +Upstream-Status: Inappropriate [musl specific]
> >>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> -
> >> +Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> >>  ---
> >>   src/basic/recurse-dir.c | 2 +-
> >>   src/basic/stat-util.c   | 2 +-
> >>   2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >>  diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
> >> -index efa1797b7b..797285e3be 100644
> >> +index efa1797b7b..03ff10ebe9 100644
> >>  --- a/src/basic/recurse-dir.c
> >>  +++ b/src/basic/recurse-dir.c
> >>  @@ -54,7 +54,7 @@ int readdir_all(int dir_fd,
> >> @@ -29,7 +29,7 @@ index efa1797b7b..797285e3be 100644
> >>                   assert(bs > de->buffer_size);
> >>
> >>  -                n = getdents64(dir_fd, (uint8_t*) de->buffer + de->buffer_size, bs - de->buffer_size);
> >> -+                n = getdents64(dir_fd, de->buffer + de->buffer_size, bs - de->buffer_size);
> >> ++                n = getdents64(dir_fd, (struct dirent*)((uint8_t*) de->buffer + de->buffer_size), bs - de->buffer_size);
> >>                   if (n < 0)
> >>                           return -errno;
> >>                   if (n == 0)
> >> @@ -46,3 +46,6 @@ index c2269844f8..7cd6c7fa42 100644
> >>           if (n < 0)
> >>                   return -errno;
> >>
> >> +--
> >> +2.34.1
> >> +
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >>
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#166023): https://lists.openembedded.org/g/openembedded-core/message/166023
> >> Mute This Topic: https://lists.openembedded.org/mt/91288052/6787970
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jiaqing.zhao@linux.intel.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>


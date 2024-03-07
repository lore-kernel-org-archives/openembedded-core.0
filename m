Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B25FC54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 23:13:53 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.8130.1709853228286067765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 15:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h3F8i9IP;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-29b95c02ea2so226569a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709853228; x=1710458028; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tH43LhRoGourbEqq/hDYq9FzE857IfTnqy3aXaInHSM=;
        b=h3F8i9IPZZ4QswgRnidYNrj4S8Y2kQ+SNXYyDvrWabSVbbwc6l5RWkNSnH2aP3cUjz
         0/2Wbdst2ynundamBKvUlCO/PXfbC4RqygmLS7SdKdSqftmIQSEN9SQHOeOPchetN3Qr
         x3YFDk71u6aExa7D8HQlBZ2NTnSpx8cu6XH3YrnW5qPWMbv+uWIWpbHDfdUTVwzWQZvw
         EH+YpqDJ0DEZk65UCHiIgbU5BTKbBINYWRJmgZeYk7S/e2VbMVdIC4Q4mHiy6wuuhKqf
         /zN7SFixqYLyL2EesUPQVa0lOFbFRNMblITaqK3o2QTQRjGtdEarjOVGakFJjsglF1eR
         jgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709853228; x=1710458028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tH43LhRoGourbEqq/hDYq9FzE857IfTnqy3aXaInHSM=;
        b=taVM6YOHknVz+pE2s6N5dW7040c3WginwSPiYHwSVeW1YbXCM3uV90xMDgKo0TePCD
         PHSrapTC0UDYur2QHracaUbXUuVUBw9E3WsEn5s4boV0hPoR6knMDctMUZ4e7xKIlOiE
         EqZFw1tF82uJRXH96KwCBsVahA6AxK5mYs1Scajh3x8IP1b1NI1AqmyyJeROHO9ovbTd
         J9JWw+0sux8PFsrUL/p7zTf0SLrJC1mLkLOaho/dSGWo4q2FsSkA9ZQns4d61rYTeWPp
         KplAA/dZ8JK3qYM2sM+MsKwhFTJjjlXyYej+wpTfV6Ldp8LXSzFSBKHU8NrnwLAa+/9V
         vikQ==
X-Gm-Message-State: AOJu0YyiAqDzwBsrRc8RUOz2Hn5RnLBXYUQVpJPLrbSsmHexjzRzsyIP
	tEzKfFcUMHw/S+7Hh672yxdWQw434uO6ii/RE4zbmRSMTxa0Oa48KtWHkF0fa1iqlOks1+Daato
	ePLQYFpHnsY+Ke4cPw/aQF79eXUE=
X-Google-Smtp-Source: AGHT+IEqOoehm5ynaBvJqaIavFNCtY/Mgrxvth5Lis9GF8ih30DNbiip+iLujtfcgShR5olSnIFoGWbtUsbw+DQYD40=
X-Received: by 2002:a17:90a:8046:b0:29a:7efc:4720 with SMTP id
 e6-20020a17090a804600b0029a7efc4720mr16884837pjw.31.1709853227513; Thu, 07
 Mar 2024 15:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20240307193409.987235-1-bruce.ashfield@gmail.com> <CAOSpxdaskMSouQhV_FmfS==CnfQ5zikQQ4QwwA3RzqtM6dzrLg@mail.gmail.com>
In-Reply-To: <CAOSpxdaskMSouQhV_FmfS==CnfQ5zikQQ4QwwA3RzqtM6dzrLg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 7 Mar 2024 18:13:35 -0500
Message-ID: <CADkTA4NM7zk6kpWe3BENz2a4Fjqwkx+ECqbu6tvsoktHWC45RA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
To: Steve Sakoman <steve@sakoman.com>, Kevin Hao <haokexin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 23:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196826

Adding Kevin,

I'm not going to be able to debug this more for a week or so.

The alternate ways to fix it would be to try that ubuntu patch (fixed
for our tree), and / or see what else needs
to be cherry picked to -stable to fix util-linux. It is likely just a
return code difference to userspace when
resizing is being done.

Kevin: I'm not sure if Wind River is seeing this, but you might want to loo=
k
into those ptests and see if they pass on your end.

Bruce

On Thu, Mar 7, 2024 at 6:05=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:
>
> Hi Bruce,
>
> This patch seems to fix the parted ptest problems, but now util-linux
> ptest is failing :-(
>
> Also seems to be partition resize related:
>
> AssertionError: Failed ptests:
> {'util-linux': ['fdisk:_gpt-resize']}
>
> Steve
>
> On Thu, Mar 7, 2024 at 9:34=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gma=
il.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  ...partitions-if-GD_SUPPRESS_PART_SCAN-.patch | 43 +++++++++
> >  ...-support-partitions-without-scanning.patch | 87 +++++++++++++++++++
> >  meta/recipes-kernel/linux/linux-yocto_5.15.bb |  4 +
> >  3 files changed, 134 insertions(+)
> >  create mode 100644 meta/recipes-kernel/linux/files/0001-block-don-t-ad=
d-partitions-if-GD_SUPPRESS_PART_SCAN-.patch
> >  create mode 100644 meta/recipes-kernel/linux/files/0001-block-loop-sup=
port-partitions-without-scanning.patch
> >
> > diff --git a/meta/recipes-kernel/linux/files/0001-block-don-t-add-parti=
tions-if-GD_SUPPRESS_PART_SCAN-.patch b/meta/recipes-kernel/linux/files/000=
1-block-don-t-add-partitions-if-GD_SUPPRESS_PART_SCAN-.patch
> > new file mode 100644
> > index 0000000000..cde4f317e9
> > --- /dev/null
> > +++ b/meta/recipes-kernel/linux/files/0001-block-don-t-add-partitions-i=
f-GD_SUPPRESS_PART_SCAN-.patch
> > @@ -0,0 +1,43 @@
> > +From 748008e1da926a814cc0a054c81ca614408b1b0c Mon Sep 17 00:00:00 2001
> > +From: Ming Lei <ming.lei@redhat.com>
> > +Date: Tue, 23 Aug 2022 18:38:19 +0800
> > +Subject: [PATCH] block: don't add partitions if GD_SUPPRESS_PART_SCAN =
is set
> > +
> > +Commit b9684a71fca7 ("block, loop: support partitions without scanning=
")
> > +adds GD_SUPPRESS_PART_SCAN for replacing part function of
> > +GENHD_FL_NO_PART. But looks blk_add_partitions() is missed, since
> > +loop doesn't want to add partitions if GENHD_FL_NO_PART was set.
> > +And it causes regression on libblockdev (as called from udisks) which
> > +operates with the LO_FLAGS_PARTSCAN.
> > +
> > +Fixes the issue by not adding partitions if GD_SUPPRESS_PART_SCAN is
> > +set.
> > +
> > +Upstream-Status: Backport [748008e1da926a814cc0a054c81ca614408b1b0c]
> > +
> > +Fixes: b9684a71fca7 ("block, loop: support partitions without scanning=
")
> > +Signed-off-by: Ming Lei <ming.lei@redhat.com>
> > +Reviewed-by: Christoph Hellwig <hch@lst.de>
> > +Link: https://lore.kernel.org/r/20220823103819.395776-1-ming.lei@redha=
t.com
> > +Signed-off-by: Jens Axboe <axboe@kernel.dk>
> > +---
> > + block/partitions/core.c | 3 +++
> > + 1 file changed, 3 insertions(+)
> > +
> > +diff --git a/block/partitions/core.c b/block/partitions/core.c
> > +index fc1d70384825..b8112f52d388 100644
> > +--- a/block/partitions/core.c
> > ++++ b/block/partitions/core.c
> > +@@ -596,6 +596,9 @@ static int blk_add_partitions(struct gendisk *disk=
)
> > +       if (disk->flags & GENHD_FL_NO_PART)
> > +               return 0;
> > +
> > ++      if (test_bit(GD_SUPPRESS_PART_SCAN, &disk->state))
> > ++              return 0;
> > ++
> > +       state =3D check_partition(disk);
> > +       if (!state)
> > +               return 0;
> > +--
> > +2.39.2
> > +
> > diff --git a/meta/recipes-kernel/linux/files/0001-block-loop-support-pa=
rtitions-without-scanning.patch b/meta/recipes-kernel/linux/files/0001-bloc=
k-loop-support-partitions-without-scanning.patch
> > new file mode 100644
> > index 0000000000..9522c2d2cc
> > --- /dev/null
> > +++ b/meta/recipes-kernel/linux/files/0001-block-loop-support-partition=
s-without-scanning.patch
> > @@ -0,0 +1,87 @@
> > +From ea6bf87558eb534ded532cfa622b575c1f39e3d6 Mon Sep 17 00:00:00 2001
> > +From: Christoph Hellwig <hch@lst.de>
> > +Date: Fri, 27 May 2022 07:58:06 +0200
> > +Subject: [PATCH] block, loop: support partitions without scanning
> > +
> > +Historically we did distinguish between a flag that surpressed partiti=
on
> > +scanning, and a combinations of the minors variable and another flag i=
f
> > +any partitions were supported.  This was generally confusing and doesn=
't
> > +make much sense, but some corner case uses of the loop driver actually
> > +do want to support manually added partitions on a device that does not
> > +actively scan for partitions.  To make things worsee the loop driver
> > +also wants to dynamically toggle the scanning for partitions on a live
> > +gendisk, which makes the disk->flags updates non-atomic.
> > +
> > +Introduce a new GD_SUPPRESS_PART_SCAN bit in disk->state that disables
> > +just scanning for partitions, and toggle that instead of GENHD_FL_NO_P=
ART
> > +in the loop driver.
> > +
> > +Upstream-Status: Backport [b9684a71fca793213378dd410cd11675d973eaa1]
> > +
> > +Fixes: 1ebe2e5f9d68 ("block: remove GENHD_FL_EXT_DEVT")
> > +Reported-by: Ming Lei <ming.lei@redhat.com>
> > +Signed-off-by: Christoph Hellwig <hch@lst.de>
> > +Reviewed-by: Ming Lei <ming.lei@redhat.com>
> > +Link: https://lore.kernel.org/r/20220527055806.1972352-1-hch@lst.de
> > +Signed-off-by: Jens Axboe <axboe@kernel.dk>
> > +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > +---
> > + drivers/block/loop.c   | 8 ++++----
> > + include/linux/blkdev.h | 1 +
> > + 2 files changed, 5 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> > +index 4769caab9ff9..a76302450c46 100644
> > +--- a/drivers/block/loop.c
> > ++++ b/drivers/block/loop.c
> > +@@ -1332,7 +1332,7 @@ static int loop_configure(struct loop_device *lo=
, fmode_t mode,
> > +               lo->lo_flags |=3D LO_FLAGS_PARTSCAN;
> > +       partscan =3D lo->lo_flags & LO_FLAGS_PARTSCAN;
> > +       if (partscan)
> > +-              lo->lo_disk->flags &=3D ~GENHD_FL_NO_PART;
> > ++              clear_bit(GD_SUPPRESS_PART_SCAN, &lo->lo_disk->state);
> > +
> > +       /* enable and uncork uevent now that we are done */
> > +       dev_set_uevent_suppress(disk_to_dev(lo->lo_disk), 0);
> > +@@ -1481,7 +1481,7 @@ static int __loop_clr_fd(struct loop_device *lo,=
 bool release)
> > +       mutex_lock(&lo->lo_mutex);
> > +       lo->lo_flags =3D 0;
> > +       if (!part_shift)
> > +-              lo->lo_disk->flags |=3D GENHD_FL_NO_PART;
> > ++              set_bit(GD_SUPPRESS_PART_SCAN, &lo->lo_disk->state);
> > +       lo->lo_state =3D Lo_unbound;
> > +       mutex_unlock(&lo->lo_mutex);
> > +
> > +@@ -1598,7 +1598,7 @@ loop_set_status(struct loop_device *lo, const st=
ruct loop_info64 *info)
> > +
> > +       if (!err && (lo->lo_flags & LO_FLAGS_PARTSCAN) &&
> > +            !(prev_lo_flags & LO_FLAGS_PARTSCAN)) {
> > +-              lo->lo_disk->flags &=3D ~GENHD_FL_NO_PART;
> > ++              clear_bit(GD_SUPPRESS_PART_SCAN, &lo->lo_disk->state);
> > +               partscan =3D true;
> > +       }
> > + out_unlock:
> > +@@ -2428,7 +2428,7 @@ static int loop_add(int i)
> > +        * userspace tools. Parameters like this in general should be a=
voided.
> > +        */
> > +       if (!part_shift)
> > +-              disk->flags |=3D GENHD_FL_NO_PART;
> > ++              set_bit(GD_SUPPRESS_PART_SCAN, &disk->state);
> > +       disk->flags |=3D GENHD_FL_EXT_DEVT;
> > +       atomic_set(&lo->lo_refcnt, 0);
> > +       mutex_init(&lo->lo_mutex);
> > +diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> > +index 905844172cfd..15815f1ced9e 100644
> > +--- a/include/linux/blkdev.h
> > ++++ b/include/linux/blkdev.h
> > +@@ -813,6 +813,7 @@ static inline unsigned int blk_queue_depth(struct =
request_queue *q)
> > +  */
> > + #define BLK_DEFAULT_SG_TIMEOUT        (60 * HZ)
> > + #define BLK_MIN_SG_TIMEOUT    (7 * HZ)
> > ++#define GD_SUPPRESS_PART_SCAN         5
> > +
> > + struct rq_map_data {
> > +       struct page **pages;
> > +--
> > +2.39.2
> > +
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recip=
es-kernel/linux/linux-yocto_5.15.bb
> > index 1c6b3d1112..17d36524f7 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > @@ -38,6 +38,10 @@ KBRANCH:class-devupstream =3D "v5.15/base"
> >  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine=
;branch=3D${KBRANCH}; \
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;=
name=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA}"
> >
> > +SRC_URI +=3D "file://0001-block-don-t-add-partitions-if-GD_SUPPRESS_PA=
RT_SCAN-.patch"
> > +SRC_URI +=3D "file://0001-block-loop-support-partitions-without-scanni=
ng.patch"
> > +
> > +
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedc=
d7e46"
> >  LINUX_VERSION ?=3D "5.15.149"
> >
> > --
> > 2.39.2
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196825): https://lists.openembedded.org/g/openembedde=
d-core/message/196825
> Mute This Topic: https://lists.openembedded.org/mt/104794844/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


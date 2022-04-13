Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1578C4707E
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.1441.1649871436688914348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xb7Imse1;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id b15so3296897edn.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VXdnyliq98o1MK/kbfIXT4YbR8vK27fOePGeXM/hWzM=;
        b=xb7Imse1rkWRPaMNnUjh6lSoYGhcBaK9fydeujA8wbUkscNULJAw2SxOznnET4QhX6
         ojZwBaRu10brI5b7Ehms6WDTxYeZpluQ3v+70yW6WBs203sfsOk3t+rWnQz4dJrYZoBQ
         g2NjpJBBa5LtBJSMcjaRMpxCEl9S6PSrwTfa4IN+/uUJwbdnkWdWr6mBMTwlcDdu1++n
         5Wk3Igro/8K8UCucoPktYtnIq8IcKNwsKi4rSSEQPcd/GmIRD+5A3VTFlUSnGE2/rj7V
         v0Pb2MPXJUs91BtDpKXTiM2Y6v1uIg4jMAW1tiEMNgDEo1fUEGMhX6b5H2JuAFvwOvaT
         S03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VXdnyliq98o1MK/kbfIXT4YbR8vK27fOePGeXM/hWzM=;
        b=phiJ4dY1iqDeNNFZnfa4SDBUWvSQfIxJPdsmmIA19mbd6KRRJCRfTBA7GX1336R3Wn
         PVfChzqSWfwvmbZYjQL1qpu+BV8UQwYlQXtlLQEjfZnjh6R+dHCy50z7uinWtQYDhLZK
         f4T2VESXf9io3y2jHb7HGCWNmbpKmqdBE5v+2BGqd/sjtPrn/ZbSNuLuZ2w0UYleoxnn
         ag+ecf5UEXEQDlrosATyxNthgox/tmckUM14i5hCtHgTb6OiLh9Ci1x32cV0jIdHu+mu
         auw7UGVLUgLjxpYRqQ4wkd/Dldt5QvCwMcHTBR3993pJ1XINvPKGt8l6xB+/MHgC0bEJ
         9hHA==
X-Gm-Message-State: AOAM531J9XkAqg69PfS36pt6QvuGw+ruEQRywBVPJ4tUukIz5zOp+uuW
	jwTEpKy4NilX8R9E1fV7AXKJpov7dofvbGmPoEHGbw==
X-Google-Smtp-Source: 
 ABdhPJxAv9JXcw6qI19RfHQfRGB3rmhWPbdRp/oRrUvtQQgw2lbqx1r1Ye11xlPT5oplyu8dDpKiprsJ1B+v8wj5W8Y=
X-Received: by 2002:a05:6402:438f:b0:41b:51ca:f541 with SMTP id
 o15-20020a056402438f00b0041b51caf541mr44680605edc.80.1649871435068; Wed, 13
 Apr 2022 10:37:15 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
 <16E57E79FD292EFA.13992@lists.openembedded.org>
 <CAOSpxdYONLK8BhmNjx9uj9BDb0P=bAiJ-uAKG1edHjBnzvHc9g@mail.gmail.com>
 <Ylb9RoAyRpDHTaqe@mcrowe.com>
In-Reply-To: <Ylb9RoAyRpDHTaqe@mcrowe.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 13 Apr 2022 07:37:03 -1000
Message-ID: 
 <CAOSpxdbaE-=NOsQVG_+tK1J9oojA9qT8sMoR3c06uEssXJ0mFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Mike Crowe <mac@mcrowe.com>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>,
 Ross Burton <ross@burtonini.com>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164349

On Wed, Apr 13, 2022 at 6:41 AM Mike Crowe <mac@mcrowe.com> wrote:
>
> On Wednesday 13 April 2022 at 06:02:22 -1000, Steve Sakoman wrote:
> > Both runs completed and I'm still seeing success without the zlib patch:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5069
> >
> > and failure with the patch:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5070
>
> I'm certainly no expert with the autobuilder, but it looks like nothing was
> actually compiled for both of those builds - everything came from the
> sstate cache.
>
> I believe that Ralph's reproduction of the test failure without the zlib
> patch was from a complete rebuild without anything coming from the sstate
> cache.
>
> I suspect that if a PR bump or something similar that causes zlib and all
> its reverse dependencies to be built were tested on top of the commit used
> for build 5069 then the test failure would occur then as well and
> exonerate the zlib patch.

A valid point, let's see what happens with a PR bump:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5072

I see plenty of rebuilds in process . . .

Steve


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6646FC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 08:15:41 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.5097.1665648940379396596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 01:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eH9cSNUh;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id b79so582440iof.5
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 01:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DrCOQ+spYr+K30EbceuhqVJn2NRKVQxpqgR2pG3OA84=;
        b=eH9cSNUhCC0hrq+ZfGeWbUyX78kNDvTXaw0RZSidROuvcshBqnmg56afN6vHRw1cXh
         +QdT7w3qfdxCtDsRfpuJOzUR7TB3wMYjZmBJcBKMl7FikkDa9CwMbzuNCErnDjnobO5X
         ta3cHJRGzT5f/7g11yJDstx9TMQj4KHi7VWinb96k8zVqyM48txfMR3YaiUzd3fMO/p6
         LHjpUa+2SLzoVyJEx3x5fFa15ZynIKbo2Ge8WnmgRULP9RA4OyHjz22SM7JgVSl+HfhO
         i/bgN9/eTjcGUBTXXOmnFwKR+r4l0PWszpLbnHm0Rqh2DtOWhquXlRT/puYUKdcytt6Z
         ATZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrCOQ+spYr+K30EbceuhqVJn2NRKVQxpqgR2pG3OA84=;
        b=rokTsWpAVduY2h0GZxFPI2bWr+98MpYfRO8PLjiVVsyB4egYybx+Oa9+juaUROlzGH
         0uS+w20VASbFJTxzKk1udxMQrGyXa0T2RnEyoHBgOoHZCatinpV68tkLlkogf91VTitl
         ngV1VxEYZX/QgEl3VVJ+EDUwKkdIEcdoMHyj3iAw9Tm2xxCI6VTW7l+V0HJACe+ipJnP
         /LxW3kh60dzg4YtkRS6izuOZa0s81yUObq2MebGja+NepNzS7CwQw9oNmqPV9epG6h3i
         oQ95i4xf5PRQll8dHmV4A86IMChODrif8noVMTlVVlgzXERykQiB8l7SLBD0xp2FYRvX
         SV8A==
X-Gm-Message-State: ACrzQf1u8aTNUNVemRglzWdI1spElEXmn+Iuof+a8KxIIM1EV//zkJgN
	hHjsmos3vA+pqou1DKjJCjQGZIvcNuSVZceMrHM=
X-Google-Smtp-Source: AMsMyM5iY7CweurF60bolprLWRndBFmjP8q2eAzpYqs13/r6bscH/rFZL6dK7acPaIfALa8IZlihqOJbf6fB/CWXDB8=
X-Received: by 2002:a05:6602:341c:b0:6bc:1c3d:836e with SMTP id
 n28-20020a056602341c00b006bc1c3d836emr9610108ioz.24.1665648939671; Thu, 13
 Oct 2022 01:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=TmNEnu+KQTz9iJ72LaduRoHQh_YwevzJgpROj5C8qJew@mail.gmail.com>
 <Y0fFumcfL7RGRxvL@mail.local> <CAApg2=S0J4iqqPNVuYd6Dw8D6x5wM_0e6f6iq2bCeL0x+fH=7A@mail.gmail.com>
In-Reply-To: <CAApg2=S0J4iqqPNVuYd6Dw8D6x5wM_0e6f6iq2bCeL0x+fH=7A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Oct 2022 10:15:28 +0200
Message-ID: <CANNYZj8nm3BGTUXN+j8gWGGhvWTKscVM_1Q+tBvdJyqFQVne2g@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] core-image-weston doesn't build
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 08:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171689

What happens when you run 'bitbake weston'?

Alex

On Thu, 13 Oct 2022 at 10:10, Marta Rybczynska <rybczynska@gmail.com> wrote:
>
>
>
> On Thu, 13 Oct 2022, 17:00 Alexandre Belloni, <alexandre.belloni@bootlin.com> wrote:
>>
>> On 13/10/2022 09:52:44+0200, Marta Rybczynska wrote:
>> > Hello all,
>> > I'm trying to build the core-image-weston in kirkstone to look into
>> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14926
>> >
>> > It turns out that the image does not build (oe-core
>> > e728d0965d6fda8ac54e065ca7bf7eb9da9a8170 with bitbake
>> > 6603c3e39f1cf746669ec6c9f0be8c6e6ece426e). I'm getting:
>> >
>> > $ bitbake core-image-weston
>> > Loading cache: 100%
>> > |###################################################################################################################################|
>> > Time: 0:00:00
>> > Loaded 1640 entries from dependency cache.
>> > NOTE: Resolving any missing task queue dependencies
>> > ERROR: Nothing RPROVIDES 'weston-xwayland' (but
>> > /oe-standalone/oe-core/meta/recipes-graphics/images/core-image-weston.bb
>> > RDEPENDS on
>> > or otherwise requires it)
>> > NOTE: Runtime target 'weston-xwayland' is unbuildable, removing...
>> > Missing or unbuildable dependency chain was: ['weston-xwayland']
>> > ERROR: Required build target 'core-image-weston' has no buildable providers.
>> > Missing or unbuildable dependency chain was: ['core-image-weston',
>> > 'weston-xwayland']
>> >
>> > Summary: There were 2 ERROR messages, returning a non-zero exit code.
>> >
>> > I can't find this one in bugzilla. Is it a known issue?
>> >
>>
>> Did you remove x11 from your DISTRO_FEATURES?
>
>
> No. This is a fresh clone. The only changes I have are in local.conf: DL_DIR and parallel build options. That's why I'm surprised.
>
> Regards
> Marta
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171687): https://lists.openembedded.org/g/openembedded-core/message/171687
> Mute This Topic: https://lists.openembedded.org/mt/94299411/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B059EC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 03:50:48 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.22807.1647229847994330832
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 20:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NOzPsxlK;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id y15so2784042qta.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 20:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IhVw2Cz+uWz+zYyENc/ZhCfpI9/5LHWzxSagVqNsnUI=;
        b=NOzPsxlKvwCYrWe7t+zPyFDUstcuLoj2yE8bnKocowx1bYjj8Pth9fUJlU4XbkP83V
         QMrR9w4DNtbPUS/aYnqfxktp2sE9e3MAyRfmGTaY+R/lHGFVWMnS9cLRHvr7Ggj48GYf
         asQkfKLURXaSpDh8PuFB3OA40NOt7xD4VHN89gIMkUBcmPcXBik7ghRnvj5BQOICFA8Y
         L0BS0W+62SQFedhTSkdjyB/HxMMm0AYzw2PRuLq7xSFSrdkeoDUFSF8MgzEgdIIyLrCb
         kurmbB50tDII2spxhhUgq0vQn8prwesxtEUUHo3sUu1hT9EmVe5wFfoEvuh5Gueht7lh
         85Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IhVw2Cz+uWz+zYyENc/ZhCfpI9/5LHWzxSagVqNsnUI=;
        b=mKncBIM1Z16FdpAuXqs28cZ2lI+wPLIu+dblTFM31yBGvWCpKgrKXTo2tzSJm1CAw1
         ClTACDnPqyXtmuvIVyNL6ME5vYWtVp/WPaH2hsifyWHmNEsFCQ9/GjdCbv+pyxF5567J
         sK36IvSYKBdqcYul/gXvusno/uZKZ6rBvImHKbesV1qDwWhkazdF1mYkCcA4uBHeYMqe
         QHiO+nEouNkY732+jhZCh8qGPr2D7844E6h3aJXWtB2yk00Y2Z7dKQX63qxdCkrwgAuk
         eukDqbQnWjK5yrsnwOINf5whd3Sxne0PlZENKYaN1Z3oAcV81k9Qn0ol2ew/RKScVus7
         TwRA==
X-Gm-Message-State: AOAM531P6Ko/sWfnNdjcwT+F6QwTQBtmOTn8DbDZYgLER1gxX3qWCN/Z
	9EvjRJLZ+LOEQC3PA2COawb2YN/pHD5MB9p518A=
X-Google-Smtp-Source: 
 ABdhPJx9rPD2jIXQUJGro9R/nZMg/Of59N7QdhOs38wZU07qxG+Z8xWK82ZMmB95JvOEJnM53ZrsW6XwxqNwQoTUcaY=
X-Received: by 2002:a05:622a:1053:b0:2e1:cfbe:ac25 with SMTP id
 f19-20020a05622a105300b002e1cfbeac25mr3044565qte.229.1647229846942; Sun, 13
 Mar 2022 20:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220313075932.3031649-1-raj.khem@gmail.com>
 <20220313075932.3031649-2-raj.khem@gmail.com>
 <CADkTA4OccVZ6g40ip0WDCUnbB-E1O7iEUCmV=2UkW2e0eyFkmA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OccVZ6g40ip0WDCUnbB-E1O7iEUCmV=2UkW2e0eyFkmA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Mar 2022 20:50:20 -0700
Message-ID: 
 <CAMKF1srg=ffBsX7vx65GkzMJzLMjAnc1DXHQ_WU9zhFNeL6xzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] linux-yocto: Ignore textrels for ppc64
 kernel
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 03:50:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163123

On Sun, Mar 13, 2022 at 7:24 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
>
>
> On Sun, Mar 13, 2022 at 3:59 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
>> index b9715e71eec..9a147023e83 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
>> @@ -66,3 +66,6 @@ KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>  KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
>>  KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
>>  KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
>> +
>> +INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
>
>
> Fine with me. We could also do the same tweak to linux-yocto-dev, when I'm back from vacation, I'll check on that (if I don't see anything on the list).

I have seen same on latest master as well yes. but scanelf results in
no relocations so I wonder why this section is generated into vmlinux
first of all
secondly, I think our textrel QA check could be made a bit more
accurate by checking for relocations rather than presense of  dynamic
section alone
as trigger point.

I am also think that we should perhaps take advantage of linker option
now a days to flag these textrels during linking stage itself by
enabling
--enable-textrel-check=[yes|no|warning|error] configure option perhaps
set it to 'warn' for now and then turn it into 'error' later when
things are settled.

>
> Bruce
>
>
>>
>> +
>> --
>> 2.35.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#163103): https://lists.openembedded.org/g/openembedded-core/message/163103
>> Mute This Topic: https://lists.openembedded.org/mt/89747768/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


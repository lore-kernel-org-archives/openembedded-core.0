Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AF4ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 15:46:52 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web08.10867.1667231210139602197
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 08:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pwyGerXg;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: uvv.mail@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id k19so16882151lji.2
        for <Openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 08:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGIVjaBSPOrjFGkRKk88J7y0hnUertOQaWyYmgi+7/U=;
        b=pwyGerXgqD5pSQpApKHixupFh4VobQvkE7UQSJqEy3VyK2HwzGOfUxslbGZ5Mv8ude
         qtEqoX68T1eKQivm9kIe10qASeqG4q1Brjqc6jiaVCEJI9tsHNKNufoncjJhC1NrSvCU
         S/IlgtVL7G5ZHbvVy4kpij4c6nhetESGsUSn6ay1GfyciGQWPdmWh1uMyDdxXjQGAzgk
         9n6I6XLI6kz9boxcWGJZcgqygbTQRoQHevyA1piuXHYBubYhFDNxpQX3fxEXGt5O+qaj
         fLuHoVQWAlFC2Er1GQHacZaZtWU5BdoQlfh5UwdRcuAF+UQS5fKvCJJLS5aURONG/pC9
         9jBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xGIVjaBSPOrjFGkRKk88J7y0hnUertOQaWyYmgi+7/U=;
        b=fjOWbT749uov2Aw2mgy8puIkOzNtEV9iwHUk64cGsobUm3Hl1oouG5ahdh87BvHyxb
         RXoDJ6j3WmGE2dmNuTK9Sqgny0KXekz/2Jxi8Ir92IYVv5Z4dvD/kOhjH0EY9FGu8mqf
         wlMfqtyfZTYZiK1ZGwJxw6FEplw+OdRm9I7LzLGF1NYVAbJTWfJQEc07slpyFMGh0qC7
         BCPQbaPu373cclovTCjm8oZ0rEvY37rqkzs+opR+9H7tFWbyxjk6BqXZTA8BZVWQMkf8
         aqqvfyjUQHozN27atinxL4jqDn90QB89LVX3iHCPCtT/6twPvynwiZ308F/Cn0Abf/KG
         90Vw==
X-Gm-Message-State: ACrzQf3J/jQAuhxH8MSm7kES8ZlO5DZe40eGAJAS0gjX5RF+dJSm9q9r
	CpLos2RnvdmzgMGUROVX/MA=
X-Google-Smtp-Source: AMsMyM7FO7FnnVQrdG91RBSmSHftRCDi2YhF3NB8OSX5agzGhEkCH9KV26fHTuQo/1s390Tck/Frag==
X-Received: by 2002:a2e:a810:0:b0:26f:b417:d122 with SMTP id l16-20020a2ea810000000b0026fb417d122mr5791472ljq.317.1667231208088;
        Mon, 31 Oct 2022 08:46:48 -0700 (PDT)
Received: from [10.133.220.225] ([185.253.97.12])
        by smtp.gmail.com with ESMTPSA id q20-20020a0565123a9400b0049d0a98f73csm1338871lfu.154.2022.10.31.08.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 08:46:47 -0700 (PDT)
Message-ID: <dcc3de29-6fbb-0e3e-1cb6-71855b579966@gmail.com>
Date: Mon, 31 Oct 2022 16:46:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [OE-core] [kirkstone][PATCH] overlayfs: Allow not used mount
 points
To: Steve Sakoman <steve@sakoman.com>
Cc: Openembedded-core@lists.openembedded.org,
 Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <171B283596D3592B.13098@lists.openembedded.org>
 <0e797990-cfaf-c3ab-2c07-903bda62aac2@gmail.com>
 <CAOSpxdZ9gdJrndM3UHiL__ahwN-pHCbNZdnAFgsoJj=pY8=WdQ@mail.gmail.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CAOSpxdZ9gdJrndM3UHiL__ahwN-pHCbNZdnAFgsoJj=pY8=WdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 15:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172326

The patch is now in master. Just a reminder to queue it to kirkstone as 
well.

Thanks,
Vyacheslav

On 12.10.2022 18:40, Steve Sakoman wrote:
> On Tue, Oct 11, 2022 at 7:23 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>> Just checking if something is missing to include this fix to kirkstone.
> Yes, it needs to make it into the master branch first :-) I will then
> cherry-pick for langdale and kirstone.
>
> Richard is on holiday until 24 Oct, so it will occur shortly
> thereafter.  It is already queued for the master branch, so there is
> nothing else you need to do!
>
> Steve
>
>> On 05.10.2022 13:17, Vyacheslav Yurkov via lists.openembedded.org wrote:
>>> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>>>
>>> When machine configuration defines a mount point, which is not used in
>>> any recipe, allow to fall through and only report a note in the logs.
>>> This can be expected behavior, when a mount point is defined for several
>>> machines, but not used in all of them
>>>
>>> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>>> ---
>>>    meta/classes/overlayfs.bbclass | 6 +++++-
>>>    meta/lib/oe/overlayfs.py       | 6 +++++-
>>>    2 files changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
>>> index f7069edd41..c3564b6ec1 100644
>>> --- a/meta/classes/overlayfs.bbclass
>>> +++ b/meta/classes/overlayfs.bbclass
>>> @@ -96,7 +96,11 @@ python do_create_overlayfs_units() {
>>>        overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
>>>        for mountPoint in overlayMountPoints:
>>>            bb.debug(1, "Process variable flag %s" % mountPoint)
>>> -        for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
>>> +        lowerList = d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint)
>>> +        if not lowerList:
>>> +            bb.note("No mount points defined for %s flag, skipping" % (mountPoint))
>>> +            continue
>>> +        for lower in lowerList.split():
>>>                bb.debug(1, "Prepare mount unit for %s with data mount point %s" %
>>>                         (lower, d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)))
>>>                prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
>>> diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
>>> index b5d5e88e80..590c0de58a 100644
>>> --- a/meta/lib/oe/overlayfs.py
>>> +++ b/meta/lib/oe/overlayfs.py
>>> @@ -38,7 +38,11 @@ def unitFileList(d):
>>>                bb.fatal("Missing required mount point for OVERLAYFS_MOUNT_POINT[%s] in your MACHINE configuration" % mountPoint)
>>>
>>>        for mountPoint in overlayMountPoints:
>>> -        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
>>> +        mountPointList = d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint)
>>> +        if not mountPointList:
>>> +            bb.debug(1, "No mount points defined for %s flag, don't add to file list", mountPoint)
>>> +            continue
>>> +        for path in mountPointList.split():
>>>                fileList.append(mountUnitName(path))
>>>                fileList.append(helperUnitName(path))
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#171457): https://lists.openembedded.org/g/openembedded-core/message/171457
>>> Mute This Topic: https://lists.openembedded.org/mt/94132926/4455192
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [uvv.mail@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>



Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0BBC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 17:23:42 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.10230.1665509016038596043
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 10:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EuwAgFRS;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id d6so22120821lfs.10
        for <Openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SdO1uydjT80clPS0AtA2Z3cR2csL49wsTFle5z2tNDs=;
        b=EuwAgFRS8vjIja7GERtM/aUf1mqBL1bpXsdcgcRoaccTVr1LmatYuLw90dzl1ysKuf
         teRuD/S5vTfKZJwczWB76gDG11MGYSe2zxunG5auJeZLj41eWhR+fVK+rlSNWkrz1ssK
         qMlqtvBOEcJS04mtRZjkeXeu9dUbdiGWAphLBI3sMy2Ah30y9cE7ozl0fnYYEmwbDm4+
         xQecHBhFy25sYPGn3OlAlMP2Ha4ZAemzTnf4Zy3tZb1N65aNJXdJet/+aFrQX1UQYmAK
         wZL/0Sae+Yl3jFPn/qNLeoLyonqhSCxRYYkZGJC8lSmXrbZ/1hb4mQ47zxEMb825bgvb
         Lxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdO1uydjT80clPS0AtA2Z3cR2csL49wsTFle5z2tNDs=;
        b=pqM9e2RPr7Aqhu6TRT8tCexdDS0/DJ58gWGxnpUp3zpMiHitOjO/tg1KkvQ1uaac8+
         QnykDXP0cAu7JPmvVXclJVGsxWvvECQaajWmuFWhfYJK8njhb+qgvl4/Yii+umi8qui8
         Ah+oMaEi2NDur/emwnKa1ulPxAic45TrJtnvbEnmsrrl2CGazBkS/8G9p0r8wlI4EgyG
         vvRZC+lac3TvCGMRsakQXpGCmLJv30KtzwTzsYKBQIf0UykQOaBJQcEmR8Qmbwdfhx5P
         b+hcB92gLYqDS1IHAFcHZtP3XOtw1V/t2QgvXPK/QDNTPBoZ6ZV2TtFBi9IX8tZXE7YF
         3cOQ==
X-Gm-Message-State: ACrzQf1CoIeibZbtH0G+LMHERgVym9zL0t8sqqv12pQU1i9xT1ekhyxE
	C/0aLW3KQpqxPSmx58fLOY27EyuupgRCoK/s+18=
X-Google-Smtp-Source: 
 AMsMyM4DDhCGDijzDvlJQZkBD/WUJVr1N3FJbwmOUQzMSvc96UFjc00CaIcKJ+h6wYWCqhVwSIXSsQ==
X-Received: by 2002:a05:6512:3247:b0:4a2:8dc4:3889 with SMTP id
 c7-20020a056512324700b004a28dc43889mr8145502lfr.410.1665509013871;
        Tue, 11 Oct 2022 10:23:33 -0700 (PDT)
Received: from [10.133.219.234] ([185.253.97.11])
        by smtp.gmail.com with ESMTPSA id
 n17-20020a0565120ad100b0049936272173sm1925843lfu.204.2022.10.11.10.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 10:23:33 -0700 (PDT)
Message-ID: <0e797990-cfaf-c3ab-2c07-903bda62aac2@gmail.com>
Date: Tue, 11 Oct 2022 19:23:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [OE-core] [kirkstone][PATCH] overlayfs: Allow not used mount
 points
Content-Language: en-US
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, steve@sakoman.com
References: <171B283596D3592B.13098@lists.openembedded.org>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <171B283596D3592B.13098@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 17:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171634

Just checking if something is missing to include this fix to kirkstone.

Thanks,
Vyacheslav

On 05.10.2022 13:17, Vyacheslav Yurkov via lists.openembedded.org wrote:
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>
> When machine configuration defines a mount point, which is not used in
> any recipe, allow to fall through and only report a note in the logs.
> This can be expected behavior, when a mount point is defined for several
> machines, but not used in all of them
>
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ---
>   meta/classes/overlayfs.bbclass | 6 +++++-
>   meta/lib/oe/overlayfs.py       | 6 +++++-
>   2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
> index f7069edd41..c3564b6ec1 100644
> --- a/meta/classes/overlayfs.bbclass
> +++ b/meta/classes/overlayfs.bbclass
> @@ -96,7 +96,11 @@ python do_create_overlayfs_units() {
>       overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
>       for mountPoint in overlayMountPoints:
>           bb.debug(1, "Process variable flag %s" % mountPoint)
> -        for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
> +        lowerList = d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint)
> +        if not lowerList:
> +            bb.note("No mount points defined for %s flag, skipping" % (mountPoint))
> +            continue
> +        for lower in lowerList.split():
>               bb.debug(1, "Prepare mount unit for %s with data mount point %s" %
>                        (lower, d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)))
>               prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
> diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
> index b5d5e88e80..590c0de58a 100644
> --- a/meta/lib/oe/overlayfs.py
> +++ b/meta/lib/oe/overlayfs.py
> @@ -38,7 +38,11 @@ def unitFileList(d):
>               bb.fatal("Missing required mount point for OVERLAYFS_MOUNT_POINT[%s] in your MACHINE configuration" % mountPoint)
>   
>       for mountPoint in overlayMountPoints:
> -        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
> +        mountPointList = d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint)
> +        if not mountPointList:
> +            bb.debug(1, "No mount points defined for %s flag, don't add to file list", mountPoint)
> +            continue
> +        for path in mountPointList.split():
>               fileList.append(mountUnitName(path))
>               fileList.append(helperUnitName(path))
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171457): https://lists.openembedded.org/g/openembedded-core/message/171457
> Mute This Topic: https://lists.openembedded.org/mt/94132926/4455192
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [uvv.mail@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



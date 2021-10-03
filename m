Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48277C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 12:22:27 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.21714.1633263745840043167
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 05:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hiWYQfqq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 g198-20020a1c20cf000000b0030d60cd7fd6so2253470wmg.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 05:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=VdHzBTeuOn0gedtTyxvV88CxpnBchNK5TRvF2oCO2oI=;
        b=hiWYQfqqI1DZOiRF6FcB+TDj0IF+Gn1DBCzgo5g+7WYADA49JpOVo1YAPYlkls6q6f
         8oAtRizzyvlIF0usvt/qg1pmHGbGReroWQPrCCr5iK0bumN5mfeWmzCQEPICI963nt+r
         b6E1HPtTd2SlbwS2vJQx2vgojfbE5PtvMARyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=VdHzBTeuOn0gedtTyxvV88CxpnBchNK5TRvF2oCO2oI=;
        b=6AilzhQOF1LBlqaqPxO0dLSahUbsal5SLjcFbyZep3RAkSPOm1hT68SZIka/uulhAZ
         rjfGE5vaWBNja/ZjJDTyjcabD/ul7n3IlQryLo5QRS6T6t+c7/aJMz6oKntM+zuRALaF
         8dWKfRffv55mAfPIdhPH6gkfDBPCIPJUatwwDj0z+GcCw1qrcazzmztBNqpmI8bkGSM+
         Kkkvwi/sqdZLxzvz5Q0QrN4vNWc5OfSe2jPuZsT19SOJQDlBUHUJhcgzoLbL7A0cm8i/
         KQ5zUxScg46W32JsOP3AHFFHJGZBqz6UX/5jyTtspsA4hFuJJuzNjvaUBgy4vtsOe6f7
         /f0A==
X-Gm-Message-State: AOAM531vIZHQEn9neMBKgjHp0E50vuMFFSrZ6nyiYGUShtVwvqMpV5bC
	S+aFdbixwwyN9KI/rBbk4YPZtt22j5QZA7HW
X-Google-Smtp-Source: 
 ABdhPJzqb/I7STGMM94hEIfZkf4uxEaR4HKpsY2n2ht0uV5g9KBvWxrjhEPjFFKGI+Mnw3fNy0X1IA==
X-Received: by 2002:a1c:1b07:: with SMTP id b7mr13609693wmb.42.1633263743963;
        Sun, 03 Oct 2021 05:22:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8657:7fac:b2bf:59a6?
 ([2001:8b0:aba:5f3c:8657:7fac:b2bf:59a6])
        by smtp.gmail.com with ESMTPSA id
 q3sm11013096wmc.25.2021.10.03.05.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 05:22:23 -0700 (PDT)
Message-ID: 
 <1e3720d26043b0107be9aaef33dae24531aeb2bf.camel@linuxfoundation.org>
Subject: SDE calculations broken
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Date: Sun, 03 Oct 2021 13:22:20 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 12:22:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156551

I was worried about the failures I was seeing in reproducible builds. I
therefore put more instrumentation about where SDE is calculated in builds.
There are some situations we'd not expect to see a value of SDE so I tried to
write logic that describes it. It is harder than you'd think as the value isn't
valid in fetch, unpack, prepare_recipe_sysroot or *_setscene tasks. I tried to
make the warnings conditional upon BB_CURRENTTASK only to find that gets set
later that the SDE function is called. I did add some hacks to make it get set
earlier but we'll come back to how early it runs.

Once it has a value, the function writes it to the datastore, since re-reading
it all the time is high overhead. This means that the value is cached and once
set, doesn't change.

In testing on the autobuilder, I found this log extract:

NOTE: Running task 196 of 2214 (virtual:native:/home/pokybuild/yocto-worker/buildtools/build/meta/recipes-devtools/rsync/rsync_3.2.3.bb:do_patch)
[...]
WARNING: Cannot find /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/core2-64-poky-linux/rsync/3.2.3-r0/source-date-epoch/__source_date_epoch.txt. SOURCE_DATE_EPOCH will default to 1302044400
[...]
NOTE: recipe rsync-native-3.2.3-r0: task do_patch: Started

buried in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/4430/steps/11/logs/stdio

What worries me there is that rsync-native is looking in core2-64-poky-linux,
i.e. the target rsync. How could that happen?

My theory is that SDE is being called early in parsing before the BBCLASSEXTEND
has modified PN and friends.

At this point I'm very worried as the whole situation looks error and race prone
. It may explain some of the instabilities I've been seeing though.

Cheers,

Richard





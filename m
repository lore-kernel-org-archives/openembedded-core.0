Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF248C433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 20:04:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.314.1633291490491249164
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 13:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E339QVR/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 s198-20020a1ca9cf000000b0030d6986ea9fso1758729wme.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 13:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=V5kg5J1+y4DA2Vdc2WQ5v60oSyQyJf18XQO8PuFgKPk=;
        b=E339QVR/blZJhf6IbrjixH2uQ4BoHAtBnkYqt2CQ9veXMIRBVtlilQOxtQ75qmz7Hm
         n7mNRE0T8i9DnzN5QcXcX8kHvsZyaiy4NrEw6BJKitW5ItbB+qCH/Dg4zquVKv33dE33
         +dkFsXCmJbkPeRC2ULgrpwQXIyv/ngft/Bl00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=V5kg5J1+y4DA2Vdc2WQ5v60oSyQyJf18XQO8PuFgKPk=;
        b=AXgR+hZYfWvEAtt9OIct75iobkMC3+xB342G+fiJp+pRi/XsCNBcut2EoruEaZBRVi
         D0zZQSTOXJ/aUU4HEaEkQk5CfgmY/9z+X7zTTOQY6c6nJI3B/i+H7fxLocaRgLtKXRE/
         F2VemA6QuTKxzRL3o4HnPZFIEsBJknAmG1+dCQC9e8kQCClj8jy2eLFTaVuHOpi2RmI8
         RfB2NA0oz95TPnyMtgVrfWbldx63p7r25eAfWdtHx/ve7dAPadJhD1xBT7Gz0FOKMsBj
         xCH5XLdb2OHHqIZp6ITgIM4qmW5aRcrkxp/Wz/ywhGH0rl4qeDgO9P0UZoPWHBamiw05
         WxZA==
X-Gm-Message-State: AOAM530lkjqpzLN9MnWdSYONZl/8QCRrSuVUKZugESJQCCz8stRoZdNk
	RyeYam0L8YIgr25JG8WTpuyg3ID9HmYiY5E3
X-Google-Smtp-Source: 
 ABdhPJxz0D0x8fkb8spvbshzrAKKsYr9Va5Qdiz/yeJIEY2gUy1Ykj7NX3+IoOKldM09s0umcM4Cqw==
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr12644666wmf.8.1633291488727;
        Sun, 03 Oct 2021 13:04:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8657:7fac:b2bf:59a6?
 ([2001:8b0:aba:5f3c:8657:7fac:b2bf:59a6])
        by smtp.gmail.com with ESMTPSA id
 d24sm12114803wmb.35.2021.10.03.13.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 13:04:48 -0700 (PDT)
Message-ID: 
 <852cc727e863144a327535eb56b9d805e0b5493e.camel@linuxfoundation.org>
Subject: Re: [OE-core] SDE calculations broken
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Date: Sun, 03 Oct 2021 21:04:45 +0100
In-Reply-To: <16AA84B953E49EBA.10599@lists.openembedded.org>
References: <16AA84B953E49EBA.10599@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 20:04:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156558

On Sun, 2021-10-03 at 13:22 +0100, Richard Purdie via lists.openembedded.org
wrote:
> I was worried about the failures I was seeing in reproducible builds. I
> therefore put more instrumentation about where SDE is calculated in builds.
> There are some situations we'd not expect to see a value of SDE so I tried to
> write logic that describes it. It is harder than you'd think as the value isn't
> valid in fetch, unpack, prepare_recipe_sysroot or *_setscene tasks. I tried to
> make the warnings conditional upon BB_CURRENTTASK only to find that gets set
> later that the SDE function is called. I did add some hacks to make it get set
> earlier but we'll come back to how early it runs.
> 
> Once it has a value, the function writes it to the datastore, since re-reading
> it all the time is high overhead. This means that the value is cached and once
> set, doesn't change.
> 
> In testing on the autobuilder, I found this log extract:
> 
> NOTE: Running task 196 of 2214 (virtual:native:/home/pokybuild/yocto-worker/buildtools/build/meta/recipes-devtools/rsync/rsync_3.2.3.bb:do_patch)
> [...]
> WARNING: Cannot find /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/core2-64-poky-linux/rsync/3.2.3-r0/source-date-epoch/__source_date_epoch.txt. SOURCE_DATE_EPOCH will default to 1302044400
> [...]
> NOTE: recipe rsync-native-3.2.3-r0: task do_patch: Started
> 
> buried in:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/4430/steps/11/logs/stdio
> 
> What worries me there is that rsync-native is looking in core2-64-poky-linux,
> i.e. the target rsync. How could that happen?
> 
> My theory is that SDE is being called early in parsing before the BBCLASSEXTEND
> has modified PN and friends.
> 
> At this point I'm very worried as the whole situation looks error and race prone
> . It may explain some of the instabilities I've been seeing though.

The above isn't as bad as it seems. When parsing the datastore during the recipe
run the main datastore is finalized before the variants are finalized, only the
latter ends up being used.

This is the real problem:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/4386/steps/11/logs/warnings

i.e. the SDE caching is switching between different WORKDIRs as the datastore is
changed. I've sent a workaround for this but it needs further thought.

Cheers,

Richard








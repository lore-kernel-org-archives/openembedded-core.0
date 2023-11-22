Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D51AC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 13:47:09 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.19581.1700660821795368170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 05:47:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FylIE/Aj;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-507be298d2aso8858272e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 05:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700660820; x=1701265620; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cqg/L8TI0+vi/wqBDv9GhMPjhiMDMMtrzFc6ifzEamc=;
        b=FylIE/Aj0CmUtORGmNMWHoThqhyIYksQ3jYX0hUBosPw0rUoI923Jk0P1gdgyESQXs
         nP09A2Y9ZbAsuStH1n25wNXQaSmQrpTfZzS7U4sfOc3+fKRh1JbEPHxI0p6BSQQPQLvg
         O1Vkort1nV5bbv2FCnI+yNefuQRFSqJlKKaujUYEOE8svKhZYZJlJ2xpB+0gKAc9BnTr
         79IE/tVS3t7hYluXelGiwoc2tXhywN6IAmskDAwaBOlP0sp5u5qRBWlu1nWgS+NElIOR
         Qt4YL/iTh42mWNbkd98BZR00lEYCUlidj/VdwMGE4/Hf8cVry16RezrhmhsdDmR6R8Sd
         i1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700660820; x=1701265620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqg/L8TI0+vi/wqBDv9GhMPjhiMDMMtrzFc6ifzEamc=;
        b=ZF6n1QuCAquapAHT+d/ul+LgsegMDiMPY94sxvl838LNgYFvzswkKmG85Q6QHSsH8A
         v4qJQMdcpdwHy56143F7PFCM0mT9ZhF9MzkE/XMhicecwytOUCBKxNYxN/i+U0kRkmPu
         s9AgQa95ikbJ4EaeaoR7dzIQnuNwFmuLkD0qSyrY+FcM5SYx29wlRXvzLGk/uZ2Nxckt
         SAzdiKK8fmADWjzAbZcKkF16e9lyXEQ9Kznl5c6V1S2zQT3NHtQM0I5ZesUsHIlxBgQi
         f+hnvX+8JUhtoTEfevukfo624qNSJO6SLsUD8y6Jz3/UR2poqojjIvOGsj0bDw3MRK0f
         JSzg==
X-Gm-Message-State: AOJu0Yx5LdR0cWlDn6WyUkz6Pkq6lAfGrAZHeSdEc8TEfqYgsLjRIrbF
	rdqtfTgDsIKcv8f8P8UTx8c=
X-Google-Smtp-Source: AGHT+IHs1F21lLdr6B2tZ/uMGMNPP7dmKp/nRMkoEQQCyt7zUrfUMK1l2Qz6tQHmuWvq2YTQxX3+9w==
X-Received: by 2002:a05:6512:2249:b0:509:31e6:1de5 with SMTP id i9-20020a056512224900b0050931e61de5mr2173452lfu.47.1700660819832;
        Wed, 22 Nov 2023 05:46:59 -0800 (PST)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-81-118-90-13.business.telecomitalia.it. [81.118.90.13])
        by smtp.gmail.com with ESMTPSA id fb14-20020a056512124e00b0050ab8608a75sm346743lfb.206.2023.11.22.05.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 05:46:59 -0800 (PST)
Date: Wed, 22 Nov 2023 14:46:57 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs <docs@lists.yoctoproject.org>
Subject: Re: [PATCH] poky: kirkstone: eSDK: fix build-in eSDK environment
 file generation
Message-ID: <ZV4GUQ7Wz8/LnowV@alb3rt0-ThinkPad-P15-Gen-1>
References: <20231122085438.7328-1-alb3rt0.m3rciai@gmail.com>
 <CANNYZj87+-6jte1KYUNg2ueWvsYzxiOQvbTzrCZ_ooo9N7uutw@mail.gmail.com>
 <CAH=B7vfs74f-vyx8JGJyfAu3NPa5xwgumsW+_ahMBXnfUmJw2Q@mail.gmail.com>
 <CANNYZj_XcosMZQHswireb1JHJahUvSy1NuHy_3-f3Km8aWwgbg@mail.gmail.com>
 <CAH=B7vdEtF7f51uRsN9qMcL_80M3zsPfFUsD4v_HCgJdxXLdsQ@mail.gmail.com>
 <CANNYZj8MKBmCPYnv91aUTJGpMghNyX1KPUGTo9xW9rc8rbLWUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8MKBmCPYnv91aUTJGpMghNyX1KPUGTo9xW9rc8rbLWUg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 13:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191103

On Wed, Nov 22, 2023 at 01:12:00PM +0100, Alexander Kanavin wrote:
> That's right. If you have to stay on kirkstone, then you have to
> maintain a private backport.

Understood thanks,


Alberto


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689C4C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:39:41 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.14857.1682581171347877822
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GLBilC8G;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4eed764a10cso8742436e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682581169; x=1685173169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aLYo86zAGa8YBy3RJ1ICg/Qxlp7uppahxzcn401jfeI=;
        b=GLBilC8GzoFT6LArgPOURicVbjG/HQ8nh7jIAwBgLPa/Ul7Zlosn2LRxgOxWKHi8w6
         DkKAUpPn9p3kdS2E5MGu4Hswa5TW5eiNZNjmnEnWlXX8CGjbemculRBTzzRZgV+et0xd
         XHbcZi/6mpEYbsVqzSbrkDJXelwyzcgZm1FbRdGQt+N/HTIRHT0zhWUYtKAAFOWl1Iyh
         8QiPTuNvlLeJ9weABmdjqcnhcKiM3nRfiVtxLVoDEEW1eG8SYoWf0SimRzWK0zmOlnOh
         +DJQQ8gJ+VQHK93XBJ9v4+diU+mCh6TxsU6ANxAI9pcsANdaNncq/e/r/MllL7wCCE9O
         l/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682581169; x=1685173169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLYo86zAGa8YBy3RJ1ICg/Qxlp7uppahxzcn401jfeI=;
        b=Fl9IK1avfWZDxMcT1kv5+bYkuEBkbAZB+I19uQRwxcEmxdaquY96xiItv32ZMJWvSF
         C2IqpMdabyHmJEYbWMDh+komzG78Aem/08TfxYcm76XK43EhD1990BQiJzoQ3uJ9ECOf
         RdrADBSV1IZ5vErzT52qwIx6kO7u/BfMjzf04cTwbtAe+i2TbcnjKouE5PNKb2lJ5AYB
         r/67PBJ84JR2gyjNzfolw2MY71X8r8G8t8nhKPg28TAKoXvX+ol1Nz8KXmZoFUWps1s+
         2zv21XsYcmgSrNFb2M9LklEQBqcBiO01ZxCXSkeO9oXPIsN/zhrEhFAzPNVsfA9xhQY4
         mzdg==
X-Gm-Message-State: AC+VfDzoGp4gW6hiubts4lSfzM/Ds82kOYOD7NjSgVQ2yobcLmixAZzL
	to4MXAP2xJ5DHbYCWidLUwsUuLzjv3rkl6LqsGE=
X-Google-Smtp-Source: ACHHUZ6B0ngH7i9L+rHLWIjFsbjBdrMnqUA0/5ZtSMLjNzqJKkilPiEQ6h5FSqDYuPdahIDwhRWj/oGr/gxuO2qhAZ0=
X-Received: by 2002:ac2:4186:0:b0:4ed:b4f9:28c7 with SMTP id
 z6-20020ac24186000000b004edb4f928c7mr254179lfh.6.1682581169488; Thu, 27 Apr
 2023 00:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
 <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
 <CO6PR11MB560204CC8CEB29806F20BAFEED6A9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <1759BA367C1A63D1.32698@lists.openembedded.org>
In-Reply-To: <1759BA367C1A63D1.32698@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Apr 2023 09:39:18 +0200
Message-ID: <CANNYZj9i_15+CdVgj8356xqAC90UULQPnOM0KXJ7Yak9js00bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required kernel
 to 5.15
To: alex.kanavin@gmail.com
Cc: "Chen, Qi" <Qi.Chen@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180480

On Thu, 27 Apr 2023 at 09:31, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > Does this mean that SANITY_TESTED_DISTROS should also be updated to remove all distros with kernel older than 5.15?
>
> No. This check only applies to target kernels built by yocto, not any
> of the build host or sdk host kernels.

I should however expand the commit message to make this clear, and
better explain where OLDEST_KERNEL is used inside oe-core.

Alex


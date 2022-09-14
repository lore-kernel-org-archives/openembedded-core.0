Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469ABC6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 21:20:07 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.2639.1663190401041426713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 14:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pF07VKGj;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id y8so17221090edc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 14:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=eotugnmc+FsjRoWJgtMwlYS+8sSatwJq/eFDRS7hvpo=;
        b=pF07VKGjyTsjLhYdu72F+T78FTwX1I8L8URQahHhP9N1JUPALhsXiK90CqsF7ygQaL
         BMYy0MAzrFI5nUMZ2S5taESzn0TvFGaE4cmlwugWVD8kUC2gd0JjjChFukb0neatrtcx
         dwUYlESRQbnjHaiECSNgbtUt26yl8yy12Jn1+pBGxeXAGNfO3QfbmU42Caz8IKcDBv24
         pzNCix9kDkv+OsEGGAB1VK5W7A68aWSllMO+8KAa9NEwyM0YtfCgaAYEOGO+Y8SixOS0
         eQHMnFnCkLHF1HFGH+XVf/hgUbLtmlmmjJHCuBLcgq8gfAV/JoP6B2nVkn56VNaS14A9
         NNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=eotugnmc+FsjRoWJgtMwlYS+8sSatwJq/eFDRS7hvpo=;
        b=JpdkDrFGtq3hrR8cenTDoVpqA4ahFE6Rp4jbxjPfTKcae5Bz/Ny1zn398W29NUB4bB
         UHZz+rHR4RRXol35xEmbhSVOI0es3Nh5bDEuwNZOnzClv2LUOPjE0XOVfHii6Fr8NcZ2
         X2sQmBbDZZYKJldIbIrcIC19BTZwHWFELv1bSNNP53E8tybuD2CabaoEMvq6W7aE4/pY
         Zo4SB/BZEFuH+W6GA5l0vpIPaYwT28xsqFLgg8YluJ6EPDO5jLUO8u7mAzwDQDb16dEH
         fkNGn4tYG5XLAClOk60T2LkkZbRFefli2FkbNiS4TGn7X1TxG95N0QNWKptLzKbFPt48
         VnGQ==
X-Gm-Message-State: ACgBeo3frxp1iMhjuD3q/wwwnsJ/jxC6s9PlKN+Op68kAx/t7CYCIOYe
	IFoej/LSsCDyxP3W5TLQkQ4=
X-Google-Smtp-Source: 
 AA6agR5G/WZpIuVmDc2RSk2SAjcwP677bH64x2MNdKGUx/W46OE0jdARffuDw9NCs2Crg76aCG7hoA==
X-Received: by 2002:a05:6402:3988:b0:44e:6f08:ddfb with SMTP id
 fk8-20020a056402398800b0044e6f08ddfbmr31664281edb.89.1663190399225;
        Wed, 14 Sep 2022 14:19:59 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 f13-20020a17090631cd00b0071cef6c53aesm8138356ejf.0.2022.09.14.14.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 14:19:58 -0700 (PDT)
Message-ID: <04dc909a54c792368fa9285f32160c4c3e39ae8d.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] nfs-ganesha: Replace unfs3 with
 nfs-ganesha
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Paulo Neves <ptsneves@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2022 23:19:56 +0200
In-Reply-To: <17143CF1C30D4B98.24896@lists.openembedded.org>
References: <20220828174356.3074391-1-ptsneves@gmail.com>
	 <20220828174356.3074391-2-ptsneves@gmail.com>
	 <17143CF1C30D4B98.24896@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 21:20:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170675

Hi Paulo

Is it possible to do the transition from unfsd to nfs-ganesha step by
step?

   1. Add nfs-ganesha
   2. Refactor runqemu-export-rootfs to work with ganesha.nfsd instead
      of unfsd.
   3. Remove unfs3

My conclusion so far is that just removing the unfs3 recipe would break
runqemu-export-rootfs and some features of runqemu. Therefore I would
suggest that you send a V4 which only adds nfs-ganesha as a first step.
Note: There is also a typo: The "-D" from USE_ACL_MAPPING=OFF is
missing.

Regards,
Adrian





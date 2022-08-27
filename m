Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E09AECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 19:13:54 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web12.52115.1661627626963187638
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 12:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MuRFy4HR;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id q18so4443643ljg.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 12:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=iumpfCu4aqyaacANJBddp6IPrl9FOpvVZfiKI6eEY3g=;
        b=MuRFy4HRmyd6TpmSaX8OOiN7mbS05nC19RPNLSMItZD+fCQh6VVCbUqEan5xAaJXg7
         AIipZcS6hsqhJT9FAj1k6VheO30L8aa8TcfJZ2/VnMRDpwG06QqpsXN+8+CyF5sjLB5I
         YrtsyGKDweNM7aZVs/FmPQXZ1QVLCmKMffqdwiHzql26mNIU8Sb29eFIedEZ5aITX8nq
         vI6fTHpuWN0E9ws6CLux1auvEEmOEmD3ZOs0n33EWv523KamzxYm+mlF1wtrSK0e+BrK
         GdTRChVJN/8weE+WBUGUaz9lHY0E+0J1pFSllCYaYSIF+2CLdA2vJJiizJEsrPiB9HEp
         OsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=iumpfCu4aqyaacANJBddp6IPrl9FOpvVZfiKI6eEY3g=;
        b=c1WBkIk8nzUw2nlX3EFNtHXQTFWYdy2uWLSAxW9KfITm06dk0wM44ANGm+1NXXnG4n
         uVNYAS24RLtGdHry8v4ZpSe48iV2XI4kaI1vmUqPXqpZz8zt5oCbtW5aZgQBmuTqZ0NB
         NAmNt7IWdX3rryaP38LSwOM9im7jeFyzfRNLr36rr5WulS+/lU5kjOgqq2MWXzZgZmVT
         9LYcZh1b/sCx50k7YckzJ562bwOr3UP3nIxWpuGsWTUsbvy6OyHnqq6lkc9RCo2sCmJZ
         SQpY93OnI3WomcagdQbDKnxlHnNVnikuOn1OTlX/4r6Qn0Ftxa5+Zt4t5NuH8FcGYkNS
         nzZA==
X-Gm-Message-State: ACgBeo0WDGe0HSkTRMKb3yOqBdk6c+qRyl7/zSDze/j4iAB4vJKTOGbP
	guHXluABuaTBWnMgtZtKB912izAJsbcdv8zBirY=
X-Google-Smtp-Source: 
 AA6agR7Pmxg/Mv0sQ0FiAoEoyFpQysTkagQaDRnEbEHkqlcozs7dcXf7tAx2MhmsXw1G3XApIp4FB6BXhWYT8Flg+U0=
X-Received: by 2002:a2e:7e0b:0:b0:261:bef1:a32e with SMTP id
 z11-20020a2e7e0b000000b00261bef1a32emr3896927ljc.41.1661627625247; Sat, 27
 Aug 2022 12:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220824124234.3549247-1-alex@linutronix.de>
 <20220824124234.3549247-2-alex@linutronix.de>
 <20220827090049.1d19b479@booty>
 <170F423CB671B42F.16609@lists.openembedded.org>
In-Reply-To: <170F423CB671B42F.16609@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Aug 2022 21:13:33 +0200
Message-ID: 
 <CANNYZj8D-+sLPQSVc1x7pVp94GOAG7rGAReARWz5MV5zLGs98Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 19:13:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169968

On Sat, 27 Aug 2022 at 19:00, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > This is making the AB fail:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4140/steps/7/logs/stdio
>
> I believe this needs the patch for poky that moves the template to the
> expected location, was it included? I just started a test with both
> patches:
> https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/force-templateconf
>
> and it is able to proceed fine:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4144

...except the change does break eSDKs, so that needs to be fixed first.

Alex


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7431ECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 15:47:16 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.38533.1661528828643545007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 08:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PnfAh1+w;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id x24so1961908lji.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=bJbuI6pPjkAmE9c00BatLTYOuzHPqhgzJfzzMtuIGa0=;
        b=PnfAh1+wHAeP3qFVCzkbN78LqqzXZekn5hcB0akhqJST7zBfQoij0u5BU+AOUUfhD/
         x8C9pxDC5SWXrfbnSkaGsT82bgrTYmBueH8FFgwn1wWG/MshvIIUvU7DFl4uO7XM2mNF
         X/nb1MK2VzSYhJL0q4TcP071OWT0QvTSKhLh8rrb0M4uz6j42nGSSGJPqWJd9y62ZD8w
         cfxoYDNFJLUfgz18xoNnWcmzjlAwqWa5QQEecM9DRAZSyA5rRuG6etOnBybK+jAI7ajn
         3JY31U8Yo2Be1MoaVuT08qLZ42sGDUGcpmMyAoSa4hHu9qhzZjEH1AQDirGzRcwKT9Yx
         pUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=bJbuI6pPjkAmE9c00BatLTYOuzHPqhgzJfzzMtuIGa0=;
        b=sJakGxlXx7gz6Y/Ju2GAJeUuGU34xe0/eFrKqPEt1sZCSIW3+fqFHaGp6qbteAewBI
         QFY5cy11jVD3FTygywpX4x/LkqLGvWLAy45deTRDnNySZCGtBoZFNiooFI5KdEQx/18O
         aCsCq6PD6GGqLdjtnIdbMd8Ori5LuouohAgE+Pxri1C7cptjKrX1xGbxlyUMWQjNBc81
         bK8o9DQFVg8gWz0SpRSy0YK4FTEUojVFiBLA1T1YDoL9wWWJm6P8VDq4iKp3hBRC5S+p
         yW3ZZA1ats70SdMTrxErGoNuELX2SgIZxnjKQL7F1AF7NV1ELnd99J/pY+RhQpSV7Al2
         3Rvw==
X-Gm-Message-State: ACgBeo2QN+X3coGLmuDVtLvupQykyLNq3cPVAo1V5umVt940pro7AovQ
	gbAdZUrS1Ok78SLvfOeS68dgC3zsgYQtuiG/008=
X-Google-Smtp-Source: 
 AA6agR4DfXXDNjCHMntTvyD/LN5rjeJoeK3okGEfn+LL/LybM0POSfoOPeNjj9ESxXCQGUT33PqqCMzUlW7pGqDGfyg=
X-Received: by 2002:a2e:3a09:0:b0:25e:4212:5628 with SMTP id
 h9-20020a2e3a09000000b0025e42125628mr2363607lja.68.1661528826757; Fri, 26 Aug
 2022 08:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220825203451.2074080-1-alex@linutronix.de>
 <20220826172507.4e75a7de@booty>
In-Reply-To: <20220826172507.4e75a7de@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Aug 2022 17:46:55 +0200
Message-ID: 
 <CANNYZj-LemG5QhLnj14wqfkQy5S3zxAQRVMUqaP2VwkHbzOkGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] bitbake-layers: add a command to save the
 active build configuration as a template into a layer
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 15:47:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169923

On Fri, 26 Aug 2022 at 17:25, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Testing with this series produced some failures:
>
>   error: pathspec 'yocto-4.0' did not match any file(s) known to git
>
> Looks like is is adding the poky-contrib remote but not poky itself.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3996/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/4010/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4064/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4052/steps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/26/steps/14/logs/stdio

Yes, it fails when testing from poky-contrib. But it will pass when
tested from poky's master-next :) Perhaps yocto-4.0 should be changed
to a commit id that matches that tag? Or someone could push the tags
to poky-contrib.

Alex


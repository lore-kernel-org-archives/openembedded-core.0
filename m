Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011D5EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 18:26:14 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.854.1689877567212581912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 11:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dyCo6SmC;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fcd615d7d6so1738685e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 11:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689877565; x=1690482365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5IaIj/bq4UeMfmsYPbeqPZlYCwPRno2p2C32ZOgk86g=;
        b=dyCo6SmCHvYhMLr3exMSK7xeYOYoemL/Y3vEqd0twiz5psT4KPxUkAjDg76EGFG2lK
         xJUyljh205L3yE/3sk0xb9wMdWuMx0c2/ovUhYyTLq/h3newSn9iWM0bkHDFC9lzhU8A
         sYFLW6AlNqe5bZbsX2bRJIEC2lRvWInuC8qtfPkfWpJ44jdkkpDCwI44cTvhZzYwnokv
         BmnqRMSwqQA1aQzqy+MHd6Yqu0k/O2U1MQCBhflCWuJm3fsZh4TARv9L2/LAGUn/uria
         yfyFmRiVPgc0Q+DGip8Ep0u76/1mp6tYu8O+kVuj0kd8auEIvhjyJpZ/ZMREvaSCMs4a
         54Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689877565; x=1690482365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IaIj/bq4UeMfmsYPbeqPZlYCwPRno2p2C32ZOgk86g=;
        b=hzEmjKJ/dMkbgLKGtWqdVWlvwVYe01ww2v5n8pswVMChF5YbdNn2P15vFajnfNmyfc
         +9NuFkisp5Pri83cIgReVypNpyVnZBBBKtOsBOOqsVYYqh5xPpWaUjSz5RG/vbzgTZaZ
         Z0k1AdrDdgl4+1ubo3f0wGdqCkO9wsR1Gs5jPjmLTT7czEhNwVBq6gkeHU+/EzUOz3rv
         /5rh0Np0kVQ2MX8UMGzFQTs0UQaRGdHutJApst6sWyG2cA8NwxxAl+YbdD8qvvl8oVK6
         zrO96ZZvHDgVmserrdPhXlIrUnFmTnW361MBLtaStCtUmmrP/sTI+Q7yc1i5nm4wKBpA
         CRcA==
X-Gm-Message-State: ABy/qLbBH+cPfJ7tkCAALwvPK6a5UfbMvqFZ8VXTLsyM0xgEvbnCTT7z
	8DeHW4hcmEDlCD+5eCBVxsgwLpR+mz8HnoanMr0=
X-Google-Smtp-Source: APBJJlG0AleCFcpdSXX9S0J+jeJnaXogYAeAoQMXmuu0NtmawSrNodT5w2z8IreVTQA8DPIyccM5T8fiCBr7iTyScCE=
X-Received: by 2002:a05:6512:3992:b0:4fb:fe97:5e35 with SMTP id
 j18-20020a056512399200b004fbfe975e35mr3319302lfu.47.1689877564926; Thu, 20
 Jul 2023 11:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230719200252.1203047-1-charlie.johnston@ni.com>
 <17735F6200BCFB48.26345@lists.openembedded.org> <CANNYZj9X0mQn+bi758xiSAVa48d=NVEDBXCNkO89Fc37kWZ-OQ@mail.gmail.com>
 <32dfc0fd-aef2-ac74-7545-31f0e88f40e4@ni.com>
In-Reply-To: <32dfc0fd-aef2-ac74-7545-31f0e88f40e4@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jul 2023 20:25:53 +0200
Message-ID: <CANNYZj_DDJt7fAQunh4=sBgMDP+GFtnJAA5-1eooriGkbpWDrw@mail.gmail.com>
Subject: Re: [oe-core][RFC PATCH 0/3] Add packagefeed recipe class
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 18:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184651

On Wed, 19 Jul 2023 at 23:14, Charlie Johnston <charlie.johnston@ni.com> wrote:
> I could see reusing the logic from the package_manager, but it would require
> changes to allow indices to be created for arbitrary directories (instead of being
> hardcoded based on package type), and adding some mechanism to create_packages_dir
> in the package_manager/__init__.py to handle feed creation tasks/feeds being
> dependent on other feeds.
>
> Are there limitations on changing the API of those classes and methods to add
> inputs? Alternatively, I could split the overlapping code into a helper method
> instead?

Thanks for the explanation!

The classes were written for the purpose of generating root
filesystems for images by constructing filtered package feeds in
images' ${WORKDIR}, but I think they should indeed be extended and
tweaked to allow generic feeds that can be then exported to
deploydirs. In particular create_packages_dir already does what is
needed for a filtered feed, and there really shouldn't be a second
implementation of that logic elsewhere.

Alex


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C352C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 11:41:15 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.101830.1673350867537138843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 03:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=elTapzhY;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id q2so12157903ljp.6
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 03:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oo+7v0Yf46lKzjpnnk3ovgQiA4nnUYBD+F1YBQiZQZY=;
        b=elTapzhYrzbEsNaGy0TWVmkfAXqpwsiRKOmg4FP0XumhKsfu1+D0FWdpj9bl8JwMjY
         mRsfYavTSa50G4mrBecVcutDcckpMUdUKIG6I94DphyFamltsmLwATCRUyZknfouWGPg
         lbLyh0dPCSl/XHjR9HHhirhqEELSU637z5n+YzS8RRun5Ixq1y1c9STGLGHjxESar3Lk
         xznZ4Nhq/tZNelFmnhcmveVnvSrYJHCf25nzK5uXjEMLuYrthCoeTa+ObRiLNllqHnYR
         3sahzluBBHdQVUIx0C2YpofoPZYhnz3I/K+9M7y9Li+JqoGczCJsDtEJpGaKeUfSzw5k
         gM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oo+7v0Yf46lKzjpnnk3ovgQiA4nnUYBD+F1YBQiZQZY=;
        b=HSmyNCrRpj5PSl0GeZZ3Irg06h5cjIjj3X7cSYV381BktiTyy1luTezwN2ibtMdRO1
         UIv/+b5OUHUBj2g3y1Qi/jfRTHp5shbRKmWsp2Hm4GLPEaTDlKoBd0IqBZSJyNBhw4jK
         O37VqF6YZbaXgCinEkaPwaG88fCQ/Q7Xs6iZP1PcNYpH+3EnGAlbnCglYKPIWLi7UDZT
         oeuiVXZ/gpsrNho2R3cKMhOOPs+oK1TeBev8XBp1a1NQBTSG4+6edqS9xe03++58ROzp
         TGwsjoRC8PmP1AXnNJ+q2wzdmMCn2LAAg7/F3gGv44l61WA03wsbcdBbUMmNTCmj4q+O
         Wldw==
X-Gm-Message-State: AFqh2kph8CcZlR6GNNpZdG/WMyw1jUo+JE99848wepT67ZRj8epwEqoO
	ygG7HBeYMSQAOQzX0gTDZDkKaU9OSXjJVfSaMDs=
X-Google-Smtp-Source: AMrXdXuHOx9fmbalKQbsm5aYfHENitrMZQPm4gNOfnMOE7NTXUcnIVzkmw8JoaCf1wyQmpvGbfv+kjyEWnu1ED2eyAc=
X-Received: by 2002:a2e:a486:0:b0:27f:e99f:7f2c with SMTP id
 h6-20020a2ea486000000b0027fe99f7f2cmr1622281lji.222.1673350865458; Tue, 10
 Jan 2023 03:41:05 -0800 (PST)
MIME-Version: 1.0
References: <OS0PR01MB6178F685B87CCDCDCDDCC32FA0FE9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj8u-5c51tDTSEnDXo2NVo8Rxem4UHvrZr5uzz9Fg7U-qQ@mail.gmail.com> <OS0PR01MB617847A78FD3AA141D22EFC0A0FF9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB617847A78FD3AA141D22EFC0A0FF9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Jan 2023 12:40:54 +0100
Message-ID: <CANNYZj-bX-53_WzFvRWMwQTHLdzYdymzqBoaUXOCEBZWLNDuug@mail.gmail.com>
Subject: Re: [OE-core] How about move nghttp2 to meta-oe?
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 11:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175712

On Tue, 10 Jan 2023 at 01:43, leimaohui@fujitsu.com
<leimaohui@fujitsu.com> wrote:
> > libsoup has a hard dependency on nghttp2, so you have to add meta-oe layers to
> > your build.
>
> Thanks, I see. But how to fix this error? I wonder if I can add a bbappend file into meta-oe?

You need to add needed PACKAGECONFIG entries to nghttp2 recipe, then
enable them in your distro configuration. Then submit resulting
patches to here. It is fine if PACKAGECONFIG entries refer to recipes
from other layers, if those entries are not enabled by default.

meta-oe cannot change recipes from different layers with bbappands.

Alex


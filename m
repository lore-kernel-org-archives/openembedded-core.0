Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B856C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:34:22 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.3882.1667831659855312268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QXWBfnOr;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id r12so17035683lfp.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g3TEoPORAotFBQyNdc6QfrXokZZrS31i8f1bBvu4fNQ=;
        b=QXWBfnOrmqJIKuoTb+PQ5C78GS3OFjFyqruAy7hgizHevsB1/m3NDlxPZhREdnE9Ls
         S3iZ2zAGOuGR+TMy0j/aEXt9InfX502UdY2iqTFAY/mM+uhbFIJ/46qgPXow0Ox6fvYE
         4gXBiy6Q4js4DupTVvhxrEkegtA7BdAlRUxyUdxvWDOCl2k+QTgtFTKnEkERTEfjHzaQ
         SGU3zrMghVB5A0MW1iiKWT4MfwkN6yZmIkhb7BXbyg7Unzfn89jOnvD0EuMy60oiPV/f
         DTeFTFe8gK4uom7xFOwTaj6MEQE1lq8BCbA/k55Xa43JitlGOdMPgm/asgJmIFYyT4ug
         DICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3TEoPORAotFBQyNdc6QfrXokZZrS31i8f1bBvu4fNQ=;
        b=pv1SU4esLphgbYNjwDcO3SDvZgOFjbMDLeMxYAkG9tBBWUfgorKwIm3QjQOdBAh31h
         AhJVsNNJ4/pN8ZxLHbwPSg3g/l9MqbZe02b4Lh0J3Ka0bk6d9LnJlfkPuVNd/hoKvKUG
         NvA9gkLT5NDwLx6DNoT3/+pWxrQaYO6dRn2a/9BeUN0pvm4JVZIYseaErTQR0b0njt7f
         2IVVGs9LA9GWLL6xSggOU/fveD9tPs1DC4TZe58x++Epqnx9bzMoFC8vnSv1yRfmAzxc
         910zH2yQ37PlPlRF4SHPIymyk4B1BHbR7GK55dPLOwCMAcEfJKZFjszqqnwukcFGqagm
         nOvw==
X-Gm-Message-State: ACrzQf0cqmMhPKj4xrrw4/r50/zuMGqEmdEoMEU2yBVLSpuIy8lswUVS
	c8QsNsrQEdDtXTm1YvESQbJuJJ9i4WDt5CFw+HA=
X-Google-Smtp-Source: AMsMyM5IY5beljedz1MQjP6gdUh5/bu7I7cjwFZwovFSdeIBqGHUA8qy1sijtAmAet1Uh+A3JlRVzYBgTE2aFIBkIaM=
X-Received: by 2002:a05:6512:2399:b0:4a2:94d6:da27 with SMTP id
 c25-20020a056512239900b004a294d6da27mr18107308lfv.131.1667831658010; Mon, 07
 Nov 2022 06:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20221107135423.19834-1-s.zhmylev@yadro.com> <CANNYZj_Dter5Pz_2EVE=9GBhK2O6OTNUiKLB02kFoDQg7_MiHA@mail.gmail.com>
 <c7f818203a7dc8b03680dc69a2ce21c7601a53cb.camel@yadro.com>
In-Reply-To: <c7f818203a7dc8b03680dc69a2ce21c7601a53cb.camel@yadro.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Nov 2022 15:34:04 +0100
Message-ID: <CANNYZj-tkqFeAy4q+MdcEiTXfMRqzH-tCjUuWdr-G3Uz39gnNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] wic: make ext2/3/4 images reproducible
To: Sergey Zhmylev <s.zhmylev@yadro.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172849

On Mon, 7 Nov 2022 at 15:01, Sergey Zhmylev <s.zhmylev@yadro.com> wrote:
> Alex, thank you for the comment!
> Is it possible to add the note into "git send-email" as it will be
> visible in the email but won't go into the commit [message] itself?

I think you can add 'notes' to a commit message after three dashes:

commit title

commit message
---
notes for reviewers

When applying such a patch, git will strip everything that follows ---.

Alex


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE84C001DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:39:24 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.765.1689799159308463260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TmXNlcB3;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso33077e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 13:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689799157; x=1692391157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qdt5ZJp2uNbbL8AVjbMBO23W+LwB/hS6OOPkN2RFitE=;
        b=TmXNlcB331PxbEfGCYUWjSuYKwCMkD28KCuS7SDgD7p56rjEXB1qTiZYuSkZCpppZ9
         LYODDnQD0cxT2rkIt74w2tpsY1NNKU8cimpIKMPx/cGV0PKuiIO39/r6RpsDGRcMrUNS
         gSvufJogsV1F7xmHsZaNjf51GLDsx5S8lzEfBI1d+gBRwXMtrDBQHCQ+4RN5y+Vb0Rgk
         FgMizKU/Ycle3cmnjVewosHaZqVm2newPo773dlWGaDGYGYs55ZH8C+h1Kv6dlqgoq7Z
         sz01l7QjuwAporReiyZKwGi0Y6inRDXfxxxGvToAHJ6I2lYRjQSaqviRyOIgR2UpsGUa
         pZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689799157; x=1692391157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qdt5ZJp2uNbbL8AVjbMBO23W+LwB/hS6OOPkN2RFitE=;
        b=im14dJSs7/oYbC6hl5k9kG7goBta1ylAyh/sx7YOPh+7RwVutoxpuIz+5qLnIrBarm
         z8znKQJErKDIG1ZYwp2t6srdIu3yy+/Qo5tpGC8/PKN4N7mwx5kLk1565Eglcnp/mhis
         X/90u/MyEdPdQvhFfO4QKqgR8xGg53X0K88r7StaqL5J2f2CsEqo1Fkt52jlF291JS9O
         P+VXzIS5RfAf9ktn/oyLwoVDrA9rUN7cOEYn709N582qARoGk7KJ55kft3yUiX19i1cz
         MEK//SRMgDS+RjeN/oo4Y48LJCwCT973QXcBSmvqOZTkAZZD5hHOKe5dcFLSRE/8vZNh
         k8+w==
X-Gm-Message-State: ABy/qLYuOiEs1iE3OHHCwCAseX78qJBsQBwuA9RdJx8yVwJNkE4PcSgX
	OCNHDMx9Um8Tn8noSx6nj0jc8Mn+O7qktAi6QV0=
X-Google-Smtp-Source: APBJJlHh8/OqGAI1YO9AHlGIB/zNuVv4wCbRgo3KkXuZXAlYSpxUau4pm/nMVxPmU/cFfc63vy/ms4Ly7JOoBfhRGI0=
X-Received: by 2002:a19:501a:0:b0:4f6:3677:553 with SMTP id
 e26-20020a19501a000000b004f636770553mr97528lfb.38.1689799157248; Wed, 19 Jul
 2023 13:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230719200252.1203047-1-charlie.johnston@ni.com>
In-Reply-To: <20230719200252.1203047-1-charlie.johnston@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Jul 2023 22:39:09 +0200
Message-ID: <CANNYZj_-Nfmcon6GqYGqtrK+nkmx3goRqrJN4g6dxnvVx801iw@mail.gmail.com>
Subject: Re: [oe-core][RFC PATCH 0/3] Add packagefeed recipe class
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184611

You need to start by describing the use case. What problem does the
code solve that existing packagefeed code does not? Can we rather
extend the already existing code, its tests, and its documentation, to
support that use case?

Alex


On Wed, 19 Jul 2023 at 22:03, Charlie Johnston <charlie.johnston@ni.com> wrote:
>
> Hello,
>
> I've been working on a packagefeed.bbclass to allow recipes that define a feed. I have a working prototype which has been tested against poky using all 3 package types.
> This is my first time submitting this type of change, so I'm looking for some feedback to cover the gaps in my knowledge.
> Are there tests that need to be added for this type of change?
> Should this type of recipe class be SSTATE cache enabled?
> What documentation changes are necessary for this type of change?
>
> Thanks,
> Charlie Johnston
> charlie.johnston@ni.com
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184601): https://lists.openembedded.org/g/openembedded-core/message/184601
> Mute This Topic: https://lists.openembedded.org/mt/100243054/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


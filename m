Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75278C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 15:37:07 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.11006.1666280223105931157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 08:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MZe5HMUp;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id bp15so34243006lfb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 08:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vXYwQItOn4+c/UoTznRxMIHYS3+LMLqEF0OA8Gp5R0o=;
        b=MZe5HMUpsozmKn6YNqnp71fhpp77izDkaPB0dWfy1TMBiCrvOGK3pW6UniQN/R4nBb
         IO0KqtKIfawrQckjv0w9DiO4nc0dnYV9lVjVG4G0jsP5dQhpXSOJ2xJ3a1BJD+Xidzlw
         VJ9KHx99UccPLrqn0nkd8LFiwBRcMdoCw/UedHQEY94bhg/2Oo4PP9w+z47RHuUiOfGx
         fjFJZFRPZysHWVKIMcd5cuMUDvUDUJGyP2ChgtSiz86gxkz+ytMsNlNL0GgUoC0CNaoh
         aBdTzu1JNf8vAFcYpo1mLIuDRxSWSWKqPQUz/IrnW0zDvB+STjmYUeaQ70HlCQoigOXN
         8rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXYwQItOn4+c/UoTznRxMIHYS3+LMLqEF0OA8Gp5R0o=;
        b=0VJy3NQcJ0rYQ2By3tos63+N1h7G+nnrx7MU93Y6Gx/AH0NTOir0EO0hZ1nM/2JAfU
         pRS6sNObotzTn2DRUNDE0eLtaByQUOt80hH8iIyM7k5Eq1N3REp2i4m7YqhFAxTsmct7
         XR+S6WpgKmpKgVcQJnGowr36/qisgGmKvVU/fIo4gCCkqDuf8jhNkbs2sU8OGqP5AnaF
         rofmW0cNpACCJGrrbo6PPSH+05ANdSL5IigIseMTrNj3TGgJXjBMgTPPByKhl+kVMvvZ
         98kd7smldB59b+XWdHf5gkw0o2mXzOsJvsMgaAiPyDXm0i/YJyDV681PDbUyhBrhmbuy
         4sRw==
X-Gm-Message-State: ACrzQf23NOmcTTIV6lT6wV1qJxtMDdzNQSe/0egg6+kBH9H5U8kGpwG9
	87lRyfmsN4cmHV8K3DBJs01PnL3009eVCTm9eAk=
X-Google-Smtp-Source: AMsMyM6DgrPTToQwIVRpsSvc8ULC3gnAjD9mYD4SAi3K6VWjixhPqGmWCOnOO4uB37tTY84JpsRhzbtzIoKGr7ehWeE=
X-Received: by 2002:ac2:51bc:0:b0:4a4:712d:1b83 with SMTP id
 f28-20020ac251bc000000b004a4712d1b83mr4749406lfk.345.1666280221149; Thu, 20
 Oct 2022 08:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221020135531.57483-1-arturo.buzarra@digi.com>
 <CAMKF1sqtNt+5UXRc18LR8Uhq9Vcppg2nadsQVpabKw5ekoNjMA@mail.gmail.com>
 <CANNYZj8_C_=HW+ALVikFWGcWH5yqEFuknFQtGKFuedsz1VxfXQ@mail.gmail.com> <CAMKF1sq4+sdk9crFO1SgMLM=P0JMKmqKe2bKHXBVEXD_4Z137w@mail.gmail.com>
In-Reply-To: <CAMKF1sq4+sdk9crFO1SgMLM=P0JMKmqKe2bKHXBVEXD_4Z137w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Oct 2022 17:36:49 +0200
Message-ID: <CANNYZj9ud2VWdLvRjANjoW7itmzs8Dr1AM8vur_YF6yxtmTYLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] run-postinsts: Set dependency for ldconfig to
 avoid boot issues
To: Khem Raj <raj.khem@gmail.com>
Cc: Arturo.Buzarra@digi.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 15:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172001

On Thu, 20 Oct 2022 at 17:27, Khem Raj <raj.khem@gmail.com> wrote:
> Good question. After= will wait for dependency but not explicitly
> activate it whereas Requires= will
> activate it as well if it's not activated yet. I think it's best to
> try this unit on a system without ldconfig.service
> for finding the exact behaviour.

'man systemd.unit' seems to say that the wait will only happen if the
dependency is being started for some reason, including reasons
unrelated to this unit. It stops just short of saying what happens if
the dependency is not going to start at all (which would be 'nothing
happens, this unit simply starts'). Not a well written description,
there.

Alex


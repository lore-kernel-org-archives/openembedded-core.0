Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87655C00528
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 08:32:57 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.9661.1690965169026673699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 01:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=a5aIXEeO;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fe1c285690so9586032e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 01:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690965167; x=1691569967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZfS7WsIU00obN9V7jWZihxq8dOlChQl1al4Z8xgFdU=;
        b=a5aIXEeOyQ0QffT1Jop3D7/nlH/nUzhCFJxJntvEIRVMxg5/yQwd11BRlLL/wzTdm4
         5f4rGZsjRbXRLM9MEnGIjUsg9/DfBdK+6dVZ0Krx3qHNFO3bhZo58WcCZAbKLOrrxuUm
         oSjhtQVaZtMwSTqcjt2ulRWLZvMXhsV6QVnoWCmopcxgU+eG5E+orhOjD+RxjPBj0dda
         RCojCgYBHzIODK5+QiU9Uhll2ioSlo9D3lJFHQ3IK7rCL2p9fEnZVZzq0pVxxKzcYiM7
         CFVT+7qzWXlQ7wzXGvJFpv4V6F2d2l3kBfRfcZRNOzPywNsEbHDV4uzkcYzI9CMxtsDt
         uuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690965167; x=1691569967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZfS7WsIU00obN9V7jWZihxq8dOlChQl1al4Z8xgFdU=;
        b=dQo2K7Y4eFWu3q4ca99seZ0hehVFnn7t2lo4Y3Mtr52UJsHiMVXkCpct3K+w2ppOik
         zQZLgBvSs7HJa8EPLTp6Nqd3M8wrjZU+GtqZdPvXPSIPBJP7bJMZnmpdMWlRgXMCk2i3
         24yEeNw/QXz7x4aK52QzXgzJ9SnRytNd4tt+k+DJoo586avp/WhvGjEuWrquymWOAHjP
         uH8cALwn7qhmLfxeqdfodg/myblxiiLoIEL1iGH7tXzYWJh5gD6vdB9a8Ek78VF4MSpv
         /x2pesdfQE8gna7xdahzAVfggxZUkSd+xI+H/eGHcTCD2ayWKdomw1496lKCYRypKbPt
         5lwg==
X-Gm-Message-State: ABy/qLYw05x4jYUrVj5/IrdO7wZNBj71arnEtm/TUyZsxfzNxD0HjR6t
	PDOooNfu1cCT+iZm8LRDZBtNFYJnYTyu5XknQ5I=
X-Google-Smtp-Source: APBJJlGU8bBWP+Zrj/jBs0QrpQS6tBOEXH9sAsWLVA91o7z078OV0teQKbjpyAIA4PNy4I8VMBKsdqz2GGKqkv/G4f0=
X-Received: by 2002:a05:6512:3613:b0:4fe:a2e:890c with SMTP id
 f19-20020a056512361300b004fe0a2e890cmr3329472lfs.49.1690965166438; Wed, 02
 Aug 2023 01:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230801094823.4007276-1-mingli.yu@eng.windriver.com>
 <CANNYZj-B1hAkm_cRa+LPegNE7CpWBOZ=v3ZLg7=9K5-6q5R4MA@mail.gmail.com> <2428673e-04fd-a745-38c6-9e3c18f51cad@windriver.com>
In-Reply-To: <2428673e-04fd-a745-38c6-9e3c18f51cad@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Aug 2023 10:32:34 +0200
Message-ID: <CANNYZj_9iqUYACMUmXYLdJyHpZowjawTeGpPY7g+71AUQSDdew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuppc64: Set the default memory to 512M
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 08:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185383

On Wed, 2 Aug 2023 at 10:30, Yu, Mingli <mingli.yu@windriver.com> wrote:
> Did a simple check against core-image-full-cmdline with qemuppc64 just
> now and it can boot successfully with the default 256M memory.
>
> But it failed to boot with my customized image as the attached
> messages(/var/log/messages). If not change the default memory, how to
> resolve the OOM issue? Any hints?

You can set QB_MEM directly in the recipe of the customized image?
Oe-core does this in several images which have specific requirements
for larger RAM amounts (e.g. test images where the tests require it).
You can grep meta/ for examples.

Alex


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A91CC433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 15:40:17 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.11058.1666280413790875811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 08:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bObTvSuk;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id a14-20020a9d470e000000b00661b66a5393so89096otf.11
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6WUMF1HAJ2EQfq4qhwhGRWrz86S7LW4t2l7jXv06Ung=;
        b=bObTvSuk9jR/GlYs5Mpc/tTQEw7Ht/R6Eb1lMV8S8QSjCEzfc6S4L7tIJqBKVXP+WT
         UKO7dAlkVQOkYTiotbeukpC3LBJ/0UgfKf52VWv60QJ4jtZmFYeACU60G9oZ0Z51CL7Y
         daDsmgTfNvFxa+wUCvEf+xXR6CD8p+wZ20rOUSDjaG5igsn5LSuwGaxKFYr+H9sGOsWk
         Vu77p+/5ZK2Hoob0Eykv5Ov7ywkYr8F4jhGS2C5Tyl0LkUdU8FTnx1OKS8vj0MnQeFEW
         P7RMPBAg0jZgENvu0k67Br2M0/me6U5WF73no9bEFJu2FbSdAvwkEXyl+It2UHV+165g
         Hhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WUMF1HAJ2EQfq4qhwhGRWrz86S7LW4t2l7jXv06Ung=;
        b=yRK7VhFRZ1ilNr1fHQ4bSO+B4e105McRdgEYM2p5STStdb9GQOUj8YQ5T0/iXh9USE
         /c/RosCe7LvIR1YFFMfnMePkEH1yfrLCFrf40dtt1DvxKrXh8mlPvuIBZ7FHF+ZYvLgj
         E+4U6UAi/lseVXN0VAZARauZ+zaDeEP95vV0sy5CPJlGg62/TaAnLVnQIEZHx0z72pdb
         33TVX+UhIEFtWDCbuTzgpl1Mi9pLf5wlRvPVgqnLmOkWFlL7YhFP/8C3ZoXGibu2p9w2
         iG6Ceo7UyAoLGkEol71hGYW6ph6nwxmlJvkr2YVVhZtsfrhXo2QeSS+8GnoHengVmnin
         sgNA==
X-Gm-Message-State: ACrzQf0lUKQ33MzsTSsJRCWns2k4Rmzl1+8DE9Z+FmjSzZ4qoUDxHHE2
	rL3dO01AatjFJGDbe/qt4y3E9mo80Y7d45SFF8w=
X-Google-Smtp-Source: AMsMyM7VDG0fdKziUVlnSwdBHjNp20VbS/+3ViYohoCHaaOyLzCdmimbrAKz6ObQHQX4Q5h/dxfjcZO5kH2Hb9cZOyQ=
X-Received: by 2002:a9d:74c6:0:b0:661:c309:f0cf with SMTP id
 a6-20020a9d74c6000000b00661c309f0cfmr6991420otl.55.1666280413018; Thu, 20 Oct
 2022 08:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221020135531.57483-1-arturo.buzarra@digi.com>
 <CAMKF1sqtNt+5UXRc18LR8Uhq9Vcppg2nadsQVpabKw5ekoNjMA@mail.gmail.com>
 <CANNYZj8_C_=HW+ALVikFWGcWH5yqEFuknFQtGKFuedsz1VxfXQ@mail.gmail.com>
 <CAMKF1sq4+sdk9crFO1SgMLM=P0JMKmqKe2bKHXBVEXD_4Z137w@mail.gmail.com> <CANNYZj9ud2VWdLvRjANjoW7itmzs8Dr1AM8vur_YF6yxtmTYLA@mail.gmail.com>
In-Reply-To: <CANNYZj9ud2VWdLvRjANjoW7itmzs8Dr1AM8vur_YF6yxtmTYLA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2022 08:39:47 -0700
Message-ID: <CAMKF1sqftPYeE4t7M8i=zv1JKQJV6uomidbjh9xc+6BsZk_ryg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] run-postinsts: Set dependency for ldconfig to
 avoid boot issues
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Arturo.Buzarra@digi.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172003

On Thu, Oct 20, 2022 at 8:37 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 20 Oct 2022 at 17:27, Khem Raj <raj.khem@gmail.com> wrote:
> > Good question. After= will wait for dependency but not explicitly
> > activate it whereas Requires= will
> > activate it as well if it's not activated yet. I think it's best to
> > try this unit on a system without ldconfig.service
> > for finding the exact behaviour.
>
> 'man systemd.unit' seems to say that the wait will only happen if the
> dependency is being started for some reason, including reasons
> unrelated to this unit. It stops just short of saying what happens if
> the dependency is not going to start at all (which would be 'nothing
> happens, this unit simply starts'). Not a well written description,
> there.

right. thats why I think its good to try it out

>
> Alex


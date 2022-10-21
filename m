Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9069FA373D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 17:28:42 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.725.1666373320574712536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 10:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h303+e0G;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id be13so6340044lfb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zd1bGN7uohISSovd0DSzRZ0/XR869FfX7ZphH793UEU=;
        b=h303+e0GXUiYtgkKgUYe9qnhywzyGZMWqyAPPlZ9PztEew2j2U22Gf22OdGqF7dgCD
         lGJxQxQf5whtD7jyPE/0x5kT5Lj3yE9ei2SxKciUSOHra+KfbIrKfI7FLpf08ncx6Tqr
         19PzF0OdIqQiMyMEjzFjQobVls59ENmD2D09Gaam6Lc2oulXtWp3ZZIkzqcO7U3tr3M1
         TLGvRMibttNsoYqsCEKUDMKaxHKlOTBnZtocCzxwnJty7CPfqVg3LJhx9mY4EzsucA85
         N8djVAu99GnvtTp4TLoA5Hfmt40hm6JBexMLW4kPJHRrQSgeVm4h4kBqzCLmq1NbM2ex
         NCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zd1bGN7uohISSovd0DSzRZ0/XR869FfX7ZphH793UEU=;
        b=Wmv6D+B8OuFswyZSFDh9hYJetA18jwEByyIdQT80EWSZDHdwn3hLhygztYmlbHyxL2
         oeWSE2rFS+7ZgM9QxOxH0n5VmfHw7lKgLTM68lYik9KbZTYKNLUGghZQT/Dpb5FypFy6
         B8IuHr9Yf+2jqG6StoLhjFsCiI5JePkCtg0RT740uaBb6ES26XKuQQYnyNnOFNs4WUL9
         QBWIe+JKJN4NjVvkX70SbzvRo4DL87kkneV66YOlEc3pPY7c7JA7vemldfzwon90oZgH
         7fSYuW2E+u/yAWsS+gaAvkVTgnSGLjYT/tkqfpIifBbnqsok4Xo3MbIs4/vuA7UEhCL/
         Bmbg==
X-Gm-Message-State: ACrzQf0MfwL1ce/iQKQfyh5t3lkkB2/uq5F2T1nNz/ZpTER1DIvEY9U0
	u5CcW+LOcBrk7qRLyzmSHlaIAhFUm9LUP83xfEg=
X-Google-Smtp-Source: AMsMyM43++vhA4Fi3tt4pKp4H33Ggu+ZTeZGDD9ZT8QeuMcmev8cAy/gBM4ZMsVEBbQVSY8pgVO2vHSnGGhwi6lzU1k=
X-Received: by 2002:a05:6512:2399:b0:4a2:94d6:da27 with SMTP id
 c25-20020a056512239900b004a294d6da27mr7412150lfv.131.1666373318619; Fri, 21
 Oct 2022 10:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <CANNYZj_-7o3VNCONa1sTgscrWOZtSKy6iB1mL6pOT40wt5fTow@mail.gmail.com>
 <CAMKF1spz7=2NNxXj5w-ZAAohUz9ZxJ=d=eGvCg2N_fsKe1a0aQ@mail.gmail.com>
 <CANNYZj-0DUfDdJbnwZPc7kof90ZYGj5-8u5vuZtVH_dbUbSb6Q@mail.gmail.com>
 <CAMKF1spz+swUnVW3=GdTLwd0xGNnuMf7F1NqnufGyk+eoTkPnw@mail.gmail.com>
 <CANNYZj-6BPL-oou21RLszJiJB6rOC4niAh4-1U9kn1-MV-sFGg@mail.gmail.com>
 <CAMKF1srFawQ7ycwmJmw2F-me8JM5bXZ9YBHhhjpyvkgud9Bx9A@mail.gmail.com>
 <CANNYZj_nHbJaD75PpxsTtV72Dmhw_hO9Po+jCjjgOOP3dJY-bw@mail.gmail.com> <CAMKF1srBUW4GsRorupnU_wYXR2U1QwUz9LCT+beOOA_Kx=F9=g@mail.gmail.com>
In-Reply-To: <CAMKF1srBUW4GsRorupnU_wYXR2U1QwUz9LCT+beOOA_Kx=F9=g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Oct 2022 19:28:27 +0200
Message-ID: <CANNYZj-UfuhCnDKm9N1Y4CGtTeamQtPOTOhzmqQxVhZo9_+g=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 17:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172039

On Fri, 21 Oct 2022 at 19:16, Khem Raj <raj.khem@gmail.com> wrote:

> anyway, the builds failed at exactly the same point so as I sensed it
> does not work.

You need to find out why though. Upstream maintains a list, and we
need to use it, and not duplicate it piecemeal.

Alex


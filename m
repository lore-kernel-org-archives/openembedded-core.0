Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D38C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 17:00:12 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.407.1666371603063143283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 10:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=alrmeDQr;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-13b103a3e5dso4304805fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 10:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SW66P1QXQjhLNrdVk17ui/18c3nAzRJ71lR4lDz35yU=;
        b=alrmeDQrbp93848icIoY0VZRxmryIbJpiczfRRgBaRui6xZJGIep8Fu0wBuSH10RVj
         v5MdRZ4x0lFFgt71TxmlHcHH0bzBBJ6aNid2qGaJ5AsCFRTRSCKOsjc+z9vrO+zJNpc0
         3V61e9Xb15xDN8N6O8sghSgEHxIQw6ozWdDzTNDBajEoQyrTEYlXu311xDi94kuri2Fi
         pP0/m0L6aFFSpoNnefdy2BkHdeBToEUGNvrKTKPUrrpIKR8RvsW1XBLh7l1dUBjLfMGI
         biE+ywQqK5JB6E4e1c2UyEAGsggNfTbh9IXdZjDaPFmEqeqaFK6d8j4lmvJ6d5w1KI2r
         H6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SW66P1QXQjhLNrdVk17ui/18c3nAzRJ71lR4lDz35yU=;
        b=TxO7Bz/RhIlWYIyyqnQqLEpIsrWNzYZ08Q5fn8xC734OmvS9sLLHQR/5cHniSsER5A
         L4MGkyLPN8jokUk0FWmrD2J3PCeIdyrKqWTbpBt68z7oerzek5p+n9pwNFt1Mi37twsk
         ahrzmXs4452H9/WFOHevZgcD8Z/lTHqFsRijpeYgodmmoZ4edw4T0I+3fr+TMsBVO8Ac
         kvKQJt/MxioVk0MfkfiuoImSgHOIremCjZvNeM46ST5Xib70OcgJPwnJmp/sJUsx1FNx
         Gh4QwIBro5gWuMopz7s9EJBosr3NuKn+rj38UNRriqUKKIq9sG42E5j/AAzTZtnreIy4
         7EBA==
X-Gm-Message-State: ACrzQf3Fa2tjC5vyI5d27OlPJl7EAID/D2fgi191zYmgKXH5hrh/AyjJ
	QU3C1Th5XwKBM45Pcwq/Bwu9GLKcVYXbr9uVstiGd3Yj
X-Google-Smtp-Source: AMsMyM5hNrxPl7O+uWR7F0AChrXa7YL++KPZ5wIvkVG86NcJ/fDKEQedhe8ZNL28Z7sgBMaxMcK1fXhA7FC8V9vSScI=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr29103568oae.262.1666371602323; Fri, 21
 Oct 2022 10:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <CANNYZj_-7o3VNCONa1sTgscrWOZtSKy6iB1mL6pOT40wt5fTow@mail.gmail.com>
 <CAMKF1spz7=2NNxXj5w-ZAAohUz9ZxJ=d=eGvCg2N_fsKe1a0aQ@mail.gmail.com>
 <CANNYZj-0DUfDdJbnwZPc7kof90ZYGj5-8u5vuZtVH_dbUbSb6Q@mail.gmail.com>
 <CAMKF1spz+swUnVW3=GdTLwd0xGNnuMf7F1NqnufGyk+eoTkPnw@mail.gmail.com> <CANNYZj-6BPL-oou21RLszJiJB6rOC4niAh4-1U9kn1-MV-sFGg@mail.gmail.com>
In-Reply-To: <CANNYZj-6BPL-oou21RLszJiJB6rOC4niAh4-1U9kn1-MV-sFGg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2022 09:59:36 -0700
Message-ID: <CAMKF1srFawQ7ycwmJmw2F-me8JM5bXZ9YBHhhjpyvkgud9Bx9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 17:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172036

On Fri, Oct 21, 2022 at 9:19 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 21 Oct 2022 at 18:07, Khem Raj <raj.khem@gmail.com> wrote:
> > Looking briefly over the code, my educated guess is that target names
> > are still not matching
> > rusts tuple uses riscv32gc but we use riscv32
>
> I believe we have a remapping in meta/lib/oe/rust.py, can you check if
> that works?

This is mapping host uname, it wont work.

>
> Alex


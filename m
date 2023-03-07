Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAFAC678D4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 10:42:14 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.11433.1678185731909904039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 02:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B6dvT1W0;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id h3so12632318lja.12
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 02:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678185730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RK8ivT7hu0p8l0w1bNsv+1mH4Wy0B7jf9/sMWUbONSY=;
        b=B6dvT1W0vnXKkwDW8pcPSxwl+0vMRir8YB+IhV2vj+LuM/cWXJZ77H9jYkLkubWHHs
         Is8mnTj4QQlQO1IZJGpmNXHM25NZwoHGuu7EbvY4j5CK/ZwJA1N5Ez7uFFYfW128U77H
         Na5OCDI3uTZgoKuwOldAn5D5OVOf9rz7MgBC3t0aFOMp50CKn13ZiS5LEj3wk5nPb8a6
         2bxCjDf0G4Zu0DiZ7RLKcYBD8Eop3iHIRxvAsdRb1d2RC3mw1nbjTy8pVLJwvo0Mziwa
         Bow2o9c6/GZOiozG/JORKZHMnRKbdHJYH0pKUSDZdsiB8L9KOfLdrliY9Q9v5uLbYuN+
         sDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678185730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RK8ivT7hu0p8l0w1bNsv+1mH4Wy0B7jf9/sMWUbONSY=;
        b=yOgpvaCBRNN1wY20WERlg8iwTV7ywrk1bztzpfwxLT4ahAaUyVVO2a0HQyJs6Vfgkz
         IdVER9+KzdxYP0k3NZ4zVeKFev4ETikGOEad6uDHZjXgPnX5SOefiRyk6+TOUdGxmA4j
         EsIKMNchg1jY4zejOyDxdIRWm4+vG9LlJZ2z7gDWXhoN/z7cbo1tdmMEm+Ubk4rU1i4D
         9rnSC/AiEEqz8/oEbcdo7HiDK4p4quKz04HPoApr7y331V81XeTwi6Srdfv1YeHuBcf5
         XtB6ionrw1cbydBGjJw5q3Fy1njVG1GBozqRsg0DUiwbNBTExWqDTVR96t8QfS6FEu1a
         iEuw==
X-Gm-Message-State: AO0yUKXLSxptowJ0zAoN42A6b6WwBmgaEAjXufhpBSCj9oZv/LZlvW+y
	nHgh8ZyjinKWvycs34Y+zf31x5/s6FA6ylnMcl4=
X-Google-Smtp-Source: AK7set8iVS6hWUvZ1ecekrzwCDjnysAZBT4zRV/a9U27J0dkydItEzULbaj7zYT7Kg58tLOPks76AKDQC1uYh1rwUXc=
X-Received: by 2002:a2e:b5a5:0:b0:295:93eb:e790 with SMTP id
 f5-20020a2eb5a5000000b0029593ebe790mr4155295ljn.5.1678185729782; Tue, 07 Mar
 2023 02:42:09 -0800 (PST)
MIME-Version: 1.0
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com> <20230306091108.3347363-2-zboszor@gmail.com>
 <CAP9ODKqgw7+wv9VWTHF6KrNmcVZzgdujKNTthWiM2zCxJZXKgw@mail.gmail.com>
In-Reply-To: <CAP9ODKqgw7+wv9VWTHF6KrNmcVZzgdujKNTthWiM2zCxJZXKgw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Mar 2023 11:41:58 +0100
Message-ID: <CANNYZj9qaL310h66gXiP2ZR2f7ywhWHDzrgvFnyMQH7cFwArqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/3] mesa, mesa-gl: 23.0.0
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Zoltan Boszormenyi <zboszor@gmail.com>, openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 10:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178101

Just wanted to give everyone a heads up that mesa 23.0 started to
strictly enforce that driver versions match the libraries that load
them:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20069
https://gitlab.freedesktop.org/mesa/mesa/-/commit/1026d29344192755dd340d6ac=
13a9674189d2d61

This breaks our implementation of accelerated virtual graphics which
'outsources' the provision of the drivers to the host distribution's
mesa. Unfortunately enabling a useful set of drivers in mesa-native is
not straightforward, as many of them rely on llvm, or pull in other
lengthy dependency chains. I'll see what can be done: we'll probably
have to guard the rich set of drivers with a DISTRO_FEATURE. Ideas?

Alex

On Mon, 6 Mar 2023 at 16:54, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Em seg., 6 de mar. de 2023 =C3=A0s 06:11, Zoltan Boszormenyi
> <zboszor@gmail.com> escreveu:
> >
> > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.co=
m>
>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


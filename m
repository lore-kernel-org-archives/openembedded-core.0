Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD46C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 16:21:06 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.75861.1680538862145379320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 09:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zL4ExWwk;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id eg48so119464764edb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 09:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680538860; x=1683130860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSX540uiD1wZSHWM+hoprwdzdlSEda6PSO8SpQtL6Yw=;
        b=zL4ExWwkYF998p9PHdKioRtBEpwyfcHPJzx5Ub7IalVvTn3IU7PoFi7x52RX1FOuNB
         JCqPZT7Kl+UobZtqa6EEB5IF+JwDudmS2i3phqv8+D4HSX+3uLEhnETDeTwyGZeA0Ys9
         4+VYMIzV3V1HbV0McyebajC5l8X7XAhiFTadmi51gTitTIiDRGSgYeJwUTMqTiwSb1fP
         1GT/hPCm6nYHL9mxleQ4wu6ohjS1Eal+A1TBzoR1sZ2J9684ssEQ4G9F8eKgUFxabg1l
         WEflShJM0dzpcvzIVAOALYcC6TRJrAsnqG1YqhGJA2TTgU3BygVV5seOry6gF5kJ6Qhk
         glMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680538860; x=1683130860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSX540uiD1wZSHWM+hoprwdzdlSEda6PSO8SpQtL6Yw=;
        b=ZcGjNvoCy5/wXWRx8bYlQhUagKHfLQ4O0kMEEOPJmpWPBrkl9ElZ0h4K6ETljHc1p8
         RBjZfMYpq88z85tE6goSDJF2wTSXi4nqmypg5qmewZEKqytJUYI9+fSfRlW+TqClz6MV
         ZAadqIvJVIY1X+ff+wYrC9RDydS6ugiE57YfP7E1PeNVMcQapYxU+dXKCcTh6tfpGcYd
         isa5CQegLqK+uQffejDMU8p0TwQxD5o1aAB8PYdge4N4jZS3Ya3K4t1dc0CaEWjdSI3g
         glqUVXP1jf4P2MEUE17BI/mtjHY2jHieVdet/eS5PDDkrjLFZKoAjZmvr1PzNTwPBIOm
         /5aA==
X-Gm-Message-State: AAQBX9cdCfrTbKjjSwPKSYxZy/i8hFmsAbZ4SGYsLqhzsTXEr0cqCJEl
	5Ez87gZ7NayKvqDcvcrq/Hx1oC2Od9GaCBmMfeybKw==
X-Google-Smtp-Source: AKy350Zk77Oydn2PodfjTny03AznowOFdgJ1VNyol+8cbPZTTyXjJPzaJjAVu4NvdjGTCHKt9XiZfay/cTDuj19M+zI=
X-Received: by 2002:a17:907:7f19:b0:926:8f9:735d with SMTP id
 qf25-20020a1709077f1900b0092608f9735dmr20051022ejc.3.1680538860306; Mon, 03
 Apr 2023 09:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdbK7ypERAdXmVX3O_78eia1MrLwfZZKC5QL-hgrdRohLQ@mail.gmail.com>
 <6415.1680536698753265334@lists.openembedded.org>
In-Reply-To: <6415.1680536698753265334@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 3 Apr 2023 06:20:49 -1000
Message-ID: <CAOSpxdaW3zZM83eQ+_R5q4L-vsHKPJ0Nn0jsktauLPx1mEAagg@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 16:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179643

On Mon, Apr 3, 2023 at 5:45=E2=80=AFAM Pawan Badganchi <badganchipv@gmail.c=
om> wrote:
>
> Hi Steve,
> I have cloned kirkstone and applied this patch. Please find the attached =
screenshots below.
> Could you please build again, it will get build for sure.

You didn't actually try to build curl!  Please do a 'bitbake curl' and
you will see the fuzz error.

Steve



> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179641): https://lists.openembedded.org/g/openembedde=
d-core/message/179641
> Mute This Topic: https://lists.openembedded.org/mt/97818991/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


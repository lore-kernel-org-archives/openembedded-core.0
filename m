Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DDFC7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 09:41:25 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.9201.1686649277872528058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 02:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bRAbXj/E;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b1a653b409so64823111fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 02:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686649276; x=1689241276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rEY3jWnOZVsghBg78uz3ZHx1xPMF8co4uzZakAd1jI=;
        b=bRAbXj/EeIlRXNmwdDnh//6BWlgGM+AMoqlijzXQrjBar5JG+EiIQNeayksmS6jViO
         LNqzYsUfbCEl9GkBtJBAg0USPRGtKiEFTkvPUtPYmqqcP36hYIYsB/a2eu6QXRNJes8j
         5XuBHFxdrgdin5v9jVsrjgcwTyXco0/Yti1PJU5uR+Yjb2X+sr7Qgf1e+2b7AKJWQVle
         f50KyjF7chTq62YwhW5tyUPxgA4dk2vlZUb2t4Wrih2d9W9k/DdQSwIGP47EKhrbr5FY
         azKmCXryv8pXy+mXz4CAt1y3pGz9wNPCLy4fdva3ibsldkWY0zw98suFe3/1BgtBdUcj
         r7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686649276; x=1689241276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rEY3jWnOZVsghBg78uz3ZHx1xPMF8co4uzZakAd1jI=;
        b=gsnk8svJuKz6xbU1kisWmcIhUrK668BsjbTGUDq+FVqV0RR4aZ9ku4tUjvaG/xLd7+
         ou8zj+aIqJ9JbeTm0kYCrLqw9JRGFsuSwWWFUcC1dXH2H1f2kFnainMJ6EI1nvyCrmna
         8RPMJPbvq14rIkqJSyqUn7mFKP67D7stXZ3oV6ECPTREvyUIdWshGdUXtyxc4OOuvFud
         jjKR0b+vj9ce+ozyxR6cWRdblSAj3X2x7ajhFITEWRVKLIMXdnXjcESG4bSmprG/CjXj
         vImbc3joceV9v002Fnswdoo7Tqad6MQBNoQWVxj2863nKeucoYjz5anskQqFM8MiJ+jV
         rA+g==
X-Gm-Message-State: AC+VfDzAs/KtkPkE1XVXytXmCcWmW54AetUtD6N2EmA0cnebPtmg9qBG
	5IPYBKW2dhyE3R3tz72778IP670LwBCnDdQQmtcVFfdq
X-Google-Smtp-Source: ACHHUZ4F/Nv5Pzv7Hq/zRGsxnBp69uTumIHKcwsoTV63T4j8tiVal2vyp9Q9oB3hC/QrtjHOjwU+U/HUTnN5n9c50Dg=
X-Received: by 2002:a05:651c:118a:b0:2ac:6d95:301f with SMTP id
 w10-20020a05651c118a00b002ac6d95301fmr2847847ljo.2.1686649275702; Tue, 13 Jun
 2023 02:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230613.075026.1966738183818033649.kimoto@ohnolab.org>
In-Reply-To: <20230613.075026.1966738183818033649.kimoto@ohnolab.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Jun 2023 11:41:04 +0200
Message-ID: <CANNYZj9oKkzidy6v1Kaz-wfinqpY_ktFHVB4th1-40OSaMBuQg@mail.gmail.com>
Subject: Re: [OE-core] Xwayland needs dependency to libtirpc
To: Masahiko Kimoto <kimoto@ohnolab.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 09:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182703

Hello Masahiko,

before this change is considered and applied, we need to understand
the problem better. What are you observing when libtirpc is not in
DEPENDS? Is it a build time problem or a runtime problem, and how does
it look like? Can you describe how it can be reproduced by other
people?

Alex

On Tue, 13 Jun 2023 at 00:50, Masahiko Kimoto <kimoto@ohnolab.org> wrote:
>
> Hi all, I'm new to this list.
>
> On kirkstone branch, xwayland needs DEPENDS to libtirpc.
>
> As I checked, newer than kirkstone master branch, needs to add it to DEPE=
NDS,
> as like to kirkstone.
>
> A small patch for kirkstone is attached in this mail.
>
> Regards,
>
> ----------------------------------------------------------------------
> =E6=9C=A8=E6=9C=AC =E9=9B=85=E5=BD=A6 /  Masahiko Kimoto, Ph.D.
> E-mail: kimoto@ohnolab.org        URL: http://www.ohnolab.org/~kimoto
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182686): https://lists.openembedded.org/g/openembedde=
d-core/message/182686
> Mute This Topic: https://lists.openembedded.org/mt/99494716/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


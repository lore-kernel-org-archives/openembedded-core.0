Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D299C77B75
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 00:37:13 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.38747.1683160630572651361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 17:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Z63dufdu;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-192798cf019so2621613fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 17:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683160630; x=1685752630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3l7w8MGdRgFzwzhjZeWQ/jnHc3uxEELPS5v3TRQFAw=;
        b=Z63dufduVAz1xieLClb4PEBlgvzd0VfdtD/zSQbC+L7uGngsWomr3zxiCSIy2chIac
         +fZTDoGoEbckirY0Xyv+LbbQBbbwfDtRSAF8fz8eDFpW/QkAhKNryf8W1n5EQddkn5k+
         tBGi3lCgh/ytwwTazznSow3ZltaWTja78tb1hEzfNb3veIaYvfFBqMfcE3ZmSi1Pw3Dm
         pVdsahc3tZ0U4XIQ+Y6rK/Ke1uxkXGo/2MlxxvtHuHS5vqGMpN4ZKOzGMr5zfBb5tpeF
         NcsDG/XvyBDtViKdZ59EeNQHxsmKJ1QvHN5ceUmDAa4WZw0DRRVZyJY77aKNzGOrxlwq
         yS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683160630; x=1685752630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3l7w8MGdRgFzwzhjZeWQ/jnHc3uxEELPS5v3TRQFAw=;
        b=CQVyxDz5bEOK16P3xJPP1E1NVtUVpanDrNMnT5Kk3/lPnAS9IDnLe5rY3i3QtT1pMP
         BJVNyMveESzGHiG4kjYWpj5tAY1qAoCFKLnhrkbVBm94O4Qsl/kbkzsFTHr7hFwmdoKi
         SAkkOsPir/38Dg8tzjaW88f47peU/em/DsoYIIWdzIq929nN7StyP1qBVFrB84o8TJaA
         ANGYeNYbLoxencaPjY5tkcswbSEaWsD8sM3rvdVUCLIWv9kU4ywx39bnRGleHc9JG/7b
         XheeMkvLkSM1hYtpCLSz/xocxj8veuDV+UlcLPzfFxOwpvhMRlHjoh/Q8C7dZJc2b2T/
         WJww==
X-Gm-Message-State: AC+VfDylHBn8+4phqNYAkU7vftz1n/Xst6GBkTlEgOtlrOuAgXd24z5P
	k0gH0CoDV8k1+X1NAgxtX13vMqptbeu7Sh3OEFA=
X-Google-Smtp-Source: ACHHUZ6g2Z2gyIJU2/rIr6lufWtVKkN4GibMhYP7FRF+833SMeygRVL4Tjz2eo6Bxi89yGTxFjJAujZkimK3Gey60yk=
X-Received: by 2002:aca:3486:0:b0:38d:ef97:a2db with SMTP id
 b128-20020aca3486000000b0038def97a2dbmr789143oia.5.1683160629580; Wed, 03 May
 2023 17:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
 <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
 <CAMKF1soV_hmE+f7ed0r=jo+rQcWyJ4SU1vG3T2YGAqZQsgReWw@mail.gmail.com>
 <CANNYZj9X+dTmBN=5WQdA9af5E7m+Ov9vO=bOjR0p=BeBADMEAg@mail.gmail.com>
 <CAMKF1sq=YOzoqyRzn1bhRwxqWSMV1SnzRKNDutBDiKqw+PjhXw@mail.gmail.com>
 <CANNYZj-Kt+JMU1BfhqDnFv_S28=-K8ozPFP=3NBPwOYL-PZQ_A@mail.gmail.com> <CAMKF1spy_tx3T=HAAA0B8z4sc1vqkMtMSuLBhUCUObdew-drfg@mail.gmail.com>
In-Reply-To: <CAMKF1spy_tx3T=HAAA0B8z4sc1vqkMtMSuLBhUCUObdew-drfg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 May 2023 17:36:43 -0700
Message-ID: <CAMKF1sov+84T88Gkjfxs8b7Tp28CCgw2HLoCsmFimb9yw6NXZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required kernel
 to 5.15
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 00:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180841

On Tue, May 2, 2023 at 8:01=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, May 2, 2023 at 1:42=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com> wrote:
> >
> > On Sat, 29 Apr 2023 at 21:28, Khem Raj <raj.khem@gmail.com> wrote:
> > > I am also seing some segfaults in qemu usermode runs
> > >
> > > | /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/16.=
0.1-r0/qemuwrapper:
> > > line 2: 1592564 Segmentation fault      (core dumped) PSEUDO_UNLOAD=
=3D1
> > > qemu-x86_64 -r 5.15 -cpu core2duo -L
> > > /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/16.0.=
1-r0/recipe-sysroot
> > > -E LD_LIBRARY_PATH=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-li=
nux-musl/libclc/16.0.1-r0/recipe-sysroot/usr/lib:/mnt/b/yoe/master/build/tm=
p/work/core2-64-yoe-linux-musl/libclc/16.0.1-r0/recipe-sysroot/usr/lib
> > > "$@"
> > >
> > > this happens when building libclc from meta-clang
> >
> > Does not reproduce here (qemux86-64/poky/musl/gcc/meta-clang master).
> >

On to this one next. I think it will be good to understand this.

> > > I also saw random build failures in qtbase which is perhaps unrelated
> > > but could be this one too
> >
> > This needs to be investigated on your side.
>
> I see that it is host dependent, it works on debian bullseye but fails
> with latest archlinux
> since archlinux is rolling and uptodate it just a matter of time when
> it starts showing up
> with one of time based distro releases like fedora or others.
>
> >
> > > Third issue is https://errors.yoctoproject.org/Errors/Details/701889/
> >
> > This is from a misconfigured CI on your side and the error is
> >
> > "clang-16: error: unable to execute command: Segmentation fault (core d=
umped)
> > clang-16: error: linker command failed due to signal (use -v to see inv=
ocation)"
> >

This seems to be not related to this. which is good news.

> > which may be unrelated. Is it still happening, and is it going away if
> > this patchset is removed?
>
> this have not been tried yet explicitly, I can give it a shot if its
> not host specific
>
> >
> > Alex


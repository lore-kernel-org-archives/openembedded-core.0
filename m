Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49705EB8FD0
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 13:22:03 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.8703.1694006516207963232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 06:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jDCTKNlJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.174, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2bd0a5a5abbso56525731fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694006514; x=1694611314; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0X7FXFpQxWWfxR+eCnsn1vYVxy0soqQfUh4rGOTuGw=;
        b=jDCTKNlJ/3WHByi+hu7Yda1aoOZo3O13EgnAv54q4Ro6GtPbeXXTZK2dAz7QDcqqD+
         aJPoXIDz7Nb6NR++NPPhvWQh69DWngYxMhDUbcxy4LCG8FlnJ6tj+SnZjZh5XACK3e65
         GoP9R+oAumpodQF9w7/2ofkccwEKMHQspaAD0xlnkisQkAh8HNM/7EJSezDQUQH5yeaB
         XeaeISSw44RrNawdD5AkXXGYDJQ1JVRjVbTIdKFZ87aoZICTNgXIVlq3w+rIxcrZraGd
         XHlEkYNtHrZU//Ih3oD7TTU3FCMzlTV0hRNJilFCsjM8gmJLDfX5P00EVEiIxx4mLxjp
         aOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694006514; x=1694611314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0X7FXFpQxWWfxR+eCnsn1vYVxy0soqQfUh4rGOTuGw=;
        b=kSGj5Knuch91pFCB417rWaLIEKU5QJoP+C3/1CHuuZ1ykZ6Qf/gD+wQUoWZMfl2jvW
         dRP6FDhuekBkv7l4VSI+O7TcicqCOqUo37CltNUNrEMF+zZq2fO2OqjXsrSKKY39vKO3
         ezL3zVwGaDx2tAiQ8rbLRg+LwP09No4wdfx78MsoYGaUtrCizz1tenuNW9rxcEyRDOiK
         KXfP1Z22nv2eExVCzrkxTQZNqqTbkLd/rtjhEQrHSYnKpPNtXEBy9Xyg7RvuJsuZEErG
         1+65YeYMnDovH18vAUaVisB93FtlimtCfrPLLoRG0kaC9IdXdoRFAdtERkcmI8+mkzTg
         NOuQ==
X-Gm-Message-State: AOJu0YwZVbE5skalzzzDjPcIM5BhWe6QR1J6Bf3/Jh7UZcL7rg/GaNMh
	1wydakD8KCcWBpcDrFPUtA9M0dAJy1Z9NeeIMJtlWw==
X-Google-Smtp-Source: AGHT+IFss/4c2Wqn0bVlvjqwFGKdZsO22kf9cZN5maEsCA4Isb6IQXJVdhbk3knaISV3ppbfAVdMNVT+2pacriTx1g0=
X-Received: by 2002:a05:651c:1054:b0:2bd:c23:c810 with SMTP id
 x20-20020a05651c105400b002bd0c23c810mr2214714ljm.51.1694006514331; Wed, 06
 Sep 2023 06:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <CH3PR11MB8093D7EE35C56F96C8EBBE6CB9EFA@CH3PR11MB8093.namprd11.prod.outlook.com>
 <22222.1693993559459898022@lists.openembedded.org> <178250FAD14B7B3E.5484@lists.openembedded.org>
In-Reply-To: <178250FAD14B7B3E.5484@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 6 Sep 2023 03:21:42 -1000
Message-ID: <CAOSpxdbPEzonJOF-GD8KtWQoJytw5QtdJZQ1vqOFRw6=WAuRDg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] binutils: Fix CVE-2022-47008
To: steve@sakoman.com
Cc: Deepthi.Hemraj@eng.windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 13:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187314

On Wed, Sep 6, 2023 at 3:04=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> Hi Deepthi,
>
> Thanks for helping with CVEs.
>
> In the future when you submit multiple patches for the same recipe
> please do so as a patch series.  That way I'll know what the intended
> ordering is without having to examine the patch content.

Actually, could you please resubmit as a patch series? No ordering
works as is, the second patch in a series for the same recipe must
take the first into account.

Steve

> Thanks,
>
> Steve
>
> On Tue, Sep 5, 2023 at 11:46=E2=80=AFPM <Deepthi.Hemraj@eng.windriver.com=
> wrote:
> >
> > Hi Chee Yang,
> >
> > Sorry for missing out the patch file.
> > I have sent a separate mail that contains patch as :-
> > https://lists.openembedded.org/g/openembedded-core/message/187288
> > [kirkstone][PATCH V2] binutils: Fix CVE-2022-47008
> >
> > Thanks,
> > Deepthi
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187312): https://lists.openembedded.org/g/openembedde=
d-core/message/187312
> Mute This Topic: https://lists.openembedded.org/mt/101188282/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


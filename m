Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2FEC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 07:53:44 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.1726.1750233214586310993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 00:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b26zN7KR;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b82f3767so4261260e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 00:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750233212; x=1750838012; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZEiZdAit/XN0XsF3LvR1L1t+DqUeOv/cHOr+oqYmgU=;
        b=b26zN7KRwBug5qlDN65Kq5hR4ewX9zo9AeOv7Wnsk/SHayrb2An29thc8ukb+RkNy9
         HZPi2+Zo/jI0X1Yyo5DKMDTSsBuqqUq8mZVqhY+Ey1THNl959tg6LlaKZHgUtEIi5+jh
         JCPgpv1WBrgxUC9YLn3UBuv08kFOwfXqr97XUcZ/gmVeraLclDK/Izm6t2GlB89DZ9l2
         I3Wsq61SHhKUt72SeeoGPhmeFfUN9BmvMRF/BCTybxXSc/yzQ2/c6BnsPu3nUE9PZQg0
         jhtgt7WBIS19R/LqH91VjdIiXAAwjxUi3yTG0PKPS3kOacD93A68+ylcPkDKgURIAGuq
         TGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750233212; x=1750838012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZEiZdAit/XN0XsF3LvR1L1t+DqUeOv/cHOr+oqYmgU=;
        b=a8luX6T5kLh6ZpPJv6DBWqH7fD0AEEaXQBbIgCzcUXygHFtKQtD0EvNm0sq2Kzl0M8
         tDxarJzUG5icpLZ+WB1bAqVvcGa4F+thSjDc0/enimDH8SEgOutqTshy4hPsWtF5TR9k
         6orO8K/NEZ60/ag0q9hbXmjYnHMmFNp15dtR5NRRyn5C/ZAGoABBQvW3mUodqDrsLvzZ
         di56yfNXsh3Ylz+pqd+yO35C293sTrerKWIaEn5NqzcKB4Z7V4IOHawCuOzc1RXSqNF3
         sLnjFqPcfI2GzPCHYADMBNqzL5Rs5B8H/ImiCGjlYq4/vgwUL/R1nzQG/8W6I9dby8h/
         JzxA==
X-Forwarded-Encrypted: i=1; AJvYcCX416068Hvu/4uyD+iDRaDUn6EgM/p3Q8Cha5JaEzLUp1A8xm5iCfuD7cP2pnki42dn1pvn4Uzv6POOcfqYDXic9w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyM8L7DIKVN+e/AIpsQ4tWnMrp3o9kAxDBdH4AAnvhcp6WfePop
	nqRsV33tF2ECN09zwYWeebTorHEDlnAHLBYlrbbbwVjcQSM8uJPuBalmeLx3fJON+PsLY2o7AEI
	fhB0kH2NO9NzSTjsV99lo8nE9d3Q5Jlw=
X-Gm-Gg: ASbGncvfeZve1gDldscuzqCazb/fPPlfaNz/MNAbxHA3hq3MMBrI/6khxod//pwclQF
	nFFHLwUXpiyUGrLYyKRxzZuqC6egRVWCX798YcJGa4nXlRWFQqGL6OZG7LbWgCeLJbLS6Xfzlfi
	qeoMRZXmYA/YfRWmBqUfKhNfPjo5f7yNjSEnxP+HQcxuavjA==
X-Google-Smtp-Source: AGHT+IGhcf+JUJV9ePUbFzWY+/ihYmxwMy6Ngwgbd3SAQcyUCqdNosxnC4bkJ1eBkCBZhVmbsqD/Lf2xV6y0yrYkLkw=
X-Received: by 2002:a05:6512:12d1:b0:553:2f4c:2791 with SMTP id
 2adb3069b0e04-553b6f30f2emr4438319e87.46.1750233212090; Wed, 18 Jun 2025
 00:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1750176125.git.steve@sakoman.com> <db02a4cc542d0e7e563ec46c91bf9a7313a71d02.1750176125.git.steve@sakoman.com>
 <3285382b-51c5-4ea2-9784-91267d1180ac@gmail.com> <582ab22a-f015-4611-b1d5-3c2c624585a1@windriver.com>
 <9470af8d-87e5-40bc-a79d-cddbf58c92ca@gmail.com> <af5e4d92-5144-4c26-ac56-423c2fa5286f@windriver.com>
 <47bc64c5-3a95-439a-952a-601114f15f86@gmail.com>
In-Reply-To: <47bc64c5-3a95-439a-952a-601114f15f86@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Jun 2025 09:53:19 +0200
X-Gm-Features: Ac12FXyytHPrJHETAfavFiK6oQEqT0Rxag-woNcZuPHlNBlqmQx4-XF4QZoSZQM
Message-ID: <CA+chaQfFjHJxEoCiU0NaqqwWYSFAwckm6sKrsGbWFy_E4u8fUA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 8/8] systemd: Rename systemd_v255.21 to systemd_255.21
To: skandigraun@gmail.com
Cc: ChenQi <Qi.Chen@windriver.com>, steve@sakoman.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218977

It's not tagged, but it was merged to scarthgap branch 13 days ago as:
https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=3D2=
9e623b2ad00555788412fa520fbb9ffec794cbb

We don't depend on package-manager upgrades, so version going
backwards is not the real blocker for us, but PE bump in all active
branches seems better fix than people not getting the next systemd
upgrade (e.g. next systemd minor upgrade with security fixes) in
projects which use package-manager on target and happened to build the
package feed with this commit included (e.g. we don't wait for tagged
"releases" from stable branches).

Regards,

On Wed, Jun 18, 2025 at 9:42=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On 6/18/25 09:36, ChenQi wrote:
> > On 6/18/25 15:29, Gyorgy Sarvari wrote:
> >> On 6/18/25 09:24, ChenQi wrote:
> >>> The author's V1 patch bumped PE.
> >>> I replied to that patch, asking the author to not bump PE.
> >>> My reason is that we'll need to bump PE in later releases too
> >>> (walnascar, master) if we bump PE in scarthgap.
> >> My main question would be if bumping PE is worse than breaking this
> >> recipe in this release. Maybe it is - I just didn't see much discussio=
ns
> >> over this.
> > Luckily, the commit that introduced this issue was not released yet.
> >
> > poky [2][0] $ git describe --contains 417cecf76b
> > fatal: cannot describe '417cecf76b91f58a61e8cc9e4bc57ddda87aac58'
> >
> > poky [2][0] $ git log --oneline scarthgap-5.0.10..417cecf76b | wc -l
> > 31
>
> Oh... indeed. I thought that this was tagged already long ago. Thanks
> for this, this does answer my concerns.
>
> > Regards,
> > Qi
> >
> >>> Regards,
> >>> Qi
> >>>
> >>> On 6/18/25 15:08, Gyorgy Sarvari via lists.openembedded.org wrote:
> >>>> On 6/17/25 18:04, Steve Sakoman via lists.openembedded.org wrote:
> >>>>> From: Savvas Etairidis <setairidis@gmail.com>
> >>>>>
> >>>>> The recipe was accidentally renamed with a 'v'
> >>>>> prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.
> >>>>>
> >>>>> Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
> >>>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >>>>> ---
> >>>>>    .../systemd/{systemd_v255.21.bb =3D> systemd_255.21.bb}         =
    | 0
> >>>>>    1 file changed, 0 insertions(+), 0 deletions(-)
> >>>>>    rename meta/recipes-core/systemd/{systemd_v255.21.bb =3D> system=
d_255.21.bb} (100%)
> >>>>>
> >>>> Personally I'm not affected by this issue, and have no problem with =
this
> >>>> patch, but a few weeks ago there were people who were unhappy when a
> >>>> similar issue popped up in Walnascar with autoconf (though it was ca=
ught
> >>>> before merging), which makes me wonder if this is the way to go.
> >>>>
> >>>> Systemd already has a PE[1], exactly because of the same situation: =
"v"
> >>>> was removed from the start of ${PV} - maybe it's time to bump.
> >>>>
> >>>> Anyway, as this patch does no harm to me, this is not a complaint
> >>>> against it, but I thought it would be worth to mention it at least.
> >>>>
> >>>> [1]:
> >>>> https://git.yoctoproject.org/poky/commit/?id=3Df95bbe35b2aab929e5047=
1db8ba50781d5027a01
> >>>>
> >>>>
> >>>>
> >>>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218975): https://lists.openembedded.org/g/openembedde=
d-core/message/218975
> Mute This Topic: https://lists.openembedded.org/mt/113692551/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


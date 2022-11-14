Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45470C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 14:42:50 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.6420.1668436960767570072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 06:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gKuLjbBm;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id i21so17621516edj.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPQh5L3hhUBcEWLaPZpo23Hy0f+FDFZrjsbATEpy0cc=;
        b=gKuLjbBmaPLiTfawAt+FLhMSC8y44qt4bl80lyqNteFfsIxKDzs09H4JhTDXF1QFQx
         /7g2/Mx0Gjs44ZHfZ1T0ax3Fq00zW+9NdEKiTUlrKcsEW1+2l9no0YaRmw+25C5aTwPv
         yaLQMcSwcdSjwO7/Tmu/Fi+gnl1rhinTH5tK8QVi4HIuLQYAatR5YkbKagY3bJfI19kc
         XxnIVZZCKZZNicBPckefHHUW1gqgPtKU2F50uHpRduDhjZGifN8ji4VZGJWV+OJR5q5X
         I/4JIs220HvdopUZxXYsvCsqTTHGCxQFZzYOYI1JZ7ogY6efncRaAuXY5euFQtMUxvz8
         wzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPQh5L3hhUBcEWLaPZpo23Hy0f+FDFZrjsbATEpy0cc=;
        b=3r37Wa3wJS/fRljUi19GvN78pv+XJn6Awd24rW6ZB8bkLFczU/YAvdoGDFZXHnt9y/
         pfW2efhckUnhgWrJuMYvmS9S8mPQgbupY85yjo4TySBwYuzZ2vmP8IWu0rNytlKNgDEt
         AdmGY2+XVZGJns+xeH3oqhjvROj1URkz1grT8toHU4DvWqJFmc3iGrfoCG1sVMYS+DIy
         oDMYow6oBTQnVGN9f3pXXw+Y3xNf+UnLWkopSYF9j1nIC/+z3GX2rpYeZ12mRTb2STiR
         R8qiqDySTv50sJIsyAsJIk0XRH5ip9aEVCdHIOnljlhLvuIGiNCp+5BJ+cY14N4HJvL6
         85lQ==
X-Gm-Message-State: ANoB5pnvbzIVlaps/uovgf2sLj1xuRn/ytxW5Yju67XPpjvt5vYMBPau
	8NrWmbsJB+nyWjU0Fc5M3fVDgD3AxuDJrFbYU2hq9w==
X-Google-Smtp-Source: AA0mqf4Y+IxGjmqzZJaPeCON8XeAVFL0MKHI39mZUITBw1DE6s2yg9yGTbo/TzQEniJ2pQNayU5rqHfMSe3y+v2Wu/s=
X-Received: by 2002:a50:fd9a:0:b0:461:b279:1175 with SMTP id
 o26-20020a50fd9a000000b00461b2791175mr11464576edt.124.1668436959156; Mon, 14
 Nov 2022 06:42:39 -0800 (PST)
MIME-Version: 1.0
References: <20221014152245.243292-1-jose.quaresma@foundries.io>
 <171DF8E2F2B472D4.2422@lists.openembedded.org> <CANPvuRntRt1e33kujzgs_=K_FSoOOj0N7KCKkyoiyrSynDJc9w@mail.gmail.com>
 <bc610ce45417a57c2212c3fd20a61e57189765bb.camel@linuxfoundation.org>
 <1723BFAED82D2E62.15522@lists.openembedded.org> <CANPvuRmUm8T2XukmmRDgg0NU0bmhktKWA_6tQfASkVmj1N+_Dw@mail.gmail.com>
In-Reply-To: <CANPvuRmUm8T2XukmmRDgg0NU0bmhktKWA_6tQfASkVmj1N+_Dw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 14 Nov 2022 04:42:28 -1000
Message-ID: <CAOSpxdavney1CQdZrS+85ySzJ-SjRuQLMKRYF3SmxP36TYGa=Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 2/2] archiver: avoid using machine variable as
 it breaks multiconfig
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 14:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173246

On Mon, Nov 14, 2022 at 3:17 AM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>
> Hi Steve,
>
> Can this patch be backported to kirkstone?

Certainly!  I've added it to my test queue.

Steve

>> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quar=
ta, 2/11/2022 =C3=A0(s) 10:55:
>>>
>>> On Wed, 2022-11-02 at 09:42 +0000, Jose Quaresma wrote:
>>> > Are there any issues with this patch or the oe-selftest in the
>>> > previous one that I need to address?
>>>
>>> When I was reviewing the patches that were queued while I was away,
>>> this one wasn't one I could immediately look at and make a decision on.
>>> It was therefore deferred for me to spend a bit more time on. I'm
>>> trying to get there!
>>
>>
>> Thanks for the update.
>> I decided to ask now because I saw that the master branch has started th=
e integration again.
>> If anything is needed from me please let me know.
>>
>> Jose
>>
>>>
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>
>>
>> --
>> Best regards,
>>
>> Jos=C3=A9 Quaresma
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#172584): https://lists.openembedded.org/g/openembedd=
ed-core/message/172584
>> Mute This Topic: https://lists.openembedded.org/mt/94730390/5052612
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [q=
uaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma


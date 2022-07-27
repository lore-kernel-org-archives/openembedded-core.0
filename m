Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B07EC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 14:36:01 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.20474.1658932554182354502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 07:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lGdgs+Fv;
 spf=pass (domain: gmail.com, ip: 209.85.210.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id
 by10-20020a056830608a00b0061c1ac80e1dso12978820otb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FHdoiMCqP/zJef3L1DVxXTDw/nSMII0BIk+TAtpkD54=;
        b=lGdgs+Fv2VEz3YlpAY7BN8qmH0ZatGbVV17a7BToFUpkPYJON3+FzmXRyPAsQhS34C
         RRS/UzFK1qfG2bOUtRP7AhquNLsSKVQPJk6frImN/CQFUQi2cz/Gr224MZE58ko2fs9t
         USbN9D+YbAcj/wYys+nhZwuB667zQ9fX79wEAonsvqDfynTZEsoA9quJJ9aQG2z1su9y
         QwPQUR7Yt1GbmVUw/+5xSXC3a1qjd1ykUEyotnM+aPbEuT8RLjTOvUcKfb1dD5NYqPgr
         k/TZxxyeKPkBmmkKo7PR3ELSKgrEU/0B3d7xGm7D5v+BafvonQs5SeyEVCgHYpaQGues
         ouMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FHdoiMCqP/zJef3L1DVxXTDw/nSMII0BIk+TAtpkD54=;
        b=t4FbPOQfDsCO1HwGeLQ4MJeEClUIdjwBgTaefnwAeTt1s1etu7BRrdNXc1ukgJ++3F
         uweNvHst8RLpZCIyZhTduAYGeI47JMvZ49yA+tJ14w/xRN0orCCbx3yAnALm5IXHqTCw
         x4d0tQlslH2VMUwbXz1OgEI450Wt1qwI1DZJHkB/Gu28zR1RBZKVxK5QZ+xEE3eXwjVo
         5RBP0p/0R+uB/kZ+nzvVSVvD6bjy/j4iskkodafD9VG0knjprW9qiBgty61Ov9yTpFYN
         h76iOARggLaujXZuo7BJbO2ME+FyTkV5aWO/lm+X1qvlvf0f2J58+Ry1zf5EtlsXxu93
         0ycQ==
X-Gm-Message-State: AJIora/jVYy+q0wrWQ6OUSXmJ3EdqUkoIXKMI9+TYetIZCusCP/njFto
	E3oXlJU9oLtNeRKC9SiZ66eUqrfy6i8ycgubOaY=
X-Google-Smtp-Source: 
 AGRyM1s8Hi+QX2iPQkd6I66zI5PA5CcDmBOw7ksIdu8WKca8Aq5KCZ3c/Wf75JzndFNAZJevuGVs1yLlg5Ii/C4ZOGo=
X-Received: by 2002:a05:6830:2909:b0:616:8b6a:67ef with SMTP id
 z9-20020a056830290900b006168b6a67efmr8352715otu.379.1658932553399; Wed, 27
 Jul 2022 07:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220726211328.2122681-1-rustyhowell@gmail.com>
 <20220727125339.70e1886c@booty>
 <CANNYZj-FJHUQgVb3GXWjEd6mkQE2-wkX2vUky3pJXQLdq6LPVQ@mail.gmail.com>
 <9DF62C6C-0996-4520-B4AD-F8E579C8931A@arm.com>
 <22FA8BA8-2F9D-4914-9C05-5385EBA4D90A@arm.com>
 <7536019F-34C9-44D8-9380-425C4FE67207@arm.com>
 <CAE+BM3m3CvX=86M8FqodzNDS-5VoAVghMVYxeQovLvgxiJ3d1Q@mail.gmail.com>
In-Reply-To: 
 <CAE+BM3m3CvX=86M8FqodzNDS-5VoAVghMVYxeQovLvgxiJ3d1Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Jul 2022 16:35:41 +0200
Message-ID: 
 <CANNYZj86BMm6avp+5gGqw_6x=MN18HQKJFLAi5_Ov6j8W2jS=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] debian packaging: set md5sums for conffiles
To: Rusty Howell <rustyhowell@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 14:36:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168565

I think Ross is merely helping you to reach the correct solution, but
everyone would appreciate if you write and submit the actual fix :-)

Alex

On Wed, 27 Jul 2022 at 16:32, Rusty Howell <rustyhowell@gmail.com> wrote:
>
> Thanks for the quick responses.   It took us a while to figure out why we=
 were seeing weird behaviour with our products, and we ultimately figured o=
ut the conffiles are being replaced during the update.   I am working off o=
f Hardknott currently, so that's my mistake not switching to master.  And I=
 guess I misunderstood who is allowed to "sign off" on patches. I assumed I=
 couldn't since I'm not a regular. But in any case, it looks like Ross Burt=
on may be on to a better solution than what I have to fix the issue.
>
> Rusty
>
> On Wed, Jul 27, 2022 at 8:09 AM Ross Burton <ross.burton@arm.com> wrote:
>>
>> > So we=E2=80=99re definitely not generating the DEBIAN/md5sums files th=
at dpkg-deb likes to have. However, this file in proper Debian packages doe=
sn=E2=80=99t contain hashes for the conffiles, so I can only imagine that d=
pkg generates them on install, which leads to the question of where that is=
 meant to happen.
>>
>> dpkg =E2=80=94configure does this, but we=E2=80=99re neutering it by ren=
aming all foo.dpkg-new files to foo in the deb install() function.
>>
>> If we=E2=80=99re going to rename foo.dpkg-new to foo, then that is where=
 we go and update the status file.
>>
>> Alternatively, we don=E2=80=99t do that, and every package needs to run =
its configure step on first boot.
>>
>> Ross
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#168563): https://lists.openembedded.org/g/openembedd=
ed-core/message/168563
>> Mute This Topic: https://lists.openembedded.org/mt/92637328/4800265
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
ustyhowell@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


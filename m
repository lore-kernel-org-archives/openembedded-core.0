Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E666EC54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 17:10:09 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.13098.1711213807189373462
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 10:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z7+KTFC4;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2218da9620cso1722606fac.3
        for <Openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 10:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711213806; x=1711818606; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Yf2UKrrOWfLsr3Yw7ygwzlALivKuPpShlHoX+dXD/w=;
        b=Z7+KTFC49JktQnC3O0vz09NKbZK+b0a+o7GhHWAxtEEuur38C5J/9kYUS/15rcQKja
         mam01gSwDbqrNTo6BRV7XosH9GEevGM3+rCstc5v47ZM8vXjYQ5goumsyTrreMuuCjPz
         sRlnE6WE+Q2+upLVcLezb/amDt5jiwMCvpRjJvCmAw96787uMLnps0WXavFaqp8pXG92
         Ig6Fa7IaDR/BxdqjJfLWZeAlY0WY0TVcNi4e1yB+Othm+YNOh0MH+meqLWxQGEq9Dhl/
         P580pzSrtRPQERcw9rXwDNjyxjY9rNruDgbnTnC6H7/F+yJ7CvgPEnK70+KQWObM2fvo
         +Edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711213806; x=1711818606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Yf2UKrrOWfLsr3Yw7ygwzlALivKuPpShlHoX+dXD/w=;
        b=ODbk5eZRaSDoDS8zasyM2NanxUs02gaTjV32KoSKVwpi82++fix+m+pIC1Zp9GR6as
         RJYtHuCWkrXrXU5wZL9gHWi4cbOE8qLEOkrKoIyuhQER4hFRiCp11C20NzZa9jDNPtUv
         5QhP0VIjBxdkpKAUNVxS8j4iS7nPT+hX1sBgLdEoKTNOOkHLOTgxccfosYIHlWmL2PaD
         zRwo3m1X5/4O9e6HIueyD6EHWA0vfYQA720YhXki8tAcGVS9Psmz4VnHWA8tA1Cw0bLj
         ngsR94SUUWTBtsA0akpPnVkypBUqbQjvD5dlg3mGr1P2yC2ciKXV5aMeTev14cXDrP2/
         CiPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWPmvLS6xHrmAi0rAAGtWwafiZQJrnXwtFc+q94jPS6hq+B54qJd4i351x8G5VVRzsdQMeUT8iENZq8PQkgcfyXrKa3FLYN1yWvhWOmyqr/7nYP3CqLfh2
X-Gm-Message-State: AOJu0YxyJtPcos6xQAQyMrUgrVHwID4sbY4btTL65kbI2rhU605nt4AD
	+ur/f9/NEnKQp5CkWrIOZU/wdCK+5X7hzyTYxOgfyJIh9vDYUY6zWqu0Co5LNqWwlqKq71tgjjA
	bekkUq9wvShhEZ9CcDnqZq7zZHIA=
X-Google-Smtp-Source: AGHT+IGceghipzPc4jQtXGUGdyWTmcGGROIqldQbUxWoBsSMq7iU2Kfnfk+f3r2+spnX6htvqUR9Fewjo+ZgQudrGgw=
X-Received: by 2002:a05:6871:612:b0:221:7970:737b with SMTP id
 w18-20020a056871061200b002217970737bmr3288531oan.48.1711213806293; Sat, 23
 Mar 2024 10:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <CABKMkPKN__Jh6jvc_CfHtwp3HGbRsBJ3YxHxGb1RPPN2WWqRMw@mail.gmail.com>
 <20240321220849ed4253c3@mail.local> <CAMKF1srrNXOGk8E1wzdDeRVtxmdu1sQrHpnFJA3zTs-cQA7NSQ@mail.gmail.com>
 <CAMKF1sp4jpg2fhWLXzvQG0+rizoK_1Hb_08vXiCTWhYUB_D5Yg@mail.gmail.com> <CABKMkPJChp+_rP6fctFigxQi1i_UvHFMKFntxEcM-SNrAEgPDg@mail.gmail.com>
In-Reply-To: <CABKMkPJChp+_rP6fctFigxQi1i_UvHFMKFntxEcM-SNrAEgPDg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Mar 2024 10:09:39 -0700
Message-ID: <CAMKF1so8e0fqJdMZ+FsNmS6Na36K3492vxGc0z=AhsPr7R--mw@mail.gmail.com>
Subject: Re: [OE-core] [master] riscv: libcamera stack smashing detected
To: Joel Winarske <joel.winarske@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 17:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197459

Glad it worked!

On Sat, Mar 23, 2024 at 8:14=E2=80=AFAM Joel Winarske <joel.winarske@gmail.=
com> wrote:
>
> The patch is good!
>
> visionfive2:~$ cam -l
> [0:04:03.111334926] [405]  WARN IPAManager ipa_manager.cpp:154 No IPA fou=
nd in '/usr/lib/libcamera'
> [0:04:03.111423176] [405]  INFO Camera camera_manager.cpp:284 libcamera v=
0.2.0+dirty (2024-03-23T15:11:32+00:00)
> Available cameras:
> visionfive2:~$
>
> On Fri, Mar 22, 2024 at 11:57=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>>
>> Joel, please test the patch I posted to oe ml which should hopefully
>> fix the problem you are seeing on rv64 Let me know if it is working or
>> not working for your use case.
>>
>> https://lore.kernel.org/openembedded-devel/20240323065503.4149463-1-raj.=
khem@gmail.com/T/#u
>>
>> On Thu, Mar 21, 2024 at 3:15=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>> >
>> > yes I am aware of it.
>> >
>> > On Thu, Mar 21, 2024 at 3:08=E2=80=AFPM Alexandre Belloni
>> > <alexandre.belloni@bootlin.com> wrote:
>> > >
>> > > Hello,
>> > >
>> > > This report should have gone to the openembedded-devel mailing list =
as
>> > > libcamera is in meta-oe. But I guess Khem will have a look anyway.
>> > >
>> > >
>> > > On 20/03/2024 09:10:05-0700, Joel Winarske wrote:
>> > > > In master there is a problem running the libcamera "cam" app on a =
RISC-V
>> > > > device:
>> > > >
>> > > > *** stack smashing detected ***: terminated
>> > > >
>> > > > If I remove the patches in the libcamera recipe, it builds and run=
s on
>> > > > target without issue.
>> > > >
>> > > > libcamera bug has the details:
>> > > > https://bugs.libcamera.org/show_bug.cgi?id=3D214
>> > > >
>> > > > Joel
>> > >
>> > > >
>> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > > > Links: You receive all messages sent to this group.
>> > > > View/Reply Online (#197371): https://lists.openembedded.org/g/open=
embedded-core/message/197371
>> > > > Mute This Topic: https://lists.openembedded.org/mt/105047726/36171=
79
>> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/un=
sub [alexandre.belloni@bootlin.com]
>> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > > >
>> > >
>> > >
>> > > --
>> > > Alexandre Belloni, co-owner and COO, Bootlin
>> > > Embedded Linux and Kernel engineering
>> > > https://bootlin.com


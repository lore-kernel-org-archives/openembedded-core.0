Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AA8C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 16:59:18 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.39297.1634576357645733181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 09:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jDpPZpxM;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so310082pjd.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=khSt7vy/BzXtYnXXL4W7vHH44FqgsaRxnCea0KMkHGM=;
        b=jDpPZpxMQQVS0Xz4UfdUstUgPfvRToGOZFzEHNY0p2CwoWhnJoyx3H2ssgnpdhl412
         SsJHfSxKwCUj2yZ/B9hJZ+3Xbij12b2BoeCgK/aQKQZMaL5AIqD1asMPya9iI3VHWDQg
         I7McF26g0OWdPoTg1ewxh1S7Qr77p+ywMe+RG2Zntuxzgt2AQ+wcPmML7t/nGeinydkd
         FCXi1helpKhudctvQBIS/07S6nc8dJBnaVp6WVU/slSU2q4mARGxp9JA9Qq7eMKsJmqX
         8RX4cEVZ957cJsiRJVRKsrcfUSQ5vh/2x802lBCWShG8H+ZJIvswwA6sp9BmHHCOvzxQ
         HXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=khSt7vy/BzXtYnXXL4W7vHH44FqgsaRxnCea0KMkHGM=;
        b=H+Y7TPGvmhhrfowxVMAHrVh5+hoK0gHEaDVdY7DjrDbtQ1qdRl0FLMvOZu55u1eBKx
         Vj7teWqgF3JfkjpNs8/9EPfpJXCrtFeDOA9GzgooD30seNGt6Arkq8uL8LmtlAKH1VU6
         Dgvr/b1gJ9MhAl2vg7JexL5i57r8WjgKIWmXnnNo1x7wjBVYSV8Yc66LaPuc4GLZumi0
         qSRgs0W++2VFKTmKsmkk3yp7CxNhOJhep3Kvv84c+XgT+hsGAwQcC/0RaG8gMPXDvZff
         5DslXXBA5pQ/C+0+D+6YUOIrQ3xFgngoFvM51ucsEBMupIv9K+d5/ftL0p2j3Gwsf6cX
         /TeA==
X-Gm-Message-State: AOAM533dNHoy2rAHFTv1MpBiqKZbkorcsYbH8m0Vxq0VYvfx/g5aozPo
	n7oZnMl2YuubI8aYsDGWMcVw9JO5eYv1ROAjXHc=
X-Google-Smtp-Source: 
 ABdhPJyg3J7J8sNqHy8h8Gf4/YxNQEjxMCPFatpCh4uzzGahtfPdgLByvrMhUb+WexYSFhJQadifCD3Cy26ACeLxJvE=
X-Received: by 2002:a17:90b:4c0d:: with SMTP id
 na13mr49669pjb.232.1634576357088;
 Mon, 18 Oct 2021 09:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <16A68880435BB472.28512@lists.openembedded.org>
 <e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org>
 <0700251c-57a1-cc4c-dd94-a253032a02d1@gmail.com>
 <CAMKF1spNqjAHRh=0F2ohMCCoSdwDOTWAFRMz2RCVU9+rBiiO_g@mail.gmail.com>
 <CA+chaQfO61hdhNtHO-hTu_4QZbnwmHUTMAJ6XaHrDCdhww2EVg@mail.gmail.com>
 <CALbNGRR+VLOvuTFaZFFcp1eSR_gKw6z1EMeH1c28QjqV_YUP3w@mail.gmail.com>
 <CA+chaQctdc_sUpmvs-vN0RatkOx=JoMnVZCqY+WjxGfXOYX0fQ@mail.gmail.com>
In-Reply-To: 
 <CA+chaQctdc_sUpmvs-vN0RatkOx=JoMnVZCqY+WjxGfXOYX0fQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Oct 2021 18:59:04 +0200
Message-ID: 
 <CALbNGRTxs26=VO7DmHe41QOgy=acByprKzUSzenZpYSfdJ_z_A@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 14/14] layer.conf: Extend recipes not to
 install without explict dependencies
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 16:59:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157087

On Mon, Oct 18, 2021 at 4:12 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> On Mon, Oct 18, 2021 at 1:50 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
>>
>> On Fri, Oct 1, 2021 at 4:17 PM Martin Jansa <Martin.Jansa@gmail.com> wro=
te:
>> >
>> > FWIW: I've fixed some bigger layers where pkgconfig was causing quite =
a few build failures,
>> >
>> Had an off-oe time due to  heavy work load.
>> Think this one is the reason for the pkgconfig patch flood. You are
>> aware that there are packages not failing at build time for missing
>> pkgconfig but build output is different and bugs will pop up at
>> runtime.
>>
>> To avoid responsible maintainers have to go through EVERY recipe (and
>> combination of PACKAGECONFIGs) and check if builds are still as
>> expected - Can't believe it!
>
>
> Not sure why this seems targeted to me.
It was not targeted to you - just responded all in the last post - sorry

Andreas
>
> Yes I've tried to fix whatever issues this change caused in my world buil=
ds and I'm partially responsible for pkgconfig patch flood, because I wante=
d layers like meta-ros/*, meta-qt5, meta-qt6, meta-webosose/* to stay compa=
tible with oe-core whenever this change from RP is merged to master.
>
> I've also tried to compare buildhistory and image content (for ros-image-=
world with ros1-melodic) to see if I can spot more cases of non-fatal build=
 output changes as in collada-dom and unfortunately there is a lot of noise=
 in buildhistory (due to many recipes included in this image not really bui=
ld-reproducible), so I've used mostly installed-package-sizes.txt file to s=
pot 2 more recipes where the size was different (but both don't seem to be =
caused by pkgconfig-native in the end).
>
> I did both builds from scratch without sstate, so I would assume that it =
will catch all possible cases, but surprisingly just yesterday I've caught =
another missing pkgconfig-native in one of meta-ros1-melodic recipes (caugh=
t in kirkstone based build - while before I was testing on top of a bit old=
er honister with this change cherry-picked just for test - to prepare recip=
es to be future-proof for kirkstone).
>
> Regards,


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33428C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 18:51:06 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.2421.1686250255700233386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 11:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Lz1gUxQP;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso1719152a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 11:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686250254; x=1688842254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5qnn757KYe5wsKkA3e0jCAh7wCNW0h+PgfrKS+tLxE=;
        b=Lz1gUxQP4szwUym+9Yu8YlXTreb7kFD2MKji2IbKkwz0FZNbVa0xp6EzLJVYkYYkRE
         2EtE4Jybe8IGjR5ZANiSQa3j7cl97SzTHRYhRd+R1YjiyrBx2QrQuguFYcHb1s8QotGH
         xWLkoB/YMiwHlPtz51TxcrtetWjxFeFaojB6QXLM0tziXu5Gg/qE9bWEQIetaoiKce1T
         wwpwzUOapRDQXWmppchLgFpcVMqosXrW76+Y6NC9Eh146w/38QdIE7CENIDOyoqczVi+
         pRpFEifHfzLuUi6W2JgJXYKegN4rYOIdSj8NvU9bCa7H0uvpqSvlU4ncK+LS1vw04rkb
         ruWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686250254; x=1688842254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5qnn757KYe5wsKkA3e0jCAh7wCNW0h+PgfrKS+tLxE=;
        b=IDjzENm3jzOpOA+TgYEfQKXHlbq3wqfUR7dGr00IdVUrxl04zYmGi4JhC/DuKXFeCv
         pOEl8mxp4lYnp0g6uad9HOoCy+eOV8DO3Qe7sNPZz12x+eJmURU0/2CryQ3xLrPQ//UD
         nclF0VrnL5lW42CIAisJy9lxGNDaXoqPLLjvCYLhiz3Ap3989qsw7oOBu4Nx9IGiXnkl
         bV+GIjLZl8Co7CiVzYwBKicMOheHZXfSlt2oQ9xKOuqeBXpQMiSpd29mFhYPKk9o5PxG
         FDfJSLETVAKyiuBlRrrVKWZ2pbhfq+9g3R4DU6/GpDrkO80w5TxgY5s2lbpBzOzwnhQ0
         vcEQ==
X-Gm-Message-State: AC+VfDx28Ohs9HpL46ev280RH7rt10Eoq4V0La7V3PIOvtODbKrFZu34
	RH7Z2phGcvH0HeMToVakdObQkQHKPrkYW5QFsQrOgw==
X-Google-Smtp-Source: ACHHUZ6SJiAR9YL1coWlZ50K3LW5XSrSnl2dFrgQdJyJIXx+uHXruRQ8FVewZiHdEjEbthqaDVJGb3qbqKTl3p8W4UQ=
X-Received: by 2002:a17:907:6d05:b0:96b:6fb:38d6 with SMTP id
 sa5-20020a1709076d0500b0096b06fb38d6mr33563ejc.65.1686250253839; Thu, 08 Jun
 2023 11:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685672395.git.steve@sakoman.com> <0470293e16f424ba4ee6505f3ef68e5ee13df483.1685672395.git.steve@sakoman.com>
 <CA+chaQdwObovTdLKQDoK5iKs4JDZXMNbmKc8X-EJFLaNJdX+Ww@mail.gmail.com>
 <CAOSpxdabCO0O+Ct_wMeYxCiZ60=33tC3a0jAqw=yL12KSfNpCA@mail.gmail.com> <CA+chaQf2FWd9rhOU07s0ra8S5tkEKNDZsjiXFY+GDynssuBd9A@mail.gmail.com>
In-Reply-To: <CA+chaQf2FWd9rhOU07s0ra8S5tkEKNDZsjiXFY+GDynssuBd9A@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 8 Jun 2023 08:50:42 -1000
Message-ID: <CAOSpxdZh5U4YfR8soPdSc-_RD=312WjevEoo5P184FGtg7EhMQ@mail.gmail.com>
Subject: Re: [OE-core][mickledore 13/13] uninative: Upgrade to 4.0 to include
 latest gcc 13.1.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 18:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182518

On Sun, Jun 4, 2023 at 10:34=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> > It might be useful to delay backporting this for a bit longer (and I'll=
 soon confirm if 3.10 was already affected or not).
>
> I can confirm that 3.10 is also affected.
>
> I did build with https://git.openembedded.org/openembedded-core-contrib/c=
ommit/?h=3Dstable/kirkstone-nut&id=3D75e3870ea124321b81f856c4e5170c891f0bd0=
50 and mkfs.ext4 didn't segfault. With uninative 3.10 from https://git.open=
embedded.org/openembedded-core-contrib/commit/?h=3Dstable/kirkstone-nut&id=
=3D680eecc3ae09ea5585e46ff0e67f7c6704221806 it segfaults again.
>
> I haven't reproduced the gdk-pixbuf-native issue with buildtools-extended=
 4.0.6 with kirkstone yet, so that one might be only with nanbield, but mkf=
s.ext4 segfaults seem related to uninative for sure. Will debug more when I=
 get access.

Have you learned anything more on this issue?  I've continued testing
mickledore both locally and on the autobuilder and I'm not seeing any
failures :-(

Steve

> On Sun, Jun 4, 2023 at 9:14=E2=80=AFPM Steve Sakoman <steve@sakoman.com> =
wrote:
>>
>> On Sun, Jun 4, 2023 at 7:39=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com> wrote:
>> >
>> > Hi,
>> >
>> > it looks like this change is causing mkfs.ext4 to segfault on some bui=
lders.
>> >
>> > I'm seeing it on ubuntu-18.04 (I know it's unsupported now). It might =
be related to older docker or libseccomp2 there, because there is similar i=
ssue with gdk-pixbuf-native which fails when buildtools-extended is used to=
gether with this and might be related to https://github.com/moby/moby/issue=
s/43595 because when I try very similar 18.04 ubuntu image on my gentoo hos=
t I cannot reproduce neither the gdk-pixbuf-native failure nor the mkfs.ext=
4 segfaults.
>> >
>> > I'm trying to get access to some of the affected boxes to find out whi=
ch version docker/libseccomp2 is used there and to double check that this i=
s root cause for these failures (now I can only confirm that it started in =
Nanbield when this uninative upgrade was merged and now I've reproduced the=
 same with kirkstone-nut with the same uninative upgrade.
>> >
>> > It might be useful to delay backporting this for a bit longer (and I'l=
l soon confirm if 3.10 was already affected or not).
>>
>> Agreed, I'm struggling with kirkstone too, so will delay taking the
>> uninative update until we learn more.
>>
>> Thanks for the review!
>>
>> Steve
>>
>> > On Fri, Jun 2, 2023 at 4:22=E2=80=AFAM Steve Sakoman <steve@sakoman.co=
m> wrote:
>> >>
>> >> From: Michael Halstead <mhalstead@linuxfoundation.org>
>> >>
>> >> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
>> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >> (cherry picked from commit f87becb69e02bdf055dffb633ed4f6d36b36f7a7)
>> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> >> ---
>> >>  meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
>> >>  1 file changed, 4 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf=
/distro/include/yocto-uninative.inc
>> >> index f3c05b7e20..ad4816a1f3 100644
>> >> --- a/meta/conf/distro/include/yocto-uninative.inc
>> >> +++ b/meta/conf/distro/include/yocto-uninative.inc
>> >> @@ -7,9 +7,9 @@
>> >>  #
>> >>
>> >>  UNINATIVE_MAXGLIBCVERSION =3D "2.37"
>> >> -UNINATIVE_VERSION =3D "3.10"
>> >> +UNINATIVE_VERSION =3D "4.0"
>> >>
>> >>  UNINATIVE_URL ?=3D "http://downloads.yoctoproject.org/releases/unina=
tive/${UNINATIVE_VERSION}/"
>> >> -UNINATIVE_CHECKSUM[aarch64] ?=3D "b11f7dff0ff5e3c971f22e89a105efb0f8=
d2006fd71d1ea3e5da771e416b0e01"
>> >> -UNINATIVE_CHECKSUM[i686] ?=3D "ad7daa7fca7693ca07eea5279f83033353017=
1d357759b380954a25254edd8dd"
>> >> -UNINATIVE_CHECKSUM[x86_64] ?=3D "ce8ff7e3247da312fbf84008f415bc1b4d1=
13ac9fe4ec91581e4a20cd8b475d3"
>> >> +UNINATIVE_CHECKSUM[aarch64] ?=3D "7baa8418a302df52e00916193b0a04f318=
356d9d2670c9a2bce3e966efefd738"
>> >> +UNINATIVE_CHECKSUM[i686] ?=3D "83114d36883d43a521e280742b9849bf85d03=
9b2f83d8e21d480659babe75ee8"
>> >> +UNINATIVE_CHECKSUM[x86_64] ?=3D "fd75b2a1a67a10f6b7d65afb7d0f3e71a63=
b0038e428f34dfe420bb37716558a"
>> >> --
>> >> 2.34.1
>> >>
>> >>
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> Links: You receive all messages sent to this group.
>> >> View/Reply Online (#182136): https://lists.openembedded.org/g/openemb=
edded-core/message/182136
>> >> Mute This Topic: https://lists.openembedded.org/mt/99279066/3617156
>> >> Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [Martin.Jansa@gmail.com]
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>


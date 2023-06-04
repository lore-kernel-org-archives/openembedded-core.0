Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDD2C7EE23
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 19:14:23 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.23244.1685906053971675959
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 12:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=oQ7ddvDI;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.41, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f619c2ba18so1569781e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 12:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685906052; x=1688498052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNR6KWXemAkOR6L2ucdY21UuwS9Gbd+ssTq9/KPxd88=;
        b=oQ7ddvDIE7l5SxBdbm5rIUOujs6Yjwzj0ytV9WAPqXdjIGgv6TRdMN2uasxdDpar5t
         KLE7w+a3aG97rsSWvJxB4qAkwtBVcJgsG+6FdNwpM49AAyt8W+NzsmXt4RMhayrquMiy
         2KN/MYUQB1Sei/bEIGwy+DPjV6BlDKdY5YvZVbFLkJKe0LQ8TCb8H31nVtiCEiRHoOmJ
         PxTldwF+yPG6Ke2NiBP+mUMH85JnMT30V06z/9idj9NQjtYeYnupdMd/oEJvP3iU2VWO
         dcygrOTGnBrBs/45sbeEJKjBIhgJheydH2J7vynbUp7EwBwcvL0HvPkc9zMRrNOpOFbN
         s8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685906052; x=1688498052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNR6KWXemAkOR6L2ucdY21UuwS9Gbd+ssTq9/KPxd88=;
        b=Y8ILbAlT56h9WcgPNOAak38VHD5x16Xfn/kFCfC+8p7P4gDjXMKMdd6p5xL8R3VN7Y
         VgBkdmW11vmrWVJ+nngIGiPgLfc2hpaHb7cSCtHL1Wm4dSOB1Ac8hOuOQ0pwSOZ48cc2
         c1u8xnfOw7j3ltfyMNIqJOJT6F1lvjocZfTtO9zeHY37ZWi34rc/vsy1hONpcEj2dGRF
         U08CKNdqKIYUdJZC6N7DY1EhXHP0r/bkUFdJ4o+qMpye4CgLbValtbXvcXWDV/7p6VcP
         JIvxJJ6MH1NS7iq8oF5xSQS46Ux0jEneLUse7Psx2+sA5/PvHqq0O4PPGL/sHGUW9qOf
         eNHA==
X-Gm-Message-State: AC+VfDybaQUfl2qlS1iRQJpZM/bTZ9/x1CWuMXcRrMUjJEtTA9vbAS+f
	fxT8PuCf8WQMNeWap1TV6XYHdlMy82lvb3C+ov5Vig==
X-Google-Smtp-Source: ACHHUZ7vPtW7QCBeI+OeJW/DvNojLgXddY6ejFGEfahQbgEDKL2aBt3tub6BAQ+rtS4vhdiNcEs1UuqqTQa8vAJ9oqM=
X-Received: by 2002:ac2:5201:0:b0:4f3:78c2:2a6d with SMTP id
 a1-20020ac25201000000b004f378c22a6dmr4104414lfl.3.1685906051561; Sun, 04 Jun
 2023 12:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685672395.git.steve@sakoman.com> <0470293e16f424ba4ee6505f3ef68e5ee13df483.1685672395.git.steve@sakoman.com>
 <CA+chaQdwObovTdLKQDoK5iKs4JDZXMNbmKc8X-EJFLaNJdX+Ww@mail.gmail.com>
In-Reply-To: <CA+chaQdwObovTdLKQDoK5iKs4JDZXMNbmKc8X-EJFLaNJdX+Ww@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 4 Jun 2023 09:14:00 -1000
Message-ID: <CAOSpxdabCO0O+Ct_wMeYxCiZ60=33tC3a0jAqw=yL12KSfNpCA@mail.gmail.com>
Subject: Re: [OE-core][mickledore 13/13] uninative: Upgrade to 4.0 to include
 latest gcc 13.1.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 19:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182366

On Sun, Jun 4, 2023 at 7:39=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> Hi,
>
> it looks like this change is causing mkfs.ext4 to segfault on some builde=
rs.
>
> I'm seeing it on ubuntu-18.04 (I know it's unsupported now). It might be =
related to older docker or libseccomp2 there, because there is similar issu=
e with gdk-pixbuf-native which fails when buildtools-extended is used toget=
her with this and might be related to https://github.com/moby/moby/issues/4=
3595 because when I try very similar 18.04 ubuntu image on my gentoo host I=
 cannot reproduce neither the gdk-pixbuf-native failure nor the mkfs.ext4 s=
egfaults.
>
> I'm trying to get access to some of the affected boxes to find out which =
version docker/libseccomp2 is used there and to double check that this is r=
oot cause for these failures (now I can only confirm that it started in Nan=
bield when this uninative upgrade was merged and now I've reproduced the sa=
me with kirkstone-nut with the same uninative upgrade.
>
> It might be useful to delay backporting this for a bit longer (and I'll s=
oon confirm if 3.10 was already affected or not).

Agreed, I'm struggling with kirkstone too, so will delay taking the
uninative update until we learn more.

Thanks for the review!

Steve

> On Fri, Jun 2, 2023 at 4:22=E2=80=AFAM Steve Sakoman <steve@sakoman.com> =
wrote:
>>
>> From: Michael Halstead <mhalstead@linuxfoundation.org>
>>
>> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit f87becb69e02bdf055dffb633ed4f6d36b36f7a7)
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/di=
stro/include/yocto-uninative.inc
>> index f3c05b7e20..ad4816a1f3 100644
>> --- a/meta/conf/distro/include/yocto-uninative.inc
>> +++ b/meta/conf/distro/include/yocto-uninative.inc
>> @@ -7,9 +7,9 @@
>>  #
>>
>>  UNINATIVE_MAXGLIBCVERSION =3D "2.37"
>> -UNINATIVE_VERSION =3D "3.10"
>> +UNINATIVE_VERSION =3D "4.0"
>>
>>  UNINATIVE_URL ?=3D "http://downloads.yoctoproject.org/releases/uninativ=
e/${UNINATIVE_VERSION}/"
>> -UNINATIVE_CHECKSUM[aarch64] ?=3D "b11f7dff0ff5e3c971f22e89a105efb0f8d20=
06fd71d1ea3e5da771e416b0e01"
>> -UNINATIVE_CHECKSUM[i686] ?=3D "ad7daa7fca7693ca07eea5279f830333530171d3=
57759b380954a25254edd8dd"
>> -UNINATIVE_CHECKSUM[x86_64] ?=3D "ce8ff7e3247da312fbf84008f415bc1b4d113a=
c9fe4ec91581e4a20cd8b475d3"
>> +UNINATIVE_CHECKSUM[aarch64] ?=3D "7baa8418a302df52e00916193b0a04f318356=
d9d2670c9a2bce3e966efefd738"
>> +UNINATIVE_CHECKSUM[i686] ?=3D "83114d36883d43a521e280742b9849bf85d039b2=
f83d8e21d480659babe75ee8"
>> +UNINATIVE_CHECKSUM[x86_64] ?=3D "fd75b2a1a67a10f6b7d65afb7d0f3e71a63b00=
38e428f34dfe420bb37716558a"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#182136): https://lists.openembedded.org/g/openembedd=
ed-core/message/182136
>> Mute This Topic: https://lists.openembedded.org/mt/99279066/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [M=
artin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF97C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 17:31:23 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.2181.1645032682252965734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 09:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cjL7187k;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id q4so926718qki.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 09:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x0k0rzny9F1qhmooKqSXMvXJi2AESVrxThRf5z8MxXo=;
        b=cjL7187kkA+32jJtyZJfuTD/IEV90nQfK+GTLln9ZLglu7Abj4dpcl5Ip3OAvYajcu
         wXbIYaXxIxYlOzPJCD8gTF76+aEl2+wxN01GjEJvT3qKz/7jtiER0J22BFyMvFrc/SoE
         CKvZK+w5a6TDYUv9VSmzJqEnmcrsYwdlPLgYR0p2fyWn0WqHca5PQKe6lI42hBYefFIS
         6ZW396+K6boJfBpCpcNZNaRVuCOpNg5tIIVq1jajHTpV+PN2w/HTPmJEokOrMlFK9Jtw
         +7wTceNsMvEFpqdoxUqmtKDaOUCZXILiGpvuFNcqwwq/M5xev44JmweEhkISrSr7hDDx
         dMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x0k0rzny9F1qhmooKqSXMvXJi2AESVrxThRf5z8MxXo=;
        b=lbkINT0+y3/B7ysZh+P1NAXJUTRN/ZE801WNwYKT+srUeDdo5Ia6HixxxtHz0YiUBc
         HheL3Ii6nNXWyGkQc6P1zfFn2pgzMw/py031H/JVQatypxCVED8YQd2i4v4qBl8vu3+4
         XZhDwRbOwsXWH27W4J12a+reXLuPjdQY8EgM3LAPHosnWG5yGtIGcoZ3liwUKXEOcSH6
         G769cz75gukHQZM9fLddCx8mQoct5YcsqQxAjzz+ksRCrpsYVKQptWzzxNnlEBkGqS1Z
         HxSx1Wz4TsMLH3gPaUUpcAW2BfWfRvSEeTUDp6RDC1Ha8x7PuQCf4V9v5KALW9CgC+Cp
         LiVA==
X-Gm-Message-State: AOAM5311fIY0qiStp1RisTOi3bUPkzVvwNbAONPc5Rs+3h4A554gyC7Y
	n4Ngy4h5D5PCX6WENGxMlutleKhB3aqtliScp/0=
X-Google-Smtp-Source: 
 ABdhPJxa9Na9bARY3SSuvxOIfm6oM8eqdMkJ2wc3jyl5GlzxdgedaAzJoXJCyiqoa5Dh6hSfcwDOjJiLtCqWgXFDNDI=
X-Received: by 2002:a37:b541:0:b0:475:4524:bb4b with SMTP id
 e62-20020a37b541000000b004754524bb4bmr1856601qkf.149.1645032681266; Wed, 16
 Feb 2022 09:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20220107192255.3128781-1-raj.khem@gmail.com>
 <CANNYZj9OOwkzDKbrDbav0iQPzC4uKiQ5HTP4W4joLMh=oXfrPg@mail.gmail.com>
 <ac1db1b0-fe6a-995d-344a-ebd39b9ab72e@mailbox.org>
In-Reply-To: <ac1db1b0-fe6a-995d-344a-ebd39b9ab72e@mailbox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Feb 2022 09:30:54 -0800
Message-ID: 
 <CAMKF1srz=EjFE5u_msij_EFNbtksS21dRAkoBcBkMSR881tRtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libsdl2: Fix build when libunwind is not
 used
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 17:31:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161780

On Wed, Feb 16, 2022 at 1:58 AM Carlos Rafael Giani via
lists.openembedded.org <crg7475=3Dmailbox.org@lists.openembedded.org>
wrote:
>
> "MACHINE=3Dqemux86-64 bitbake libsdl2-native" still fails with a similar =
error:
>
> | CMake Error at /home/test/yocto-master/poky/build/tmp/work/x86_64-linux=
/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Module=
s/FindPkgConfig.cmake:890 (message):
> |   None of the required 'libunwind' found
>
> This is triggered by the "pkg_search_module(UNWIND REQUIRED libunwind)" l=
ine right above the one that is modified by this patch.
>
> Any idea what is going on?

I think its looking for libunwind on your build host.

>
>
> On 07.01.22 21:34, Alexander Kanavin wrote:
>
> Thanks :)
>
> Alex
>
> On Fri, 7 Jan 2022 at 20:23, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> clang provides libunwind.h and cmake adds a check to
>> find libunwind when this header is detected, which was
>> not the case with automake. The check however is expecting
>> specific unwinder implementation which provides libunwind-generic
>> solib, this is not a standard library that all implementations
>> will provide, therefore make this check optional.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> ---
>> v2: Udate patch status to submitted
>>
>>  .../libsdl2/optional-libunwind-generic.patch   | 18 ++++++++++++++++++
>>  .../recipes-graphics/libsdl2/libsdl2_2.0.18.bb |  1 +
>>  2 files changed, 19 insertions(+)
>>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/optional-libun=
wind-generic.patch
>>
>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-ge=
neric.patch b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-gene=
ric.patch
>> new file mode 100644
>> index 00000000000..757b99a5f68
>> --- /dev/null
>> +++ b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.p=
atch
>> @@ -0,0 +1,18 @@
>> +Do not error when libunwind-generic is not found, Not all
>> +implementations of libunwind will provide this library therefore
>> +do not make it hard error if its not found.
>> +
>> +Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/5194=
]
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -1358,7 +1358,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROI
>> +       if(HAVE_LIBUNWIND_H)
>> +         # We've already found the header, so REQUIRE the lib to be pre=
sent
>> +         pkg_search_module(UNWIND REQUIRED libunwind)
>> +-        pkg_search_module(UNWIND_GENERIC REQUIRED libunwind-generic)
>> ++        pkg_search_module(UNWIND_GENERIC libunwind-generic)
>> +         list(APPEND EXTRA_LIBS ${UNWIND_LIBRARIES} ${UNWIND_GENERIC_LI=
BRARIES})
>> +       endif()
>> +     endif()
>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb b/meta/reci=
pes-graphics/libsdl2/libsdl2_2.0.18.bb
>> index 893386343a7..1559d5e9425 100644
>> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
>> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
>> @@ -18,6 +18,7 @@ PROVIDES =3D "virtual/libsdl2"
>>
>>  SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>>             file://0001-Fix-build-against-wayland-1.20.patch \
>> +           file://optional-libunwind-generic.patch \
>>  "
>>
>>  S =3D "${WORKDIR}/SDL2-${PV}"
>> --
>> 2.34.1
>>
>>
>>
>>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161773): https://lists.openembedded.org/g/openembedde=
d-core/message/161773
> Mute This Topic: https://lists.openembedded.org/mt/88269209/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


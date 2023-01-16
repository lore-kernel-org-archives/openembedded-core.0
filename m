Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AEDC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 16:31:38 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.171306.1673886693853599225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 08:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Q12PpFO9;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id mp20so22736041ejc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 08:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m3SdTDeDtuBQc7PJ9VnimarYIp5MD1YnsIwd5pOsu70=;
        b=Q12PpFO9ApSDIcGxS4Woy8PcyKVhyYuxsAeFEn/dSnsnXKaF2BY0FC4441rzzprOS3
         p1VGUO1nV2gNZ7BqLK2bppZMUYQmwXhvLwF46T82xxWzz8+abdsD9qwAlTjlKORE1SQ9
         qY5iRDDgQjZ2SipOZ3Iy7MynG823/NzwMW9wmqp/L1wjqEnCJ/LAiUX2ophMI+G/If/q
         ZrytOGZYrq1QMz7zW/aPpIbPLDYqNDNa+5aXxTbxNlTKcCZcUBYrYFrA9bJGm8wyV1is
         8CLWUGRpLUife9tK/MOZZtmB7bXQWF0rhUMayh60fX2caD+RWPQWQEBmhykzKNdnllB2
         x9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3SdTDeDtuBQc7PJ9VnimarYIp5MD1YnsIwd5pOsu70=;
        b=eAeIEjMZUEPXr3J22KD4r2AR8C0WTGWkPo/3WAD87kcF3iDhLd+wjmUMtc2ElVIEYw
         huWdUBofWUPjkhZYfS4uAi6QYfhghnpxDeZoPmB7vWfJ2j5Wj2j8ZS087WZEL7jaQQRt
         o4yEHYCMsjU9Tlb1ZP/waJnaA4aOfdxIzgAsqia72Tvvn8iTOylZcd4qxY16yPVzloBT
         Ke/HdalIN+vx3slFp+5W34Ea4Mr4eYwULPfsc6ArGNbG4+f3EBld4K+hexoOsEmrs4PO
         7ZlL2SSugA4idR8RJ+kKKy1q++mFF/yisiP0ZSe6JBubtFBJzm5F4Bg+NAnutb6Yh/BG
         cIrg==
X-Gm-Message-State: AFqh2kopiwXIpuxSKUDUYQkKbICxn5DdtyK5nQumtpOwr3EhdGxuTzFQ
	YXbqiIFMpIVL6+ZGiq8hu1eRJxRFX3sAGc4VjJhRnw==
X-Google-Smtp-Source: AMrXdXu4CftlDwU4NN7Q8Ym2h7VN4yyc54ACE2DK7yenv9zM0DvXrP6mHdh8+wxOsRHI25kH7P5UUrK62Rw3lqFVKHM=
X-Received: by 2002:a17:906:914b:b0:865:d677:1f6c with SMTP id
 y11-20020a170906914b00b00865d6771f6cmr1756912ejw.584.1673886692034; Mon, 16
 Jan 2023 08:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20230116065843.19446-1-pavel@zhukoff.net> <CAMKF1sr6zMSx1JDt7Pmcw+BJbDeg-VUGvRGpCCoRwYmwN9nNmA@mail.gmail.com>
In-Reply-To: <CAMKF1sr6zMSx1JDt7Pmcw+BJbDeg-VUGvRGpCCoRwYmwN9nNmA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 16 Jan 2023 06:31:20 -1000
Message-ID: <CAOSpxdZA6UG21u0iKibzndy_SYYNSBqm-0P=dieDWduneZfu1Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] gcc: Fix build with musl and
 usrmerge on arm
To: Khem Raj <raj.khem@gmail.com>
Cc: Pavel Zhukov <pavel@zhukoff.net>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 16:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176001

On Mon, Jan 16, 2023 at 5:31 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Sun, Jan 15, 2023 at 10:59 PM Pavel Zhukov <pavel@zhukoff.net> wrote:
>>
>> Backport fix from master to allow gcc to use proper linker path for
>> musl [Yocto #14977]
>
>
> Lgtm

Hi Khem,

Which of the two versions of the fix do you prefer that I take?

Thanks!

Steve

>> Fixes:
>> | qemu-arm: Could not open '/lib/ld-musl-armhf.so.1': No such file or directory
>>
>> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
>> ---
>>  meta/recipes-devtools/gcc/gcc-11.3.inc         |  1 +
>>  .../gcc/0031-fix-musl-arm-with-usrmerge.patch  | 18 ++++++++++++++++++
>>  2 files changed, 19 insertions(+)
>>  create mode 100644 meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
>> index 27074a06ae..2adb21ed84 100644
>> --- a/meta/recipes-devtools/gcc/gcc-11.3.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
>> @@ -60,6 +60,7 @@ SRC_URI = "\
>>             file://0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch \
>>             file://0029-Fix-install-path-of-linux64.h.patch \
>>             file://0030-rust-recursion-limit.patch \
>> +           file://0031-fix-musl-arm-with-usrmerge.patch \
>>             file://0001-CVE-2021-42574.patch \
>>             file://0002-CVE-2021-42574.patch \
>>             file://0003-CVE-2021-42574.patch \
>> diff --git a/meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch b/meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch
>> new file mode 100644
>> index 0000000000..1408b65c64
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch
>> @@ -0,0 +1,18 @@
>> +Upstream-Status: Inappropriate [bugfix]
>> +
>> +The fix has been picked from OE-core ustream:
>> + 0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>> +
>> +Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
>> +===================================================================
>> +--- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
>> ++++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
>> +@@ -89,7 +89,7 @@
>> + #define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
>> + #endif
>> + #define MUSL_DYNAMIC_LINKER \
>> +-  "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
>> ++  SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
>> +
>> + /* For armv4 we pass --fix-v4bx to linker to support EABI */
>> + #undef TARGET_FIX_V4BX_SPEC
>> --
>> 2.39.0
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175997): https://lists.openembedded.org/g/openembedded-core/message/175997
> Mute This Topic: https://lists.openembedded.org/mt/96302404/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


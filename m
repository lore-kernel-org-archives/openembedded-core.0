Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912ABC54E67
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 15:30:07 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.20959.1710689405498465247
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 08:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vsv2MFle;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33ed4d8e9edso1265075f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710689404; x=1711294204; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVnZF8kabRTDx4FEby6zA1S3lStWPIlbtUEI4F+ENQw=;
        b=Vsv2MFleBoInrUaRfyNg8l4G76BHHwk2weDUD0MF9bNncyvNiPORdLXympapTNY/Xw
         LMQIDsHDAXaHrBYLqElNsHjgrJTKOtaK0v12aDgTmKeXo16gqbNDWGfmTCWLNLugiZpx
         LzI2IEdDur4ARdQf0fnVXMRO0rPf8iIRznX8ZQDdHV100NXqNxKjVGuf6dRv0ussC05m
         An5cdJ5TqMCnhyiKHzm1weBkI00+PMh2m61tbfPJbkK+B5cJj2x8CM+j9XzTpmz9inKl
         NXhwbqQy9IDwUANAwtq1w6L2LV68m2DRJUJjpcYyq7fxzs1Un+au0w28Nuj3EOpR4G+P
         UgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710689404; x=1711294204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVnZF8kabRTDx4FEby6zA1S3lStWPIlbtUEI4F+ENQw=;
        b=RTJXQU+BV6ToQCtqVT6cK1OZsHJ8JJvcKNEAS/qxUq64SX5C+FHjSHZGvFkaSPNGc2
         dIXCFOJGnjRZtxmiJKk7YITwHy1dXJs8qr0R88ZmjLKHYBX9xzBZBspp/IhsFwp2qvVI
         QY0GUU4Y0xjZMeRQWRIbfQsAhjRlquKI4qF30jP7X+k9MWhik+no05aKp6stCvXTIIXB
         w2pfuMbbGUdtFokrqllRq6o2Yje9lAX8sIXskKqeEAqBRU+uyfd7D9Vsb9kqIttXBKt7
         fr/W81Hy/lo0at/0xWhfQoM9SaWTfGPYlVECuzgS9zcKx4PLKD1KH1oz8NLNrG8yhHnG
         bVzQ==
X-Gm-Message-State: AOJu0YztP8k+27OFr1vvv6Nhrm/kgWzqRyOrDNvkiQSfCiD8NMxl2qbh
	m8mwOa0qmUY3OeJB/oWgFGgZlCSS7/nUGqD30R5t1hglwNTsk0U5f0Fhg8LXQLGy7JXV/El1ZSy
	/wM4Cw4N+LBfHZ94K7Xc4HuoAbuc=
X-Google-Smtp-Source: AGHT+IHPojj6FuVfEQgEGKfLV6jXogJxIAkqznqAebG7yqRZV5Y34ysu7RjCXCXGkVC5jKdYplOjYSSDAV1OXA7Ml3k=
X-Received: by 2002:adf:fa4d:0:b0:33e:c5fd:662b with SMTP id
 y13-20020adffa4d000000b0033ec5fd662bmr6782004wrr.4.1710689403725; Sun, 17 Mar
 2024 08:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240317120138.180013-1-martin.jansa@gmail.com> <CAK6=ix7A-RfJ4b9gkFvwu8LYCvNW6Uj9ff1ZqvJBGQ0A6xCORg@mail.gmail.com>
In-Reply-To: <CAK6=ix7A-RfJ4b9gkFvwu8LYCvNW6Uj9ff1ZqvJBGQ0A6xCORg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 17 Mar 2024 16:29:51 +0100
Message-ID: <CA+chaQfyFCNvwoD_VsWbgx6TEcxaQT-sJgg7tbkgTsbwF4i1fA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] stress-ng: avoid calling sync during do_compile
To: Randy MacLeod <rwmacleod@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 15:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197265

No, I've noticed this when stress-ng and lib32-stress-ng were running
do_compile at the same time and for some reason both sync calls got
stuck, I've killed it when it was running both do_compile tasks for 13
hours (and there was chromium and lib32-chromium do_compile running
for 15+ hours as well (not sure if it was related to this sync or
something else).

On Sun, Mar 17, 2024 at 3:37=E2=80=AFPM Randy MacLeod <rwmacleod@gmail.com>=
 wrote:
>
>
>
> On Sun, Mar 17, 2024, 08:01 Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> calling 'sync' from do_compile in the middle of big OE world
>> build harms the build time.
>
>
> No objection from me but do you have a any data on how much an innocuous =
call to sync slows down a build?
>
> Randy
>
>>
>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> ---
>>  .../0001-Makefile-avoid-calling-sync.patch    | 35 +++++++++++++++++++
>>  .../stress-ng/stress-ng_0.13.12.bb            |  1 +
>>  2 files changed, 36 insertions(+)
>>  create mode 100644 meta/recipes-extended/stress-ng/stress-ng-0.13.12/00=
01-Makefile-avoid-calling-sync.patch
>>
>> diff --git a/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Make=
file-avoid-calling-sync.patch b/meta/recipes-extended/stress-ng/stress-ng-0=
.13.12/0001-Makefile-avoid-calling-sync.patch
>> new file mode 100644
>> index 0000000000..fec8c524eb
>> --- /dev/null
>> +++ b/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-av=
oid-calling-sync.patch
>> @@ -0,0 +1,35 @@
>> +From 1d1801902a4944c6f5fa521c19b32fbac7342a0c Mon Sep 17 00:00:00 2001
>> +From: Colin Ian King <colin.i.king@gmail.com>
>> +Date: Sat, 6 Aug 2022 13:05:59 +0000
>> +Subject: [PATCH] Makefile: avoid calling sync
>> +
>> +Original commit message:
>> +Makefile: use ld-gold if it is available
>> +
>> +Speed up linking by using ld-gold if is available. Add build
>> +time detection to see if compiler allows it
>> +
>> +MJ: backported only the "sync" removal from Makefile as calling
>> +    it from do_compile in the middle of big OE world build harms
>> +    the build time.
>> +
>> +Upstream-Status: Backport [V0.14.04 c10e5c3f9f5560a085279f4c4b399c2f34c=
b897d]
>> +
>> +Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> +---
>> + Makefile | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index f8f71c54b..23db4c612 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -425,7 +425,6 @@ OBJS +=3D $(CONFIG_OBJS)
>> + stress-ng: $(OBJS)
>> +       $(Q)echo "LD $@"
>> +       $(V)$(CC) $(CPPFLAGS) $(CFLAGS) $(OBJS) -lm $(LDFLAGS) -o $@
>> +-      $(V)sync
>> +
>> + config.h:
>> +       +$(MAKE) -f Makefile.config STATIC=3D$(STATIC) -j
>> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb b/meta=
/recipes-extended/stress-ng/stress-ng_0.13.12.bb
>> index 807ecd3466..72dafddaf8 100644
>> --- a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
>> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
>> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5f=
ce4486a80fdaf4a4263"
>>
>>  SRC_URI =3D "git://github.com/ColinIanKing/stress-ng.git;protocol=3Dhtt=
ps;branch=3Dmaster \
>>             file://0001-stress-cpu-disable-float128-math-on-powerpc64-to=
-avo.patch \
>> +           file://0001-Makefile-avoid-calling-sync.patch \
>>            "
>>  SRCREV =3D "f59bcb2fe1e25042e77d5e4942f72bfa026fa305"
>>  S =3D "${WORKDIR}/git"
>> --
>> 2.44.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#197260): https://lists.openembedded.org/g/openembedd=
ed-core/message/197260
>> Mute This Topic: https://lists.openembedded.org/mt/104982006/953399
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
wmacleod@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


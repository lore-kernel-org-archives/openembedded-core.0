Return-Path: <h4nn35.work@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF3EC10DC1
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 09:46:12 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.68967.1701337562874415574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 01:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lwMQ3xeF;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: h4nn35.work@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-db538b07865so454771276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 01:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701337562; x=1701942362; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NHoN410PzzDHhNc/ZyKxYZ5K7CD6z/so443DfCzsgI=;
        b=lwMQ3xeFjPQK1cv221RXqth1co1U6CS2KqP4LymBMYnaPCsE1dhI5rTJvPzu/KXQPp
         F8d/ONV0cAHKDqX3tLR+dWL9rFSZm5XZAN0EtrwrhQbllpE27SIUlTssR1PjjlvPdUp3
         xQm/DUoEEiGhwebxpJBikgP/6g0FSZkm3PDLUwQwthv4SOVsJYDQ/H5NovD4vISiXB7s
         ssAAILpDJMWl2LJkG2VksK7CnwmZHHAgd8atY9vlYZ6QqZxg/lqxneGCyGzMTRagwdKj
         gLgA4rIf5wjM92x1wnjE4aQ6N+GjUTYKjaScTCcBzHmz0Mr8jfBkA95rV6phzx2BaZsX
         CFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701337562; x=1701942362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NHoN410PzzDHhNc/ZyKxYZ5K7CD6z/so443DfCzsgI=;
        b=BwbbQGp60IINxEfc6b2v4kLH5tafcbJ5bXd4bquOSCR+grrLPnjSMw7B0gyDBsI93m
         N+iByTDRj2EJVhfraTf2zWaw3k4Ot+ktj81J6H9QxgS7zqMedi5LJfAnhKg5L+huz/FF
         ypCfVgzK5l4SyegmzpSuQ08afqeGNFo9nHrY5xz3Ue0/Sir+5WU9dTJqqkuVwh6zq8XO
         PbFnuv6V5yMWzAVswG7gu5MyXbKMXoBUImYeKGKMhZU9tggNCGZoPNY88afA6NwOFgtD
         4444vnfl8+WF33jCCV6bmt2WNPXs0OyGCfB3wIxWNu3EjXVm1/bMLP//ufGfT16Fy8Lh
         FTqQ==
X-Gm-Message-State: AOJu0YzyD9Zqdrgq4f5NIxyS89TCIeECSHpMsdXaFfLsvegi0U4a8XDL
	uoycM0UiDVzW5q9bonVvkWTM+MTHyQtGfbo/Yw==
X-Google-Smtp-Source: AGHT+IExiOBUZgUoz/T66wavVk2696l5R0p+ss6ZPaNNqk10KqS9T3lRjaaLjTY0n89UFZRhSdH3sMilIfT4NR8A9Jk=
X-Received: by 2002:a25:6f46:0:b0:da0:cb88:b890 with SMTP id
 k67-20020a256f46000000b00da0cb88b890mr20786222ybc.60.1701337562041; Thu, 30
 Nov 2023 01:46:02 -0800 (PST)
MIME-Version: 1.0
References: <CAHvQdo1KaZ2S1srqjvyj=R0tVroUieExEXmfBpiEBq9J1RZxDQ@mail.gmail.com>
 <CAMKF1sqXJRha2wXUoMu_M9opLT2FCB+-36L9uvx-YDZRO3BQ7Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqXJRha2wXUoMu_M9opLT2FCB+-36L9uvx-YDZRO3BQ7Q@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Thu, 30 Nov 2023 10:45:50 +0100
Message-ID: <CAHvQdo0ewRcxj=dznV+ChSBHFp_WpOe2-YRv3KZ9iR=OFQGEWQ@mail.gmail.com>
Subject: Re: rootfs.py generates wrong ld.so.cache in case of usrmerge distro feature
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191489

On Fri, Nov 24, 2023 at 6:03=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Fri, Nov 24, 2023 at 2:34=E2=80=AFAM Johannes Pointner <h4nn35.work@gm=
ail.com> wrote:
>>
>> Hello,
>>
>> I did recently my first Nanbield build which required the distro
>> feature usrmerge because of using systemd and as a result QtWebEngine
>> didn't work anymore.
>> I reported this to Qt(https://bugreports.qt.io/browse/QTBUG-119140),
>> but looking deeper into this it turned out to be an issue related to
>> the generated ld.so.cache in the rootfs.py.
>> At the moment in the ldconfig-native which is used to generate this,
>> are the paths to LIBDIR("/usr/lib") and SLIBDIR("/lib") hardcoded, but
>> that isn't correct if usrmerge is enabled, at least I think so.
>> The resulting ld.so.cache looks like this:
>> 236 libs found in cache `/etc/ld.so.cache'
>>        libzstd.so.1 (libc6) =3D> /lib/libzstd.so.1
>>        libz.so.1 (libc6) =3D> /lib/libz.so.1
>>        libxtables.so.12 (libc6) =3D> /lib/libxtables.so.12
>>        libxslt.so.1 (libc6) =3D> /lib/libxslt.so.1
>>        libxml2.so.2 (libc6) =3D> /lib/libxml2.so.2
>> ...
>>
>> Would it be OK to configure the paths LIBDIR SLIBDIR using base_libdir
>> and libdir?
>
>
> I think it should check for usrmerge feature and generate the correct val=
ues during build
This is already done in bitbake.conf:
root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',
'${exec_prefix}', '${base_prefix}', d)}"
Do you really think we should check again in ldconfig-native for
usrmerge, can't we just do something like that:
 Add in ldconfig.c:
+#ifndef LIBDIR
#define LIBDIR "/usr/lib"
+#endif
+#ifndef SLIBDIR
#define SLIBDIR "/lib"
+#endif
and build it like this:
do_compile () {
$CC ldconfig.c -std=3Dgnu99 -DLIBDIR=3D\"${nonarch_libdir}\"
-DSLIBDIR=3D\"${nonarch_base_libdir}\" chroot_canon.c xmalloc.c
xstrdup.c cache.c readlib.c  -I. dl-cache.c -o ldconfig
}
>
>>
>>
>> Thanks,
>> Hannes


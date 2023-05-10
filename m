Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E59C77B7C
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 20:00:51 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.28050.1683748849318756296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 13:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XoNn73N6;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-76c636b6306so140117839f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 13:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683748848; x=1686340848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpR93KxiZlinTzWubHLtQBGk+yZK6SZA1ezPmOcb4+o=;
        b=XoNn73N6IjZnvxEJFinRknCMoxTlBiihow3UFDEntKIZbRRRHvpzkZ7F/mdTlPbaVd
         UTR5ZR51ow1LV24bvZFRt44fSQ9EVqTanQiLo/hYp8FYLCOzIz64R1PZMpkxcs0XHkVK
         HVNGCI9eGVlSaLuuFxJtZMBCcfC58U0YtfdVjsaSy//YSvJLQYQh8uclSflJphcCqtxs
         J7DVDUwY5ytUBstCaPauAifeX7pYTl3UpBG7uzu+nlexnPt0A/IHg09vmwSMXg8dMkGD
         ABHIwK86O7TbBuRqcxRWcllhijAnSD7b99I78CEhcIwuSy5Op65MPkBOhsssRV8JjLml
         l7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683748848; x=1686340848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpR93KxiZlinTzWubHLtQBGk+yZK6SZA1ezPmOcb4+o=;
        b=Xtq1wxiigWuP8zbnZ1/NanF4r3wddZwMoFC9kIr0MomC9WEOPWTtiH3t4fXzBCei9c
         GqPAEzZwOw73BlrM2Xa7DCkqZ0SBhn85DVoeWO5BU+V4m6L+EtI6gTCaWfw/IR1OILwR
         /r116C4wXy3i5FJMh0Ojqr1OgSk307Ncdf5D6buRqDgMQByg2jG20o3WXJrwUmSN4PQi
         geshBW+wAJQwXEk4Icc+QXlYjZwU0KDw1rNQM5t63yAfXANdfgnzWgM11RxK+BZGXWAw
         a1wCHcm+2hdehkvzEjZv1PmKb+jwOfFzuMXO+qZ/kLzH1EDjNDEZvFhRq4fR8kNHNWmn
         IbSw==
X-Gm-Message-State: AC+VfDzhPb7U28d7dN0935iHqMX43V99IQFyoMQ4SVGkxcaAxStm6sme
	jIcCZp0K6jeR0U7oWLz8AZjtJ5nlg6RuJVVFglU=
X-Google-Smtp-Source: ACHHUZ4LneYIqo25LdIX8E4alXMXpahnWI08/YB6SITsfTD1vP/7pwjYprHuBfV0t5LTQywMRtVVhoN/KYIkwmj3MZM=
X-Received: by 2002:a6b:dc03:0:b0:76c:6626:5e86 with SMTP id
 s3-20020a6bdc03000000b0076c66265e86mr3354093ioc.20.1683748848467; Wed, 10 May
 2023 13:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230509161310.3839898-1-max.oss.09@gmail.com>
 <20230509161310.3839898-2-max.oss.09@gmail.com> <CANPvuR=RD3POyxB1cbYaBG_4Vq3gprCPYQNwZZxRQyuKPGxZbQ@mail.gmail.com>
In-Reply-To: <CANPvuR=RD3POyxB1cbYaBG_4Vq3gprCPYQNwZZxRQyuKPGxZbQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 May 2023 16:00:42 -0400
Message-ID: <CADkTA4O6VaBt9qgb4oOhsFGhmnEQB04uxe7HuqEgLOi3a8WzZg@mail.gmail.com>
Subject: Re: [OE-core][Patch v2 1/3] libtraceevent: import from meta-openembedded
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Max Krummenacher <max.oss.09@gmail.com>, openembedded-core@lists.openembedded.org, 
	raj.khem@gmail.com, Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 20:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181123

On Tue, May 9, 2023 at 1:09=E2=80=AFPM Jose Quaresma <quaresma.jose@gmail.c=
om> wrote:
>
> Hi Max,
>
> This also needs an entry on meta/conf/distro/include/maintainers.inc
>

Max,

I'm already maintaining perf, so if you want to put my name beside
libraceevent for a v3, that's fine with me.

Bruce

> Jose
>
> Max Krummenacher <max.oss.09@gmail.com> escreveu no dia ter=C3=A7a, 9/05/=
2023 =C3=A0(s) 17:13:
>>
>> From: Max Krummenacher <max.krummenacher@toradex.com>
>>
>> Import from meta-openembedded at commit d250a0dc0 ("libtraceevent:
>> upgrade 1.7.1 -> 1.7.2").
>> Starting with kernel 6.4 libtraceevent is a dependency of perf. While
>> one can still build perf without it by opting out one would loose its
>> functionality compared with building perf from kernels before 6.4
>>
>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>> ---
>>  ...not-preserve-ownership-in-cp-command.patch | 40 +++++++++++++++++++
>>  .../libtraceevent/libtraceevent_1.7.2.bb      | 25 ++++++++++++
>>  2 files changed, 65 insertions(+)
>>  create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/0001=
-makefile-Do-not-preserve-ownership-in-cp-command.patch
>>  create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent_1.7.=
2.bb
>>
>> diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefi=
le-Do-not-preserve-ownership-in-cp-command.patch b/meta/recipes-kernel/libt=
raceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-comma=
nd.patch
>> new file mode 100644
>> index 0000000000..5e88048817
>> --- /dev/null
>> +++ b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-n=
ot-preserve-ownership-in-cp-command.patch
>> @@ -0,0 +1,40 @@
>> +From ed0a31000305d937abe47c44d705b5b52bb36f79 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Thu, 22 Dec 2022 18:32:17 -0800
>> +Subject: [PATCH] makefile: Do not preserve ownership in cp command
>> +
>> +Fixes
>> +
>> +ERROR: libtraceevent-1.7.0-r0 do_package_qa: QA Issue: libtraceevent: /=
usr/lib/libtraceevent.a is owned by uid 1000, which is the same as the user=
 running bitbake. This may be due to host contamination [host-user-contamin=
ated]
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + Makefile | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 965ff47..0e782cb 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -287,7 +287,7 @@ $(BUILD_PREFIX): force
>> +       $(Q)$(call build_prefix,$(prefix))
>> +
>> + define do_make_pkgconfig_file
>> +-      cp -f ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_FILE};    =
\
>> ++      install -m 0644 ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_=
FILE};  \
>> +       sed -i "s|INSTALL_PREFIX|${1}|g" ${PKG_CONFIG_FILE};            =
\
>> +       sed -i "s|LIB_VERSION|${EVENT_PARSE_VERSION}|g" ${PKG_CONFIG_FIL=
E}; \
>> +       sed -i "s|LIB_DIR|${libdir_relative}|g" ${PKG_CONFIG_FILE}; \
>> +@@ -335,7 +335,7 @@ install: install_libs install_plugins
>> +
>> + install_libs: libs install_headers install_pkgconfig
>> +       $(Q)$(call do_install,$(LIBTRACEEVENT_SHARED),$(libdir_SQ)); \
>> +-              cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
>> ++              cp --no-preserve=3Downership --recursive $(LIB_INSTALL) =
$(DESTDIR)$(libdir_SQ)
>> +       $(Q)$(call install_ld_config)
>> +
>> + install_pkgconfig: $(PKG_CONFIG_FILE)
>> +--
>> +2.39.0
>> +
>> diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb b/=
meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
>> new file mode 100644
>> index 0000000000..089b6814c7
>> --- /dev/null
>> +++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
>> @@ -0,0 +1,25 @@
>> +# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
>> +# Released under the MIT license (see COPYING.MIT for the terms)
>> +
>> +SUMMARY =3D "API to access the kernel tracefs directory"
>> +HOMEPAGE =3D "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.g=
it/"
>> +LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
>> +LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3De6a75371ba4d1674925=
4a51215d13f97 \
>> +                    file://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659=
b50909238dbd"
>> +SECTION =3D "libs"
>> +
>> +SRCREV =3D "1c6f0f3b2bb47571fc455dc565dc343152517d98"
>> +SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.g=
it;branch=3D${BPN};protocol=3Dhttps \
>> +           file://0001-makefile-Do-not-preserve-ownership-in-cp-command=
.patch"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit pkgconfig
>> +
>> +do_install() {
>> +    oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgconf=
ig
>> +}
>> +
>> +PACKAGES +=3D "${PN}-plugins"
>> +
>> +FILES:${PN}-plugins +=3D "${libdir}/traceevent/plugins"
>> --
>> 2.35.3
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#181050): https://lists.openembedded.org/g/openembedd=
ed-core/message/181050
>> Mute This Topic: https://lists.openembedded.org/mt/98787450/5052612
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



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


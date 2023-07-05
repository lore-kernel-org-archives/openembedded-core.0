Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB9EEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 18:44:35 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.3123.1688582668026431986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 11:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=P3OpCikq;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-98377c5d53eso826709766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688582666; x=1691174666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK1+xvQX7wcVqIxk3dZUS3y8kzjmSuDLqd3P2myxSAI=;
        b=P3OpCikqn7UYI7hSzu4k+MeWwEhXlR4iHKOpY7Ip5cUsRq1lrsqEgYBnDyS7BNQ/sD
         FwN7mxCiTQuvqG37WkbA1nLqn6fvQqnTULR4yAlpwhaTiVb/ffMG2t70jVCbg/+Aw9Rb
         LptFaYYGwUIuzE9TRxZ5YtLLoxtJ9rphHMQY0obiY6KI0IFzPca/ZzTvDqONjOBuGvWV
         lM2UtXY+sS57TJ0cD5q1nAu+W6HiGM6AMDvFm3+z3C2j8BcDKKspqOXa/GSjmHa7txJg
         mF6SVvxXck9EebNRO814Nmz2/EkVhIxK8QY+Nu3+ljGUXW6YTO5N244CDLVAzx+nZPl0
         Pghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688582666; x=1691174666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MK1+xvQX7wcVqIxk3dZUS3y8kzjmSuDLqd3P2myxSAI=;
        b=Fe3L6+nGWIUlU7fu7JjDyrzu3HEM/4F96zKkj/Hq3/5/Xk9v5bSCi0sVnbvlf6cx/S
         zZFzn7t1CiD9I9tXPX3ij4aHJIjyRjFCY/sz6rrKaKd8vLdF6fI9gHcVJv5+TCqoOieC
         o0+NV9Tc17svFoIQQcGZeZ4e1x7XJESDMHHNT+6fum4YqROF/j0AxXr6/hszEBxNVlcu
         svt3Jt5N6TOQNotLBEafPMOrPJsPf5S0JZqSwPszWEr/jAM5qdQM3trNKd7mXZCiCiji
         bNEwzrn1MxA56nLRrYvIwhyrckhK7fZdDsh6jepLLYMAEX0whIQUeyBHeh78asXbM+rJ
         GqIw==
X-Gm-Message-State: ABy/qLYYRM4F45E9azMEsozSOdn5vqX9iFPX9HYev96QP8VivdDP803T
	yzBDhCEUZ20olzWJuNi23+AohSqKjREXZqgHQHxItQ==
X-Google-Smtp-Source: APBJJlEiTtqMOHxzyWjrQr7ba6eqCiDu0PzcZ/bVCZM0lwxwKvKOR30bKdoLuspFirhilWMUdVf4Eq+F9PH02o4TtIQ=
X-Received: by 2002:a17:906:fa18:b0:988:d6ca:ea72 with SMTP id
 lo24-20020a170906fa1800b00988d6caea72mr13467842ejb.71.1688582666220; Wed, 05
 Jul 2023 11:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230629091205.1038353-1-changqing.li@windriver.com> <CA+chaQexsc1B1CcRk0QLBseQKMkgvoBD4+fH-g5ZAT4QFn=7mw@mail.gmail.com>
In-Reply-To: <CA+chaQexsc1B1CcRk0QLBseQKMkgvoBD4+fH-g5ZAT4QFn=7mw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 5 Jul 2023 08:44:15 -1000
Message-ID: <CAOSpxdaQFP2vmMH4+vPceKOXW3C-e_iBy+xfOdjWyyr+zF2KGw@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] systemd: fix a dead link under /var/log
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 18:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183905

Sigh, I missed the RP's comment. Thanks for catching this!

I'll revert this patch in mickledore prior to the release.

Steve

On Wed, Jul 5, 2023 at 8:32=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.com=
> wrote:
>
> This was merged in mickledore recently, but isn't the same needed for mas=
ter branch where it was rejected with alternative fix proposed by RP?
>
> On Thu, Jun 29, 2023 at 11:12=E2=80=AFAM Changqing Li <changqing.li@eng.w=
indriver.com> wrote:
>>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
>> install README.logs under systemd doc dir.
>>
>> But for OE, systemd doc dir is splited into package systemd-doc, when it
>> is not installed on the target, there will be an dead link:
>> Eg:
>> root@intel-x86-64:/var/log# ls -l README
>> lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/sys=
temd/README.logs
>> root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.log=
s
>> ls: cannot access '../../usr/share/doc/systemd/README.logs': No such fil=
e or directory
>>
>> Meantime, relative path for a symlink also will meet issue like
>> "No such file or directory"
>>
>> So remove this symlink from package systemd, and create legacy-doc.conf,
>> only create the symlink when systemd-doc is installed.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>  ...on-t-create-symlink-README-in-this-f.patch | 42 +++++++++++++++++++
>>  ....in-split-out-the-doc-related-config.patch | 41 ++++++++++++++++++
>>  meta/recipes-core/systemd/systemd_253.1.bb    |  4 ++
>>  3 files changed, 87 insertions(+)
>>  create mode 100644 meta/recipes-core/systemd/systemd/0001-legacy.conf.i=
n-Don-t-create-symlink-README-in-this-f.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/0002-legacy-doc.co=
nf.in-split-out-the-doc-related-config.patch
>>
>> diff --git a/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t=
-create-symlink-README-in-this-f.patch b/meta/recipes-core/systemd/systemd/=
0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch
>> new file mode 100644
>> index 0000000000..a2644bba8e
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create=
-symlink-README-in-this-f.patch
>> @@ -0,0 +1,42 @@
>> +From b17826490c1db2051dda23550ebdcd7f10e23479 Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Wed, 28 Jun 2023 13:49:41 +0800
>> +Subject: [PATCH 1/2] legacy.conf.in: Don't create symlink README in thi=
s file
>> +
>> +Commit 6fe23ff31c0 changed README to an symlink to README.logs, and
>> +install README.logs under systemd doc dir.
>> +
>> +But for OE, systemd doc dir is splited into package systemd-doc, when i=
t
>> +is not installed on the target, there will be an dead link:
>> +Eg:
>> +root@intel-x86-64:/var/log# ls -l README
>> +lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/sy=
stemd/README.logs
>> +root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.lo=
gs
>> +ls: cannot access '../../usr/share/doc/systemd/README.logs': No such fi=
le or directory
>> +
>> +So remove this symlink from package systemd
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + tmpfiles.d/legacy.conf.in | 3 ---
>> + 1 file changed, 3 deletions(-)
>> +
>> +diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
>> +index 4f2c0d7c43..62e2ae0986 100644
>> +--- a/tmpfiles.d/legacy.conf.in
>> ++++ b/tmpfiles.d/legacy.conf.in
>> +@@ -12,9 +12,6 @@
>> +
>> + d /run/lock 0755 root root -
>> + L /var/lock - - - - ../run/lock
>> +-{% if CREATE_LOG_DIRS %}
>> +-L /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
>> +-{% endif %}
>> +
>> + # /run/lock/subsys is used for serializing SysV service execution, and
>> + # hence without use on SysV-less systems.
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0002-legacy-doc.conf.in-s=
plit-out-the-doc-related-config.patch b/meta/recipes-core/systemd/systemd/0=
002-legacy-doc.conf.in-split-out-the-doc-related-config.patch
>> new file mode 100644
>> index 0000000000..47af64f12f
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0002-legacy-doc.conf.in-split-ou=
t-the-doc-related-config.patch
>> @@ -0,0 +1,41 @@
>> +From 865974a2f268ae6b4dab4f37ba39d86e6600180d Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Wed, 28 Jun 2023 16:00:13 +0800
>> +Subject: [PATCH 2/2] legacy-doc.conf.in: split out the doc related conf=
ig
>> +
>> +split out the doc related config, only install this when
>> +package systemd-doc is installed.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + tmpfiles.d/legacy-doc.conf.in | 3 +++
>> + tmpfiles.d/meson.build        | 1 +
>> + 2 files changed, 4 insertions(+)
>> + create mode 100644 tmpfiles.d/legacy-doc.conf.in
>> +
>> +diff --git a/tmpfiles.d/legacy-doc.conf.in b/tmpfiles.d/legacy-doc.conf=
.in
>> +new file mode 100644
>> +index 0000000000..9b1cef5a18
>> +--- /dev/null
>> ++++ b/tmpfiles.d/legacy-doc.conf.in
>> +@@ -0,0 +1,3 @@
>> ++{% if CREATE_LOG_DIRS %}
>> ++L /var/log/README - - - - {{DOC_DIR}}/README.logs
>> ++{% endif %}
>> +diff --git a/tmpfiles.d/meson.build b/tmpfiles.d/meson.build
>> +index 4d94e3743f..f78bddf136 100644
>> +--- a/tmpfiles.d/meson.build
>> ++++ b/tmpfiles.d/meson.build
>> +@@ -31,6 +31,7 @@ endforeach
>> +
>> + in_files =3D [['etc.conf',                      ''],
>> +             ['legacy.conf',                   'HAVE_SYSV_COMPAT'],
>> ++            ['legacy-doc.conf',               'HAVE_SYSV_COMPAT'],
>> +             ['static-nodes-permissions.conf', ''],
>> +             ['systemd.conf',                  ''],
>> +             ['var.conf',                      ''],
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd_253.1.bb b/meta/recipes-c=
ore/systemd/systemd_253.1.bb
>> index f306765168..85d6efb69c 100644
>> --- a/meta/recipes-core/systemd/systemd_253.1.bb
>> +++ b/meta/recipes-core/systemd/systemd_253.1.bb
>> @@ -25,6 +25,8 @@ SRC_URI +=3D " \
>>             file://0002-binfmt-Don-t-install-dependency-links-at-install=
-tim.patch \
>>             file://0008-implment-systemd-sysv-install-for-OE.patch \
>>             file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d=
-to-.patch \
>> +           file://0001-legacy.conf.in-Don-t-create-symlink-README-in-th=
is-f.patch \
>> +           file://0002-legacy-doc.conf.in-split-out-the-doc-related-con=
fig.patch \
>>             "
>>
>>  # patches needed by musl
>> @@ -754,6 +756,8 @@ FILES:udev +=3D "${base_sbindir}/udevd \
>>  FILES:udev-hwdb =3D "${rootlibexecdir}/udev/hwdb.d \
>>                     "
>>
>> +FILES:${PN}-doc +=3D "${exec_prefix}/lib/tmpfiles.d/legacy-doc.conf"
>> +
>>  RCONFLICTS:${PN} =3D "tiny-init ${@bb.utils.contains('PACKAGECONFIG', '=
resolved', 'resolvconf', '', d)}"
>>
>>  INITSCRIPT_PACKAGES =3D "udev"
>> --
>> 2.25.1
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183904): https://lists.openembedded.org/g/openembedde=
d-core/message/183904
> Mute This Topic: https://lists.openembedded.org/mt/99847505/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


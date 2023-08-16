Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE44C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 17:50:50 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.167372.1692208241204639534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 10:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=q0f6QxDZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so8931835a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 10:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692208239; x=1692813039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIJei83Jt4SXC8beX54U9kQQ2T0eYMNrHCWbBmjhW4M=;
        b=q0f6QxDZiOTgl+c53iLhO8a451fgt5XfxWgqrCZppEVBB3uB178jaytVloD/niiMgT
         IKOirDbiDgWp6lqJGlr2cg49UmpLlhTN8ewEdHxO9/ZMIAg12ecxUiZVJUuORDWZEnGt
         IeqnAZSC2dpd+0tLdSIdZGINA4U8MwBW3ujNnUJE0c/Xf9Qga7s7rPBWHkfXkqwwJFKB
         BhzMLiW+cWIFY2rBdgvlA9I05YT4bAGWFY4mL55xHw2m7r6+/T9QuzovsQzQZ6Z5KqZI
         uZNBUtDEPurQXzdMAsCxb8fMoB49jt7KlUItuLPgVfcguij9TeACtIO55EkW4sfptcUj
         e/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692208239; x=1692813039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIJei83Jt4SXC8beX54U9kQQ2T0eYMNrHCWbBmjhW4M=;
        b=CgFO7H0eVrhTeruia3EiuvmL+YWpW5DvzcekEiql5dFkZ1jzep1llLL42ztwwFYBy+
         onzjYzaGJLgjPTb9k/smSJYHaY9T9Ua0o29YcmYFPYo71t8L2Di+ZNW14CHei9yGYxQH
         7KGBwNdZuKEV357SaqDD5wii876xGMT+/yKergTuje7JbzpCQTyJ39wkmyYj8OQd5QQZ
         vR2DDChCOvN27o/L92YrAi5MbYhefLfv8c9cLTiz0u1ewReNFon1BnKgE24tEZoZJxGO
         ExBzoPZ8iO3fruW+tLubwFpJtJ+1yqbRHmOJRR9i4xNGRkwPVCkgq9T8AtXOFJdllssR
         58aw==
X-Gm-Message-State: AOJu0YwsDYjAg5VBOMyiqpEYd+7HCF1iOmhTRNeO0ww2ES77SeJxwZ/H
	8F3t70njBGqMVbgIzpqOB5tBCexfwmDetbgeLhO6sA==
X-Google-Smtp-Source: AGHT+IEDW8uImjPrqATBWYWZiV4Zlxh1rQmrIKuE/yHTLBHoXQqFgX2jCB0sdHrXe/TxHuF9W/JOUBoIQ61TxoeY4q8=
X-Received: by 2002:a17:906:8a6c:b0:99b:d178:f051 with SMTP id
 hy12-20020a1709068a6c00b0099bd178f051mr2110965ejc.64.1692208239514; Wed, 16
 Aug 2023 10:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <177B9B269D618F2D.8497@lists.openembedded.org>
In-Reply-To: <177B9B269D618F2D.8497@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 16 Aug 2023 07:50:28 -1000
Message-ID: <CAOSpxdbAToPehX6e5wdwG-MH8+8VdU0bMUU86C3Vi_sVNzdMcA@mail.gmail.com>
Subject: Re: [OE-core][mickledore 00/18] Patch review
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 17:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186136

On Tue, Aug 15, 2023 at 6:24=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> Please review this set of changes for mickledore and have comments back b=
y
> end of day Thursday, August 17.
>
> Passed a-full on autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5739
>
> The following changes since commit 6bd6b7110ea2029fc736a40760536adfaf28ee=
c0:
>
>   target/ssh: Ensure exit code set for commands (2023-08-09 16:17:50 -100=
0)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/mickledor=
e-nut
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
mickledore-nut
>
> Alexander Kanavin (3):
>   glibc-locale: use stricter matching for metapackages' runtime
>     dependencies
>   devtool/upgrade: raise an error if extracting source produces more
>     than one directory
>   curl: ensure all ptest failures are caught
>
> Andrej Valek (1):
>   maintainers.inc: Modify email address
>
> BELOUARGA Mohamed (1):
>   linux-firmware : Add firmware of RTL8822 serie
>
> Bruce Ashfield (2):
>   linux-yocto/6.1: update to v6.1.41
>   linux-yocto/6.1: update to v6.1.43

I'm seeing intermittent failures with these 6.1 "stable" version bumps
(issues are also seen in master).

So I am dropping these for now till we can fix the problem.

I reran a-full without the version bumps and all tests passed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5742

Steve

> Dmitry Baryshkov (1):
>   linux-firmware: split platform-specific Adreno shaders to separate
>     packages
>
> Joel Stanley (1):
>   kernel: don't fail if Modules.symvers doesn't exist
>
> Marek Vasut (1):
>   linux-firmware: Fix mediatek mt7601u firmware path
>
> Mark Hatle (1):
>   tcf-agent: Update to 1.8.0 release
>
> Richard Purdie (1):
>   oeqa/ssh: Further improve process exit handling
>
> Ross Burton (1):
>   openssh: upgrade to 9.3p2
>
> Sudip Mukherjee (1):
>   bind: upgrade to v9.18.17
>
> Yogita Urade (3):
>   qemu: fix CVE-2023-3301
>   qemu: fix CVE-2023-3255
>   qemu: fix CVE-2023-2861
>
> sanjana (1):
>   binutils: stable 2.40 branch updates
>
>  meta/classes-recipe/kernel.bbclass            |   4 +-
>  meta/conf/distro/include/maintainers.inc      |   2 +-
>  meta/lib/oeqa/core/target/ssh.py              |   5 +-
>  ...1-avoid-start-failure-with-bind-user.patch |   0
>  ...d-V-and-start-log-hide-build-options.patch |   0
>  ...ching-for-json-headers-searches-sysr.patch |   0
>  .../bind/{bind-9.18.16 =3D> bind}/bind9         |   0
>  .../bind/{bind-9.18.16 =3D> bind}/conf.patch    |   0
>  .../generate-rndc-key.sh                      |   0
>  ...t.d-add-support-for-read-only-rootfs.patch |   0
>  .../make-etc-initd-bind-stop-work.patch       |   0
>  .../bind/{bind-9.18.16 =3D> bind}/named.service |   0
>  .../bind/{bind_9.18.16.bb =3D> bind_9.18.17.bb} |   4 +-
>  .../{openssh_9.3p1.bb =3D> openssh_9.3p2.bb}    |   2 +-
>  meta/recipes-core/glibc/glibc-locale.inc      |   8 +-
>  .../binutils/binutils-2.40.inc                |   2 +-
>  meta/recipes-devtools/qemu/qemu.inc           |   3 +
>  .../qemu/qemu/CVE-2023-2861.patch             | 171 ++++++++++++++++++
>  .../qemu/qemu/CVE-2023-3255.patch             |  65 +++++++
>  .../qemu/qemu/CVE-2023-3301.patch             |  65 +++++++
>  .../tcf-agent/tcf-agent_git.bb                |   4 +-
>  .../linux-firmware/linux-firmware_20230625.bb |  28 ++-
>  .../linux/linux-yocto-rt_6.1.bb               |   6 +-
>  .../linux/linux-yocto-tiny_6.1.bb             |   6 +-
>  meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  28 +--
>  meta/recipes-support/curl/curl/disable-tests  |   2 +
>  meta/recipes-support/curl/curl/run-ptest      |   2 +-
>  scripts/lib/devtool/upgrade.py                |   2 +
>  28 files changed, 366 insertions(+), 43 deletions(-)
>  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/0001-avoi=
d-start-failure-with-bind-user.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/0001-name=
d-lwresd-V-and-start-log-hide-build-options.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/bind-ensu=
re-searching-for-json-headers-searches-sysr.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/bind9 (10=
0%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/conf.patc=
h (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/generate-=
rndc-key.sh (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/init.d-ad=
d-support-for-read-only-rootfs.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/make-etc-=
initd-bind-stop-work.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.16 =3D> bind}/named.ser=
vice (100%)
>  rename meta/recipes-connectivity/bind/{bind_9.18.16.bb =3D> bind_9.18.17=
.bb} (96%)
>  rename meta/recipes-connectivity/openssh/{openssh_9.3p1.bb =3D> openssh_=
9.3p2.bb} (98%)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186079): https://lists.openembedded.org/g/openembedde=
d-core/message/186079
> Mute This Topic: https://lists.openembedded.org/mt/100761429/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


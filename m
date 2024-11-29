Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2C0D6EC00
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 10:57:14 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.113888.1732877832974646084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 02:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h1zGlTz6;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d43134d574so10178296d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 02:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732877832; x=1733482632; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKGIGTWErVOU2eMy4opfJmuymZnGdm5kQPgfta0LYCk=;
        b=h1zGlTz6BKr1QTIBdzSSI1fttisf6kZjcAowQUgmEj3yZlddy9ya98eh4HxZP7RAXl
         7YX9HVYszrh6AoOIP9YeyBq1pSNQ7nLx8/1HiLRpjtakUsiSh95UK9wXlUQvuFVctIN0
         7EBvZvzxdUYuPtEK1hw2BEoS/r52DYPPgtd/HIphv2PTLjRbZAK4e/lBscLf9XvANcSq
         mn5RJOVy2ph19Z2KoPUnKLEWQGhyb+9SaYnoa3m5L9wU/Yf7RpeYA5N3MZ/VwpqfU1D4
         urnIGaQ6VA8aJy3KUFcBP7LIFsSwqWu6X8cm/eJmf0ms5Tj6kXyIi3CETBp+pPrErviq
         eMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732877832; x=1733482632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKGIGTWErVOU2eMy4opfJmuymZnGdm5kQPgfta0LYCk=;
        b=bUWXIuEimxv5KNk6YWRxi3q1mBNcE7yYGTSclXQ26aGts2HKbZgqoPOUTXcG7HzOLT
         K85OFvC/uYRVigK1n5UmZvO2mua/hpsw8mZfptvnnfFlIBDOcS2YTTgPq2sRiSCnzbxv
         igt7WETrMnCC1FWBgu4LZhP6zwZPoPqQ4qV6Jxd0iniZeDblwu8Y4XfEjjo8xKgiY/eo
         uDgbINpQynvLmTR0WgLkp0Z/ELOr/LRiPGT2Hy9EYOlS+5TQyUgGTFehmcxbVuvvFQru
         v+K/RjY0kaiK7IdosYpj949+aA08qcT9nzA0PQLj53t8A4U0rAc/mzZxgDabza66rEo5
         upAg==
X-Gm-Message-State: AOJu0Yy0Tz4asY1leqAVjbeNBjdzcZGalG58xQsMNZQCTPrL5IIsoGd2
	rXqEspPqdUOB8jI705KFfWXKBwmpmNh1EN8cmoGBwJdJbFVxcMoJVRXmxBm0nBTHkfg8WkGBy95
	MQP0rxxvucSwhTZyE2gGzK1zhFqI=
X-Gm-Gg: ASbGnctQPT3AUlFNVxIwFCKZOoAaq7+qXBtgZM6/UFC7QTcgK3SuEN51ixYZmHA8nsb
	aJ2WRZFyfJp4kspFa3K5CWonet2nXzuegCwvAahQg2OeiF3zVIh9xVtKRJbaeuCw9xA==
X-Google-Smtp-Source: AGHT+IFh44CqqQKis7H2X8nfy0zAQjjhaq08BKuZS1CGtxTHOiphfJGQCsDGvtjMhM7XHdzcY02q2Z9kVj3V5/LBaNs=
X-Received: by 2002:ad4:5805:0:b0:6d8:81cd:a0d3 with SMTP id
 6a1803df08f44-6d881cda338mr36265266d6.43.1732877831951; Fri, 29 Nov 2024
 02:57:11 -0800 (PST)
MIME-Version: 1.0
References: <0101019341233958-bc9f112c-fcff-4f31-9543-aaf8d865ccfe-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019341233958-bc9f112c-fcff-4f31-9543-aaf8d865ccfe-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 Nov 2024 11:57:01 +0100
Message-ID: <CANNYZj8w-pNwEMw4QkX9YR6mqLLBQmd_O5fhq+0P8V0rk2MWEg@mail.gmail.com>
Subject: Re: [OE-core] [AUH] valgrind: upgrading to 3.24.0 FAILED
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 10:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208012

Hello Randy,

are you able to work on this upgrade? The rebase conflicts in
vg_regtest.in are significant and I don't quite understand how to
resolve them correctly.

Alex

On Mon, 18 Nov 2024 at 22:18, Auto Upgrade Helper via
lists.openembedded.org <auh=3Dyoctoproject.org@lists.openembedded.org>
wrote:
>
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *valgrind* to *3.24.0=
* has Failed (devtool error).
>
> Detailed error information:
>
> Running 'devtool upgrade' for recipe valgrind failed.
> NOTE: Reconnecting to bitbake server...
> Loading cache...done.
> Loaded 1880 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.9.1"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "5.1"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp
> workspace            =3D "tmp-auh-upgrades:d91c453382ace1e86d0f29f82f8d66=
e5dfc2e69a"
>
> Initialising tasks...NOTE: The /proc/pressure files can't be read. Contin=
uing build without monitoring pressure
> Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% ma=
tch, 100% complete)
> done.
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be r=
erun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 13 seconds
> Loading cache...done.
> Loaded 0 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 922 .bb files complete (0 cached, 922 parsed). 1881 targets, 4=
1 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.9.1"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "5.1"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp
> workspace            =3D "tmp-auh-upgrades:d91c453382ace1e86d0f29f82f8d66=
e5dfc2e69a"
>
> Initialising tasks...NOTE: The /proc/pressure files can't be read. Contin=
uing build without monitoring pressure
> Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, =
0% complete)
> done.
> NOTE: Executing Tasks
> WARNING: tmp-recipetool-x6d4ggx6: the directory /srv/pokybuild/yocto-work=
er/auh/build/build/tmp/work/recipetool-v2z_cd3c/emptysrc (/srv/pokybuild/yo=
cto-worker/auh/build/build/tmp/work/recipetool-v2z_cd3c/emptysrc) pointed t=
o by the S variable doesn't exist - please set S within the recipe to point=
 to where the source has been unpacked to
> NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun=
 and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 12 seconds
> DEBUG 5 [Errno 25] Inappropriate ioctl for device
> Adding changed files:   0% |                                   | ETA:  --=
:--:--
> Adding changed files:   0% |                                   | ETA:  --=
:--:--
> Adding changed files:  23% |########                            | ETA:  0=
:00:07
> Adding changed files:  47% |#################                   | ETA:  0=
:00:05
> Adding changed files:  71% |#########################           | ETA:  0=
:00:02
> Adding changed files:  95% |##################################  | ETA:  0=
:00:00
> Adding changed files: 100% |####################################| Time: 0=
:00:06
> INFO: Extracting current version source...
> INFO: Extracting upgraded version source...
> INFO: Fetching https://sourceware.org/pub/valgrind/valgrind-3.24.0.tar.bz=
2...
> INFO: Rebasing devtool onto cafaff76aa66d7f05d5e9be09f9a9edd39833b0e
> WARNING: Command 'git rebase cafaff76aa66d7f05d5e9be09f9a9edd39833b0e' fa=
iled:
> Auto-merging tests/vg_regtest.in
> CONFLICT (content): Merge conflict in tests/vg_regtest.in
>
> You will need to resolve conflicts in order to complete the upgrade.
> INFO: Using source tree as build directory since recipe inherits autotool=
s-brokensep
> INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/=
build/workspace/sources/valgrind
> INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace=
/recipes/valgrind/valgrind_3.24.0.bb
>
>
>
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207305): https://lists.openembedded.org/g/openembedde=
d-core/message/207305
> Mute This Topic: https://lists.openembedded.org/mt/109653242/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


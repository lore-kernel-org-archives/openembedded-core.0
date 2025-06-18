Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69898C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 16:00:14 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.2584.1750262406323067076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 09:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=czJLObf9;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.177, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70f147b5a52so52389487b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750262405; x=1750867205; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeTuPlUdPXs/QsP1kqcwITx1xSi7D4vk0ljSp+jtGRc=;
        b=czJLObf9hcdPoRtcWagxMylKO5VW+oTjL4McOe+fmyNg5ZMDZ/8G02Z3meFzLTXPaz
         UznpYDHhxZHYLPqZgQRNiY5glGwIrwZg20HPSTsJttFcNHne5SIG2FejQQjSSeoYUtrw
         qVxxHHahQ6pUFfnbsG+EkNYMIq+ViWOx/U4s0C50A7HZ3YT5vqYQQYlZJEHY0jFnjH11
         wL/+oFqM12kunDRN4BtDXm7eUYi4cRc+QxA337kJTljFu+MzM/65HJ2hdXmswmMzqLpA
         ciBWALTi2ymuZAYgl1qO08HtMnpH5CNOJeB7cGj++Rd+rVR06v5DYzdvCfgglX559cQV
         idGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750262405; x=1750867205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeTuPlUdPXs/QsP1kqcwITx1xSi7D4vk0ljSp+jtGRc=;
        b=PiID5Y7FLl6fClH379Mj9lqPk8BE3T5TpLdTRDZLy64+1gNZdXw8FYf3PCM8csrYZc
         vACUv3+/8QdKFum+nR01X633beNHqAppICDgRNlpfUAy91yQwtE27CNMOIOAxijCqhUZ
         OD4+Zo1/Bqj2bD9ow73+Ob0I/iIDnxiK16eElUJYiQd7H/fMij+i0I/iABPm7JAxzND5
         7DEQ6798UKGZwi36lQkiOFe2l/fgR3Y64yfPYgHGpxASDaNMvkKe9pgSEW3tBTG7Hiv8
         HfdcTRqpBVgH+Hmha1WubJX+4NRI2bpnxIfBaG4fA8nnHmso5ntabya80Zwt8r9B+Kq9
         5I+g==
X-Gm-Message-State: AOJu0YwCZrbg/dJ+2cAlsS/znN7qGZHS4WX3wub1c3Eev1G+pptpbT1T
	cKBgpQrkj0NtOozSkHLIy0KwWbXSgtfBlZMaMflc8uH8wA554o/Ee+dGUeUPCQmrvb9lbjWtgGA
	iwVCoD/xtJt4/D0vD+VfZi2vwBNdclOO2VmW2R/hQ1w==
X-Gm-Gg: ASbGncsqTOm2QHitETFJybCPTBLVkIDZR0jVIr/0eNRUaWx+Ig89/IDiGPx+SFjbc3v
	V892044+sPe9KCgwHjsj7vKnLsW1kPrD7F/tN7duMLJGh7kZz3GOUbCHYW4vb59UulWSIUikJEM
	e7uHYYUvZiUZPkflKaTSGhP9ITL8u4wBj9g8n8YLyOJ4Gkp+DrMIzpy2YprVuH+DJbJdtcQ40lL
	jA=
X-Google-Smtp-Source: AGHT+IFFZrf8bxY3nPsEGufdBiODcrVBkHLqOTf+45ARKKCSglwiYN7ntBQMxqcZXnOGOpjYsvmjhh8UspmQqZSkfCo=
X-Received: by 2002:a05:690c:3808:b0:70f:83ef:ddff with SMTP id
 00721157ae682-7117544368dmr273657277b3.30.1750262405232; Wed, 18 Jun 2025
 09:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250618030710.4051350-1-Qi.Chen@windriver.com>
In-Reply-To: <20250618030710.4051350-1-Qi.Chen@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 18 Jun 2025 08:59:53 -0700
X-Gm-Features: Ac12FXz7a0_nliAPvHbUhYPML5dJRbYEc_h1Qu5Gj4JoLjU5ptVcy0Cf3vtvzJI
Message-ID: <CAOSpxdYc3=+6N2iQugrJC=chmHvg-ShMMLsCfuCnSUmZ0qb8bg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] coreutils: fix CVE-2025-5278
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 16:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219023

On Tue, Jun 17, 2025 at 8:07=E2=80=AFPM Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Backport patch to fix CVE-2025-5278.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...1-sort-fix-buffer-under-read-CWE-127.patch | 112 ++++++++++++++++++

Could you please send a V2 using the standard convention of naming the
patch file with the CVE number?  (CVE-2025-5278.patch)

Thanks!

Steve

>  meta/recipes-core/coreutils/coreutils_9.4.bb  |   1 +
>  2 files changed, 113 insertions(+)
>  create mode 100644 meta/recipes-core/coreutils/coreutils/0001-sort-fix-b=
uffer-under-read-CWE-127.patch
>
> diff --git a/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-u=
nder-read-CWE-127.patch b/meta/recipes-core/coreutils/coreutils/0001-sort-f=
ix-buffer-under-read-CWE-127.patch
> new file mode 100644
> index 0000000000..41be1635b5
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-re=
ad-CWE-127.patch
> @@ -0,0 +1,112 @@
> +From 8763c305c29d0abb7e2be4695212b42917d054b2 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?P=3DC3=3DA1draig=3D20Brady?=3D <P@draigBrady.com>
> +Date: Tue, 20 May 2025 16:03:44 +0100
> +Subject: [PATCH] sort: fix buffer under-read (CWE-127)
> +
> +* src/sort.c (begfield): Check pointer adjustment
> +to avoid Out-of-range pointer offset (CWE-823).
> +(limfield): Likewise.
> +* tests/sort/sort-field-limit.sh: Add a new test,
> +which triggers with ASAN or Valgrind.
> +* tests/local.mk: Reference the new test.
> +* NEWS: Mention bug fix introduced in v7.2 (2009).
> +Fixes https://bugs.gnu.org/78507
> +
> +CVE: CVE-2025-5278
> +
> +Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreut=
ils.git/commit/?id=3D8c9602e3a145e9596dc1a63c6ed67865814b6633]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/sort.c                     | 12 ++++++++++--
> + tests/local.mk                 |  1 +
> + tests/sort/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
> + 3 files changed, 46 insertions(+), 2 deletions(-)
> + create mode 100755 tests/sort/sort-field-limit.sh
> +
> +diff --git a/src/sort.c b/src/sort.c
> +index b10183b6f..7af1a2512 100644
> +--- a/src/sort.c
> ++++ b/src/sort.c
> +@@ -1644,7 +1644,11 @@ begfield (struct line const *line, struct keyfiel=
d const *key)
> +       ++ptr;
> +
> +   /* Advance PTR by SCHAR (if possible), but no further than LIM.  */
> +-  ptr =3D MIN (lim, ptr + schar);
> ++  size_t remaining_bytes =3D lim - ptr;
> ++  if (schar < remaining_bytes)
> ++    ptr +=3D schar;
> ++  else
> ++    ptr =3D lim;
> +
> +   return ptr;
> + }
> +@@ -1746,7 +1750,11 @@ limfield (struct line const *line, struct keyfiel=
d const *key)
> +           ++ptr;
> +
> +       /* Advance PTR by ECHAR (if possible), but no further than LIM.  =
*/
> +-      ptr =3D MIN (lim, ptr + echar);
> ++      size_t remaining_bytes =3D lim - ptr;
> ++      if (echar < remaining_bytes)
> ++        ptr +=3D echar;
> ++      else
> ++        ptr =3D lim;
> +     }
> +
> +   return ptr;
> +diff --git a/tests/local.mk b/tests/local.mk
> +index 4da6756ac..642d225fa 100644
> +--- a/tests/local.mk
> ++++ b/tests/local.mk
> +@@ -388,6 +388,7 @@ all_tests =3D                                       =
 \
> +   tests/sort/sort-debug-keys.sh                       \
> +   tests/sort/sort-debug-warn.sh                       \
> +   tests/sort/sort-discrim.sh                  \
> ++  tests/sort/sort-field-limit.sh              \
> +   tests/sort/sort-files0-from.pl              \
> +   tests/sort/sort-float.sh                    \
> +   tests/sort/sort-h-thousands-sep.sh          \
> +diff --git a/tests/sort/sort-field-limit.sh b/tests/sort/sort-field-limi=
t.sh
> +new file mode 100755
> +index 000000000..52d8e1d17
> +--- /dev/null
> ++++ b/tests/sort/sort-field-limit.sh
> +@@ -0,0 +1,35 @@
> ++#!/bin/sh
> ++# From 7.2-9.7, this would trigger an out of bounds mem read
> ++
> ++# Copyright (C) 2025 Free Software Foundation, Inc.
> ++
> ++# This program is free software: you can redistribute it and/or modify
> ++# it under the terms of the GNU General Public License as published by
> ++# the Free Software Foundation, either version 3 of the License, or
> ++# (at your option) any later version.
> ++
> ++# This program is distributed in the hope that it will be useful,
> ++# but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++# GNU General Public License for more details.
> ++
> ++# You should have received a copy of the GNU General Public License
> ++# along with this program.  If not, see <https://www.gnu.org/licenses/>=
.
> ++
> ++. "${srcdir=3D.}/tests/init.sh"; path_prepend_ ./src
> ++print_ver_ sort
> ++getlimits_
> ++
> ++# This issue triggers with valgrind or ASAN
> ++valgrind --error-exitcode=3D1 sort --version 2>/dev/null &&
> ++  VALGRIND=3D'valgrind --error-exitcode=3D1'
> ++
> ++{ printf '%s\n' aa bb; } > in || framework_failure_
> ++
> ++_POSIX2_VERSION=3D200809 $VALGRIND sort +0.${SIZE_MAX}R in > out || fai=
l=3D1
> ++compare in out || fail=3D1
> ++
> ++_POSIX2_VERSION=3D200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out || =
fail=3D1
> ++compare in out || fail=3D1
> ++
> ++Exit $fail
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-=
core/coreutils/coreutils_9.4.bb
> index 62ecdea6ec..ce35240d44 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.4.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>             file://0001-local.mk-fix-cross-compiling-problem.patch \
>             file://0001-posixtm-pacify-clang-18.patch \
>             file://CVE-2024-0684.patch \
> +           file://0001-sort-fix-buffer-under-read-CWE-127.patch \
>             file://run-ptest \
>             "
>  SRC_URI[sha256sum] =3D "ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6=
e5c07e040b275e52"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218968): https://lists.openembedded.org/g/openembedde=
d-core/message/218968
> Mute This Topic: https://lists.openembedded.org/mt/113702781/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


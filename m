Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90D1C83030
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 20:14:04 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.14.1751573643139830692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 13:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qIBc8vcz;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.173, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-712be7e034cso1932587b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 13:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751573642; x=1752178442; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQ/Tana5kXdtvFZHultbCYhmnT+gdsZXlkpVYzqApiI=;
        b=qIBc8vczElDjjsHB+7yRon0XsmW2E6bcIwq9Rd7OC31ZbR0LEdwArlNCuGWMX2MuTm
         xAICJ63yViktF1SoVDikd2MMhWSh2WKyQfhi6nLQmkci84f8FkdXUc9F9Nfah/IHkGwk
         Kf4glmpT2t1Qm4z81qj4/OxLuiXopAmJl3yQmzhwXJSsm8yFDJEl8jX1O+G7tpqOAWXZ
         /8ZckoF+8Gd8wpSnGZHW8AsTMwFm8vWCDYTk9m3F5K2KlVOjjSiyCJraotsEHN2eEbwi
         t6mVD+MHRk9bD6tjPnh9T/KoJ7TvXFM0SDvahrrTSppA/waHWSz8jUCrR6p340N2J28X
         sigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751573642; x=1752178442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQ/Tana5kXdtvFZHultbCYhmnT+gdsZXlkpVYzqApiI=;
        b=al2oLl5TsNKUoyvj+HlL75KsErNqfFQrWqFfZqGmcjFzslzIDWL+lNGFFhrLMEOzFJ
         j2e3pCtYoVDAcnAsyJZF5wfQlb9iWbdeP3eEWqUcf1MyBdVyjy+KSyYuNje78sLa2eKG
         KesL3Xdgyjs1GYx3HvuaspOrc63ZRpiyHoXVFDg7LpVHe+0Xt3Idb9Tgx8q+yv/EGsYu
         KSjbK8PPz5S9M6jCachUC8bBPw9fp0yUh1M89wO4ZMPUgR5zo2HV7GAkhI7NNEeAzl66
         w729ouVw66sNU/hLFBEKbsZsUOWCAYLpwGyqFGgUj2Ocn7Qte6HDppdkNhE0ZNNdRrGv
         Ao1A==
X-Gm-Message-State: AOJu0YwCjOvChJWRQJ3RYBvrH7ZosZyvdnTlPMnne612AktgpRHUpcSq
	lXqDd6gh12uK+JZ4FFa7lcGOrSbxnAtVgEvM9fp/pYEk3wycLq26O9UvwiPq8RLBWhXgC39X0rD
	N4FcLS8/kMm3s6mIIMAKm2lgyXOhbpQ6wTWX8eSACKH+PI2spjoRPans=
X-Gm-Gg: ASbGncsPcbNNrecbuIee3Wfja2pRm7YgxHenbE9muWH1ZZyaZqFEbusIk63VbGInlpJ
	RCgTXbFmLe2TJzv7Ko8N7eMWjwl3+N7q5EzVZZob2ywof9p6RAFw1Rs+aoNA/w70A3KnivkgSCM
	D1Y3QV8jbejBKklIA96ZI++uc1YWAcot5AbglOmXsixZSwODl6AApXOZ5FsS4dMM9xYUOnnpHYx
	+M=
X-Google-Smtp-Source: AGHT+IE+IxevkNsLG81cIj5V3jwejCMiDbWRRfuhBlboefiWqpy+HEFc/pGy9PX7BA2P3iYvAoTZqwhlQy7ert3nlZ8=
X-Received: by 2002:a05:690c:6b84:b0:710:ead5:8a95 with SMTP id
 00721157ae682-71658ffeb41mr75686207b3.14.1751573641884; Thu, 03 Jul 2025
 13:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250701041625.1956085-1-Qi.Chen@windriver.com>
In-Reply-To: <20250701041625.1956085-1-Qi.Chen@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 3 Jul 2025 13:13:51 -0700
X-Gm-Features: Ac12FXxXkU1tfi2ocqaw39Wh9gjbgJKsmPfzFakU8UvF_4nelDJQt5T0G10K4aU
Message-ID: <CAOSpxdbKMCSAywKgsTm04Kk_FRThJCZNLo20ojhABheVizeKHw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH V2] coreutils: fix CVE-2025-5278
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 20:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219893

Unfortunately this patch results in a failed ptest:

AssertionError: Failed ptests:
{'coreutils': ['tests/misc/sort-field-limit.sh']}

Steve

On Mon, Jun 30, 2025 at 9:16=E2=80=AFPM Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Backport patch to fix CVE-2025-5278.
> The patch is adjusted to fit 9.0 version.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../coreutils/coreutils/CVE-2025-5278.patch   | 113 ++++++++++++++++++
>  meta/recipes-core/coreutils/coreutils_9.0.bb  |   1 +
>  2 files changed, 114 insertions(+)
>  create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-5278.p=
atch
>
> diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch b/=
meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
> new file mode 100644
> index 0000000000..34434a65fa
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
> @@ -0,0 +1,113 @@
> +From 84a061ea3d1fad42188493c4e5d8396aff4a0f67 Mon Sep 17 00:00:00 2001
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
> +[Adjusted for 9.0 version]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/sort.c                     | 12 ++++++++++--
> + tests/local.mk                 |  1 +
> + tests/misc/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
> + 3 files changed, 46 insertions(+), 2 deletions(-)
> + create mode 100755 tests/misc/sort-field-limit.sh
> +
> +diff --git a/src/sort.c b/src/sort.c
> +index 5f4c817de..07b96d34b 100644
> +--- a/src/sort.c
> ++++ b/src/sort.c
> +@@ -1642,7 +1642,11 @@ begfield (struct line const *line, struct keyfiel=
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
> +@@ -1743,7 +1747,11 @@ limfield (struct line const *line, struct keyfiel=
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
> +index 228d0e368..ced85c44c 100644
> +--- a/tests/local.mk
> ++++ b/tests/local.mk
> +@@ -373,6 +373,7 @@ all_tests =3D                                       =
 \
> +   tests/misc/sort-debug-keys.sh                       \
> +   tests/misc/sort-debug-warn.sh                       \
> +   tests/misc/sort-discrim.sh                  \
> ++  tests/misc/sort-field-limit.sh              \
> +   tests/misc/sort-files0-from.pl              \
> +   tests/misc/sort-float.sh                    \
> +   tests/misc/sort-h-thousands-sep.sh          \
> +diff --git a/tests/misc/sort-field-limit.sh b/tests/misc/sort-field-limi=
t.sh
> +new file mode 100755
> +index 000000000..52d8e1d17
> +--- /dev/null
> ++++ b/tests/misc/sort-field-limit.sh
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
> diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-=
core/coreutils/coreutils_9.0.bb
> index 1cce9192ec..7c975708f4 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.0.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
> @@ -19,6 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>             file://0001-uname-report-processor-and-hardware-correctly.pat=
ch \
>             file://0001-local.mk-fix-cross-compiling-problem.patch \
>             file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
> +           file://CVE-2025-5278.patch \
>             file://run-ptest \
>             file://0001-split-do-not-shrink-hold-buffer.patch \
>             "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219544): https://lists.openembedded.org/g/openembedde=
d-core/message/219544
> Mute This Topic: https://lists.openembedded.org/mt/113922209/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6443C71130
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 20:27:38 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.2516.1751920048646491801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 13:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=toFgI7wu;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.182, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e4043c5b7so30788187b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 13:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751920048; x=1752524848; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/RZoridx/0yA8L+xOZKRFwFkQ1VM8qCZoIFNZKhgW4=;
        b=toFgI7wusaEaCMq9qPOdjSwKN8Apl1OvC9GGifcBEi9cvOgcN9oqFavLFKNJixJoHH
         KqO84lpywn+/c1oR8tAhhXFXW37IlxJaYlH3D3vohmq5bPHC4Hhbv15oCvZp8uqjPUin
         wvl+BrMlq9qZgVbVLK6Cm6muqgDlqTWy+QUkhEvDsR53VwQ3EzfrNZrrbM4Gf7MHV0C/
         ZN8zJFNazx6g3HNR5E6fgDFwAV3jx+wa/tuIAxBnFxKCVSLxTG2eWGI9TeODZIJa2BQX
         DuiWqJDcQAbaz59D3PlSlQ2+9JIpVHQA6SlZuoUrfeU+HXpMSGl3yCAfAL9qUbEV/9a9
         hekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751920048; x=1752524848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/RZoridx/0yA8L+xOZKRFwFkQ1VM8qCZoIFNZKhgW4=;
        b=IgxW+awLmlAbOMI8L9TjQ7HiFzzy9o+X1E4zTBS1X1ftobOpQyda3tbyZrbBFy8xPJ
         fz4h+swwynzDKQSWGongsCwVLooZ3Ho7UTMCOT67az/aWrsfynvpRSnUDnks9EipM9GH
         NVvvy6yqVVU9p7RdM9nfu9AxqXdroAiMeiIdVwn6tp5CV43gvIpbC16kI2ONEm+exxip
         n6A01GeHfaCYrxjKhyeZlCtlY5PDM//YAu5VNUDMaO5+eouNkiApG0rh3xsYKYq8TQX8
         8TJnOx8E3IhZgcW+GmxmhcUABMAwmPYUHag0ffyM4JO597FntDvJG1XEkCmVhBKjfzYR
         pE6w==
X-Gm-Message-State: AOJu0Yx8tRdFARk3j6/8ypstkEa90Pvk9LyelASue/w+ji+5Ur8D6ElO
	haozITybYCEe9dlUXlDzYY8YbLC7IoAVqCjYlJjz5so1Zqd0kJvwlb90sMLQ0gCDds45lNt7zLI
	O0Lce/1kEagpMT/KN2XifLeHyOTWd9kNKIPFSMLBGY9a7qK2yY4feDyc=
X-Gm-Gg: ASbGncvKb0NEbH4iniTghh4fWgvvU1A7AB4fCBDdxet9te2u7hI5EOfxhiRyxBGIKEi
	l6D+DeqDMSi0taBxO+1jLDJbIZ0IauqtF7qwhLBU1F3T9c44GaBIXT/3IwJH5bbj5zdd689J+FK
	H/+NCMDhTVrXFF23o3nvD1q784VMhOMOobuPQwehcuoEDOiULg3H168wzaPWDA2Zq83qzqp4YN6
	4E=
X-Google-Smtp-Source: AGHT+IHKYGd67z3XDa4zR1f05+s0Bo4Za0CyD4RliTqFsOz34sCehSHEehqkQ5UIYZNEqzeiqmVh1H3tpbQH+sNaKew=
X-Received: by 2002:a05:690c:6483:b0:70d:f15d:b18f with SMTP id
 00721157ae682-7166b7ed72bmr174065397b3.26.1751920047676; Mon, 07 Jul 2025
 13:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250701041625.1956085-1-Qi.Chen@windriver.com>
 <CAOSpxdbKMCSAywKgsTm04Kk_FRThJCZNLo20ojhABheVizeKHw@mail.gmail.com>
 <8a2f75f8-d38a-47b0-b038-927e2f47df8b@windriver.com> <5b56a9da-502e-4f65-8285-4e39991b2762@windriver.com>
In-Reply-To: <5b56a9da-502e-4f65-8285-4e39991b2762@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 7 Jul 2025 13:27:16 -0700
X-Gm-Features: Ac12FXyWgHeiAkOn0Lnp_uagYPCje3GDWB0krjZzz1K84N3WVAxVCzRBaufdcf8
Message-ID: <CAOSpxdYQdKU1VCy3w+U_tdJo23y8jkkoLKYS_BeusMjN3GA2dA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH V2] coreutils: fix CVE-2025-5278
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 20:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219997

On Sun, Jul 6, 2025 at 7:03=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> wrote=
:
>
> I could not reproduce this issue. I tried qemux86-64, qemuarm and qemuarm=
64.
> Could you please help check how to reproduce this issue?

I put the patch back into my test queue, let's see what happens:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1969

Steve


> On 7/4/25 11:12, Chen Qi via lists.openembedded.org wrote:
> > On 7/4/25 04:13, Steve Sakoman wrote:
> >> Unfortunately this patch results in a failed ptest:
> >>
> >> AssertionError: Failed ptests:
> >> {'coreutils': ['tests/misc/sort-field-limit.sh']}
> >>
> >> Steve
> >
> > Interesting. I did run ptest before I sent out patch.
> >
> > Let me check what's going on here.
> >
> > Regards,
> > Qi
> >
> >>
> >> On Mon, Jun 30, 2025 at 9:16=E2=80=AFPM Chen Qi via lists.openembedded=
.org
> >> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
> >>> From: Chen Qi <Qi.Chen@windriver.com>
> >>>
> >>> Backport patch to fix CVE-2025-5278.
> >>> The patch is adjusted to fit 9.0 version.
> >>>
> >>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>> ---
> >>>   .../coreutils/coreutils/CVE-2025-5278.patch   | 113
> >>> ++++++++++++++++++
> >>>   meta/recipes-core/coreutils/coreutils_9.0.bb  |   1 +
> >>>   2 files changed, 114 insertions(+)
> >>>   create mode 100644
> >>> meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
> >>>
> >>> diff --git
> >>> a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
> >>> b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
> >>> new file mode 100644
> >>> index 0000000000..34434a65fa
> >>> --- /dev/null
> >>> +++ b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
> >>> @@ -0,0 +1,113 @@
> >>> +From 84a061ea3d1fad42188493c4e5d8396aff4a0f67 Mon Sep 17 00:00:00 20=
01
> >>> +From: =3D?UTF-8?q?P=3DC3=3DA1draig=3D20Brady?=3D <P@draigBrady.com>
> >>> +Date: Tue, 20 May 2025 16:03:44 +0100
> >>> +Subject: [PATCH] sort: fix buffer under-read (CWE-127)
> >>> +
> >>> +* src/sort.c (begfield): Check pointer adjustment
> >>> +to avoid Out-of-range pointer offset (CWE-823).
> >>> +(limfield): Likewise.
> >>> +* tests/sort/sort-field-limit.sh: Add a new test,
> >>> +which triggers with ASAN or Valgrind.
> >>> +* tests/local.mk: Reference the new test.
> >>> +* NEWS: Mention bug fix introduced in v7.2 (2009).
> >>> +Fixes https://bugs.gnu.org/78507
> >>> +
> >>> +CVE: CVE-2025-5278
> >>> +
> >>> +Upstream-Status: Backport
> >>> [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3D8c=
9602e3a145e9596dc1a63c6ed67865814b6633]
> >>> +[Adjusted for 9.0 version]
> >>> +
> >>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>> +---
> >>> + src/sort.c                     | 12 ++++++++++--
> >>> + tests/local.mk                 |  1 +
> >>> + tests/misc/sort-field-limit.sh | 35
> >>> ++++++++++++++++++++++++++++++++++
> >>> + 3 files changed, 46 insertions(+), 2 deletions(-)
> >>> + create mode 100755 tests/misc/sort-field-limit.sh
> >>> +
> >>> +diff --git a/src/sort.c b/src/sort.c
> >>> +index 5f4c817de..07b96d34b 100644
> >>> +--- a/src/sort.c
> >>> ++++ b/src/sort.c
> >>> +@@ -1642,7 +1642,11 @@ begfield (struct line const *line, struct
> >>> keyfield const *key)
> >>> +       ++ptr;
> >>> +
> >>> +   /* Advance PTR by SCHAR (if possible), but no further than LIM.  =
*/
> >>> +-  ptr =3D MIN (lim, ptr + schar);
> >>> ++  size_t remaining_bytes =3D lim - ptr;
> >>> ++  if (schar < remaining_bytes)
> >>> ++    ptr +=3D schar;
> >>> ++  else
> >>> ++    ptr =3D lim;
> >>> +
> >>> +   return ptr;
> >>> + }
> >>> +@@ -1743,7 +1747,11 @@ limfield (struct line const *line, struct
> >>> keyfield const *key)
> >>> +           ++ptr;
> >>> +
> >>> +       /* Advance PTR by ECHAR (if possible), but no further than
> >>> LIM.  */
> >>> +-      ptr =3D MIN (lim, ptr + echar);
> >>> ++      size_t remaining_bytes =3D lim - ptr;
> >>> ++      if (echar < remaining_bytes)
> >>> ++        ptr +=3D echar;
> >>> ++      else
> >>> ++        ptr =3D lim;
> >>> +     }
> >>> +
> >>> +   return ptr;
> >>> +diff --git a/tests/local.mk b/tests/local.mk
> >>> +index 228d0e368..ced85c44c 100644
> >>> +--- a/tests/local.mk
> >>> ++++ b/tests/local.mk
> >>> +@@ -373,6 +373,7 @@ all_tests
> >>> =3D                                        \
> >>> +   tests/misc/sort-debug-keys.sh                       \
> >>> +   tests/misc/sort-debug-warn.sh                       \
> >>> +   tests/misc/sort-discrim.sh                  \
> >>> ++  tests/misc/sort-field-limit.sh              \
> >>> +   tests/misc/sort-files0-from.pl              \
> >>> +   tests/misc/sort-float.sh                    \
> >>> +   tests/misc/sort-h-thousands-sep.sh          \
> >>> +diff --git a/tests/misc/sort-field-limit.sh
> >>> b/tests/misc/sort-field-limit.sh
> >>> +new file mode 100755
> >>> +index 000000000..52d8e1d17
> >>> +--- /dev/null
> >>> ++++ b/tests/misc/sort-field-limit.sh
> >>> +@@ -0,0 +1,35 @@
> >>> ++#!/bin/sh
> >>> ++# From 7.2-9.7, this would trigger an out of bounds mem read
> >>> ++
> >>> ++# Copyright (C) 2025 Free Software Foundation, Inc.
> >>> ++
> >>> ++# This program is free software: you can redistribute it and/or
> >>> modify
> >>> ++# it under the terms of the GNU General Public License as
> >>> published by
> >>> ++# the Free Software Foundation, either version 3 of the License, or
> >>> ++# (at your option) any later version.
> >>> ++
> >>> ++# This program is distributed in the hope that it will be useful,
> >>> ++# but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>> ++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>> ++# GNU General Public License for more details.
> >>> ++
> >>> ++# You should have received a copy of the GNU General Public License
> >>> ++# along with this program.  If not, see
> >>> <https://www.gnu.org/licenses/>.
> >>> ++
> >>> ++. "${srcdir=3D.}/tests/init.sh"; path_prepend_ ./src
> >>> ++print_ver_ sort
> >>> ++getlimits_
> >>> ++
> >>> ++# This issue triggers with valgrind or ASAN
> >>> ++valgrind --error-exitcode=3D1 sort --version 2>/dev/null &&
> >>> ++  VALGRIND=3D'valgrind --error-exitcode=3D1'
> >>> ++
> >>> ++{ printf '%s\n' aa bb; } > in || framework_failure_
> >>> ++
> >>> ++_POSIX2_VERSION=3D200809 $VALGRIND sort +0.${SIZE_MAX}R in > out ||
> >>> fail=3D1
> >>> ++compare in out || fail=3D1
> >>> ++
> >>> ++_POSIX2_VERSION=3D200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out
> >>> || fail=3D1
> >>> ++compare in out || fail=3D1
> >>> ++
> >>> ++Exit $fail
> >>> +--
> >>> +2.34.1
> >>> +
> >>> diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb
> >>> b/meta/recipes-core/coreutils/coreutils_9.0.bb
> >>> index 1cce9192ec..7c975708f4 100644
> >>> --- a/meta/recipes-core/coreutils/coreutils_9.0.bb
> >>> +++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
> >>> @@ -19,6 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
> >>> file://0001-uname-report-processor-and-hardware-correctly.patch \
> >>> file://0001-local.mk-fix-cross-compiling-problem.patch \
> >>> file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
> >>> +           file://CVE-2025-5278.patch \
> >>>              file://run-ptest \
> >>>              file://0001-split-do-not-shrink-hold-buffer.patch \
> >>>              "
> >>> --
> >>> 2.34.1
> >>>
> >>>
> >>>
> >>>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#219896): https://lists.openembedded.org/g/openembed=
ded-core/message/219896
> > Mute This Topic: https://lists.openembedded.org/mt/113922209/7304865
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


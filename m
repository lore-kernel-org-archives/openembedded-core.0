Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA13C71130
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 20:50:49 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.3144.1751921444195512821
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 13:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ocp/Vbd2;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.172, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-711d4689084so35686697b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 13:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751921443; x=1752526243; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8eyCEI3ozm9QBrYOMm4/oUwxQFUtKjItGWxIvMyeGs=;
        b=Ocp/Vbd21VT0ooIo+iz27k/ZEfmlyB9YfIhd1qNLbQxWAwIxGcHazuExxZ3ZuSyFwj
         KHcvs90euZMqbEN2R3au1WXHYzeQZ2P3o9p6N1sgSMaXm+3cLrR7llWP0WkYA7XV0NPf
         uXqXNd1yeuuPqhrllfdrFcoLPFyf/P1bje1lGvpR152SPKLF4vaY2Vc7abq+EK1mGZRn
         1WHQ1fDS8GQ11FlLl4sx6rFOG9O4uxSpiZRtA1PvDWc6REfPhRi1OUuivtV+Mn/e++Rq
         LpVRZPkt2URbz2/dIb5kVfub0jkW3lzpJk8ZJpnPrFTdAHVNF75JaoA02xBrnV9NwRiX
         X+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751921443; x=1752526243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8eyCEI3ozm9QBrYOMm4/oUwxQFUtKjItGWxIvMyeGs=;
        b=FqlvxupEeaua+2GtDYiZ1aeFpqBc6PzZTRcMaloN+K+mP38fguM+H+IF1fvFHxY5tX
         I0BUI6smbB2QZOxhwllLbdZ7pobpRfF4Av3RAgi3keRFUGb/c0KRAk6NbGxFmVbKR1ge
         PaKFRCsGcpFUM1zpelxUkB1MX02om9mNcxJ3OqixL0+usMTm4QdyozmfrKpPKN54z5u2
         YyqnEJn4ntZX/mmD6BjdhFHdx6Z9q5cIMcGfz/xO3SkzPcQoF+shZ8MqU0X+nbAf2qSj
         2oHqP5xJIwB9sRqn8ST878OlOw4+6Okna94pBUHtk/vRDrk+vWr+ZqZ3fxSNhoW1RsRi
         jxgQ==
X-Gm-Message-State: AOJu0YzViI7lp4e0E7eCk9nn7Q2YoQcRf790MmCezGf6einVuKezfQ3x
	hIedzk5puBOLLfK85CM0uDemQiJsdNsugXm6qaMtya8xYVPySP4DK/fHk4vx8PGk4mkHhjIJG7G
	CNxvoT0UpG7NeXpqgw7h0YqPQni6wiizYYLPVWJrysrxt6yAtmwbFZE8=
X-Gm-Gg: ASbGncu5KKpu2NckRUh5slGWNx1Xcl3Sqw99WRBMz+dgfI44zsy55Cdwv+gpK/SN9dY
	WVQOWj0fZ3suS9nvRo0nB0Y7d7GmB1oKvEEJ5RFie2krpRouRfImdzZbo2v1U7BvFsmQDiJ4Mnr
	bYE50NjUxav2+SpF0Et8J7UDoZ8eTC9VMHgBI/jget0Mb9VnuNWZSwlT8AWXRKLmH1bE8nCP/et
	fc=
X-Google-Smtp-Source: AGHT+IHKvVzroWYUpDvRgB/mUfmOMX3t7pFATzZbitILrL/XhQddPRkcTH1dBZ9cpgLyU46ni4blgEoxLXhQFHjB0Jg=
X-Received: by 2002:a05:690c:6101:b0:6ef:652b:91cf with SMTP id
 00721157ae682-717a03a66d1mr2512767b3.27.1751921443189; Mon, 07 Jul 2025
 13:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250703101542.886225-1-divya.chellam@windriver.com>
In-Reply-To: <20250703101542.886225-1-divya.chellam@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 7 Jul 2025 13:50:32 -0700
X-Gm-Features: Ac12FXwxQ9eByRJ25JbXvHJlN8CZCjiz9IK0NqYvHNE3vPWC1ZZHDFI2wthxMDw
Message-ID: <CAOSpxdakYR896VaO-x+REQU_BsHpH779kAH-E_swCsFZd0SSFg@mail.gmail.com>
Subject: Re: [OE-core][walnascar][PATCH 1/4] libarchive: fix CVE-2025-5915
To: Divya.Chellam@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 20:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220000

Not quite sure what is going on, but this series fails to apply for me:

Applying: libarchive: fix CVE-2025-5915
error: sha1 information is lacking or useless
(meta/recipes-extended/libarchive/libarchive_3.7.9.bb).
error: could not build fake ancestor
Patch failed at 0001 libarchive: fix CVE-2025-5915
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Could you try rebasing your patchset on the current walnascar head and
submit a V2?

Thanks!

Steve

On Thu, Jul 3, 2025 at 3:16=E2=80=AFAM dchellam via lists.openembedded.org
<Divya.Chellam=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Divya Chellam <divya.chellam@windriver.com>
>
> A vulnerability has been identified in the libarchive library. This flaw =
can lead to a heap b
> uffer over-read due to the size of a filter block potentially exceeding t=
he Lempel-Ziv-Storer
> -Schieber (LZSS) window. This means the library may attempt to read beyon=
d the allocated memo
> ry buffer, which can result in unpredictable program behavior, crashes (d=
enial of service), o
> r the disclosure of sensitive information from adjacent memory regions.
>
> Reference:
> https://security-tracker.debian.org/tracker/CVE-2025-5915
>
> Upstream-patches:
> https://github.com/libarchive/libarchive/commit/a612bf62f86a6faa47bd57c52=
b94849f0a404d8c
>
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> ---
>  .../libarchive/libarchive/CVE-2025-5915.patch | 217 ++++++++++++++++++
>  .../libarchive/libarchive_3.7.9.bb            |   1 +
>  2 files changed, 218 insertions(+)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-=
5915.patch
>
> diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.pa=
tch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.patch
> new file mode 100644
> index 0000000000..3c911ce9d9
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.patch
> @@ -0,0 +1,217 @@
> +From a612bf62f86a6faa47bd57c52b94849f0a404d8c Mon Sep 17 00:00:00 2001
> +From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
> +Date: Sun, 11 May 2025 19:00:11 +0200
> +Subject: [PATCH] rar: Fix heap-buffer-overflow (#2599)
> +
> +A filter block size must not be larger than the lzss window, which is
> +defined
> +by dictionary size, which in turn can be derived from unpacked file
> +size.
> +
> +While at it, improve error messages and fix lzss window wrap around
> +logic.
> +
> +Fixes https://github.com/libarchive/libarchive/issues/2565
> +
> +---------
> +
> +Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
> +Co-authored-by: Tim Kientzle <kientzle@acm.org>
> +
> +CVE: CVE-2025-5915
> +
> +Upstream-Status: Backport [https://github.com/libarchive/libarchive/comm=
it/a612bf62f86a6faa47bd57c52b94849f0a404d8c]
> +
> +Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> +---
> + Makefile.am                                   |  2 +
> + libarchive/archive_read_support_format_rar.c  | 17 ++++---
> + libarchive/test/CMakeLists.txt                |  1 +
> + .../test/test_read_format_rar_overflow.c      | 48 +++++++++++++++++++
> + .../test/test_read_format_rar_overflow.rar.uu | 11 +++++
> + 5 files changed, 72 insertions(+), 7 deletions(-)
> + create mode 100644 libarchive/test/test_read_format_rar_overflow.c
> + create mode 100644 libarchive/test/test_read_format_rar_overflow.rar.uu
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 4fafc41..9f3a6d1 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -519,6 +519,7 @@ libarchive_test_SOURCES=3D \
> +       libarchive/test/test_read_format_rar_encryption_header.c \
> +       libarchive/test/test_read_format_rar_filter.c \
> +       libarchive/test/test_read_format_rar_invalid1.c \
> ++      libarchive/test/test_read_format_rar_overflow.c \
> +       libarchive/test/test_read_format_rar5.c \
> +       libarchive/test/test_read_format_raw.c \
> +       libarchive/test/test_read_format_tar.c \
> +@@ -889,6 +890,7 @@ libarchive_test_EXTRA_DIST=3D\
> +       libarchive/test/test_read_format_rar_multivolume.part0003.rar.uu =
\
> +       libarchive/test/test_read_format_rar_multivolume.part0004.rar.uu =
\
> +       libarchive/test/test_read_format_rar_noeof.rar.uu \
> ++      libarchive/test/test_read_format_rar_overflow.rar.uu \
> +       libarchive/test/test_read_format_rar_ppmd_lzss_conversion.rar.uu =
\
> +       libarchive/test/test_read_format_rar_ppmd_use_after_free.rar.uu \
> +       libarchive/test/test_read_format_rar_ppmd_use_after_free2.rar.uu =
\
> +diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/a=
rchive_read_support_format_rar.c
> +index 9eb3c84..88eab62 100644
> +--- a/libarchive/archive_read_support_format_rar.c
> ++++ b/libarchive/archive_read_support_format_rar.c
> +@@ -451,7 +451,7 @@ static int read_filter(struct archive_read *, int64_=
t *);
> + static int rar_decode_byte(struct archive_read*, uint8_t *);
> + static int execute_filter(struct archive_read*, struct rar_filter *,
> +                           struct rar_virtual_machine *, size_t);
> +-static int copy_from_lzss_window(struct archive_read *, void *, int64_t=
, int);
> ++static int copy_from_lzss_window(struct archive_read *, uint8_t *, int6=
4_t, int);
> + static inline void vm_write_32(struct rar_virtual_machine*, size_t, uin=
t32_t);
> + static inline uint32_t vm_read_32(struct rar_virtual_machine*, size_t);
> +
> +@@ -2929,7 +2929,7 @@ expand(struct archive_read *a, int64_t *end)
> +     }
> +
> +     if ((symbol =3D read_next_symbol(a, &rar->maincode)) < 0)
> +-      return (ARCHIVE_FATAL);
> ++      goto bad_data;
> +
> +     if (symbol < 256)
> +     {
> +@@ -2956,14 +2956,14 @@ expand(struct archive_read *a, int64_t *end)
> +       else
> +       {
> +         if (parse_codes(a) !=3D ARCHIVE_OK)
> +-          return (ARCHIVE_FATAL);
> ++          goto bad_data;
> +         continue;
> +       }
> +     }
> +     else if(symbol=3D=3D257)
> +     {
> +       if (!read_filter(a, end))
> +-          return (ARCHIVE_FATAL);
> ++          goto bad_data;
> +       continue;
> +     }
> +     else if(symbol=3D=3D258)
> +@@ -3048,7 +3048,7 @@ expand(struct archive_read *a, int64_t *end)
> +           {
> +             if ((lowoffsetsymbol =3D
> +               read_next_symbol(a, &rar->lowoffsetcode)) < 0)
> +-              return (ARCHIVE_FATAL);
> ++              goto bad_data;
> +             if(lowoffsetsymbol =3D=3D 16)
> +             {
> +               rar->numlowoffsetrepeats =3D 15;
> +@@ -3096,7 +3096,7 @@ bad_data:
> + }
> +
> + static int
> +-copy_from_lzss_window(struct archive_read *a, void *buffer,
> ++copy_from_lzss_window(struct archive_read *a, uint8_t *buffer,
> +                       int64_t startpos, int length)
> + {
> +   int windowoffs, firstpart;
> +@@ -3111,7 +3111,7 @@ copy_from_lzss_window(struct archive_read *a, void=
 *buffer,
> +   }
> +   if (firstpart < length) {
> +     memcpy(buffer, &rar->lzss.window[windowoffs], firstpart);
> +-    memcpy(buffer, &rar->lzss.window[0], length - firstpart);
> ++    memcpy(buffer + firstpart, &rar->lzss.window[0], length - firstpart=
);
> +   } else {
> +     memcpy(buffer, &rar->lzss.window[windowoffs], length);
> +   }
> +@@ -3266,6 +3266,9 @@ parse_filter(struct archive_read *a, const uint8_t=
 *bytes, uint16_t length, uint
> +   else
> +     blocklength =3D prog ? prog->oldfilterlength : 0;
> +
> ++  if (blocklength > rar->dictionary_size)
> ++    return 0;
> ++
> +   registers[3] =3D PROGRAM_SYSTEM_GLOBAL_ADDRESS;
> +   registers[4] =3D blocklength;
> +   registers[5] =3D prog ? prog->usagecount : 0;
> +diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists=
.txt
> +index 5d7a5d2..59c5f5d 100644
> +--- a/libarchive/test/CMakeLists.txt
> ++++ b/libarchive/test/CMakeLists.txt
> +@@ -163,6 +163,7 @@ IF(ENABLE_TEST)
> +     test_read_format_rar_encryption_partially.c
> +     test_read_format_rar_invalid1.c
> +     test_read_format_rar_filter.c
> ++    test_read_format_rar_overflow.c
> +     test_read_format_rar5.c
> +     test_read_format_raw.c
> +     test_read_format_tar.c
> +diff --git a/libarchive/test/test_read_format_rar_overflow.c b/libarchiv=
e/test/test_read_format_rar_overflow.c
> +new file mode 100644
> +index 0000000..b39ed6b
> +--- /dev/null
> ++++ b/libarchive/test/test_read_format_rar_overflow.c
> +@@ -0,0 +1,48 @@
> ++/*-
> ++ * Copyright (c) 2003-2025 Tim Kientzle
> ++ * All rights reserved.
> ++ *
> ++ * Redistribution and use in source and binary forms, with or without
> ++ * modification, are permitted provided that the following conditions
> ++ * are met:
> ++ * 1. Redistributions of source code must retain the above copyright
> ++ *    notice, this list of conditions and the following disclaimer.
> ++ * 2. Redistributions in binary form must reproduce the above copyright
> ++ *    notice, this list of conditions and the following disclaimer in t=
he
> ++ *    documentation and/or other materials provided with the distributi=
on.
> ++ *
> ++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS=
 OR
> ++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRA=
NTIES
> ++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIM=
ED.
> ++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
> ++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,=
 BUT
> ++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF=
 USE,
> ++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON AN=
Y
> ++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> ++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E OF
> ++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> ++ */
> ++#include "test.h"
> ++
> ++DEFINE_TEST(test_read_format_rar_overflow)
> ++{
> ++    struct archive *a;
> ++    struct archive_entry *ae;
> ++    const char reffile[] =3D "test_read_format_rar_overflow.rar";
> ++    const void *buff;
> ++    size_t size;
> ++    int64_t offset;
> ++
> ++    extract_reference_file(reffile);
> ++    assert((a =3D archive_read_new()) !=3D NULL);
> ++    assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
> ++    assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
> ++    assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, reffil=
e, 1024));
> ++    assertEqualIntA(a, ARCHIVE_OK, archive_read_next_header(a, &ae));
> ++    assertEqualInt(48, archive_entry_size(ae));
> ++    /* The next call should reproduce Issue #2565 */
> ++    assertEqualIntA(a, ARCHIVE_FATAL, archive_read_data_block(a, &buff,=
 &size, &offset));
> ++
> ++    assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
> ++    assertEqualInt(ARCHIVE_OK, archive_read_free(a));
> ++}
> +diff --git a/libarchive/test/test_read_format_rar_overflow.rar.uu b/liba=
rchive/test/test_read_format_rar_overflow.rar.uu
> +new file mode 100644
> +index 0000000..48fd3fd
> +--- /dev/null
> ++++ b/libarchive/test/test_read_format_rar_overflow.rar.uu
> +@@ -0,0 +1,11 @@
> ++begin 644 test_read_format_rar_overflow.rar
> ++M4F%R(1H'`,($=3D```(0`@`0``,`````(````````````S`0``````,`"_B%_:
> ++MZ?^[:7``?S!!,`@P,KB@,T@RN33)MTEB@5Z3<`DP`K35`.0P63@P<,Q&0?#,
> ++MA##,,",S,(@P,#,@##`&,#":(3`!,#"(`9HPS,,S13`P,#`P,*`PHPS,,S1A
> ++M,!,!,#","9H@S12D#$PP!C`P`*'F03":,,T8H`@\,/DPJS!/,"30,#`3N%LP
> ++MCQ6:S3"!,#LP22<-,$5%B"5B$S!)(&*>G#+@!`E`%0ODC])62=3DDO,)BYJX'P
> ++M=3D/LPZ3!!008?%S`P,#`P,#`P,#`P,#`P,#`P,#`P2$PP,#`P03!(,#`P,#`&
> ++M,`7),#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P
> ++-,#`P,#`P,#`P,#`P,```
> ++`
> ++end
> +--
> +2.40.0
> +
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/=
recipes-extended/libarchive/libarchive_3.7.9.bb
> index d5c950f9e0..c091508799 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
> @@ -31,6 +31,7 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
>
>  SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
>             file://CVE-2025-5914.patch \
> +           file://CVE-2025-5915.patch \
>             "
>
>  UPSTREAM_CHECK_URI =3D "http://libarchive.org/"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219864): https://lists.openembedded.org/g/openembedde=
d-core/message/219864
> Mute This Topic: https://lists.openembedded.org/mt/113963499/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


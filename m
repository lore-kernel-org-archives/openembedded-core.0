Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFBBC48260
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 21:43:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.564.1706218980989225802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 13:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RGobE3ZK;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40eb033c1b0so56367145e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706218979; x=1706823779; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cGziPzI+o+V6xBwBiaSI0xqn7kmX3QLs2SjPuaCeeS0=;
        b=RGobE3ZKdUsoRYAfDB072B49CBhjyzOHwHT06saHEi7y/1CGgjYa06w167m/aVBHh0
         TWb6ovN4cC4qfYBatLLMboWQFypwyrEf2/TuWvlfBWDBGrrm6DITGC4VbsZMoqRoGues
         Ogk7PQcQwfYfFg/NUNLMQNw4zzrwS7gJy7aiYNnfzsDAuZQnKlqtLlcGuTtyoOLM4vqG
         rboGxwm3vWOtl+mcHZKzq/wCB72kg7P+0JMAlotXSwgFVesCdoUBNbV+UvPTSOMljmmA
         GIRnJBSmDuXXCFfRUKjWlE6OIuvWTUUt02gv9soy7+G+K392n4Su1g6HI/orFULiPn8k
         P+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706218979; x=1706823779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGziPzI+o+V6xBwBiaSI0xqn7kmX3QLs2SjPuaCeeS0=;
        b=fGRplTetUGcG9E5QT+GjH8BsVOu0ZHG1Ppy3pmpskUOBH91S5H9C/bnZUatPl0YWtN
         Ib+5ZyodB1K9oZFN1chY3hrs/lxVtB1m56HwRTCEDjbqOnX5u4B7Ex1iZG0hDAuaFKUj
         h1lMJDhNwjICI5ixfuFg+EloHhUYYT2h8hUArlH1wFTqIxecRwdd5fjBEG+JJwxm0UQD
         6/Dwj4W1rEJn9pQRa1Ur1ZidMuckqP2ail7YrKC1gEfk5ERLL4YMMpI76oSdRII1FPrB
         QjSpS4ORPYordank9dXF7OhSOufyJb6Hj8SrOdA+3xX2SCwyIX5ng/iwSxBiRxjHPCXK
         CPiw==
X-Gm-Message-State: AOJu0YxhDaM3Gk6yRFFcIc5iiSsDtJgAIWH9nq+UNOMDLRsP98BCcY4/
	yOpuvqoHSIsg1+N0ie9No4+LcaWU4cLf0LCT1wY742wMLpygv64glyITtFhQLVlV/q3AQQBAzNp
	D6BEgLYq4qhIK86tt3wU/ZAXJOvA=
X-Google-Smtp-Source: AGHT+IFSFs5cWvGWf5N1tyk/ILRjVrL0hAVH/K1B1EWQfeNUrf9k7M/Oq0zr9JRrL8lHSJLKPx++TJnBp3CjaS/Zcxk=
X-Received: by 2002:a05:600c:500f:b0:40e:68a9:9373 with SMTP id
 n15-20020a05600c500f00b0040e68a99373mr231498wmr.128.1706218979143; Thu, 25
 Jan 2024 13:42:59 -0800 (PST)
MIME-Version: 1.0
References: <1706216634-8340-1-git-send-email-mark.hatle@kernel.crashing.org> <1706216634-8340-2-git-send-email-mark.hatle@kernel.crashing.org>
In-Reply-To: <1706216634-8340-2-git-send-email-mark.hatle@kernel.crashing.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 25 Jan 2024 22:42:47 +0100
Message-ID: <CA+chaQekfBh8sXYmNE7zVABKVVhU9Z_W5iD0k7tvNJ-DhPed=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] qemu: Allow native and nativesdk versions
 on Linux older then 4.17
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org, mark.hatle@amd.com
Content-Type: multipart/alternative; boundary="000000000000293473060fcc10c4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 21:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194334

--000000000000293473060fcc10c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I did something similar for LGE when we were using 18.04 ubuntu, but IIRC
it's not about the kernel version, but glibc being older than 2.27.

18.04 is already unsupported for a while, I don't think oe-core should
support unsupported host OS versions (that's why I've never send my
version).

To make this change smaller you can just
revert c42e77a90d9244c8caf76fe0e54f84200430a4e1 from qemu.

If oe-core really needs to support this I can share my version as in:
https://github.com/shr-project/meta-webosose/commit/7528c20bf3ba7576d4611f7=
1f987a408ac8845c2

Regards,

On Thu, Jan 25, 2024 at 10:04=E2=80=AFPM Mark Hatle <mark.hatle@kernel.cras=
hing.org>
wrote:

> From: Mark Hatle <mark.hatle@amd.com>
>
> Linux kernel 4.17 introduced two new mmap flags, MAP_FIXED_NOREPLACE and
> MAP_SHARED_VALIDATE.  Starting with QEMU 8.1, these flags are now used
> and required for proper system operation.  In order to build and run on a
> system older then 4.17, we need to emulate this new behavior.
>
> Not having a newer kernel could result in the mmap memory being allocated
> in a way that will cause failures without QEMU checking for these
> conditions.  Note, memory allocation issues are rare in my experience so
> this is more of a 'just-in-case' behavior.
>
> SDK_OLDEST_KERNEL is currently set to 3.2.0, the only way this can claim
> that qemu works in an SDK is by checking the return values to emulate
> the expected behavior.
>
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  12 +
>  ...round-for-missing-MAP_FIXED_NOREPLAC.patch | 286 ++++++++++++++++++
>  ...round-for-missing-MAP_SHARED_VALIDAT.patch |  51 ++++
>  3 files changed, 349 insertions(+)
>  create mode 100644
> meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MA=
P_FIXED_NOREPLAC.patch
>  create mode 100644
> meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-MA=
P_SHARED_VALIDAT.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> index ccb2880402..7c31a5aa83 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -39,6 +39,18 @@ SRC_URI =3D "
> https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> +# SDK_OLDEST_KERNEL is set below 4.17, which is the minimum version
> required by QEMU >=3D 8.1
> +# This is due to two MMAP flags being used at certain points
> +SRC_URI:append:class-nativesdk =3D " \
> +
>  file://0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch \
> +
>  file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch \
> +        "
> +
> +# Support building and using native version on pre 4.17 kernels
> +SRC_URI:append:class-native =3D " \
> +
>  file://0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch \
> +
>  file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch \
> +        "
>
>  SRC_URI[sha256sum] =3D
> "bf00d2fa12010df8b0ade93371def58e632cb32a6bfdc5f5a0ff8e6a1fb1bf32"
>
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-=
MAP_FIXED_NOREPLAC.patch
> b/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-=
MAP_FIXED_NOREPLAC.patch
> new file mode 100644
> index 0000000000..8941911fb3
> --- /dev/null
> +++
> b/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-=
MAP_FIXED_NOREPLAC.patch
> @@ -0,0 +1,286 @@
> +From fa9bcabe2387bb230ef82d62827ad6f93b8a1e61 Mon Sep 17 00:00:00 2001
> +From: Frederic Konrad <fkonrad@amd.com>
> +Date: Wed, 17 Jan 2024 18:15:06 +0000
> +Subject: [PATCH 1/2] linux-user/*: workaround for missing
> MAP_FIXED_NOREPLACE
> +
> +QEMU v8.1.0 recently requires MAP_FIXED_NOREPLACE flags implementation
> for mmap.
> +
> +This is missing from ubuntu 18.04, thus this patch catches the mmap call=
s
> which
> +could use that new flag and forwards them to mmap when MAP_FIXED_NOREPLA=
CE
> +flag isn't set or emulates them by checking the returned address w.r.t t=
he
> +requested address.
> +
> +Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> +Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +The upstream only supports the last two major releases of an OS.  The on=
es
> +they have declared all have kernel 4.17 or newer.
> +
> +See:
> +https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019
> +
> +https://www.qemu.org/docs/master/about/build-platforms.html
> +
> + The project aims to support the most recent major version at all times
> for up
> + to five years after its initial release. Support for the previous major
> + version will be dropped 2 years after the new major version is released
> or
> + when the vendor itself drops support, whichever comes first.
> +
> +Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> +---
> + linux-user/elfload.c    |  7 +++--
> + linux-user/meson.build  |  1 +
> + linux-user/mmap-fixed.c | 63 +++++++++++++++++++++++++++++++++++++++++
> + linux-user/mmap-fixed.h | 39 +++++++++++++++++++++++++
> + linux-user/mmap.c       | 31 +++++++++++---------
> + linux-user/syscall.c    |  1 +
> + 6 files changed, 125 insertions(+), 17 deletions(-)
> + create mode 100644 linux-user/mmap-fixed.c
> + create mode 100644 linux-user/mmap-fixed.h
> +
> +Index: qemu-8.2.0/linux-user/elfload.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qemu-8.2.0.orig/linux-user/elfload.c
> ++++ qemu-8.2.0/linux-user/elfload.c
> +@@ -22,6 +22,7 @@
> + #include "qemu/error-report.h"
> + #include "target_signal.h"
> + #include "accel/tcg/debuginfo.h"
> ++#include "mmap-fixed.h"
> +
> + #ifdef TARGET_ARM
> + #include "target/arm/cpu-features.h"
> +@@ -2765,9 +2766,9 @@ static abi_ulong create_elf_tables(abi_u
> + static int pgb_try_mmap(uintptr_t addr, uintptr_t addr_last, bool keep)
> + {
> +     size_t size =3D addr_last - addr + 1;
> +-    void *p =3D mmap((void *)addr, size, PROT_NONE,
> +-                   MAP_ANONYMOUS | MAP_PRIVATE |
> +-                   MAP_NORESERVE | MAP_FIXED_NOREPLACE, -1, 0);
> ++    void *p =3D mmap_fixed_noreplace((void *)addr, size, PROT_NONE,
> ++                                   MAP_ANONYMOUS | MAP_PRIVATE |
> ++                                   MAP_NORESERVE | MAP_FIXED_NOREPLACE,
> -1, 0);
> +     int ret;
> +
> +     if (p =3D=3D MAP_FAILED) {
> +Index: qemu-8.2.0/linux-user/meson.build
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qemu-8.2.0.orig/linux-user/meson.build
> ++++ qemu-8.2.0/linux-user/meson.build
> +@@ -14,6 +14,7 @@ linux_user_ss.add(files(
> +   'linuxload.c',
> +   'main.c',
> +   'mmap.c',
> ++  'mmap-fixed.c',
> +   'signal.c',
> +   'strace.c',
> +   'syscall.c',
> +Index: qemu-8.2.0/linux-user/mmap-fixed.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- /dev/null
> ++++ qemu-8.2.0/linux-user/mmap-fixed.c
> +@@ -0,0 +1,63 @@
> ++/*
> ++ * Workaround for MAP_FIXED_NOREPLACE
> ++ *
> ++ * Copyright (c) 2024, Advanced Micro Devices, Inc.
> ++ * Developed by Fred Konrad <fkonrad@amd.com>
> ++ *
> ++ * Permission is hereby granted, free of charge, to any person obtainin=
g
> a copy
> ++ * of this software and associated documentation files (the "Software")=
,
> to deal
> ++ * in the Software without restriction, including without limitation th=
e
> rights
> ++ * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> ++ * copies of the Software, and to permit persons to whom the Software i=
s
> ++ * furnished to do so, subject to the following conditions:
> ++ *
> ++ * The above copyright notice and this permission notice shall be
> included in
> ++ * all copies or substantial portions of the Software.
> ++ *
> ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> ++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> ++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> ++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> ++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> ++ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> ++ * THE SOFTWARE.
> ++ */
> ++
> ++#include <sys/mman.h>
> ++#include <errno.h>
> ++
> ++#ifndef MAP_FIXED_NOREPLACE
> ++#include "mmap-fixed.h"
> ++
> ++void *mmap_fixed_noreplace(void *addr, size_t len, int prot, int flags,
> ++                                  int fd, off_t offset)
> ++{
> ++    void *retaddr;
> ++
> ++    if (!(flags & MAP_FIXED_NOREPLACE)) {
> ++        /* General case, use the regular mmap.  */
> ++        return mmap(addr, len, prot, flags, fd, offset);
> ++    }
> ++
> ++    /* Since MAP_FIXED_NOREPLACE is not implemented, try to emulate it.
> */
> ++    flags =3D flags & ~(MAP_FIXED_NOREPLACE | MAP_FIXED);
> ++    retaddr =3D mmap(addr, len, prot, flags, fd, offset);
> ++    if ((retaddr =3D=3D addr) || (retaddr =3D=3D MAP_FAILED)) {
> ++        /*
> ++         * Either the map worked and we get the good address so it can =
be
> ++         * returned, or it failed and would have failed the same with
> ++         * MAP_FIXED*, in which case return MAP_FAILED.
> ++         */
> ++        return retaddr;
> ++    } else {
> ++        /*
> ++         * Page has been mapped but not at the requested address.. unma=
p
> it and
> ++         * return EEXIST.
> ++         */
> ++        munmap(retaddr, len);
> ++        errno =3D EEXIST;
> ++        return MAP_FAILED;
> ++    }
> ++}
> ++
> ++#endif
> +Index: qemu-8.2.0/linux-user/mmap-fixed.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- /dev/null
> ++++ qemu-8.2.0/linux-user/mmap-fixed.h
> +@@ -0,0 +1,39 @@
> ++/*
> ++ * Workaround for MAP_FIXED_NOREPLACE
> ++ *
> ++ * Copyright (c) 2024, Advanced Micro Devices, Inc.
> ++ * Developed by Fred Konrad <fkonrad@amd.com>
> ++ *
> ++ * Permission is hereby granted, free of charge, to any person obtainin=
g
> a copy
> ++ * of this software and associated documentation files (the "Software")=
,
> to deal
> ++ * in the Software without restriction, including without limitation th=
e
> rights
> ++ * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> ++ * copies of the Software, and to permit persons to whom the Software i=
s
> ++ * furnished to do so, subject to the following conditions:
> ++ *
> ++ * The above copyright notice and this permission notice shall be
> included in
> ++ * all copies or substantial portions of the Software.
> ++ *
> ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> ++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> ++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> ++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> ++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> ++ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> ++ * THE SOFTWARE.
> ++ */
> ++
> ++#ifndef MMAP_FIXED_H
> ++#define MMAP_FIXED_H
> ++
> ++#ifndef MAP_FIXED_NOREPLACE
> ++#define MAP_FIXED_NOREPLACE 0x100000
> ++
> ++void *mmap_fixed_noreplace(void *addr, size_t len, int prot, int flags,
> ++                           int fd, off_t offset);
> ++
> ++#else /* MAP_FIXED_NOREPLACE */
> ++#define mmap_fixed_noreplace mmap
> ++#endif /* MAP_FIXED_NOREPLACE */
> ++
> ++#endif /* MMAP_FIXED_H */
> +Index: qemu-8.2.0/linux-user/mmap.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qemu-8.2.0.orig/linux-user/mmap.c
> ++++ qemu-8.2.0/linux-user/mmap.c
> +@@ -25,6 +25,7 @@
> + #include "user-mmap.h"
> + #include "target_mman.h"
> + #include "qemu/interval-tree.h"
> ++#include "mmap-fixed.h"
> +
> + #ifdef TARGET_ARM
> + #include "target/arm/cpu-features.h"
> +@@ -304,9 +305,9 @@ static bool mmap_frag(abi_ulong real_sta
> +          * outside of the fragment we need to map.  Allocate a new host
> +          * page to cover, discarding whatever else may have been presen=
t.
> +          */
> +-        void *p =3D mmap(host_start, qemu_host_page_size,
> +-                       target_to_host_prot(prot),
> +-                       flags | MAP_ANONYMOUS, -1, 0);
> ++        void *p =3D mmap_fixed_noreplace(host_start, qemu_host_page_siz=
e,
> ++                                       target_to_host_prot(prot),
> ++                                       flags | MAP_ANONYMOUS, -1, 0);
> +         if (p !=3D host_start) {
> +             if (p !=3D MAP_FAILED) {
> +                 munmap(p, qemu_host_page_size);
> +@@ -405,8 +406,9 @@ abi_ulong mmap_find_vma(abi_ulong start,
> +          *  - mremap() with MREMAP_FIXED flag
> +          *  - shmat() with SHM_REMAP flag
> +          */
> +-        ptr =3D mmap(g2h_untagged(addr), size, PROT_NONE,
> +-                   MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
> ++        ptr =3D mmap_fixed_noreplace(g2h_untagged(addr), size, PROT_NON=
E,
> ++                                   MAP_ANONYMOUS | MAP_PRIVATE |
> MAP_NORESERVE,
> ++                                   -1, 0);
> +
> +         /* ENOMEM, if host address space has no memory */
> +         if (ptr =3D=3D MAP_FAILED) {
> +@@ -600,16 +602,16 @@ abi_long target_mmap(abi_ulong start, ab
> +          * especially important if qemu_host_page_size >
> +          * qemu_real_host_page_size.
> +          */
> +-        p =3D mmap(g2h_untagged(start), host_len, host_prot,
> +-                 flags | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> ++        p =3D mmap_fixed_noreplace(g2h_untagged(start), host_len,
> host_prot,
> ++                                 flags | MAP_FIXED | MAP_ANONYMOUS, -1,
> 0);
> +         if (p =3D=3D MAP_FAILED) {
> +             goto fail;
> +         }
> +         /* update start so that it points to the file position at
> 'offset' */
> +         host_start =3D (uintptr_t)p;
> +         if (!(flags & MAP_ANONYMOUS)) {
> +-            p =3D mmap(g2h_untagged(start), len, host_prot,
> +-                     flags | MAP_FIXED, fd, host_offset);
> ++            p =3D mmap_fixed_noreplace(g2h_untagged(start), len, host_p=
rot,
> ++                                     flags | MAP_FIXED, fd, host_offset=
);
> +             if (p =3D=3D MAP_FAILED) {
> +                 munmap(g2h_untagged(start), host_len);
> +                 goto fail;
> +@@ -734,8 +736,9 @@ abi_long target_mmap(abi_ulong start, ab
> +             len1 =3D real_last - real_start + 1;
> +             want_p =3D g2h_untagged(real_start);
> +
> +-            p =3D mmap(want_p, len1, target_to_host_prot(target_prot),
> +-                     flags, fd, offset1);
> ++            p =3D mmap_fixed_noreplace(want_p, len1,
> ++                                     target_to_host_prot(target_prot),
> ++                                     flags, fd, offset1);
> +             if (p !=3D want_p) {
> +                 if (p !=3D MAP_FAILED) {
> +                     munmap(p, len1);
> +@@ -837,9 +840,9 @@ static int mmap_reserve_or_unmap(abi_ulo
> +     host_start =3D g2h_untagged(real_start);
> +
> +     if (reserved_va) {
> +-        void *ptr =3D mmap(host_start, real_len, PROT_NONE,
> +-                         MAP_FIXED | MAP_ANONYMOUS
> +-                         | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
> ++        void *ptr =3D mmap_fixed_noreplace(host_start, real_len, PROT_N=
ONE,
> ++                                         MAP_FIXED | MAP_ANONYMOUS
> ++                                         | MAP_PRIVATE | MAP_NORESERVE,
> -1, 0);
> +         return ptr =3D=3D host_start ? 0 : -1;
> +     }
> +     return munmap(host_start, real_len);
> +Index: qemu-8.2.0/linux-user/syscall.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qemu-8.2.0.orig/linux-user/syscall.c
> ++++ qemu-8.2.0/linux-user/syscall.c
> +@@ -145,6 +145,7 @@
> + #include "qapi/error.h"
> + #include "fd-trans.h"
> + #include "cpu_loop-common.h"
> ++#include "mmap-fixed.h"
> +
> + #ifndef CLONE_IO
> + #define CLONE_IO                0x80000000      /* Clone io context */
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-=
MAP_SHARED_VALIDAT.patch
> b/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-=
MAP_SHARED_VALIDAT.patch
> new file mode 100644
> index 0000000000..081409f355
> --- /dev/null
> +++
> b/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-=
MAP_SHARED_VALIDAT.patch
> @@ -0,0 +1,51 @@
> +From 5c73e53997df800a742f9cd7355f3045861984bb Mon Sep 17 00:00:00 2001
> +From: Frederic Konrad <fkonrad@amd.com>
> +Date: Thu, 18 Jan 2024 10:43:44 +0000
> +Subject: [PATCH 2/2] linux-user/*: workaround for missing
> MAP_SHARED_VALIDATE
> +
> +QEMU v8.1.0 recently requires MAP_SHARED_VALIDATE flags implementation
> for mmap.
> +
> +This is missing from the Ubuntu 18.04 compiler but looks like to be in t=
he
> +kernel source.
> +
> +Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> +Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +The upstream only supports the last two major releases of an OS.  The on=
es
> +they have declared all have kernel 4.17 or newer.
> +
> +See:
> +https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019
> +
> +https://www.qemu.org/docs/master/about/build-platforms.html
> +
> + The project aims to support the most recent major version at all times
> for up
> + to five years after its initial release. Support for the previous major
> + version will be dropped 2 years after the new major version is released
> or
> + when the vendor itself drops support, whichever comes first.
> +
> +Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> +---
> + linux-user/mmap-fixed.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/linux-user/mmap-fixed.h b/linux-user/mmap-fixed.h
> +index ef6eef5114..ec86586c1f 100644
> +--- a/linux-user/mmap-fixed.h
> ++++ b/linux-user/mmap-fixed.h
> +@@ -26,6 +26,10 @@
> + #ifndef MMAP_FIXED_H
> + #define MMAP_FIXED_H
> +
> ++#ifndef MAP_SHARED_VALIDATE
> ++#define MAP_SHARED_VALIDATE 0x03
> ++#endif
> ++
> + #ifndef MAP_FIXED_NOREPLACE
> + #define MAP_FIXED_NOREPLACE 0x100000
> +
> +--
> +2.34.1
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194331):
> https://lists.openembedded.org/g/openembedded-core/message/194331
> Mute This Topic: https://lists.openembedded.org/mt/103962276/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000293473060fcc10c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I did something similar for LGE when we were using 18=
.04 ubuntu, but IIRC it&#39;s not about the kernel version, but glibc being=
 older than 2.27.</div><div><br></div><div>18.04 is already unsupported for=
 a while, I don&#39;t think oe-core should support unsupported host OS vers=
ions (that&#39;s why I&#39;ve never send my version).</div><div><br></div><=
div>To make this change smaller you can just revert=C2=A0c42e77a90d9244c8ca=
f76fe0e54f84200430a4e1 from qemu.</div><div><br></div><div>If oe-core reall=
y needs to support this I can share my version as in:</div><div><a href=3D"=
https://github.com/shr-project/meta-webosose/commit/7528c20bf3ba7576d4611f7=
1f987a408ac8845c2">https://github.com/shr-project/meta-webosose/commit/7528=
c20bf3ba7576d4611f71f987a408ac8845c2</a><br></div><div><br></div><div>Regar=
ds,</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Jan 25, 2024 at 10:04=E2=80=AFPM Mark Hatle &lt;<a href=3D"mailt=
o:mark.hatle@kernel.crashing.org" target=3D"_blank">mark.hatle@kernel.crash=
ing.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@amd.com" target=3D=
"_blank">mark.hatle@amd.com</a>&gt;<br>
<br>
Linux kernel 4.17 introduced two new mmap flags, MAP_FIXED_NOREPLACE and<br=
>
MAP_SHARED_VALIDATE.=C2=A0 Starting with QEMU 8.1, these flags are now used=
<br>
and required for proper system operation.=C2=A0 In order to build and run o=
n a<br>
system older then 4.17, we need to emulate this new behavior.<br>
<br>
Not having a newer kernel could result in the mmap memory being allocated<b=
r>
in a way that will cause failures without QEMU checking for these<br>
conditions.=C2=A0 Note, memory allocation issues are rare in my experience =
so<br>
this is more of a &#39;just-in-case&#39; behavior.<br>
<br>
SDK_OLDEST_KERNEL is currently set to 3.2.0, the only way this can claim<br=
>
that qemu works in an SDK is by checking the return values to emulate<br>
the expected behavior.<br>
<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@amd.com" target=
=3D"_blank">mark.hatle@amd.com</a>&gt;<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.=
org" target=3D"_blank">mark.hatle@kernel.crashing.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 12 +<br>
=C2=A0...round-for-missing-MAP_FIXED_NOREPLAC.patch | 286 +++++++++++++++++=
+<br>
=C2=A0...round-for-missing-MAP_SHARED_VALIDAT.patch |=C2=A0 51 ++++<br>
=C2=A03 files changed, 349 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-wo=
rkaround-for-missing-MAP_FIXED_NOREPLAC.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/0012-linux-user-wo=
rkaround-for-missing-MAP_SHARED_VALIDAT.patch<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc<br>
index ccb2880402..7c31a5aa83 100644<br>
--- a/meta/recipes-devtools/qemu/qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/qemu.inc<br>
@@ -39,6 +39,18 @@ SRC_URI =3D &quot;<a href=3D"https://download.qemu.org/$=
%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://do=
wnload.qemu.org/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&=
quot;<br>
<br>
+# SDK_OLDEST_KERNEL is set below 4.17, which is the minimum version requir=
ed by QEMU &gt;=3D 8.1<br>
+# This is due to two MMAP flags being used at certain points<br>
+SRC_URI:append:class-nativesdk =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-linux-user-workaround-for-missing-M=
AP_FIXED_NOREPLAC.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-linux-user-workaround-for-missing-M=
AP_SHARED_VALIDAT.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+# Support building and using native version on pre 4.17 kernels<br>
+SRC_URI:append:class-native =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-linux-user-workaround-for-missing-M=
AP_FIXED_NOREPLAC.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-linux-user-workaround-for-missing-M=
AP_SHARED_VALIDAT.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;bf00d2fa12010df8b0ade93371def58e632cb32a=
6bfdc5f5a0ff8e6a1fb1bf32&quot;<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for=
-missing-MAP_FIXED_NOREPLAC.patch b/meta/recipes-devtools/qemu/qemu/0011-li=
nux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch<br>
new file mode 100644<br>
index 0000000000..8941911fb3<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missin=
g-MAP_FIXED_NOREPLAC.patch<br>
@@ -0,0 +1,286 @@<br>
+From fa9bcabe2387bb230ef82d62827ad6f93b8a1e61 Mon Sep 17 00:00:00 2001<br>
+From: Frederic Konrad &lt;<a href=3D"mailto:fkonrad@amd.com" target=3D"_bl=
ank">fkonrad@amd.com</a>&gt;<br>
+Date: Wed, 17 Jan 2024 18:15:06 +0000<br>
+Subject: [PATCH 1/2] linux-user/*: workaround for missing MAP_FIXED_NOREPL=
ACE<br>
+<br>
+QEMU v8.1.0 recently requires MAP_FIXED_NOREPLACE flags implementation for=
 mmap.<br>
+<br>
+This is missing from ubuntu 18.04, thus this patch catches the mmap calls =
which<br>
+could use that new flag and forwards them to mmap when MAP_FIXED_NOREPLACE=
<br>
+flag isn&#39;t set or emulates them by checking the returned address w.r.t=
 the<br>
+requested address.<br>
+<br>
+Signed-off-by: Frederic Konrad &lt;<a href=3D"mailto:fkonrad@amd.com" targ=
et=3D"_blank">fkonrad@amd.com</a>&gt;<br>
+Signed-off-by: Francisco Iglesias &lt;<a href=3D"mailto:francisco.iglesias=
@amd.com" target=3D"_blank">francisco.iglesias@amd.com</a>&gt;<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+The upstream only supports the last two major releases of an OS.=C2=A0 The=
 ones<br>
+they have declared all have kernel 4.17 or newer.<br>
+<br>
+See:<br>
+<a href=3D"https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019=
" rel=3D"noreferrer" target=3D"_blank">https://xilinx.slack.com/archives/D0=
4G2647CTV/p1705074697942019</a><br>
+<br>
+<a href=3D"https://www.qemu.org/docs/master/about/build-platforms.html" re=
l=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/about/b=
uild-platforms.html</a><br>
+<br>
+ The project aims to support the most recent major version at all times fo=
r up<br>
+ to five years after its initial release. Support for the previous major<b=
r>
+ version will be dropped 2 years after the new major version is released o=
r<br>
+ when the vendor itself drops support, whichever comes first.<br>
+<br>
+Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@amd.com" target=
=3D"_blank">mark.hatle@amd.com</a>&gt;<br>
+---<br>
+ linux-user/elfload.c=C2=A0 =C2=A0 |=C2=A0 7 +++--<br>
+ linux-user/meson.build=C2=A0 |=C2=A0 1 +<br>
+ linux-user/mmap-fixed.c | 63 +++++++++++++++++++++++++++++++++++++++++<br=
>
+ linux-user/mmap-fixed.h | 39 +++++++++++++++++++++++++<br>
+ linux-user/mmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 +++++++++++---------<br>
+ linux-user/syscall.c=C2=A0 =C2=A0 |=C2=A0 1 +<br>
+ 6 files changed, 125 insertions(+), 17 deletions(-)<br>
+ create mode 100644 linux-user/mmap-fixed.c<br>
+ create mode 100644 linux-user/mmap-fixed.h<br>
+<br>
+Index: qemu-8.2.0/linux-user/elfload.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- qemu-8.2.0.orig/linux-user/elfload.c<br>
++++ qemu-8.2.0/linux-user/elfload.c<br>
+@@ -22,6 +22,7 @@<br>
+ #include &quot;qemu/error-report.h&quot;<br>
+ #include &quot;target_signal.h&quot;<br>
+ #include &quot;accel/tcg/debuginfo.h&quot;<br>
++#include &quot;mmap-fixed.h&quot;<br>
+ <br>
+ #ifdef TARGET_ARM<br>
+ #include &quot;target/arm/cpu-features.h&quot;<br>
+@@ -2765,9 +2766,9 @@ static abi_ulong create_elf_tables(abi_u<br>
+ static int pgb_try_mmap(uintptr_t addr, uintptr_t addr_last, bool keep)<b=
r>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0size_t size =3D addr_last - addr + 1;<br>
+-=C2=A0 =C2=A0 void *p =3D mmap((void *)addr, size, PROT_NONE,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_=
ANONYMOUS | MAP_PRIVATE |<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_=
NORESERVE | MAP_FIXED_NOREPLACE, -1, 0);<br>
++=C2=A0 =C2=A0 void *p =3D mmap_fixed_noreplace((void *)addr, size, PROT_N=
ONE,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_ANONYMOUS | MAP_PRI=
VATE |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_NORESERVE | MAP_FIX=
ED_NOREPLACE, -1, 0);<br>
+=C2=A0 =C2=A0 =C2=A0int ret;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (p =3D=3D MAP_FAILED) {<br>
+Index: qemu-8.2.0/linux-user/meson.build<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- qemu-8.2.0.orig/linux-user/meson.build<br>
++++ qemu-8.2.0/linux-user/meson.build<br>
+@@ -14,6 +14,7 @@ linux_user_ss.add(files(<br>
+=C2=A0 =C2=A0&#39;linuxload.c&#39;,<br>
+=C2=A0 =C2=A0&#39;main.c&#39;,<br>
+=C2=A0 =C2=A0&#39;mmap.c&#39;,<br>
++=C2=A0 &#39;mmap-fixed.c&#39;,<br>
+=C2=A0 =C2=A0&#39;signal.c&#39;,<br>
+=C2=A0 =C2=A0&#39;strace.c&#39;,<br>
+=C2=A0 =C2=A0&#39;syscall.c&#39;,<br>
+Index: qemu-8.2.0/linux-user/mmap-fixed.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null<br>
++++ qemu-8.2.0/linux-user/mmap-fixed.c<br>
+@@ -0,0 +1,63 @@<br>
++/*<br>
++ * Workaround for MAP_FIXED_NOREPLACE<br>
++ *<br>
++ * Copyright (c) 2024, Advanced Micro Devices, Inc.<br>
++ * Developed by Fred Konrad &lt;<a href=3D"mailto:fkonrad@amd.com" target=
=3D"_blank">fkonrad@amd.com</a>&gt;<br>
++ *<br>
++ * Permission is hereby granted, free of charge, to any person obtaining =
a copy<br>
++ * of this software and associated documentation files (the &quot;Softwar=
e&quot;), to deal<br>
++ * in the Software without restriction, including without limitation the =
rights<br>
++ * to use, copy, modify, merge, publish, distribute, sublicense, and/or s=
ell<br>
++ * copies of the Software, and to permit persons to whom the Software is<=
br>
++ * furnished to do so, subject to the following conditions:<br>
++ *<br>
++ * The above copyright notice and this permission notice shall be include=
d in<br>
++ * all copies or substantial portions of the Software.<br>
++ *<br>
++ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KI=
ND, EXPRESS OR<br>
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,<br>
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHAL=
L<br>
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER<br>
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G FROM,<br>
++ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS=
 IN<br>
++ * THE SOFTWARE.<br>
++ */<br>
++<br>
++#include &lt;sys/mman.h&gt;<br>
++#include &lt;errno.h&gt;<br>
++<br>
++#ifndef MAP_FIXED_NOREPLACE<br>
++#include &quot;mmap-fixed.h&quot;<br>
++<br>
++void *mmap_fixed_noreplace(void *addr, size_t len, int prot, int flags,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd, off_t offset)<br>
++{<br>
++=C2=A0 =C2=A0 void *retaddr;<br>
++<br>
++=C2=A0 =C2=A0 if (!(flags &amp; MAP_FIXED_NOREPLACE)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* General case, use the regular mmap.=C2=A0 =
*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return mmap(addr, len, prot, flags, fd, offse=
t);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 /* Since MAP_FIXED_NOREPLACE is not implemented, try to emu=
late it.=C2=A0 */<br>
++=C2=A0 =C2=A0 flags =3D flags &amp; ~(MAP_FIXED_NOREPLACE | MAP_FIXED);<b=
r>
++=C2=A0 =C2=A0 retaddr =3D mmap(addr, len, prot, flags, fd, offset);<br>
++=C2=A0 =C2=A0 if ((retaddr =3D=3D addr) || (retaddr =3D=3D MAP_FAILED)) {=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Either the map worked and we get the =
good address so it can be<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* returned, or it failed and would have=
 failed the same with<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* MAP_FIXED*, in which case return MAP_=
FAILED.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return retaddr;<br>
++=C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Page has been mapped but not at the r=
equested address.. unmap it and<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* return EEXIST.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 munmap(retaddr, len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EEXIST;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MAP_FAILED;<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++#endif<br>
+Index: qemu-8.2.0/linux-user/mmap-fixed.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null<br>
++++ qemu-8.2.0/linux-user/mmap-fixed.h<br>
+@@ -0,0 +1,39 @@<br>
++/*<br>
++ * Workaround for MAP_FIXED_NOREPLACE<br>
++ *<br>
++ * Copyright (c) 2024, Advanced Micro Devices, Inc.<br>
++ * Developed by Fred Konrad &lt;<a href=3D"mailto:fkonrad@amd.com" target=
=3D"_blank">fkonrad@amd.com</a>&gt;<br>
++ *<br>
++ * Permission is hereby granted, free of charge, to any person obtaining =
a copy<br>
++ * of this software and associated documentation files (the &quot;Softwar=
e&quot;), to deal<br>
++ * in the Software without restriction, including without limitation the =
rights<br>
++ * to use, copy, modify, merge, publish, distribute, sublicense, and/or s=
ell<br>
++ * copies of the Software, and to permit persons to whom the Software is<=
br>
++ * furnished to do so, subject to the following conditions:<br>
++ *<br>
++ * The above copyright notice and this permission notice shall be include=
d in<br>
++ * all copies or substantial portions of the Software.<br>
++ *<br>
++ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KI=
ND, EXPRESS OR<br>
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,<br>
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHAL=
L<br>
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER<br>
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G FROM,<br>
++ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS=
 IN<br>
++ * THE SOFTWARE.<br>
++ */<br>
++<br>
++#ifndef MMAP_FIXED_H<br>
++#define MMAP_FIXED_H<br>
++<br>
++#ifndef MAP_FIXED_NOREPLACE<br>
++#define MAP_FIXED_NOREPLACE 0x100000<br>
++<br>
++void *mmap_fixed_noreplace(void *addr, size_t len, int prot, int flags,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int fd, off_t offset);<br>
++<br>
++#else /* MAP_FIXED_NOREPLACE */<br>
++#define mmap_fixed_noreplace mmap<br>
++#endif /* MAP_FIXED_NOREPLACE */<br>
++<br>
++#endif /* MMAP_FIXED_H */<br>
+Index: qemu-8.2.0/linux-user/mmap.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- qemu-8.2.0.orig/linux-user/mmap.c<br>
++++ qemu-8.2.0/linux-user/mmap.c<br>
+@@ -25,6 +25,7 @@<br>
+ #include &quot;user-mmap.h&quot;<br>
+ #include &quot;target_mman.h&quot;<br>
+ #include &quot;qemu/interval-tree.h&quot;<br>
++#include &quot;mmap-fixed.h&quot;<br>
+ <br>
+ #ifdef TARGET_ARM<br>
+ #include &quot;target/arm/cpu-features.h&quot;<br>
+@@ -304,9 +305,9 @@ static bool mmap_frag(abi_ulong real_sta<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * outside of the fragment we need to ma=
p.=C2=A0 Allocate a new host<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * page to cover, discarding whatever el=
se may have been present.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *p =3D mmap(host_start, qemu_host_page_s=
ize,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0target_to_host_prot(prot),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0flags | MAP_ANONYMOUS, -1, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *p =3D mmap_fixed_noreplace(host_start, =
qemu_host_page_size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_to=
_host_prot(prot),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags | M=
AP_ANONYMOUS, -1, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p !=3D host_start) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p !=3D MAP_FAILED) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munmap(p, qe=
mu_host_page_size);<br>
+@@ -405,8 +406,9 @@ abi_ulong mmap_find_vma(abi_ulong start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 - mremap() with MREMAP_FIXED fl=
ag<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 - shmat() with SHM_REMAP flag<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D mmap(g2h_untagged(addr), size, PROT_N=
ONE,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_=
ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE, -1, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D mmap_fixed_noreplace(g2h_untagged(add=
r), size, PROT_NONE,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_ANONYMOUS | MAP_PRI=
VATE | MAP_NORESERVE,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-1, 0);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ENOMEM, if host address space has no =
memory */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED) {<br>
+@@ -600,16 +602,16 @@ abi_long target_mmap(abi_ulong start, ab<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * especially important if qemu_host_pag=
e_size &gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * qemu_real_host_page_size.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap(g2h_untagged(start), host_len, hos=
t_prot,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags | MAP=
_FIXED | MAP_ANONYMOUS, -1, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap_fixed_noreplace(g2h_untagged(start=
), host_len, host_prot,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags | MAP_FIXED | MAP_ANONYM=
OUS, -1, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D MAP_FAILED) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* update start so that it points to the=
 file position at &#39;offset&#39; */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_start =3D (uintptr_t)p;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(flags &amp; MAP_ANONYMOUS)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap(g2h_untagged(start),=
 len, host_prot,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0flags | MAP_FIXED, fd, host_offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap_fixed_noreplace(g2h_=
untagged(start), len, host_prot,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags | MAP_FIXE=
D, fd, host_offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D MAP_FAILED) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munmap(g2h_u=
ntagged(start), host_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<b=
r>
+@@ -734,8 +736,9 @@ abi_long target_mmap(abi_ulong start, ab<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len1 =3D real_last - real_=
start + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0want_p =3D g2h_untagged(re=
al_start);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap(want_p, len1, target=
_to_host_prot(target_prot),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0flags, fd, offset1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D mmap_fixed_noreplace(want=
_p, len1,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_to_host_p=
rot(target_prot),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags, fd, offse=
t1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p !=3D want_p) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p !=3D M=
AP_FAILED) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0munmap(p, len1);<br>
+@@ -837,9 +840,9 @@ static int mmap_reserve_or_unmap(abi_ulo<br>
+=C2=A0 =C2=A0 =C2=A0host_start =3D g2h_untagged(real_start);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (reserved_va) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *ptr =3D mmap(host_start, real_len, PROT=
_NONE,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MAP_FIXED | MAP_ANONYMOUS<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| MAP_PRIVATE | MAP_NORESERVE, -1, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *ptr =3D mmap_fixed_noreplace(host_start=
, real_len, PROT_NONE,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MA=
P_FIXED | MAP_ANONYMOUS<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
MAP_PRIVATE | MAP_NORESERVE, -1, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ptr =3D=3D host_start ? 0 : -1;<b=
r>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0return munmap(host_start, real_len);<br>
+Index: qemu-8.2.0/linux-user/syscall.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- qemu-8.2.0.orig/linux-user/syscall.c<br>
++++ qemu-8.2.0/linux-user/syscall.c<br>
+@@ -145,6 +145,7 @@<br>
+ #include &quot;qapi/error.h&quot;<br>
+ #include &quot;fd-trans.h&quot;<br>
+ #include &quot;cpu_loop-common.h&quot;<br>
++#include &quot;mmap-fixed.h&quot;<br>
+ <br>
+ #ifndef CLONE_IO<br>
+ #define CLONE_IO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=
x80000000=C2=A0 =C2=A0 =C2=A0 /* Clone io context */<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for=
-missing-MAP_SHARED_VALIDAT.patch b/meta/recipes-devtools/qemu/qemu/0012-li=
nux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch<br>
new file mode 100644<br>
index 0000000000..081409f355<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missin=
g-MAP_SHARED_VALIDAT.patch<br>
@@ -0,0 +1,51 @@<br>
+From 5c73e53997df800a742f9cd7355f3045861984bb Mon Sep 17 00:00:00 2001<br>
+From: Frederic Konrad &lt;<a href=3D"mailto:fkonrad@amd.com" target=3D"_bl=
ank">fkonrad@amd.com</a>&gt;<br>
+Date: Thu, 18 Jan 2024 10:43:44 +0000<br>
+Subject: [PATCH 2/2] linux-user/*: workaround for missing MAP_SHARED_VALID=
ATE<br>
+<br>
+QEMU v8.1.0 recently requires MAP_SHARED_VALIDATE flags implementation for=
 mmap.<br>
+<br>
+This is missing from the Ubuntu 18.04 compiler but looks like to be in the=
<br>
+kernel source.<br>
+<br>
+Signed-off-by: Frederic Konrad &lt;<a href=3D"mailto:fkonrad@amd.com" targ=
et=3D"_blank">fkonrad@amd.com</a>&gt;<br>
+Signed-off-by: Francisco Iglesias &lt;<a href=3D"mailto:francisco.iglesias=
@amd.com" target=3D"_blank">francisco.iglesias@amd.com</a>&gt;<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+The upstream only supports the last two major releases of an OS.=C2=A0 The=
 ones<br>
+they have declared all have kernel 4.17 or newer.<br>
+<br>
+See:<br>
+<a href=3D"https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019=
" rel=3D"noreferrer" target=3D"_blank">https://xilinx.slack.com/archives/D0=
4G2647CTV/p1705074697942019</a><br>
+<br>
+<a href=3D"https://www.qemu.org/docs/master/about/build-platforms.html" re=
l=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/about/b=
uild-platforms.html</a><br>
+<br>
+ The project aims to support the most recent major version at all times fo=
r up<br>
+ to five years after its initial release. Support for the previous major<b=
r>
+ version will be dropped 2 years after the new major version is released o=
r<br>
+ when the vendor itself drops support, whichever comes first.<br>
+<br>
+Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@amd.com" target=
=3D"_blank">mark.hatle@amd.com</a>&gt;<br>
+---<br>
+ linux-user/mmap-fixed.h | 4 ++++<br>
+ 1 file changed, 4 insertions(+)<br>
+<br>
+diff --git a/linux-user/mmap-fixed.h b/linux-user/mmap-fixed.h<br>
+index ef6eef5114..ec86586c1f 100644<br>
+--- a/linux-user/mmap-fixed.h<br>
++++ b/linux-user/mmap-fixed.h<br>
+@@ -26,6 +26,10 @@<br>
+ #ifndef MMAP_FIXED_H<br>
+ #define MMAP_FIXED_H<br>
+ <br>
++#ifndef MAP_SHARED_VALIDATE<br>
++#define MAP_SHARED_VALIDATE 0x03<br>
++#endif<br>
++<br>
+ #ifndef MAP_FIXED_NOREPLACE<br>
+ #define MAP_FIXED_NOREPLACE 0x100000<br>
+ <br>
+-- <br>
+2.34.1<br>
+<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194331): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194331" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194331</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103962276/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103962276/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000293473060fcc10c4--


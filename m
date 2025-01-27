Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D755C02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 19:07:22 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.1683.1738004837285263882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 11:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sop8mY9I;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-71e3f291ad6so2939947a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 11:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738004836; x=1738609636; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jv47ixgKit/9CqVx21nPKnEvJAC/s0vPFP6MMlj2N0E=;
        b=Sop8mY9IN5oPOeQijWaqV9APcMbKNLaAwdxe8w9JR5ltBEGbqHOTYC3f3jRsvdjJcx
         NnSaodzReQD3MbZtwgMchm2GzWHuignmUJfWTO3oVteqedGkCF4yhyRclQNZ4luIZQC0
         E0Y0F9oEKXY58d2wv1UP9fSmk3JCyPxQsiHFNFJzNoHvprVPE3knDmBotDTd+62JW0mC
         TDf/c8c754rn+vnn/vR4y26bJV1UVv+g0ttUqzpu+lhOcHf799I42YO37RdIyAKmo7OI
         Uh3u2Z1VrKt081CJ47NRcaySOOKAI2bCNwZDIxquvO1jd4uKFQaJclV7Y/hLULktuZE8
         jt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738004836; x=1738609636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jv47ixgKit/9CqVx21nPKnEvJAC/s0vPFP6MMlj2N0E=;
        b=g8tylUD5B85tExL3mR3+wnpbYglPak6KPJpqMuTL0a+VVwg7YJPwOHr5NNKu08mjJs
         uf/7uf6SWBT2qIhj95RqmHHhbEiokBi4hdhsu34/oiUy9orfnjFTHVTflX5kMqUpfTqa
         1FRAGHOiysgwhxPKkz/uFhBGn9w8kymLGJ0l0CncSD6Ipg4DfdC+woCnDYM5IeuHRXga
         3G69AKgG0kpGUUB4QM70HtUhO3oYnCQ8oNK81jiyus+G3Tn820gCeR01DpAs16cb/05q
         cLnyPNBlNRkLhO4hOeJU0037aXX0hz+m8Qut8LMk4fpuF0508FMm/gVYgWHZTzNqFd7N
         ppFg==
X-Gm-Message-State: AOJu0YwIQCrcZnJGFs1NL+3nf6Uf/F9j03RBcsPosYRA/K0c8I0ONth0
	XFNblPFaoipULpxvKq5wGD0Ly3BSo7uI32B3LPCas4OAh/Nvtc+4IaYAd749JFHiQiQMmRD6mp0
	GWfRg4Ri//vKXoja6q9aORBHp8NM=
X-Gm-Gg: ASbGnctjxpsDQHq38WUyd7AnBVx23qmOiNUDiCgRf08Mye1dyqLMS/YNKTWJzCHU5Ie
	rbdm377nKUg48f5K8VBd/KKU2ntKiEaVNwiG4OcQ95AIKCFBCwCQ7y9RHoZB6
X-Google-Smtp-Source: AGHT+IE3RlX+Cu0dbwBzHjIADlDBZmt11Q0Z971jVpC/vKmC4eIms2P5m/jLnwR04f/3Rez9PtwCcPw+UMg2UHqu9nc=
X-Received: by 2002:a05:6871:2106:b0:29e:499d:1d33 with SMTP id
 586e51a60fabf-2b1c0a29243mr23502756fac.14.1738004836159; Mon, 27 Jan 2025
 11:07:16 -0800 (PST)
MIME-Version: 1.0
References: <20250127153944.676370-1-ejo@pengutronix.de> <20250127153944.676370-2-ejo@pengutronix.de>
In-Reply-To: <20250127153944.676370-2-ejo@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2025 11:06:50 -0800
X-Gm-Features: AWEUYZn-0i8XPUDs1vDTZ1OhvfEHAfFzKhhNP54F2YhgenySPdhwDG6crs94OyU
Message-ID: <CAMKF1sqX7gFCEH78fHS+jkUSieL5crAU_RwAUO-daJL0u+fj0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] barebox: upgrade 2024.12.0 -> 2025.01.0
To: ejo@pengutronix.de
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 19:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210307

On Mon, Jan 27, 2025 at 7:40=E2=80=AFAM Enrico J=C3=B6rns via
lists.openembedded.org <ejo=3Dpengutronix.de@lists.openembedded.org>
wrote:
>
> Changes:
>
> * Added LLVM/Clang support for the sandbox architecture.
> * Enabled command execution from the sandbox command line.
> * Improved TFTP with dentry caching and default-disabled window size.
> * Introduced hardening features: register zeroing, stack variable
>   initialization, and malloc buffer zeroing.
> * Enhanced AM625 support with network support, watchdog driver, and
>   bootsource detection.
>
> Changelog: https://lore.barebox.org/barebox/Z4oUYdHXEAtnkySC@pengutronix.=
de/T/#u
>
> Also adds a new patch created for fixing barebox-tools build with musl.
>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
> v1 -> v2:
>   * added barebox patch file to fix musl build (by Ahmad Fatoum)
>   * minor wording change in 'Changes'
>   [* added patch to remove old barebox .patch file]
>
>  meta/recipes-bsp/barebox/barebox-common.inc   |  6 +-
>  ...linux-types.h-define-loff_t-for-musl.patch | 57 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-bsp/barebox/files/0001-scripts-include-l=
inux-types.h-define-loff_t-for-musl.patch
>
> diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-b=
sp/barebox/barebox-common.inc
> index fce3b825ae..13f1d81289 100644
> --- a/meta/recipes-bsp/barebox/barebox-common.inc
> +++ b/meta/recipes-bsp/barebox/barebox-common.inc
> @@ -3,6 +3,8 @@ SECTION =3D "bootloaders"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000b9ca1f0d3364286c4=
192"
>
> -PV =3D "2024.12.0"
> +PV =3D "2025.01.0"
>  SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
> -SRC_URI[sha256sum] =3D "717a2416b37942f584b0bb2eb61ccbf85dc0f1a5c841318f=
47cd6967b9c4dcab"
> +SRC_URI[sha256sum] =3D "288a838e6fe8897ea46dabd112e42287177353c88a7d442c=
efc8be8d1a85f5b5"
> +
> +SRC_URI +=3D "file://0001-scripts-include-linux-types.h-define-loff_t-fo=
r-musl.patch"
> diff --git a/meta/recipes-bsp/barebox/files/0001-scripts-include-linux-ty=
pes.h-define-loff_t-for-musl.patch b/meta/recipes-bsp/barebox/files/0001-sc=
ripts-include-linux-types.h-define-loff_t-for-musl.patch
> new file mode 100644
> index 0000000000..bce9d2ebf5
> --- /dev/null
> +++ b/meta/recipes-bsp/barebox/files/0001-scripts-include-linux-types.h-d=
efine-loff_t-for-musl.patch
> @@ -0,0 +1,57 @@
> +From e46f4add079bbae4ac0926ed113e393786e89bef Mon Sep 17 00:00:00 2001
> +From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> +Date: Mon, 27 Jan 2025 15:31:46 +0100
> +Subject: [PATCH] scripts: include/linux/types.h: define loff_t for musl
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +musl doesn't define loff_t, but glibc does and both of them define
> +__linux__. This leads to build errors with musl when code makes it into
> +scripts/ that uses loff_t. This was already fixed once e.g. in commit
> +c0d065fb0aa0 ("scripts: bareboximd: remove usage of loff_t").
> +
> +Instead of playing whack-a-mole in future, let's just define loff_t
> +for non-glibc builds of scripts/.
> +

loff_t is not posix defined but it is available in musl.
you need to add -D_GNU_SOURCE to the compiler cmdline.

> +Also, make sure <linux/types.h> is always included for scripts/common.h,
> +which is the only header currently making use of loff_t.
> +
> +Fixes: 5171f4d0696f ("scripts: implement read_fd and pread_full for tool=
s")
> +Upstream-Status: Submitted [https://lore.barebox.org/barebox/20250127143=
146.2965544-1-a.fatoum@pengutronix.de/T/#u]
> +Reported-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> +Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> +---
> + scripts/common.h              | 2 ++
> + scripts/include/linux/types.h | 2 +-
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/scripts/common.h b/scripts/common.h
> +index a0d16606b5..21ec576a5b 100644
> +--- a/scripts/common.h
> ++++ b/scripts/common.h
> +@@ -1,6 +1,8 @@
> + #ifndef __COMMON_H
> + #define __COMMON_H
> +
> ++#include <linux/types.h>
> ++
> + int read_file_2(const char *filename, size_t *size, void **outbuf, size=
_t max_size);
> + void *read_file(const char *filename, size_t *size);
> + void *read_fd(int fd, size_t *out_size);
> +diff --git a/scripts/include/linux/types.h b/scripts/include/linux/types=
.h
> +index e81d7e8101..02a330cd4e 100644
> +--- a/scripts/include/linux/types.h
> ++++ b/scripts/include/linux/types.h
> +@@ -14,7 +14,7 @@ typedef int16_t __s16;
> + typedef uint8_t __u8;
> + typedef int8_t __s8;
> +
> +-#ifndef __linux__
> ++#ifndef __GLIBC__
> + typedef long long loff_t;
> + #endif
> +
> +--
> +2.39.5
> +
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210302): https://lists.openembedded.org/g/openembedde=
d-core/message/210302
> Mute This Topic: https://lists.openembedded.org/mt/110840770/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


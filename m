Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BF7C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 23:54:51 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.467.1643327690502189842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 15:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=L1iytT/a;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id a8so9926134ejc.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 15:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Gr0oc0WBQSj4bXtbop+M/ejQfOPcokUDovmVuJr9bIo=;
        b=L1iytT/a0tHGBzDHb981Pp8EORkKe7ovI5FGqGXE7kgb0SsPh3ZXp37hiPK5pJLmkv
         subuUCshuzuO7u46bPagO87kEYaPNzNqwNrK7sh0TH2BRA9InIn4it4BzjLzYoHyDvJQ
         NIXHwyfeQEQYyERJ4oED9W2lJ8TrrQn7cQ/MkO/DohUWbWx27lqb60kBtNvCM3KbszQC
         eoJe2Pi0R4I/tGX9UJ6QyyMx6Ry7vx7zIJdOyntiAggw3+e8BJZLCtk9b3sKgujxAEHd
         jyTd5J/8KCuOZJVW32pvFFZMD+ha1NBCB7VJVTv0mkCVKLv7rA2zmEsvZxh5do2mGOIa
         sxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Gr0oc0WBQSj4bXtbop+M/ejQfOPcokUDovmVuJr9bIo=;
        b=2WbRrCvVK7ndO313Jk2MI5rzkvIlo0csor10z7C4DGEvNQb8DQz86IIaG6g1FOtZDQ
         qBese+OkgQmZ6tirfydtKoOlAf/BDUXAwkBlviCr5fHKAZ59ynRGzvgmZN3OVD0HAlu1
         iX0dO9ZD35HHwWG7mtbousmBpnJ+Lova4nRghZABQg7aEuM2gxKFy/+enJ4lD4ALSMoW
         PQ9q4j7xTXM9OeSfO31+Wq1YDuBgXzgC2C5Zg9BN/eaMpnRcE2QP64P8eyOv2kWN1QFi
         Jh8Ckgy6v6LpePdyPeXHM7aP7taNslTUR5oOXD2ouAN4bCUtiUVItjNgKEAghU8NJvRD
         hiTA==
X-Gm-Message-State: AOAM532Sdg3WsbePIbz9dCKcpcVXJNQsrQsmCB67JMVXSZjw0LlGjc/W
	VfQ2D/FQ5r1WPwp5hcwF78J0y87G1sLIA0euaN8rPw==
X-Google-Smtp-Source: 
 ABdhPJz40VBWE9En1/8ysJChTbWa1dziYm4COQgoBJGc4JacH0ylnwGSQEWVoOiiNfzgBgqCfbSKAhsrwAVwHfBE+vs=
X-Received: by 2002:a17:907:3d8f:: with SMTP id
 he15mr4699503ejc.246.1643327688531;
 Thu, 27 Jan 2022 15:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20220127231847.15062-1-jpuhlman@mvista.com>
In-Reply-To: <20220127231847.15062-1-jpuhlman@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 27 Jan 2022 13:54:37 -1000
Message-ID: 
 <CAOSpxdbuSh5mr5mh-9JBF==CKf7Su667F7X2LBp0vc59tZyqQw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] glibc : Fix CVE-2022-23218
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembedded-core@lists.openembedded.org, Pgowda <pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 23:54:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161062

Hi Jeremy,

I currently have a patch under test that fixes these issues in a
slightly different way:

https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/d=
unfell-nut&id=3De28ddfd639fbb14dfff9e70dbec1a38957d98687

(the above link will likely work for a few days, but I do rebase
stable/dunfell-nut quite often)

Steve

On Thu, Jan 27, 2022 at 1:19 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
> From: Pgowda <pgowda.cve@gmail.com>
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3D=
commit;h=3De368b12f6c16b6888dda99ba641e999b9c9643c8]
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3D=
commit;h=3Df545ad4928fa1f27a3075265182b38a4f939a5f7]
>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> (Backported from oe-core hardknot submission)
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  .../glibc/glibc/0001-CVE-2022-23218.patch     | 169 ++++++++++++++++++
>  .../glibc/glibc/0002-CVE-2022-23218.patch     |  80 +++++++++
>  2 files changed, 249 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.pat=
ch
>  create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.pat=
ch
>
> diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch b/me=
ta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch
> new file mode 100644
> index 0000000000..3f9726a95f
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch
> @@ -0,0 +1,169 @@
> +From a978f48ad05c01987671f6d4a752b96a5a4ea7f1 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 17 Jan 2022 10:21:34 +0100
> +Subject: [PATCH 1/2] socket: Add the __sockaddr_un_set function
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dcommit;h=3De368b12f6c16b6888dda99ba641e999b9c9643c8]
> +CVE: CVE-2022-23218
> +
> +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> +Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> +---
> + include/sys/un.h             | 12 +++++++
> + socket/Makefile              |  2 +-
> + socket/sockaddr_un_set.c     | 41 ++++++++++++++++++++++++
> + socket/tst-sockaddr_un_set.c | 62 ++++++++++++++++++++++++++++++++++++
> + 4 files changed, 116 insertions(+), 1 deletion(-)
> + create mode 100644 socket/sockaddr_un_set.c
> + create mode 100644 socket/tst-sockaddr_un_set.c
> +
> +diff --git a/include/sys/un.h b/include/sys/un.h
> +index bdbee99980..152afd9fc7 100644
> +--- a/include/sys/un.h
> ++++ b/include/sys/un.h
> +@@ -1 +1,13 @@
> + #include <socket/sys/un.h>
> ++
> ++#ifndef _ISOMAC
> ++
> ++/* Set ADDR->sun_family to AF_UNIX and ADDR->sun_path to PATHNAME.
> ++   Return 0 on success or -1 on failure (due to overlong PATHNAME).
> ++   The caller should always use sizeof (struct sockaddr_un) as the
> ++   socket address length, disregaring the length of PATHNAME.
> ++   Only concrete (non-abstract) pathnames are supported.  */
> ++int __sockaddr_un_set (struct sockaddr_un *addr, const char *pathname)
> ++  attribute_hidden;
> ++
> ++#endif /* _ISOMAC */
> +diff --git a/socket/Makefile b/socket/Makefile
> +index 125c042cab..035b5290d1 100644
> +--- a/socket/Makefile
> ++++ b/socket/Makefile
> +@@ -29,7 +29,7 @@ headers      :=3D sys/socket.h sys/un.h bits/sockaddr.=
h bits/socket.h \
> + routines :=3D accept bind connect getpeername getsockname getsockopt   =
 \
> +           listen recv recvfrom recvmsg send sendmsg sendto            \
> +           setsockopt shutdown socket socketpair isfdtype opensock     \
> +-          sockatmark accept4 recvmmsg sendmmsg
> ++          sockatmark accept4 recvmmsg sendmmsg sockaddr_un_set
> +
> + tests :=3D tst-accept4
> +
> +diff --git a/socket/sockaddr_un_set.c b/socket/sockaddr_un_set.c
> +new file mode 100644
> +index 0000000000..0bd40dc34e
> +--- /dev/null
> ++++ b/socket/sockaddr_un_set.c
> +@@ -0,0 +1,41 @@
> ++/* Set the sun_path member of struct sockaddr_un.
> ++   Copyright (C) 2022 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <https://www.gnu.org/licenses/>.  */
> ++
> ++#include <errno.h>
> ++#include <string.h>
> ++#include <sys/socket.h>
> ++#include <sys/un.h>
> ++
> ++int
> ++__sockaddr_un_set (struct sockaddr_un *addr, const char *pathname)
> ++{
> ++  size_t name_length =3D strlen (pathname);
> ++
> ++  /* The kernel supports names of exactly sizeof (addr->sun_path)
> ++     bytes, without a null terminator, but userspace does not; see the
> ++     SUN_LEN macro.  */
> ++  if (name_length >=3D sizeof (addr->sun_path))
> ++    {
> ++      __set_errno (EINVAL);     /* Error code used by the kernel.  */
> ++      return -1;
> ++    }
> ++
> ++  addr->sun_family =3D AF_UNIX;
> ++  memcpy (addr->sun_path, pathname, name_length + 1);
> ++  return 0;
> ++}
> +diff --git a/socket/tst-sockaddr_un_set.c b/socket/tst-sockaddr_un_set.c
> +new file mode 100644
> +index 0000000000..29c2a81afd
> +--- /dev/null
> ++++ b/socket/tst-sockaddr_un_set.c
> +@@ -0,0 +1,62 @@
> ++/* Test the __sockaddr_un_set function.
> ++   Copyright (C) 2022 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <https://www.gnu.org/licenses/>.  */
> ++
> ++/* Re-compile the function because the version in libc is not
> ++   exported.  */
> ++#include "sockaddr_un_set.c"
> ++
> ++#include <support/check.h>
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  struct sockaddr_un sun;
> ++
> ++  memset (&sun, 0xcc, sizeof (sun));
> ++  __sockaddr_un_set (&sun, "");
> ++  TEST_COMPARE (sun.sun_family, AF_UNIX);
> ++  TEST_COMPARE (__sockaddr_un_set (&sun, ""), 0);
> ++
> ++  memset (&sun, 0xcc, sizeof (sun));
> ++  TEST_COMPARE (__sockaddr_un_set (&sun, "/example"), 0);
> ++  TEST_COMPARE_STRING (sun.sun_path, "/example");
> ++
> ++  {
> ++    char pathname[108];         /* Length of sun_path (ABI constant).  =
*/
> ++    memset (pathname, 'x', sizeof (pathname));
> ++    pathname[sizeof (pathname) - 1] =3D '\0';
> ++    memset (&sun, 0xcc, sizeof (sun));
> ++    TEST_COMPARE (__sockaddr_un_set (&sun, pathname), 0);
> ++    TEST_COMPARE (sun.sun_family, AF_UNIX);
> ++    TEST_COMPARE_STRING (sun.sun_path, pathname);
> ++  }
> ++
> ++  {
> ++    char pathname[109];
> ++    memset (pathname, 'x', sizeof (pathname));
> ++    pathname[sizeof (pathname) - 1] =3D '\0';
> ++    memset (&sun, 0xcc, sizeof (sun));
> ++    errno =3D 0;
> ++    TEST_COMPARE (__sockaddr_un_set (&sun, pathname), -1);
> ++    TEST_COMPARE (errno, EINVAL);
> ++  }
> ++
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +--
> +2.26.2
> +
> diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch b/me=
ta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch
> new file mode 100644
> index 0000000000..754da32462
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch
> @@ -0,0 +1,80 @@
> +From 29b431a7bb45ce7d2fcb869f4d04b87c641534ea Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 17 Jan 2022 10:21:34 +0100
> +Subject: [PATCH 2/2] CVE-2022-23218: Buffer overflow in sunrpc svcunix_c=
reate
> + (bug 28768)
> +
> +The sunrpc function svcunix_create suffers from a stack-based buffer
> +overflow with overlong pathname arguments.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dcommit;h=3Df545ad4928fa1f27a3075265182b38a4f939a5f7]
> +CVE: CVE-2022-23218
> +
> +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> +Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> +---
> + NEWS              |  3 +++
> + sunrpc/Makefile   |  2 +-
> + sunrpc/svc_unix.c | 11 ++++-------
> + 3 files changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/NEWS b/NEWS
> +index 296b5406f2..00e71785e8 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -215,6 +215,9 @@ Security related changes:
> +   addresses for loaded libraries and thus bypass ASLR for a setuid
> +   program.  Reported by Marcin Ko=C5=9Bcielnicki.
> +
> ++  CVE-2022-23218: Passing an overlong file name to the svcunix_create
> ++  legacy function could result in a stack-based buffer overflow.
> ++
> + The following bugs are resolved with this release:
> +
> +   [12031] localedata: iconv -t ascii//translit with Greek characters
> +diff --git a/sunrpc/Makefile b/sunrpc/Makefile
> +index d5840d0770..321024c74a 100644
> +--- a/sunrpc/Makefile
> ++++ b/sunrpc/Makefile
> +@@ -95,7 +95,7 @@ others +=3D rpcgen
> + endif
> +
> + tests =3D tst-xdrmem tst-xdrmem2 test-rpcent tst-udp-error tst-udp-time=
out \
> +-  tst-udp-nonblocking
> ++  tst-udp-nonblocking tst-bug28768
> + xtests :=3D tst-getmyaddr
> +
> + ifeq ($(have-thread-library),yes)
> +diff --git a/sunrpc/svc_unix.c b/sunrpc/svc_unix.c
> +index e01afeabe6..b065d6063a 100644
> +--- a/sunrpc/svc_unix.c
> ++++ b/sunrpc/svc_unix.c
> +@@ -154,7 +154,10 @@ svcunix_create (int sock, u_int sendsize, u_int rec=
vsize, char *path)
> +   SVCXPRT *xprt;
> +   struct unix_rendezvous *r;
> +   struct sockaddr_un addr;
> +-  socklen_t len =3D sizeof (struct sockaddr_in);
> ++  socklen_t len =3D sizeof (addr);
> ++
> ++  if (__sockaddr_un_set (&addr, path) < 0)
> ++    return NULL;
> +
> +   if (sock =3D=3D RPC_ANYSOCK)
> +     {
> +@@ -165,12 +168,6 @@ svcunix_create (int sock, u_int sendsize, u_int rec=
vsize, char *path)
> +       }
> +       madesock =3D TRUE;
> +     }
> +-  memset (&addr, '\0', sizeof (addr));
> +-  addr.sun_family =3D AF_UNIX;
> +-  len =3D strlen (path) + 1;
> +-  memcpy (addr.sun_path, path, len);
> +-  len +=3D sizeof (addr.sun_family);
> +-
> +   __bind (sock, (struct sockaddr *) &addr, len);
> +
> +   if (__getsockname (sock, (struct sockaddr *) &addr, &len) !=3D 0
> +--
> +2.26.2
> +
> --
> 2.20.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161060): https://lists.openembedded.org/g/openembedde=
d-core/message/161060
> Mute This Topic: https://lists.openembedded.org/mt/88734156/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


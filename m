Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54C2E75459
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 18:08:44 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.115756.1696356516559930917
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 11:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zYkE9+r6;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53829312d12so201555a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 11:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696356515; x=1696961315; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QHqe8cUl787iM2JgvAGMhLXCpatsneOEHqCvJbbdyQ=;
        b=zYkE9+r6SVPVuFBw6Pq74lKRKklq61JBcHAkmAvZpcqZx+vZnKWNXqpFHTw9gVSLGf
         R0DUTi4Xoz0Lr9o29XjoPeVIObYV7agRINnKOotjg7AgP4+VmwtJmVZyhGNuYwsXtDIv
         +gb54yLLrv6ZcrbvOXk5t+xTZIC/cdAVVgcS0cfRAGtMW3EISD2AS7zIK90+pwhKRaxT
         +NZW7VWw1EsU6Czdmj/aQtLYwwcLrJqYaKFTzPds9//X5yBFYjQFC9KWGs7OA9uP7AIG
         Ji1o6gow3i9ALGyXX6p4tlZNgqfoV6ktZjGOvnTRQYUAd6RoILnUQUSTTxO2WfqKKACJ
         /zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696356515; x=1696961315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QHqe8cUl787iM2JgvAGMhLXCpatsneOEHqCvJbbdyQ=;
        b=Y0/VHqyoJv2Md6Jx8wrvHDf2SFa93thiQERC3omXCc/EixmXQhGdF97yHLY3REHmAR
         4QvF2QJfJci1XFBSFUfdHhl/z7lrh6kF2UStEiqahUb8hUsHbmFTHGgOFLr8ADeSDKzp
         5yAdYn0uGm/OLuzZnIq1cWXgupYSE4/nSM3POA/LDRbIXIvdCYq9kTa90AC1ctY843Nw
         sMduE4jQWoHbskLObm/sLtuBfXHoBKajmFw/M/whXzWmdm+H9WeCuAQcSXKapZ+k2Rvr
         YmZ+hNQ5XNNYfd5h++HtKkQuCxH3qfA9M5pAR5gJ1jGSH95hNxlU/A9I8jIf/j5c7zOC
         9pqQ==
X-Gm-Message-State: AOJu0Yw7KmDCk0gkyZ6mcHhQ5Vgya5CoqJAJtewS99wvNtCYKtDfuhzR
	CSJbogFFIZH6ctF0ABChKqIHmxPkaZnVcrAvSDCJvQ==
X-Google-Smtp-Source: AGHT+IEwmOkGMxfJ3kg12h8RQP1KvqPkLfwNJJGYWNf5QLdWElHjrVQxxMF6N2HM39GBUg14rU0RNfqqstjFB/4OykQ=
X-Received: by 2002:a17:907:78c4:b0:9a2:1e14:86b9 with SMTP id
 kv4-20020a17090778c400b009a21e1486b9mr63861ejc.0.1696356514251; Tue, 03 Oct
 2023 11:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231003112955.3031051-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20231003112955.3031051-1-Deepthi.Hemraj@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 3 Oct 2023 08:08:22 -1000
Message-ID: <CAOSpxdZLgu7R0AEz4Cj2m_LcVzGE=P2p3G58WUjMYfuGxhnGyw@mail.gmail.com>
Subject: Re: [mickledore][PATCH] glibc: Fix CVE-2023-5156
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Umesh.Kalappa@windriver.com, Naveen.Gowda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 18:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188648

Unfortunately this patch doesn't apply (even after I edited for the
previous addition of glibc: fix CVE-2023-4806

ERROR: glibc-2.37-r1 do_patch: Applying patch
'0024-CVE-2023-5156-1.patch' on target directory
'/home/steve/builds/poky-contrib-mickledore/build/tmp/work/core2-64-poky-li=
nux/glibc/2.37-r1/git'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-mickledore/build/tmp/work/core2-64-poky-lin=
ux/glibc/2.37-r1/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch 0024-CVE-2023-5156-1.patch
patching file nss/Makefile
Hunk #1 FAILED at 82.
Hunk #2 FAILED at 145.
Hunk #3 FAILED at 180.
Hunk #4 FAILED at 195.
Hunk #5 FAILED at 215.
5 out of 5 hunks FAILED -- rejects in file nss/Makefile
The next patch would create the file nss/nss_test_gai_hv2_canonname.c,
which already exists!  Applying it anyway.
patching file nss/nss_test_gai_hv2_canonname.c
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file nss/nss_test_gai_hv2_canonname.c
The next patch would create the file nss/tst-nss-gai-hv2-canonname.c,
which already exists!  Applying it anyway.
patching file nss/tst-nss-gai-hv2-canonname.c
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file nss/tst-nss-gai-hv2-canonname.c
The next patch would create the file nss/tst-nss-gai-hv2-canonname.h,
which already exists!  Applying it anyway.
patching file nss/tst-nss-gai-hv2-canonname.h
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file nss/tst-nss-gai-hv2-canonname.h
The next patch would empty out the file
nss/tst-nss-gai-hv2-canonname.root/postclean.req,
which is already empty!  Applying it anyway.
patching file nss/tst-nss-gai-hv2-canonname.root/postclean.req
The next patch would create the file
nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script,
which already exists!  Applying it anyway.
patching file nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.=
script
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file
nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
patching file sysdeps/posix/getaddrinfo.c
Hunk #1 FAILED at 120.
Hunk #2 FAILED at 165.
Hunk #3 FAILED at 203.
Hunk #4 succeeded at 248 with fuzz 2 (offset 10 lines).
Hunk #5 FAILED at 271.
Hunk #6 FAILED at 333.
Hunk #7 FAILED at 780.
6 out of 7 hunks FAILED -- rejects in file sysdeps/posix/getaddrinfo.c
Patch 0024-CVE-2023-5156-1.patch can be reverse-applied

Steve

On Tue, Oct 3, 2023 at 1:30=E2=80=AFAM <Deepthi.Hemraj@windriver.com> wrote=
:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  .../glibc/glibc/0024-CVE-2023-5156-1.patch    | 329 ++++++++++++++++++
>  .../glibc/glibc/0024-CVE-2023-5156-2.patch    |  93 +++++
>  meta/recipes-core/glibc/glibc_2.37.bb         |   2 +
>  3 files changed, 424 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.pa=
tch
>  create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.pa=
tch
>
> diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.patch b/m=
eta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.patch
> new file mode 100644
> index 0000000000..65afaa446a
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-1.patch
> @@ -0,0 +1,329 @@
> +From: Siddhesh Poyarekar <siddhesh@sourceware.org>
> +Date: Fri, 15 Sep 2023 17:51:12 +0000 (-0400)
> +Subject: getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
> +X-Git-Url: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff_plai=
n;h=3D973fe93a5675c42798b2161c6f29c01b0e243994
> +
> +getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
> +
> +When an NSS plugin only implements the _gethostbyname2_r and
> +_getcanonname_r callbacks, getaddrinfo could use memory that was freed
> +during tmpbuf resizing, through h_name in a previous query response.
> +
> +The backing store for res->at->name when doing a query with
> +gethostbyname3_r or gethostbyname2_r is tmpbuf, which is reallocated in
> +gethosts during the query.  For AF_INET6 lookup with AI_ALL |
> +AI_V4MAPPED, gethosts gets called twice, once for a v6 lookup and second
> +for a v4 lookup.  In this case, if the first call reallocates tmpbuf
> +enough number of times, resulting in a malloc, th->h_name (that
> +res->at->name refers to) ends up on a heap allocated storage in tmpbuf.
> +Now if the second call to gethosts also causes the plugin callback to
> +return NSS_STATUS_TRYAGAIN, tmpbuf will get freed, resulting in a UAF
> +reference in res->at->name.  This then gets dereferenced in the
> +getcanonname_r plugin call, resulting in the use after free.
> +
> +Fix this by copying h_name over and freeing it at the end.  This
> +resolves BZ #30843, which is assigned CVE-2023-4806.
> +
> +Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dcommitdiff_plain;h=3D973fe93a5675c42798b2161c6f29c01b0e243994]
> +
> +CVE: CVE-2023-5156
> +
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +
> +---
> +
> +diff --git a/nss/Makefile b/nss/Makefile
> +index 06fcdc450f..8a5126ecf3 100644
> +--- a/nss/Makefile
> ++++ b/nss/Makefile
> +@@ -82,6 +82,7 @@ tests-container :=3D \
> +   tst-nss-test3 \
> +   tst-reload1 \
> +   tst-reload2 \
> ++  tst-nss-gai-hv2-canonname \
> + # tests-container
> +
> + # Tests which need libdl
> +@@ -145,7 +146,8 @@ libnss_compat-inhibit-o    =3D $(filter-out .os,$(ob=
ject-suffixes))
> + ifeq ($(build-static-nss),yes)
> + tests-static          +=3D tst-nss-static
> + endif
> +-extra-test-objs               +=3D nss_test1.os nss_test2.os nss_test_e=
rrno.os
> ++extra-test-objs               +=3D nss_test1.os nss_test2.os nss_test_e=
rrno.os \
> ++                         nss_test_gai_hv2_canonname.os
> +
> + include ../Rules
> +
> +@@ -180,12 +182,16 @@ rtld-tests-LDFLAGS +=3D -Wl,--dynamic-list=3Dnss_t=
est.ver
> + libof-nss_test1 =3D extramodules
> + libof-nss_test2 =3D extramodules
> + libof-nss_test_errno =3D extramodules
> ++libof-nss_test_gai_hv2_canonname =3D extramodules
> + $(objpfx)/libnss_test1.so: $(objpfx)nss_test1.os $(link-libc-deps)
> +       $(build-module)
> + $(objpfx)/libnss_test2.so: $(objpfx)nss_test2.os $(link-libc-deps)
> +       $(build-module)
> + $(objpfx)/libnss_test_errno.so: $(objpfx)nss_test_errno.os $(link-libc-=
deps)
> +       $(build-module)
> ++$(objpfx)/libnss_test_gai_hv2_canonname.so: \
> ++  $(objpfx)nss_test_gai_hv2_canonname.os $(link-libc-deps)
> ++      $(build-module)
> + $(objpfx)nss_test2.os : nss_test1.c
> + # Use the nss_files suffix for these objects as well.
> + $(objpfx)/libnss_test1.so$(libnss_files.so-version): $(objpfx)/libnss_t=
est1.so
> +@@ -195,10 +201,14 @@ $(objpfx)/libnss_test2.so$(libnss_files.so-version=
): $(objpfx)/libnss_test2.so
> + $(objpfx)/libnss_test_errno.so$(libnss_files.so-version): \
> +   $(objpfx)/libnss_test_errno.so
> +       $(make-link)
> ++$(objpfx)/libnss_test_gai_hv2_canonname.so$(libnss_files.so-version): \
> ++  $(objpfx)/libnss_test_gai_hv2_canonname.so
> ++      $(make-link)
> + $(patsubst %,$(objpfx)%.out,$(tests) $(tests-container)) : \
> +       $(objpfx)/libnss_test1.so$(libnss_files.so-version) \
> +       $(objpfx)/libnss_test2.so$(libnss_files.so-version) \
> +-      $(objpfx)/libnss_test_errno.so$(libnss_files.so-version)
> ++      $(objpfx)/libnss_test_errno.so$(libnss_files.so-version) \
> ++      $(objpfx)/libnss_test_gai_hv2_canonname.so$(libnss_files.so-versi=
on)
> +
> + ifeq (yes,$(have-thread-library))
> + $(objpfx)tst-cancel-getpwuid_r: $(shared-thread-library)
> +@@ -215,3 +225,4 @@ LDFLAGS-tst-nss-test3 =3D -Wl,--disable-new-dtags
> + LDFLAGS-tst-nss-test4 =3D -Wl,--disable-new-dtags
> + LDFLAGS-tst-nss-test5 =3D -Wl,--disable-new-dtags
> + LDFLAGS-tst-nss-test_errno =3D -Wl,--disable-new-dtags
> ++LDFLAGS-tst-nss-test_gai_hv2_canonname =3D -Wl,--disable-new-dtags
> +diff --git a/nss/nss_test_gai_hv2_canonname.c b/nss/nss_test_gai_hv2_can=
onname.c
> +new file mode 100644
> +index 0000000000..4439c83c9f
> +--- /dev/null
> ++++ b/nss/nss_test_gai_hv2_canonname.c
> +@@ -0,0 +1,56 @@
> ++/* NSS service provider that only provides gethostbyname2_r.
> ++   Copyright The GNU Toolchain Authors.
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
> ++#include <nss.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++#include "nss/tst-nss-gai-hv2-canonname.h"
> ++
> ++/* Catch misnamed and functions.  */
> ++#pragma GCC diagnostic error "-Wmissing-prototypes"
> ++NSS_DECLARE_MODULE_FUNCTIONS (test_gai_hv2_canonname)
> ++
> ++extern enum nss_status _nss_files_gethostbyname2_r (const char *, int,
> ++                                                  struct hostent *, cha=
r *,
> ++                                                  size_t, int *, int *)=
;
> ++
> ++enum nss_status
> ++_nss_test_gai_hv2_canonname_gethostbyname2_r (const char *name, int af,
> ++                                            struct hostent *result,
> ++                                            char *buffer, size_t buflen=
,
> ++                                            int *errnop, int *herrnop)
> ++{
> ++  return _nss_files_gethostbyname2_r (name, af, result, buffer, buflen,=
 errnop,
> ++                                    herrnop);
> ++}
> ++
> ++enum nss_status
> ++_nss_test_gai_hv2_canonname_getcanonname_r (const char *name, char *buf=
fer,
> ++                                          size_t buflen, char **result,
> ++                                          int *errnop, int *h_errnop)
> ++{
> ++  /* We expect QUERYNAME, which is a small enough string that it should=
n't fail
> ++     the test.  */
> ++  if (memcmp (QUERYNAME, name, sizeof (QUERYNAME))
> ++      || buflen < sizeof (QUERYNAME))
> ++    abort ();
> ++
> ++  strncpy (buffer, name, buflen);
> ++  *result =3D buffer;
> ++  return NSS_STATUS_SUCCESS;
> ++}
> +diff --git a/nss/tst-nss-gai-hv2-canonname.c b/nss/tst-nss-gai-hv2-canon=
name.c
> +new file mode 100644
> +index 0000000000..d5f10c07d6
> +--- /dev/null
> ++++ b/nss/tst-nss-gai-hv2-canonname.c
> +@@ -0,0 +1,63 @@
> ++/* Test NSS query path for plugins that only implement gethostbyname2
> ++   (#30843).
> ++   Copyright The GNU Toolchain Authors.
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
> ++#include <nss.h>
> ++#include <netdb.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++#include <support/check.h>
> ++#include <support/xstdio.h>
> ++#include "nss/tst-nss-gai-hv2-canonname.h"
> ++
> ++#define PREPARE do_prepare
> ++
> ++static void do_prepare (int a, char **av)
> ++{
> ++  FILE *hosts =3D xfopen ("/etc/hosts", "w");
> ++  for (unsigned i =3D 2; i < 255; i++)
> ++    {
> ++      fprintf (hosts, "ff01::ff02:ff03:%u:2\ttest.example.com\n", i);
> ++      fprintf (hosts, "192.168.0.%u\ttest.example.com\n", i);
> ++    }
> ++  xfclose (hosts);
> ++}
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  __nss_configure_lookup ("hosts", "test_gai_hv2_canonname");
> ++
> ++  struct addrinfo hints =3D {};
> ++  struct addrinfo *result =3D NULL;
> ++
> ++  hints.ai_family =3D AF_INET6;
> ++  hints.ai_flags =3D AI_ALL | AI_V4MAPPED | AI_CANONNAME;
> ++
> ++  int ret =3D getaddrinfo (QUERYNAME, NULL, &hints, &result);
> ++
> ++  if (ret !=3D 0)
> ++    FAIL_EXIT1 ("getaddrinfo failed: %s\n", gai_strerror (ret));
> ++
> ++  TEST_COMPARE_STRING (result->ai_canonname, QUERYNAME);
> ++
> ++  freeaddrinfo(result);
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +diff --git a/nss/tst-nss-gai-hv2-canonname.h b/nss/tst-nss-gai-hv2-canon=
name.h
> +new file mode 100644
> +index 0000000000..14f2a9cb08
> +--- /dev/null
> ++++ b/nss/tst-nss-gai-hv2-canonname.h
> +@@ -0,0 +1 @@
> ++#define QUERYNAME "test.example.com"
> +diff --git a/nss/tst-nss-gai-hv2-canonname.root/postclean.req b/nss/tst-=
nss-gai-hv2-canonname.root/postclean.req
> +new file mode 100644
> +index 0000000000..e69de29bb2
> +diff --git a/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonnam=
e.script b/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.scr=
ipt
> +new file mode 100644
> +index 0000000000..31848b4a28
> +--- /dev/null
> ++++ b/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.scrip=
t
> +@@ -0,0 +1,2 @@
> ++cp $B/nss/libnss_test_gai_hv2_canonname.so $L/libnss_test_gai_hv2_canon=
name.so.2
> ++su
> +diff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c
> +index 6ae6744fe4..47f421fddf 100644
> +--- a/sysdeps/posix/getaddrinfo.c
> ++++ b/sysdeps/posix/getaddrinfo.c
> +@@ -120,6 +120,7 @@ struct gaih_result
> + {
> +   struct gaih_addrtuple *at;
> +   char *canon;
> ++  char *h_name;
> +   bool free_at;
> +   bool got_ipv6;
> + };
> +@@ -165,6 +166,7 @@ gaih_result_reset (struct gaih_result *res)
> +   if (res->free_at)
> +     free (res->at);
> +   free (res->canon);
> ++  free (res->h_name);
> +   memset (res, 0, sizeof (*res));
> + }
> +
> +@@ -203,9 +205,8 @@ gaih_inet_serv (const char *servicename, const struc=
t gaih_typeproto *tp,
> +   return 0;
> + }
> +
> +-/* Convert struct hostent to a list of struct gaih_addrtuple objects.  =
h_name
> +-   is not copied, and the struct hostent object must not be deallocated
> +-   prematurely.  The new addresses are appended to the tuple array in R=
ES.  */
> ++/* Convert struct hostent to a list of struct gaih_addrtuple objects.  =
The new
> ++   addresses are appended to the tuple array in RES.  */
> + static bool
> + convert_hostent_to_gaih_addrtuple (const struct addrinfo *req, int fami=
ly,
> +                                  struct hostent *h, struct gaih_result =
*res)
> +@@ -238,6 +239,15 @@ convert_hostent_to_gaih_addrtuple (const struct add=
rinfo *req, int family,
> +   res->at =3D array;
> +   res->free_at =3D true;
> +
> ++  /* Duplicate h_name because it may get reclaimed when the underlying =
storage
> ++     is freed.  */
> ++  if (res->h_name =3D=3D NULL)
> ++    {
> ++      res->h_name =3D __strdup (h->h_name);
> ++      if (res->h_name =3D=3D NULL)
> ++      return false;
> ++    }
> ++
> +   /* Update the next pointers on reallocation.  */
> +   for (size_t i =3D 0; i < old; i++)
> +     array[i].next =3D array + i + 1;
> +@@ -262,7 +272,6 @@ convert_hostent_to_gaih_addrtuple (const struct addr=
info *req, int family,
> +       }
> +       array[i].next =3D array + i + 1;
> +     }
> +-  array[0].name =3D h->h_name;
> +   array[count - 1].next =3D NULL;
> +
> +   return true;
> +@@ -324,15 +333,15 @@ gethosts (nss_gethostbyname3_r fct, int family, co=
nst char *name,
> +    memory allocation failure.  The returned string is allocated on the
> +    heap; the caller has to free it.  */
> + static char *
> +-getcanonname (nss_action_list nip, struct gaih_addrtuple *at, const cha=
r *name)
> ++getcanonname (nss_action_list nip, const char *hname, const char *name)
> + {
> +   nss_getcanonname_r *cfct =3D __nss_lookup_function (nip, "getcanonnam=
e_r");
> +   char *s =3D (char *) name;
> +   if (cfct !=3D NULL)
> +     {
> +       char buf[256];
> +-      if (DL_CALL_FCT (cfct, (at->name ?: name, buf, sizeof (buf),
> +-                            &s, &errno, &h_errno)) !=3D NSS_STATUS_SUCC=
ESS)
> ++      if (DL_CALL_FCT (cfct, (hname ?: name, buf, sizeof (buf), &s, &er=
rno,
> ++                            &h_errno)) !=3D NSS_STATUS_SUCCESS)
> +       /* If the canonical name cannot be determined, use the passed
> +          string.  */
> +       s =3D (char *) name;
> +@@ -771,7 +780,7 @@ get_nss_addresses (const char *name, const struct ad=
drinfo *req,
> +                 if ((req->ai_flags & AI_CANONNAME) !=3D 0
> +                     && res->canon =3D=3D NULL)
> +                   {
> +-                    char *canonbuf =3D getcanonname (nip, res->at, name=
);
> ++                    char *canonbuf =3D getcanonname (nip, res->h_name, =
name);
> +                     if (canonbuf =3D=3D NULL)
> +                       {
> +                         __resolv_context_put (res_ctx);
> diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch b/m=
eta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch
> new file mode 100644
> index 0000000000..507db5e13b
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0024-CVE-2023-5156-2.patch
> @@ -0,0 +1,93 @@
> +From: Romain Geissler <romain.geissler@amadeus.com>
> +Date: Mon, 25 Sep 2023 00:21:51 +0000 (+0100)
> +Subject: Fix leak in getaddrinfo introduced by the fix for CVE-2023-4806=
 [BZ #30843]
> +X-Git-Url: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff_plai=
n;h=3Dec6b95c3303c700eb89eebeda2d7264cc184a796
> +
> +Fix leak in getaddrinfo introduced by the fix for CVE-2023-4806 [BZ #308=
43]
> +
> +This patch fixes a very recently added leak in getaddrinfo.
> +
> +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dcommitdiff_plain;h=3Dec6b95c3303c700eb89eebeda2d7264cc184a796]
> +
> +CVE: CVE-2023-5156
> +
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +
> +---
> +
> +diff --git a/nss/Makefile b/nss/Makefile
> +index 8a5126ecf3..668ba34b18 100644
> +--- a/nss/Makefile
> ++++ b/nss/Makefile
> +@@ -149,6 +149,15 @@ endif
> + extra-test-objs               +=3D nss_test1.os nss_test2.os nss_test_e=
rrno.os \
> +                          nss_test_gai_hv2_canonname.os
> +
> ++ifeq ($(run-built-tests),yes)
> ++ifneq (no,$(PERL))
> ++tests-special +=3D $(objpfx)mtrace-tst-nss-gai-hv2-canonname.out
> ++endif
> ++endif
> ++
> ++generated +=3D mtrace-tst-nss-gai-hv2-canonname.out \
> ++              tst-nss-gai-hv2-canonname.mtrace
> ++
> + include ../Rules
> +
> + ifeq (yes,$(have-selinux))
> +@@ -217,6 +226,17 @@ endif
> + $(objpfx)tst-nss-files-alias-leak.out: $(objpfx)/libnss_files.so
> + $(objpfx)tst-nss-files-alias-truncated.out: $(objpfx)/libnss_files.so
> +
> ++tst-nss-gai-hv2-canonname-ENV =3D \
> ++              MALLOC_TRACE=3D$(objpfx)tst-nss-gai-hv2-canonname.mtrace =
\
> ++              LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
> ++$(objpfx)mtrace-tst-nss-gai-hv2-canonname.out: \
> ++  $(objpfx)tst-nss-gai-hv2-canonname.out
> ++      { test -r $(objpfx)tst-nss-gai-hv2-canonname.mtrace \
> ++      || ( echo "tst-nss-gai-hv2-canonname.mtrace does not exist"; exit=
 77; ) \
> ++      && $(common-objpfx)malloc/mtrace \
> ++      $(objpfx)tst-nss-gai-hv2-canonname.mtrace; } > $@; \
> ++      $(evaluate-test)
> ++
> + # Disable DT_RUNPATH on NSS tests so that the glibc internal NSS
> + # functions can load testing NSS modules via DT_RPATH.
> + LDFLAGS-tst-nss-test1 =3D -Wl,--disable-new-dtags
> +diff --git a/nss/tst-nss-gai-hv2-canonname.c b/nss/tst-nss-gai-hv2-canon=
name.c
> +index d5f10c07d6..7db53cf09d 100644
> +--- a/nss/tst-nss-gai-hv2-canonname.c
> ++++ b/nss/tst-nss-gai-hv2-canonname.c
> +@@ -21,6 +21,7 @@
> + #include <netdb.h>
> + #include <stdlib.h>
> + #include <string.h>
> ++#include <mcheck.h>
> + #include <support/check.h>
> + #include <support/xstdio.h>
> + #include "nss/tst-nss-gai-hv2-canonname.h"
> +@@ -41,6 +42,8 @@ static void do_prepare (int a, char **av)
> + static int
> + do_test (void)
> + {
> ++  mtrace ();
> ++
> +   __nss_configure_lookup ("hosts", "test_gai_hv2_canonname");
> +
> +   struct addrinfo hints =3D {};
> +diff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c
> +index 47f421fddf..531124958d 100644
> +--- a/sysdeps/posix/getaddrinfo.c
> ++++ b/sysdeps/posix/getaddrinfo.c
> +@@ -1196,9 +1196,7 @@ free_and_return:
> +   if (malloc_name)
> +     free ((char *) name);
> +   free (addrmem);
> +-  if (res.free_at)
> +-    free (res.at);
> +-  free (res.canon);
> ++  gaih_result_reset (&res);
> +
> +   return result;
> + }
> diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/gl=
ibc/glibc_2.37.bb
> index caf454f368..b88bc5fc4f 100644
> --- a/meta/recipes-core/glibc/glibc_2.37.bb
> +++ b/meta/recipes-core/glibc/glibc_2.37.bb
> @@ -50,6 +50,8 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
>             file://0021-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
>             file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bi=
nar.patch \
>             file://0023-CVE-2023-4527.patch \
> +           file://0024-CVE-2023-5156-1.patch \
> +           file://0024-CVE-2023-5156-2.patch \
>  "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.39.0
>


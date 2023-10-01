Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C579E748F5
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:25 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.62414.1696176020833234974
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1X/nuAib;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c3d6d88231so116242745ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176020; x=1696780820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2v1HEVofZGGnK31uPlU8I8ZvGbNvw95K+yME+l4CW28=;
        b=1X/nuAibTr2GKw5kcYAjC3WNbkoVl1YHd8rkxmGTXLfF2Pnuf/xIPnrZWLDW+EVndu
         UiveObWyufSJRHedxd9jYek5fbzhw16aVXtB9dHELJb3TU4BM7e/3tB0nuRg88NFYLUZ
         5QRbO3iNZAKKwEMIXfxPkvNT2lbsXdHHciArFoTQn0nVmuPYOAqVkvTucytQQc8iyLaK
         i2VX8yGlpSs/ztGYV37IC27wz2imdP7IInDysxxbNS/6N6MOfO0YsJrtNpsP5W71CPgG
         Z39O28ygMprk+9EIA2HtruHZmMlD7leWItMB8FBU4yXVIWhhPDGwduIm79ZAMg9oYiEr
         jleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176020; x=1696780820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v1HEVofZGGnK31uPlU8I8ZvGbNvw95K+yME+l4CW28=;
        b=wzec8r0vIXcbAn/E7CsWKGiIqE5gVn1pJi50N1vGFLtIeO4Yr5aU+pm5ATM2hgl0hI
         8T7Wp0QDam2Sya1MagiysZK1CswRfz8UYln5u9Y5D2ehF9Br1KoflZL0lpB6tWzsXjCe
         yyIJ5Vg0095C/P0ZUasA107c6/Tqwk+Ec9Iwdy88Wu926AHnyQvm8SUygaU+J9D85qET
         tuvvixYR5Zf+wuxxWpo1kNAklxqqmv6NjPTIMeD3Ehn7XNAF7g/2l49HvVpYbtvi8Kmx
         VwZHs2PpCOuP5vSO/jzDh8rVk5pHxmy3tQj3glm1ATAbZ39kKqpCwWB5Q7cbpyHxiI9f
         lohQ==
X-Gm-Message-State: AOJu0YxGArZcx/KhsxITK+YPFsOTcKx7LCH0snHomD4jEngSaXLIe1/L
	Gzsot6qQ5Tit4W+Lt9I/aXvzHdfYPRRe8ovbnqp6Yg==
X-Google-Smtp-Source: AGHT+IF822XQDbA+SptH0jPDcQYItW8pshr9rSydbbi12cJJ83ZtogO2DDZvRJDt4qU70GDC3wCfow==
X-Received: by 2002:a17:902:d507:b0:1c7:6cf5:c655 with SMTP id b7-20020a170902d50700b001c76cf5c655mr686939plg.51.1696176019515;
        Sun, 01 Oct 2023 09:00:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/23] glibc: fix CVE-2023-4806
Date: Sun,  1 Oct 2023 05:59:48 -1000
Message-Id: <7591adeb37f9156266ef98b639073e986e3a49f5.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188490

From: Yash Shinde <Yash.Shinde@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=973fe93a5675c42798b2161c6f29c01b0e243994]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0024-CVE-2023-4806.patch      | 342 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.37.bb         |   1 +
 2 files changed, 343 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch
new file mode 100644
index 0000000000..42d91fd340
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch
@@ -0,0 +1,342 @@
+From 973fe93a5675c42798b2161c6f29c01b0e243994 Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Date: Fri, 15 Sep 2023 13:51:12 -0400
+Subject: [PATCH] getaddrinfo: Fix use after free in getcanonname
+ (CVE-2023-4806)
+
+When an NSS plugin only implements the _gethostbyname2_r and
+_getcanonname_r callbacks, getaddrinfo could use memory that was freed
+during tmpbuf resizing, through h_name in a previous query response.
+
+The backing store for res->at->name when doing a query with
+gethostbyname3_r or gethostbyname2_r is tmpbuf, which is reallocated in
+gethosts during the query.  For AF_INET6 lookup with AI_ALL |
+AI_V4MAPPED, gethosts gets called twice, once for a v6 lookup and second
+for a v4 lookup.  In this case, if the first call reallocates tmpbuf
+enough number of times, resulting in a malloc, th->h_name (that
+res->at->name refers to) ends up on a heap allocated storage in tmpbuf.
+Now if the second call to gethosts also causes the plugin callback to
+return NSS_STATUS_TRYAGAIN, tmpbuf will get freed, resulting in a UAF
+reference in res->at->name.  This then gets dereferenced in the
+getcanonname_r plugin call, resulting in the use after free.
+
+Fix this by copying h_name over and freeing it at the end.  This
+resolves BZ #30843, which is assigned CVE-2023-4806.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=973fe93a5675c42798b2161c6f29c01b0e243994]
+CVE: CVE-2023-4806
+
+Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+ nss/Makefile                                  | 15 ++++-
+ nss/nss_test_gai_hv2_canonname.c              | 56 +++++++++++++++++
+ nss/tst-nss-gai-hv2-canonname.c               | 63 +++++++++++++++++++
+ nss/tst-nss-gai-hv2-canonname.h               |  1 +
+ .../postclean.req                             |  0
+ .../tst-nss-gai-hv2-canonname.script          |  2 +
+ sysdeps/posix/getaddrinfo.c                   | 25 +++++---
+ 7 files changed, 152 insertions(+), 10 deletions(-)
+ create mode 100644 nss/nss_test_gai_hv2_canonname.c
+ create mode 100644 nss/tst-nss-gai-hv2-canonname.c
+ create mode 100644 nss/tst-nss-gai-hv2-canonname.h
+ create mode 100644 nss/tst-nss-gai-hv2-canonname.root/postclean.req
+ create mode 100644 nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
+
+diff --git a/nss/Makefile b/nss/Makefile
+index 06fcdc450f..8a5126ecf3 100644
+--- a/nss/Makefile
++++ b/nss/Makefile
+@@ -82,6 +82,7 @@ tests-container := \
+   tst-nss-test3 \
+   tst-reload1 \
+   tst-reload2 \
++  tst-nss-gai-hv2-canonname \
+ # tests-container
+
+ # Tests which need libdl
+@@ -145,7 +146,8 @@ libnss_compat-inhibit-o	= $(filter-out .os,$(object-suffixes))
+ ifeq ($(build-static-nss),yes)
+ tests-static		+= tst-nss-static
+ endif
+-extra-test-objs		+= nss_test1.os nss_test2.os nss_test_errno.os
++extra-test-objs		+= nss_test1.os nss_test2.os nss_test_errno.os \
++			   nss_test_gai_hv2_canonname.os
+
+ include ../Rules
+
+@@ -180,12 +182,16 @@ rtld-tests-LDFLAGS += -Wl,--dynamic-list=nss_test.ver
+ libof-nss_test1 = extramodules
+ libof-nss_test2 = extramodules
+ libof-nss_test_errno = extramodules
++libof-nss_test_gai_hv2_canonname = extramodules
+ $(objpfx)/libnss_test1.so: $(objpfx)nss_test1.os $(link-libc-deps)
+	$(build-module)
+ $(objpfx)/libnss_test2.so: $(objpfx)nss_test2.os $(link-libc-deps)
+	$(build-module)
+ $(objpfx)/libnss_test_errno.so: $(objpfx)nss_test_errno.os $(link-libc-deps)
+	$(build-module)
++$(objpfx)/libnss_test_gai_hv2_canonname.so: \
++  $(objpfx)nss_test_gai_hv2_canonname.os $(link-libc-deps)
++	$(build-module)
+ $(objpfx)nss_test2.os : nss_test1.c
+ # Use the nss_files suffix for these objects as well.
+ $(objpfx)/libnss_test1.so$(libnss_files.so-version): $(objpfx)/libnss_test1.so
+@@ -195,10 +201,14 @@ $(objpfx)/libnss_test2.so$(libnss_files.so-version): $(objpfx)/libnss_test2.so
+ $(objpfx)/libnss_test_errno.so$(libnss_files.so-version): \
+   $(objpfx)/libnss_test_errno.so
+	$(make-link)
++$(objpfx)/libnss_test_gai_hv2_canonname.so$(libnss_files.so-version): \
++  $(objpfx)/libnss_test_gai_hv2_canonname.so
++	$(make-link)
+ $(patsubst %,$(objpfx)%.out,$(tests) $(tests-container)) : \
+	$(objpfx)/libnss_test1.so$(libnss_files.so-version) \
+	$(objpfx)/libnss_test2.so$(libnss_files.so-version) \
+-	$(objpfx)/libnss_test_errno.so$(libnss_files.so-version)
++	$(objpfx)/libnss_test_errno.so$(libnss_files.so-version) \
++	$(objpfx)/libnss_test_gai_hv2_canonname.so$(libnss_files.so-version)
+
+ ifeq (yes,$(have-thread-library))
+ $(objpfx)tst-cancel-getpwuid_r: $(shared-thread-library)
+@@ -215,3 +225,4 @@ LDFLAGS-tst-nss-test3 = -Wl,--disable-new-dtags
+ LDFLAGS-tst-nss-test4 = -Wl,--disable-new-dtags
+ LDFLAGS-tst-nss-test5 = -Wl,--disable-new-dtags
+ LDFLAGS-tst-nss-test_errno = -Wl,--disable-new-dtags
++LDFLAGS-tst-nss-test_gai_hv2_canonname = -Wl,--disable-new-dtags
+diff --git a/nss/nss_test_gai_hv2_canonname.c b/nss/nss_test_gai_hv2_canonname.c
+new file mode 100644
+index 0000000000..4439c83c9f
+--- /dev/null
++++ b/nss/nss_test_gai_hv2_canonname.c
+@@ -0,0 +1,56 @@
++/* NSS service provider that only provides gethostbyname2_r.
++   Copyright The GNU Toolchain Authors.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <nss.h>
++#include <stdlib.h>
++#include <string.h>
++#include "nss/tst-nss-gai-hv2-canonname.h"
++
++/* Catch misnamed and functions.  */
++#pragma GCC diagnostic error "-Wmissing-prototypes"
++NSS_DECLARE_MODULE_FUNCTIONS (test_gai_hv2_canonname)
++
++extern enum nss_status _nss_files_gethostbyname2_r (const char *, int,
++						    struct hostent *, char *,
++						    size_t, int *, int *);
++
++enum nss_status
++_nss_test_gai_hv2_canonname_gethostbyname2_r (const char *name, int af,
++					      struct hostent *result,
++					      char *buffer, size_t buflen,
++					      int *errnop, int *herrnop)
++{
++  return _nss_files_gethostbyname2_r (name, af, result, buffer, buflen, errnop,
++				      herrnop);
++}
++
++enum nss_status
++_nss_test_gai_hv2_canonname_getcanonname_r (const char *name, char *buffer,
++					    size_t buflen, char **result,
++					    int *errnop, int *h_errnop)
++{
++  /* We expect QUERYNAME, which is a small enough string that it shouldn't fail
++     the test.  */
++  if (memcmp (QUERYNAME, name, sizeof (QUERYNAME))
++      || buflen < sizeof (QUERYNAME))
++    abort ();
++
++  strncpy (buffer, name, buflen);
++  *result = buffer;
++  return NSS_STATUS_SUCCESS;
++}
+diff --git a/nss/tst-nss-gai-hv2-canonname.c b/nss/tst-nss-gai-hv2-canonname.c
+new file mode 100644
+index 0000000000..d5f10c07d6
+--- /dev/null
++++ b/nss/tst-nss-gai-hv2-canonname.c
+@@ -0,0 +1,63 @@
++/* Test NSS query path for plugins that only implement gethostbyname2
++   (#30843).
++   Copyright The GNU Toolchain Authors.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <nss.h>
++#include <netdb.h>
++#include <stdlib.h>
++#include <string.h>
++#include <support/check.h>
++#include <support/xstdio.h>
++#include "nss/tst-nss-gai-hv2-canonname.h"
++
++#define PREPARE do_prepare
++
++static void do_prepare (int a, char **av)
++{
++  FILE *hosts = xfopen ("/etc/hosts", "w");
++  for (unsigned i = 2; i < 255; i++)
++    {
++      fprintf (hosts, "ff01::ff02:ff03:%u:2\ttest.example.com\n", i);
++      fprintf (hosts, "192.168.0.%u\ttest.example.com\n", i);
++    }
++  xfclose (hosts);
++}
++
++static int
++do_test (void)
++{
++  __nss_configure_lookup ("hosts", "test_gai_hv2_canonname");
++
++  struct addrinfo hints = {};
++  struct addrinfo *result = NULL;
++
++  hints.ai_family = AF_INET6;
++  hints.ai_flags = AI_ALL | AI_V4MAPPED | AI_CANONNAME;
++
++  int ret = getaddrinfo (QUERYNAME, NULL, &hints, &result);
++
++  if (ret != 0)
++    FAIL_EXIT1 ("getaddrinfo failed: %s\n", gai_strerror (ret));
++
++  TEST_COMPARE_STRING (result->ai_canonname, QUERYNAME);
++
++  freeaddrinfo(result);
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/nss/tst-nss-gai-hv2-canonname.h b/nss/tst-nss-gai-hv2-canonname.h
+new file mode 100644
+index 0000000000..14f2a9cb08
+--- /dev/null
++++ b/nss/tst-nss-gai-hv2-canonname.h
+@@ -0,0 +1 @@
++#define QUERYNAME "test.example.com"
+diff --git a/nss/tst-nss-gai-hv2-canonname.root/postclean.req b/nss/tst-nss-gai-hv2-canonname.root/postclean.req
+new file mode 100644
+index 0000000000..e69de29bb2
+diff --git a/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script b/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
+new file mode 100644
+index 0000000000..31848b4a28
+--- /dev/null
++++ b/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
+@@ -0,0 +1,2 @@
++cp $B/nss/libnss_test_gai_hv2_canonname.so $L/libnss_test_gai_hv2_canonname.so.2
++su
+diff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c
+index 6ae6744fe4..47f421fddf 100644
+--- a/sysdeps/posix/getaddrinfo.c
++++ b/sysdeps/posix/getaddrinfo.c
+@@ -120,6 +120,7 @@ struct gaih_result
+ {
+   struct gaih_addrtuple *at;
+   char *canon;
++  char *h_name;
+   bool free_at;
+   bool got_ipv6;
+ };
+@@ -165,6 +166,7 @@ gaih_result_reset (struct gaih_result *res)
+   if (res->free_at)
+     free (res->at);
+   free (res->canon);
++  free (res->h_name);
+   memset (res, 0, sizeof (*res));
+ }
+
+@@ -203,9 +205,8 @@ gaih_inet_serv (const char *servicename, const struct gaih_typeproto *tp,
+   return 0;
+ }
+
+-/* Convert struct hostent to a list of struct gaih_addrtuple objects.  h_name
+-   is not copied, and the struct hostent object must not be deallocated
+-   prematurely.  The new addresses are appended to the tuple array in RES.  */
++/* Convert struct hostent to a list of struct gaih_addrtuple objects.  The new
++   addresses are appended to the tuple array in RES.  */
+ static bool
+ convert_hostent_to_gaih_addrtuple (const struct addrinfo *req, int family,
+				   struct hostent *h, struct gaih_result *res)
+@@ -238,6 +239,15 @@ convert_hostent_to_gaih_addrtuple (const struct addrinfo *req, int family,
+   res->at = array;
+   res->free_at = true;
+
++  /* Duplicate h_name because it may get reclaimed when the underlying storage
++     is freed.  */
++  if (res->h_name == NULL)
++    {
++      res->h_name = __strdup (h->h_name);
++      if (res->h_name == NULL)
++	return false;
++    }
++
+   /* Update the next pointers on reallocation.  */
+   for (size_t i = 0; i < old; i++)
+     array[i].next = array + i + 1;
+@@ -262,7 +272,6 @@ convert_hostent_to_gaih_addrtuple (const struct addrinfo *req, int family,
+	}
+       array[i].next = array + i + 1;
+     }
+-  array[0].name = h->h_name;
+   array[count - 1].next = NULL;
+
+   return true;
+@@ -324,15 +333,15 @@ gethosts (nss_gethostbyname3_r fct, int family, const char *name,
+    memory allocation failure.  The returned string is allocated on the
+    heap; the caller has to free it.  */
+ static char *
+-getcanonname (nss_action_list nip, struct gaih_addrtuple *at, const char *name)
++getcanonname (nss_action_list nip, const char *hname, const char *name)
+ {
+   nss_getcanonname_r *cfct = __nss_lookup_function (nip, "getcanonname_r");
+   char *s = (char *) name;
+   if (cfct != NULL)
+     {
+       char buf[256];
+-      if (DL_CALL_FCT (cfct, (at->name ?: name, buf, sizeof (buf),
+-			      &s, &errno, &h_errno)) != NSS_STATUS_SUCCESS)
++      if (DL_CALL_FCT (cfct, (hname ?: name, buf, sizeof (buf), &s, &errno,
++			      &h_errno)) != NSS_STATUS_SUCCESS)
+	/* If the canonical name cannot be determined, use the passed
+	   string.  */
+	s = (char *) name;
+@@ -771,7 +780,7 @@ get_nss_addresses (const char *name, const struct addrinfo *req,
+		  if ((req->ai_flags & AI_CANONNAME) != 0
+		      && res->canon == NULL)
+		    {
+-		      char *canonbuf = getcanonname (nip, res->at, name);
++		      char *canonbuf = getcanonname (nip, res->h_name, name);
+		      if (canonbuf == NULL)
+			{
+			  __resolv_context_put (res_ctx);
+--
+2.39.3
+
diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.37.bb
index caf454f368..bce566acd4 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -50,6 +50,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-CVE-2023-4527.patch \
+           file://0024-CVE-2023-4806.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.34.1



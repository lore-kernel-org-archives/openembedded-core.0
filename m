Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4D56E666
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 17:08:04 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 61so4739655plf.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 09:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4daCwTCAAXkmeF7B8NEdtE+PhCKyxxJDqRFFQHiz1eI=;
	b=t95A1pDDRWEw5c3b324pLZ4joMy6vOFuE/44YGNjfOk/j6URZzG/vxGDehT/gK+1MW
	nYAclMxPkrOW5+T1kRAwDQWlK7ZG+UmpUjpW/nI+ISvYX2eX9HAHD3V/BJNR3GVXq819
	aBwqxRS0k7aYdLn+/lDaGtClmzDznB5XbLmf27ysFZ8TZ9Jk5XzIfdDims9V74A7goUj
	pJlNCcOdtHg97wSzI0Fhxl3PKVo7bodTd5VYp2tIILJvePz623H1BCfQXeVPrQEJ7+KY
	HGcd+lp58TfCEdswfxiVnehLZSVIvFmOY/3APFlsYhc/zUCcm+csUU+fzXGv2tgtnKhj
	uxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4daCwTCAAXkmeF7B8NEdtE+PhCKyxxJDqRFFQHiz1eI=;
	b=IkfJdQcBKp1KpBkED1a7AMW3CxkVTqOU65KYGPvRAJshV8O38gM4ooHybE+fRSpKJz
	F9n0ZPuafQ0XwDytCIC6FdQTyqkhgsU9cjgKq/1pj3WaRnb/RPmypPdKhGIQMic6X9TR
	A9+kaqPH+/D0R8Aan+ah86To03Nlpg9Pf+7gEOLeEwpEN2z9h/BD4S4612DcGs4mCSeA
	yHC/bdwCaOaeR5Nzhojfz0gnxfpodN/jL9h59NNX3JmhnaUZbcfFZBuAKOmGDHZoiKQ6
	C0cD0Gf+kLBR6cPn4/Ycli8eqWbn/D0F5Ir42stxamzZf81jfVSDdWf1DKIDamdgKyU1
	q8zA==
X-Gm-Message-State: AJaThX4A9MGXOyKCmzdZUQi9Cfs48LgrskXJraQshhUA56q1M4hBW8aO
	gOHTZreIoQjl8OBG+yI5XysP4A==
X-Google-Smtp-Source: AGs4zMYXkDMY2J8z9zPRdFZjLTQdaj5ZKpe3HPvK4y8BvDdMcpKqUHzfwZlAZlUXeaR0DtakhrT3vA==
X-Received: by 10.84.131.111 with SMTP id 102mr29844903pld.178.1511543285676; 
	Fri, 24 Nov 2017 09:08:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:2178:58dc:281c:c010])
	by smtp.gmail.com with ESMTPSA id
	b8sm15263394pff.26.2017.11.24.09.08.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Nov 2017 09:08:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Nov 2017 09:08:03 -0800
Message-Id: <1511543284-19280-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Rajkumar Veer <rveer@mvista.com>
Subject: [morty][PATCH 1/2] glibc: Security fix for CVE-2017-8804
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Nov 2017 17:08:05 -0000

From: Rajkumar Veer <rveer@mvista.com>

Source: https://sourceware.org
MR: 74337
Type: Security Fix
Disposition: Backport from https://sourceware.org/ml/libc-alpha/2017-05/msg00105.html
ChangeID: c8c51220e40185dd0ac3d657046e70b82cb94bee
Description:

CVE-2017-8804
sunrpc: xdr_bytes/xdr_string need to free buffer on error [BZ #21461]

Affects: glibc < 2.25

Signed-off-by: Rajkumar Veer <rveer@mvista.com>
Reviewed-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2017-8804.patch | 232 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb             |   1 +
 2 files changed, 233 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-8804.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-8804.patch b/meta/recipes-core/glibc/glibc/CVE-2017-8804.patch
new file mode 100644
index 0000000..5e5bbe2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2017-8804.patch
@@ -0,0 +1,232 @@
+From: fweimer at redhat dot com (Florian Weimer)
+Date: Fri, 05 May 2017 15:18:28 +0200
+Subject: [PATCH] sunrpc: xdr_bytes/xdr_string need to free buffer on error [BZ #21461]
+
+[BZ #21461]
+
+Upstream-Status: Backport
+
+CVE: CVE-2017-8804
+Signed-off-by: Rajkumar Veer<rveer@mvista.
+
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -20,6 +20,9 @@ using `glibc' in the "product" field.
+   [21624] Unsafe alloca allows local attackers to alias stack and heap (CVE-2017-1000366)
+ Version 2.24
+ 
++* The xdr_bytes and xdr_string routines free the internally allocated buffer
++  if deserialization of the buffer contents fails for any reason.
++
+ * The minimum Linux kernel version that this version of the GNU C Library
+   can be used with is 3.2, except on i[4567]86 and x86_64, where Linux
+   kernel version 2.6.32 or later suffices (on architectures that already
+Index: git/sunrpc/Makefile
+===================================================================
+--- git.orig/sunrpc/Makefile
++++ git/sunrpc/Makefile
+@@ -96,9 +96,16 @@ rpcgen-objs = rpc_main.o rpc_hout.o rpc_
+ extra-objs = $(rpcgen-objs) $(addprefix cross-,$(rpcgen-objs))
+ others += rpcgen
+ 
+-tests = tst-xdrmem tst-xdrmem2 test-rpcent
++tests = tst-xdrmem tst-xdrmem2 test-rpcent tst-xdrmem3
+ xtests := tst-getmyaddr
+ 
++tests-special += $(objpfx)mtrace-tst-xdrmem3.out
++generated += mtrace-tst-xdrmem3.out tst-xdrmem3.mtrace
++tst-xdrmem3-ENV = MALLOC_TRACE=$(objpfx)tst-xdrmem3.mtrace
++$(objpfx)mtrace-tst-xdrmem3.out: $(objpfx)tst-xdrmem3.out
++	$(common-objpfx)malloc/mtrace $(objpfx)tst-xdrmem3.mtrace > $@; \
++	$(evaluate-test)
++
+ ifeq ($(have-thread-library),yes)
+ xtests += thrsvc
+ endif
+@@ -153,6 +160,7 @@ BUILD_CPPFLAGS += $(sunrpc-CPPFLAGS)
+ $(objpfx)tst-getmyaddr: $(common-objpfx)linkobj/libc.so
+ $(objpfx)tst-xdrmem: $(common-objpfx)linkobj/libc.so
+ $(objpfx)tst-xdrmem2: $(common-objpfx)linkobj/libc.so
++$(objpfx)tst-xdrmem3: $(common-objpfx)linkobj/libc.so
+ 
+ $(objpfx)rpcgen: $(addprefix $(objpfx),$(rpcgen-objs))
+ 
+Index: git/sunrpc/tst-xdrmem3.c
+===================================================================
+--- /dev/null
++++ git/sunrpc/tst-xdrmem3.c
+@@ -0,0 +1,83 @@
++/* Test xdr_bytes, xdr_string behavior on deserialization failure.
++   Copyright (C) 2017 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++#include <mcheck.h>
++#include <rpc/rpc.h>
++#include <support/check.h>
++#include <support/support.h>
++
++static int
++do_test (void)
++{
++  mtrace ();
++
++  /* If do_own_buffer, allocate the buffer and pass it to the
++     deserialization routine.  Otherwise the routine is requested to
++     allocate the buffer.  */
++  for (int do_own_buffer = 0; do_own_buffer < 2; ++do_own_buffer)
++    {
++      /* Length 16 MiB, but only 2 bytes of data in the packet.  */
++      unsigned char buf[] = "\x01\x00\x00\x00\xff";
++      XDR xdrs;
++      char *result;
++      unsigned int result_len;
++
++      /* Test xdr_bytes.  */
++      xdrmem_create (&xdrs, (char *) buf, sizeof (buf), XDR_DECODE);
++      result_len = 0;
++      if (do_own_buffer)
++        {
++          char *own_buffer = xmalloc (10);
++          result = own_buffer;
++          TEST_VERIFY (!xdr_bytes (&xdrs, &result, &result_len, 10));
++          TEST_VERIFY (result == own_buffer);
++          free (own_buffer);
++        }
++      else
++        {
++          result = NULL;
++          TEST_VERIFY (!xdr_bytes (&xdrs, &result, &result_len, -1));
++          TEST_VERIFY (result == NULL);
++        }
++      TEST_VERIFY (result_len == 16 * 1024 * 1024);
++      xdr_destroy (&xdrs);
++
++      /* Test xdr_string.  */
++      xdrmem_create (&xdrs, (char *) buf, sizeof (buf), XDR_DECODE);
++      if (do_own_buffer)
++        {
++          char *own_buffer = xmalloc (10);
++          result = own_buffer;
++          TEST_VERIFY (!xdr_string (&xdrs, &result, 10));
++          TEST_VERIFY (result == own_buffer);
++          free (own_buffer);
++        }
++      else
++        {
++          result = NULL;
++          TEST_VERIFY (!xdr_string (&xdrs, &result, -1));
++          TEST_VERIFY (result == NULL);
++        }
++      xdr_destroy (&xdrs);
++    }
++
++  return 0;
++}
++
++#include <support/test-driver.c>
++
+Index: git/sunrpc/xdr.c
+===================================================================
+--- git.orig/sunrpc/xdr.c
++++ git/sunrpc/xdr.c
+@@ -620,14 +620,24 @@ xdr_bytes (XDR *xdrs, char **cpp, u_int
+ 	}
+       if (sp == NULL)
+ 	{
+-	  *cpp = sp = (char *) mem_alloc (nodesize);
+-	}
+-      if (sp == NULL)
+-	{
+-	  (void) __fxprintf (NULL, "%s: %s", __func__, _("out of memory\n"));
++	  sp = (char *) mem_alloc (nodesize);
++	  if (sp == NULL)
++	    {
++	      (void) __fxprintf (NULL, "%s: %s", __func__,
++				 _("out of memory\n"));
++	      return FALSE;
++	    }
++	}
++      if (!xdr_opaque (xdrs, sp, nodesize))
++ 	{
++	  if (sp != *cpp)
++	    /* *cpp was NULL, so this function allocated a new
++	       buffer.  */
++	    free (sp);
+ 	  return FALSE;
+ 	}
+-      /* fall into ... */
++      *cpp = sp;
++      return TRUE;
+ 
+     case XDR_ENCODE:
+       return xdr_opaque (xdrs, sp, nodesize);
+@@ -781,14 +791,27 @@ xdr_string (XDR *xdrs, char **cpp, u_int
+     {
+     case XDR_DECODE:
+       if (sp == NULL)
+-	*cpp = sp = (char *) mem_alloc (nodesize);
+-      if (sp == NULL)
+ 	{
+-	  (void) __fxprintf (NULL, "%s: %s", __func__, _("out of memory\n"));
+-	  return FALSE;
++	  sp = (char *) mem_alloc (nodesize);
++	  if (sp == NULL)
++	    {
++	      (void) __fxprintf (NULL, "%s: %s", __func__,
++				 _("out of memory\n"));
++	      return FALSE;
++	    }
+ 	}
+       sp[size] = 0;
+-      /* fall into ... */
++
++      if (!xdr_opaque (xdrs, sp, size))
++	{
++	  if (sp != *cpp)
++	    /* *cpp was NULL, so this function allocated a new
++	       buffer.  */
++	    free (sp);
++	  return FALSE;
++	}
++      *cpp = sp;
++      return TRUE;
+ 
+     case XDR_ENCODE:
+       return xdr_opaque (xdrs, sp, size);
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,16 @@
++2017-05-05  Florian Weimer  <fweimer@redhat.com>
++
++       [BZ #21461]
++       * sunrpc/xdr.c (xdr_bytes): Deallocate allocated buffer on error.
++       (xdr_string): Likewise.
++       * sunrpc/Makefile (tests): Add tst-xdrmem3.
++       (tests-special): Add mtrace-tst-xdrmem3.out.
++       (generated): Add mtrace-tst-xdrmem3.out, tst-xdrmem3.mtrace.
++       (tst-xdrmem3-ENV): Set MALLOC_TRACE.
++       (mtrace-tst-xdrmem3.out): Run mtrace.
++       (tst-xdrmem3): Link against full libc.
++       * sunrpc/tst-xdrmem3.c: New file.
++
+ 2017-06-14  Florian Weimer  <fweimer@redhat.com>
+ 
+ 	* sysdeps/i386/i686/multiarch/strcspn-c.c: Add IS_IN (libc) guard.
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 359379b..966be34 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -56,6 +56,7 @@ SRC_URI += "\
            file://etc/ld.so.conf \
            file://generate-supported.mk \
            file://0001-locale-fix-hard-coded-reference-to-gcc-E.patch \
+           file://CVE-2017-8804.patch \
            "
 
 SRC_URI_append_class-nativesdk = "\
-- 
2.7.4



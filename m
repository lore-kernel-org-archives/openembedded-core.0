Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5E3C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 10:34:21 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.29833.1641810857179496570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 02:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cIw+n7vu;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id t187so10226929pfb.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 02:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkMI3hdYT7QNfWRtlZtk1OnGeN9HKiIh+oT64MRe7uk=;
        b=cIw+n7vudFwcxvMn93mvZLt2eQUVkyo0KERv55wWU5NahbGrLA+4TPbNrW8Z+doTdy
         wt2SbuDIEb5Q9s/FWHzZ1sGhFvdxma2AdafqdH8Ft/3YCxmc2+uEeTPUd7nN7BBtMaLr
         MMeSW/vq0IGY4vKRRAaL76AzBrvkPi6ymJoMv5YscQuDpyAoZdZz/+Pff+W/g2+qJPzP
         a1JREvbWh+ivNN58UdD41gCSq/L2BGwKSygP3lH5iXmkZZs/chFxh5ETi3+cytJIG0yP
         r3+u3gD/Es+PbURIdzugUM64HEQO/fWDVxbQOYpdYOJFqkMHKfqfO6DiMvoGdoU1on+C
         YlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkMI3hdYT7QNfWRtlZtk1OnGeN9HKiIh+oT64MRe7uk=;
        b=3VrNtKaSmp6K1JFKtcfKQVgZO3hc71+yGEsHIwBC0PII7SgRgfKrG5PHZqCP8QdH/X
         S7HN5QlEX+NqeN69NpnnoAaZAj4rWPzeC5JZ6Y5uLME+xx6yCkUj7cFH0PalzFR0JzW9
         vpb63nLUyE5D6lqE4Bjhca/PGvS2wNgPdhxJyv9rcgtHJn7RRjKpgT7wYOb8AXShY6ps
         Z2pie7wAHylyMkrWVedQ1Obc3oro5LxL6rmtdCDX4uJf1feRxWWBLdRe3aEAlqz+5RYe
         nxT2mTdocNQ2jK4LKOhgERiCH+SrOTnBq6sP2P3FD4WfFaetRmodcMpPyiLb54ilEJRP
         HEhQ==
X-Gm-Message-State: AOAM532T9azc9K+wa39xDWrswVbiz96pubf6KazNcyk6A5E2o0Qb8dZ2
	5+CM4a9DAmjK5bJEexl5rdWXNWLUn70=
X-Google-Smtp-Source: 
 ABdhPJy4igfJ1vvQHCk987Hx3nfVDussyQcHmra1zCjaMrAh6upk+9TIxvJLsD1X6bDImFNg0aMmnw==
X-Received: by 2002:a63:f30b:: with SMTP id
 l11mr65580151pgh.272.1641810856355;
        Mon, 10 Jan 2022 02:34:16 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 q19sm6591000pfk.83.2022.01.10.02.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 02:34:15 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH v2] glibc: Backport fix for CVE-2021-43396
Date: Mon, 10 Jan 2022 02:34:10 -0800
Message-Id: <20220110103410.183318-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 10:34:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160341

Backport the fix for CVE-2021-43396. It is disputed that this is a
security issue.

(From OE-Core rev: e8de9b01c6b305b2498c5f942397a49ae2af0cde)

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../glibc/glibc/0031-CVE-2021-43396.patch     | 182 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch

diff --git a/meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch b/meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch
new file mode 100644
index 0000000000..72fd68b302
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch
@@ -0,0 +1,182 @@
+From ff012870b2c02a62598c04daa1e54632e020fd7d Mon Sep 17 00:00:00 2001
+From: Nikita Popov <npv1310@gmail.com>
+Date: Tue, 2 Nov 2021 13:21:42 +0500
+Subject: [PATCH] gconv: Do not emit spurious NUL character in ISO-2022-JP-3
+ (bug 28524)
+
+Bugfix 27256 has introduced another issue:
+In conversion from ISO-2022-JP-3 encoding, it is possible
+to force iconv to emit extra NUL character on internal state reset.
+To do this, it is sufficient to feed iconv with escape sequence
+which switches active character set.
+The simplified check 'data->__statep->__count != ASCII_set'
+introduced by the aforementioned bugfix picks that case and
+behaves as if '\0' character has been queued thus emitting it.
+
+To eliminate this issue, these steps are taken:
+* Restore original condition
+'(data->__statep->__count & ~7) != ASCII_set'.
+It is necessary since bits 0-2 may contain
+number of buffered input characters.
+* Check that queued character is not NUL.
+Similar step is taken for main conversion loop.
+
+Bundled test case follows following logic:
+* Try to convert ISO-2022-JP-3 escape sequence
+switching active character set
+* Reset internal state by providing NULL as input buffer
+* Ensure that nothing has been converted.
+
+Signed-off-by: Nikita Popov <npv1310@gmail.com>
+
+CVE: CVE-2021-43396
+Upstream-Status: Backport [ff012870b2c02a62598c04daa1e54632e020fd7d]
+---
+ iconvdata/Makefile        |  5 +++-
+ iconvdata/bug-iconv15.c   | 60 +++++++++++++++++++++++++++++++++++++++
+ iconvdata/iso-2022-jp-3.c | 28 ++++++++++++------
+ 3 files changed, 84 insertions(+), 9 deletions(-)
+ create mode 100644 iconvdata/bug-iconv15.c
+
+diff --git a/iconvdata/bug-iconv15.c b/iconvdata/bug-iconv15.c
+new file mode 100644
+--- /dev/null
++++ b/iconvdata/bug-iconv15.c
+@@ -0,0 +1,60 @@
++/* Bug 28524: Conversion from ISO-2022-JP-3 with iconv
++   may emit spurious NUL character on state reset.
++   Copyright (C) The GNU Toolchain Authors.
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
++#include <stddef.h>
++#include <iconv.h>
++#include <support/check.h>
++
++static int
++do_test (void)
++{
++  char in[] = "\x1b(I";
++  char *inbuf = in;
++  size_t inleft = sizeof (in) - 1;
++  char out[1];
++  char *outbuf = out;
++  size_t outleft = sizeof (out);
++  iconv_t cd;
++
++  cd = iconv_open ("UTF8", "ISO-2022-JP-3");
++  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
++
++  /* First call to iconv should alter internal state.
++     Now, JISX0201_Kana_set is selected and
++     state value != ASCII_set.  */
++  TEST_VERIFY (iconv (cd, &inbuf, &inleft, &outbuf, &outleft) != (size_t) -1);
++
++  /* No bytes should have been added to
++     the output buffer at this point.  */
++  TEST_VERIFY (outbuf == out);
++  TEST_VERIFY (outleft == sizeof (out));
++
++  /* Second call shall emit spurious NUL character in unpatched glibc.  */
++  TEST_VERIFY (iconv (cd, NULL, NULL, &outbuf, &outleft) != (size_t) -1);
++
++  /* No characters are expected to be produced.  */
++  TEST_VERIFY (outbuf == out);
++  TEST_VERIFY (outleft == sizeof (out));
++
++  TEST_VERIFY_EXIT (iconv_close (cd) != -1);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/iconvdata/iso-2022-jp-3.c b/iconvdata/iso-2022-jp-3.c
+--- a/iconvdata/iso-2022-jp-3.c
++++ b/iconvdata/iso-2022-jp-3.c
+@@ -1,5 +1,6 @@
+ /* Conversion module for ISO-2022-JP-3.
+    Copyright (C) 1998-2021 Free Software Foundation, Inc.
++   Copyright (C) The GNU Toolchain Authors.
+    This file is part of the GNU C Library.
+    Contributed by Ulrich Drepper <drepper@cygnus.com>, 1998,
+    and Bruno Haible <bruno@clisp.org>, 2002.
+@@ -81,20 +82,31 @@ enum
+    the output state to the initial state.  This has to be done during the
+    flushing.  */
+ #define EMIT_SHIFT_TO_INIT \
+-  if (data->__statep->__count != ASCII_set)			      \
++  if ((data->__statep->__count & ~7) != ASCII_set)			      \
+     {									      \
+       if (FROM_DIRECTION)						      \
+ 	{								      \
+-	  if (__glibc_likely (outbuf + 4 <= outend))			      \
++	  uint32_t ch = data->__statep->__count >> 6;			      \
++									      \
++	  if (__glibc_unlikely (ch != 0))				      \
+ 	    {								      \
+-	      /* Write out the last character.  */			      \
+-	      *((uint32_t *) outbuf) = data->__statep->__count >> 6;	      \
+-	      outbuf += sizeof (uint32_t);				      \
+-	      data->__statep->__count = ASCII_set;			\
++	      if (__glibc_likely (outbuf + 4 <= outend))		      \
++		{							      \
++		  /* Write out the last character.  */			      \
++		  put32u (outbuf, ch);					      \
++		  outbuf += 4;						      \
++		  data->__statep->__count &= 7;				      \
++		  data->__statep->__count |= ASCII_set;			      \
++		}							      \
++	      else							      \
++		/* We don't have enough room in the output buffer.  */	      \
++		status = __GCONV_FULL_OUTPUT;				      \
+ 	    }								      \
+ 	  else								      \
+-	    /* We don't have enough room in the output buffer.  */	      \
+-	    status = __GCONV_FULL_OUTPUT;				      \
++	    {								      \
++	      data->__statep->__count &= 7;				      \
++	      data->__statep->__count |= ASCII_set;			      \
++	    }								      \
+ 	}								      \
+       else								      \
+ 	{								      \
+diff --git a/iconvdata/Makefile b/iconvdata/Makefile
+--- a/iconvdata/Makefile
++++ b/iconvdata/Makefile
+@@ -1,4 +1,5 @@
+ # Copyright (C) 1997-2021 Free Software Foundation, Inc.
++# Copyright (C) The GNU Toolchain Authors.
+ # This file is part of the GNU C Library.
+ 
+ # The GNU C Library is free software; you can redistribute it and/or
+@@ -74,7 +75,7 @@ ifeq (yes,$(build-shared))
+ tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
+ 	tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
+ 	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
+-	bug-iconv13 bug-iconv14
++	bug-iconv13 bug-iconv14 bug-iconv15
+ ifeq ($(have-thread-library),yes)
+ tests += bug-iconv3
+ endif
+@@ -324,6 +325,8 @@ $(objpfx)bug-iconv12.out: $(objpfx)gconv
+ 			  $(addprefix $(objpfx),$(modules.so))
+ $(objpfx)bug-iconv14.out: $(objpfx)gconv-modules \
+ 			  $(addprefix $(objpfx),$(modules.so))
++$(objpfx)bug-iconv15.out: $(addprefix $(objpfx), $(gconv-modules)) \
++			  $(addprefix $(objpfx),$(modules.so))
+ 
+ $(objpfx)iconv-test.out: run-iconv-test.sh $(objpfx)gconv-modules \
+ 			 $(addprefix $(objpfx),$(modules.so)) \
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index a1e9eb3a16..b7736359b1 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -56,6 +56,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
+           file://0031-CVE-2021-43396.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1



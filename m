Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807BDC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 07:38:51 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.5411.1638430730432518272
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 23:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GcZYFPCO;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id u17so19588964plg.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 23:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnXkFaytHQaaQxzAg1mAS9ZbzGbQ7M1aqpSVFnknO5A=;
        b=GcZYFPCObUEGxbz7LdQ+B4NUvVm5EGcbiWknLFwbI+1OjFposSFyBVx2J14LmiGdLu
         WupW7LRMP5YzvxAfK4brwy3Hb5P8rkfcI5N3ebF/ChYA9mRrHG2iTa35VUipCnVxOKUl
         zpAEyaXG0wnzupF18aSt9PZXlk+l3SPjNpJgFi1+aZhidgugT4ZeI61UZCRxSnlhNMTY
         x/xcx2zka8EncItPCquVy1MNSNXk8oOqUMLxJey8P5b3Xi4GEAumOaVwabQ+VST/qMep
         7kKnuvd3xTly6mfKygJ4dDwQjFLDPj/vboZW4n8xstOHioFiNywDVEowIJwotn5r0nai
         U5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnXkFaytHQaaQxzAg1mAS9ZbzGbQ7M1aqpSVFnknO5A=;
        b=MU7VTrMvPWyA8v3RGQoroMjR07WVmJ0Ha/nZI4ZQGdEqr74VGMgJUyjiRTPbbxBmtg
         lHS8z9aQM1uemyZG4eeezj+mKA+LxDGlz2HFtMGtSdL1qKcIMfX3nF8cMunBjcsAvaGa
         QAFGM1ruGz8mgGgfF5WFQ5tD2Z+YMJ5gpz0PYsZa9NPhCkN9qUicxl8j/PAZu9GskmCP
         pouSJpWAUlikUYMuaY1O1SAXxl7+yO7v7ROmoAawlmaAXEbFPmiLKvEeF4EFXyoWOx7t
         celmSat611xgEnnr8HWFQ6p6RhvVKPWssXQq1YnTPxHkTfOKKnN3Uzm2s5ilHCSHO2XW
         bUow==
X-Gm-Message-State: AOAM530JO8Fxq1kfnlfR0Qgsj3AvSk5uRR9i4aPGtDq6ZYt618uLhsxW
	5E8tHGoXjFd7b489zOc8SowwJ5dbjYW1ew==
X-Google-Smtp-Source: 
 ABdhPJwX4mlcRvo5MafrxS9gcGIUhCqZfLUo0YqwdzbZOIkRxPqvV1vmQmMMq/Kkr9v4BfIBTV4xew==
X-Received: by 2002:a17:902:b110:b0:142:7621:aecb with SMTP id
 q16-20020a170902b11000b001427621aecbmr13502674plr.55.1638430729466;
        Wed, 01 Dec 2021 23:38:49 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 lt5sm1589764pjb.43.2021.12.01.23.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 23:38:49 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH] glibc: Backport fix for CVE-2021-43396
Date: Wed,  1 Dec 2021 23:38:45 -0800
Message-Id: <20211202073845.150820-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 07:38:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159074

Backport the fix for CVE-2021-43396. It is disputed that this is a
security issue.

(From OE-Core rev: e8de9b01c6b305b2498c5f942397a49ae2af0cde)

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../glibc/glibc/0031-CVE-2021-43396.patch     | 188 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch

diff --git a/meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch b/meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch
new file mode 100644
index 0000000000..179b0c559d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch
@@ -0,0 +1,188 @@
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
+diff --git a/iconvdata/Makefile b/iconvdata/Makefile
+index c216f959df..d5507a048c 100644
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
+@@ -327,6 +328,8 @@ $(objpfx)bug-iconv12.out: $(addprefix $(objpfx), $(gconv-modules)) \
+ 			  $(addprefix $(objpfx),$(modules.so))
+ $(objpfx)bug-iconv14.out: $(addprefix $(objpfx), $(gconv-modules)) \
+ 			  $(addprefix $(objpfx),$(modules.so))
++$(objpfx)bug-iconv15.out: $(addprefix $(objpfx), $(gconv-modules)) \
++			  $(addprefix $(objpfx),$(modules.so))
+ 
+ $(objpfx)iconv-test.out: run-iconv-test.sh \
+ 			 $(addprefix $(objpfx), $(gconv-modules)) \
+diff --git a/iconvdata/bug-iconv15.c b/iconvdata/bug-iconv15.c
+new file mode 100644
+index 0000000000..cc04bd0313
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
+index 70b28ace7f..d724126545 100644
+--- a/iconvdata/iso-2022-jp-3.c
++++ b/iconvdata/iso-2022-jp-3.c
+@@ -1,5 +1,6 @@
+ /* Conversion module for ISO-2022-JP-3.
+    Copyright (C) 1998-2021 Free Software Foundation, Inc.
++   Copyright (C) The GNU Toolchain Authors.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -79,20 +80,31 @@ enum
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
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index ad5e2b8eb1..38b8a8b065 100644
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



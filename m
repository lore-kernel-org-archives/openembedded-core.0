Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8531C433EF
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 11:15:21 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.7160.1642850120538755323
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 03:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pNpgno5Z;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id d5so9083501pjk.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 03:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xMIWkGYg8wnFGKu/R/AWIlOSnuWFf8mvdaGbWaIdfrw=;
        b=pNpgno5Z0IL+3CfooWs4AC1+45P4mNIei7EwWNWYAIP6OoeR/VYSRWmqBaK31KlpMJ
         IlLoDcdrgbdXclp0n2ot71z2hHiMs8QLzFNERM09ewL0054h6QqBZxC5AW39B86fS3RT
         XVBybbwx0V7eDRqRE3C3sV2XN3MDfkWeixkoqfvxS0zAWu3UsvzgC4xD98TGM1TLWns/
         otKJRKLWZfp7l24C6yv7I+Hl0kH497RWQFa2thwWRAPiqGC4NAblptdatImTM4xnw1VY
         /CNYB+3ZnX+e2DBJ/qqTJj+ToD26fIm4JFMnKfwJsRsocq/HuT28SKd9T8V3/wlqu2VO
         qF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xMIWkGYg8wnFGKu/R/AWIlOSnuWFf8mvdaGbWaIdfrw=;
        b=AmrmIucCuYzBxzYbKg+RdQ0gwPdMjxm0inxzF65z6H/Zbnf0tZdk56BbF8nFDnOIt7
         nn7/t0+cawFmLxTgG/bipW4X3shH9yFsV1Dm5vRjKfDxZPSPslSSRSPGNG/23GFYjb6q
         oCSYCeejPIMGPobnzjX2sMy9hlzWFz77/Z+CwKzuYQlrxVKXMBWYf0TEgD3Xucrd2WyW
         QHmHH/f5x550qW1vVaGckBxhZ6i87ZfeDWS6cZgo7xjiL6RK2YHGYsHhCGOA6YLNfIKs
         NNZ085iqtbFzMImQ8VGS0jcAiD4qr6lmx9IJW1fAunQ7ppgVPV7W7bF+8aj/DHPSU8rn
         UmIQ==
X-Gm-Message-State: AOAM531rM2FMbU/SNtcHnZyaBpOy6XZAbyZc6lQfLWabqa/sHTjgCAda
	9QXUV7CXe08pcn8QqNVOI+DoTgdJiRE=
X-Google-Smtp-Source: 
 ABdhPJyrxbMLaoZoWwhZ93b0PfCN5A1TAqDnkJyC8Qpih6JSLyDUjKlqNJljUqhgJoJM9SI/pGv+HA==
X-Received: by 2002:a17:90b:1c0b:: with SMTP id
 oc11mr4758534pjb.236.1642850119682;
        Sat, 22 Jan 2022 03:15:19 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 n1sm9314343pfa.165.2022.01.22.03.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 03:15:19 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH 1/3] glibc: upgrade glibc-2.33 to latest version
Date: Sat, 22 Jan 2022 03:15:13 -0800
Message-Id: <20220122111516.6312-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jan 2022 11:15:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160855

glibc-2.33 has been upgraded to latest version that includes many CVE and
other bug fixes.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/0031-CVE-2021-43396.patch     | 182 ------------------
 meta/recipes-core/glibc/glibc_2.33.bb         |   1 -
 3 files changed, 1 insertion(+), 184 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 4d69187961..63241ee951 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.33/master"
 PV = "2.33"
-SRCREV_glibc ?= "6090cf1330faf2deb17285758f327cb23b89ebf1"
+SRCREV_glibc ?= "55b99e9ed07688019609bd4dcd17d3ebf4572948"
 SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch b/meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch
deleted file mode 100644
index 72fd68b302..0000000000
--- a/meta/recipes-core/glibc/glibc/0031-CVE-2021-43396.patch
+++ /dev/null
@@ -1,182 +0,0 @@
-From ff012870b2c02a62598c04daa1e54632e020fd7d Mon Sep 17 00:00:00 2001
-From: Nikita Popov <npv1310@gmail.com>
-Date: Tue, 2 Nov 2021 13:21:42 +0500
-Subject: [PATCH] gconv: Do not emit spurious NUL character in ISO-2022-JP-3
- (bug 28524)
-
-Bugfix 27256 has introduced another issue:
-In conversion from ISO-2022-JP-3 encoding, it is possible
-to force iconv to emit extra NUL character on internal state reset.
-To do this, it is sufficient to feed iconv with escape sequence
-which switches active character set.
-The simplified check 'data->__statep->__count != ASCII_set'
-introduced by the aforementioned bugfix picks that case and
-behaves as if '\0' character has been queued thus emitting it.
-
-To eliminate this issue, these steps are taken:
-* Restore original condition
-'(data->__statep->__count & ~7) != ASCII_set'.
-It is necessary since bits 0-2 may contain
-number of buffered input characters.
-* Check that queued character is not NUL.
-Similar step is taken for main conversion loop.
-
-Bundled test case follows following logic:
-* Try to convert ISO-2022-JP-3 escape sequence
-switching active character set
-* Reset internal state by providing NULL as input buffer
-* Ensure that nothing has been converted.
-
-Signed-off-by: Nikita Popov <npv1310@gmail.com>
-
-CVE: CVE-2021-43396
-Upstream-Status: Backport [ff012870b2c02a62598c04daa1e54632e020fd7d]
----
- iconvdata/Makefile        |  5 +++-
- iconvdata/bug-iconv15.c   | 60 +++++++++++++++++++++++++++++++++++++++
- iconvdata/iso-2022-jp-3.c | 28 ++++++++++++------
- 3 files changed, 84 insertions(+), 9 deletions(-)
- create mode 100644 iconvdata/bug-iconv15.c
-
-diff --git a/iconvdata/bug-iconv15.c b/iconvdata/bug-iconv15.c
-new file mode 100644
---- /dev/null
-+++ b/iconvdata/bug-iconv15.c
-@@ -0,0 +1,60 @@
-+/* Bug 28524: Conversion from ISO-2022-JP-3 with iconv
-+   may emit spurious NUL character on state reset.
-+   Copyright (C) The GNU Toolchain Authors.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <stddef.h>
-+#include <iconv.h>
-+#include <support/check.h>
-+
-+static int
-+do_test (void)
-+{
-+  char in[] = "\x1b(I";
-+  char *inbuf = in;
-+  size_t inleft = sizeof (in) - 1;
-+  char out[1];
-+  char *outbuf = out;
-+  size_t outleft = sizeof (out);
-+  iconv_t cd;
-+
-+  cd = iconv_open ("UTF8", "ISO-2022-JP-3");
-+  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
-+
-+  /* First call to iconv should alter internal state.
-+     Now, JISX0201_Kana_set is selected and
-+     state value != ASCII_set.  */
-+  TEST_VERIFY (iconv (cd, &inbuf, &inleft, &outbuf, &outleft) != (size_t) -1);
-+
-+  /* No bytes should have been added to
-+     the output buffer at this point.  */
-+  TEST_VERIFY (outbuf == out);
-+  TEST_VERIFY (outleft == sizeof (out));
-+
-+  /* Second call shall emit spurious NUL character in unpatched glibc.  */
-+  TEST_VERIFY (iconv (cd, NULL, NULL, &outbuf, &outleft) != (size_t) -1);
-+
-+  /* No characters are expected to be produced.  */
-+  TEST_VERIFY (outbuf == out);
-+  TEST_VERIFY (outleft == sizeof (out));
-+
-+  TEST_VERIFY_EXIT (iconv_close (cd) != -1);
-+
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
-diff --git a/iconvdata/iso-2022-jp-3.c b/iconvdata/iso-2022-jp-3.c
---- a/iconvdata/iso-2022-jp-3.c
-+++ b/iconvdata/iso-2022-jp-3.c
-@@ -1,5 +1,6 @@
- /* Conversion module for ISO-2022-JP-3.
-    Copyright (C) 1998-2021 Free Software Foundation, Inc.
-+   Copyright (C) The GNU Toolchain Authors.
-    This file is part of the GNU C Library.
-    Contributed by Ulrich Drepper <drepper@cygnus.com>, 1998,
-    and Bruno Haible <bruno@clisp.org>, 2002.
-@@ -81,20 +82,31 @@ enum
-    the output state to the initial state.  This has to be done during the
-    flushing.  */
- #define EMIT_SHIFT_TO_INIT \
--  if (data->__statep->__count != ASCII_set)			      \
-+  if ((data->__statep->__count & ~7) != ASCII_set)			      \
-     {									      \
-       if (FROM_DIRECTION)						      \
- 	{								      \
--	  if (__glibc_likely (outbuf + 4 <= outend))			      \
-+	  uint32_t ch = data->__statep->__count >> 6;			      \
-+									      \
-+	  if (__glibc_unlikely (ch != 0))				      \
- 	    {								      \
--	      /* Write out the last character.  */			      \
--	      *((uint32_t *) outbuf) = data->__statep->__count >> 6;	      \
--	      outbuf += sizeof (uint32_t);				      \
--	      data->__statep->__count = ASCII_set;			\
-+	      if (__glibc_likely (outbuf + 4 <= outend))		      \
-+		{							      \
-+		  /* Write out the last character.  */			      \
-+		  put32u (outbuf, ch);					      \
-+		  outbuf += 4;						      \
-+		  data->__statep->__count &= 7;				      \
-+		  data->__statep->__count |= ASCII_set;			      \
-+		}							      \
-+	      else							      \
-+		/* We don't have enough room in the output buffer.  */	      \
-+		status = __GCONV_FULL_OUTPUT;				      \
- 	    }								      \
- 	  else								      \
--	    /* We don't have enough room in the output buffer.  */	      \
--	    status = __GCONV_FULL_OUTPUT;				      \
-+	    {								      \
-+	      data->__statep->__count &= 7;				      \
-+	      data->__statep->__count |= ASCII_set;			      \
-+	    }								      \
- 	}								      \
-       else								      \
- 	{								      \
-diff --git a/iconvdata/Makefile b/iconvdata/Makefile
---- a/iconvdata/Makefile
-+++ b/iconvdata/Makefile
-@@ -1,4 +1,5 @@
- # Copyright (C) 1997-2021 Free Software Foundation, Inc.
-+# Copyright (C) The GNU Toolchain Authors.
- # This file is part of the GNU C Library.
- 
- # The GNU C Library is free software; you can redistribute it and/or
-@@ -74,7 +75,7 @@ ifeq (yes,$(build-shared))
- tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
- 	tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
- 	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
--	bug-iconv13 bug-iconv14
-+	bug-iconv13 bug-iconv14 bug-iconv15
- ifeq ($(have-thread-library),yes)
- tests += bug-iconv3
- endif
-@@ -324,6 +325,8 @@ $(objpfx)bug-iconv12.out: $(objpfx)gconv
- 			  $(addprefix $(objpfx),$(modules.so))
- $(objpfx)bug-iconv14.out: $(objpfx)gconv-modules \
- 			  $(addprefix $(objpfx),$(modules.so))
-+$(objpfx)bug-iconv15.out: $(addprefix $(objpfx), $(gconv-modules)) \
-+			  $(addprefix $(objpfx),$(modules.so))
- 
- $(objpfx)iconv-test.out: run-iconv-test.sh $(objpfx)gconv-modules \
- 			 $(addprefix $(objpfx),$(modules.so)) \
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index b7736359b1..a1e9eb3a16 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -56,7 +56,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
-           file://0031-CVE-2021-43396.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1



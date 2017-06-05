Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4EB77F90
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 20:53:27 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id d73so33840457wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 13:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hiKtocRO+zuOa6JX5tAmbrl8fQBizifQmQMydYUQj6w=;
	b=ixxV08sZz+78q3Kl0psvNKVpuI0Ywz5rl3mH1oiZ8jOnTHuBidyIGl8XVTt84PqED3
	hDGrERSgj+khvaK/b2zfH5u7fnhfk05R1uNqA1EppXJSQEF9lydHkKjO+kdxoYBPBUMD
	X6C7w3Q941CZVzKD/uql6LCP8hCPwkTSv0rRzWzwvWtB1Sjh0LecdlYHHyIP1sMUmDtS
	O0DYSEfx4MV8GBWjk6VD8myx3aHVMx4C50qGr7bBupvCHIX+ZV6ckOXa96dpLkk6s4tM
	HytCyXTC5buzExsCV6tnZmBiRBoEbzsFOSgkw2XVDSbWMdSTPfbr8Trrc64I6U+F9KPl
	XaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hiKtocRO+zuOa6JX5tAmbrl8fQBizifQmQMydYUQj6w=;
	b=pDGepOeaxLK0FF0ByC/cOxIbt/hD83/M1ynzLtwHKuG667ifjH6BlEPJzu0z3HamiS
	ifgDyRkhN0q3t+0Ifb3Fzbv65JTtzrRhyNTDsmTt4VcjdLRNBHXCnbUQzrCTWwjvoyJq
	uNdW329nVs0athlg4YCpW1MAuGDIiFtCm8g1Dsf7OHZouRn5zH3rpoff3cI7/k17Sq6C
	NsTB2XCsfzb5DH1WxkElea8mRZorPX5LnlO00B/zOXCYHbaCEzEJ/dXdBZSrlFVlKT8J
	73fcRFCN8zBYg6SnqdiaUiJonLVksPkZjSyh9y2eDsWfx+qByPfQfAnHxxMJ14b6Xp+H
	uH6A==
X-Gm-Message-State: AODbwcDWCgqkYyE54LU3PAKBSB3ZlH2oW2LpcWPfIWlzvLvJ4XXyRgtY
	ILS1WS07KeX3gl8rGP8=
X-Received: by 10.28.30.199 with SMTP id e190mr8790811wme.96.1496696007642;
	Mon, 05 Jun 2017 13:53:27 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	a24sm36543835wra.17.2017.06.05.13.53.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jun 2017 13:53:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jun 2017 21:53:25 +0100
Message-Id: <1496696005-28913-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] libunwind: fix build failure on MIPS
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
X-List-Received-Date: Mon, 05 Jun 2017 20:53:28 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libunwind/libunwind/fix-mips.patch             | 134 +++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.2.bb    |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/fix-mips.patch

diff --git a/meta/recipes-support/libunwind/libunwind/fix-mips.patch b/meta/recipes-support/libunwind/libunwind/fix-mips.patch
new file mode 100644
index 0000000..0022237
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/fix-mips.patch
@@ -0,0 +1,134 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 5f354cb7b9c84dae006f0ebd8ad7a78d7e2aad0c Mon Sep 17 00:00:00 2001
+From: Dave Watson <davejwatson@fb.com>
+Date: Wed, 25 Jan 2017 16:18:02 -0800
+Subject: [PATCH] mips/tilegx: Add missing unwind_i.h header file
+
+reported-by: John Knight <John.Knight@belkin.com>
+---
+ src/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 5d874755..7de4c425 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -280,7 +280,7 @@ libunwind_hppa_la_SOURCES_hppa = $(libunwind_la_SOURCES_hppa_common)	\
+ 	hppa/Gresume.c hppa/Gstep.c
+ 
+ # The list of files that go info libunwind and libunwind-mips:
+-noinst_HEADERS += mips/init.h mips/offsets.h
++noinst_HEADERS += mips/init.h mips/offsets.h mips/unwind_i.h
+ libunwind_la_SOURCES_mips_common = $(libunwind_la_SOURCES_common)	    \
+ 	mips/is_fpreg.c mips/regname.c
+ 
+@@ -299,7 +299,7 @@ libunwind_mips_la_SOURCES_mips = $(libunwind_la_SOURCES_mips_common)	    \
+ 	mips/Gis_signal_frame.c mips/Gregs.c mips/Gresume.c mips/Gstep.c
+ 
+ # The list of files that go info libunwind and libunwind-tilegx:
+-noinst_HEADERS += tilegx/init.h tilegx/offsets.h
++noinst_HEADERS += tilegx/init.h tilegx/offsets.h tilegx/unwind_i.h
+ libunwind_la_SOURCES_tilegx_common = $(libunwind_la_SOURCES_common)	    \
+ 	tilegx/is_fpreg.c tilegx/regname.c
+ 
+diff --git a/src/mips/unwind_i.h b/src/mips/unwind_i.h
+new file mode 100644
+index 0000000..3382dcf
+--- /dev/null
++++ b/src/mips/unwind_i.h
+@@ -0,0 +1,43 @@
++/* libunwind - a platform-independent unwind library
++   Copyright (C) 2008 CodeSourcery
++
++This file is part of libunwind.
++
++Permission is hereby granted, free of charge, to any person obtaining
++a copy of this software and associated documentation files (the
++"Software"), to deal in the Software without restriction, including
++without limitation the rights to use, copy, modify, merge, publish,
++distribute, sublicense, and/or sell copies of the Software, and to
++permit persons to whom the Software is furnished to do so, subject to
++the following conditions:
++
++The above copyright notice and this permission notice shall be
++included in all copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
++LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
++WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
++
++#ifndef unwind_i_h
++#define unwind_i_h
++
++#include <stdint.h>
++
++#include <libunwind-mips.h>
++
++#include "libunwind_i.h"
++
++#define mips_lock                       UNW_OBJ(lock)
++#define mips_local_resume               UNW_OBJ(local_resume)
++#define mips_local_addr_space_init      UNW_OBJ(local_addr_space_init)
++
++extern int mips_local_resume (unw_addr_space_t as, unw_cursor_t *cursor,
++                             void *arg);
++
++extern void mips_local_addr_space_init (void);
++
++#endif /* unwind_i_h */
+diff --git a/src/tilegx/unwind_i.h b/src/tilegx/unwind_i.h
+new file mode 100644
+index 0000000..aac7be3
+--- /dev/null
++++ b/src/tilegx/unwind_i.h
+@@ -0,0 +1,44 @@
++/* libunwind - a platform-independent unwind library
++   Copyright (C) 2008 CodeSourcery
++
++This file is part of libunwind.
++
++Permission is hereby granted, free of charge, to any person obtaining
++a copy of this software and associated documentation files (the
++"Software"), to deal in the Software without restriction, including
++without limitation the rights to use, copy, modify, merge, publish,
++distribute, sublicense, and/or sell copies of the Software, and to
++permit persons to whom the Software is furnished to do so, subject to
++the following conditions:
++
++The above copyright notice and this permission notice shall be
++included in all copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
++LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
++WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
++
++#ifndef unwind_i_h
++#define unwind_i_h
++
++#include <memory.h>
++#include <stdint.h>
++
++#include <libunwind-tilegx.h>
++
++#include "libunwind_i.h"
++
++#define tilegx_local_resume            UNW_OBJ(local_resume)
++#define tilegx_local_addr_space_init   UNW_OBJ(local_addr_space_init)
++
++extern int tilegx_local_resume (unw_addr_space_t as,
++                                unw_cursor_t *cursor,
++                                void *arg);
++
++extern void tilegx_local_addr_space_init (void);
++
++#endif /* unwind_i_h */
diff --git a/meta/recipes-support/libunwind/libunwind_1.2.bb b/meta/recipes-support/libunwind/libunwind_1.2.bb
index a398d33..e598e40 100644
--- a/meta/recipes-support/libunwind/libunwind_1.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
            file://0001-add-knobs-to-disable-enable-tests.patch \
            file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            file://libunwind-1.1-x32.patch \
+           file://fix-mips.patch \
            "
 
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
-- 
2.8.1



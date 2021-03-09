Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.11880.1615308245916956966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 08:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YYJUnGlg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso7012105wmi.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 08:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IcaRhdnpciubn/2xZNvE7yLDunF6imH87xFRuGczLLA=;
        b=YYJUnGlgyS+UD+G6hpEob7odbMuORnPi4cNxoihMagPl63l5XP/+Et9K8VKMriyLeT
         0dk9Vq8hkIiFfVo4MgVf9KrqZRKPTfYeOS/ajkYWTfl9otedYiyJZV8b/WF1swZN1XAg
         yMzU5c3E1DP5d9pqNKvqee1MxxpaQL4CF4bd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IcaRhdnpciubn/2xZNvE7yLDunF6imH87xFRuGczLLA=;
        b=KusyI2G8JXNjpRNA8mmd8dvIYZQFTZn2tndPqkob6cCLifEfj+zL0eYlkHNWNgJjhu
         dIQIKMszgVkm+KI3rBwh9Tnrj29nMXc+JaZAGz3sdSVep3bHJ4xevVmrJKG4VHTReQ53
         6+IRb/qkhGApgSrFFHB/3Eu1CgmqhVqbfB7RSEzuCVJmXQMi8Ej/NXtVsh5dvsNC2PCE
         rZaIhJtJqudyeUT2HhSQ/mViuzm8eMXtnJZaQoytm56stDG1r3d3YHVYY5tYW77Q3PEL
         OmRrHduQNH4ORXdNP7+Q6SvLH8nbOllFfMQWLvV3mfHPp9Kz0bTV0YxXf/nt6qFIzhBV
         z9hw==
X-Gm-Message-State: AOAM5311XqZWKQN4oT8eurU15/GWm0V8x9hGydI/8cp55XSz3YVUnCLN
	sZrtAKrkxu3MJVU13Nh7O7DRQHlVh173dQ==
X-Google-Smtp-Source: ABdhPJzgkD8/sXoTj7IV/jqw2gI9vv7icgUdlWIq4DOVdbX82miBEA1Pva/WdES2eAWU6QKEF5OfbA==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr5107428wmk.184.1615308243965;
        Tue, 09 Mar 2021 08:44:03 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e1d9:50e9:2ad6:a226])
        by smtp.gmail.com with ESMTPSA id d16sm24361072wrx.79.2021.03.09.08.44.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:44:03 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] ltp: Fix libswapon issue properly
Date: Tue,  9 Mar 2021 16:44:02 +0000
Message-Id: <20210309164402.2460149-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210309164402.2460149-1-richard.purdie@linuxfoundation.org>
References: <20210309164402.2460149-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the libswapon reproducibility workaround with the solution
preferred by upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-swapoff-Move-common-library-to-libs.patch | 133 +++++++
 meta/recipes-extended/ltp/ltp/libswapon.patch | 368 ++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20210121.bb     |   9 +-
 3 files changed, 502 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/libswapon.patch

diff --git a/meta/recipes-extended/ltp/ltp/0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch b/meta/recipes-extended/ltp/ltp/0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch
new file mode 100644
index 00000000000..5ace82dba59
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch
@@ -0,0 +1,133 @@
+From 0653f1d809d0cc13f84facb9d2d82d984ac4d0ac Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 9 Mar 2021 15:25:16 +0000
+Subject: [PATCH 3/3] syscalls/swapon/swapoff: Move common library to libs/
+
+There is a race/determinism issue with libswapon currently as depending on
+which makefile path builds it, the debug paths may be "../swapon/libswapon.c"
+or "libswapon.c". To avoid the determinism issue, move libswapon to libs/
+and use it from the shared location.
+
+The header is moved to the common includes directory to match and
+the Makefile.inc fragment can be dropped.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2021-March/021387.html]
+
+---
+ .../kernel/syscalls/swapon => include}/libswapon.h   |  0
+ libs/libltpswapon/Makefile                           | 12 ++++++++++++
+ .../swapon => libs/libltpswapon}/libswapon.c         |  0
+ testcases/kernel/syscalls/swapoff/Makefile           |  7 +++++--
+ testcases/kernel/syscalls/swapoff/Makefile.inc       |  6 ------
+ testcases/kernel/syscalls/swapoff/swapoff01.c        |  2 +-
+ testcases/kernel/syscalls/swapoff/swapoff02.c        |  2 +-
+ testcases/kernel/syscalls/swapon/Makefile            |  6 +++---
+ 8 files changed, 22 insertions(+), 13 deletions(-)
+ rename {testcases/kernel/syscalls/swapon => include}/libswapon.h (100%)
+ create mode 100644 libs/libltpswapon/Makefile
+ rename {testcases/kernel/syscalls/swapon => libs/libltpswapon}/libswapon.c (100%)
+ delete mode 100644 testcases/kernel/syscalls/swapoff/Makefile.inc
+
+diff --git a/testcases/kernel/syscalls/swapon/libswapon.h b/include/libswapon.h
+similarity index 100%
+rename from testcases/kernel/syscalls/swapon/libswapon.h
+rename to include/libswapon.h
+diff --git a/libs/libltpswapon/Makefile b/libs/libltpswapon/Makefile
+new file mode 100644
+index 000000000..8f738338b
+--- /dev/null
++++ b/libs/libltpswapon/Makefile
+@@ -0,0 +1,12 @@
++# SPDX-License-Identifier: GPL-2.0-or-later
++#
++# Copyright (C) Richard Purdie <richard.purdie@linuxfoundation.org>
++
++top_srcdir		?= ../..
++
++include $(top_srcdir)/include/mk/env_pre.mk
++
++INTERNAL_LIB		:= libltpswapon.a
++
++include $(top_srcdir)/include/mk/lib.mk
++include $(top_srcdir)/include/mk/generic_leaf_target.mk
+diff --git a/testcases/kernel/syscalls/swapon/libswapon.c b/libs/libltpswapon/libswapon.c
+similarity index 100%
+rename from testcases/kernel/syscalls/swapon/libswapon.c
+rename to libs/libltpswapon/libswapon.c
+diff --git a/testcases/kernel/syscalls/swapoff/Makefile b/testcases/kernel/syscalls/swapoff/Makefile
+index fbfbe0441..a74374605 100644
+--- a/testcases/kernel/syscalls/swapoff/Makefile
++++ b/testcases/kernel/syscalls/swapoff/Makefile
+@@ -3,7 +3,10 @@
+ 
+ top_srcdir		?= ../../../..
+ 
++LTPLIBS = ltpswapon
++
+ include $(top_srcdir)/include/mk/testcases.mk
+-include $(abs_srcdir)/./Makefile.inc
++
++LTPLDLIBS  = -lltpswapon
++
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+-$(MAKE_TARGETS): %: ../swapon/libswapon.o
+diff --git a/testcases/kernel/syscalls/swapoff/Makefile.inc b/testcases/kernel/syscalls/swapoff/Makefile.inc
+deleted file mode 100644
+index 65350cbeb..000000000
+--- a/testcases/kernel/syscalls/swapoff/Makefile.inc
++++ /dev/null
+@@ -1,6 +0,0 @@
+-LIBDIR			+= ../swapon/
+-LIBSWAPON		:= $(LIBDIR)/libswapon.o
+-$(LIBSWAPON):
+-	$(MAKE) -C $(LIBDIR)
+-CPPFLAGS		+= -I$(abs_srcdir)/$(LIBDIR)
+-LDFLAGS			+= -L$(abs_builddir)/$(LIBDIR)
+diff --git a/testcases/kernel/syscalls/swapoff/swapoff01.c b/testcases/kernel/syscalls/swapoff/swapoff01.c
+index e115269c0..87a217a89 100644
+--- a/testcases/kernel/syscalls/swapoff/swapoff01.c
++++ b/testcases/kernel/syscalls/swapoff/swapoff01.c
+@@ -25,7 +25,7 @@
+ #include <stdlib.h>
+ #include "config.h"
+ #include "lapi/syscalls.h"
+-#include "../swapon/libswapon.h"
++#include "libswapon.h"
+ 
+ static void setup(void);
+ static void cleanup(void);
+diff --git a/testcases/kernel/syscalls/swapoff/swapoff02.c b/testcases/kernel/syscalls/swapoff/swapoff02.c
+index 8954f975f..60cd66c26 100644
+--- a/testcases/kernel/syscalls/swapoff/swapoff02.c
++++ b/testcases/kernel/syscalls/swapoff/swapoff02.c
+@@ -33,7 +33,7 @@
+ #include "test.h"
+ #include "lapi/syscalls.h"
+ #include "safe_macros.h"
+-#include "../swapon/libswapon.h"
++#include "libswapon.h"
+ 
+ static void setup(void);
+ static void cleanup(void);
+diff --git a/testcases/kernel/syscalls/swapon/Makefile b/testcases/kernel/syscalls/swapon/Makefile
+index 97113a447..57ec45d48 100644
+--- a/testcases/kernel/syscalls/swapon/Makefile
++++ b/testcases/kernel/syscalls/swapon/Makefile
+@@ -8,10 +8,10 @@ endif
+ 
+ top_srcdir		?= ../../../..
+ 
++LTPLIBS = ltpswapon
++
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
+-FILTER_OUT_MAKE_TARGETS         := libswapon
++LTPLDLIBS  = -lltpswapon
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+-
+-$(MAKE_TARGETS): %: libswapon.o
+-- 
+2.27.0
+
diff --git a/meta/recipes-extended/ltp/ltp/libswapon.patch b/meta/recipes-extended/ltp/ltp/libswapon.patch
new file mode 100644
index 00000000000..07b0dcefcf8
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/libswapon.patch
@@ -0,0 +1,368 @@
+Index: git/libs/libltpswapon/Makefile
+===================================================================
+--- /dev/null
++++ git/libs/libltpswapon/Makefile
+@@ -0,0 +1,12 @@
++# SPDX-License-Identifier: GPL-2.0-or-later
++#
++# Copyright (C) Richard Purdie <richard.purdie@linuxfoundation.org>
++
++top_srcdir		?= ../..
++
++include $(top_srcdir)/include/mk/env_pre.mk
++
++INTERNAL_LIB		:= libltpswapon.a
++
++include $(top_srcdir)/include/mk/lib.mk
++include $(top_srcdir)/include/mk/generic_leaf_target.mk
+Index: git/libs/libltpswapon/libswapon.c
+===================================================================
+--- /dev/null
++++ git/libs/libltpswapon/libswapon.c
+@@ -0,0 +1,90 @@
++/*
++ * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it would be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write the Free Software Foundation,
++ * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
++ *
++ * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
++ *
++ */
++
++#include <errno.h>
++#include "lapi/syscalls.h"
++#include "test.h"
++#include "libswapon.h"
++
++/*
++ * Make a swap file
++ */
++int make_swapfile(void (cleanup)(void), const char *swapfile, int safe)
++{
++	if (!tst_fs_has_free(NULL, ".", sysconf(_SC_PAGESIZE) * 10,
++	    TST_BYTES)) {
++		tst_brkm(TBROK, cleanup,
++			"Insufficient disk space to create swap file");
++	}
++
++	/* create file */
++	if (tst_fill_file(swapfile, 0,
++			sysconf(_SC_PAGESIZE), 10) != 0) {
++		tst_brkm(TBROK, cleanup, "Failed to create swapfile");
++	}
++
++	/* make the file swapfile */
++	const char *argv[2 + 1];
++	argv[0] = "mkswap";
++	argv[1] = swapfile;
++	argv[2] = NULL;
++
++	return tst_cmd(cleanup, argv, "/dev/null", "/dev/null", safe);
++}
++
++/*
++ * Check swapon/swapoff support status of filesystems or files
++ * we are testing on.
++ */
++void is_swap_supported(void (cleanup)(void), const char *filename)
++{
++	int fibmap = tst_fibmap(filename);
++	long fs_type = tst_fs_type(cleanup, filename);
++	const char *fstype = tst_fs_type_name(fs_type);
++
++	int ret = make_swapfile(NULL, filename, 1);
++	if (ret != 0) {
++		if (fibmap == 1) {
++			tst_brkm(TCONF, cleanup,
++				"mkswap on %s not supported", fstype);
++		} else {
++			tst_brkm(TFAIL, cleanup,
++				"mkswap on %s failed", fstype);
++		}
++	}
++
++	TEST(ltp_syscall(__NR_swapon, filename, 0));
++	if (TEST_RETURN == -1) {
++		if (fibmap == 1 && errno == EINVAL) {
++			tst_brkm(TCONF, cleanup,
++				"Swapfile on %s not implemented", fstype);
++		} else {
++			tst_brkm(TFAIL | TERRNO, cleanup,
++				 "swapon on %s failed", fstype);
++		}
++	}
++
++	TEST(ltp_syscall(__NR_swapoff, filename, 0));
++	if (TEST_RETURN == -1) {
++		tst_brkm(TFAIL | TERRNO, cleanup,
++			"swapoff on %s failed", fstype);
++	}
++}
+Index: git/testcases/kernel/syscalls/swapoff/Makefile
+===================================================================
+--- git.orig/testcases/kernel/syscalls/swapoff/Makefile
++++ git/testcases/kernel/syscalls/swapoff/Makefile
+@@ -3,7 +3,11 @@
+ 
+ top_srcdir		?= ../../../..
+ 
++LTPLIBS = ltpswapon
++ 
+ include $(top_srcdir)/include/mk/testcases.mk
+-include $(abs_srcdir)/./Makefile.inc
++
++LTPLDLIBS  = -lltpswapon
++
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+-$(MAKE_TARGETS): %: ../swapon/libswapon.o
++
+Index: git/testcases/kernel/syscalls/swapoff/Makefile.inc
+===================================================================
+--- git.orig/testcases/kernel/syscalls/swapoff/Makefile.inc
++++ /dev/null
+@@ -1,6 +0,0 @@
+-LIBDIR			+= ../swapon/
+-LIBSWAPON		:= $(LIBDIR)/libswapon.o
+-$(LIBSWAPON):
+-	$(MAKE) -C $(LIBDIR)
+-CPPFLAGS		+= -I$(abs_srcdir)/$(LIBDIR)
+-LDFLAGS			+= -L$(abs_builddir)/$(LIBDIR)
+Index: git/testcases/kernel/syscalls/swapon/Makefile
+===================================================================
+--- git.orig/testcases/kernel/syscalls/swapon/Makefile
++++ git/testcases/kernel/syscalls/swapon/Makefile
+@@ -8,10 +8,10 @@ endif
+ 
+ top_srcdir		?= ../../../..
+ 
++LTPLIBS = ltpswapon
++
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
+-FILTER_OUT_MAKE_TARGETS         := libswapon
++LTPLDLIBS  = -lltpswapon
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+-
+-$(MAKE_TARGETS): %: libswapon.o
+Index: git/testcases/kernel/syscalls/swapon/libswapon.c
+===================================================================
+--- git.orig/testcases/kernel/syscalls/swapon/libswapon.c
++++ /dev/null
+@@ -1,90 +0,0 @@
+-/*
+- * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
+- *
+- * This program is free software; you can redistribute it and/or
+- * modify it under the terms of the GNU General Public License as
+- * published by the Free Software Foundation; either version 2 of
+- * the License, or (at your option) any later version.
+- *
+- * This program is distributed in the hope that it would be useful,
+- * but WITHOUT ANY WARRANTY; without even the implied warranty of
+- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+- * GNU General Public License for more details.
+- *
+- * You should have received a copy of the GNU General Public License
+- * along with this program; if not, write the Free Software Foundation,
+- * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+- *
+- * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
+- *
+- */
+-
+-#include <errno.h>
+-#include "lapi/syscalls.h"
+-#include "test.h"
+-#include "libswapon.h"
+-
+-/*
+- * Make a swap file
+- */
+-int make_swapfile(void (cleanup)(void), const char *swapfile, int safe)
+-{
+-	if (!tst_fs_has_free(NULL, ".", sysconf(_SC_PAGESIZE) * 10,
+-	    TST_BYTES)) {
+-		tst_brkm(TBROK, cleanup,
+-			"Insufficient disk space to create swap file");
+-	}
+-
+-	/* create file */
+-	if (tst_fill_file(swapfile, 0,
+-			sysconf(_SC_PAGESIZE), 10) != 0) {
+-		tst_brkm(TBROK, cleanup, "Failed to create swapfile");
+-	}
+-
+-	/* make the file swapfile */
+-	const char *argv[2 + 1];
+-	argv[0] = "mkswap";
+-	argv[1] = swapfile;
+-	argv[2] = NULL;
+-
+-	return tst_cmd(cleanup, argv, "/dev/null", "/dev/null", safe);
+-}
+-
+-/*
+- * Check swapon/swapoff support status of filesystems or files
+- * we are testing on.
+- */
+-void is_swap_supported(void (cleanup)(void), const char *filename)
+-{
+-	int fibmap = tst_fibmap(filename);
+-	long fs_type = tst_fs_type(cleanup, filename);
+-	const char *fstype = tst_fs_type_name(fs_type);
+-
+-	int ret = make_swapfile(NULL, filename, 1);
+-	if (ret != 0) {
+-		if (fibmap == 1) {
+-			tst_brkm(TCONF, cleanup,
+-				"mkswap on %s not supported", fstype);
+-		} else {
+-			tst_brkm(TFAIL, cleanup,
+-				"mkswap on %s failed", fstype);
+-		}
+-	}
+-
+-	TEST(ltp_syscall(__NR_swapon, filename, 0));
+-	if (TEST_RETURN == -1) {
+-		if (fibmap == 1 && errno == EINVAL) {
+-			tst_brkm(TCONF, cleanup,
+-				"Swapfile on %s not implemented", fstype);
+-		} else {
+-			tst_brkm(TFAIL | TERRNO, cleanup,
+-				 "swapon on %s failed", fstype);
+-		}
+-	}
+-
+-	TEST(ltp_syscall(__NR_swapoff, filename, 0));
+-	if (TEST_RETURN == -1) {
+-		tst_brkm(TFAIL | TERRNO, cleanup,
+-			"swapoff on %s failed", fstype);
+-	}
+-}
+Index: git/testcases/kernel/syscalls/swapon/libswapon.h
+===================================================================
+--- git.orig/testcases/kernel/syscalls/swapon/libswapon.h
++++ /dev/null
+@@ -1,39 +0,0 @@
+-/*
+- * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
+- *
+- * This program is free software; you can redistribute it and/or
+- * modify it under the terms of the GNU General Public License as
+- * published by the Free Software Foundation; either version 2 of
+- * the License, or (at your option) any later version.
+- *
+- * This program is distributed in the hope that it would be useful,
+- * but WITHOUT ANY WARRANTY; without even the implied warranty of
+- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+- * GNU General Public License for more details.
+- *
+- * You should have received a copy of the GNU General Public License
+- * along with this program; if not, write the Free Software Foundation,
+- * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+- *
+- * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
+- *
+- */
+-
+-/*
+- * Contains common content for all swapon tests
+- */
+-
+-#ifndef __LIBSWAPON_H__
+-#define __LIBSWAPON_H__
+-
+-/*
+- * Make a swap file
+- */
+-int make_swapfile(void (cleanup)(void), const char *swapfile, int safe);
+-
+-/*
+- * Check swapon/swapoff support status of filesystems or files
+- * we are testing on.
+- */
+-void is_swap_supported(void (cleanup)(void), const char *filename);
+-#endif /* __LIBSWAPON_H__ */
+Index: git/testcases/kernel/syscalls/swapoff/swapoff01.c
+===================================================================
+--- git.orig/testcases/kernel/syscalls/swapoff/swapoff01.c
++++ git/testcases/kernel/syscalls/swapoff/swapoff01.c
+@@ -25,7 +25,7 @@
+ #include <stdlib.h>
+ #include "config.h"
+ #include "lapi/syscalls.h"
+-#include "../swapon/libswapon.h"
++#include "libswapon.h"
+ 
+ static void setup(void);
+ static void cleanup(void);
+Index: git/testcases/kernel/syscalls/swapoff/swapoff02.c
+===================================================================
+--- git.orig/testcases/kernel/syscalls/swapoff/swapoff02.c
++++ git/testcases/kernel/syscalls/swapoff/swapoff02.c
+@@ -33,7 +33,7 @@
+ #include "test.h"
+ #include "lapi/syscalls.h"
+ #include "safe_macros.h"
+-#include "../swapon/libswapon.h"
++#include "libswapon.h"
+ 
+ static void setup(void);
+ static void cleanup(void);
+Index: git/include/libswapon.h
+===================================================================
+--- /dev/null
++++ git/include/libswapon.h
+@@ -0,0 +1,39 @@
++/*
++ * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it would be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write the Free Software Foundation,
++ * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
++ *
++ * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
++ *
++ */
++
++/*
++ * Contains common content for all swapon tests
++ */
++
++#ifndef __LIBSWAPON_H__
++#define __LIBSWAPON_H__
++
++/*
++ * Make a swap file
++ */
++int make_swapfile(void (cleanup)(void), const char *swapfile, int safe);
++
++/*
++ * Check swapon/swapoff support status of filesystems or files
++ * we are testing on.
++ */
++void is_swap_supported(void (cleanup)(void), const char *filename);
++#endif /* __LIBSWAPON_H__ */
diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-extended/ltp/ltp_20210121.bb
index 5fe1a4f012d..f58ca2eb2cb 100644
--- a/meta/recipes-extended/ltp/ltp_20210121.bb
+++ b/meta/recipes-extended/ltp/ltp_20210121.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://determinism.patch \
            file://0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch \
            file://0002-Makefile-Avoid-wildcard-determinism-issues.patch \
+           file://0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -58,14 +59,6 @@ EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
 # ltp network/rpc test cases ftbfs when libtirpc is found
 EXTRA_OECONF += " --without-tirpc "
 
-do_compile_prepend() {
-	# Reported at http://lists.linux.it/pipermail/ltp/2021-March/021274.html
-	# Avoid a race over construction of libswapon.o which is built by swapon and swapoff
-	# but the object differs depending upon which one built it
-	# ("../swapon/libswapon.c" vs "libswapon.c" references)
-	make -C ${B}/testcases/kernel/syscalls/swapon/
-}
-
 do_install(){
     install -d ${D}${prefix}/
     oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
-- 
2.27.0


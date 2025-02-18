Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7798BC02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 13:43:51 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.19583.1739886225821725960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 05:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jlHZ49El;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fc0026eb79so10293550a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 05:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739886224; x=1740491024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dg4jpdrYK4RfiJo3Hok9Fo/BUJNPLtT/HW5BnM2up/A=;
        b=jlHZ49ElwSxDkIGaRW/z2/x/q2JSx0xYyh/nnYmrygUSeX+uYgt9C3L+ZIsqGXEEK8
         gmFGk1KI4CP9W2eSE+krGatG6qBK97J9L8kz+jEr8Jj3Rp7LOZT78xzaUaZiyfZJ4/YG
         pJhxV5be/Rcm+Zw15vrPmZXcwaEeZc+ea6Ktog3SD+EUw81cLgT7YiiW6mUBQNejNeqi
         a4zNt2GnyicaZzKlmhIf+f49KqfBj8aT77U03RtxMDIOsIPYCPUHIo1ta/YrZ+ETjX/1
         yxzAxOP5lpgUxxNjkY++U4s1UIXDa8x/iUQWnx3xq7liWZGBXAwuitgX+QZR8Sj86+WN
         X3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739886224; x=1740491024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dg4jpdrYK4RfiJo3Hok9Fo/BUJNPLtT/HW5BnM2up/A=;
        b=R2WB9CZEWWpXMgP/Ao86uImSQJexP6LkxqKVXMFqyzd1/8n1N2TYCbig8F8u1KIx/8
         o4WTgJUXxXBunCbAcbFlZq3C5eU5low94+/yfRAkFOJd3s3gz3PO7MywDkekTO4VS5aa
         ScH2GiFmKzrrTRE+smsrJa8Oo3/FLzwLxXUFoSiHDSKehlvHVS8MxBdl0Wnnw0NX1Zlp
         xfI+tocSi3KO7hX8AwLE6wTVx7TFuExJN8TprSkAI5oDuYfxRE9AD90TenK3R9kSBTuU
         Phyg4N+H7E5KJk93gDCAtdyaECXDHr7oHS6BTmlG49Lsdf4J++UQ0SRe2hIuFT/n9O7T
         d9Yg==
X-Gm-Message-State: AOJu0Ywh6lg+EbZimjq4qQBExyw7BOJgZAtEwKn2FAuM0Kaa6up4zXYI
	EPuz2mPVi9Cdcxw2CTZ3Yd1RZXHi5JS3xVw8c76mzrIvATfti+5ajsvJCg==
X-Gm-Gg: ASbGncsaiGWeKwvkkwPl645J1dHXqNYOLA0dyqixjScf7duTFlKQcdChxdF/dFn94e3
	2V0eXlvnkBa0OK1OKZUDXVkDHTNVtdW7VaVXgou20OVwc3rXYK9DLs91GHmZCs8wdFH8tlxtSem
	LEkSsje1okxu91wJpYiUS+2uK2m8XwILo0HLOB9aYC3lOEiLGAQ7dtb1VI10ThOQWAITmjAAzSW
	WFmXa4vKkcA8aBI/f53qhVw5ebkPKArR/Am2IXle9uo/vU3EBUWJrQaN/NtFbZpLJrVDsp+odnO
	ffcmk4T7H+fDrKyOpU7sM8tvBYKNtQ==
X-Google-Smtp-Source: AGHT+IFp98442reDH6/xwHH3bDZTaBbC3XoNN8qsAWX/+qmz2Oc2vkMxNnqc2AtW5gLmrati75wcxw==
X-Received: by 2002:a17:90a:ec8d:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-2fc40f0f4f8mr25781066a91.12.1739886224173;
        Tue, 18 Feb 2025 05:43:44 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1519:b6c5:dd34:4b22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ba564bsm10120018a91.40.2025.02.18.05.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 05:43:43 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	raj.khem@gmail.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/2] mtd-utils: Upgrade to 2.3.0
Date: Tue, 18 Feb 2025 10:43:36 -0300
Message-Id: <20250218134336.1976728-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218134336.1976728-1-festevam@gmail.com>
References: <20250218134336.1976728-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211618

Upgrade to mtd-utils 2.3.0.

Details about the 2.3.0 release:

https://lore.kernel.org/linux-mtd/1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at/T/#u

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Fixed musl build errors.

 ...-ubifs-utils-ubifs.h-Include-fcntl.h.patch | 48 +++++++++++++++++++
 ...ifs-utils-journal-Include-sys-stat.h.patch | 37 ++++++++++++++
 ...d-a-check-for-execinfo-and-backtrace.patch | 37 ++++++++++++++
 ...extract_files-Include-linux-limits.h.patch | 37 ++++++++++++++
 ...{mtd-utils_2.2.1.bb => mtd-utils_2.3.0.bb} | 11 ++++-
 5 files changed, 169 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
 create mode 100644 meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
 create mode 100644 meta/recipes-devtools/mtd/files/0003-configure.ac-Add-a-check-for-execinfo-and-backtrace.patch
 create mode 100644 meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
 rename meta/recipes-devtools/mtd/{mtd-utils_2.2.1.bb => mtd-utils_2.3.0.bb} (89%)

diff --git a/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch b/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
new file mode 100644
index 000000000000..c71a46ec28b0
--- /dev/null
+++ b/meta/recipes-devtools/mtd/files/0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch
@@ -0,0 +1,47 @@
+From 2fc872697f72214e1e3efc6c2523e374fa5d681d Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Mon, 17 Feb 2025 16:02:04 -0300
+Subject: [PATCH 1/4] ubifs-utils: ubifs.h: Include <fcntl.h>
+
+Include the <fcntl.h> header file to fix the following error
+when building with musl:
+
+| In file included from ../git/ubifs-utils/common/compr.c:42:
+| ../git/ubifs-utils/libubifs/ubifs.h:313:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
+|   313 |         loff_t ui_size;
+|       |         ^~~~~~
+|       |         off_t
+| ../git/ubifs-utils/libubifs/ubifs.h:1341:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
+|  1341 |         loff_t i_size;
+|       |         ^~~~~~
+|       |         off_t
+| ../git/ubifs-utils/libubifs/ubifs.h:1342:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
+|  1342 |         loff_t d_size;
+|       |         ^~~~~~
+|       |         off_t
+| ../git/ubifs-utils/libubifs/ubifs.h:1899:44: error: unknown type name 'loff_t'; did you mean 'off_t'?
+|  1899 |                              int deletion, loff_t new_size);
+|       |                                            ^~~~~~
+|       |                                            off_t
+| make: *** [Makefile:4878: ubifs-utils/common/mkfs_ubifs-compr.o] Error 1
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/4696c4ad-f22f-191f-a353-9eb761e0213d@huawei.com/T/#t]
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ ubifs-utils/libubifs/ubifs.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ubifs-utils/libubifs/ubifs.h b/ubifs-utils/libubifs/ubifs.h
+index 0908a2289208..1c7bc7bd0c80 100644
+--- a/ubifs-utils/libubifs/ubifs.h
++++ b/ubifs-utils/libubifs/ubifs.h
+@@ -11,6 +11,7 @@
+ #ifndef __UBIFS_H__
+ #define __UBIFS_H__
+
++#include <fcntl.h>
+ #include <string.h>
+
+ #include "linux_types.h"
+--
+2.34.1
diff --git a/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch b/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
new file mode 100644
index 000000000000..8c33d77e28ab
--- /dev/null
+++ b/meta/recipes-devtools/mtd/files/0002-ubifs-utils-journal-Include-sys-stat.h.patch
@@ -0,0 +1,36 @@
+From 65077d8d664821e323d011956049c1c1b97d9560 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Mon, 17 Feb 2025 16:07:49 -0300
+Subject: [PATCH 2/4] ubifs-utils: journal: Include <sys/stat.h>
+
+Include the <sys/stat.h> header file to fix the following error
+when building with musl:
+
+| ../git/ubifs-utils/libubifs/journal.c: In function 'ubifs_get_dent_type':
+| ../git/ubifs-utils/libubifs/journal.c:414:24: error: 'S_IFMT' undeclared (first use in this function)
+|   414 |         switch (mode & S_IFMT) {
+|       |                        ^~~~~~
+| ../git/ubifs-utils/libubifs/journal.c:414:24: note: each undeclared identifier is reported only once for each function it appears in
+| ../git/ubifs-utils/libubifs/journal.c:415:14: error: 'S_IFREG' undeclared (first use in this function)
+|   415 |         case S_IFREG:
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/62081e22-6fd0-0fb3-5c19-0217a50372c3@huawei.com/T/#u]
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ ubifs-utils/libubifs/journal.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ubifs-utils/libubifs/journal.c b/ubifs-utils/libubifs/journal.c
+index e78ea14f3e69..45d82fd54bdb 100644
+--- a/ubifs-utils/libubifs/journal.c
++++ b/ubifs-utils/libubifs/journal.c
+@@ -46,6 +46,7 @@
+  * all the nodes.
+  */
+
++#include <sys/stat.h>
+ #include "bitops.h"
+ #include "kmem.h"
+ #include "ubifs.h"
+--
+2.34.1
diff --git a/meta/recipes-devtools/mtd/files/0003-configure.ac-Add-a-check-for-execinfo-and-backtrace.patch b/meta/recipes-devtools/mtd/files/0003-configure.ac-Add-a-check-for-execinfo-and-backtrace.patch
new file mode 100644
index 000000000000..ec06f8b6838b
--- /dev/null
+++ b/meta/recipes-devtools/mtd/files/0003-configure.ac-Add-a-check-for-execinfo-and-backtrace.patch
@@ -0,0 +1,36 @@
+From cac5fb2d5242bb1beebae60bd1a26aff837460ee Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Mon, 17 Feb 2025 17:22:14 -0300
+Subject: [PATCH 3/4] configure.ac: Add a check for execinfo and backtrace
+
+musl relies on an extenal execinfo library to provide backtrace
+functionality.
+
+Add support for it.
+
+| /work/festevam/oe/poky/build/tmp/work/core2-64-poky-linux-musl/mtd-utils/2.3.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/14.2.0/ld: ubifs-utils/libubifs/mkfs_ubifs-io.o: in function `dump_stack':
+| /usr/src/debug/mtd-utils/2.3.0/ubifs-utils/common/defs.h:71:(.text+0x25): undefined reference to `backtrace'
+....
+| collect2: error: ld returned 1 exit status
+| make: *** [Makefile:2959: mkfs.ubifs] Error 1
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/432bda12-6463-3a0b-4a7d-1c9c1ce44e7a@huawei.com/T/#u]
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 2a79ba820fc0..65afb245d89c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -238,6 +238,7 @@ if test "x$need_cmocka" = "xyes"; then
+	PKG_CHECK_MODULES(CMOCKA, [cmocka], [], [cmocka_missing="yes"])
+ fi
+
++AC_CHECK_LIB([execinfo], [backtrace])
+ AC_CHECK_HEADERS([execinfo.h])
+
+ ##### produce summary on dependencies #####
+--
+2.34.1
diff --git a/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch b/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
new file mode 100644
index 000000000000..ffe4ad34255e
--- /dev/null
+++ b/meta/recipes-devtools/mtd/files/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch
@@ -0,0 +1,36 @@
+From 596922f3989cf0e689df7d7d207ed6f9966c5101 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Tue, 18 Feb 2025 08:17:30 -0300
+Subject: [PATCH 4/4] ubifs-utils: extract_files: Include <linux/limits.h>
+
+Include <linux/limits.h> to fix the following build error when building
+with musl:
+
+| ../git/ubifs-utils/fsck.ubifs/extract_files.c: In function 'parse_ino_node':
+| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: error: 'XATTR_LIST_MAX' undeclared (first use in this function)
+|   144 |         if (ino_node->xnms + ino_node->xcnt > XATTR_LIST_MAX) {
+|       |                                               ^~~~~~~~~~~~~~
+| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: note: each undeclared identifier is reported only once for each function it appears in
+| make: *** [Makefile:4374: ubifs-utils/fsck.ubifs/fsck_ubifs-extract_files.o] Error 1
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/41c00c68-4eba-167f-af41-17223cb43792@huawei.com/T/#u]
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ ubifs-utils/fsck.ubifs/extract_files.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
+index c83d37749bc0..000ef5d10565 100644
+--- a/ubifs-utils/fsck.ubifs/extract_files.c
++++ b/ubifs-utils/fsck.ubifs/extract_files.c
+@@ -10,6 +10,8 @@
+ #include <getopt.h>
+ #include <sys/stat.h>
+
++#include <linux/limits.h>
++
+ #include "linux_err.h"
+ #include "bitops.h"
+ #include "kmem.h"
+--
+2.34.1
diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
similarity index 89%
rename from meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
rename to meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
index 5ab5f6c7298a..09d191ba3231 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
@@ -11,8 +11,15 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-SRCREV = "13ec33609213c1dbd75852a09560a707a7f19a5c"
+DEPENDS:append:libc-musl = " libexecinfo"
+LDFLAGS:append:libc-musl = " -lexecinfo"
+
+SRCREV = "4594fc1f4496a0ed55cabd31fbeba4e3fbf05602"
 SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
+SRC_URI += "file://0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch"
+SRC_URI += "file://0002-ubifs-utils-journal-Include-sys-stat.h.patch"
+SRC_URI += "file://0003-configure.ac-Add-a-check-for-execinfo-and-backtrace.patch"
+SRC_URI += "file://0004-ubifs-utils-extract_files-Include-linux-limits.h.patch"
 
 S = "${WORKDIR}/git"
 
@@ -31,6 +38,8 @@ CPPFLAGS:append:riscv64  = " -pthread -D_REENTRANT"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
 
+CFLAGS += "-D_GNU_SOURCE"
+
 # Use higher priority than corresponding BusyBox-provided applets
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.34.1



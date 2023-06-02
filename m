Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CFCC77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 14:41:29 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.15001.1685716886733421807
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 07:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=ce//i+i6;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6262be06e2eso19383966d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685716885; x=1688308885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrK3SFsMLpWtSq2O7NOeCgBRyJhVizzjS+b2h1hW63s=;
        b=ce//i+i666u5x5S6BW7dV9Q0VH6E45NBejrnQK1vmO5wzMayA/FyCEWFAWY4Agq2rH
         w2b04+uERO/yFC9MRj8pogvf5uXIrdtx++VqWNj4OBr87deQibLJOEX43VMgLUD1gh96
         Ia9BHUFWnEapeYS9J6rGZh/HRHlBvfZKMoQeQE/6WLF/VWuwx4vC4G/+7ybEzYosnSEh
         aqWWuA2RnMsd0vxclH/Saj9jT0MlQ1xxwBj8301gjaEr6wpgwi9ACakI7g/LEv/Hag7U
         y6ZAfdC/1YGDWS1N2sL/31/tmnGLzTw1uWakk0TsqSKE9NFwduGiSsTAe5kcgXLUl9Ll
         N+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685716885; x=1688308885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrK3SFsMLpWtSq2O7NOeCgBRyJhVizzjS+b2h1hW63s=;
        b=YxZQi24xi8OdUcS6PADlfasPYqaAzNaByUgfYFTzED6y0wG55vHTw1CbcGS+g7w7NQ
         9tVDKQDVR7FwChTRQFU6u/8EwYphAL6LGbQiSaAK/Ck+IsH/7xP3S3mhcBEaZo32mO7H
         9EhcYKgxJz0DmTf+CXalUSGQ3hOvIF7KiRW8Ab261Xv8YJxHxsQW1Q658L4e6DVlBZAa
         vGq1RUZTKAtnPG6A+jkWW0hDZJX7nqcL8wtP9J3DyZvPBqdRUheWWQkhxPVwjDuW8psT
         B6dSQRoVTM7jOqwv5vY3/8A18BLCGXYhlw98A1THhqyu+kANveAkF9R0x0IS/sAm++yX
         0IAQ==
X-Gm-Message-State: AC+VfDw2gk2mH8OHV3g/qcMKp83MhhUT+b5h0G4jZ5bB0os26wS6NJ2z
	SsIRs5+KhFVhLj/1yR27nA4KqwldI6igB0nfIUQ=
X-Google-Smtp-Source: ACHHUZ7h8u3//f3he6As/QeVYNtupLsVSUkhvKKTQ51V/ACrm2pPD3DguklmdM0Bu87/ZbV5zN5xIQ==
X-Received: by 2002:a05:6214:21ab:b0:625:a982:857 with SMTP id t11-20020a05621421ab00b00625a9820857mr12579998qvc.50.1685716885349;
        Fri, 02 Jun 2023 07:41:25 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id c10-20020ac853ca000000b003ef2c959d1bsm828034qtq.67.2023.06.02.07.41.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 07:41:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] util-linux: upgrade 2.38.1 -> 2.39
Date: Fri,  2 Jun 2023 10:41:24 -0400
Message-Id: <20230602144124.923028-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 14:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182333

util-linux's ChangeLog file simply points to the git log, and there are
numerous changes between 2.38.1 and 2.39:

https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/log

There is a notable license change - README.licensing adds the
BSD-2-Clause variant between these versions, but there is no
corresponding file in Documentation/licenses; it's been added it under
LICENSE in the recipe along with a reference to the common-licenses
version. The README.licensing file also lists GPL-3.0-or-later for
some of the code, so add it as well and include a checksum.

Two patches were removed since they're included in 2.39 upstream.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 properly deletes the two patch files instead of simply removing them
from the recipe.
 ...d_2.38.1.bb => util-linux-libuuid_2.39.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   | 10 ++--
 .../0001-check-for-sys-pidfd.h.patch          | 53 -------------------
 ...configure.ac-Improve-check-for-magic.patch | 40 --------------
 ...til-linux_2.38.1.bb => util-linux_2.39.bb} |  0
 5 files changed, 5 insertions(+), 98 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.1.bb => util-linux-libuuid_2.39.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
 rename meta/recipes-core/util-linux/{util-linux_2.38.1.bb => util-linux_2.39.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3868b1c41d..f9e6fb7d21 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,16 +6,18 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause & BSD-4-Clause"
+LICENSE = "GPL-3.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause"
 LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
 LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=12ae7768a65ec8f2e44d930df9cb43fa \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.GPL-3.0-or-later;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
+                    file://${COREBASE}/meta/files/common-licenses/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
                     file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af \
                     file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
                     file://libuuid/COPYING;md5=6d2cafc999feb2c2de84d4d24b23290c \
@@ -35,8 +37,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-check-for-sys-pidfd.h.patch \
-           file://0001-configure.ac-Improve-check-for-magic.patch \
            "
 
-SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
+SRC_URI[sha256sum] = "32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43efb88d37162075cb"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch b/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
deleted file mode 100644
index 19f57f14bc..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 548bc568f3c735e53fb5b0a5ab6473a3f1457b91 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 7 Aug 2022 14:39:19 -0700
-Subject: [PATCH] check for sys/pidfd.h
-
-This header in newer glibc defines the signatures of functions
-pidfd_send_signal() and pidfd_open() and when these functions are
-defined by libc then we need to include the relevant header to get
-the definitions. Clang 15+ has started to error out when function
-signatures are missing.
-
-Fixes errors like
-misc-utils/kill.c:402:6: error: call to undeclared function 'pidfd_send_signal'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-        if (pidfd_send_signal(pfd, ctl->numsig, &info, 0) < 0)
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/1769]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac          | 1 +
- include/pidfd-utils.h | 4 +++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a511e93de..fd7d9245f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -342,6 +342,7 @@ AC_CHECK_HEADERS([ \
- 	sys/mkdev.h \
- 	sys/mount.h \
- 	sys/param.h \
-+	sys/pidfd.h \
- 	sys/prctl.h \
- 	sys/resource.h \
- 	sys/sendfile.h \
-diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
-index eddede976..d9e33cbc5 100644
---- a/include/pidfd-utils.h
-+++ b/include/pidfd-utils.h
-@@ -4,8 +4,10 @@
- #ifdef HAVE_SYS_SYSCALL_H
- # include <sys/syscall.h>
- # if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
-+#  ifdef HAVE_SYS_PIDFD_H
-+#   include <sys/pidfd.h>
-+#  endif
- #  include <sys/types.h>
--
- #  ifndef HAVE_PIDFD_SEND_SIGNAL
- static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
- 				    unsigned int flags)
--- 
-2.37.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
deleted file mode 100644
index 00611fe578..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 263381ddd46eea2293c70bc811273b66bc52087b Mon Sep 17 00:00:00 2001
-From: Mateusz Marciniec <mateuszmar2@gmail.com>
-Date: Fri, 19 Aug 2022 14:47:49 +0200
-Subject: [PATCH] configure.ac: Improve check for magic
-
-Check whether magic.h header exists before defining HAVE_MAGIC.
-
-Despite library availability there still can be missing header.
-Current test doesn't cover that possibility which will lead compilation
-to fail in case of separate sysroot.
-
-Upstream-Status: Backport
-[https://github.com/util-linux/util-linux/commit/263381ddd46eea2293c70bc811273b66bc52087b]
-
-Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
-Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
----
- configure.ac | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index daa8f0dca..968a0daf0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1570,8 +1570,10 @@ AC_ARG_WITH([libmagic],
- )
- AS_IF([test "x$with_libmagic" = xno], [have_magic=no], [
-   AC_CHECK_LIB([magic], [magic_open], [
--    AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
--    MAGIC_LIBS="-lmagic"
-+    AC_CHECK_HEADER(magic.h, [
-+      AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
-+      MAGIC_LIBS="-lmagic"
-+    ])
-   ])
- ])
- AC_SUBST([MAGIC_LIBS])
--- 
-2.37.1
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recipes-core/util-linux/util-linux_2.39.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.38.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.39.bb
-- 
2.40.1



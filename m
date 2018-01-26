Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E44F478761
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 07:06:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36008419"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jan 2018 15:06:35 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id EC48449F19B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 15:06:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 26 Jan 2018 15:06:32 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jan 2018 15:06:32 +0800
Message-ID: <1516950393-15372-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516950393-15372-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516950393-15372-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: EC48449F19B1.A8115
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH V2] blktrace: 1.1.0+gitX -> 1.2.0+gitX
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
X-List-Received-Date: Fri, 26 Jan 2018 07:06:35 -0000
Content-Type: text/plain

1.Upgrade blktrace form 1.1.0+gitX to 1.2.0+gitX
2.Delete 0001-include-sys-types.h-for-dev_t-definition.patch, since it is integrated upstream.
3.Modify ldflags.patch, since iowatcher/Makefile has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...-include-sys-types.h-for-dev_t-definition.patch | 30 ----------------------
 .../recipes-kernel/blktrace/blktrace/ldflags.patch |  6 ++---
 meta/recipes-kernel/blktrace/blktrace_git.bb       |  5 ++--
 3 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch b/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
deleted file mode 100644
index a4b7157..0000000
--- a/meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 6b5bbdfaac7f216fe8a02c4cf29e5eb2aee5a409 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Sep 2015 00:01:00 +0000
-Subject: [PATCH] include sys/types.h for dev_t definition
-
-Avoids the build failures when sys/types.h does not get included
-indirectly through other headers.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- blktrace.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/blktrace.h b/blktrace.h
-index 380aec7..944fc08 100644
---- a/blktrace.h
-+++ b/blktrace.h
-@@ -5,6 +5,7 @@
- #include <limits.h>
- #include <byteswap.h>
- #include <endian.h>
-+#include <sys/types.h>
- 
- #include "blktrace_api.h"
- #include "rbtree.h"
--- 
-2.5.2
-
diff --git a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
index dea1aa2..29eb0f2 100644
--- a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
+++ b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
@@ -90,7 +90,7 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
 +++ git/iowatcher/Makefile
 @@ -1,5 +1,6 @@
  C      = gcc
- CFLAGS  = -Wall -O0 -g -W
+ CFLAGS  = -Wall -O2 -g -W -Wunused-result
 +LDFLAGS =
  ALL_CFLAGS = $(CFLAGS) -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
  
@@ -99,8 +99,8 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
  	$(CC) -o $*.o -c $(ALL_CFLAGS) $<
  
  iowatcher: blkparse.o plot.o main.o tracers.o mpstat.o fio.o
--	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) -lm
-+	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) -lm $(LDFLAGS)
+-	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) -lm -lrt
++	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) -lm $(LDFLAGS) -lrt
  
  depend:
  	@$(CC) -MM $(ALL_CFLAGS) *.c 1> .depend
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 770575f..663de2e 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -5,13 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libaio"
 
-SRCREV = "43fc870ce04e963def45dfc0d1ed4ea21ef10d4b"
+SRCREV = "cca113f2fe0759b91fd6a0e10fdcda2c28f18a7e"
 
-PV = "1.1.0+git${SRCPV}"
+PV = "1.2.0+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git \
            file://ldflags.patch \
-           file://0001-include-sys-types.h-for-dev_t-definition.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4





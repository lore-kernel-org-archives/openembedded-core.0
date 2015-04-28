Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A65C73D53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 03:43:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3S3hYtO021287
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 20:43:34 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Apr 2015 20:43:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Apr 2015 20:43:29 -0700
Message-ID: <6bda4597d46f1db9adbed4f3ac5f9c865ef7f88c.1430192424.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1430192424.git.liezhi.yang@windriver.com>
References: <cover.1430192424.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/11] libaio: remove libaio-generic.patch
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
X-List-Received-Date: Tue, 28 Apr 2015 03:43:33 -0000
Content-Type: text/plain

It is already in the source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libaio/libaio/libaio-generic.patch             |   65 --------------------
 1 file changed, 65 deletions(-)
 delete mode 100644 meta/recipes-extended/libaio/libaio/libaio-generic.patch

diff --git a/meta/recipes-extended/libaio/libaio/libaio-generic.patch b/meta/recipes-extended/libaio/libaio/libaio-generic.patch
deleted file mode 100644
index 3fcf541..0000000
--- a/meta/recipes-extended/libaio/libaio/libaio-generic.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 5e96c73d5dfbdea8d0be82b7f3fc8d6735e5dfa7 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Sun, 17 Jan 2010 17:07:48 -0500
-Subject: [PATCH] add a generic syscall() fallback
-
-Upstream-Status: Pending
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
----
- src/syscall-generic.h |   29 +++++++++++++++++++++++++++++
- src/syscall.h         |    3 ++-
- 2 files changed, 31 insertions(+), 1 deletions(-)
- create mode 100644 src/syscall-generic.h
-
-diff --git a/src/syscall-generic.h b/src/syscall-generic.h
-new file mode 100644
-index 0000000..24d7c7c
---- /dev/null
-+++ b/src/syscall-generic.h
-@@ -0,0 +1,29 @@
-+#include <errno.h>
-+#include <unistd.h>
-+#include <sys/syscall.h>
-+
-+#define _body_io_syscall(sname, args...) \
-+{ \
-+   int ret = syscall(__NR_##sname, ## args); \
-+   return ret < 0 ? -errno : ret; \
-+}
-+
-+#define io_syscall1(type,fname,sname,type1,arg1) \
-+type fname(type1 arg1) \
-+_body_io_syscall(sname, (long)arg1)
-+
-+#define io_syscall2(type,fname,sname,type1,arg1,type2,arg2) \
-+type fname(type1 arg1,type2 arg2) \
-+_body_io_syscall(sname, (long)arg1, (long)arg2)
-+
-+#define io_syscall3(type,fname,sname,type1,arg1,type2,arg2,type3,arg3) \
-+type fname(type1 arg1,type2 arg2,type3 arg3) \
-+_body_io_syscall(sname, (long)arg1, (long)arg2, (long)arg3)
-+
-+#define io_syscall4(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4) \
-+type fname (type1 arg1, type2 arg2, type3 arg3, type4 arg4) \
-+_body_io_syscall(sname, (long)arg1, (long)arg2, (long)arg3, (long)arg4)
-+
-+#define io_syscall5(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4, type5,arg5) \
-+type fname (type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5) \
-+_body_io_syscall(sname, (long)arg1, (long)arg2, (long)arg3, (long)arg4, (long)arg5)
-diff --git a/src/syscall.h b/src/syscall.h
-index 78becfe..d954af0 100644
---- a/src/syscall.h
-+++ b/src/syscall.h
-@@ -25,5 +25,6 @@
- #elif defined(__arm__)
- #include "syscall-arm.h"
- #else
--#error "add syscall-arch.h"
-+#warning "using generic syscall method"
-+#include "syscall-generic.h"
- #endif
--- 
-1.7.3.1
-
-- 
1.7.9.5



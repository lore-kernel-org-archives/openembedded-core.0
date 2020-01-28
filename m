Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4817BD97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 03:58:49 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id y5so2862948pfb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 19:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kOuE8UhwmYiUaORZOIPSOb+JhV9gLwt/AeA64SbceFw=;
	b=jfQM/hPrvFDmEUMlcF7XrNioSR0v828l+4C3po9Ayc5RA//o+lBU4PerYI/Ae5r09p
	7FKmd6wLZLP457vYEn+kCsL6/nmATKWwbyo3Avjs5ahkhcWCxhAnBtXwWmKvsTe8UdpS
	4XVlS94+DFhlsc8szFOzoEYRyZZlBs8CtPH9g34PqVYANQhZWODRzEbsPoXfg6ZYZ2Zz
	o+vfyBmHH4R78Z9hDO8DrMTFIIs60EXTbMmh4ffXwBStM8DEf+0MfI+DzrFitd/VmQ7e
	ddJngCuVmEj3oZZ8cTYmbxXVMsRkPMjhXEKHHHL4SpdC3p+yWECEyZp7W/XPKT3xhl4K
	/a6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kOuE8UhwmYiUaORZOIPSOb+JhV9gLwt/AeA64SbceFw=;
	b=g9KXQFHGliTgbDx7/wGGMGGA5/Q8WqAyIK1Dzrwr3vDBuh5BOt1XBwPewi5rwTC/BR
	4PN5MeXblDobZ66PoNCMSs9Yi+OdvCCDV5DqZ+6DxDndtQeaLxmEeYY5MfOw5IrDbcPr
	6b4oqZKUe+pE1dKVMLREYADWuB8jOtOc3/4iEcCLpzLhDV72MRcYRStq5Ns5NvTkd7Tk
	DkE5Vsq1+PSv6GJVCY5HrN6N8IMqLwFqIHgaBiaSgg8ChPLwottoMVXoj7XW0C6/CjJ5
	KxOsik+Laxp/vzXb9IO2f+j8cKBcTrqOHpQcZmvF3nmmOQvXwku/d9rPiHcSVG0GY4Ma
	Ao1w==
X-Gm-Message-State: APjAAAWLnOklLiY1hRgT8qD/oJR/FxlH18Kbe8ZImnBDv8VRu5xZ427b
	uX2PogjZevx4nndGNvh0NpsBqUxzW1o=
X-Google-Smtp-Source: APXvYqwsB5qVT41TiUIxJ4ujI5ipEqWNrvbqIjD+ygczJhJEoCFbsamxBXWGB9uOQVY/T5a+eKaBLw==
X-Received: by 2002:a63:e513:: with SMTP id r19mr23028401pgh.326.1580183929749;
	Mon, 27 Jan 2020 19:58:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	l186sm17580336pge.31.2020.01.27.19.58.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 19:58:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 19:58:50 -0800
Message-Id: <20200128035850.2629175-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH v2] valgrind: Fix ptest builds on musl
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
X-List-Received-Date: Tue, 28 Jan 2020 03:58:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
v2: Use uintptr_t instead of long

 ...ad_detatch-call-portable-across-plat.patch | 44 +++++++++++++++++++
 .../valgrind/valgrind_3.15.0.bb               |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch
new file mode 100644
index 0000000000..44d707a235
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch
@@ -0,0 +1,44 @@
+From 90fdb0ae0418f7907f09b763343a457bdf6855fa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 27 Jan 2020 17:17:19 -0800
+Subject: [PATCH] tests: Make pthread_detatch call portable across platforms
+
+pthread_t is opaque type therefore we can not apply simple arithmetic to variables of pthread_t type
+this test needs to pass a invalid pthread_t handle, typcasting to uintptr_t works too and is portable
+across glibc and musl
+
+Fixes
+| pth_detached3.c:24:25: error: invalid use of undefined type 'struct __pthread'
+|    24 |   pthread_detach(thread + 8);
+|       |                         ^
+
+Upstream-Status: Submitted [https://sourceforge.net/p/valgrind/mailman/message/36910506/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ drd/tests/pth_detached3.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/drd/tests/pth_detached3.c b/drd/tests/pth_detached3.c
+index c02eef11a..efeb15b72 100644
+--- a/drd/tests/pth_detached3.c
++++ b/drd/tests/pth_detached3.c
+@@ -4,6 +4,7 @@
+ #include <errno.h>
+ #include <pthread.h>
+ #include <stdio.h>
++#include <stdint.h>
+ 
+ static void* thread_func(void* arg)
+ {
+@@ -21,7 +22,7 @@ int main(int argc, char** argv)
+   pthread_detach(thread);
+ 
+   /* Invoke pthread_detach() with an invalid thread ID. */
+-  pthread_detach(thread + 8);
++  pthread_detach((pthread_t)((uintptr_t)thread + 8));
+ 
+   fprintf(stderr, "Finished.\n");
+ 
+-- 
+2.25.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 0f86aa44ca..1475ff841e 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-adjust-path-filter-for-2-memcheck-tests.patch \
            file://s390x_vec_op_t.patch \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
+           file://0001-tests-Make-pthread_detatch-call-portable-across-plat.patch \
            "
 SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
 SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
-- 
2.25.0



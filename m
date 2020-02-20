Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4F99460ADE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:50:39 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id k29so2171888pfp.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RAppxFQD3tcmJoWuoQOnVI50mCSVNCKfBcX18ICeszo=;
	b=I9O2m3rQj1/0mwAX41o5nvnuf0dywqME17r6csThmJY5W4NVphJGPVmUkA/6CQMKvs
	uoVLEnWMgzq5Sp1rt1mQrLJEF2sxve3TYc2zmyZfi2T8yrNI2UzCT3R9CKVuovc5deMO
	jeQjHyjTJBlO07GrpsX+YREqreciwyWka+g8Bxj/0dhxTQoL72bsbkwOwA4F9IM724wi
	ZHKWR4HKT4RmdGd9oOueZiz5SKimhJZiA2/tUfpo/2x3eBTVwPB3rj4jf93zlrNIIsry
	3eEMINkPv1oezSvZ/CwwI2R2DdZp/3IOB0Jk9+G0NkRUx0gwEY5UXmk3laWccItC1T3d
	wddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RAppxFQD3tcmJoWuoQOnVI50mCSVNCKfBcX18ICeszo=;
	b=ekBVjLgvm/qnm5bTiQ6LHadRRt2Fw7bemkF9lD3C+B+hePUcB67IydQ55Pzmh/mMWV
	MsKJj0KGgi4kNY7b1jdknVsh0mnnc78RTxb7x4U57uXZGaZmzxMie2z7Mp5xsSjGpT+f
	y/KKbWVhur1aNdKpyE1feycpk2dvtDYRgDlCE8pLIq6a/LOvKwzXKaWIXBBDcvHAwucZ
	2yxipPSGD7+07EEfEwkWhHeoVxCtj1JFsirzk/IjBvy7pRWGQw6Q1MtRzCVduaNBKNSl
	OoNccYK3rXeTfzHD6xS/3juyJtkqfvspXsgfPbhI3bP+yXHB6JMMRSBFQaRgpgtsxZEQ
	ao0g==
X-Gm-Message-State: APjAAAWGID16p0nvxS79mKvavN+PPFn42frbza5euMNgU5D+jLo5BtEy
	vGopSDNoYTtWpXY8pgKRzceBXM6RPgI=
X-Google-Smtp-Source: APXvYqxSXzRMnjom03u6/C1y80GXKew8vpqskYrlDbkto017Sa8tjOriiO3LBfSG/Q9c6J6hhNgoVA==
X-Received: by 2002:a63:f0a:: with SMTP id e10mr30833333pgl.402.1582217439760; 
	Thu, 20 Feb 2020 08:50:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	z30sm114325pfq.154.2020.02.20.08.50.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 08:50:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 08:50:50 -0800
Message-Id: <20200220165050.3590678-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] ltp: Use upstreamed patch for time64 syscall fixes
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
X-List-Received-Date: Thu, 20 Feb 2020 16:50:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...or-time64-unsafe-syscalls-before-usi.patch | 109 +++++++++++-------
 1 file changed, 66 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch
index 92e5fdfe6e..c431669716 100644
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch
@@ -1,4 +1,4 @@
-From 09e631419d9763a4ff08b32d9801c12b475d8ec5 Mon Sep 17 00:00:00 2001
+From b66905b094e08a84c30bc135003c3611f65d53ec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 12 Feb 2020 22:22:17 -0800
 Subject: [PATCH] syscalls: Check for time64 unsafe syscalls before using them
@@ -7,75 +7,98 @@ musl is using 64bit time_t now on 32bit architectures and these syscalls
 no longer exist, therefore its better to check for them being available
 before using them
 
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2020-February/015400.html]
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/patch/1241258/]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- lib/tst_clocks.c                                        | 9 +++++++++
- testcases/kernel/syscalls/gettimeofday/gettimeofday01.c | 4 ++++
- testcases/kernel/syscalls/gettimeofday/gettimeofday02.c | 4 ++++
- 3 files changed, 17 insertions(+)
+ lib/tst_clocks.c                                        | 9 +++++----
+ testcases/kernel/syscalls/gettimeofday/gettimeofday01.c | 6 ++----
+ testcases/kernel/syscalls/gettimeofday/gettimeofday02.c | 8 +++-----
+ 3 files changed, 10 insertions(+), 13 deletions(-)
 
-diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
-index 35798a4aaf..6a5b05c4ea 100644
 --- a/lib/tst_clocks.c
 +++ b/lib/tst_clocks.c
-@@ -28,15 +28,24 @@
+@@ -22,21 +22,22 @@
+ #define _GNU_SOURCE
+ #include <unistd.h>
+ #include <time.h>
+-#include <sys/syscall.h>
+-
++#define TST_NO_DEFAULT_MAIN
++#include "tst_test.h"
+ #include "tst_clocks.h"
++#include "lapi/syscalls.h"
  
  int tst_clock_getres(clockid_t clk_id, struct timespec *res)
  {
-+#if defined(__NR_clock_getres)
- 	return syscall(SYS_clock_getres, clk_id, res);
-+#endif
-+	return -1;
+-	return syscall(SYS_clock_getres, clk_id, res);
++	return tst_syscall(__NR_clock_getres, clk_id, res);
  }
  
  int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
  {
-+#if defined(__NR_clock_gettime)
- 	return syscall(SYS_clock_gettime, clk_id, ts);
-+#endif
-+	return -1;
+-	return syscall(SYS_clock_gettime, clk_id, ts);
++	return tst_syscall(__NR_clock_gettime, clk_id, ts);
  }
  
  int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
  {
-+#if defined(__NR_clock_settime)
- 	return syscall(SYS_clock_settime, clk_id, ts);
-+#endif
-+	return -1;
+-	return syscall(SYS_clock_settime, clk_id, ts);
++	return tst_syscall(__NR_clock_settime, clk_id, ts);
  }
-diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
-index 583d8f7b9b..b498de5b68 100644
 --- a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
 +++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
-@@ -41,7 +41,11 @@
- #include <sys/syscall.h>
+@@ -38,10 +38,8 @@
+ #include <sys/time.h>
+ #include <errno.h>
+ #include "test.h"
+-#include <sys/syscall.h>
  #include <unistd.h>
- 
-+#ifdef __NR_gettimeofday
- #define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
-+#else
-+#define gettimeofday(a,b) (-1)
-+#endif
+-
+-#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
++#include "lapi/syscalls.h"
  
  char *TCID = "gettimeofday01";
  int TST_TOTAL = 1;
-diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
-index 1d60f448e8..218e017df8 100644
+@@ -63,7 +61,7 @@ int main(int ac, char **av)
+ 	for (lc = 0; TEST_LOOPING(lc); lc++) {
+ 		tst_count = 0;
+ 
+-		TEST(gettimeofday((void *)-1, (void *)-1));
++		TEST(ltp_syscall(__NR_gettimeofday, (void *)-1, (void *)-1));
+ 
+ 		/* gettimeofday returns an int, so we need to turn the long
+ 		 * TEST_RETURN into an int to test with */
 --- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
 +++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
-@@ -23,7 +23,11 @@
+@@ -16,14 +16,12 @@
+ #include <stdint.h>
+ #include <sys/time.h>
+ #include <stdlib.h>
+-#include <sys/syscall.h>
+ #include <unistd.h>
+ #include <time.h>
+ #include <errno.h>
  
  #include "tst_test.h"
- 
-+#ifdef __NR_gettimeofday
- #define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
-+#else
-+#define gettimeofday(a,b) (-1)
-+#endif
+-
+-#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
++#include "lapi/syscalls.h"
  
  static volatile sig_atomic_t done;
  static char *str_rtime;
--- 
-2.25.0
-
+@@ -48,13 +46,13 @@ static void verify_gettimeofday(void)
+ 
+ 	alarm(rtime);
+ 
+-	if (gettimeofday(&tv1, NULL)) {
++	if (tst_syscall(__NR_gettimeofday, &tv1, NULL)) {
+ 		tst_res(TBROK | TERRNO, "gettimeofday() failed");
+ 		return;
+ 	}
+ 
+ 	while (!done) {
+-		if (gettimeofday(&tv2, NULL)) {
++		if (tst_syscall(__NR_gettimeofday, &tv2, NULL)) {
+ 			tst_res(TBROK | TERRNO, "gettimeofday() failed");
+ 			return;
+ 		}
-- 
2.25.1



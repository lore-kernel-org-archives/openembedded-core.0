Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 47C7A60C0C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:22:06 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 6so2696368pgk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=E9EG1+2jtMTieMwWyt51hTUQq98X0mhg+rvDj/bjknk=;
	b=j7vc6ucnsuyKNd1SxGYylYae31jGMUVp0KJYRuoPG8YviL2BB1O7RQlTN/LDA5ZmxI
	Pb3mzWd6Q/fzaadyzgoxeY0kCB3kx/FGp+X3vXyfkb/iP/k0BmzbcmgELhIEUraIdncM
	ndGDfXMmaTLIG0GfsWjdcJH4ZwCYycAXHHi5x4ebmXVsZxLeopkneQ9nDmHrEAd7q+Q8
	KkqJn6+l86Lny7Ois84NxUPbNxhvluuHpOz0tqx+oj/P/CkH1CFgL3xAgNRnCs4wtZ27
	xCZwIjUsSEV54mUYRTWKz1an7eps95Vyw6vBQc0AR8+XuAzu6ckDPZmeN33zrYF++9Ny
	vAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E9EG1+2jtMTieMwWyt51hTUQq98X0mhg+rvDj/bjknk=;
	b=XbrBAS3oFWjJeEJUvJi5DN0bMXesqy1+qduD74iSTz+KKGNIp+016NDIDBTSozk6za
	Rp11W85EN2tXNPwJFjWznXINckoxGuLlAyOBZ169znRMfYbVuxBUhRG4MPdiJgoRh14V
	xv9xIhkjbIuQ9D2s/6xpnFLXF+wjdErOv+FAn0j3ZJaxsHzXZ+NujLpHpctHebaw3Vrm
	qLW/yuaJxk+GGU3kLSZf1Zle+A+m/J9hgjts/esr73QZ9bm7UnGTZIZm6vsiYgdSTQlX
	0RzO94gENnMSqcwBoLs6AV+lw8sr0WKlHolSFOCQA+XTSr4IGJpb+TzWvihsKnZ3u9hF
	2XXg==
X-Gm-Message-State: APjAAAX7yu6rgQaAoXf7qoKiUDCpKot44IuTOcyS+sE8fMI3nRt3+MlI
	TUKeT9FTQ7Z70m03sR9vg7CfVAFSTR4=
X-Google-Smtp-Source: APXvYqx9YsaFuparzmSY23xOZagL8y6y7MwNktQEuPlsruRNZzRkSHQCfCVsC1C9nOn8SB19/YztiA==
X-Received: by 2002:a62:fb06:: with SMTP id x6mr12331917pfm.149.1581582126569; 
	Thu, 13 Feb 2020 00:22:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	f127sm1958085pfa.112.2020.02.13.00.22.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 00:22:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 00:21:57 -0800
Message-Id: <7c9d0ee973049010b4a49b2391f3da7ea75b29dc.1581580428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581580428.git.raj.khem@gmail.com>
References: <cover.1581580428.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] ltp: Fix tescases with 64bit time_t using 32bit arches
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
X-List-Received-Date: Thu, 13 Feb 2020 08:22:06 -0000
Content-Transfer-Encoding: 8bit

This helps it compile on musl

Fixes
| tst_clocks.c:31:17: error: 'SYS_clock_getres' undeclared (first use in this function); did you mean 'tst_clock_getres

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...or-time64-unsafe-syscalls-before-usi.patch | 81 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190930.bb     |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch
new file mode 100644
index 0000000000..92e5fdfe6e
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch
@@ -0,0 +1,81 @@
+From 09e631419d9763a4ff08b32d9801c12b475d8ec5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Feb 2020 22:22:17 -0800
+Subject: [PATCH] syscalls: Check for time64 unsafe syscalls before using them
+
+musl is using 64bit time_t now on 32bit architectures and these syscalls
+no longer exist, therefore its better to check for them being available
+before using them
+
+Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2020-February/015400.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/tst_clocks.c                                        | 9 +++++++++
+ testcases/kernel/syscalls/gettimeofday/gettimeofday01.c | 4 ++++
+ testcases/kernel/syscalls/gettimeofday/gettimeofday02.c | 4 ++++
+ 3 files changed, 17 insertions(+)
+
+diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
+index 35798a4aaf..6a5b05c4ea 100644
+--- a/lib/tst_clocks.c
++++ b/lib/tst_clocks.c
+@@ -28,15 +28,24 @@
+ 
+ int tst_clock_getres(clockid_t clk_id, struct timespec *res)
+ {
++#if defined(__NR_clock_getres)
+ 	return syscall(SYS_clock_getres, clk_id, res);
++#endif
++	return -1;
+ }
+ 
+ int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
+ {
++#if defined(__NR_clock_gettime)
+ 	return syscall(SYS_clock_gettime, clk_id, ts);
++#endif
++	return -1;
+ }
+ 
+ int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
+ {
++#if defined(__NR_clock_settime)
+ 	return syscall(SYS_clock_settime, clk_id, ts);
++#endif
++	return -1;
+ }
+diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
+index 583d8f7b9b..b498de5b68 100644
+--- a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
++++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
+@@ -41,7 +41,11 @@
+ #include <sys/syscall.h>
+ #include <unistd.h>
+ 
++#ifdef __NR_gettimeofday
+ #define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
++#else
++#define gettimeofday(a,b) (-1)
++#endif
+ 
+ char *TCID = "gettimeofday01";
+ int TST_TOTAL = 1;
+diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
+index 1d60f448e8..218e017df8 100644
+--- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
++++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
+@@ -23,7 +23,11 @@
+ 
+ #include "tst_test.h"
+ 
++#ifdef __NR_gettimeofday
+ #define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
++#else
++#define gettimeofday(a,b) (-1)
++#endif
+ 
+ static volatile sig_atomic_t done;
+ static char *str_rtime;
+-- 
+2.25.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20190930.bb b/meta/recipes-extended/ltp/ltp_20190930.bb
index 2853b1c819..19bd7bc9c6 100644
--- a/meta/recipes-extended/ltp/ltp_20190930.bb
+++ b/meta/recipes-extended/ltp/ltp_20190930.bb
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-testcases-fix-an-absent-format-string-issue.patch \
            file://0001-Add-more-musl-exclusions.patch \
            file://0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch \
+           file://0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.0



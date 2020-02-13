Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 279A960BD1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:38:28 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p11so1936954plq.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=E9EG1+2jtMTieMwWyt51hTUQq98X0mhg+rvDj/bjknk=;
	b=gb0LxHxIkqX2UP11OdO+bjQY8nskVsOASTDpQaMj1L3m+6V8EZr1Y3iMMnQWjM5r2T
	8LTXHyFKFcbtzfUFlRzzO95RhYOM0hD9D5lcjOZyjAv4S60nhR1SlGee8/LFm1eSRMA7
	U0tL4W8MqcqeJcngBZOQNxEtuFkk3S3VIVjEaEbdcheEDiRw6J+ZrXTAuqKCDc9RYst5
	WljwR9OycobGITpreOMLCYWOpu8Ajhp20WF8JCeBEOUpuFCDcUr6qPktAipZE/x75s8l
	pvwAkW8boO9LpacsoL9saeafVD7LH6+W9D7I9WfYELOO7QHX1rlERTHfIchnGHuMTTEV
	/bfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E9EG1+2jtMTieMwWyt51hTUQq98X0mhg+rvDj/bjknk=;
	b=Z41Q1mrnzcZHSWYuVvJ4yN1yR9hR3+e4pW8k2d6lJpSNAnB8eOBbMmY35ue0rKOLbF
	4DrH2BLpvPLmtceG4nZ8Vin/dqv+vsoeYasUZhlazY7TCBbT7Y8fSltqYh56xKUSGbC2
	FpEQl5tcOiLPEFC3hRikA8odJZ1hiQ23Ec8k9T54vtJdo0j5Tbc8moIV4VSRV+13184y
	apqANKa4MiRiwMATL9R4u+KwVC7a2849Aggb4dHpscbm004RkamYCk0sog87OdFJHRzE
	0MHu6betno9yr/+yGpE0a1ne+xrm02qr1ECCJ3I1138LaQamPMnv8lBAO2Bfmuc5Ce5N
	dLwQ==
X-Gm-Message-State: APjAAAU0MM87sCZ9GX1I/qLl80ZkCBY4zkcKgS8KuEzK1qO7nkgHZ8kg
	PLpYIxBZHXRkMY0hkr1j+tR3VU47sTI=
X-Google-Smtp-Source: APXvYqzHFuoKVSWR9ioXdZv8m6y3G/Avxffq0D9hzY+jWwV7H2Oy6NnArFEvoaRYPP78SqcYMWhQ3w==
X-Received: by 2002:a17:90a:3ae5:: with SMTP id
	b92mr3266650pjc.26.1581575908680; 
	Wed, 12 Feb 2020 22:38:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	k63sm1170302pjb.10.2020.02.12.22.38.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 22:38:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 22:38:23 -0800
Message-Id: <02efd07db0d224016689a0a43321742e406079ef.1581575578.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581575578.git.raj.khem@gmail.com>
References: <cover.1581575578.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] ltp: Fix tescases with 64bit time_t using 32bit arches
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
X-List-Received-Date: Thu, 13 Feb 2020 06:38:28 -0000
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



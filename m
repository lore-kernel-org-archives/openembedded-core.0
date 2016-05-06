Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5D673259
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 07:11:59 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 145so9946823pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 00:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=xN+zjDTABI3QISr31l9e01AlSovg+ITsLIwkJ8OkdqM=;
	b=XC51S3xFPrfazv+BfoTpku4TJQr8+ECM5ddsOBc/dSVoEGM7X5thTknLKR7oFmAHPv
	74RtODvEXFt+MQroNv9Ewdlie9WsuRtLP88f07waOTTABetiUE11B98Vg+XA9pvI/0V3
	v+IbKHAtQ1ZiW5ExkVq3+B3VGKErt2lzn80KqmcyOMQRiKkyetxDWE1uK9EYSZLvjoIs
	7inSi7DItJke31M++ywv+Ko6eNH3R7d3J2mxs5EKqjNtBH5KMV4pDgfEb+RxtFPlnqGG
	q8hSsiPI/rKFpN7tGIOwo/8knvelB8iyRsaHJqnHNDgNCsGOclUxI78alMEbsqHrdF7+
	THNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xN+zjDTABI3QISr31l9e01AlSovg+ITsLIwkJ8OkdqM=;
	b=cfILY99a6Tvi+nIE2IOJZOwUKr4Q3WLJrn691oG0iLH/+GohqGKN1X7q8k3YZqhHI2
	zr8R2DWu8bCsa/CHXRGQGXK/Ja/RSEbQQdd6CjJALSysVbPJOZlMfe81uopsnSYssSF3
	Sbez0422kEB0QZBqgSjy0WuN47SDk+v8eMOkDJKX5pbZtZGfr+AqyZ39QYFImGYvfojw
	RD2XVPwXBtJIEgKWbyQrZwmr8+EU/d2szi3rJIlfEg6c+GcASz7CBJBj81wonQ5OWj2t
	3UUnHG5FSXBYU3nWg9OvE9XJgQJiLcHR6OpMD94HTyGLBgjyuz5WVWcMjtj4Y0Eckqj+
	cOrw==
X-Gm-Message-State: AOPr4FUjUqrsQ933dl+6ICwTgAcBVnzEExy27MdP1C7JDlsbzG+pKEXmgVXSTBwmfwrdAQ==
X-Received: by 10.98.98.69 with SMTP id w66mr15969783pfb.20.1462518720783;
	Fri, 06 May 2016 00:12:00 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q129sm18417191pfb.16.2016.05.06.00.11.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 May 2016 00:11:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  6 May 2016 00:11:54 -0700
Message-Id: <1462518717-2629-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [master][krogoth][PATCH 1/4] gcc: Security fix CVE-2016-4488
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
X-List-Received-Date: Fri, 06 May 2016 07:12:00 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  1 +
 .../gcc/gcc-5.3/CVE-2016-4488.patch                | 73 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4488.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 9808be1..2ea5952 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -88,6 +88,7 @@ SRC_URI = "\
            file://0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch \
            file://0057-unwind-fix-for-musl.patch \
            file://0058-fdebug-prefix-map-support-to-remap-relative-path.patch \
+           file://CVE-2016-4488.patch \
 "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4488.patch b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4488.patch
new file mode 100644
index 0000000..30e0ffe
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4488.patch
@@ -0,0 +1,73 @@
+From be3004dc350a820a5b0320b34bd05673ba534058 Mon Sep 17 00:00:00 2001
+From: law <law@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 31 Mar 2016 17:20:53 +0000
+Subject: [PATCH] 	* cplus-dem.c (squangle_mop_up): Zero bsize/ksize
+ after freeing 	btypevec/ktypevec. 	* testsuite/demangle-expected: Add
+ coverage tests.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@234645 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+CVE:  CVE-2016-4488
+
+patched ChangeLog and demangle-expected as patch is from tip.
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+
+---
+ libiberty/ChangeLog                   |  7 +++++++
+ libiberty/cplus-dem.c                 |  2 ++
+ libiberty/testsuite/demangle-expected | 10 ++++++++++
+ 3 files changed, 19 insertions(+)
+
+Index: gcc-5.3.0/libiberty/cplus-dem.c
+===================================================================
+--- gcc-5.3.0.orig/libiberty/cplus-dem.c
++++ gcc-5.3.0/libiberty/cplus-dem.c
+@@ -1237,11 +1237,13 @@ squangle_mop_up (struct work_stuff *work
+     {
+       free ((char *) work -> btypevec);
+       work->btypevec = NULL;
++      work->bsize = 0;
+     }
+   if (work -> ktypevec != NULL)
+     {
+       free ((char *) work -> ktypevec);
+       work->ktypevec = NULL;
++      work->ksize = 0;
+     }
+ }
+ 
+Index: gcc-5.3.0/libiberty/testsuite/demangle-expected
+===================================================================
+--- gcc-5.3.0.orig/libiberty/testsuite/demangle-expected
++++ gcc-5.3.0/libiberty/testsuite/demangle-expected
+@@ -4356,3 +4356,13 @@ _QueueNotification_QueueController__$4PP
+ --format=gnu-v3
+ _Z1fSsB3fooS_
+ f(std::string[abi:foo], std::string[abi:foo])
++#
++# Tests a use-after-free problem
++
++_Q.__0
++::Q.(void)
++#
++# Tests a use-after-free problem
++
++_Q10-__9cafebabe.
++cafebabe.::-(void)
+Index: gcc-5.3.0/libiberty/ChangeLog
+===================================================================
+--- gcc-5.3.0.orig/libiberty/ChangeLog
++++ gcc-5.3.0/libiberty/ChangeLog
+@@ -1,3 +1,10 @@
++2016-03-31  Mikhail Maltsev  <maltsevm@gmail.com>
++           Marcel Bohme  boehme.marcel@gmail.com
++
++       * cplus-dem.c (squangle_mop_up): Zero bsize/ksize after freeing
++       btypevec/ktypevec.
++       * testsuite/demangle-expected: Add coverage tests.
++
+ 2015-12-04  Release Manager
+ 
+ 	* GCC 5.3.0 released.
-- 
2.3.5



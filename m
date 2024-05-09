Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06666C25B77
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 01:30:57 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.12.1715218254398810747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 18:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KTq5bn2Q;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f489e64eb3so358599b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 18:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715218254; x=1715823054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x62gyVuvKhbBgXvf9YpFpZkM4VAi4ZVFzodg71UF5Is=;
        b=KTq5bn2QW/4pt6wBBeuQ+Uq1iXHWw93Azddc4ZquPCwEelRnDpCFGjWwYLm6Gzha4E
         bF1s0kUl0V2yCnYezijAEd3OYfwIk8dzFDwG7dd8tREbZGgsTQEkCcFFODlLE1wQWBO+
         EOPxLmonPn3f72l0TYpmvdRlV9zr/dMAwo0DC9lIGgCI2Qjhhf18VEIsNTpbFJBbf2LP
         GhNePg47hIPp29YHNjZLUrkt0kHyoiswhxdq7KWwRkKGn8OxZI6O7DN9h5lcFAWXkMgf
         ImyLskHvn07ZQlalepoBss5ozt4xdVsqUgBR3Njh+A+obgg7DzR4eZKL5c/8R7Gk4h9b
         QOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715218254; x=1715823054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x62gyVuvKhbBgXvf9YpFpZkM4VAi4ZVFzodg71UF5Is=;
        b=mFkN7d5JlglcLeyvbVQYayCbzalSrs6VaPmPzPhJnTFExhnXpxDGy+SpsbA2CKh6q1
         tVuICzKr9cOMiL+7VU1Fc7abKubzJ6Kn8POws1h6Pz3UP2mSeme1e1MXbzpBjCJm2hiP
         5Em+jLYE3xN4EQvJvtKbMlO65RbYh1x+fh6jGovtAZ70pN0SnjQsuwvmyMqEQ69+BtIb
         7ENMDl3Pv1tvOUYxieus2WR4AH+Xm/0NHr7XXtkAqq7C/anC7WqlvxFQLfh17LG9MCmn
         sZ0x8LXLVO7EXs9t0Q4JbaZ3MhN+lWhL5rQsuCa3TLkWLCCmHqcSbBVCQgILLDl28Wft
         ks+w==
X-Gm-Message-State: AOJu0YwabDyv8xaVndnK4kmhARLLapmtv1TaV6ShWEYpEtCvWXYtaAuy
	wiHnKYXS3lqEhXn7a2Pu52T+3blIhdSPR18knxRbkt3QoUn/N3dSLBn+lTr6
X-Google-Smtp-Source: AGHT+IHm9Dc3pU7M9XHrQOqEqC6zup+FO7VkucWnnb9ljrfqkb77RDeWxCVNVIeH8uWGnFPB6h6YpA==
X-Received: by 2002:a05:6a20:3c8a:b0:1af:952f:f6fb with SMTP id adf61e73a8af0-1afc8d1b1f2mr5062758637.3.1715218253565;
        Wed, 08 May 2024 18:30:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::af2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b67158de4dsm244558a91.42.2024.05.08.18.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 18:30:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2 3/4] ltp: Fix build with GCC-14
Date: Wed,  8 May 2024 18:30:48 -0700
Message-ID: <20240509013049.523093-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509013049.523093-1-raj.khem@gmail.com>
References: <20240509013049.523093-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 01:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199134

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Change the patch status to Backport

 ...-Use-time_t-instead-of-long-for-type.patch | 54 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240129.bb     |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch b/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
new file mode 100644
index 00000000000..ae8dc8706e3
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
@@ -0,0 +1,54 @@
+From 74074f9a71c876d6e95c2d72702888dd2fabc761 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 May 2024 11:43:20 -0700
+Subject: [PATCH] sched_stress: Use time_t instead of long for type
+
+This ensures it works across different architectures
+Fixes
+
+| sched_driver.c:744:43: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
+|   744 |         printf("\nend time = %s\n", ctime(&end_time));
+|       |                                           ^~~~~~~~~
+
+With gcc-14
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/0a682f1af42d8d261202821be580fe26d17ee9b7]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/sched/sched_stress/sched_driver.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/testcases/kernel/sched/sched_stress/sched_driver.c b/testcases/kernel/sched/sched_stress/sched_driver.c
+index 61573d788..5b8c187fe 100644
+--- a/testcases/kernel/sched/sched_stress/sched_driver.c
++++ b/testcases/kernel/sched/sched_stress/sched_driver.c
+@@ -136,7 +136,7 @@ int debug = 0;
+ /*
+  * Function prototypes
+  */
+-void startup(long);
++void startup(time_t);
+ int start_testcase(char *, char *, char *, char *, char *, char *);
+ int process_slots_in_use();
+ int available_user_process_slots();
+@@ -251,7 +251,7 @@ int main(int argc, char **argv)
+  * information to the screen and .  It also initializes the	 *
+  * process id list and other global variables.	 			 *
+  *-----------------------------------------------------------------------*/
+-void startup(long start_time)
++void startup(time_t start_time)
+ {
+ 	char tempbuffer[50];	/* temporary buffer to hold names */
+ 
+@@ -734,7 +734,7 @@ void kill_short_term_testcases()
+ void finishup(start_time)
+ long start_time;		/* starting time to calculate elapsed time */
+ {
+-	long end_time;		/* time when program finished */
++	time_t end_time;		/* time when program finished */
+ 
+ 	/*
+ 	 * Get the end time and calculate elapsed time; write all this out
+-- 
+2.45.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
index e88e931a687..f8e6d3987ee 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -29,6 +29,7 @@ SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-scenario_groups-default-remove-connectors.patch \
+           file://0001-sched_stress-Use-time_t-instead-of-long-for-type.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.45.0



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7D8C41513
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 01:15:11 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.1150.1715044508275089117
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 18:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TEClpzQB;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ec4b2400b6so21036475ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 18:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715044507; x=1715649307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnwKpP6ShDnLqKcKZz3EftwYGYYJ+50/bFDqCzf0gcM=;
        b=TEClpzQBNaF3R7yzSQy9/tr0ls3i4SiNIZVbTmFRzK5FEOXhAuT2Nd/d4v6CWZaWEs
         QHzYNVam/km+w5LCYzhCiIcquPp/NTsjE6Lgy8eJv2qftIeaeUQcfFYmsGAkMdY6rVXD
         mu/ig01IvPZI5HFNIzDsEBaLl+3iLSctoHvBMwftzmSUr373RXqyPB3YqijvSoYiVg9g
         anovDywmAh6vM0An53/ia5itdyPzWi7MmFwO/XRDxJjLqS9IzbggOY9X8vZtBYv1OG1E
         WEJEu/kXzFAXP4nSt47q7KVk0hLgBCS4esl2wVvYHMEtTZnHTaMAeehAUrj7Az/gRxcu
         E2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715044507; x=1715649307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnwKpP6ShDnLqKcKZz3EftwYGYYJ+50/bFDqCzf0gcM=;
        b=X1+OEy6zK3SC5pDZmEWTSxJnnRvr662ySAY5ii93yPNqOMt6lc/YHLemDRbSWRGag2
         HaSvSkPBxUXAX48tKzTRid/btMVZ3kshR6emKvFYYCHFETwgt9zcxZVKpyxnvpZunzUP
         PxuNesKosaWrUATmy2csXtInDL95m+O8yhcZb++rKY0y9jmDxZ1TA9iOwUoSLrvdxr9T
         XMbq2SLvH8Kotq/7U77lSMjlhA4GMdz1bERPuQH+NhZFpCCOpWCr8WAcj6Syglet0yHO
         RBRm5nU5xKr8N9sNPZ7D20EkVYNt1H6mDDgesP/CTxAhmM9jp97d0Gc8ISUNmb3niqAj
         hQRA==
X-Gm-Message-State: AOJu0Yy8SEleWr6TSK3+wmsuCTcmOCC+fWBcQDQrspEdc6Pbw4MYLlh2
	RRl/xfNMiCaBa+yru1RKagQB4645SzohcWRfZgNQ4a+AiVrrlXp8xeENRI6r
X-Google-Smtp-Source: AGHT+IHbWyhcHfdHbGMkl9Ua4mU82f3TC/wATBt6OFYGt5C+KwOUw5FYT+MPas+n6KA7FgTzJQcuJA==
X-Received: by 2002:a17:902:d3d3:b0:1e5:5c49:ad4b with SMTP id w19-20020a170902d3d300b001e55c49ad4bmr11440819plb.38.1715044507343;
        Mon, 06 May 2024 18:15:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902d50b00b001eb2f4648d3sm8830898plg.228.2024.05.06.18.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:15:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 10/10] ltp: Fix build with GCC-14
Date: Mon,  6 May 2024 18:14:55 -0700
Message-ID: <20240507011455.313230-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507011455.313230-1-raj.khem@gmail.com>
References: <20240507011455.313230-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 01:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199057

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Use-time_t-instead-of-long-for-type.patch | 54 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240129.bb     |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch b/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
new file mode 100644
index 00000000000..84194c1b739
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
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2024-May/038243.html]
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



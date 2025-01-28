Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F440C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 23:14:32 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.943.1738106071838889130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 15:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EBE4GcQB;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216728b1836so102971775ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 15:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738106071; x=1738710871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ybBN2qiYHaiad654Z6okcBOhW9nRhn+9bs7cg92Xxk=;
        b=EBE4GcQBtI6GAssDMomq4E6yH3HFmfUWnHYNM+867xKRj/MzniGwpWnK1P4yLTbRgG
         OWm6zD73ctCMA/t9rhVM3XJGodNkKmt8bt2y25d58fdteRwcpiBSFtonX7MmPqCuEFy3
         AA9Iu2UO/BVmA3Se56e9d0NbVJO+a9WK5TbAYxg/r15nm1+MJLgtiR5YcCFDMYl9yqge
         KCoOg3ZazJZWx0Xp6C6YJoWK+mOHEusBjzjB5jfTHEs0ynrsUKme5Q6aCh/wESCJXVvV
         uxPRhn6s07AoLV0L0/dqL1P72lo+2pHfKgFa6uMZgX6Z/cQvJ1oMZq0rr7p7/C1d2V48
         A05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738106071; x=1738710871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ybBN2qiYHaiad654Z6okcBOhW9nRhn+9bs7cg92Xxk=;
        b=ilDvj3dOBP7QJtYenJMIw61wwyxja/yyHzQUgAFMVC6qIM6oFL8V1H/BjA97yRpGQw
         thvJfKa4P9xJSBH5rfzXxET8M2aqb8sJML1iy/blBAjL6wXZsUuVBiJHqQrGJBrJcXFL
         SnA7K329MtJSSg8uqAyGWWyvnc7GSCSq63xvd1dEvNwu245NE57BYb9QcTOvzVwZ3oR7
         32BjDQZaVC1FYnL2mQnLQWJUBQi5A1a7lyuj10hn4PDF5zzkmdm7mn3UlglN614HvlPd
         Ou3nsfsqOjlhcns1lUtyg/aOA2IuMkQsdjaqjRqF9xMA0Ub0l+HHO0cxci/H8Ytn04/B
         Tnnw==
X-Gm-Message-State: AOJu0YxHXaMRvwONuHJd0W/XNSsX7xCVPqNDsMfZ0a+Pbiu420F7RzM5
	xVoBvo8oWXJgss3w4Vk4lwPrz28+Of47rviehpkjgJxfFgwjaOPWpR3KQ3Ns
X-Gm-Gg: ASbGncsYeHMVBOwhQN4a/8fcnGRXFoU5+ph2GLcHliM94xLyzhl8u2+75btJmSRrAC6
	MFl2RgKuzDAGlNPRgOboQK97qwWb4UcKwrY/pU8Q4XG+Zxs4iyJS6U+hqDWeRJLDgSC1q3uOYOr
	sTKYL7TwGCbLEAOYW7w54iYpOFif2IKdx3yPh3P7U+k+GXg5d5JkHIBrJpKl75SiZPVCWCgOsB/
	zRmUkBFwMabaFhvDSMZnZ/kQMjQqBJ/mLurfuYaxCes5dLdK94jtWL5myMfF2rKmyWWNyRYV5LP
	gb903os=
X-Google-Smtp-Source: AGHT+IFI6eD5pOVsa7JX0m0s2q9JK8DvtETkHQihGZ47Ihl90cUirhYZyueKTTvQkrgqWgtzX8kZ9Q==
X-Received: by 2002:a05:6a00:ad8a:b0:726:41e:b314 with SMTP id d2e1a72fcca58-72fd0c623femr1607767b3a.19.1738106070863;
        Tue, 28 Jan 2025 15:14:30 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::eb05])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac495d58077sm8846796a12.53.2025.01.28.15.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 15:14:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rt-tests: Fix build with glibc 2.41+
Date: Tue, 28 Jan 2025 15:14:27 -0800
Message-ID: <20250128231427.2404724-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 23:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210338

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 44 +++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests_git.bb      |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-sched_attr-Do-not-define-for-glibc-2.41.patch

diff --git a/meta/recipes-rt/rt-tests/files/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-rt/rt-tests/files/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
new file mode 100644
index 00000000000..915f8baa61b
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
@@ -0,0 +1,44 @@
+From e1f5f9379a68471c9f5fb0859e87dd84001b0b6f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Jan 2025 15:03:59 -0800
+Subject: [PATCH] sched_attr: Do not define for glibc >= 2.41
+
+glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
+and struct sched_attr. Therefore, it needs to be checked for here as well before
+defining sched_attr
+
+Define sched_attr conditionally on SCHED_ATTR_SIZE_VER0
+
+Fixes builds with glibc/trunk
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-rt-users/20250128230838.2311298-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Clark Williams <williams@redhat.com>
+Cc: John Kacur <jkacur@redhat.com>
+Cc: rt-users <linux-rt-users@vger.kernel.org>
+---
+ src/include/rt-sched.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/include/rt-sched.h b/src/include/rt-sched.h
+index 80171c7..9cf0e3a 100644
+--- a/src/include/rt-sched.h
++++ b/src/include/rt-sched.h
+@@ -42,6 +42,8 @@
+ #define __NR_sched_getattr		275
+ #endif
+ 
++/* sched_attr is not defined in glibc < 2.41 */
++#ifndef SCHED_ATTR_SIZE_VER0
+ struct sched_attr {
+ 	uint32_t size;
+ 	uint32_t sched_policy;
+@@ -68,4 +70,6 @@ int sched_getattr(pid_t pid,
+ 		  unsigned int size,
+ 		  unsigned int flags);
+ 
++#endif /* SCHED_ATTR_SIZE_VER0 */
++
+ #endif /* __RT_SCHED_H__ */
diff --git a/meta/recipes-rt/rt-tests/rt-tests_git.bb b/meta/recipes-rt/rt-tests/rt-tests_git.bb
index 1f48e143d47..5fa980dbdf1 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_git.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_git.bb
@@ -13,6 +13,7 @@ SRC_URI += " \
             file://run-ptest \
             file://rt_bmark.py \
             file://0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch \
+            file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
            "
 
 # rt-tests needs PI mutex support in libc


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0DBD3A68D
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:44 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.1992.1730228438403637286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zRy5cwhO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ee020ec76dso1792703a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228437; x=1730833237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJPC8++IT23r98Gpbv+kP3J//ev9QH9fF48cQ39jIy0=;
        b=zRy5cwhOz9mzy9GmYPCznB9BwczG5w7w+KwsiNNXwaJQpItYR0nnpneMTSbBw8VtZC
         pWiUtzSQ+9/iQ5LWb5U9BNrg9r4U5MM7EY0ucp1kE1p7AngYOA9xKsbP42lHpNNIcJ+I
         vqzJePO3WJzwDbcs2QF1/tjFl+signcsAS3KG8WBpQGsvDq+sQ9i7uJFRYRSr5Sc6hbA
         VzA46Ss/nqO9kczZVk535u9DorCRwEWAvnyy6i//ZdTAWwYoctSNWby3ij9haxNFoVa/
         GjXBJgDc/KtPIc/HEAtO0ARnjBl1oj+wxC1uoFAIoYfRNjtyXUMJ+DKLfIxD7qcijcU6
         h2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228437; x=1730833237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJPC8++IT23r98Gpbv+kP3J//ev9QH9fF48cQ39jIy0=;
        b=X2yqAmGjipJQm5P38Hk7I/rxyT1S1s2umbe6HIihrEnnZRlAyVtIb6OgM7k9KYGtX6
         3gM/p41xelpss8AAnzApeibINFn6fiEUyCU2l2qCIpTVOAtt+7sxiDMNM+yup1M70mQm
         NCI0vuvLvl/uHX4vGClVUR3CJJVKsE8/kVVmUNJrK2zqXJk6t7RIAAu9LOsSdNbQRRbH
         0z0AxyHRrnGH7zPmc+7bCJRCWlz5ZIG2XVteqyc8WgfZMEn6tdmMs7bsNXVPujKd7j/T
         qQ8j69u7QPc+hiApWip5Ns41kFJnxF03tVCizjjUu4VguFUJg8MDfNRFcslqyoBLO0HP
         zXng==
X-Gm-Message-State: AOJu0YwOb3A4Mj4gMoqlbjDWkbsX8OCtnt2DylTDBY4L6Ni/Jse3pHVh
	1n7miAW9NPt6CgKu9UjQO+fTuxrfSE3o2NFbJSLOlqKaWjfCKnY0ve6fzy508/VFVhnDt8QF/V+
	K
X-Google-Smtp-Source: AGHT+IEC3ln+FoyaIf4KtOKJGkc+VxcEYv68/cSV+qpevS4/tjjze925y1Lj6dsE9t183yyBlH351A==
X-Received: by 2002:a05:6a20:d8b:b0:1cf:3d14:6921 with SMTP id adf61e73a8af0-1d9a84d168emr18451782637.35.1730228437387;
        Tue, 29 Oct 2024 12:00:37 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/19] util-linux: Define pidfd_* function signatures
Date: Tue, 29 Oct 2024 11:59:52 -0700
Message-Id: <2c913a7b66ea756ebc65a573e1b5bb5dba6834d2.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206529

From: Khem Raj <raj.khem@gmail.com>

glibc 2.36 has added sys/pidfd.h and APIs for
pidfd_send_signal and pidfd_open, therefore check
for this header and include it if it exists

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../0001-check-for-sys-pidfd.h.patch          | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index f8841e6be0..b9172230e7 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,6 +35,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
+           file://0001-check-for-sys-pidfd.h.patch \
            file://CVE-2024-28085-0001.patch \
            file://CVE-2024-28085-0002.patch \
            file://CVE-2024-28085-0003.patch \
diff --git a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch b/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
new file mode 100644
index 0000000000..f2073eba02
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
@@ -0,0 +1,50 @@
+From a77af2e46ea233d9e5d3b16396d41a252a5a3172 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Aug 2022 14:39:19 -0700
+Subject: [PATCH] check for sys/pidfd.h
+
+This header in newer glibc defines the signatures of functions
+pidfd_send_signal() and pidfd_open() and when these functions are
+defined by libc then we need to include the relevant header to get
+the definitions. Clang 15+ has started to error out when function
+signatures are missing.
+
+Fixes errors like
+misc-utils/kill.c:402:6: error: call to undeclared function 'pidfd_send_signal'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+        if (pidfd_send_signal(pfd, ctl->numsig, &info, 0) < 0)
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/1769]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac          | 1 +
+ include/pidfd-utils.h | 4 +++-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c38d871..72e893f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -339,6 +339,7 @@ AC_CHECK_HEADERS([ \
+ 	sys/mkdev.h \
+ 	sys/mount.h \
+ 	sys/param.h \
++	sys/pidfd.h \
+ 	sys/prctl.h \
+ 	sys/resource.h \
+ 	sys/sendfile.h \
+diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
+index 4a6c3a6..7c0c061 100644
+--- a/include/pidfd-utils.h
++++ b/include/pidfd-utils.h
+@@ -4,8 +4,10 @@
+ #if defined(__linux__)
+ # include <sys/syscall.h>
+ # if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
++#  ifdef HAVE_SYS_PIDFD_H
++#   include <sys/pidfd.h>
++#  endif
+ #  include <sys/types.h>
+-
+ #  ifndef HAVE_PIDFD_SEND_SIGNAL
+ static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
+ 				    unsigned int flags)
-- 
2.34.1



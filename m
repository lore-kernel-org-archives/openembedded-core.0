Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4422D13585
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 20:32:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.37171.1730061121026777851
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 13:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CaBgdroZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43169902057so35811655e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 13:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730061119; x=1730665919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9gZgNhu8z3RetVpvNaF6fQaRPJcpFYtVdTdWrO2wS6Y=;
        b=CaBgdroZExuxAO61JmbT7OB9xuA897D2e7eSBjbhutVG4a/Q/Q8T4hDNewTsz/5dxf
         dNbg6UOlH/abIwor+SXoN3qoGr0Z4lsTR3wsgmpmIHj5wofVBUlBLKP/b6PI3/c2resQ
         VNiAAtn86GigplVt7HVWvafE7e8fqgvXLmcr3cpytas9CiJyLkzDf4CBTNSVb1ldYvyk
         BX9oEU54FJgejxkgaN1Dvjr1WmsRVclp7BKc+d+kYMsquuolwizp/Brot1pVZKor1dob
         naSe4VLwNvDpLetY3tWVmWUc4N/+UVCqXPBPfQRd26Ug18CRQ7YHN1fouigYGpGCoiRy
         xaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730061119; x=1730665919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gZgNhu8z3RetVpvNaF6fQaRPJcpFYtVdTdWrO2wS6Y=;
        b=jznvwSgovqVRFYS0Im0opAWDZFBI3o+LIZOb9V6JAh/XGn1nSql3tASQ90G9fwtFxO
         cywwJoqXiA7hFWv+DhkM9h4TVHZ/4uVsSSeKvHYIruwVNjWHWJEq0S19NOfkEfuXrXjr
         FNvjtNJxRQrn5DlS7YeniI1uB0PvNIk9SJtp6YMVCPVzEgwO0fgQsOJN0WbVzgrEvexK
         Y7ZzXBlkZ1kmm4fqcaDcUb/DJd4W2Grp99VKlC1Ckn1EoFY8A9NJIkBZQq/SSknfqWF7
         UwvCsS2cTDq4LemjjC6Y19rCK7TBa9GmrXxAAVMrjYGq6ZBwe5QIlMU+vLPlH/QWBo/t
         JBNQ==
X-Gm-Message-State: AOJu0YyLN1ovDN8ORhQen6PzxYsDyTqZbAKSRryRkdhaNvOWjYnSRzaQ
	dOLiPY7EtbAcLGmJ+Pl2TaO2t7/qKTCZgC12yKmZZoi+5/Rddy2BfJ+P3w==
X-Google-Smtp-Source: AGHT+IHYPVtXvhfPwc4UTmhlyEYhh82CZDeUjcyxqvOxecGY82D31/WduaxMkbYjO23Dc2SebRwJxA==
X-Received: by 2002:a05:600c:358e:b0:42c:ba83:3f01 with SMTP id 5b1f17b1804b1-4319ac9815bmr54009225e9.8.1730061119225;
        Sun, 27 Oct 2024 13:31:59 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b5430b6sm115917155e9.3.2024.10.27.13.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:31:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH] util-linux: Define pidfd_* function signatures
Date: Sun, 27 Oct 2024 21:31:32 +0100
Message-ID: <20241027203132.4128244-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 20:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206414

From: Khem Raj <raj.khem@gmail.com>

glibc 2.36 has added sys/pidfd.h and APIs for
pidfd_send_signal and pidfd_open, therefore check
for this header and include it if it exists

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
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
2.47.0



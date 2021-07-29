Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.17349.1627601319694105899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LejWyeDq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id n12so8863044wrr.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 16:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vMzE4lTQRPX9yCPhF46WanTotLR+3JDJ+RUak1zZzFA=;
        b=LejWyeDqU0b9m28twj5AJ7k67wVdZONlbDQAuYh3JWF5Ye/+sPIFwCrRY5ZZ1KtLTJ
         1rnT7/GrTWS2P9p4UXQ0+CAfWmo//YMSkOId6+7DNyqcI4YN+/RxazgRfmm8RD5Fe3qE
         Etb+xltiXn+lm1sBxgXEdGYjurmfVCuVM1BcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vMzE4lTQRPX9yCPhF46WanTotLR+3JDJ+RUak1zZzFA=;
        b=LFxJlCe2bvl2Sg5CgSkjFvVb25JL3o6ippNMYETqW+vvLPY+V+teNNagUt7R61f+b3
         uF70o0+FkovsiZ6DWp9uuc39lJsHRr0xXGFpukENDE4oG9VNxC/E1PQgQ0wMi2A93wT5
         uHSMHBbwyx6Jf8AdHT+ljPdnLpIh5+GXfHcX8F4EmOQ7jN06Sj8vf3gYggg/aoKtmdP8
         gXorc7vYuq01mf2mv8ye73Q5IAl6VCtGQn6E4nql/EPjkW5x782he/n0mJlYd4cWDijy
         hJFWtzkZ+yknF4z2OkXdGp40TThdEDP/I9tsAkkj5rYKuFddDd2jg26yyZVTqL7PFXPn
         HAtw==
X-Gm-Message-State: AOAM532YJrTN8M72zyZtvoarpN8gtKVwJvcjVR1xMB5//vhSnNIEwOWq
	wuySwXMzRA0AXwupr/rDXrpWZGlEoNq7Jw==
X-Google-Smtp-Source: ABdhPJxIxYxB8Typaw3AxzDaoTlbiUPQFOc9i18DaDmaOGNp5ImKtve1kdmthecC26lU7JIXxfoF7g==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr7598403wri.164.1627601317897;
        Thu, 29 Jul 2021 16:28:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id p5sm5958965wrd.25.2021.07.29.16.28.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:28:37 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemtap: Fix headers issue with x86 and 5.13 headers
Date: Fri, 30 Jul 2021 00:28:37 +0100
Message-Id: <20210729232837.3340819-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some x86 platforms there were header issues causing pt_regs compile
failures for our stap tests, e.g. on genericx86-64 but not qemux86-64.

Backport a patch from upstream which fixes the issue.

[YOCTO #14491]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch | 26 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch b/meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch
new file mode 100644
index 00000000000..4d044de7ee1
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch
@@ -0,0 +1,26 @@
+From ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470 Mon Sep 17 00:00:00 2001
+From: Du Zhe <duzhe0211+sourceware@gmail.com>
+Date: Tue, 13 Jul 2021 19:11:55 -0400
+Subject: [PATCH] runtime: fix unintended compile error with
+ autoconf-x86-uniregs.c
+
+Adding a #include <linux/sched.h> restores this test on the gentoo
+linux-5.10.47-gentoo kernel.
+
+Upstream-Status: Backport
+---
+ runtime/linux/autoconf-x86-uniregs.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/runtime/linux/autoconf-x86-uniregs.c b/runtime/linux/autoconf-x86-uniregs.c
+index 25729c220..232c18670 100644
+--- a/runtime/linux/autoconf-x86-uniregs.c
++++ b/runtime/linux/autoconf-x86-uniregs.c
+@@ -1,3 +1,4 @@
++#include <linux/sched.h>
+ #include <asm/ptrace.h>
+ 
+ #if defined (__i386__) || defined (__x86_64__)
+-- 
+2.27.0
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 1f0e67002d9..97d4435f82c 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,6 +7,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
+           file://ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
-- 
2.30.2


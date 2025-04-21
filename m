Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2660C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 17:29:28 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.20594.1745256558915244983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 10:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RU20+SOM;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so2722428a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 10:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745256558; x=1745861358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LdkVZ89yqWf07nj+AG60I+fqr9aYPus/9o2uNcY4WEg=;
        b=RU20+SOM5RIOikC3H02PSJPi3wMJiNDaI80kEsmWhSScKhTari59ouvFoe2ro3mbHR
         0s1vzc/7Vk0mDx/z6SE1sMKiGCOcn31kElIwuqw2LH67746rJEboM6S40hvijm3qOKIA
         VqXvA3x7y2bxLsUp62BONgwxRr3hi1I3SrXU8SXZScfKo04pEa2JM14ffRafF2uo9sFk
         bKVz2bGKOqBFBgvqrC4G0qc0+Oe7KwPViFPieAJsHGwu6YsdAh0nGF5shGoKbK7zsUao
         Onv7BVfvjQs16CaHLaQP8Xn6NtmqZ6H40i9ZCY6VSGHfiqdqXdeIoZdkpPf32c5/PJNc
         p98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745256558; x=1745861358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdkVZ89yqWf07nj+AG60I+fqr9aYPus/9o2uNcY4WEg=;
        b=V8JrCLOrlPITg7m9DWhf8Tzo0k4uKBWHUyWqkTqiuQr7Wzt9K9d/x5sKQx2ONxMlvJ
         8EgsVPsgNW6ATRrWkqJM/pzqJgp+rirSLFbQnkhIH3rZnrcLDMZwoVOJYk5RTzc8Vg8V
         Z5uYJp8CtAUDCP5S0JH3jjR0ZvuUIeAzMZ/m/EYgT0vC5TRoAZfOIlTrPWMGZc+eEMLG
         ygw0JGNI7SVMhoqvXyE6YlVZLfm10DXdN1dcIQ/OrlVLClGErW5dorAMId0zsZcAxeaR
         XYfyo+AlN/sXlcXyVHSsDf56QNc6m43L/NlU+dksj47iK8f01Ff9hIBvl+FKbrt7Lj89
         sMTw==
X-Gm-Message-State: AOJu0Yzr3Fk2UsqhGHJ9VWf6ungAbg+dAhxiRcZtZkUDuwkaN5VhMVlz
	1DTo+KuKJiXjh+03Y1r2dn6RHL9UKctpbfe/lHMUVs9QtN0I2GdCmSvR/o4+
X-Gm-Gg: ASbGncuCCegkY+YSGgQp4PsDBU/ObBN4Y3wSozJdt31s0hdVwOP74r2lFRKG1gj9Fve
	MKrepJxSgfzhYNMqhs4AYvwCZX3Vk3yN9tloSiiXSrZGLu61xdpX4doKbpdn0zE5J3ZaV43bZNk
	jIQGRcPflVqlecDSd49n7f80tU9Sn+jVDNkTOC8IxbUiPQtjN8QYfvZhT/niXen0224p4RDesJ4
	bufEXYfpbdR6bMolP3wcgq+RC9DRnaxNyTCXGF/ylfQTB4IArB1Z4eYxIPX84ZydGjZfLN4iouA
	CEn1VrYZQGFScTwFj2i5MkaFjOiMXcbT
X-Google-Smtp-Source: AGHT+IGMA7E6vBxzDqIRXY//aqt8RNMdU9HlErwzEK7chXfCUEGjxji0EsVwYw4vPVFHVfblXWcpXw==
X-Received: by 2002:a05:6a20:e18a:b0:1f5:8179:4f43 with SMTP id adf61e73a8af0-203cbc72f9fmr17600078637.23.1745256557856;
        Mon, 21 Apr 2025 10:29:17 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a1f1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13c5f8bsm5873027a12.35.2025.04.21.10.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 10:29:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/2] glibc: Forward -ffile-prefix-map option to assembler flags
Date: Mon, 21 Apr 2025 10:29:14 -0700
Message-ID: <20250421172915.1651803-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 17:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215179

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change
v3: No change

 ...le-prefix-map-from-CFLAGS-to-ASFLAGS.patch | 24 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.41.bb         |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch b/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
new file mode 100644
index 00000000000..862c7b9086e
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
@@ -0,0 +1,24 @@
+From 603e50d6b8ccadb32d59b0497f76629665c1794b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 16 Apr 2025 19:51:01 -0700
+Subject: [PATCH] Propagate -ffile-prefix-map from CFLAGS to ASFLAGS.
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/libc-alpha/2025-April/165969.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makeconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makeconfig b/Makeconfig
+index e35c5cfe4e..7a19c731c6 100644
+--- a/Makeconfig
++++ b/Makeconfig
+@@ -1176,7 +1176,7 @@ endif
+ 
+ # The assembler can generate debug information too.
+ ifndef ASFLAGS
+-ASFLAGS := $(filter -g% -fdebug-prefix-map=%,$(CFLAGS))
++ASFLAGS := $(filter -g% -fdebug-prefix-map=% -ffile-prefix-map=%,$(CFLAGS))
+ endif
+ override ASFLAGS += -Werror=undef $(ASFLAGS-config) $(asflags-cpu)
+ 
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index d707e1a6775..82dcf08fcd0 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -54,6 +54,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
+           file://0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"


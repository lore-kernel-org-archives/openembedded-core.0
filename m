Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A2FC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 12:33:09 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.47011.1745843581729696639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 05:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=k25NEm3o;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54d6f93316dso5286262e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745843580; x=1746448380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDjq3KEwoVUX3nXcTgAuHsjvM+frfCc/ZgG49xNzc2A=;
        b=k25NEm3okMgm2CMbwRSiP34HM/nVtsfakxvppkfyNTvvBHUGRhQD2pjQ0SzvCBbMoo
         I+ZS2jtZhCERFYdyrhU/l4IXX9M9YpWMrB4ANxmR+MtfvrDygJSUqp21c0/AIIQv8Sb9
         6lojxDPIDbqijJ2H7l3bc/222WU+pohUFUn5ovr9kx+zhutvR/w+if7Zz5mQQYGNgaew
         DoTD7JctL55yOOtiZl1p6D+ZE6t6slcFwv6ptD6JekO3LDiR0N/jMEwaNVlv/pLiJyK2
         T9rGpsYOoJuqF0C5CtU3URxwgYCBC+CiABHrHe5Q5lpKji5LyvhV7aq8svmVSY+SCYkU
         Haiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843580; x=1746448380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDjq3KEwoVUX3nXcTgAuHsjvM+frfCc/ZgG49xNzc2A=;
        b=tU1xURM9AD5dP9WR/cGEs1twP1Q1A8mmHN+vQRQCzo0OWL40vvpkPyYdwYUwR0i1sO
         WYoBOQuVb62UtXs1Y8QtavOvgZmBsUlAzB7fsMcrgelsMgX7iO0o0vwYJL+oflGzxfEF
         D+yXLmveCaAZ1hIkWCizjifBHG6T/AMxVy4+DK2QhlNR6Tyz4IdvqrI5BTrWcZs+EUgR
         M3SceYg6d2cn9JwzpPAuwMu7Jdm2gz4kO++IpNmFtCTnrrivY4U/kTa2awKme35GVK5c
         J5ATPDDbl35aain9iTN2EvtHZhR7qW60uaH/425U+O1faN7yCQWFiJ9k23ylvqRHW0po
         iorQ==
X-Gm-Message-State: AOJu0YwYb34jzgYSBJ9OV77AoQDO/91dSbCUOawTBZXRV1GmQPi/zthZ
	lRzwOZXtGGl1KGSPfXkWB/ROB7PzBq/TJ00fl8TbjMUf8WWrLZ4+pC+GU+f6JWCm4Edu3gvIuXY
	mdf4=
X-Gm-Gg: ASbGncsTMddtHWlFvIVLuaYjmUoXylffIzC3biH3cvUkK7R5cffiOJSfnZcZhb4KNHY
	NWufKLeR4KVIdvxm7WVjN+abceU9UcwsYRWdfQhux218kP2KscYCySaJT9LSwigpqG/LWGn172V
	w/GWcupb2XgFf+fwmbTnN3arH4788p0FzBkQVYJXPFSFCSd3AFRF8ejmJ2Z3r9eeoQt/A6j90Zg
	4+jBi81xgAhnh3Z0QFd4DLeG0aEnK4MfWYJA/7Smjq+peY2fC36gWUUPqx3UCjNVDP1DdK8RJ7i
	pzwrZPlIwDIQlRDj/cU0jaSKfOC2hY8p95K88MmBciZImtNCgqIQSHUGmEcI2pz3qhhxl4SW/Je
	JFKl/TVAKhbrzj8bZ3U9dKe/s77Vu
X-Google-Smtp-Source: AGHT+IHaMjHbegYm5QhwyYQRv3nNGxXlGciqTYDXhqQIMN4d9z0YzypM8vSq5CDWdgXp17aiIB2v0Q==
X-Received: by 2002:a05:6512:3088:b0:54d:6dcb:ac77 with SMTP id 2adb3069b0e04-54e8cc0b967mr3328000e87.41.1745843579838;
        Mon, 28 Apr 2025 05:32:59 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d001965dsm21045291fa.55.2025.04.28.05.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 05:32:59 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] lttng-modules: fix build failure on genericarm64
Date: Mon, 28 Apr 2025 15:32:43 +0300
Message-ID: <20250428123243.515597-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 12:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215598

Workaround to unblock genericarm64 builds.
Upstream is working on a better fix
https://bugs.lttng.org/issues/1426

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15840

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...x-sigaction-build-without-CONFIG_COM.patch | 35 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.18.bb            |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch
new file mode 100644
index 0000000000..eb43abbae2
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch
@@ -0,0 +1,35 @@
+From 0e2095bcc50e7a07d3478f8d3c0ae5ad46575594 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Mon, 28 Apr 2025 12:07:24 +0000
+Subject: [PATCH] lttng-modules: fix sigaction build without
+ CONFIG_COMPAT_OLD_SIGACTION
+
+Workaround build failure when CONFIG_COMPAT_OLD_SIGACTION is not enabled
+in kernel config.
+
+Upstream-Status: Submitted [https://bugs.lttng.org/issues/1426]
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ .../instrumentation/syscalls/headers/arm-32-syscalls_pointers.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/instrumentation/syscalls/headers/arm-32-syscalls_pointers.h b/include/instrumentation/syscalls/headers/arm-32-syscalls_pointers.h
+index 5f4ca5b..1514cae 100644
+--- a/include/instrumentation/syscalls/headers/arm-32-syscalls_pointers.h
++++ b/include/instrumentation/syscalls/headers/arm-32-syscalls_pointers.h
+@@ -1890,9 +1890,11 @@ TRACE_SYSCALL_TABLE(chroot, chroot, 61, 1)
+ #ifndef OVERRIDE_TABLE_32_ustat
+ TRACE_SYSCALL_TABLE(ustat, ustat, 62, 2)
+ #endif
++#ifdef CONFIG_COMPAT_OLD_SIGACTION
+ #ifndef OVERRIDE_TABLE_32_sigaction
+ TRACE_SYSCALL_TABLE(sigaction, sigaction, 67, 3)
+ #endif
++#endif /* CONFIG_COMPAT_OLD_SIGACTION */
+ #ifndef OVERRIDE_TABLE_32_sigpending
+ TRACE_SYSCALL_TABLE(sigpending, sigpending, 73, 1)
+ #endif
+-- 
+2.49.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb
index 553dae9f4d..1b2327f609 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb
@@ -10,6 +10,7 @@ inherit module
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.43.0



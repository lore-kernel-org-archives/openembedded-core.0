Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.3074.1587566314340130959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 07:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Be1gxIvn;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id i10so2672223wrv.10
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 07:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wjd9YbW93d11kinhOqEcGy5FCfdEIjTLGDUrvHMqTqk=;
        b=Be1gxIvnraH+TObqfRE2VVA7IhwkTSEGYaDAFogUJ5w/BUHHHFDpD9RLVkUfZQFfxX
         rko3ILWIpBrXq1zex0RSLNMI4nVi80aZFUQUoTSulSLZ3KpzZECuvWptDMAb8ENnR1q4
         mO3hpugOH5gMNcUeAcg7wwg+kHMUDwetw4qGII3EHsUAAHebDoJMEoBnATvWSvMAYjaj
         uKaLCE1lMr99klYwFz7leE577NMHvkOU13qm4+bGfwG+wIPgZ+wdvxxocA/bWlassoF+
         X8eMgjjn5mprqznehfWgofUf2Pb1Z8iUOsvip4ETouKJgtrPnifb+cj5X75yFQbxfVfs
         DjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wjd9YbW93d11kinhOqEcGy5FCfdEIjTLGDUrvHMqTqk=;
        b=A2fiD/TknpQ6uepBcpNXMe9sFxxuLYldQKVtFhA5JA/OKK27R08qK/qDBsjslzkqZr
         vxgwWEu4NuurlsRMEpu/6u8yWI5t/c9i2MT4xaF74TUCxHkKvsc5bSW6i5aO9h8W4h40
         q51wz3Kn8O9mykkyd6SM6NYieb7hnwadI+bBP7F4qHo46vESdHVFDDxt2sNF6F6g+1jT
         wkxxY+2DJboWDjtiO27m7KvzCz466VanUnhbA1Fr/X5f8X/OEsSDKZ8td0vNj8F8vkKN
         vF+C+hvaUSNDzgqgqogNHDGA/941359tS8SnhMOOVrZLA1BH8uQ4SMcL5rvhL+OTyM3o
         ML7Q==
X-Gm-Message-State: AGi0PuZIMwEndk5SjvvdPGf5bDxepsotIslUOcjgECyKxQ+UnZFpYXFw
	OqlDIrBBFnXQu1vm9j3X8hVnWfKiMSU=
X-Google-Smtp-Source: APiQypItZDAhYSduIzcTMm4aDXzqWCNNY7kKYbyHslpqO4rcLeCBgRQSQknireBDphF5KUfLBaX4ow==
X-Received: by 2002:adf:dd83:: with SMTP id x3mr29749731wrl.298.1587566312428;
        Wed, 22 Apr 2020 07:38:32 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e11sm8360540wrn.87.2020.04.22.07.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 07:38:31 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [zeus][PATCH] qemu: Replace stime() API with clock_settime
Date: Wed, 22 Apr 2020 16:38:24 +0200
Message-Id: <20200422143824.2634423-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...linux-user-remove-host-stime-syscall.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f451017f6d..ad4ff52892 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,6 +27,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0009-Fix-webkitgtk-builds.patch \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
+           file://0011-linux-user-remove-host-stime-syscall.patch \
            file://CVE-2019-15890.patch \
            file://CVE-2019-12068.patch \
            file://CVE-2020-1711.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
new file mode 100644
index 0000000000..659e6be45d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
@@ -0,0 +1,61 @@
+From 0f1f2d4596aee037d3ccbcf10592466daa54107f Mon Sep 17 00:00:00 2001
+From: Laurent Vivier <laurent@vivier.eu>
+Date: Tue, 12 Nov 2019 15:25:56 +0100
+Subject: [PATCH] linux-user: remove host stime() syscall
+
+stime() has been withdrawn from glibc
+(12cbde1dae6f "Use clock_settime to implement stime; withdraw stime.")
+
+Implement the target stime() syscall using host
+clock_settime(CLOCK_REALTIME, ...) as it is done internally in glibc.
+
+Tested qemu-ppc/x86_64 with:
+
+	#include <time.h>
+	#include <stdio.h>
+
+	int main(void)
+	{
+		time_t t;
+		int ret;
+
+		/* date -u -d"2019-11-12T15:11:00" "+%s" */
+		t = 1573571460;
+		ret = stime(&t);
+		printf("ret %d\n", ret);
+		return 0;
+	}
+
+        # date; ./stime; date
+        Tue Nov 12 14:18:32 UTC 2019
+        ret 0
+        Tue Nov 12 15:11:00 UTC 2019
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=0f1f2d4596aee037d3ccbcf10592466daa54107f]
+Buglink: https://bugs.launchpad.net/qemu/+bug/1852115
+Reported-by: Cole Robinson <crobinso@redhat.com>
+Signed-off-by: Laurent Vivier <laurent@vivier.eu>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Message-Id: <20191112142556.6335-1-laurent@vivier.eu>
+---
+ linux-user/syscall.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -7651,10 +7651,12 @@ static abi_long do_syscall1(void *cpu_en
+ #ifdef TARGET_NR_stime /* not on alpha */
+     case TARGET_NR_stime:
+         {
+-            time_t host_time;
+-            if (get_user_sal(host_time, arg1))
++            struct timespec ts;
++            ts.tv_nsec = 0;
++            if (get_user_sal(ts.tv_sec, arg1)) {
+                 return -TARGET_EFAULT;
+-            return get_errno(stime(&host_time));
++            }
++            return get_errno(clock_settime(CLOCK_REALTIME, &ts));
+         }
+ #endif
+ #ifdef TARGET_NR_alarm /* not on alpha */
-- 
2.25.1


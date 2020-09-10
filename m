Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.20742.1599740707271931287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fpj5UTNQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id e11so1788742wme.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GZOGqgCF6s0P8kXolawC3siWCjbiMvATcQrQ6CSEVfw=;
        b=fpj5UTNQtJ53VaY49SuCelUM3thjGM8e6v4ijLDN/PgM6cGsSn0cwfNgEOY9hMJFX0
         Ch+rVH4KeGdQgE+FUY/pLsnfAw2iq5Hk6vHFsfMTnxQSjbzVk2HaNG+X1xxZVPaWg2AF
         BmZO0PKAyZTID6EIRv8VK04CCXOYOW1pejBT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GZOGqgCF6s0P8kXolawC3siWCjbiMvATcQrQ6CSEVfw=;
        b=KoDMGz2M0TBkqa9jIYQazOSnyha7H/kAybFgS18jIiMF/YJxCfL1mM8YzCpH8KpkLh
         2u7fkwG3YhvagS1UdZe7eaZ4sm/EzVA6/3Aa8GeJFMxZq5derx2HpvXd1qggYnAsvubo
         bJupBC8Gxb2K1Loryp2XTo53npSPAtwd4SO4igZiCIlm543V0OP7L2i58ZwOnvwT4buz
         R3SoBWmFnGZQMM9ZomGkOs0GDyrqfax5/9MWJ/pk+oXVk/b/W6PYZrqCVIJC2xPei/Zj
         5nQcoU0dsQQZMnG+4JOlYXgijze+FJETouBw5nqm/sea3ErQ/GNUEQtWL+lDu4D6EsME
         Gy+A==
X-Gm-Message-State: AOAM532j3uigipymMs5R5I3cfeomgs7+Co5L6chLgfWUT9Y5AhvCU025
	5UD5q/kZ1gqbrFEwslfqdwWbS9NSWc3uhw==
X-Google-Smtp-Source: ABdhPJyn4YTgwGolkYS4H1qF8e7kuycSOmlgj2K53AH5wzT9sdPXgxYGcsu2WoJkS0GeHG6jI+f5bA==
X-Received: by 2002:a1c:a90a:: with SMTP id s10mr8233274wme.11.1599740705510;
        Thu, 10 Sep 2020 05:25:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:25:04 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH][thud 29/29] qemu: Replace stime() API with clock_settime
Date: Thu, 10 Sep 2020 13:24:33 +0100
Message-Id: <20200910122433.2040293-29-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: 2cca75155baec8358939e2aae822e256bed4cfe0)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...linux-user-remove-host-stime-syscall.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
new file mode 100644
index 00000000000..618ebcdc818
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
@@ -0,0 +1,62 @@
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
+Index: qemu-3.0.0/linux-user/syscall.c
+===================================================================
+--- qemu-3.0.0.orig/linux-user/syscall.c
++++ qemu-3.0.0/linux-user/syscall.c
+@@ -8520,10 +8520,11 @@ abi_long do_syscall(void *cpu_env, int n
+ #ifdef TARGET_NR_stime /* not on alpha */
+     case TARGET_NR_stime:
+         {
+-            time_t host_time;
+-            if (get_user_sal(host_time, arg1))
++            struct timespec ts;
++            ts.tv_nsec = 0;
++            if (get_user_sal(ts.tv_sec, arg1))
+                 goto efault;
+-            ret = get_errno(stime(&host_time));
++            ret = get_errno(clock_settime(CLOCK_REALTIME, &ts));
+         }
+         break;
+ #endif
diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index e483acab55d..1daee7211f8 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2019-8934.patch \
            file://0001-linux-user-assume-__NR_gettid-always-exists.patch \
            file://0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch \
+           file://0011-linux-user-remove-host-stime-syscall.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


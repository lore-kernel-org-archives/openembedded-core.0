Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id D1F277F63C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 04:05:58 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id s7so5938183pjc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 20:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XFqCijbHOrjH0s+m7FR3fVNyb9xzQ/If7eo66o7JPCA=;
	b=hErXke01Mw85vLgtn+J8Z6H8KzFNrfEK2tLScN+Xp/5llypi7gcLOANUQDdWmZk0d1
	GdCu93fOcNEOETGuc4Zgnb04bxuMlsYXJQ70KE/2jGTAobBcqHEccIk9OozatYF3bG0p
	tnaVv3uXR2BWcRDul7cuVWm2+Y94+VwIvQMPeTjrIfLClltwzr4e9OiK40y+hkyXy+LS
	DfnT+cikv32Wi8OAlqd1ZWLxEJlLyGT1ms3G+64V1a4wtjMIdnXuZV1UPV63dn7rr7vW
	5zrAkklktqJ/iDtxtpwhUygRkaXKtKUhnzg5YsrqPte8BBonKxV4dmqpsfyJJux8nEOH
	xUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XFqCijbHOrjH0s+m7FR3fVNyb9xzQ/If7eo66o7JPCA=;
	b=A20zmgDit+RObI5ORUhoOXwRaSqZLMlFjxWtQeVUrciyHedfK5VRCJsw7gE+NAXoOZ
	XC9vaJnOMpckdkgpk1AOdd3gQ3n+/HQJHHYox17rrY9sVfMiOxWAxDsWMAq+dDwWMt53
	FVZrS44tS2CSOcPQNNw6/Hy5p2ikPUuLtIOuw/DsUiAJXwipAl1FXc0Y9dGhpmlLArPH
	CLAoO4pAQIx3fYlxFWNbKRGgi4nsUV0hqTYRCEDXqO48i+pw10YW/5jx7qv0t2OJosCq
	9njLjO+fPCxnsL84I0YswnKE3j/y9HQpJZihx3nEsPTHTldVGy4ByBriXne2e7TbxGXI
	d3Tg==
X-Gm-Message-State: APjAAAUk7IJihlgmFcwmQISBPJbcjqZ7cnJL61NwwwTadwgGceNRzkzq
	bWoiN8xWGfcohC+1ko6O85ftaO0MsIo=
X-Google-Smtp-Source: APXvYqy+NhfR2Xi3kZ+9wsskVPNFtdRk9Ky2NS/Zzka8n4aKewI5H1NTSv4oBQzyWYeuXp57YI8lnQ==
X-Received: by 2002:a17:902:59cd:: with SMTP id
	d13mr24322716plj.146.1576987559247; 
	Sat, 21 Dec 2019 20:05:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	h16sm18988306pfn.85.2019.12.21.20.05.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 21 Dec 2019 20:05:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Dec 2019 20:05:48 -0800
Message-Id: <20191222040549.286151-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222040549.286151-1-raj.khem@gmail.com>
References: <20191222040549.286151-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] qemu: Replace stime() API with clock_settime
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Dec 2019 04:05:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...linux-user-remove-host-stime-syscall.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 601fc2286b..07dabfe25c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,6 +27,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0009-Fix-webkitgtk-builds.patch \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
+           file://0011-linux-user-remove-host-stime-syscall.patch \
            file://CVE-2019-15890.patch \
            file://CVE-2019-12068.patch \
            "
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
2.24.1



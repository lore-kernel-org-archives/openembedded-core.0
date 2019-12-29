Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 869887F877
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:38 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q127so17010667pga.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TOAoIMBCib9hvo25aVF3koNVraXpfO9vgsHLq2keCPk=;
	b=Wran1LWtQUUfACu3M62CbjftcvsJsLCHi9eLy++f0KlTZ6DamoKQ2iP+gfZRMAZIJq
	nCH4fGMM2s+7HxnLl5NNDtgfiLW5c5qUaNeFIsSBM44DsM3Mm0Zgm2QabEdazVPdx+0v
	jDldRxZFMO8qjGPKPcNtQW9FV1vASQtbQ95RU6gZZXDRNOC5w2HlVhlwTytyqthsq07G
	X/CSJfolwNaFiWCjxnra8Nsn7hHGmRPyahw4KOV9fvpifXbrPuNpa+Xzw0PB719voEVZ
	4sGu8o2ITL8Ow/PeiH7d4S1xcL0z98rPaKvgeRVqnk/ELcyxjg+Zy6wQgmNT+D+1WpZ9
	XEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TOAoIMBCib9hvo25aVF3koNVraXpfO9vgsHLq2keCPk=;
	b=niF+DwYn6TpA1Yu1ply+PW1yroA7NALRUQ78LmR3xgtV+qFvDZ4izJKE6pJMamWNUr
	79qtmdiRhJi9hSRcWPbyH9HalCs1km0gPRP83lAms8gqo10sUXfoPJZ6J80tYhZaYMXv
	rDtj3X6ub+xtDdYCuO2nkFbQsdJli2T0US6O10Bc4uNRu5x3LG3HBh48h/zZOihmAmeG
	Q1u8SZDeTbk8HrPzvhBHhVvB69kCEUBISdLvZ5Dyfc1ze8XE+QXl7vIfWjqLj9mT2ld6
	PfTSi+hmlCRKyvUCOcKuWz0GSeppX21py/PWLXYOUap0syEd6uFeRU1gZirY1INE55F6
	03cA==
X-Gm-Message-State: APjAAAXHuBAcjaiWAV+1Wr3fI/Y9rCTGei//c+0vQ1Q5Fyc4g5iEbmt0
	KxRextN3MJbntCOVPoF9sSOo+GvXWiQ=
X-Google-Smtp-Source: APXvYqzILg0/7+UWBXOnWXF3kfx1oB8OUQrpPkidyQO2gB7dpmTpfX5RAkvsTuOvkrNSha8K0qhkog==
X-Received: by 2002:a63:d442:: with SMTP id i2mr69642686pgj.349.1577645079290; 
	Sun, 29 Dec 2019 10:44:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:09 -0800
Message-Id: <20191229184415.19514-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/19] qemu: Replace stime() API with clock_settime
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...linux-user-remove-host-stime-syscall.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 993ca90cf5..dff5762b80 100644
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



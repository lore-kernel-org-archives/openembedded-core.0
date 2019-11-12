Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2866960125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 20:55:47 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 29so12642386pgm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 12:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ROlS49dKBumMLzy3NpGb4Aha5bkssLCpjjssG55XpWk=;
	b=avNFcO3beI13ENOtvq7Z1mQIH7PvkabT4lRRbyXn+oNGHWDo2EPXjMO7y9oa927Ga9
	maJ4v4dmu+HOimkAl0x2skLisAeTjdwMbRVgcC5pXim0pxJhgAn1JeO/PhxYUIBXlVP/
	zlxgm49yR7kebZDZJShtAppbnnDS3uTQfCciWLxXY3giW2xNogVhBIwxzB2iy9V3gJjj
	hUtzNwPRFp2P/XCcqntIr1nj/YAJVOEF5jQW+sZFwGRSFPB/BwoYDVJ282PzVheVMtpJ
	/ZoicbZgS4w23X+63KcZvx6rau7aQMys5HX8ukAG+Pit52rXIRsIRNlnmaKCWajapa52
	kqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ROlS49dKBumMLzy3NpGb4Aha5bkssLCpjjssG55XpWk=;
	b=MqdFmF7+SFagDI3qpdaY6spN+kkuSt6IyDLywCUvHmwCjXGlsdSAAK12vXLVmAbi/S
	kMiU0Y3qcCY5mhydKyZpSUzyh/5HhzMCYK5m+gVNDq3+pLEEPEjD30WT31W5ezllbAQm
	LXHfzk2OjsysoMogAkIGRGIxMM47DO4QqDUKIzTJkxIywBcCg94HnBq4Nq1Vv01Ga6qK
	KJsxyvngfe2M+0DGLtyip/IDml5MpNkl+SCGeMX1fmB5EY+T2apamAV85jDbvVmzW64B
	j7RVPm/eEH9F+1ry4ZVAZusajHZiSABLItm71Y7WPlumGhqNlJPlGYW9mRbxLnLCIiCh
	90xg==
X-Gm-Message-State: APjAAAULUdJIyYJsxnhglnfjm9cuVXQNpOr1lAqqS3KMqsPSuQJSWvCp
	2tOSd3m4c+xDx9Djx80mMiK7Zo/mHVg=
X-Google-Smtp-Source: APXvYqxhlw6diXn2Vw7pPAFVHqHhu3Wa+EaPB9rmNyjlurEciwiZj7c/GhVVjiQwyaaxDAQiU5Dzvw==
X-Received: by 2002:a17:90b:28f:: with SMTP id
	az15mr9421447pjb.27.1573592148575; 
	Tue, 12 Nov 2019 12:55:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id 12sm24698pjm.11.2019.11.12.12.55.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 12:55:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2019 12:55:37 -0800
Message-Id: <20191112205537.698939-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] strace: Fix build found with 64bit time_t/musl
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
X-List-Received-Date: Tue, 12 Nov 2019 20:55:48 -0000
Content-Transfer-Encoding: 8bit

This ensures that its using linux headers for matching the syscall
structures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../strace/strace/sys_headers.patch           | 25 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_5.3.bb    |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/sys_headers.patch

diff --git a/meta/recipes-devtools/strace/strace/sys_headers.patch b/meta/recipes-devtools/strace/strace/sys_headers.patch
new file mode 100644
index 0000000000..e46f2c350d
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/sys_headers.patch
@@ -0,0 +1,25 @@
+Remove configure checks for few sys/ headers
+
+sys/ipc.h, sys/sem.h, sys/shm.h, and sys/msg.h are actually wrappers
+for kernel headers in libc if available, here strace is trying to match
+traced process's APIs to syscalls kernel structures
+
+Removing the checks makes it default to right kernel UAPI headers under linux/
+
+Upstream-Status: Submitted [https://lists.strace.io/pipermail/strace-devel/2019-November/009222.html]
+Suggested-by: Rich Felker <dalias@aerifal.cx>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/configure.ac
++++ b/configure.ac
+@@ -439,11 +439,7 @@ AC_CHECK_HEADERS(m4_normalize([
+ 	sys/conf.h
+ 	sys/eventfd.h
+ 	sys/fanotify.h
+-	sys/ipc.h
+-	sys/msg.h
+ 	sys/quota.h
+-	sys/sem.h
+-	sys/shm.h
+ 	sys/signalfd.h
+ 	sys/xattr.h
+ 	ustat.h
diff --git a/meta/recipes-devtools/strace/strace_5.3.bb b/meta/recipes-devtools/strace/strace_5.3.bb
index db6004583b..b000afb30b 100644
--- a/meta/recipes-devtools/strace/strace_5.3.bb
+++ b/meta/recipes-devtools/strace/strace_5.3.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
            file://ptest-spacesave.patch \
            file://uintptr_t.patch \
+           file://sys_headers.patch \
            "
 SRC_URI[md5sum] = "84f5e72de813c9b1bb6057ee8ab428d8"
 SRC_URI[sha256sum] = "6c131198749656401fe3efd6b4b16a07ea867e8f530867ceae8930bbc937a047"
-- 
2.24.0



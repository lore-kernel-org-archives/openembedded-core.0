Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED1CCA0EF1
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 23:20:48 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.1134.1755559243351050944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 16:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SHZbNNor;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb78d5e74so799383766b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 16:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755559242; x=1756164042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGFYjUUBXzGLlawweGpnjyYNu2bPeBIpQpSrreh8bKs=;
        b=SHZbNNorCJkGS4VfAU9lPGmAwS/RNVNEJUSvL9311wXF7/4SCw90Rn7zjM1r9hgXa0
         SJAPP5CLpwHx3NQ5BMNTqBAlYMnvtyoUdAPCAT8TmG+ouEAD4OuIvpnZ/idiKmn9A8cJ
         +lzSB77A+SZrJBCmZOQ58I0mjyF4HcD4ehDykHvXQQ966iPcXZUCsCIsazl6Pi4Q0Ygx
         NGx9piZu5JSUwp1hHSk43GmljHX0sIhiTyrWcTbmIxgznPV6uHt4APVadE8Emz9Xn6Qj
         AksdZBaRnWJNspQzhP7Id9b43NYSnLpudy0zbVNIvTUdW4xxPvQKRgKRl+sjpQt+oint
         psaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755559242; x=1756164042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGFYjUUBXzGLlawweGpnjyYNu2bPeBIpQpSrreh8bKs=;
        b=TqOOYXLim2LYY2g8t6oQ84vdJaCT8u6W9UlJsOPh9PUYiHhv0tTm5+ltYAFZavEcs9
         oACFs0BXxqnOPKZi7wpfiKJyxHqJv2Saed4tL5LRHALJ+p+qdamWmFNc2e2pyGxYaSmV
         zotcYBG8bcoVnoQiJY/VlHeaBUHkBrhtFEnj1q4NMo6432r0z2T8JtptZ7oCid6HnNaL
         dKhSJ948guOkEViEFIaBTvcKM1LsLFOTYt2eBMzY8Tz2T0YYgTi0FPDAAVODWkID0MOC
         UB1m+l0/KeWeJe7Wyc+ER67A+AuMskpytfeOOMqOTSI1W8gUTq8BVfwtq+E/YLwDI2Dy
         fnPA==
X-Gm-Message-State: AOJu0Yz7G0bVZflHb5wYoLPWHpHr9gVQ1FpBKDFAHFuU4yXId+rlei/o
	9qoexlC7ZDDVj8FfMTUZyoLMBSq2LY647yuKz24plYdnpSPIyIgcrbSfedMK7o5TBoc=
X-Gm-Gg: ASbGncuXlNqb1zLFRB/0oHnBF28X4VvkPGKAPLGExgS3Ak+eiaim76vNydN1GQpRMwY
	p+sn3dorpEm8spMHMaICrV8dJbpJSgFHrgpGXa/JbXPoLJY+u0LivNjF+rHcAdUHK4g7NgraybR
	C+zk6tZu4DopwHHg1uQVip+MgobRbsQ9eNV1i7eQjNxb8G/M9lY9RODF7ZXqrkPVWtYs4SzZ/mq
	ahMTMRDlLqdwqxOEBTV3syyMuhIq9hMeeHAZSRtnRg6bSe8eQRFUt3PE+iPi4UhKkMZt4rcjzeY
	1QgTypBv/d62J8HXVm+K9FiTeFQGg00VGh7BIBIRdnJt68hLS5i3gV6H9ClzHkmuXzHFySGzqoj
	lf2d0Hi4as3gOpSktmniBjp1Jgf5d7BdhC+PVO4GWxjZfg7nAgaPrMV05kNwOrC48yWY2lgRmxy
	JvzjN48+FIwamq4d9UMGPQGfQohKDOMNV6rfcE2w==
X-Google-Smtp-Source: AGHT+IFjGK6zCt49mnaP6Z8OOm7LzZwxq3L26G51jMq5dEbr1JtL2klVU+Pqt3K0/13dxQ2H5jtGLg==
X-Received: by 2002:a17:907:803:b0:ae0:bd4d:4d66 with SMTP id a640c23a62f3a-afddccda53emr54104666b.27.1755559241611;
        Mon, 18 Aug 2025 16:20:41 -0700 (PDT)
Received: from DESKTOP-RK42V0R.localdomain (ipservice-092-210-202-008.092.210.pools.vodafone-ip.de. [92.210.202.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce9ed8fsm893857166b.53.2025.08.18.16.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 16:20:41 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: liezhi.yang@windriver.com,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] squashfs-tools: upgrade 4.7 -> 4.7.2
Date: Tue, 19 Aug 2025 01:20:39 +0200
Message-ID: <20250818232039.1315153-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 23:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222055

Changes:
Fix build with non-static include
print_pager: make inline quoted_bs_char() static

Release notes:
https://github.com/plougher/squashfs-tools/releases/tag/4.7.2

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 .../squashfs-tools/squashfs-tools/pid.patch   | 40 -------------------
 .../squashfs-tools/thread.patch               | 33 ---------------
 ...s-tools_4.7.bb => squashfs-tools_4.7.2.bb} |  6 +--
 3 files changed, 2 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/pid.patch
 delete mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/thread.patch
 rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_4.7.bb => squashfs-tools_4.7.2.bb} (90%)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/pid.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/pid.patch
deleted file mode 100644
index a15b621124..0000000000
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/pid.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 05a895b3f996d1ac157d95b04980f5f047e7dbf7 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 6 Jun 2025 15:23:07 +0100
-Subject: [PATCH] print_pager: add missing includes
-
-When building with musl:
-
-  print_pager.h:33:25: error: unknown type name 'pid_t'
-     33 | extern void wait_to_die(pid_t process);
-        |                         ^~~~~
-  print_pager.h:34:25: error: unknown type name 'pid_t'
-     34 | extern FILE *exec_pager(pid_t *process);
-        |                         ^~~~~
-
-print_pager.h uses pid_t and FILE, so add the required #includes to
-ensure that these are defined.
-
-Upstream-Status: Submitted [https://github.com/plougher/squashfs-tools/pull/314]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- squashfs-tools/print_pager.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/squashfs-tools/print_pager.h b/squashfs-tools/print_pager.h
-index c33d4d2e..f3e0da6c 100644
---- a/squashfs-tools/print_pager.h
-+++ b/squashfs-tools/print_pager.h
-@@ -30,6 +30,9 @@
- #define MORE_PAGER 2
- #define UNKNOWN_PAGER 3
- 
-+#include <stdio.h>
-+#include <sys/types.h>
-+
- extern void wait_to_die(pid_t process);
- extern FILE *exec_pager(pid_t *process);
- extern int get_column_width();
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/thread.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/thread.patch
deleted file mode 100644
index 01741639c0..0000000000
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/thread.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b6e9f4b62cc3e762ceeddc0fc099f7d65f7b7361 Mon Sep 17 00:00:00 2001
-From: Shiji Yang <yangshiji66@outlook.com>
-Date: Wed, 4 Jun 2025 19:53:39 +0800
-Subject: [PATCH] thread: add the missing pthread.h header
-
-Fix build error on macos:
-
-In file included from mksquashfs_help.c:35:
-./thread.h:46:39: error: unknown type name 'pthread_mutex_t'; did you mean 'pthread_attr_t'?
-   46 | extern void wait_thread_idle(int tid, pthread_mutex_t *mutex);
-      |                                       ^~~~~~~~~~~~~~~
-      |                                       pthread_attr_t
-
-Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
-
-Upstream-Status: Backport [b6e9f4b62cc3e762ceeddc0fc099f7d65f7b7361]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- squashfs-tools/thread.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/squashfs-tools/thread.h b/squashfs-tools/thread.h
-index 5a22fc43..e56a58cf 100644
---- a/squashfs-tools/thread.h
-+++ b/squashfs-tools/thread.h
-@@ -22,6 +22,7 @@
-  *
-  * thread.h
-  */
-+#include <pthread.h>
- 
- #define TRUE 1
- #define FALSE 0
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb
similarity index 90%
rename from meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
rename to meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb
index 8006f80aee..8bca98f419 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb
@@ -5,10 +5,8 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master;tag=${PV} \
-           file://pid.patch \
-           file://thread.patch"
-SRCREV = "2e87d42ed089dc31990d83eeb07437b9d085d6d1"
+SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master;tag=${PV}"
+SRCREV = "99d23a31b471433c51e9c145aeba2ab1536e34df"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.43.0



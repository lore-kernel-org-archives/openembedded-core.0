Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 77ADC72FDF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 20:02:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r18so2218650wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 12:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lIY1ITbR66hIrjCQbiooyeDdObXqBib5afwlguoEGLA=;
	b=vcXYFisHTRTKkAPvUcWPeAvgPNvBKxzp2wXgd8kEOCKnsLrwVU79X8whSfWPcylqul
	wkTbtm75j3XezEVvXA4uap0rAkevq3oDMrqFZMxAmykw4QRlmbkM2LiJz1IH8oXhUQl1
	8D+Obek+kEEjbVMcV8rfR4nsnTDvZV/rqOhlxU58q+6pDq+o1Y+qlBGWi6d9eyweVJNK
	quqI/P6aKQkgx+y9XXI5Zdwax+nJFm+oI1eMH3z4weRogGUPZ+kfUtTvH+4RwPdXfW+w
	Nzb0smQCWBzrXWSA2gHOyj646Hjf3yrJY5QY1RF4AgmFlWmH348eI3VgyW701tp775jH
	za+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lIY1ITbR66hIrjCQbiooyeDdObXqBib5afwlguoEGLA=;
	b=QM72ufyqxiCe1I8+gsic5M4pQkPMxdgpetAEYwzPcJdFw3yItURP/oJFSYKtENDiLY
	e7qF8nsHoIcwqIS93Jm+OgWeCFxWBWzV402O48nTtELi8ecDlJi1k3005xMc/6ReO7vg
	/9IFhjV7C+XbDWsucqozIGdkNoI6SWnRGJKdenu37mr9a6jXme4IKG6KoG5zCjvrNzJm
	P3qdv6vic3VVLBB1PaR3YtAOpxHResbpGfPE2Ee0vASF3bKyZVDilwVbko5+omKArZs3
	E8prouOCYXhas1jl05kAZJ4Sg7/G/F+qf0e9KUyR4mCP7qiwUq06Nu+q3kx6F4GUlHPJ
	05Zg==
X-Gm-Message-State: AMke39mEHSnVgk0B99jA/gqrv8v2SGqR/ZdcYhy+VgUNwV2FsX4nBrcVmtVI40/GbPJRiA==
X-Received: by 10.28.11.131 with SMTP id 125mr53484wml.29.1487793754172;
	Wed, 22 Feb 2017 12:02:34 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c36sm2999678wrc.49.2017.02.22.12.02.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 12:02:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 21:02:31 +0100
Message-Id: <20170222200232.27761-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH 1/2] parted: fix build with glibc-2.25
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
X-List-Received-Date: Wed, 22 Feb 2017 20:02:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../parted/parted/parted-3.2-sysmacros.patch       | 32 ++++++++++++++++++++++
 meta/recipes-extended/parted/parted_3.2.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/parted/parted/parted-3.2-sysmacros.patch

diff --git a/meta/recipes-extended/parted/parted/parted-3.2-sysmacros.patch b/meta/recipes-extended/parted/parted/parted-3.2-sysmacros.patch
new file mode 100644
index 0000000000..211e6c7340
--- /dev/null
+++ b/meta/recipes-extended/parted/parted/parted-3.2-sysmacros.patch
@@ -0,0 +1,32 @@
+https://bugs.gentoo.org/580022
+
+From dec8995fe80508374beba6356f6ecbba8ef6b18b Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Tue, 21 Jun 2016 15:01:08 -0400
+Subject: [PATCH] include sysmacros.h for major/minor/makedev
+
+Linux C libs are moving away from including this header implicitly via
+sys/types.h, so include it explicitly.
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+---
+ libparted/arch/linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
+index 326b95619d31..e5c168be3c68 100644
+--- a/libparted/arch/linux.c
++++ b/libparted/arch/linux.c
+@@ -37,6 +37,7 @@
+ #include <dirent.h>
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/utsname.h>        /* for uname() */
+ #include <scsi/scsi.h>
+-- 
+2.8.2
+
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index 30c00c861b..edc4bd3cc4 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-compile-failure-while-dis.patch \
            file://0001-Include-fcntl.h-in-platform_defs.h.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+	   file://parted-3.2-sysmacros.patch \
            file://run-ptest \
            file://Makefile \
 "
-- 
2.11.1



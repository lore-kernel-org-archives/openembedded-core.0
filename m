Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8B278BE0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 02:07:19 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id g6-v6so602798plq.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2018 19:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y4Ip7WKi9ZL1IJioYWqM5Dr9UWhjzwYHl635+GJaKRE=;
	b=KWQUILIp4cZXki9ccYzAS3oK3gB34ZkXopr3HXRsBjTpzdAglFnj4GtlYlT6kqKA3a
	ZwY9hUXGK1gKxS6wiMAl9tHx7Iwe1tdaMv4jthEyTSY+J/lFIoOLqTHXZZF6fLcecZ7W
	465FSsSV85VhO0+MqFbBXOP/CaoIVtpyJkvTh4eToySJCX8NYo/RRshsfr+9v8nceqp4
	5WlebVy3ebjxEDaXbRewudQGnaEPoTCcR9drEripezkq8RChrcME0RnSO8mcnNfMCZZn
	vuQmq3ns5MEfEYfTEKcFhiBaFwOPoQr8H6J9Qxi18YGZ3i3tl8vDexaA1zf5ukBTUAZt
	MHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y4Ip7WKi9ZL1IJioYWqM5Dr9UWhjzwYHl635+GJaKRE=;
	b=Gc3FsT+yx+lp8zQb35wXedqMy4z+0zrNOZrh8Caarvq2uAo/aHU9mQ1e+RymLlOniL
	GBb2TWHFLz1WF6v99LcOcjDMO1hZliMse3t6aC1vpNjmXY/aR2Tx/dpNBFkwP+d9B3y2
	KWwWj9t2iFGXdeyjg4JYMEaV5PmfeOSPv+FUrvzw1pQNxjEZGtKrqZHYEuYz2/wrReWi
	yKbtFukbuZefTB71qQ5C7qlIN6slFK1G6KZK/M8QV7z0bymShsBQTd11VULE6NSW0Rk0
	1JZm8f/qasf4N6ZwBfG1QFy2vCwUtkQdT1cEwiZ3G95LbXd+REGsygtq9Mg3Sf+lRQVm
	F70A==
X-Gm-Message-State: AOUpUlEkWtFP9+8NAvLwwwIqhkh6ww9AayQR8rkO8mpb1ZzVTuoRKkFx
	TWf5CMrTemAOa+b0RSUC8in9Tu+O
X-Google-Smtp-Source: AAOMgpdKee/T/F0h0LPkHblCLBzbkGdUTs1BCM5o2BTWlrh/Jk7lHxlWbTKS/3XP+fYjrtRDmfh+lQ==
X-Received: by 2002:a17:902:20e3:: with SMTP id
	v32-v6mr9095666plg.232.1533434840230; 
	Sat, 04 Aug 2018 19:07:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	b195-v6sm4486021pfb.2.2018.08.04.19.07.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Aug 2018 19:07:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Aug 2018 19:07:01 -0700
Message-Id: <0d73a984059768c95da08fafbbe7efada19ee7a3.1533434674.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533434674.git.raj.khem@gmail.com>
References: <cover.1533434674.git.raj.khem@gmail.com>
Subject: [PATCH 09/10] blktool: Fix build with glibc 2.28
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
X-List-Received-Date: Sun, 05 Aug 2018 02:07:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../blktool/blktool-gnulib-makedev.patch      | 23 +++++++++++++++++++
 meta/recipes-extended/blktool/blktool_4-7.bb  |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch

diff --git a/meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch b/meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch
new file mode 100644
index 0000000000..6eea608b29
--- /dev/null
+++ b/meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch
@@ -0,0 +1,23 @@
+include <sys/sysmacros.h> for major/minor defintions
+
+Fixes
+
+| ../blktool-4.orig/blktool.c: In function 'detect_dev_class':
+| ../blktool-4.orig/blktool.c:295:10: warning: implicit declaration of function 'major' [-Wimplicit-function-declaration]
+|   switch (major(st_rdev)) {
+|           ^~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: blktool-4.orig/blktool.c
+===================================================================
+--- blktool-4.orig.orig/blktool.c
++++ blktool-4.orig/blktool.c
+@@ -27,6 +27,7 @@
+ #include <linux/cdrom.h>
+ #include <linux/major.h>
+ #include <scsi/scsi.h>
++#include <sys/sysmacros.h>
+ 
+ #include "blktool.h"
+ 
diff --git a/meta/recipes-extended/blktool/blktool_4-7.bb b/meta/recipes-extended/blktool/blktool_4-7.bb
index 4551c3233e..0e6f7ee6df 100644
--- a/meta/recipes-extended/blktool/blktool_4-7.bb
+++ b/meta/recipes-extended/blktool/blktool_4-7.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/
            file://0001-fix-typos-in-manpage.patch \
            file://0002-fix-string-error.patch \
            file://0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch \
+           file://blktool-gnulib-makedev.patch \
           "
 
 SRC_URI[tarball.md5sum] = "62edc09c9908107e69391c87f4f3fd40"
-- 
2.18.0



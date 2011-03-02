Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pub32-0005YN-Io
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 02:40:17 +0100
Received: by mail-iw0-f175.google.com with SMTP id 10so5049771iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2011 17:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=tGRzFRuFRu7UJ7AuALyInv8js+mQm6SqgUD/PeKRAHU=;
	b=oLzwHQEuat3XptAEuHPYDA16PMWczHjCai2DQo0rACw/BzmDcB1CCmZzq1M//9BdvA
	vao8aqCo1h41UttWiJYdfu4yikdAYjcsCR+MCDby4Rg7OFIL3GxrHqHmYuqkr+zVL7fw
	75G/LxwltKeBnBFhWDRo0NlygO82q6haPbMRk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MgOxCx9F91TeUbkRGfqiglsdug+8nJUPvY3c3Vw1viFxkMqSOIV24eB7LhxrvHPq+A
	VUF8mJlQzFDwPyN1f5DAIwRhupvGXuZY/SKOIZxEbcw5Hbh3xe04BQjVgH8pUOt3FL1R
	7o+uv1pXWSpdKiEAxF9l/5cxxOlOPKtqiNxBc=
Received: by 10.42.173.65 with SMTP id q1mr7507028icz.391.1299029931579;
	Tue, 01 Mar 2011 17:38:51 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d21sm6206023ibg.9.2011.03.01.17.38.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2011 17:38:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2011 17:38:30 -0800
Message-Id: <1299029911-3973-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
References: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 5/6] qemu-0.13.0: Add patch to avoid mmap_min_addr
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2011 01:40:17 -0000

* This patch is taken from OE commit 40e293342ca76921904a43b03b635d9219432edf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fallback-to-safe-mmap_min_addr.patch           |   37 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.13.0.bb          |    6 ++-
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/fallback-to-safe-mmap_min_addr.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/fallback-to-safe-mmap_min_addr.patch b/meta/recipes-devtools/qemu/qemu-0.13.0/fallback-to-safe-mmap_min_addr.patch
new file mode 100644
index 0000000..7c782b9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.13.0/fallback-to-safe-mmap_min_addr.patch
@@ -0,0 +1,37 @@
+From c313f89c33217ac0e471554dace2144718f86669 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 13 May 2010 12:23:40 +0200
+Subject: [PATCH] linux-user: use default mmap_min_addr 65536 when /proc/sys/vm/mmap_min_addr cannot be read
+
+* 65536 is default at least for ubuntu and fedora.
+---
+ linux-user/main.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+Index: qemu-0.13.0/linux-user/main.c
+===================================================================
+--- qemu-0.13.0.orig/linux-user/main.c
++++ qemu-0.13.0/linux-user/main.c
+@@ -36,6 +36,7 @@
+ #include "envlist.h"
+ 
+ #define DEBUG_LOGFILE "/tmp/qemu.log"
++#define MMAP_MIN_ADDR_DEFAULT 65536
+ 
+ char *exec_path;
+ 
+@@ -2973,8 +2974,14 @@ int main(int argc, char **argv, char **e
+             if (fscanf(fp, "%lu", &tmp) == 1) {
+                 mmap_min_addr = tmp;
+                 qemu_log("host mmap_min_addr=0x%lx\n", mmap_min_addr);
++            } else {
++                qemu_log("cannot read value from /proc/sys/vm/mmap_min_addr, assuming %d\n", MMAP_MIN_ADDR_DEFAULT);
++                mmap_min_addr = MMAP_MIN_ADDR_DEFAULT;
+             }
+             fclose(fp);
++        } else {
++            qemu_log("cannot open /proc/sys/vm/mmap_min_addr for reading, assuming %d\n", MMAP_MIN_ADDR_DEFAULT);
++            mmap_min_addr = MMAP_MIN_ADDR_DEFAULT;
+         }
+     }
+ 
diff --git a/meta/recipes-devtools/qemu/qemu_0.13.0.bb b/meta/recipes-devtools/qemu/qemu_0.13.0.bb
index 945c570..71b56b7 100644
--- a/meta/recipes-devtools/qemu/qemu_0.13.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.13.0.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r0"
+PR = "r1"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
@@ -26,7 +26,9 @@ SRC_URI = "\
     file://parallel_make.patch \
     file://wacom-tablet-fix.patch \
     file://port92_fix.patch \
-    file://powerpc_rom.bin"
+    file://powerpc_rom.bin \
+    file://fallback-to-safe-mmap_min_addr.patch \
+    "
 
 SRC_URI[md5sum] = "397a0d665da8ba9d3b9583629f3d6421"
 SRC_URI[sha256sum] = "1e6f5851b05cea6e377c835f4668408d4124cfb845f9948d922808743c5fd877"
-- 
1.7.4.1




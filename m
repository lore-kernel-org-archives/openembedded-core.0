Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5617F27F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 04:02:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,276,1559491200"; d="scan'208";a="71689706"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jul 2019 12:02:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6CF314CDDAEB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 12:02:29 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 18 Jul 2019 12:02:35 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jul 2019 12:01:43 +0800
Message-ID: <20190718040143.13724-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 6CF314CDDAEB.AC267
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libpciaccess:upgrade 0.14 -> 0.16
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
X-List-Received-Date: Thu, 18 Jul 2019 04:02:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from libpciaccess_0.14.bb to libpciaccess_0.16.bb.

-libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
 Removed since this is included in 0.16.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../0004-Don-t-include-sys-io.h-on-arm.patch       | 28 ----------------------
 .../{libpciaccess_0.14.bb => libpciaccess_0.16.bb} |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.14.bb => libpciaccess_0.16.bb} (65%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
deleted file mode 100644
index f532858..0000000
--- a/meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b6df5202306bd71158b482f25ca2e6919645d4dd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 4 Jun 2015 20:55:06 -0700
-Subject: [PATCH 4/4] Don't include sys/io.h on arm
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/linux_sysfs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/linux_sysfs.c b/src/linux_sysfs.c
-index 3f95e53..1e3aad3 100644
---- a/src/linux_sysfs.c
-+++ b/src/linux_sysfs.c
-@@ -50,7 +50,7 @@
- #include <dirent.h>
- #include <errno.h>
- 
--#if defined(__i386__) || defined(__x86_64__) || defined(__arm__)
-+#if defined(__i386__) || defined(__x86_64__)
- #include <sys/io.h>
- #else
- #define inb(x) -1
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
similarity index 65%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
index d030c31..b58cb80 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
@@ -6,11 +6,10 @@ PCI bus and devices in a platform-independent way."
 require xorg-lib-common.inc
 
 SRC_URI += "\
-            file://0004-Don-t-include-sys-io.h-on-arm.patch \
 "
 
-SRC_URI[md5sum] = "8f436e151d5106a9cfaa71857a066d33"
-SRC_URI[sha256sum] = "3df543e12afd41fea8eac817e48cbfde5aed8817b81670a4e9e493bb2f5bf2a4"
+SRC_URI[md5sum] = "b34e2cbdd6aa8f9cc3fa613fd401a6d6"
+SRC_URI[sha256sum] = "214c9d0d884fdd7375ec8da8dcb91a8d3169f263294c9a90c575bf1938b9f489"
 
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
-- 
2.7.4





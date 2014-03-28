Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 176276ED34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9h9Qq024473
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:09 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:42:44 +0800
Message-ID: <6062ea15a03a3e33171bfacd8eeca529825c0bcd.1395996041.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996041.git.hongxu.jia@windriver.com>
References: <cover.1395996041.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 5/6] Qemu:Arm:versatilepb: Add memory size checking
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:09 -0000
Content-Type: text/plain

From: Jiang Lu <lu.jiang@windriver.com>

The machine can not work with memory over 256M, so add a checking
at startup. If the memory size exceed 256M, just stop emulation then
throw out warning about memory limitation.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-Arm-versatilepb-Add-memory-size-checking.patch | 40 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.7.0.bb           |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch

diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
new file mode 100644
index 0000000..3834aed
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
@@ -0,0 +1,40 @@
+From 896fa02c24347e6e9259812cfda187b1d6ca6199 Mon Sep 17 00:00:00 2001
+From: Jiang Lu <lu.jiang@windriver.com>
+Date: Wed, 13 Nov 2013 10:38:08 +0800
+Subject: [PATCH] Qemu:Arm:versatilepb: Add memory size checking
+
+The machine can not work with memory over 256M, so add a checking
+at startup. If the memory size exceed 256M, just stop emulation then
+throw out warning about memory limitation.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
+
+Updated it on 2014-01-15 for rebasing
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ hw/arm/versatilepb.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
+index b48d84c..ad2cd5a 100644
+--- a/hw/arm/versatilepb.c
++++ b/hw/arm/versatilepb.c
+@@ -199,6 +199,12 @@ static void versatile_init(QEMUMachineInitArgs *args, int board_id)
+         fprintf(stderr, "Unable to find CPU definition\n");
+         exit(1);
+     }
++    if (ram_size > (256 << 20)) {
++        fprintf(stderr,
++                "qemu: Too much memory for this machine: %d MB, maximum 256 MB\n",
++                ((unsigned int)ram_size / (1 << 20)));
++        exit(1);
++    }
+     memory_region_init_ram(ram, NULL, "versatile.ram", args->ram_size);
+     vmstate_register_ram_global(ram);
+     /* ??? RAM should repeat to fill physical memory space.  */
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/qemu/qemu_1.7.0.bb b/meta/recipes-devtools/qemu/qemu_1.7.0.bb
index be6dd51..b776ccc 100644
--- a/meta/recipes-devtools/qemu/qemu_1.7.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.7.0.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
 SRC_URI += "file://fxrstorssefix.patch \
-            file://qemu-enlarge-env-entry-size.patch"
+            file://qemu-enlarge-env-entry-size.patch \
+            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
 SRC_URI[md5sum] = "32893941d40d052a5e649efcf06aca06"
-- 
1.8.1.2



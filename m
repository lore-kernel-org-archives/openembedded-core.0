Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3ED8A7271F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 01:39:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBI1d2ED024704
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 17 Dec 2014 17:39:02 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Wed, 17 Dec 2014 17:39:01 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 09:36:40 +0800
Message-ID: <1418866600-19393-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1418866600-19393-1-git-send-email-kai.kang@windriver.com>
References: <1418866600-19393-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: upgrade to 2.2.0
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
X-List-Received-Date: Thu, 18 Dec 2014 01:39:11 -0000
Content-Type: text/plain

Upgrade qemu from version 2.1.2 to 2.2.0.

Update Qemu-Arm-versatilepb-Add-memory-size-checking.patch for new
version qemu.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch  | 10 +++++++---
 meta/recipes-devtools/qemu/{qemu_2.1.2.bb => qemu_2.2.0.bb}    |  4 ++--
 2 files changed, 9 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_2.1.2.bb => qemu_2.2.0.bb} (82%)

diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
index 7f1c5a9..b0c2ea5 100644
--- a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
+++ b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
@@ -14,6 +14,10 @@ Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
 Updated it on 2014-01-15 for rebasing
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Update it when upgrade qemu to 2.2.0
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  hw/arm/versatilepb.c |    6 ++++++
  1 file changed, 6 insertions(+)
@@ -22,7 +26,7 @@ diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
 index b48d84c..ad2cd5a 100644
 --- a/hw/arm/versatilepb.c
 +++ b/hw/arm/versatilepb.c
-@@ -199,6 +199,12 @@ static void versatile_init(QEMUMachineInitArgs *args, int board_id)
+@@ -198,6 +198,12 @@ static void versatile_init(MachineState *machine, int board_id)
          fprintf(stderr, "Unable to find CPU definition\n");
          exit(1);
      }
@@ -32,9 +36,9 @@ index b48d84c..ad2cd5a 100644
 +                ((unsigned int)ram_size / (1 << 20)));
 +        exit(1);
 +    }
-     memory_region_init_ram(ram, NULL, "versatile.ram", machine->ram_size);
+     memory_region_init_ram(ram, NULL, "versatile.ram", machine->ram_size,
+                            &error_abort);
      vmstate_register_ram_global(ram);
-     /* ??? RAM should repeat to fill physical memory space.  */
 -- 
 1.7.10.4
 
diff --git a/meta/recipes-devtools/qemu/qemu_2.1.2.bb b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
similarity index 82%
rename from meta/recipes-devtools/qemu/qemu_2.1.2.bb
rename to meta/recipes-devtools/qemu/qemu_2.2.0.bb
index 55ae7b6..209b910 100644
--- a/meta/recipes-devtools/qemu/qemu_2.1.2.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
@@ -8,8 +8,8 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "0ff197c4ed4b695620bc4734e77c888f"
-SRC_URI[sha256sum] = "fd10f5e45cf5a736fa5a3e1c279ae9821534e700beb7d1aab88a07648a394885"
+SRC_URI[md5sum] = "f7a5e2da22d057eb838a91da7aff43c8"
+SRC_URI[sha256sum] = "b68c9b6c7c694f5489b5a6bffe993cd976ffbb78e7d178eb3bc016caf460039c"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
1.9.1



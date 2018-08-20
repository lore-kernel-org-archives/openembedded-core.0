Return-Path: <Kexin.Hao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8F879164
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 10:48:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7KAm0Ya021414
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Aug 2018 03:48:00 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 20 Aug 2018 03:48:00 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2018 18:42:25 +0800
Message-ID: <20180820104225.90976-2-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180820104225.90976-1-kexin.hao@windriver.com>
References: <20180820104225.90976-1-kexin.hao@windriver.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>
Subject: [PATCH 2/2] wic: bootimg-partition: Select a preferred type if multi kernel images are installed
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
X-List-Received-Date: Mon, 20 Aug 2018 10:48:00 -0000
Content-Type: text/plain

Automatically select one kernel type image based on a predefined
precedence list if there are multi kernel images installed.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 .../lib/wic/plugins/source/bootimg-partition.py    | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 2e9b9f5ed657..ddc880be366f 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -130,24 +130,28 @@ class BootimgPartitionPlugin(SourcePlugin):
 
         if not custom_cfg:
             # The kernel types supported by the sysboot of u-boot
-            kernel_types = ["uImage", "zImage", "Image", "vmlinux", "fitImage"]
+            kernel_types = ["zImage", "Image", "fitImage", "uImage", "vmlinux"]
             has_dtb = False
             fdt_dir = '/'
             kernel_name = None
-            for task in cls.install_task:
-                src, dst = task
-                # Find the kernel image name
-                for image in kernel_types:
+
+            # Find the kernel image name, from the highest precedence to lowest
+            for image in kernel_types:
+                for task in cls.install_task:
+                    src, dst = task
                     if re.match(image, src):
-                        if not kernel_name:
-                            kernel_name = os.path.join('/', dst)
-                        else:
-                            raise WicError('Multi kernel file founded')
+                        kernel_name = os.path.join('/', dst)
+                        break
+                if kernel_name:
+                    break
 
+            for task in cls.install_task:
+                src, dst = task
                 # We suppose that all the dtb are in the same directory
                 if re.search(r'\.dtb', src) and fdt_dir == '/':
                     has_dtb = True
                     fdt_dir = os.path.join(fdt_dir, os.path.dirname(dst))
+                    break
 
             if not kernel_name:
                 raise WicError('No kernel file founded')
-- 
2.14.4



Return-Path: <Lu.Jiang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0C39792BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 10:03:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7UA3Uni010504
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:03:31 -0700 (PDT)
Received: from pek-ljiang0-d1.wrs.com (128.224.162.214) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 03:03:30 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2018 18:01:21 +0800
Message-ID: <1535623282-13919-7-git-send-email-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535623282-13919-1-git-send-email-lu.jiang@windriver.com>
References: <1535623282-13919-1-git-send-email-lu.jiang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] wic:bootimg-efi:try other place for efi
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
X-List-Received-Date: Thu, 30 Aug 2018 10:03:29 -0000
Content-Type: text/plain

When there is no useful efi in $kerneldir, try copy
all efi from EFI/BOOT into boot image.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 .../wic/files/wic/plugins/source/bootimg-efi.py              | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
index 0eb86a0..d435268 100644
--- a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
+++ b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
@@ -231,6 +231,18 @@ class BootimgEFIPlugin(SourcePlugin):
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" %
                                source_params['loader'])
+            os.listdir("%s/EFI/BOOT/" % hdddir)
+            found_efi = False
+            for x in os.listdir("%s/EFI/BOOT/" % hdddir) :
+                if x.endswith(".efi"):
+                    found_efi = True
+                    break;
+            if not found_efi:
+                cp_cmd = "cp %s/EFI/BOOT/*.efi %s/EFI/BOOT/" % (kernel_dir, hdddir)
+                try:
+                    exec_cmd(cp_cmd, True)
+                except:
+                    pass
         except KeyError:
             raise WicError("bootimg-efi requires a loader, none specified")
 
-- 
2.7.4



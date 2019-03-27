Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail5.wrs.com (unknown [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97C8A60720
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:38:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2RAblYI012011
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 03:38:08 -0700
Received: from localhost.localdomain.com (128.224.162.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 27 Mar 2019 03:37:52 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Mar 2019 18:37:42 +0800
Message-ID: <1553683062-24444-1-git-send-email-yongxin.liu@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] wic/bootimg-efi.py: add new source parameter "initrd_rename"
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
X-List-Received-Date: Wed, 27 Mar 2019 10:38:23 -0000
Content-Type: text/plain

When using initrd in bootloader configuration file, we may want
the name of initrd to be fixed. However, the actual name of initrd
may change and depend on distro/machine's name. "initrd_rename"
gives user a chance to rename initrd in final wic image.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 83a7e18..852ed88 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -69,7 +69,11 @@ class BootimgEFIPlugin(SourcePlugin):
             if not bootimg_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-            cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
+            initrd_rename = source_params.get('initrd_rename')
+            if initrd_rename:
+                cp_cmd = "cp %s/%s %s/%s" % (bootimg_dir, initrd, hdddir, initrd_rename)
+            else:
+                cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
             exec_cmd(cp_cmd, True)
         else:
             logger.debug("Ignoring missing initrd")
@@ -126,7 +130,11 @@ class BootimgEFIPlugin(SourcePlugin):
             if not bootimg_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-            cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
+            initrd_rename = source_params.get('initrd_rename')
+            if initrd_rename:
+                cp_cmd = "cp %s/%s %s/%s" % (bootimg_dir, initrd, hdddir, initrd_rename)
+            else:
+                cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
             exec_cmd(cp_cmd, True)
         else:
             logger.debug("Ignoring missing initrd")
-- 
1.8.3.1



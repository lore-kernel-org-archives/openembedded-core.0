Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 23A4261153
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 14:49:42 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id x7so2763634wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 06:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PrVmJAQInl4vcQFPCC/Neb4rIr8Qtn3irKrc9cIgZFU=;
	b=MBGrXyYORL0NRu1vltntF+q5B0MsRv2WtXxMMlrT7XTsOvbxXip7armJoc137KPCzZ
	li21wSr4/YWnd9W2Mn8diCNEWYdqLs+83whVUJAugmfzgQFPWcOMUjgGtYDQGwbFZvQU
	E++DA3tb3J1AA90sB8m+jt2WCDuidhL67xnI4pMhxuLqHwwSzy0CT/rGCeTfw9XldjHy
	TLdYkGqriLhGj5zh6tVcRxL8Z/b3oUVRKWKjmuj7o+0R+N++JYHHZjNSQrD+0A0ibwtR
	mn7rRLgIgxiQAzY6xoUB1MVgita0p5PJHyCA9CyaPPHwwlROmWfA4sw3Wr4o9r32EXBH
	lDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=PrVmJAQInl4vcQFPCC/Neb4rIr8Qtn3irKrc9cIgZFU=;
	b=atpgy17fRyEVUne+OPjvJYRhOLqRDAl2NfLenBCbFb+S32hk92hIFNwEHZz8NDkavc
	KAmjy6aKhHiMbHqWaPV+2bC5zR9zVDz9mIJobxpAV1ms1P6AZ3Tvu7f8mKcRHdBRbhvA
	nyLRCxrrnjBhYsaNuv0cogccLptiSDy34e1KPQt0bgUpVjZyANRCBxXGPG1G4lCkcMHv
	BYnLftNyuG3UPGWxpuR4eyN3WaZsl0u+uTTEpBEoQem1MCDyDfuohBy3K32G92FZEZO9
	+ZMu+4RF89FJsSwJIxoOkp95jsbyaG1mFJLX0Fh3Ne3ld2vemp4QIYOHx2mZqaQlq7Zr
	Bolw==
X-Gm-Message-State: ANhLgQ3DGlXif7WbD4G26SOcb7fEJYD3MMZrtkN1Jw60dxAzArewE+A3
	KfXqE8syNx0TcUSj/bAUi8+R/HyGZWM=
X-Google-Smtp-Source: ADFU+vv4SlvcVNm30ihuN8Bf1TxoqL6BX3NK/fooKlWxi/xn+Dg+aSz1eHH06OGZRU7zQcmpUvxoSw==
X-Received: by 2002:a5d:6086:: with SMTP id w6mr4401272wrt.224.1583333382408; 
	Wed, 04 Mar 2020 06:49:42 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	a26sm4723600wmm.18.2020.03.04.06.49.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 06:49:41 -0800 (PST)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com,
	pbarker@konsulko.com
Date: Wed,  4 Mar 2020 15:49:35 +0100
Message-Id: <20200304144936.2559106-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
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
X-List-Received-Date: Wed, 04 Mar 2020 14:49:42 -0000
Content-Transfer-Encoding: 8bit

When parameters include_path or exclude_path are passed to the rootfs
plugin, it will copy the partition content into a folder and make all
the modifications there.

This is done using copyhardlinktree(), which does not take into
consideration the content of the pseudo folder, which contains the
information about the right permissions and ownership of the folders.

This results in a rootfs owned by the user that is running the wic
command (usually UID 1000), which makes some rootfs unbootable.

To fix this we copy the content of the pseudo folders to the new folder
and modify the pseudo database using the "pseudo -B" command.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 705aeb5563..40419a64b3 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -16,11 +16,11 @@ import os
 import shutil
 import sys
 
-from oe.path import copyhardlinktree
+from oe.path import copyhardlinktree, copytree
 
 from wic import WicError
 from wic.pluginbase import SourcePlugin
-from wic.misc import get_bitbake_var
+from wic.misc import get_bitbake_var, exec_native_cmd
 
 logger = logging.getLogger('wic')
 
@@ -44,6 +44,15 @@ class RootfsPlugin(SourcePlugin):
 
         return os.path.realpath(image_rootfs_dir)
 
+    @staticmethod
+    def __get_pseudo(native_sysroot, rootfs):
+        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
+        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % os.path.join(rootfs, "../pseudo")
+        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs
+        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
+        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
+        return pseudo
+
     @classmethod
     def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
@@ -78,9 +87,16 @@ class RootfsPlugin(SourcePlugin):
 
             if os.path.lexists(new_rootfs):
                 shutil.rmtree(os.path.join(new_rootfs))
-
             copyhardlinktree(part.rootfs_dir, new_rootfs)
 
+            if os.path.lexists(os.path.join(new_rootfs, "../pseudo")):
+                shutil.rmtree(os.path.join(new_rootfs, "../pseudo"))
+            copytree(os.path.join(part.rootfs_dir, "../pseudo"),
+                     os.path.join(new_rootfs, "../pseudo"))
+            pseudo_cmd = "%s -B -m %s -M %s" % (cls.__get_pseudo(native_sysroot,new_rootfs),
+                                                part.rootfs_dir, new_rootfs)
+            exec_native_cmd(pseudo_cmd, native_sysroot)
+
             for path in part.include_path or []:
                 copyhardlinktree(path, new_rootfs)
 
-- 
2.25.1



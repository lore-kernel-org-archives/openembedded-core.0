Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5184D611E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 08:34:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id a141so889826wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 00:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PrVmJAQInl4vcQFPCC/Neb4rIr8Qtn3irKrc9cIgZFU=;
	b=CvblPpVUa4IYWxCOBh6pipvn7bp++0+IhcDQIhyYBqU1EtvKyhBsP2GYn9zrUlmC5r
	ffrbnGdqc6l6bf+3G5hATAxySTsInPSHONFgDj7naTeuO1lbUHa8FN0A4xlnuYmN/Mzr
	X4KIH4Z3xuxvFbsFCnziP1O1IMFrVFJPjoN5prvcpGKK+DV2fC7r0NpNzqi5fzs1+deZ
	WHKoTL8KEfrYEGtTcpboZwUqkQGYKsoUgu6fyPEZxga+c7eCmGo6/E6CNOq/+PDW+oE/
	bCDaqYS37KXttSieN3kIXA1Po7ryr8BDpJAFBrP1ykyX3dzsMXUUrKkElECG1TSmyj/9
	6cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=PrVmJAQInl4vcQFPCC/Neb4rIr8Qtn3irKrc9cIgZFU=;
	b=okhHfxY1diABIT3mPflg/lIcHYtleNaej/yw9EHnlKFmhBcKF67SCaxl6BROSw/ILM
	NmKl6dQqAQkUWEDPATjqtx+kkWtQn95xBlDbyDtGhFvL5WSdAN88HQXdAj14JTjsggsT
	wLR1W7qtBMiolG2Z0I4kUGwbmPClnO0/9+MDJ5LsHIW+Gzd5ahSr+yC5qPHAbMCWDMHs
	V0Vhs7IoznMveVxEef9NQxgCzw52yxmlomwotaWQKFC1GOT4HE8gQKzdni0Korgxi/+9
	VNCgyMaTrX1600qnfhsRz7Jf/VyElmY9i+PyMWrh36cS/MCdOae6cMK7Taj1mOvvJaWb
	l06g==
X-Gm-Message-State: ANhLgQ3Mhth7wZB2LxCDrr1aUklrAl5JWvA716zgF7n61fNWq4rLFrwI
	E1EjKleBMwLtV0bbeHiZo9RRSPirpI8=
X-Google-Smtp-Source: ADFU+vt4AB+ImGyg4TFgCEC4t6/+pK8iujqXNhdLFpsAe6m3kp+2kJh5u4kOYzge12dXjXUtjI+b0w==
X-Received: by 2002:a05:600c:2c4d:: with SMTP id
	r13mr2379394wmg.112.1583310882503; 
	Wed, 04 Mar 2020 00:34:42 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	z10sm2962821wmk.31.2020.03.04.00.34.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 00:34:41 -0800 (PST)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 09:34:37 +0100
Message-Id: <20200304083438.1022216-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH 1/2] wic: Fix permissions when using exclude or include path
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
X-List-Received-Date: Wed, 04 Mar 2020 08:34:42 -0000
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



Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id 28D8C7FCA8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 13:08:30 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id j26so9943220ljc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 05:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=5bZ3VumH9j+UcX/+yztg1puOqugtjkBZEpCZvFykK98=;
	b=ELx4H5A2cCT0xyEeBTHhdO91XBiL4L6XUWUV7jBMwRL8VmfZbFiKm0wMg7iZWwniJb
	uQkS63Xv8NIdxDVAB/vRspwQGCDmBvlB8KnbbqlTa/nzO7N4SXXla1ELgM5hKodUuhw7
	4DWAq8l4d4bYEmTTUghPBnzHA6bdB31MEX+8pkRGpYa5iBC0vmCaVGEdgFH+Y6PIiBND
	pNg/Vl+ka5wq5kgxfzdsLEjcneko5W7DoHJZO7zUP6eZgp5Qhp4NTV9yKBvVKfvcvjNI
	VEy4DM0ZI2EKqcNqwTgELHhuDbZPoT32o1ahsczwEmZ385FJ2+gtqhlq4NKbwDKR+RkY
	hgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5bZ3VumH9j+UcX/+yztg1puOqugtjkBZEpCZvFykK98=;
	b=Ln6gFLcmecdaPE6nv8TYB5QZIEU+mS68K4a61FixcbFH8o+u8CTGk2ZLEByP8H/GCe
	SscYtVHzmAoCRhvYUoUSNdQqZx8tvMHHHVnPihuph3LJgREio33Lp8nb/7zKz92BdE92
	f8BvyuuFPYUxCiChcaQk8EcftfHnUcEh/vpxSGBPALMFBz/GKHDOb72DF/OhS2QhGHmH
	u3CggFrC+N6PspCQOeGocKa38GIGCKZvAwcMj05vuw/ulc3pXZu0ou7UM0M+8G4zGe27
	a6blhx9hT6gE7u784t9utdYT3zBgqi0pp5nseWjnQ1foF7aWxcOkkenZW5qY+FYkb9Qx
	Pa8Q==
X-Gm-Message-State: APjAAAVUeeyTqe/8wH6KvYiTgqlVWUYad4P5AGIbUN59z04KbOizGkpO
	cJPl+nn0tWbKd3ryb1yswS2D6oiiggk=
X-Google-Smtp-Source: APXvYqwBswokyB4ucT6cJiES+jBjzaTPt3x/x7ss63J9tgXdBvlmgrQ/tL+gOwKDcrH1PqRBU1jGiw==
X-Received: by 2002:a2e:8745:: with SMTP id q5mr10037900ljj.208.1578920911245; 
	Mon, 13 Jan 2020 05:08:31 -0800 (PST)
Received: from maximlap.d-systems.local ([185.75.190.112])
	by smtp.gmail.com with ESMTPSA id
	c12sm5612548lfp.58.2020.01.13.05.08.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 05:08:30 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2020 16:08:27 +0300
Message-Id: <20200113130827.7409-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCHv2] wic: fix images build in parallel
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
X-List-Received-Date: Mon, 13 Jan 2020 13:08:31 -0000

OE wic plugins create temporary file with the index of the line
tmp file name. This causes race in case several builds run in time.
Add more entropy as timestamp to remove this race.

Suggested-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 v2: shortlog change to match template.

 scripts/lib/wic/plugins/source/bootimg-partition.py | 5 +++--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py    | 3 ++-
 scripts/lib/wic/plugins/source/rawcopy.py           | 3 ++-
 scripts/lib/wic/plugins/source/rootfs.py            | 3 ++-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 138986a71e..b6cea1096a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -13,6 +13,7 @@
 import logging
 import os
 import re
+import time
 
 from glob import glob
 
@@ -38,7 +39,7 @@ class BootimgPartitionPlugin(SourcePlugin):
         """
         Called before do_prepare_partition(), create u-boot specific boot config
         """
-        hdddir = "%s/boot.%d" % (cr_workdir, part.lineno)
+        hdddir = "%s/boot.%d" % (cr_workdir, part.lineno, time.time())
         install_cmd = "install -d %s" % hdddir
         exec_cmd(install_cmd)
 
@@ -171,7 +172,7 @@ class BootimgPartitionPlugin(SourcePlugin):
         - sets up a vfat partition
         - copies all files listed in IMAGE_BOOT_FILES variable
         """
-        hdddir = "%s/boot.%d" % (cr_workdir, part.lineno)
+        hdddir = "%s/boot.%d_%s" % (cr_workdir, part.lineno, time.time())
 
         if not kernel_dir:
             kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index f2639e7004..8ac73c2067 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -13,6 +13,7 @@
 import logging
 import os
 import re
+import time
 
 from wic import WicError
 from wic.engine import get_custom_config
@@ -184,7 +185,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
                      extra_blocks, part.mountpoint, blocks)
 
         # dosfs image, created by mkdosfs
-        bootimg = "%s/boot%s.img" % (cr_workdir, part.lineno)
+        bootimg = "%s/boot%s_%s.img" % (cr_workdir, part.lineno, time.time())
 
         dosfs_cmd = "mkdosfs -n boot -i %s -S 512 -C %s %d" % \
                     (part.fsuuid, bootimg, blocks)
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 82970ce51b..9ada3d39c9 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -4,6 +4,7 @@
 
 import logging
 import os
+import time
 
 from wic import WicError
 from wic.pluginbase import SourcePlugin
@@ -57,7 +58,7 @@ class RawCopyPlugin(SourcePlugin):
             raise WicError("No file specified")
 
         src = os.path.join(kernel_dir, source_params['file'])
-        dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
+        dst = os.path.join(cr_workdir, "%s.%s_%s" % (source_params['file'], part.lineno, time.time()))
 
         if not os.path.exists(os.path.dirname(dst)):
             os.makedirs(os.path.dirname(dst))
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 705aeb5563..37ebee89ea 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -15,6 +15,7 @@ import logging
 import os
 import shutil
 import sys
+import time
 
 from oe.path import copyhardlinktree
 
@@ -74,7 +75,7 @@ class RootfsPlugin(SourcePlugin):
         if part.exclude_path or part.include_path:
             # We need a new rootfs directory we can delete files from. Copy to
             # workdir.
-            new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
+            new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d_%s" % (part.lineno, time.time())))
 
             if os.path.lexists(new_rootfs):
                 shutil.rmtree(os.path.join(new_rootfs))
-- 
2.17.1



Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id B57487EB0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 12:37:54 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y19so6730988lfl.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 04:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=w5N5l01hf+sChGfSgseLVkp19W4ILQ2ylig+oMc0YWA=;
	b=j3v17JqVN4thaiemgcmMn7Qn1/AxNKLC5oWtgL/EP92Ou8Plj8OIQenV9FR2L5KuFG
	hatoBHg2K5CEJoeHwf7LwjmRWxYemb8Cbe2uxvNloJ1Ql1uf74UDNJ6HkQZ388aKivMk
	hd2TOvgaSxyX5bMy/w9ydKjrbGbDvKvSYGUC2yFi1CabPjfzTB533dHbqPN8gOch+sCL
	28UdxaIU1YX2/mXH/NVlFqeoqaYCDhSyox4RCTja+CU4R2YuUicKTJvW3G11Vr4xXLd1
	E4Kjr3/vdlNYVst8huVP32WhILy7V/IuSSONFWMoq9SIVhzLxLnGbhsYevm+LyE3gwke
	fNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w5N5l01hf+sChGfSgseLVkp19W4ILQ2ylig+oMc0YWA=;
	b=n3key7qLi8jZhHXpaOVuWnnypElMxWq2Jry+/vx8kiTL2kJAlLww8TavyTXAqgvmap
	/evjGDf2oFIK5PZQC3YkCf2ldctk2+Fg93va5XdOTh24C+XW5eCHtVVZ9iSEhkR3oRX+
	R8pAyQRttbVSVikCc0IMts/jHtbDh3d1als6fNRklKXxa/W6SdetO3MLioV2eBu8O7nw
	+tLMCI9qaLcZOA+QJGiv/XxYThxQdwuhRM+ZDY/5pPyiOXx8hXM1pnn+ey9N12uoF+fm
	c39GCFwmHlAucnJWxofxJUSoW5SU1hLI3BCWthU67f9mXv/CI9C8JCkVTJQxRQ9WyBU0
	WNdA==
X-Gm-Message-State: APjAAAU5ERkUGr/u1RbDAVw3UK39nT6QTBc1sggnm/m5NQbykL7RQR+b
	fjGNb0d1nZI6gwFGJ/sUJkYXXMZpTXg=
X-Google-Smtp-Source: APXvYqxWCj24AGwFu6fZoYL9Y7pbDrPBtL7LPCIXWFlbPNw+tpesq3v3D8hT/BpeC037WhKvGRevlg==
X-Received: by 2002:a19:c697:: with SMTP id w145mr9869447lff.54.1578919074812; 
	Mon, 13 Jan 2020 04:37:54 -0800 (PST)
Received: from maximlap.d-systems.local ([185.75.190.112])
	by smtp.gmail.com with ESMTPSA id
	s18sm6744566ljj.36.2020.01.13.04.37.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 04:37:54 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2020 15:37:51 +0300
Message-Id: <20200113123751.6513-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] fix wic images build in parallel
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
X-List-Received-Date: Mon, 13 Jan 2020 12:37:55 -0000

OE wic plugins create temporary file with the index of the line
tmp file name. This causes race in case several builds run in time.
Add more entropy as timestamp to remove this race.

Suggested-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
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



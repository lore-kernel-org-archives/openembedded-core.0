Return-Path: <joaohf@gmail.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3755B6F5BB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 21:18:16 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id sa20so4134494veb.36
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 14:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=NZKrrrE79TQ2zYXg6LBM3SwVMLNg14pSqDrK9n2GSLs=;
	b=fAyLbcumeuZDlzXGCdyfhjFMek1l4IMFkKRyCmBoEpGsmZEFbwtZShH3zpdTVhQNlB
	Z1FMDCXFa3gVugD5hRdCUyRAb5g/IEV4Qj1An5f8YfzrxWB7B5dhDSww82D/WkD/sWua
	bAJKbTQiyecXu165FD72ohwgx9C+nAKs1CUuwHLcn+OUh/uW3nOHlEZDkSY7eJ8RaLE0
	7fVgXt40C3iFVgVkes3vMfPs5qwUeYnqSqth8Oo2qjVLJZIotD6fMeQLML6J+GRq3fQQ
	aqu0PsHujr0KfkD3O9lSvz73DK2oFo8WoUIJMI4VtXpe71iK1AnEEFOntOtLVx6GqP1y
	9/IQ==
X-Received: by 10.52.248.138 with SMTP id ym10mr10782069vdc.18.1394918297130; 
	Sat, 15 Mar 2014 14:18:17 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id am5sm4382714vdc.15.2014.03.15.14.18.15
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Mar 2014 14:18:16 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 18:17:47 -0300
Message-Id: <1394918271-14153-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 1/5] wic: Add RootfsPlugin
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
X-List-Received-Date: Sat, 15 Mar 2014 21:18:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement RootfsPlugin class. The do_prepare_partition() method
is implemented using code in Wic_PartData class.

This class have 'rootfs' name, which is the name that should
be used in the --source parameters of the .wks partition commands.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/mic/plugins/source/rootfs.py | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 scripts/lib/mic/plugins/source/rootfs.py

diff --git a/scripts/lib/mic/plugins/source/rootfs.py b/scripts/lib/mic/plugins/source/rootfs.py
new file mode 100644
index 0000000..da7aa0b
--- /dev/null
+++ b/scripts/lib/mic/plugins/source/rootfs.py
@@ -0,0 +1,58 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2014, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This implements the 'rootfs' source plugin class for 'wic'
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+# Joao Henrique Ferreira de Freitas <joaohf (at] gmail.com>
+#
+
+import os
+import shutil
+import re
+import tempfile
+
+from mic import kickstart, chroot, msger
+from mic.utils import misc, fs_related, errors, runner, cmdln
+from mic.conf import configmgr
+from mic.plugin import pluginmgr
+from mic.utils.partitionedfs import PartitionedMount
+import mic.imager.direct as direct
+from mic.pluginbase import SourcePlugin
+from mic.utils.oe.misc import *
+from mic.imager.direct import DirectImageCreator
+
+class RootfsPlugin(SourcePlugin):
+    name = 'rootfs'
+
+    @classmethod
+    def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
+                             kernel_dir, rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, prepare content for legacy bios boot partition.
+        """
+        if part.rootfs:
+            rootfs_dir = part.rootfs 
+        
+        part.prepare_rootfs(cr_workdir, oe_builddir, rootfs_dir, native_sysroot)
+
-- 
1.8.3.2



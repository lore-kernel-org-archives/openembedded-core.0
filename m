Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 878356F7C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 02:43:03 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ik5so1741561vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 19:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=NZKrrrE79TQ2zYXg6LBM3SwVMLNg14pSqDrK9n2GSLs=;
	b=qSvMvhW+L9RvO2QbN5ezpL2zoak3zDiYjpf2L1oY7IVf3PM6ZUeFMoH3KhGI0Pho81
	5sEQb+UsMLFHJNLWnWyMLv5VvGz0eUKIALSGTScElbmSBkgU6N6p7+0ZKGS+JrnbEA7q
	mZfzy7bUvZHDcQZm/2i/I9ZEX0gkpQesCOjiqmqXt4kGfCygXpc8VUCBLyP/k/lXe3AF
	eqzUWxgVFLuLL3B9oxpEXN5VswjBhJ1ubGRo0PIulKPa4fSzUjqsrc0QeXU/73r3iBcM
	a5W+lRwK/FM6vbEFGs1H8XUH5iNoXfA2iTlZbG//L4/pNoUzrPCnqvAwQmrYe3NTpUig
	NECQ==
X-Received: by 10.58.57.42 with SMTP id f10mr58703265veq.1.1395801784883;
	Tue, 25 Mar 2014 19:43:04 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id ay4sm35813974vdc.6.2014.03.25.19.43.03
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Mar 2014 19:43:04 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Mar 2014 23:42:43 -0300
Message-Id: <1395801769-13042-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1395801769-13042-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395801769-13042-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v2 1/7] wic: Add RootfsPlugin
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
X-List-Received-Date: Wed, 26 Mar 2014 02:43:04 -0000
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



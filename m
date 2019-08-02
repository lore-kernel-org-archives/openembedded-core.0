Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D02356BC7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 09:59:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x729xNPD017532
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Aug 2019 02:59:24 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 2 Aug 2019 02:59:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Aug 2019 18:24:36 +0800
Message-ID: <6e12b495c74cfe8497e067fe1b4c4b823c6d4abe.1564741458.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1564741458.git.liezhi.yang@windriver.com>
References: <cover.1564741458.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kill-bb: Add it for killing abnormal bitbake processes
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
X-List-Received-Date: Fri, 02 Aug 2019 09:59:25 -0000
Content-Type: text/plain

There might be processes left after Ctr-C, e.g.:
$ rm -f tmp/cache/default-glibc/qemux86/x86_64/
$ bitbake -p

Press 'Ctrl-C' multiple times during parsing, then bitbake processes may not
exit, and the worse is that we can't start bitbake again, we can't always
reproduce this, but sometime. We can only use "ps ux" to find the processes and
kill them one by one. This tool can kill all of them easily.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/kill-bb | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100755 scripts/kill-bb

diff --git a/scripts/kill-bb b/scripts/kill-bb
new file mode 100755
index 0000000..0875b2c
--- /dev/null
+++ b/scripts/kill-bb
@@ -0,0 +1,35 @@
+#!/usr/bin/env python3
+#
+# Kill bitbake processes if the process' cwd == cwd
+#
+# Copyright (c) 2019 Wind River Systems, Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import os
+import sys
+import re
+
+pids = [pid for pid in os.listdir('/proc') if pid.isdigit()]
+
+bb_pids = []
+cwd =os.getcwd()
+for pid in pids:
+    cmdline_path = os.path.join('/proc', pid, 'cmdline')
+    pid_cwd = os.path.join('/proc', pid, 'cwd')
+    if os.path.exists(cmdline_path) and os.path.exists(pid_cwd):
+        pid_cwd = os.readlink(pid_cwd)
+        with open(cmdline_path, 'r') as f:
+            cmdline = f.read()
+            # Kill the bitbake process if its cwd == cwd
+            if re.match('python3.*/bitbake/bin/bitbake', cmdline) and pid_cwd == cwd:
+                bb_pids.append(pid)
+
+if not bb_pids:
+    print('No bitbake processes found in current working dir')
+    sys.exit(0)
+
+for pid in bb_pids:
+    print('Killing %s' % pid)
+    os.kill(int(pid), 9)
-- 
2.7.4



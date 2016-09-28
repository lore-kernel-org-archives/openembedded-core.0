Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8E860797
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 10:06:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Sep 2016 03:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,409,1470726000"; d="scan'208";a="1057683057"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 28 Sep 2016 03:06:32 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id B9D076A4006;
	Wed, 28 Sep 2016 03:06:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 12:55:30 +0300
Message-Id: <1475056530-31095-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] scripts: add new script
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
X-List-Received-Date: Wed, 28 Sep 2016 10:06:33 -0000

Added 'native' convenience shell script to run native tools.
Example of usage:
  > bitbake bmap-tools-native
  > native bmaptool --version

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/native | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100755 scripts/native

diff --git a/scripts/native b/scripts/native
new file mode 100755
index 0000000..5e904b0
--- /dev/null
+++ b/scripts/native
@@ -0,0 +1,48 @@
+#!/bin/sh
+#
+# Copyright (c) 2016,  Intel Corporation.
+# All Rights Reserved
+#
+# This program is free software;  you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY;  without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+# the GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program;  if not, see <http://www.gnu.org/licenses/>
+#
+
+#
+# This script is for running tools from native oe sysroot
+#
+
+if [ $# -lt 1 -o "$1" == '--help' -o "$1" == '-h' ]; then
+    echo "Usage: $0 <native tool> [parameters]"
+    exit 1
+fi
+
+SYSROOT_SETUP_SCRIPT=`which oe-find-native-sysroot 2> /dev/null`
+if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
+        echo "Error: Unable to find oe-find-native-sysroot script"
+        exit 1
+fi
+. $SYSROOT_SETUP_SCRIPT
+
+OLDPATH=$PATH
+
+# look for a tool only in native sysroot
+PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin
+tool=`/usr/bin/which $1 2>/dev/null`
+
+if [ -n "$tool" ] ; then
+    # add old path to allow usage of host tools
+    PATH=$PATH:$OLD_PATH $@
+else
+    echo "Error: Unable to find '$1' in native sysroot"
+    exit 1
+fi
-- 
2.1.4



Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D233677C0F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 21:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490391690; x=1521927690;
	h=from:to:cc:subject:date:message-id;
	bh=Kpuxdc04ACtw2hdRSU+ozQeisd/QxdsZFXRRPLF9dXM=;
	b=ZltZGHx02HbpL7eW0lZrLqIm2XhtyDldto4NEmePEDnL6f0x3pKMI9uI
	qnzVh53LRkZlstDIK7YF7nMZcxXH9g==;
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 14:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,216,1486454400"; d="scan'208";a="80777763"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga006.fm.intel.com with ESMTP; 24 Mar 2017 14:41:28 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 21:41:12 -0700
Message-Id: <20170325044112.1458-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 2/2] scripts/contrib: scripts that updates kernel templates
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
X-List-Received-Date: Fri, 24 Mar 2017 21:41:29 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Updating the kernel templates (those use by the yocto-bsp script) is a mechanical
process (and prone to errors) which consists of copying latest kernel template then
applying string replacements from old to new kernel version. This script collects
these commands allowing quick updates in the future.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/contrib/yocto-bsp-kernel-update.sh | 60 ++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100755 scripts/contrib/yocto-bsp-kernel-update.sh

diff --git a/scripts/contrib/yocto-bsp-kernel-update.sh b/scripts/contrib/yocto-bsp-kernel-update.sh
new file mode 100755
index 0000000..b3aa705
--- /dev/null
+++ b/scripts/contrib/yocto-bsp-kernel-update.sh
@@ -0,0 +1,60 @@
+#!/bin/sh
+#
+# Copyright (c) 2017, Intel Corporation.
+# All rights reserved.
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
+# along with this program;  if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+#
+# Description: creates a new set of kernel templates based on version
+#
+
+set -o nounset
+set -o errexit
+
+if [ $# -ne 4 ]; then
+    cat << EOF
+usage: $0 from_mayor from_minor to_mayor to_minor
+EOF
+    exit 1
+else
+    fma=$1 # from mayor
+    fmi=$2 # from minor
+    tma=$3 # to mayor
+    tmi=$4 # to minor
+fi
+
+poky=$(readlink -e $(dirname $(dirname $(dirname $0))))
+arch=$poky/scripts/lib/bsp/substrate/target/arch
+
+
+# copy/rename templates
+for from in $(ls -1 $arch/*/recipes-kernel/linux/linux-yocto*_$fma\.$fmi.bbappend)
+do
+    to=$(echo $from | sed s/$fma\.$fmi/$tma\.$tmi/)
+    cp $from $to
+done
+
+# replace versions string inside new templates
+for bbappend in $(ls -1 $arch/*/recipes-kernel/linux/linux-yocto*_$tma\.$tmi.bbappend)
+do
+    sed -i 1s/$fma\.$fmi/$tma\.$tmi/ $bbappend
+    sed -i \$s/$fma\.$fmi/$tma\.$tmi/ $bbappend
+done
+
+# update the noinstall files
+for noinstall in $(ls -1 $arch/*/recipes-kernel/linux/kernel-list.noinstall)
+do
+    sed -i s/$fma\.$fmi/$tma\.$tmi/g $noinstall;
+done
-- 
2.10.2



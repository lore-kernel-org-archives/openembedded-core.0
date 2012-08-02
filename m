Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Swrnz-0002yQ-Qx
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:34:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2012 02:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129551548"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.75])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2012 02:23:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 10:23:06 +0100
Message-Id: <db2dd38ac0b16d55f729f63010e38dda4dcfced5.1343899228.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/9] scripts: add buildhistory-tag script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 09:34:56 -0000

This trivial script determines BUILDHISTORY_DIR using bitbake and then
passes the command line options to "git tag" on the buildhistory
repository. This is useful for setting a tag before making some changes;
even if the build takes a number of executions of bitbake (resulting in
multiple commits to the buildhistory repository) you can still do the
overall comparison easily.

Suggested by Ross Burton <ross.burton@intel.com>.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/buildhistory-tag |   42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100755 scripts/buildhistory-tag

diff --git a/scripts/buildhistory-tag b/scripts/buildhistory-tag
new file mode 100755
index 0000000..da90bcf
--- /dev/null
+++ b/scripts/buildhistory-tag
@@ -0,0 +1,42 @@
+#!/bin/sh
+
+# buildhistory-tag
+#
+# Copyright (C) 2012 Intel Corporation
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
+
+if [ -z $1 ] ; then
+    echo "Please specify at least the name of the tag to set"
+    exit 1
+fi
+
+BUILDHISTORY_DIR=`bitbake -e | grep '^BUILDHISTORY_DIR=' | sed -e 's/^[A-Z_]*=//' -e 's/"//g'`
+if [ -z "$BUILDHISTORY_DIR" ]; then
+    echo "Unable to determine BUILDHISTORY_DIR"
+    exit 1
+fi
+
+if [ ! -d "$BUILDHISTORY_DIR" ]; then
+    echo "BUILDHISTORY_DIR $BUILDHISTORY_DIR does not exist"
+    exit 1
+fi
+
+if [ ! -d "$BUILDHISTORY_DIR/.git" ]; then
+    echo "BUILDHISTORY_DIR $BUILDHISTORY_DIR exists but is not a git repository"
+    exit 1
+fi
+
+(cd $BUILDHISTORY_DIR; git tag $@)
-- 
1.7.9.5




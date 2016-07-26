Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EBFD9606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 09:54:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 26 Jul 2016 02:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,424,1464678000"; d="scan'208";a="1002639736"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2016 02:54:49 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 39F336A4006;
	Tue, 26 Jul 2016 02:54:38 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 12:18:14 +0300
Message-Id: <1469524694-17187-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] uncovered: list uncovered python modules
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
X-List-Received-Date: Tue, 26 Jul 2016 09:54:52 -0000

This bash script prints list of modules uncovered by oe-selftest
or any other test that produces coverage report.

It expects coverage report on its stdin and a directory to look
for python modules as a command line parameter, e.g.
    coverage report --rcfile=build/.coveragerc | ./scripts/contrib/uncovered bitbake/
should print list of uncovered python modules from bitbake/
directory tree to stdout.

[YOCTO #9809]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/contrib/uncovered | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100755 scripts/contrib/uncovered

diff --git a/scripts/contrib/uncovered b/scripts/contrib/uncovered
new file mode 100755
index 0000000..a8399ad
--- /dev/null
+++ b/scripts/contrib/uncovered
@@ -0,0 +1,39 @@
+#!/bin/bash -eur
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Find python modules uncovered by oe-seltest
+#
+# Copyright (c) 2016, Intel Corporation
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
+# Author: Ed Bartosh <ed.bartosh@linux.intel.com>
+#
+
+if [ ! "$#" -eq 1 -o -t 0 ] ; then
+    echo 'Usage: coverage report | ./scripts/contrib/uncovered <dir>' 1>&2
+    exit 1
+fi
+
+path=$(readlink -ev $1)
+
+if [ ! -d "$path" ] ; then
+    echo "directory $1 doesn't exist" 1>&2
+    exit 1
+fi
+
+diff -u <(grep "$path" | grep -v '0%$' | cut -f1 -d: | sort) \
+     <(find $path | xargs file | grep 'Python script' | cut -f1 -d:| sort) | \
+     grep "^+$path" | cut -c2-
-- 
2.1.4



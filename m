Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4F62F60249
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 04:11:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jan 2016 20:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,536,1444719600"; d="scan'208";a="886244318"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2016 20:11:22 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 20:07:35 +0000
Message-Id: <d8cf697662ab024acade21465d7014ef1cb6c674.1452191688.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1452191688.git.mariano.lopez@linux.intel.com>
References: <cover.1452191688.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1452191688.git.mariano.lopez@linux.intel.com>
References: <cover.1452191688.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/4] lib/oe/utils: Add function format_pkg_list()
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
X-List-Received-Date: Fri, 08 Jan 2016 04:11:21 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The class PkgsList returns a dictionary with all the installed
packages, because the data structure is a dictionary there is
needed to format the data in order to write to a file.

The function format_pkg_list returns a formated sting with all
packages installed. The output will depend on the requested format
when calling the function.

[YOCTO #7427]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oe/utils.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index cee087f..9a86410 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -208,6 +208,28 @@ def squashspaces(string):
     import re
     return re.sub("\s+", " ", string).strip()
 
+def format_pkg_list(pkg_dict, ret_format=None):
+    output = []
+
+    if ret_format == "arch":
+        for pkg in sorted(pkg_dict):
+            output.append("%s %s" % (pkg, pkg_dict[pkg]["arch"]))
+    elif ret_format == "file":
+        for pkg in sorted(pkg_dict):
+            output.append("%s %s %s" % (pkg, pkg_dict[pkg]["filename"], pkg_dict[pkg]["arch"]))
+    elif ret_format == "ver":
+        for pkg in sorted(pkg_dict):
+            output.append("%s %s %s" % (pkg, pkg_dict[pkg]["arch"], pkg_dict[pkg]["ver"]))
+    elif ret_format == "deps":
+        for pkg in sorted(pkg_dict):
+            for dep in pkg_dict[pkg]["deps"]:
+                output.append("%s|%s" % (pkg, dep))
+    else:
+        for pkg in sorted(pkg_dict):
+            output.append(pkg)
+
+    return '\n'.join(output)
+
 #
 # Python 2.7 doesn't have threaded pools (just multiprocessing)
 # so implement a version here
-- 
1.8.4.5



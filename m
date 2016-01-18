Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 730DB7316B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 22:37:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 18 Jan 2016 14:37:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,314,1449561600"; d="scan'208";a="863308240"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga001.jf.intel.com with ESMTP; 18 Jan 2016 14:37:05 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 14:33:05 +0000
Message-Id: <d62f041066d2e7672eba9ec2dfcec3b9faa88837.1453127396.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1453127396.git.mariano.lopez@linux.intel.com>
References: <cover.1453127396.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1453127396.git.mariano.lopez@linux.intel.com>
References: <cover.1453127396.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv3 2/4] lib/oe/utils: Add function format_pkg_list()
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
X-List-Received-Date: Mon, 18 Jan 2016 22:37:04 -0000

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



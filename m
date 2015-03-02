Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5A11B73820
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 18:55:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Mar 2015 10:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,676,1418112000"; d="scan'208";a="692853704"
Received: from localhost.jf.intel.com ([10.7.201.37])
	by orsmga002.jf.intel.com with ESMTP; 02 Mar 2015 10:55:41 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2015 10:55:37 -0800
Message-Id: <1425322538-40169-2-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1425322538-40169-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1425322538-40169-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH 1/2] base.bbclass: Add LIC_FILES_CHKSUM files to checksum files.
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
X-List-Received-Date: Mon, 02 Mar 2015 18:55:43 -0000

Previously, files with absolute paths in LIC_FILES_CHKSUM such as
"file://${COMMON_LICENSE_DIR}/foo" would not result in a qa failure
when the license file changed.

To fix this problem, add any files with absolute paths from
LIC_FILES_CHKSUM to the file-checksums varflag, so that changes in the
license file are detected and cause the qa task for licenses to run.

[Yocto #6450]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/base.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 789af3b..2c2d019 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -94,9 +94,26 @@ def extra_path_elements(d):
 
 PATH_prepend = "${@extra_path_elements(d)}"
 
+def get_lic_checksum_file_list(d):
+    filelist = []
+    lic_files = d.getVar("LIC_FILES_CHKSUM", True) or ''
+
+    urls = lic_files.split()
+    for url in urls:
+        # We only care about items that are absolute paths since
+        # any others should be covered by SRC_URI.
+        try:
+            path = bb.fetch.decodeurl(url)[2]
+            if path[0] == '/':
+                filelist.append(path + ":" + str(os.path.exists(path)))
+        except bb.fetch.MalformedUrl:
+            raise bb.build.FuncFailed(d.getVar('PN', True) + ": LIC_FILES_CHKSUM contains an invalid URL: " + url)
+    return " ".join(filelist)
+
 addtask fetch
 do_fetch[dirs] = "${DL_DIR}"
 do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
+do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
 do_fetch[vardeps] += "SRCREV"
 python base_do_fetch() {
 
-- 
1.9.3



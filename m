Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1764577E96
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 17:13:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 02 Jun 2017 10:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,286,1493708400"; d="scan'208";a="863983332"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Jun 2017 10:13:10 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 10:13:00 -0700
Message-Id: <40e0a15df8d22a499943e2b005ffe02f63ed216c.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<cover.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 2/3] ftools: new function to replace strings inside a text file
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
X-List-Received-Date: Fri, 02 Jun 2017 17:13:09 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/utils/ftools.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
index a7233d4ca6..8bf2547d68 100644
--- a/meta/lib/oeqa/utils/ftools.py
+++ b/meta/lib/oeqa/utils/ftools.py
@@ -44,3 +44,25 @@ def remove_from_file(path, data):
         except ValueError:
             pass
     write_file(path, "\n".join(contents))
+
+def replace_from_file(path, old, new):
+    # In case old is None, return immediately
+    if old is None:
+        return
+    try:
+        rdata = read_file(path)
+    except IOError as e:
+        # if file does not exit, just quit, otherwise raise an exception
+        if e.errno == errno.ENOENT:
+            return
+        else:
+            raise
+
+    old_contents = rdata.splitlines()
+    new_contents = []
+    for old_content in old_contents:
+        try:
+            new_contents.append(old_content.replace(old, new))
+        except ValueError:
+            pass
+    write_file(path, "\n".join(new_contents))
-- 
2.12.0



Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 04FF778203
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 16:41:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jun 2017 09:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,281,1496127600"; d="scan'208";a="873115058"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Jun 2017 09:41:09 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 09:40:50 -0700
Message-Id: <d21c8d05ad65036bbe16ef74b96fb647b2c71444.1498754105.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1498754105.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<cover.1498754105.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v4 2/4] devtool: function to replace strings inside a text file
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
X-List-Received-Date: Thu, 29 Jun 2017 16:41:11 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 29c4c05071..7f4f817a8e 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -292,3 +292,40 @@ def ensure_npm(config, basepath, fixed_setup=False, check_exists=True):
                 raise DevtoolError(msg)
             else:
                 raise
+
+def replace_from_file(path, old, new):
+    """Replace strings on a file"""
+
+    def read_file(path):
+        data = None
+        with open(path) as f:
+            data = f.read()
+        return data
+
+    def write_file(path, data):
+        if data is None:
+            return
+        wdata = data.rstrip() + "\n"
+        with open(path, "w") as f:
+            f.write(wdata)
+
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



Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6A7107804E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 18:30:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 11:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="1143169559"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga001.jf.intel.com with ESMTP; 20 Jun 2017 11:30:07 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 11:30:04 -0700
Message-Id: <d9c6db7d7969ec9d8437fc795b5f0b912efbc2f8.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<cover.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v3 2/3] devtool: function to replace strings inside a text file
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
X-List-Received-Date: Tue, 20 Jun 2017 18:30:12 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index d646b0cf63..95307e63fa 100644
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



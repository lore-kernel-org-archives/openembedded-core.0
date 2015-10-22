Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id DA7C277153
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 42534600F80
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:55 +0100
Message-Id: <1136f9e02d9cbe2c2cda189321d72b763649ba42.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 34/52] oeqa/utils/ftools: Ignore the exception if file does not exist
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:26 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There may be cases where the configuration file (path) does not exist,
thus the remove_from_file should catch this exception. In case the exception
is not the latter (errno.ENOENT), then re-raise it.

[YOCTO #8540]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/ftools.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
index 64ebe3d..1ec8a09 100644
--- a/meta/lib/oeqa/utils/ftools.py
+++ b/meta/lib/oeqa/utils/ftools.py
@@ -1,5 +1,6 @@
 import os
 import re
+import errno
 
 def write_file(path, data):
     wdata = data.rstrip() + "\n"
@@ -18,7 +19,15 @@ def read_file(path):
     return data
 
 def remove_from_file(path, data):
-    lines = read_file(path).splitlines()
+    try:
+        rdata = read_file(path)
+    except IOError as e:
+        # if file does not exit, just quit, otherwise raise an exception
+        if e.errno == errno.ENOENT:
+            return
+        else:
+            raise
+    lines = rdata.splitlines()
     rmdata = data.strip().splitlines()
     for l in rmdata:
         for c in range(0, lines.count(l)):
-- 
2.1.4



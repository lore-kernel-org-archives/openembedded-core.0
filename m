Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D6EA1796D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 08:16:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8C8Goj5007459
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 01:16:50 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 12 Sep 2018 01:16:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Sep 2018 16:27:45 +0800
Message-ID: <045d8e01516bc793c571107c2766d033af758941.1536740787.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1536740787.git.liezhi.yang@windriver.com>
References: <cover.1536740787.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dump_cache.py: Move it from bitbake
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
X-List-Received-Date: Wed, 12 Sep 2018 08:16:49 -0000
Content-Type: text/plain

Add it to oe-core can make it's easier to use, e.g., we don't need use
/path/to/bitbake/contrib/dump_cache.py to run it, just use dump_cache.py after
the build is initialized.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/dump_cache.py | 95 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100755 scripts/dump_cache.py

diff --git a/scripts/dump_cache.py b/scripts/dump_cache.py
new file mode 100755
index 0000000..3aaa780
--- /dev/null
+++ b/scripts/dump_cache.py
@@ -0,0 +1,95 @@
+#!/usr/bin/env python3
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (C) 2012, 2018 Wind River Systems, Inc.
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
+
+#
+# Used for dumping the bb_cache.dat
+#
+import os
+import sys
+import argparse
+
+# External modules
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + '/lib'
+sys.path.insert(0, lib_path)
+
+import scriptpath
+# Figure out where is the bitbake/lib/bb since we need bb.siggen and bb.process
+bitbakepath = scriptpath.add_bitbake_lib_path()
+if not bitbakepath:
+    sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
+    sys.exit(1)
+
+from bb.cache import CoreRecipeInfo
+
+import pickle
+
+class DumpCache(object):
+    def __init__(self):
+        parser = argparse.ArgumentParser(
+            description="bb_cache.dat's dumper",
+            epilog="Use %(prog)s --help to get help")
+        parser.add_argument("-r", "--recipe",
+            help="specify the recipe, default: all recipes", action="store")
+        parser.add_argument("-m", "--members",
+            help = "specify the member, use comma as separator for multiple ones, default: all members", action="store", default="")
+        parser.add_argument("-s", "--skip",
+            help = "skip skipped recipes", action="store_true")
+        parser.add_argument("cachefile",
+            help = "specify bb_cache.dat", nargs = 1, action="store", default="")
+
+        self.args = parser.parse_args()
+
+    def main(self):
+        with open(self.args.cachefile[0], "rb") as cachefile:
+            pickled = pickle.Unpickler(cachefile)
+            while True:
+                try:
+                    key = pickled.load()
+                    val = pickled.load()
+                except Exception:
+                    break
+                if isinstance(val, CoreRecipeInfo):
+                    pn = val.pn
+
+                    if self.args.recipe and self.args.recipe != pn:
+                        continue
+
+                    if self.args.skip and val.skipped:
+                        continue
+
+                    if self.args.members:
+                        out = key
+                        for member in self.args.members.split(','):
+                            out += ": %s" % val.__dict__.get(member)
+                        print("%s" % out)
+                    else:
+                        print("%s: %s" % (key, val.__dict__))
+                elif not self.args.recipe:
+                    print("%s %s" % (key, val))
+
+if __name__ == "__main__":
+    try:
+        dump = DumpCache()
+        ret = dump.main()
+    except Exception as esc:
+        ret = 1
+        import traceback
+        traceback.print_exc()
+    sys.exit(ret)
-- 
2.7.4



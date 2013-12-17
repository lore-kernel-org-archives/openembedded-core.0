Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4384660CDD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 14:56:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 17 Dec 2013 06:56:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,501,1384329600"; d="scan'208";a="445686093"
Received: from paulonei-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.28])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2013 06:56:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2013 14:56:21 +0000
Message-Id: <c98716e9ead1e1273ed03a9bc812d792ea38dc5b.1387292119.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1387292119.git.paul.eggleton@linux.intel.com>
References: <cover.1387292119.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1387292119.git.paul.eggleton@linux.intel.com>
References: <cover.1387292119.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] scripts/contrib: Add graph-tool
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
X-List-Received-Date: Tue, 17 Dec 2013 14:56:43 -0000

A simple script I put together for getting the paths from one node to
another in a dot graph. This is useful for example in working out why
a particular recipe is getting built in conjunction with dot graph files
produced by bitbake -g.

For example:

$ bitbake -g core-image-minimal
...
$ graph-tool find-paths pn-depends.dot core-image-minimal sqlite3-native
core-image-minimal -> packagegroup-core-boot -> udev -> libxslt-native -> libxml2-native -> python-native -> sqlite3-native

Partially addresses [YOCTO #3362].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/graph-tool | 92 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100755 scripts/contrib/graph-tool

diff --git a/scripts/contrib/graph-tool b/scripts/contrib/graph-tool
new file mode 100755
index 0000000..6dc7d33
--- /dev/null
+++ b/scripts/contrib/graph-tool
@@ -0,0 +1,92 @@
+#!/usr/bin/env python
+
+# Simple graph query utility
+# useful for getting answers from .dot files produced by bitbake -g
+#
+# Written by: Paul Eggleton <paul.eggleton@linux.intel.com>
+#
+# Copyright 2013 Intel Corporation
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
+import sys
+
+def get_path_networkx(dotfile, fromnode, tonode):
+    try:
+        import networkx
+    except ImportError:
+        print('ERROR: Please install the networkx python module')
+        sys.exit(1)
+
+    graph = networkx.DiGraph(networkx.read_dot(dotfile))
+
+    def node_missing(node):
+        import difflib
+        close_matches = difflib.get_close_matches(node, graph.nodes(), cutoff=0.7)
+        if close_matches:
+            print('ERROR: no node "%s" in graph. Close matches:\n  %s' % (node, '\n  '.join(close_matches)))
+        sys.exit(1)
+
+    if not fromnode in graph:
+        node_missing(fromnode)
+    if not tonode in graph:
+        node_missing(tonode)
+    return networkx.all_simple_paths(graph, source=fromnode, target=tonode)
+
+
+def find_paths(args, usage):
+    if len(args) < 3:
+        usage()
+        sys.exit(1)
+
+    fromnode = args[1]
+    tonode = args[2]
+    paths = list(get_path_networkx(args[0], fromnode, tonode))
+    if paths:
+        for path in paths:
+            print ' -> '.join(path)
+    else:
+        print("ERROR: no path from %s to %s in graph" % (fromnode, tonode))
+        sys.exit(1)
+
+def main():
+    import optparse
+    parser = optparse.OptionParser(
+        usage = '''%prog [options] <command> <arguments>
+
+Available commands:
+    find-paths <dotfile> <from> <to>
+        Find all of the paths between two nodes in a dot graph''')
+
+    #parser.add_option("-d", "--debug",
+    #        help = "Report all SRCREV values, not just ones where AUTOREV has been used",
+    #        action="store_true", dest="debug", default=False)
+
+    options, args = parser.parse_args(sys.argv)
+    args = args[1:]
+
+    if len(args) < 1:
+        parser.print_help()
+        sys.exit(1)
+
+    if args[0] == "find-paths":
+        find_paths(args[1:], parser.print_help)
+    else:
+        parser.print_help()
+        sys.exit(1)
+
+
+if __name__ == "__main__":
+    main()
-- 
1.8.1.2



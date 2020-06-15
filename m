Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.10779.1592196524929257352
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2020 21:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=U4NSWzqF;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 5B07F20B4780; Sun, 14 Jun 2020 21:48:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5B07F20B4780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1592196524;
	bh=RUz/XCtPm8oxUVpmWhw4h+l6w4qJUw3ph05trv4z71U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U4NSWzqFDP+DvcMYeco9BG1JhmCnPpMn/trJZEAzylbzMuK1VFVwmvQ1Vrz8bLHS6
	 4L3izlPOlILM/oWKxbybaP1/lZgJ2vLE1OTT1BOHGThFIQQ7HDzTXr6X/w64wlMzJy
	 z/RxGFDIlDMgZbwQ0fGpObU0hk1KP9vkQm4R7QzA=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] graph-tool: switch to argparse
Date: Sun, 14 Jun 2020 21:48:42 -0700
Message-Id: <2b232223d74446b841f8348e206dfee52925070d.1592196326.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1592196326.git.paul.eggleton@linux.microsoft.com>
References: <cover.1592196326.git.paul.eggleton@linux.microsoft.com>

argparse makes this a lot easier to extend.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.microsoft.com>
---
 scripts/contrib/graph-tool | 59 +++++++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 32 deletions(-)

diff --git a/scripts/contrib/graph-tool b/scripts/contrib/graph-tool
index 6d2e68b..9402e61 100755
--- a/scripts/contrib/graph-tool
+++ b/scripts/contrib/graph-tool
@@ -11,6 +11,13 @@
 #
 
 import sys
+import os
+import argparse
+
+scripts_lib_path = os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)), '..', 'lib'))
+sys.path.insert(0, scripts_lib_path)
+import argparse_oe
+
 
 def get_path_networkx(dotfile, fromnode, tonode):
     try:
@@ -34,47 +41,35 @@ def get_path_networkx(dotfile, fromnode, tonode):
     return networkx.all_simple_paths(graph, source=fromnode, target=tonode)
 
 
-def find_paths(args, usage):
-    if len(args) < 3:
-        usage()
-        sys.exit(1)
-
-    fromnode = args[1]
-    tonode = args[2]
-
+def find_paths(args):
     path = None
-    for path in get_path_networkx(args[0], fromnode, tonode):
+    for path in get_path_networkx(args.dotfile, args.fromnode, args.tonode):
         print(" -> ".join(map(str, path)))
     if not path:
-        print("ERROR: no path from %s to %s in graph" % (fromnode, tonode))
-        sys.exit(1)
+        print("ERROR: no path from %s to %s in graph" % (args.fromnode, args.tonode))
+        return 1
+
 
 def main():
-    import optparse
-    parser = optparse.OptionParser(
-        usage = '''%prog [options] <command> <arguments>
+    parser = argparse_oe.ArgumentParser(description='Small utility for working with .dot graph files')
 
-Available commands:
-    find-paths <dotfile> <from> <to>
-        Find all of the paths between two nodes in a dot graph''')
+    subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
+    subparsers.required = True
 
-    #parser.add_option("-d", "--debug",
-    #        help = "Report all SRCREV values, not just ones where AUTOREV has been used",
-    #        action="store_true", dest="debug", default=False)
+    parser_find_paths = subparsers.add_parser('find-paths',
+                                              help='Find all of the paths between two nodes in a dot graph',
+                                              description='Finds all of the paths between two nodes in a dot graph')
+    parser_find_paths.add_argument('dotfile', help='.dot graph to search in')
+    parser_find_paths.add_argument('fromnode', help='starting node name')
+    parser_find_paths.add_argument('tonode', help='ending node name')
+    parser_find_paths.set_defaults(func=find_paths)
 
-    options, args = parser.parse_args(sys.argv)
-    args = args[1:]
+    args = parser.parse_args()
 
-    if len(args) < 1:
-        parser.print_help()
-        sys.exit(1)
-
-    if args[0] == "find-paths":
-        find_paths(args[1:], parser.print_help)
-    else:
-        parser.print_help()
-        sys.exit(1)
+    ret = args.func(args)
+    return ret
 
 
 if __name__ == "__main__":
-    main()
+    ret = main()
+    sys.exit(ret)
-- 
1.8.3.1


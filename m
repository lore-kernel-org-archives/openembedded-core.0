Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.10916.1592196525005133368
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2020 21:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=l/SqLeyy;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 6777C20B4781; Sun, 14 Jun 2020 21:48:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6777C20B4781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1592196524;
	bh=Cp8Si51W3zuICH5OpFvyknSEX0WBgtn/Z8WOR3IhFaA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l/SqLeyyJrchBevqAVWuYZM4RNXRkhh9pfEohSM06vnGwV5zzpbhijIsWtgooym6l
	 1apgv4kGRmpGpmJkas+WMlWu180SGFWX9MUA7JGWTBi71D/liVsp3YPYhGFLskfsHJ
	 1CkNzK7VZb1Lf0haAGZinMuNTxQJzQb6skdz7d0A=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] graph-tool: add filter subcommand
Date: Sun, 14 Jun 2020 21:48:43 -0700
Message-Id: <87def31b34928cdbef9ab1d37e460f0ac1745435.1592196326.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1592196326.git.paul.eggleton@linux.microsoft.com>
References: <cover.1592196326.git.paul.eggleton@linux.microsoft.com>

Add a filter subcommand to filter a task-depends.dot graph produced by
bitbake -g down to just a subset of targets/tasks.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.microsoft.com>
---
 scripts/contrib/graph-tool | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/scripts/contrib/graph-tool b/scripts/contrib/graph-tool
index 9402e61..2648893 100755
--- a/scripts/contrib/graph-tool
+++ b/scripts/contrib/graph-tool
@@ -50,6 +50,40 @@ def find_paths(args):
         return 1
 
 
+def filter_graph(args):
+    import fnmatch
+
+    exclude_tasks = []
+    if args.exclude_tasks:
+        for task in args.exclude_tasks.split(','):
+            if not task.startswith('do_'):
+                task = 'do_%s' % task
+            exclude_tasks.append(task)
+
+    def checkref(strval):
+        strval = strval.strip().strip('"')
+        target, taskname = strval.rsplit('.', 1)
+        if exclude_tasks:
+            for extask in exclude_tasks:
+                if fnmatch.fnmatch(taskname, extask):
+                    return False
+        if strval in args.ref or target in args.ref:
+            return True
+        return False
+
+    with open(args.infile, 'r') as f:
+        for line in f:
+            line = line.rstrip()
+            if line.startswith(('digraph', '}')):
+                print(line)
+            elif '->' in line:
+                linesplit = line.split('->')
+                if checkref(linesplit[0]) and checkref(linesplit[1]):
+                    print(line)
+            elif (not args.no_nodes) and checkref(line.split()[0]):
+                print(line)
+
+
 def main():
     parser = argparse_oe.ArgumentParser(description='Small utility for working with .dot graph files')
 
@@ -64,6 +98,15 @@ def main():
     parser_find_paths.add_argument('tonode', help='ending node name')
     parser_find_paths.set_defaults(func=find_paths)
 
+    parser_filter = subparsers.add_parser('filter',
+                                           help='Pare down a task graph to contain only the specified references',
+                                           description='Pares down a task-depends.dot graph produced by bitbake -g to contain only the specified references')
+    parser_filter.add_argument('infile', help='Input file')
+    parser_filter.add_argument('ref', nargs='+', help='Reference to include (either recipe/target name or full target.taskname specification)')
+    parser_filter.add_argument('-n', '--no-nodes', action='store_true', help='Skip node formatting lines')
+    parser_filter.add_argument('-x', '--exclude-tasks', help='Comma-separated list of tasks to exclude (do_ prefix optional, wildcards allowed)')
+    parser_filter.set_defaults(func=filter_graph)
+
     args = parser.parse_args()
 
     ret = args.func(args)
-- 
1.8.3.1


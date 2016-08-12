Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id F04C7760B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 16:23:26 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id o80so44368263wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=MuYvWx4wrg/PmtXMVETHPjkI9qM0Z1cKZtk7JAqR24Q=;
	b=Sv70COM1Iff9LyzBDgA5R6Hni3iDQ4cP5RMDXqMdVNy5cDYOcUARCqRPjenNK+uJ/z
	i70EH41pq62iWw5avsJjAZ1RZ7fZHU9RSXKuo2R7SL0mn1azgt2H9myhq0lhLkbXcciy
	9kZNXsfrinkgLZrK1tB3vIJ4aMSaeDmYUbXRShDj2HLM8zNJaZSew7uh1QgZzko4fZGu
	xJKxGKGHCg9V3xYc90vZg8EuegV7wjrszaR8ymwpbDP1ZDvaJUuFdSK4fgW6oP6KwmvM
	E1bIgDKJ7SouRDQJ2EXUb/b/75H61t9ilZolnzFrzJUpzeXNMvAcjxgCH/2VNMKPUoni
	R7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MuYvWx4wrg/PmtXMVETHPjkI9qM0Z1cKZtk7JAqR24Q=;
	b=EsvQcFwvW55gLJnnE9NcuVAYPNeRHVsJOt2NRFGWjZIWMK7Ls+wle3BEaUtXDMKICX
	Uvaa3jMV4ErCvqzslUba4hbAh4pr5jkNQwJxcg1GYKn8C/E/K6TFujZQ8ouMMb+OP6BC
	BYg+0+9fo4mgFQ55kU5NZP5DNf9tCvb6uVFHEUr1oCpowcXfxHA8sr4n8YfL1YojsHVb
	Nwo1SPMZfttxhGki8mv+mVv50rb/pBSASPOMddXw2yYH8GyTtr4N405Anw4nkcSOvg/Z
	y4g4wC5q5zDdaD1k1+F1BFwSSFJ4cSdoK2Vo3ylWn4y33gLwAHHa3t6t0X88jHXOGrwA
	UTPw==
X-Gm-Message-State: AEkoouu2Z7Tcrv6kumlPgnIv03euF9mzCDL+dYqcMyqFjFdHwH2Gplqp+1diYj8aGJS1vrAb
X-Received: by 10.194.110.102 with SMTP id hz6mr16237204wjb.5.1471019006607;
	Fri, 12 Aug 2016 09:23:26 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	gg10sm8215523wjd.4.2016.08.12.09.23.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Aug 2016 09:23:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 17:23:23 +0100
Message-Id: <1471019003-10719-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] graph-tool: update to new networkx API, be iterative
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
X-List-Received-Date: Fri, 12 Aug 2016 16:23:27 -0000

Update the dot parser to the new networkx API (using pydotplus to parse).

Also, switch the path display to output the paths as they are found instead of
collecting them into a list, so output appears sooner.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/contrib/graph-tool | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/scripts/contrib/graph-tool b/scripts/contrib/graph-tool
index 0275fbd..1df5b8c 100755
--- a/scripts/contrib/graph-tool
+++ b/scripts/contrib/graph-tool
@@ -30,8 +30,7 @@ def get_path_networkx(dotfile, fromnode, tonode):
         print('ERROR: Please install the networkx python module')
         sys.exit(1)
 
-    graph = networkx.DiGraph(networkx.read_dot(dotfile))
-
+    graph = networkx.DiGraph(networkx.nx_pydot.read_dot(dotfile))
     def node_missing(node):
         import difflib
         close_matches = difflib.get_close_matches(node, graph.nodes(), cutoff=0.7)
@@ -53,11 +52,11 @@ def find_paths(args, usage):
 
     fromnode = args[1]
     tonode = args[2]
-    paths = list(get_path_networkx(args[0], fromnode, tonode))
-    if paths:
-        for path in paths:
-            print(" -> ".join(map(str,path)))
-    else:
+
+    path = None
+    for path in get_path_networkx(args[0], fromnode, tonode):
+        print(" -> ".join(map(str, path)))
+    if not path:
         print("ERROR: no path from %s to %s in graph" % (fromnode, tonode))
         sys.exit(1)
 
-- 
2.8.1



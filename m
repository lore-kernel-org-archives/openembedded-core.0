Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id E5F2E6CE09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 15:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 7699E19E51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:23:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id voonfMTPY8RH
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:23:43 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 175671A047
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id F2B76A98
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:37 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id E72A39AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:37 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id E5CF63404E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:37 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s0LFMb6u015062
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:37 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s0LFMbdG015061
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jan 2014 16:22:37 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 16:22:31 +0100
Message-Id: <3bcb4f7daeca002c33d9f762e4813dcc076c0fc5.1390317718.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1390317718.git.pkj@axis.com>
References: <cover.1390317718.git.pkj@axis.com>
In-Reply-To: <cover.1390317718.git.pkj@axis.com>
References: <cover.1390317718.git.pkj@axis.com>
Subject: [PATCH 1/5] pybootchartgui: Make the -s option work again
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
X-List-Received-Date: Tue, 21 Jan 2014 15:23:45 -0000

[YOCTO #5588]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/pybootchartgui/parsing.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index daee593..0600b51 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -50,9 +50,10 @@ class Trace:
         self.parent_map = None
         self.mem_stats = None
 
-        parse_paths (writer, self, paths)
-        if not self.valid():
-            raise ParseError("empty state: '%s' does not contain a valid bootchart" % ", ".join(paths))
+        if len(paths):
+            parse_paths (writer, self, paths)
+            if not self.valid():
+                raise ParseError("empty state: '%s' does not contain a valid bootchart" % ", ".join(paths))
 
         return
 
@@ -713,7 +714,7 @@ def split_res(res, n):
         start = 0
         end = frag_size
         while start < end:
-            state = ParserState()
+            state = Trace(None, [], None)
             for i in range(start, end):
                 # Add these lines for reference
                 #state.processes[pn + ":" + task] = [start, end]
-- 
1.8.4



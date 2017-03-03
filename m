Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C796F77641
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 00:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v230JHBg003831; Fri, 3 Mar 2017 00:19:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2g01R7jy4Z76; Fri,  3 Mar 2017 00:19:17 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v230JEaw003828
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Mar 2017 00:19:15 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cjawE-00040t-IV; Fri, 03 Mar 2017 00:19:14 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 00:19:11 +0000
Message-Id: <1488500351-15388-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] sanity: Allow whitespace only mirror entries
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
X-List-Received-Date: Fri, 03 Mar 2017 00:19:18 -0000

Forcing the use of "\n" in mirror variables is pointless, we can just require that
there are pairs of values. With the bitbake restriction relaxed, we can relax
the sanity check too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 8935df8..1fe172f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -876,18 +876,16 @@ def check_sanity_everybuild(status, d):
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
                  'bzr', 'cvs', 'npm', 'sftp', 'ssh']
     for mirror_var in mirror_vars:
-        mirrors = (d.getVar(mirror_var) or '').replace('\\n', '\n').split('\n')
-        for mirror_entry in mirrors:
-            mirror_entry = mirror_entry.strip()
-            if not mirror_entry:
-                # ignore blank lines
-                continue
+        mirrors = (d.getVar(mirror_var) or '').replace('\\n', ' ').split()
 
-            try:
-                pattern, mirror = mirror_entry.split()
-            except ValueError:
-                bb.warn('Invalid %s: %s, should be 2 members.' % (mirror_var, mirror_entry.strip()))
-                continue
+        # Split into pairs
+        if len(mirrors) % 2 != 0:
+            bb.warn('Invalid mirror variable value for %s: %s, should contain paired members.' % (mirror_var, mirrors.strip()))
+            continue
+        mirrors = list(zip(*[iter(mirrors)]*2))
+
+        for mirror_entry in mirrors:
+            pattern, mirror = mirror_entry
 
             decoded = bb.fetch2.decodeurl(pattern)
             try:
-- 
2.7.4



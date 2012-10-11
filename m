Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TMGmt-0004Mb-KN for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 13:18:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9BB5bW2005803
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 12:05:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04829-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 12:05:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9BB5TjV005797
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 12:05:31 +0100
Message-ID: <1349953535.14368.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Oct 2012 12:05:35 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] scipts/combo-layer: Fix check_rev_branch() for cases where the revision is on more than one branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2012 11:18:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If a revision is in more than one branch, the check_rev_branch() function can't
cope with it and the tool returns incorrect errror messages. This patch
ensures it copes with this situation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/combo-layer b/scripts/combo-layer
index 3baea24..ae97471 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -283,19 +283,23 @@ def drop_to_shell(workdir=None):
 
 def check_rev_branch(component, repodir, rev, branch):
     try:
-        actualbranch = runcmd("git branch --contains %s" % rev, repodir, printerr=False).rstrip()
+        actualbranch = runcmd("git branch --contains %s" % rev, repodir, printerr=False)
     except subprocess.CalledProcessError as e:
         if e.returncode == 129:
             actualbranch = ""
         else:
             raise
 
-    if ' ' in actualbranch:
-        actualbranch = actualbranch.split(' ')[-1]
     if not actualbranch:
         logger.error("%s: specified revision %s is invalid!" % (component, rev))
         return False
-    elif actualbranch != branch:
+
+    branches = []
+    branchlist = actualbranch.split("\n")
+    for b in branchlist:
+        branches.append(b.strip().split(' ')[-1])
+
+    if branch not in branches:
         logger.error("%s: specified revision %s is not on specified branch %s!" % (component, rev, branch))
         return False
     return True





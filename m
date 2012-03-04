Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S434E-00055K-HO for openembedded-core@lists.openembedded.org;
	Sun, 04 Mar 2012 05:29:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q244KY0G020385
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Mar 2012 04:20:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20135-05 for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2012 04:20:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q244KOh3020379
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Mar 2012 04:20:26 GMT
Message-ID: <1330834827.3949.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 03 Mar 2012 20:20:27 -0800
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Remove unecessary bb.data.expand()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Mar 2012 04:29:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b1cdf0f..e4338e0 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -68,13 +68,13 @@ def sstate_state_fromvars(d, task = None):
             bb.fatal("sstate code running without task context?!")
         task = task.replace("_setscene", "")
 
-    name = bb.data.expand(d.getVarFlag("do_" + task, 'sstate-name'), d)
-    inputs = (bb.data.expand(d.getVarFlag("do_" + task, 'sstate-inputdirs') or "", d)).split()
-    outputs = (bb.data.expand(d.getVarFlag("do_" + task, 'sstate-outputdirs') or "", d)).split()
-    plaindirs = (bb.data.expand(d.getVarFlag("do_" + task, 'sstate-plaindirs') or "", d)).split()
-    lockfiles = (bb.data.expand(d.getVarFlag("do_" + task, 'sstate-lockfile') or "", d)).split()
-    lockfilesshared = (bb.data.expand(d.getVarFlag("do_" + task, 'sstate-lockfile-shared') or "", d)).split()
-    interceptfuncs = (bb.data.expand(d.getVarFlag("do_" + task, 'sstate-interceptfuncs') or "", d)).split()
+    name = d.getVarFlag("do_" + task, 'sstate-name', True)
+    inputs = (d.getVarFlag("do_" + task, 'sstate-inputdirs', True) or "").split()
+    outputs = (d.getVarFlag("do_" + task, 'sstate-outputdirs', True) or "").split()
+    plaindirs = (d.getVarFlag("do_" + task, 'sstate-plaindirs', True) or "").split()
+    lockfiles = (d.getVarFlag("do_" + task, 'sstate-lockfile', True) or "").split()
+    lockfilesshared = (d.getVarFlag("do_" + task, 'sstate-lockfile-shared', True) or "").split()
+    interceptfuncs = (d.getVarFlag("do_" + task, 'sstate-interceptfuncs', True) or "").split()
     if not name or len(inputs) != len(outputs):
         bb.fatal("sstate variables not setup correctly?!")
 





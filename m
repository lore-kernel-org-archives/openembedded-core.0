Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBotC-0006CS-EK for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 16:25:34 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96EQTlj012047 for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 15:26:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id efYzjPJL8IVw
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2011 15:26:29 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96EQPQv012041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 15:26:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Oct 2011 15:19:48 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317910796.6398.86.camel@ted>
Mime-Version: 1.0
Subject: sstate.bbclass: Ensure machine specific stamps are only wiped for the current task
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
X-List-Received-Date: Thu, 06 Oct 2011 14:25:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

sstate was being a little too ethusiastic about removing stamp files and
was removing stamp files for other machines when it shouldn't have been.

This patch teaches sstate about machine specific stamp extensions and
allows it to only remove the current task's stampfiles.

Based on a patch from Phil Blundell <philb@gnu.org> with some tweaks
from me.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index eee04ab..6abf55b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -259,10 +259,15 @@ def sstate_clean(ss, d):
             bb.utils.unlockfile(lock)
 
     stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
+    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info')
     oe.path.remove(stfile)
     oe.path.remove(stfile + "_setscene")
-    oe.path.remove(stfile + ".*")
-    oe.path.remove(stfile + "_setscene" + ".*")
+    if extrainf:
+        oe.path.remove(stfile + ".*" + extrainf)
+        oe.path.remove(stfile + "_setscene" + ".*" + extrainf)
+    else:
+        oe.path.remove(stfile + ".*")
+        oe.path.remove(stfile + "_setscene" + ".*")
 
 CLEANFUNCS += "sstate_cleanall"
 





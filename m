Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RSVpm-0006lF-EZ for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 16:31:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pALFOWAD008152
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 15:24:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07091-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 15:24:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pALFOMWV008146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 15:24:24 GMT
Message-ID: <1321889068.18926.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Nov 2011 15:24:28 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate.bbclass: Ensure we expand stamp-extra-info
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
X-List-Received-Date: Mon, 21 Nov 2011 15:31:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this change we can end up looking for <stamp>.${MACHINE}
instead of the expected expanded value.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a777c79..951caa3 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -259,7 +259,7 @@ def sstate_clean(ss, d):
             bb.utils.unlockfile(lock)
 
     stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
-    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info')
+    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
     oe.path.remove(stfile)
     oe.path.remove(stfile + "_setscene")
     if extrainf:





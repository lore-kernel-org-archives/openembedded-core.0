Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGqFu-000558-1N for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 13:58:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QBjPdK018693
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 12:45:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15900-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 12:45:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QBjGW2018687
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 12:45:17 +0100
Message-ID: <1348659917.8662.97.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 12:45:17 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: sstate: Fix SSTATE_DUPWHITELIST variable usage
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
X-List-Received-Date: Wed, 26 Sep 2012 11:58:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We need to split this variable before using it. Otherwise a single "/"
character in the list whitelists every overlapping sysroot file which
was not the intention making the whole thing useless.

We'll start seeing warnings about overlapping files now this is working
correctly after this patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6ccaf6d..0037ce5 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -144,7 +144,7 @@ def sstate_install(ss, d):
 
     # Check the file list for conflicts against the master manifest
     mastermanifest = d.getVar("SSTATE_MASTERMANIFEST", True)
-    whitelist = d.getVar("SSTATE_DUPWHITELIST", True)
+    whitelist = (d.getVar("SSTATE_DUPWHITELIST", True) or "").split()
     lock = bb.utils.lockfile(mastermanifest + ".lock")
     if not os.path.exists(mastermanifest):
         open(mastermanifest, "w").close()





Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TabEV-0003iT-JM for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 00:58:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAJNiR3p000345
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 23:44:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32674-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 23:44:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAJNiGvl000339
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 23:44:18 GMT
Message-ID: <1353368656.3709.212.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Nov 2012 23:44:16 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] utils: Optimise looping in base_set_filespath
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
X-List-Received-Date: Mon, 19 Nov 2012 23:58:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Calling split on the same expression, once per loop iteration is
inefficient and pointless, particularly in a function called by
every recipe during parsing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 52e511f..c1de2f6 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -308,10 +308,10 @@ def base_set_filespath(path, d):
     if extrapaths != "":
         path = extrapaths.split(":") + path
     # The ":" ensures we have an 'empty' override
-    overrides = (d.getVar("OVERRIDES", True) or "") + ":"
+    overrides = ((d.getVar("OVERRIDES", True) or "") + ":").split(":")
     for p in path:
         if p != "": 
-            for o in overrides.split(":"):
+            for o in overrides:
                 filespath.append(os.path.join(p, o))
     return ":".join(filespath)
 





Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Th26n-0005KY-L5 for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 18:53:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB7HchEg007412
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Dec 2012 17:38:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06954-04 for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2012 17:38:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB7HcXVV007406
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Dec 2012 17:38:34 GMT
Message-ID: <1354901903.12928.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Dec 2012 17:38:23 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] bitbake.conf/utils: Drop some OVERRIDES from FILESPATH
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
X-List-Received-Date: Fri, 07 Dec 2012 17:53:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are several overrides that don't make sense as part of FILESPATH. This
introduces FILESOVERRIDES and allows us to drop some of the pointless ones,
simplifying the files search path further and improving the user experience.

If needed by specific recipes, other overrides can be added back in for
specific cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index c1de2f6..be0a25a 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -308,7 +308,7 @@ def base_set_filespath(path, d):
     if extrapaths != "":
         path = extrapaths.split(":") + path
     # The ":" ensures we have an 'empty' override
-    overrides = ((d.getVar("OVERRIDES", True) or "") + ":").split(":")
+    overrides = ((d.getVar("FILESOVERRIDES", True) or "") + ":").split(":")
     for p in path:
         if p != "": 
             for o in overrides:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 420bdfa..be3bfc2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -671,6 +671,8 @@ DISTROOVERRIDES ?= "${@d.getVar('DISTRO', True) or ''}"
 MACHINEOVERRIDES ?= "${MACHINE}"
 MACHINEOVERRIDES[vardepsexclude] = "MACHINE"
 
+FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
+
 CPU_FEATURES ?= ""
 CPU_FEATURES_arm ?= "vfp"
 





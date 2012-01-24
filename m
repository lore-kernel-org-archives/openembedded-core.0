Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rpk1R-0006tx-Ux for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:19:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OHBK7Z030191
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:11:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29754-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:11:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OHBCId030185
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:11:13 GMT
Message-ID: <1327425074.19643.101.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jan 2012 17:11:14 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] lib/oe/sstatesig.py: Exclude common machine specific dependencies from task signatures
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
X-List-Received-Date: Tue, 24 Jan 2012 17:19:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Where we have machine specific recipes with well defined behaviour, it makes
no sense to rebuild recipes with these as dependencies whenever the machine
changes. This patch lists those well behaved recipes and excludes them from
the task signatures so we can change MACHINE without invalidating existing
PACKAGE_ARCH binaries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 247f592..ee7cbad 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -26,6 +26,10 @@ def sstate_rundepfilter(fn, recipename, task, dep, depname):
     if isNative(depname) or isCross(depname) or isNativeSDK(depname):
         return False
 
+    # Exclude well defined machine specific configurations which don't change ABI
+    if depname in ['sysvinit-inittab', 'shadow-securetty', 'opkg-config-base', 'netbase', 'formfactor', 'xserver-xf86-config', 'pointercal', 'base-files']:
+        return False
+
     # Default to keep dependencies
     return True
 





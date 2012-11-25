Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tcv6n-00044g-Nz for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 10:36:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAPKN9L3017444
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2012 20:23:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15876-01 for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2012 20:23:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAPKN1Lm017438
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2012 20:23:02 GMT
Message-ID: <1353874980.21863.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 25 Nov 2012 20:23:00 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] allarch: Allow class to be included but overridden
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
X-List-Received-Date: Mon, 26 Nov 2012 09:36:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We have cases where we'd like to inherit this class by default but allow
special cases to override it. This change makes the code of the class
conditional on PACKAGE_ARCH remaining set to "all", allowing it to be
overridden. packagegroup usage is one case this is desirable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 21157e5..8669470 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -4,20 +4,25 @@
 
 PACKAGE_ARCH = "all"
 
-# No need for virtual/libc or a cross compiler
-INHIBIT_DEFAULT_DEPS = "1"
+python () {
+    # Allow this class to be included but overridden - only set
+    # the values if we're still "all" package arch.
+    if d.getVar("PACKAGE_ARCH") == "all":
+        # No need for virtual/libc or a cross compiler
+        d.setVar("INHIBIT_DEFAULT_DEPS","1")
 
-# Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
-# naming anyway
-TARGET_ARCH = "allarch"
-TARGET_OS = "linux"
-TARGET_CC_ARCH = "none"
-TARGET_LD_ARCH = "none"
-TARGET_AS_ARCH = "none"
-PACKAGE_EXTRA_ARCHS = ""
+        # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
+        # naming anyway
+        d.setVar("TARGET_ARCH", "allarch")
+        d.setVar("TARGET_OS", "linux")
+        d.setVar("TARGET_CC_ARCH", "none")
+        d.setVar("TARGET_LD_ARCH", "none")
+        d.setVar("TARGET_AS_ARCH", "none")
+        d.setVar("PACKAGE_EXTRA_ARCHS", "")
 
-# No need to do shared library processing or debug symbol handling
-EXCLUDE_FROM_SHLIBS = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INHIBIT_PACKAGE_STRIP = "1"
+        # No need to do shared library processing or debug symbol handling
+        d.setVar("EXCLUDE_FROM_SHLIBS", "1")
+        d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
+        d.setVar("INHIBIT_PACKAGE_STRIP", "1")
+}
 





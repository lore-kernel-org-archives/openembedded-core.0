Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SpLKq-0000LF-9g for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 17:29:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6CFIV0c020720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 16:18:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20011-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 16:18:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6CFIMej020713
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 16:18:23 +0100
Message-ID: <1342106303.22262.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2012 16:18:23 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate.bbclass: Move crosssdk before cross to ensure correct variables are set
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
X-List-Received-Date: Thu, 12 Jul 2012 15:29:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There was a bug showing up where the crosssdk recipes were being installed as machine
specific in the sstate-control directory. This turned out to be due to the architecture
fields used by sstate being set incorrectly. The problem is that the crosssdk inherits
the cross class. It therefore needs to be listed in this if statement block before
the cross check, not after.

This should resolve some package architecture issue of crosssdk sstate files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 4242f88..c2c5bd5 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -23,11 +23,11 @@ SSTATEPOSTINSTFUNCS ?= ""
 python () {
     if bb.data.inherits_class('native', d):
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH'))
+    elif bb.data.inherits_class('crosssdk', d):
+        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${SDK_ARCH}"))
     elif bb.data.inherits_class('cross', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${TUNE_PKGARCH}"))
         d.setVar('SSTATE_MANMACH', d.expand("${BUILD_ARCH}_${MACHINE}"))
-    elif bb.data.inherits_class('crosssdk', d):
-        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${PACKAGE_ARCH}"))
     elif bb.data.inherits_class('nativesdk', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}"))
     elif bb.data.inherits_class('cross-canadian', d):





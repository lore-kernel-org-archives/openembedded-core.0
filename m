Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLFNg-0008Ew-0R for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 15:32:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1EPq8d030566
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 14:25:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30366-03 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2011 14:25:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1EPhad030560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 14:25:44 GMT
Message-ID: <1320157543.15387.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Nov 2011 14:25:43 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package_ipk: There is no longer any need to force owners/groups to root
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
X-List-Received-Date: Tue, 01 Nov 2011 14:32:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since the packaging process is run under pseudo, the default user
is now root so there is no longer any need to hardcode this. Also
take this opportunity to move the variable to package_ipk.bbclass
since this is the only user of it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index c0893a6..c97e36e 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -7,6 +7,9 @@ IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
 
 PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
 
+# Program to be used to build opkg packages
+OPKGBUILDCMD ??= "opkg-build"
+
 python package_ipk_fn () {
 	bb.data.setVar('PKGFN', bb.data.getVar('PKG',d), d)
 }
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e2c1b6f..0d05805 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -623,10 +623,6 @@ MKTEMPCMD = "mktemp -q ${TMPBASE}"
 
 export PATCH_GET="0"
 
-# Program to be used to build opkg packages
-
-OPKGBUILDCMD = "opkg-build -o 0 -g 0"
-
 ##################################################################
 # Not sure about the rest of this yet.
 ##################################################################





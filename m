Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RqQd7-0004Ro-T2 for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 15:48:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QEf2Bq023213
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 14:41:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22440-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 14:40:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QEesgc023207
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 14:40:55 GMT
Message-ID: <1327588856.19643.386.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 14:40:56 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate.bbclass: Add support for sstate preinst functions
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
X-List-Received-Date: Thu, 26 Jan 2012 14:48:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0f88a23..4bd3712 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -17,6 +17,7 @@ BB_HASHFILENAME = "${SSTATE_PKGNAME}"
 
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
+SSTATEPREINSTFUNCS ?= ""
 SSTATEPOSTINSTFUNCS ?= ""
 
 python () {
@@ -170,6 +171,10 @@ def sstate_installpkg(ss, d):
 
     d.setVar('SSTATE_INSTDIR', sstateinst)
     d.setVar('SSTATE_PKG', sstatepkg)
+
+    for preinst in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split():
+        bb.build.exec_func(preinst, d)
+
     bb.build.exec_func('sstate_unpack_package', d)
 
     # Fixup hardcoded paths





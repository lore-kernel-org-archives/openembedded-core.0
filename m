Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S1K93-00086w-Q7 for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 17:06:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1PFwRaJ021453
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 15:58:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19581-09 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 15:58:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1PFwJLU021447
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 15:58:20 GMT
Message-ID: <1330185499.13788.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 25 Feb 2012 15:58:19 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] cross-canadian: Set STAGING_DIR_HOST correctly
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
X-List-Received-Date: Sat, 25 Feb 2012 16:06:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As reported by Martin Jansa, the path to nativesdk sysroot was changing between
nativesdk and cross-canadian recipes. The problem was the incorrect deinfition of
STAGING_DIR_HOST in cross-canadian.bbclass.

Since nothing really uses the cross-canadian output in the sysroot, only the
packages, its not surprising this bug has gone un-noticed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 499a1fb..e187b88 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -26,7 +26,7 @@ MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_SYS}-nativesdk"
+STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}"
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}"
 





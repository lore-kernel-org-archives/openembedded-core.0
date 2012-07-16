Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sqmyc-0004xM-2u for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:12:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6GF1S2X001294
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 16:01:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00304-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 16:01:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6GF1ICD001287
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 16:01:19 +0100
Message-ID: <1342450881.5019.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jul 2012 16:01:21 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] useradd.bbclass: Fix for multilib builds
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
X-List-Received-Date: Mon, 16 Jul 2012 15:12:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The class adds a setscene dependency on base-passwd as well as adds this to DEPENDS.
The DEPENDS version will be auso-converted to include MLPREFIX whilst the setscene
dependency will not. This result in errors about non-existent tasks.

This patch ensures MLPREFIX is added when it is needed and fixes various
build failures. Whether we should have two base-passwd recipes in a multilib
system is a question which would need to be addressed by future changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 0ed91ad..0b9644b 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -146,7 +146,7 @@ SYSROOTPOSTFUNC_virtclass-cross = ""
 SYSROOTPOSTFUNC_virtclass-native = ""
 SYSROOTPOSTFUNC_virtclass-nativesdk = ""
 
-USERADDSETSCENEDEPS = "base-passwd:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
+USERADDSETSCENEDEPS = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
 USERADDSETSCENEDEPS_virtclass-cross = ""
 USERADDSETSCENEDEPS_virtclass-native = ""
 USERADDSETSCENEDEPS_virtclass-nativesdk = ""





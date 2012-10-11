Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TMHxF-0005ru-5L for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 14:33:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9BCKNRS006372
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 13:20:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06281-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 13:20:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9BCKFx3006366
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 13:20:16 +0100
Message-ID: <1349958020.14368.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Oct 2012 13:20:20 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Use -m option to tar when unpacking sstate
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
X-List-Received-Date: Thu, 11 Oct 2012 12:33:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've noticed failures on the project autobuilders where a shared sstate
directory is used across multiple builders and the clocks become skewed.

Most of the time this causes harmless building but if this happens where
an environment is changed (make install vs make in qt4-x11-free for example),
the build can fail.

This avoids modification times in the future and should make builds safer
in shared environments sstate was designed for.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3fcaa65..b60c766 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -544,7 +544,7 @@ sstate_create_package () {
 sstate_unpack_package () {
 	mkdir -p ${SSTATE_INSTDIR}
 	cd ${SSTATE_INSTDIR}
-	tar -xvzf ${SSTATE_PKG}
+	tar -xmvzf ${SSTATE_PKG}
 }
 
 # Need to inject information about classes not in the global configuration scope





Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TLFno-0003fz-18 for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 18:03:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q98FoPQP021023
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Oct 2012 16:50:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19723-10 for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2012 16:50:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q98FoGou021017
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Oct 2012 16:50:17 +0100
Message-ID: <1349711421.15658.121.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 08 Oct 2012 16:50:21 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH RFC] pkgconfig: Drop automatic pkgconfig RDEPENDS
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
X-List-Received-Date: Mon, 08 Oct 2012 16:03:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Just because a recipe uses pkgconfig, it doesn't mean that it's -dev
package should RDEPENDS on pkgconfig. I can understand the thinking
that lead to this but it makes sense to be able to install the package
when pkgconfig hasn't been built.

Currently you can also get failures where pkgconfig wasn't built yet
a -dev package is included that depends on it leading to rootfs failures.

I considered making this a RRECOMMENDS but it should probably be an
RSUGGESTS at best given the tenuous pkgconfig requirement any given
-dev package has. In the end I decided we might as well just remove it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/pkgconfig.bbclass b/meta/classes/pkgconfig.bbclass
index 5908b7f..ad1f84f 100644
--- a/meta/classes/pkgconfig.bbclass
+++ b/meta/classes/pkgconfig.bbclass
@@ -1,7 +1,2 @@
 DEPENDS_prepend = "pkgconfig-native "
 
-PKGCONFIGRDEP = "pkgconfig"
-PKGCONFIGRDEP_virtclass-native = ""
-PKGCONFIGRDEP_virtclass-nativesdk = "nativesdk-pkgconfig"
-
-RDEPENDS_${PN}-dev += "${PKGCONFIGRDEP}"
--
cgit 0.9.0.1





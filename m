Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RsG88-0007FP-FY for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 17:00:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0VFqVuR011164
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 15:52:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10752-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 15:52:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0VFqPQQ011157
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 15:52:26 GMT
Message-ID: <1328025147.13744.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jan 2012 15:52:27 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] pkgconfig: Ensure pkgconfig RDEPENDS are tracked
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
X-List-Received-Date: Tue, 31 Jan 2012 16:00:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, pkgconfig dependencies get added to -dev packages which install
.pc files however nothing in the system makes bitbake aware of these
dependencies so images can fail with pkgconfig being missing.

This change explictly adds in the pkgconfig RDEPENDS to the -dev packages
and hence makes bitbake aware of the dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/pkgconfig.bbclass b/meta/classes/pkgconfig.bbclass
index a12cd64..53e793a 100644
--- a/meta/classes/pkgconfig.bbclass
+++ b/meta/classes/pkgconfig.bbclass
@@ -1 +1,6 @@
 DEPENDS_prepend = "pkgconfig-native "
+
+PKGCONFIGRDEP = "pkgconfig"
+PKGCONFIGRDEP_virtclass-native = ""
+
+RDEPENDS_${PN}-dev += "${PKGCONFIGRDEP}"





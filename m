Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Swh3k-0004vP-4W for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 00:06:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q71Lspnr000796
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 22:54:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30397-05 for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2012 22:54:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q71Lshxb000789
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 22:54:44 +0100
Message-ID: <1343858083.9756.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 01 Aug 2012 22:54:43 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] dbus: Ensure dbus-nativesdk doesn't RPROVIDE dbus-x11
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
X-List-Received-Date: Wed, 01 Aug 2012 22:06:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

dbus-x11 should not RPROVIDE dbus-x11 as this is incorrect and confuses
builds. This fixes the nativesdk case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 164c4d3..1984c74 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -33,9 +33,12 @@ DEBIANNAME_${PN} = "dbus-1"
 
 PACKAGES =+ "${PN}-lib ${PN}-systemd"
 
+OLDPKGNAME = "dbus-x11"
+OLDPKGNAME_virtclass-nativesdk = ""
+
 # for compatibility
-RPROVIDES_${PN} = "dbus-x11"
-RREPLACES_${PN} += "dbus-x11"
+RPROVIDES_${PN} = "${OLDPKGNAME}"
+RREPLACES_${PN} += "${OLDPKGNAME}"
 
 FILES_${PN}-systemd = "${systemd_unitdir}/system/"
 





Received: from outrightsolutions.nl ([194.145.201.26]
	helo=mail.outrightsolutions.nl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sander@outrightsolutions.nl>) id 1T73JR-0004lw-EL
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 13:53:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id A6B935BC9A0;
	Thu, 30 Aug 2012 13:33:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6t0TDpUsranJ; Thu, 30 Aug 2012 13:33:47 +0200 (CEST)
Received: from haze.lan (unknown [IPv6:2a02:2308::1ab:f800:2])
	by mail.outrightsolutions.nl (Postfix) with ESMTPSA id D845C5BC99F;
	Thu, 30 Aug 2012 13:33:46 +0200 (CEST)
From: Sander van Grieken <sander@outrightsolutions.nl>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2012 13:33:40 +0200
Message-Id: <1346326420-23677-1-git-send-email-sander@outrightsolutions.nl>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] avahi: systemd postinst and postrm removed in favor of using systemd.bbclass
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
X-List-Received-Date: Thu, 30 Aug 2012 11:53:29 -0000

The recipe's custom systemd service enable code is now handled by the meta-systemd
bbappend recipe in meta-openembedded.

Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
---
 meta/recipes-connectivity/avahi/avahi.inc |   19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index c08acb5..a0a1681 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -155,22 +155,3 @@ pkg_postrm_avahi-autoipd () {
 	deluser avahi-autoipd || true
 	delgroup avahi-autoipd || true
 }
-
-pkg_postinst_avahi-systemd() {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-	
-	systemctl enable avahi-daemon.service
-}
-
-pkg_postrm_avahi-systemd() {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	systemctl disable avahi-daemon.service
-}
-
-- 
1.7.9.5




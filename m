Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1T2ATD-0007DD-DF
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 02:31:23 +0200
Received: by pbcwy7 with SMTP id wy7so2795534pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 17:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=KtJKaedI2aCqSrouW6HybIROcRNrw/2ov3FYOMWIfNQ=;
	b=W4ISB/Ma/IdRtBqqXbviyCc97mSmWHRnSQBzp6HoNcKWoTx1UT4SIdGsA6vLPDC+Ko
	hAhWZgIrfwYaxVl3fzTtXpnhsjxYa4Cn7OBSnBRLdv3t+1EJxwTeV9coIln4iueLzL+W
	mZAxcwhx6QO6QQ13Z3DhBcx6A85iNtsojOoo1DB4zHk/o9BC6upWTDcGnwYaprFxZ8WV
	dajqAsM8KmyuzSM0WjuOFzCEpZ4gyh0UtHrgv3tbj+9o4UKm0ec3AuK9hwd9Kurbscix
	H8CAb8dJjIiPT+7THLH+PsiEm2/wqn0rmUCxYNzfxcFeoCJegWDRMnnYQrEburTHK16j
	DJiA==
Received: by 10.68.220.193 with SMTP id py1mr7339211pbc.4.1345162764473;
	Thu, 16 Aug 2012 17:19:24 -0700 (PDT)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au.
	[220.244.174.13])
	by mx.google.com with ESMTPS id b4sm2840203pbw.28.2012.08.16.17.19.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 17:19:23 -0700 (PDT)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 10:10:35 +1000
Message-Id: <1345162235-23835-1-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] avahi: fix packaging of avahi-autoipd
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
X-List-Received-Date: Fri, 17 Aug 2012 00:31:23 -0000

- Avahi's "avahi-autoipd" file is in the dhcp/ folder, not dhcp3/
- udhcpc files were being installed but not being shipped in avahi-autoipd
- do_install override for avahi-autoipd was not being called and is not
  required, so join it into regular do_install.
- While at it, fixup string quoting in description.

This makes avahi-autoipd work with simple ifup/down scripts.

Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
---
 meta/recipes-connectivity/avahi/avahi.inc |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 37ff70d..f0c043b 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Avahi IPv4LL network address configuration daemon"
-DESCRIPTION = "Avahi is a fully LGPL framework for Multicast DNS Service Discovery. It \
+DESCRIPTION = 'Avahi is a fully LGPL framework for Multicast DNS Service Discovery. It \
 allows programs to publish and discover services and hosts running on a local network \
 with no specific configuration. This tool implements IPv4LL, "Dynamic Configuration of \
 IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for automatic IP address \
 configuration from the link-local 169.254.0.0/16 range without the need for a central \
-server."
+server."'
 AUTHOR = "Lennart Poettering <lennart@poettering.net>"
 HOMEPAGE = "http://avahi.org"
 BUGTRACKER = "http://avahi.org/report"
@@ -63,7 +63,9 @@ PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-c
 FILES_avahi-systemd = "${systemd_unitdir}"
 FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
                        ${sysconfdir}/avahi/avahi-autoipd.action \
-                       ${sysconfdir}/dhcp3/*/avahi-autoipd"
+                       ${sysconfdir}/dhcp/*/avahi-autoipd \
+                       ${sysconfdir}/udhcpc.d/00avahi-autoipd \
+                       ${sysconfdir}/udhcpc.d/99avahi-autoipd"
 FILES_libavahi-common = "${libdir}/libavahi-common.so.*"
 FILES_libavahi-core = "${libdir}/libavahi-core.so.*"
 FILES_avahi-daemon = "${sbindir}/avahi-daemon \
@@ -116,10 +118,7 @@ do_install() {
 	rm -rf ${D}/var/run
 	rm -rf ${D}${datadir}/dbus-1/interfaces
 	rm -rf ${D}${libdir}/avahi
-}
 
-do_install_avahi-autoipd() {
-	autotools_do_install
 	install -d ${D}${sysconfdir}/udhcpc.d
 	install ${WORKDIR}/00avahi-autoipd ${D}${sysconfdir}/udhcpc.d
 	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
-- 
1.7.7




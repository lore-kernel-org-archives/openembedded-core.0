Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1T2Wog-0004UR-14
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 02:23:02 +0200
Received: by pbcwy7 with SMTP id wy7so4735849pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 17:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Zjexwps8duIObva/cSg+VVs8qO9nFsjTehAs/Rynwk0=;
	b=AE0qcuFPpTp9mZO3F3M8T+DvZSbNOAglXE0ADC9e8pdcuV0qpyBTN60MdJoEwmngDY
	QB1B9VztINJplNn8nKFUlOsjbjuF+SFLRdq+DoQhGCrd6KhSRB+Jf/J0x6nCR1msZeKn
	GRBEn06c5ztWbIM1Li0UOuxS+hTKW9pF7EIhYpeQ5RKk0uq8l/KQLGpyLd5BvtSdDknG
	lVggxE7VxIMPoppzqqWvatkpUaxTSKmPWd3LDGBnpPnv47K7BS7tDEAZFfc9Z0cS3ea5
	T1BuDun49XXFBk/+02V5ODb++y/0is6Dnf0oIeAs7Lly+lUnMty41cfslnUEQck0t3jv
	B6Nw==
Received: by 10.68.200.8 with SMTP id jo8mr15365323pbc.148.1345248661908;
	Fri, 17 Aug 2012 17:11:01 -0700 (PDT)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au.
	[220.244.174.13])
	by mx.google.com with ESMTPS id qo8sm5874944pbb.19.2012.08.17.17.10.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 17:11:00 -0700 (PDT)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Aug 2012 10:04:30 +1000
Message-Id: <1345248270-21796-1-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.7
Subject: [Patch V2] avahi: fix packaging of avahi-autoipd
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
X-List-Received-Date: Sat, 18 Aug 2012 00:23:02 -0000

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
index 37ff70d..c08acb5 100644
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
+server.'
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




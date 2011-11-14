Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RPwLX-000432-4u
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 14:13:11 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RPwFQ-0004cn-0H
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 14:06:52 +0100
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2011 13:06:51 +0000
X-Mailer: Evolution 3.0.2- 
Message-ID: <1321276012.29435.24.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] libnss-mdns: avoid race condition in postinst
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
X-List-Received-Date: Mon, 14 Nov 2011 13:13:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Writing to "/tmp/nsswitch.conf" leads to a race condition if two
copies of the postinst are running simultaneously.  Fix this by
modifying /etc/nsswitch.conf in place using sed -i.  Also make the
same change to the prerm for consistency although the race will not
occur here in practice.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 .../libnss-mdns/libnss-mdns_0.10.bb                |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index 5f614f8..8770714 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
 RDEPENDS_${PN} = "avahi-daemon"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz"
 
@@ -26,14 +26,12 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-lynx --enable-avahi"
 # TODO: pattern based configuration update
 pkg_postinst_${PN} () {
 	cat $D/etc/nsswitch.conf | grep "hosts:\s*files dns$" > /dev/null && {
-		cat $D/etc/nsswitch.conf | sed 's/hosts:\s*files dns/& mdns4/' > /tmp/nsswitch.conf
-		mv /tmp/nsswitch.conf $D/etc/nsswitch.conf
+		sed -i 's/hosts:\s*files dns/& mdns4/' $D/etc/nsswitch.conf
 	}
 }
 
 pkg_prerm_${PN} () {
 	cat /etc/nsswitch.conf | grep "hosts:\s*files dns mdns4$" > /dev/null && {
-		cat /etc/nsswitch.conf | sed 's/\(hosts:\s*files dns\) mdns4*/\1/' > /tmp/nsswitch.conf
-		mv /tmp/nsswitch.conf /etc/nsswitch.conf
+		sed -i 's/\(hosts:\s*files dns\) mdns4*/\1/' /etc/nsswitch.conf
 	}
 }
-- 
1.7.4.1






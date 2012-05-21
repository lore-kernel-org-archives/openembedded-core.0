Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWU9R-0000P4-La
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 17:04:02 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2012 16:53:53 +0200
Message-Id: <1337612033-27237-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libnss-mdns: fix postinst scripts
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
X-List-Received-Date: Mon, 21 May 2012 15:04:02 -0000

* On upgrade, postinst ocassionally returned 1, so use a
  conditional instead of &&.
* Use sed patterns in order to make it work more generally.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../libnss-mdns/libnss-mdns_0.10.bb                |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index 8770714..a1f2f9a 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
 RDEPENDS_${PN} = "avahi-daemon"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz"
 
@@ -23,15 +23,14 @@ DEBIANNAME_${PN} = "libnss-mdns"
 
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-lynx --enable-avahi"
 
-# TODO: pattern based configuration update
 pkg_postinst_${PN} () {
-	cat $D/etc/nsswitch.conf | grep "hosts:\s*files dns$" > /dev/null && {
-		sed -i 's/hosts:\s*files dns/& mdns4/' $D/etc/nsswitch.conf
-	}
+if ! grep -q '^hosts:.*\<mdns4\>' $D/etc/nsswitch.conf; then
+	sed -e 's/^hosts:.*/& mdns4/' -i $D/etc/nsswitch.conf
+fi
 }
 
 pkg_prerm_${PN} () {
-	cat /etc/nsswitch.conf | grep "hosts:\s*files dns mdns4$" > /dev/null && {
-		sed -i 's/\(hosts:\s*files dns\) mdns4*/\1/' /etc/nsswitch.conf
-	}
+if grep -q '^hosts:.*\<mdns4\>' /etc/nsswitch.conf; then
+	sed -e '/^hosts:/s/\s\<mdns4\>//' -i /etc/nsswitch.conf
+fi
 }
-- 
1.7.9.5




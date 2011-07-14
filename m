Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QhKqp-0003Z7-MQ
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 14:17:07 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QhKmz-0005L4-Lx
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 14:13:10 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jul 2011 13:13:08 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310645589.2378.61.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] openssl: pass ${mandir} explicitly to "make install"
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
X-List-Received-Date: Thu, 14 Jul 2011 12:17:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise it will use the openssl internal default of /usr/share/man which may not be correct.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-connectivity/openssl/openssl.inc      |    2 +-
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index d42ae1c..39143ad 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -102,7 +102,7 @@ do_compile () {
 
 do_install () {
 	install -m 0755 -d ${D}${libdir}/pkgconfig
-	oe_runmake INSTALL_PREFIX="${D}" install
+	oe_runmake INSTALL_PREFIX="${D}" MANDIR="${mandir}" install
 	chmod 644 ${D}${libdir}/pkgconfig/openssl.pc
 	oe_libinstall -so libcrypto ${D}${libdir}
 	oe_libinstall -so libssl ${D}${libdir}
diff --git a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
index c95b1f1..ea83cb8 100644
--- a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
+++ b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
@@ -1,6 +1,6 @@
 require openssl.inc
 
-PR = "r2"
+PR = "r3"
 SRC_URI += "file://debian/ca.patch \
             file://debian/config-hurd.patch;apply=no \
             file://debian/debian-targets.patch \
-- 
1.7.4.1






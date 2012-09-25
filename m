Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGYLW-0005SZ-7a
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 18:50:54 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGY99-0005kL-2s
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 18:38:07 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2012 17:38:06 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348591087.31293.83.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] iproute2: Use configured values for ${base_sbindir} and ${libdir}
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
X-List-Received-Date: Tue, 25 Sep 2012 16:50:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These were previously being hard-coded to "/sbin" and "/usr/lib" respectively,
resulting in unpackaged files if the configured values were something else.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-connectivity/iproute2/iproute2.inc      |    2 +-
 meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 7caf7d0..d8b1a17 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native"
 
 inherit update-alternatives
 
-EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_KERNEL_DIR}/include DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip' SBINDIR=/sbin"
+EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_KERNEL_DIR}/include DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
 
 do_install () {
     oe_runmake DESTDIR=${D} install
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb b/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
index fc7292e..c1e9bd3 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
@@ -1,6 +1,6 @@
 require iproute2.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://configure-cross.patch"
-- 
1.7.10.4






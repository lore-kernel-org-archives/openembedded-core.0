Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QtggU-0004Kw-5U
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 16:01:30 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qtgc2-0007yX-1g
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 15:56:54 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2011 14:56:53 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313589414.6733.219.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] libxslt: fix packaging of static libraries
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
X-List-Received-Date: Wed, 17 Aug 2011 14:01:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This prevents warnings about .a files being installed but not shipped.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-support/libxslt/libxslt_1.1.26.bb |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
index b5f6962..cc64ba7 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
@@ -6,8 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0cd9a07afbeb24026c9b03aecfeba458"
 
 SECTION = "libs"
-DEPENDS = "libxml2 (>=2.6.27)"
-PR = "r1"
+DEPENDS = "libxml2"
+PR = "r2"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch;patch=1"
@@ -16,13 +16,14 @@ SRC_URI[md5sum] = "e61d0364a30146aaa3001296f853b2b9"
 SRC_URI[sha256sum] = "55dd52b42861f8a02989d701ef716d6280bfa02971e967c285016f99c66e3db1"
 S = "${WORKDIR}/libxslt-${PV}"
 
-inherit autotools pkgconfig binconfig
+inherit autotools pkgconfig binconfig lib_package
 
 EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
+# older versions of this recipe had ${PN}-utils
+RPROVIDES_${PN}-bin += "${PN}-utils"
+RCONFLICTS_${PN}-bin += "${PN}-utils"
+RREPLACES_${PN}-bin += "${PN}-utils"
 
-PACKAGES = "${PN}-dbg ${PN}-dev ${PN}-utils ${PN} ${PN}-doc ${PN}-locale"
-
-FILES_${PN}-dev += "${bindir}/xslt-config"
-FILES_${PN}-utils += "${bindir}"
+FILES_${PN}-dev += "${bindir}/xsltConf.sh"
 
 BBCLASSEXTEND = "native"
-- 
1.7.4.1






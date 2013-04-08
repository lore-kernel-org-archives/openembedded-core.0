Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UP8Mb-0006xh-0K
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 11:27:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r389APZU023851
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Apr 2013 02:10:25 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 8 Apr 2013 02:10:25 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Apr 2013 17:12:07 +0800
Message-ID: <cc464b33c56579c26179fa20c7354c328b4e080c.1365401439.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1365401439.git.kai.kang@windriver.com>
References: <cover.1365401439.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 1/2] libpng12: rename libpng_1.2.50 to libpng12
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
X-List-Received-Date: Mon, 08 Apr 2013 09:28:05 -0000
X-List-Received-Date: Mon, 08 Apr 2013 09:28:05 -0000
Content-Type: text/plain

As Mark's suggestion, rename libpng_1.2.50 to libpng12 that
multi-versions libpng could coexist. And drop files that conflict with
higher version.

We want to make sure we have both the old and new versions to meet LSB
compliance (for people who have that enabled) as well as the new version
for newer applications.

CC: Mark Hatle <mark.hatle@windriver.com>

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../{libpng_1.2.50.bb => libpng12_1.2.50.bb}       |   18 +++++++++++++++---
 1 files changed, 15 insertions(+), 3 deletions(-)
 rename meta/recipes-lsb4/libpng/{libpng_1.2.50.bb => libpng12_1.2.50.bb} (62%)

diff --git a/meta/recipes-lsb4/libpng/libpng_1.2.50.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
similarity index 62%
rename from meta/recipes-lsb4/libpng/libpng_1.2.50.bb
rename to meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
index 8fdc41b..43ff75a 100644
--- a/meta/recipes-lsb4/libpng/libpng_1.2.50.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.50.bb
@@ -8,14 +8,26 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
 DEPENDS = "zlib"
 PR = "r0"
 
+PN = "libpng12"
+S = "${WORKDIR}/libpng-${PV}"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
 SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
 
+BINCONFIG_GLOB = "${PN}-config"
+
 inherit autotools binconfig pkgconfig
 
-PACKAGES =+ "${PN}12"
+do_install_append() {
+	unlink ${D}/${includedir}/png.h
+	unlink ${D}/${includedir}/pngconf.h
+
+	unlink ${D}/${libdir}/libpng.la
+	unlink ${D}/${libdir}/libpng.so
+	unlink ${D}/${libdir}/libpng.a
+	unlink ${D}/${libdir}/pkgconfig/libpng.pc
 
-FILES_${PN}12 = "${libdir}/libpng12${SOLIBS}"
-RPROVIDES_${PN}-dev += "${PN}12-dev"
+	unlink ${D}/${bindir}/libpng-config
+}
-- 
1.7.5.4




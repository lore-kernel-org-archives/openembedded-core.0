Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UK4ls-0000lY-Ux
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 11:37:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2PAJse1020028
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 03:19:54 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 25 Mar 2013 03:19:54 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Mar 2013 18:21:35 +0800
Message-ID: <e3e9dea5c45c1b5ba29300e4957dcd611655492e.1364204199.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1364204199.git.kai.kang@windriver.com>
References: <cover.1364204199.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 1/2] libpng: add version 1.2 back
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
X-List-Received-Date: Mon, 25 Mar 2013 10:37:02 -0000
Content-Type: text/plain

Current LSB 4.1 test suite still check libpng12.so, so add libpng 1.2.x
back, and set it as default verison for linuxstdbase image.

[YOCTO 4015]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/conf/distro/include/default-versions.inc   |    3 +++
 meta/recipes-multimedia/libpng/libpng_1.2.50.bb |   21 +++++++++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/libpng_1.2.50.bb

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 53ec2e7..0a5b2f4 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -9,3 +9,6 @@ PREFERRED_VERSION_python-native ?= "2.7.3"
 
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
+
+# Set libpng default version for linuxstdbase
+PREFERRED_VERSION_libpng_linuxstdbase ?= "1.2.50"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
new file mode 100644
index 0000000..8fdc41b
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
@@ -0,0 +1,21 @@
+SUMMARY = "PNG Library"
+DESCRIPTION = "PNG Library"
+HOMEPAGE = "http://www.libpng.org/"
+SECTION = "libs"
+LICENSE = "Libpng"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
+                    file://png.h;beginline=310;endline=424;md5=b87b5e9252a3e14808a27b92912d268d"
+DEPENDS = "zlib"
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
+SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
+
+inherit autotools binconfig pkgconfig
+
+PACKAGES =+ "${PN}12"
+
+FILES_${PN}12 = "${libdir}/libpng12${SOLIBS}"
+RPROVIDES_${PN}-dev += "${PN}12-dev"
-- 
1.7.5.4




Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TbRry-0004NE-C0
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 09:10:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAM7ucKB009740
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 23:56:38 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 21 Nov 2012 23:56:36 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2012 15:56:32 +0800
Message-ID: <1a73620d265a5c6bb81ec025e0a1be0e87adc96f.1353570517.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1353570517.git.jackie.huang@windriver.com>
References: <cover.1353570517.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, saul.wold@intel.com
Subject: [PATCH 1/1] libpam: QA Issue: installed in the base_prefix, requires a shared library under exec_prefix
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
X-List-Received-Date: Thu, 22 Nov 2012 08:10:46 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

    Problem Description
    ======================
    WARNING: QA Issue: libpam: /lib/security/pam_cracklib.so,
    installed in the base_prefix, requires a shared library under
    exec_prefix (/usr): libcrack.so.2 => /usr/lib/libcrack.so.2 (0xdead2000)

    WARNING: QA Issue: libpam: /lib/security/pam_cracklib.so,
    installed in the base_prefix, requires a shared library under
    exec_prefix (/usr): libz.so.1 => /usr/lib/libz.so.1 (0xdead3000)

This fix moves and libcrack over to ${base_libdir}, libz.so.* as well (libz.so
and zlib.pc stays in ${libdir}

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/zlib/zlib_1.2.7.bb              |   11 +++++++++++
 meta/recipes-extended/cracklib/cracklib_2.8.19.bb |    9 +++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb b/meta/recipes-core/zlib/zlib_1.2.7.bb
index 803fec3..8994aee 100644
--- a/meta/recipes-core/zlib/zlib_1.2.7.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
@@ -6,6 +6,8 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=94d1b5a40dadd127f3351471727e66a9"
 
+PR ="r1"
+
 SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
            file://remove.ldconfig.call.patch \
            "
@@ -22,6 +24,15 @@ do_compile (){
 
 do_install() {
 	oe_runmake DESTDIR=${D} install
+	case ${PN} in
+		zlib-native*)
+			;;
+		*)
+			mkdir -p ${D}/${base_libdir}
+			mv ${D}/${libdir}/libz.so.* ${D}/${base_libdir}
+			tmp=`readlink ${D}/${libdir}/libz.so`
+			ln -sf ../../${base_libdir}/$tmp ${D}/${libdir}/libz.so
+	esac
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.19.bb b/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
index 2951396..99b283a 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.8.19.bb
@@ -5,9 +5,9 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 DEPENDS = "zlib"
-PR ="r0"
+PR ="r1"
 
-EXTRA_OECONF = "--without-python"
+EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz"
 
@@ -15,3 +15,8 @@ SRC_URI[md5sum] = "ca0ec168d9c6466612204e8dfb2df8a9"
 SRC_URI[sha256sum] = "7086b0ca23f875c9cd9ea2a993c262384b274dba9c4ea1da845ec8ac290748a9"
 
 inherit autotools gettext
+
+FILES_${PN}-dev += "${base_libdir}/libcrack.so ${base_libdir}/libcrack.la"
+FILES_${PN}-dbg += "${base_libdir}/.debug/*"
+
+
-- 
1.7.4




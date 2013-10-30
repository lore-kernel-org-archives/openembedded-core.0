Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 519F06D467
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 22:48:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9UMmrwP004415
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 15:48:53 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 30 Oct 2013 15:48:52 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 30 Oct 2013 17:48:11 -0500
Message-ID: <1383173291-4017-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] mtools, syslinux: add ability to compile with nativesdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Oct 2013 22:48:52 -0000
Content-Type: text/plain

For regenerating and ISO or EFI boot image the nativesdk needs mtools
and syslinux.

Both recipes are patched in one patch since syslinux requires
mtools.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-devtools/mtools/mtools_3.9.9.bb    |    9 +++++++--
 meta/recipes-devtools/mtools/mtools_4.0.18.bb   |   12 +++++++++---
 meta/recipes-devtools/syslinux/syslinux_6.01.bb |    2 +-
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
index 2213c17..8678a8b 100644
--- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
+++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
@@ -9,8 +9,12 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=92b58ec77696788ce278b044d2a8e9d3"
 PR = "r6"
 
-RDEPENDS_${PN} = "glibc-gconv-ibm850"
-RRECOMMENDS_${PN} = "\
+targetdepgconv = ""
+targetdepgconv_class-target = "glibc-gconv-ibm850"
+RDEPENDS_${PN} = "${targetdepgconv}"
+
+targetrecgconv = ""
+targetrecgconv_class-target = "\
 	glibc-gconv-ibm437 \
 	glibc-gconv-ibm737 \
 	glibc-gconv-ibm775 \
@@ -26,6 +30,7 @@ RRECOMMENDS_${PN} = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
+RRECOMMENDS_${PN} = "${targetrecgconv}"
 
 #http://mtools.linux.lu/mtools-${PV}.tar.gz 
 SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/mtools-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index dcd6066..602b3c0 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -6,8 +6,12 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 
-RDEPENDS_${PN} = "glibc-gconv-ibm850"
-RRECOMMENDS_${PN} = "\
+targetdepgconv = ""
+targetdepgconv_class-target = "glibc-gconv-ibm850"
+RDEPENDS_${PN} = "${targetdepgconv}"
+
+targetrecgconv = ""
+targetrecgconv_class-target = "\
 	glibc-gconv-ibm437 \
 	glibc-gconv-ibm737 \
 	glibc-gconv-ibm775 \
@@ -23,6 +27,8 @@ RRECOMMENDS_${PN} = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
+RRECOMMENDS_${PN} = "${targetrecgconv}"
+
 SRC_URI[md5sum] = "a23646617546bf6ad56f061d8b283c85"
 SRC_URI[sha256sum] = "59e9cf80885399c4f229e5d87e49c0c2bfeec044e1386d59fcd0b0aead6b2f85"
 
@@ -37,4 +43,4 @@ EXTRA_OECONF = "--without-x"
 
 PARALLEL_MAKEINST = ""
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
index 4438ea8..c6e83b5 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
@@ -65,4 +65,4 @@ FILES_${PN}-dev += "${datadir}/${BPN}/com32/lib*${SOLIBS} ${datadir}/${BPN}/com3
 FILES_${PN}-staticdev += "${datadir}/${BPN}/com32/lib*.a ${libdir}/${BPN}/com32/lib*.a"
 FILES_${PN}-misc = "${datadir}/${BPN}/* ${libdir}/${BPN}/* ${bindir}/*"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5



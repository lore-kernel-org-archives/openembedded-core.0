Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70B256E5DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t131CMvJ022779
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:23 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:12:04 -0800
Message-ID: <4c7d4c14211b80ba51556f2283f664d7d18f92c6.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/21] gzip 1.3.12: a few fixes
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:21 -0000
Content-Type: text/plain

* Let gzip_1.3.12.bb and gzip_1.6.bb use gzip.inc to remove duplicated
  code.
* Fixed for gzip_1.3.12.bb:
  WARNING: QA Issue: gzip requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
* Remove native extend from gzip_1.3.12.bb, keep gzip_1.6.bb's.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/gzip/gzip.inc       |    6 ------
 meta/recipes-extended/gzip/gzip_1.3.12.bb |   27 +--------------------------
 meta/recipes-extended/gzip/gzip_1.6.bb    |    8 ++++++++
 3 files changed, 9 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index b90856e..94480ec 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -4,12 +4,6 @@ project. Mark Adler wrote the decompression part"
 HOMEPAGE = "http://www.gnu.org/software/gzip/"
 SECTION = "console/utils"
 # change to GPLv3+ in 2007/07. Previous GPLv2 version is 1.3.12
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://gzip.h;beginline=8;endline=20;md5=6e47caaa630e0c8bf9f1bc8d94a8ed0e"
-
-SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
-SRC_URI_append_class-target = " file://wrong-path-fix.patch"
 
 inherit autotools texinfo
 
diff --git a/meta/recipes-extended/gzip/gzip_1.3.12.bb b/meta/recipes-extended/gzip/gzip_1.3.12.bb
index 45a33ff..e406282 100644
--- a/meta/recipes-extended/gzip/gzip_1.3.12.bb
+++ b/meta/recipes-extended/gzip/gzip_1.3.12.bb
@@ -1,8 +1,4 @@
-SUMMARY = "Standard GNU compressor"
-DESCRIPTION = "GNU Gzip is a popular data compression program originally written by Jean-loup Gailly for the GNU \
-project. Mark Adler wrote the decompression part"
-HOMEPAGE = "http://www.gnu.org/software/gzip"
-SECTION = "base"
+require gzip.inc
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
@@ -17,24 +13,3 @@ SRC_URI[md5sum] = "b5bac2d21840ae077e0217bc5e4845b1"
 SRC_URI[sha256sum] = "3f565be05f7f3d1aff117c030eb7c738300510b7d098cedea796ca8e4cd587af"
 
 PR = "r2"
-
-inherit autotools
-
-do_install_append () {
-	# move files into /bin (FHS)
-	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/gunzip ${D}${base_bindir}/gunzip
-	mv ${D}${bindir}/gzip ${D}${base_bindir}/gzip
-	mv ${D}${bindir}/zcat ${D}${base_bindir}/zcat
-	mv ${D}${bindir}/uncompress ${D}${base_bindir}/uncompress
-}
-
-inherit update-alternatives
-
-ALTERNATIVE_${PN} = "gzip gunzip zcat"
-ALTERNATIVE_LINK_NAME[gzip] = "${base_bindir}/gzip"
-ALTERNATIVE_LINK_NAME[gunzip] = "${base_bindir}/gunzip"
-ALTERNATIVE_LINK_NAME[zcat] = "${base_bindir}/zcat"
-ALTERNATIVE_PRIORITY = "100"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/gzip/gzip_1.6.bb b/meta/recipes-extended/gzip/gzip_1.6.bb
index 9c728df..b347f0b 100644
--- a/meta/recipes-extended/gzip/gzip_1.6.bb
+++ b/meta/recipes-extended/gzip/gzip_1.6.bb
@@ -1,5 +1,13 @@
 require gzip.inc
 
+LICENSE = "GPLv3+"
+
+SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
+SRC_URI_append_class-target = " file://wrong-path-fix.patch"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://gzip.h;beginline=8;endline=20;md5=6e47caaa630e0c8bf9f1bc8d94a8ed0e"
+
 PROVIDES_append_class-native = " gzip-replacement-native"
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
-- 
1.7.9.5



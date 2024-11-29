Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE32D729ED
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 15:33:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.117286.1732894424871327667
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 07:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2063098a0a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATE0Goj013179;
	Fri, 29 Nov 2024 15:33:31 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671at8y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Nov 2024 15:33:31 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 29 Nov 2024 07:33:30 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 29 Nov 2024 07:33:30 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>
Subject: [PATCH V2 1/2] gnupg: upgrade 2.5.0 -> 2.5.1
Date: Fri, 29 Nov 2024 07:33:29 -0800
Message-ID: <20241129153330.2203199-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lAEZjNH1PBmfWZZ-3_5ZpdQn4kJXuI27
X-Authority-Analysis: v=2.4 cv=TIS/S0la c=1 sm=1 tr=0 ts=6749decb cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=xNClMKtuDglbprIgsYkA:9
 a=N8Xg02xKa4WkyV1Z:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lAEZjNH1PBmfWZZ-3_5ZpdQn4kJXuI27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_14,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2411290127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 15:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208025

Due to upstream [build: Remove configure option --enable-gpg-is-gpg2][1],
drop option --enable-gpg-is-gpg2 and remove gpg2/gpgv2 installation

Due to upsream [doc: Remove included yat2m and build HTML versions of
the man pages.][2], it used standard detection on yat2m other than build
it from source. Because no native recipe provide yat2m in Yocto,
explicitly disable doc via option --disable-doc

[1] https://github.com/gpg/gnupg/commit/2125f228d36c0882a87bce433a18253154653d50
[2] https://github.com/gpg/gnupg/commit/60c541f5880e8c603ca9372d3ca8b7ad68b97018

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...1-Woverride-init-is-not-needed-with-gcc-9.patch |  2 +-
 ...c-use-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../gnupg/0001-fix-compile-failure-with-musl.patch | 11 ++++-------
 ...0002-use-pkgconfig-instead-of-npth-config.patch |  2 +-
 ...gen.sh-fix-find-version-for-beta-checking.patch |  2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch    |  4 ++--
 .../gnupg/{gnupg_2.5.0.bb => gnupg_2.5.1.bb}       | 14 +++-----------
 7 files changed, 15 insertions(+), 26 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.0.bb => gnupg_2.5.1.bb} (87%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 77d7507edc..024f4a9f10 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 6392cb71a23adfd601537049da4e5e06e51d2e50 Mon Sep 17 00:00:00 2001
+From 69d132c4cca738f148551af24932010fb1029ea1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 12b1447138..702cba4b71 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From a0e986b487891ef8e3bb41b95f969e00edd4923f Mon Sep 17 00:00:00 2001
+From d9ef954b602c17839c52a1d7dc73e2354e5fbbbb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index e4f8c0e..fa75ec8 100644
+index 29592fd..7286862 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1925,7 +1925,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1911,7 +1911,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
index fef05cf3c8..13c1a36366 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
@@ -1,4 +1,4 @@
-From 4a7d4d6e45c68708ec95335b0f11d6596b23095a Mon Sep 17 00:00:00 2001
+From 2e7534f3f7694ba426615b2061c235908097bb9b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 22 Aug 2024 15:31:16 +0800
 Subject: [PATCH] fix compile failure with musl
@@ -20,17 +20,14 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/scd/app.c b/scd/app.c
-index 926ab79..7bf58a2 100644
+index 525950e..7180178 100644
 --- a/scd/app.c
 +++ b/scd/app.c
-@@ -23,6 +23,7 @@
- #include <stdlib.h>
+@@ -24,6 +24,7 @@
  #include <string.h>
+ #include <unistd.h>
  #include <npth.h>
 +#include <unistd.h>
  
  #include "scdaemon.h"
  #include "../common/exechelp.h"
--- 
-2.27.0
-
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 945abb55ff..a7a6f03c7d 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From fa93b5f7c2da0e5846b80de9c6296966ca2a3d83 Mon Sep 17 00:00:00 2001
+From d5fc05998d7260fd94a558c53f6e6c35a384d163 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index 761fd6c608..8aeb87dfd4 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From e8f67e3bbbdbaa17cfe88c1f7a8f488eb4936281 Mon Sep 17 00:00:00 2001
+From 21396a6e74d188a2198439aa27403c29c1dbcea8 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 5c4d81f87a..6fcbc2d18f 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 4e556a5edde8a97312abae63f8e9b5f989ca5c91 Mon Sep 17 00:00:00 2001
+From 3c761174b0ec6f49f184f16a0b0eaade44264edc Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 3929108..d3a7b8f 100644
+index a73182e..9994a9a 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
 @@ -1439,7 +1439,7 @@ gnupg_socketdir (void)
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.0.bb b/meta/recipes-support/gnupg/gnupg_2.5.1.bb
similarity index 87%
rename from meta/recipes-support/gnupg/gnupg_2.5.0.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.1.bb
index 9cfdbdf0a4..080056f74c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.0.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.1.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "2222c827d4e7087f15e7f72739d004abc1d05c6c5f0a5a12b24c6a6cc5d173fb"
+SRC_URI[sha256sum] = "8a34bb318499867962c939e156666ada93ed81f01926590ac68f3ff79178375e"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
@@ -32,17 +32,14 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-bzip2=${STAGING_LIBDIR}/.. \
 		--with-readline=${STAGING_LIBDIR}/.. \
 		--with-mailprog=${sbindir}/sendmail \
-		--enable-gpg-is-gpg2 \
 		--disable-tests \
+		--disable-doc \
                "
-# yat2m can be found from recipe-sysroot-native non-deterministically with different versioning otherwise
-CACHED_CONFIGUREVARS += "ac_cv_path_YAT2M=./yat2m"
 
 # A minimal package containing just enough to run gpg+gpgagent (E.g. use gpgme in opkg)
 PACKAGES =+ "${PN}-gpg"
 FILES:${PN}-gpg = " \
 	${bindir}/gpg \
-	${bindir}/gpg2 \
 	${bindir}/gpg-agent \
 "
 
@@ -62,11 +59,6 @@ do_configure:prepend () {
 	rm -f ${S}/m4/libgcrypt.m4
 }
 
-do_install:append() {
-	ln -sf gpg2 ${D}${bindir}/gpg
-	ln -sf gpgv2 ${D}${bindir}/gpgv
-}
-
 do_install:append:class-native() {
 	create_wrappers ${STAGING_BINDIR_NATIVE}
 }
@@ -76,7 +68,7 @@ do_install:append:class-nativesdk() {
 }
 
 create_wrappers() {
-	for i in gpg2 gpgconf gpg-agent gpg-connect-agent; do
+	for i in gpg gpgconf gpg-agent gpg-connect-agent; do
 		create_wrapper ${D}${bindir}/$i GNUPG_BINDIR=$1
 	done
 }
-- 
2.25.1



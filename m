Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE7BC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 02:34:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.196485.1672281284673948056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 18:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=O3YKqabJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0362acaf19=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BT2MST3031355
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 02:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=7EXvjAzTb3sxoOz245w7h6Snp3vqwhyCdDFgQQn336g=;
 b=O3YKqabJBiiFEkPydrYTxVSfDaDmQZyykk6ynx4rUe4Mxbtwt7ZFnxEweJdw132cnhYQ
 DMTDC3dCf59rtTi618woh5B2F40OrWmyt0oMvwgCGPQ6VMfeWoXNoxpFyVb6jxGWAfaS
 bmgjip3OcRqD9AuThwlND1kZkzFSSr5Z+zy3bxhPQ3lI/QjgsUFVCbvoNxhzRur2uIAH
 xp9TFl69gytzDix4cCs3i3DRI0oFZSCtEIy+F2CRdk5+4VrFRPWGWesdFXkPuBMObqdN
 L4aNgclmFNABQFEuqduQYtCiBqkonY3wChJErPNM5WwXluHdp9Y/saeFQRv+XWEZiTGP rw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn32snp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 02:34:43 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 28 Dec 2022 18:34:41 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 28 Dec 2022 18:34:40 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] cmake-native: use internal cmcurl library
Date: Thu, 29 Dec 2022 10:34:41 +0800
Message-ID: <20221229023442.2520067-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2eApAlNveJxS9jv6wt7DohpOgSV_t-DN
X-Proofpoint-GUID: 2eApAlNveJxS9jv6wt7DohpOgSV_t-DN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_01,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=925 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212290017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 02:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175089

From: Changqing Li <changqing.li@windriver.com>

This commit is for breaking circular dependency in following condition:
After enabling PACKAGECONFIG nghttp2 for curl, the dependency chain is:
curl-native -> nghttp2-native -> cmake-native -> curl-native.
So change to use internal cmcurl library to fix this. And as using
system curl library before, disable nghttp2 and use system openssl
library for cmcurl.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../cmake/cmake-native_3.25.1.bb              |  8 +++--
 ...1-CMakeLists.txt-disable-USE_NGHTTP2.patch | 31 +++++++++++++++++++
 2 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.25.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.25.1.bb
index bcc87eb8f2..c150aef5ef 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.25.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.25.1.bb
@@ -1,21 +1,23 @@
 require cmake.inc
 inherit native
 
-DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native ncurses-native zstd-native"
+DEPENDS += "bzip2-replacement-native xz-native zlib-native ncurses-native zstd-native openssl-native"
 
 SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
             file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
             file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
+            file://0001-CMakeLists.txt-disable-USE_NGHTTP2.patch \
             "
 
-LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause"
+LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause & curl"
 LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
     file://Utilities/cmlibarchive/COPYING;md5=d499814247adaee08d88080841cb5665 \
     file://Utilities/cmexpat/COPYING;md5=9e2ce3b3c4c0f2670883a23bbd7c37a9 \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
     file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
+    file://Utilities/cmcurl/COPYING;md5=190c514872597083303371684954f238 \
 "
 
 B = "${WORKDIR}/build"
@@ -30,9 +32,9 @@ CMAKE_EXTRACONF = "\
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_CURL=0 \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
-    -DCURL_LIBRARIES=-lcurl \
 "
 
 do_configure () {
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
new file mode 100644
index 0000000000..d6486cb45f
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -0,0 +1,31 @@
+From 3fd6082c52a8140db5995afb59fb391f7d5c19d7 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 28 Dec 2022 17:51:27 +0800
+Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
+
+nghttp2 depends on cmake-native to build, to break circular
+dependency, disable nghttp2.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Utilities/cmcurl/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
+index f842270b..17b1ce19 100644
+--- a/Utilities/cmcurl/CMakeLists.txt
++++ b/Utilities/cmcurl/CMakeLists.txt
+@@ -68,7 +68,7 @@ set(ENABLE_UNIX_SOCKETS OFF CACHE INTERNAL "No curl Unix domain sockets support"
+ set(HTTP_ONLY OFF CACHE INTERNAL "Curl is not http-only")
+ set(PICKY_COMPILER OFF CACHE INTERNAL "Enable picky compiler options")
+ set(USE_LIBIDN2 ON)
+-set(USE_NGHTTP2 ON)
++set(USE_NGHTTP2 OFF)
+ set(USE_NGTCP2 OFF)
+ set(USE_QUICHE OFF)
+ set(USE_WIN32_IDN OFF)
+-- 
+2.25.1
+
-- 
2.25.1



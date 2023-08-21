Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3827EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 02:37:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2857.1692585418793079076
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Aug 2023 19:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pJpSmjHz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7597687dec=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37L1YphD018344
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 02:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=y4l9w
	sMVz9feDZcvfpSiGKM6711UD+bD+RjsO+1TG3I=; b=pJpSmjHzUWLy/KYfDr3FG
	PJKt+wl28fU0pXaQqak5O8ugxnk3Y25kmgOxlYq7ZF9mCWuyqBA0gzvTdQl09XZ0
	AsvxI0hvSquyIKdFlzgFDerPn5K/RnXQXpmB7qLs9qkZjVhrUTvhnhU7YTvxFmz1
	5c/8uK8pGYM2JqVR3H93jAI3lwHAPo7yVGwJse8tcji4TnJSx5UTJOFzKlF/7VvY
	oT6qcVHkzBIa9zmafnF7L3nsfKVTTzAdOAK1QdFY8HeUFHXG5dyyrKURgH7w5xcl
	gxKU+QPis9jceeTcKTH2JaH+2U8zW4ALoIX+jqehQPSoUnUy8MzwxSM0QEX3LCiB
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sjmq5h73q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 02:36:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 20 Aug 2023 19:36:56 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Sun, 20 Aug 2023 19:36:55 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] llvm: remove libLTO.so.*
Date: Mon, 21 Aug 2023 10:36:52 +0800
Message-ID: <20230821023652.47360-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nCtb6-jeqawlzEe_fLC7_w3QyokZQSjQ
X-Proofpoint-ORIG-GUID: nCtb6-jeqawlzEe_fLC7_w3QyokZQSjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-20_15,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 adultscore=0 mlxlogscore=625
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308210023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 02:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186419

From: Kai Kang <kai.kang@windriver.com>

Remove libLTO.so.* from llvm which should be provided by clang and
packaged to llvm-linker-tools. It could avoids the error:

ERROR: clang-16.0.6-r0 do_create_spdx: The recipe clang is trying to
       install files into a shared area when those files already exist.
       Those files and their manifest location are:
  /path_to/tmp/deploy/spdx/core2-64/packages/liblto16.spdx.json
    (matched in manifest-core2-64-llvm.create_spdx)
Please verify which recipe should provide the above files.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index f3d6f24bd2..ce9ebfa997 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -106,7 +106,7 @@ do_compile() {
 
 do_install() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false', d)}; then
-	DESTDIR=${D} ninja -v install
+        DESTDIR=${D} ninja -v install
 
         # llvm harcodes usr/lib as install path, so this corrects it to actual libdir
         mv -T -n ${D}/${prefix}/lib ${D}/${libdir} || true
@@ -117,6 +117,10 @@ do_install() {
 
         # reproducibility
         sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
+
+        # remove libLTO.so.* which should be provided by clang and packaged to
+        # llvm-linker-tools
+        rm -f ${D}/${libdir}/libLTO.so.*
     fi
 }
 
@@ -134,7 +138,7 @@ llvm_sysroot_preprocess() {
 	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
 
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks"
 
 RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
 
@@ -146,10 +150,6 @@ FILES:${PN}-libllvm = "\
     ${libdir}/libLLVM-${MAJOR_VERSION}.so \
 "
 
-FILES:${PN}-liblto += "\
-    ${libdir}/libLTO.so.* \
-"
-
 FILES:${PN}-liboptremarks += "\
     ${libdir}/libRemarks.so.* \
 "
-- 
2.34.1



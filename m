Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C5CC2BA18
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 06:34:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.50588.1718606078340904261
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 23:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6898887b7c=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H5udN2011983
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:38 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ysafg1634-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:37 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 16 Jun 2024 23:34:37 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 16 Jun 2024 23:34:36 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 5/8] cdrtools-native: fix build with gcc-14
Date: Mon, 17 Jun 2024 14:34:28 +0800
Message-ID: <20240617063431.2221035-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617063431.2221035-1-changqing.li@windriver.com>
References: <20240617063431.2221035-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xJ-r3SPzjoEksyJkwG90mWW-3tF55ZuT
X-Proofpoint-ORIG-GUID: xJ-r3SPzjoEksyJkwG90mWW-3tF55ZuT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_05,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=857 clxscore=1015
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406170049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 06:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200791

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
http://errors.yoctoproject.org/Errors/Details/770525/
| checking whether the C compiler (gcc  -isystem/OE/build/oe-core/tmp-glibc/work/x86_64-linux/cdrtools-native/3.01/recipe-sysroot-native/usr/include -O2 -pipe ) works... no
| configure: error: installation or configuration problem: C compiler cannot create executables.
| RULES/rules.cnf:70: incs/amd-ryzen-threadripper-3970x-32-core-processor-linux-cc/rules.cnf: No such file or directory
| make: *** [RULES/rules.cnf:59: incs/amd-ryzen-threadripper-3970x-32-core-processor-linux-cc/rules.cnf] Error 1
| make: *** Waiting for unfinished jobs....

where config.log show it's caused by gcc-14:

configure:1189: checking whether the C compiler (gcc  -isystem/OE/build/oe-core/tmp-glibc/work/x86_64-linux/cdrtools-native/3.01/recipe-sysroot-native/usr/include -O2 -pipe ) works
configure:1211: gcc  -o conftest -isystem/OE/build/oe-core/tmp-glibc/work/x86_64-linux/cdrtools-native/3.01/recipe-sysroot-native/usr/include -O2 -pipe  -D_GNU_SOURCE  conftest.c   1>&5
configure:1208:1: error: return type defaults to 'int' [-Wimplicit-int]
configure: failed program was:

main(){return(0);}

(From OE-Core rev: 094273bd7d1768e14fbdcd2f239bee14c630a625)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index bf8be1ad0c..0fe661ae6a 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -19,13 +19,17 @@ SRC_URI = " \
 SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
 SRC_URI[sha256sum] = "ed282eb6276c4154ce6a0b5dee0bdb81940d0cbbfc7d03f769c4735ef5f5860f"
 
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+EXTRA_OEMAKE = "-e MAKEFLAGS= CPPOPTX='${CPPFLAGS}' COPTX='${CFLAGS}' C++OPTX='${CXXFLAGS}' LDOPTX='${LDFLAGS}' GMAKE_NOWARN='true'"
 
 # Stop failures when 'cc' can't be found
 export ac_cv_prog_CC = "${CC}"
 
 inherit native
 
+# Use -std=gnu89 to build with gcc-14 (https://bugs.gentoo.org/903876)
+# this needs to be after native inherit (which sets CFLAGS to BUILD_CFLAGS)
+CFLAGS += "-std=gnu89"
+
 do_configure() {
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/autoconf
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/autoconf
-- 
2.25.1



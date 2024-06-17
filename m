Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C350DC27C7B
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 06:34:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.50590.1718606081215974913
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 23:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6898887b7c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H4exib022635
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:41 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys682ha6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 23:34:40 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 16 Jun 2024 23:34:40 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 16 Jun 2024 23:34:39 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 8/8] expect-native: fix build with gcc-14
Date: Mon, 17 Jun 2024 14:34:31 +0800
Message-ID: <20240617063431.2221035-9-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617063431.2221035-1-changqing.li@windriver.com>
References: <20240617063431.2221035-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _zMg5XK6dWF8UUbrS9u_vRQ3wMSlna2a
X-Proofpoint-GUID: _zMg5XK6dWF8UUbrS9u_vRQ3wMSlna2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_05,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406170049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 06:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200794

From: Changqing Li <changqing.li@windriver.com>

* do_configure failed with gcc-14:
error in build/config.log:
conftest.c:56:3: error: return type defaults to 'int' [-Wimplicit-int]
conftest.c:59:5: error: implicit declaration of function 'exit' [-Wimplicit-function-declaration]

* this recipe set "BBCLASSEXTEND = "native nativesdk", causes "CFLAGS +="
setting not take effect, use append instead.
snip of bitbake expect-native -e:
   set /layers/oe-core/meta/conf/documentation.conf:110
     [doc] "Flags passed to the C compiler for the target system. This variable evaluates to the same as TARGET_CFLAGS."
   append /layers/oe-core/meta/recipes-devtools/expect/expect_5.45.4.bb:87
     "-Wno-error=incompatible-pointer-types"
   set /layers/oe-core/meta/classes-recipe/native.bbclass:44
     "${BUILD_CFLAGS}"
   override[pn-gtk4]::append[toolchain-clang] /layers/meta-clang/conf/nonclangable.conf:336
     " -Wno-error=int-conversion"
   override[pn-pidgin-sipe]::append[toolchain-clang] /layers/meta-clang/conf/nonclangable.conf:340
     " -Wno-error=cast-function-type-strict"
 pre-expansion value:
   "${BUILD_CFLAGS}"
export CFLAGS="-isystem/build/tmp-glibc/work/x86_64-linux/expect-native/5.45.4/recipe-sysroot-native/usr/include -O2 -pipe"

This patch is rejected on master, refer [1], and need to rework based on
this new change [2]. scarthgap branch doesn't have commit [2], so still use
this patch for now.

[1] https://patchwork.yoctoproject.org/project/oe-core/patch/20240613061859.3777324-1-changqing.li@windriver.com/#19943
[2] https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=9a8522723de8caac35d552abf1fb3061ca5dace2

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 18904ebc10..5e7b352196 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -84,4 +84,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 # http://errors.yoctoproject.org/Errors/Details/766950/
 # expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)' [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
+CFLAGS:append = " -Wno-error=incompatible-pointer-types"
+
+# Fix expect-native configure tests are failing with gcc-14
+CFLAGS:append:class-native = " -Wno-error=implicit-int -Wno-error=implicit-function-declaration"
-- 
2.25.1



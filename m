Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BC5D6554E
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 11:08:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12342.1765969687136773801
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 03:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LYJ9W9Sa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4otlM2431588
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 11:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ej9AM2+Xx76EnF6APD7SgX+FsbbLccl4Es8lpPiu23g=; b=LYJ9W9SaKYvV
	JinxPZbaDGPnHBB5xmlXNuUhlABCymrZxXkSI5cgaOypp4O3cCOw6MrzKDqHA8SI
	riY2j06dqeC8LJelTMAC+/hmFfXV7EDOOLBb+Rik9x0yQh/UuYtCAIzHh1VLZ6aD
	fnOXNAdFGIBnbBpsPxhMqTb/rsiZlSEcS7khRdMNgEfDrGgPz6b4wDYgemgFkYkz
	TNn2P88lSipv57LASixcE9FFR0I+3lBUzePj94ofWL/zPjORL18ZwsIVenTo3hGW
	YQcD7zpCv75QP79M7z5DxF7wrm0aOW6VAb1JKdXu7W3x+HBin5V8KGEtjufFNXDX
	cCGV291ECw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0brf10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 11:08:05 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 17 Dec 2025 03:08:04 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 17 Dec 2025 03:08:04 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/2] webkitgtk: workaround compile failure for large debug symbols
Date: Wed, 17 Dec 2025 19:08:03 +0800
Message-ID: <20251217110803.294900-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANNYZj9KkDgBPB1AoJxk0F3nfZ+Mv6h48d9ssuFrFXxzJ5eGbA@mail.gmail.com>
References: <CANNYZj9KkDgBPB1AoJxk0F3nfZ+Mv6h48d9ssuFrFXxzJ5eGbA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OCBTYWx0ZWRfX3UR5yzqvvTKV
 Y3OEN1VUQUiC5rOZunDm5jrSqvRkEKl+6ZEDkpVqJG56h6TGNxLmOryh+oF1PJzD1QZaQbLse98
 CJNAY4GXlc2nffSkkdwI/9PjXINa+ze0YRSZ1q+4/K9saIjhYTwgNrj049uuevwA8qnIVT2ABXy
 4HCNJhRWsYAw/8o2UFGeIwD4cRFG0A6BKyhKFWzWL6COzTOttuC22wmMvUYV4aaKrkigdAqmuGk
 1DTk6qOgRupnO1Lp8QvPgPf/wuzHxIzte8h8WO3MbYNCFGM/idad1jgtgekM60XCFb9GeNgcjep
 DrG3lUK6AqFpcxluw8neR7NSQzU97nRM900wd3skdmef4Iv7L7aIXBaKuJgcJmhPijrqNyugl3A
 aoS/VQSMZCBpo4s+hKpJmtV2ckl4ag==
X-Proofpoint-ORIG-GUID: n65awTtCISxk40iUgBbwbn_Jy-58SaoA
X-Proofpoint-GUID: n65awTtCISxk40iUgBbwbn_Jy-58SaoA
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=69428f15 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=CCpqsmhAAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=mupqnnQ7v2RyMK8TVT4A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 11:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228025

Originally, we move space optimize from recipe webkitgtk to
yocto-space-optimize.inc [1], it caused multiple build failures
if not include yocto-space-optimize.inc

For qemux86-64: "relocation truncated to fit: R_X86_64_32 against `.debug_info'"
For qemuarm64: "relocation truncated to fit: R_AARCH64_ABS32 against `.debug_info'"

According to the suggestion of gcc [2], pass -g1 to massively reduce the size of
the debug symbols to workaround the errors

Remove duplicate setting from yocto-space-optimize.inc at the same time.

[1] https://git.openembedded.org/openembedded-core/commit/meta?id=007c4aea10e13bd9b2d66d016c25f31c2709cbf6
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=15444

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/yocto-space-optimize.inc | 3 ---
 meta/recipes-sato/webkit/webkitgtk_2.50.0.bb      | 7 +++++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-space-optimize.inc b/meta/conf/distro/include/yocto-space-optimize.inc
index 9e092df32a..b83ba426e7 100644
--- a/meta/conf/distro/include/yocto-space-optimize.inc
+++ b/meta/conf/distro/include/yocto-space-optimize.inc
@@ -8,6 +8,3 @@ DEBUG_LEVELFLAG:pn-clang-native = ""
 DEBUG_LEVELFLAG:pn-nativesdk-clang = ""
 # With -g, qemu workdir is 10GB, qemu-dbg is 363MB
 DEBUG_LEVELFLAG:pn-qemu = ""
-# Pass -g1 to massively reduce the size of the
-# debug symbols (4.3GB to 700M at time of writing)
-DEBUG_LEVELFLAG:pn-webkitgtk = "-g1"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
index c0e9ea3624..b4173c08dd 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
@@ -175,3 +175,10 @@ src_package_preprocess () {
 
 # Clang-20 issue - https://github.com/llvm/llvm-project/issues/132322
 TOOLCHAIN:arm = "gcc"
+
+# Pass -g1 to massively reduce the size of the
+# debug symbols (4.3GB to 700M at time of writing)
+# workaround error:
+# qemux86-64: "relocation truncated to fit: R_X86_64_32 against `.debug_info'"
+# qemuarm64: "relocation truncated to fit: R_AARCH64_ABS32 against `.debug_info'"
+DEBUG_LEVELFLAG = "-g1"
-- 
2.34.1



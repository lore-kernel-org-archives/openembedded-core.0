Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F130D64087
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 07:27:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9106.1765956419675685057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 23:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f/HDkBfC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4AuSV2367653
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=wmYHrG39qqJgYjXGkcw0jWcDNryp/UpXqDlZT9OoVms=; b=f/HDkBfCak/G
	4alQfE5ZYJdS4px7TgfrNoe1PKiFuJBpn9gmCv75KZ0lXZJ8O86bb53hBa/MwYuo
	HCJpovZm6TP3QzR4T94mapdoOy7OIybspH3lPxpMXj6mGGWkUCkficwv/bWcTkwN
	xo0XHA3cOiY4WBi6KKJEenSeuqn3Iy6yqiFdjR8jd2Ahzg+wTR1r7b4JL9iPrSE1
	wCBqdC0JK8N7mze9npp6KD8a1GDfkBpewURxJsxpz5sDXCB3arKqO8SG09TRBc5+
	g/ZPUBdpHxzUsUoASDa32Hz+evAGABvjG92ZywU6RwiXtfR16rm4EAOzlPihBxFX
	QoJdGIrojA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0br8bx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:26:57 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Dec 2025 23:26:57 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Dec 2025 23:26:56 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] webkitgtk: workaround compile failure for large debug symbols
Date: Wed, 17 Dec 2025 15:26:54 +0800
Message-ID: <20251217072654.326736-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217072654.326736-1-hongxu.jia@windriver.com>
References: <20251217072654.326736-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1NyBTYWx0ZWRfX/tM+VgUue6gb
 eWKSmyXZin5Mh0mTfAkfcJMQTL0Q07Y3oJ9X6G9+ZvGDh9VWvikVEPp3Iwjy5a7MwuvTzppbpNs
 gE5Yd2gBtRVsfZze2ufsCCr8pl/qcxJWPyPe1NnFFtiYopuojQIx4uL7SBosNDxf04IJJTZKv87
 9diUDS2NtBor1g6Z8WoQ4KC8K01X16H85SDb00Qq/5+7QQnUTrZc1nRSi2QOm7vTJ6qWKghoNs9
 U/CIx0ypcJ7dDQpFg6NGN9zgSVNp3vwyH4O/ofltAr1gMclhoKujuaPht4bmny6PS+vNO5BOlI6
 /JuQ/TZukgs0Nr4o0j34INOSzv6zEcZpaKLmMpt+ywbmwDRUNpz/pD7K+nLV4cemi2g7bwmghHf
 mLv/OidZaxhrIcqhoB2DOFCr6NnTrQ==
X-Proofpoint-ORIG-GUID: nh_LD_dGI6Iwb6TspCDFEW-tdlL64FEp
X-Proofpoint-GUID: nh_LD_dGI6Iwb6TspCDFEW-tdlL64FEp
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=69425b41 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=CCpqsmhAAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=0ySkXbpQjzFpZnw-5VYA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228001

Originally, we move space optimize from recipe webkitgtk to
yocto-space-optimize.inc [1], it caused multiple build failures
if not include yocto-space-optimize.inc

For qemux86-64: "relocation truncated to fit: R_X86_64_32 against `.debug_info'"
For qemuarm64: "relocation truncated to fit: R_AARCH64_ABS32 against `.debug_info'"

According to the suggestion of gcc [2], pass -g1 to massively reduce the size of
the debug symbols to workaround the errors

[1] https://git.openembedded.org/openembedded-core/commit/meta?id=007c4aea10e13bd9b2d66d016c25f31c2709cbf6
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=15444

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.50.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
index 5389bf17db..a8d0a094b3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
@@ -174,3 +174,10 @@ src_package_preprocess () {
 
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



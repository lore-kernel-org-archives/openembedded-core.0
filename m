Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA70C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 08:20:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3019.1743582057927273854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 01:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61878b757d=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53268T8V022315
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 01:20:57 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtf2ggdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 01:20:57 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 2 Apr 2025 01:20:55 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] curl: ignore CVE-2025-0725
Date: Wed, 2 Apr 2025 08:20:01 +0000
Message-ID: <20250402082001.3926187-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.31.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: lJEGxw49t-xJJiikubvJBp5oDVWRMnnl
X-Proofpoint-GUID: lJEGxw49t-xJJiikubvJBp5oDVWRMnnl
X-Authority-Analysis: v=2.4 cv=fM453Yae c=1 sm=1 tr=0 ts=67ecf369 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=XR8D0OoHHMoA:10 a=ugkhXdxtAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=H2dG1GdoG4qykc44DYYA:9
 a=-pyJRK1rBMoA:10 a=VinBSYM5t5AA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504020052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214229

From: Yogita Urade <yogita.urade@windriver.com>

CVE-2025-0725 can only trigger for curl when using a runtime
zlib version 1.2.0.3 or older and kirkstone supports
zlib 1.2.11 version, hence ignore cve for kirkstone.

Reference:
https://curl.se/docs/CVE-2025-0725.html
https://git.openembedded.org/openembedded-core/commit/?h=scarthgap&id=8c3b4a604b40260e7ca9575715dd8017e17d35c0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-support/curl/curl_7.82.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index cda42da4d3..748afc1235 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -73,6 +73,8 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 CVE_CHECK_IGNORE += "CVE-2023-42915"
 # ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack
 CVE_CHECK_IGNORE += "CVE-2024-32928"
+# ignored: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older
+CVE_CHECK_IGNORE += "CVE-2025-0725"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
2.40.0



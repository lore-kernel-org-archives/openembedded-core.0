Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805B3CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 09:29:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2848.1761730169234351593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 02:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PD/tsjLX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3397170073=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T6kbYC3040806
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 09:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=6E1AjBpaq9gobFySRni+
	b0Afb4hP3rulo96qoOq/HhA=; b=PD/tsjLXhtajfI/eOazt5moWEBUpSBzL7i8+
	jIEcT3nsNjYFADEQZta/G4uVjiLETwcTa7HZqgg6XMgnnKHD4f1BTCJTGCdG/euB
	IDrQDJpoKkPwgrXyu3Fdou6BpagmfIxdR17jGGxtqBTjC3I/ahCFD4kjSGZ+jzoe
	FWWNvfnNH4VR+R8N5P20gHQ8dvQsa00Z79Q/d3DtFq0Rp+M7xgEe6DadCVc4+acH
	ufKoPBIbVn5Jd7rwuwsIyD3p6Ne/FD/FPzVc4wLCDdAf3ojGE/sea84sF/mSniQ0
	aFQM6/Y+r7LE62CQ5WCNZix5Yy0TYlXNtuQIl1C95J8vTckdzA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3489gmhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 09:29:27 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 29 Oct 2025 02:29:25 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] tiff: ignore CVE-2025-8961
Date: Wed, 29 Oct 2025 14:59:05 +0530
Message-ID: <20251029092905.2278860-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: R862TCaU3_qFxyr4ZqT9k4BeC_52XU4X
X-Proofpoint-ORIG-GUID: R862TCaU3_qFxyr4ZqT9k4BeC_52XU4X
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=6901de78 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=b0O7WcNX0SUwFqbR8kMA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22
 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MCBTYWx0ZWRfX/qQv9YzvlU46
 ZGHLEuRaGNyrRHyaOPQeA7ZEmPker5xoc7z1juaQf7QvLw4AjJTQlYdh5TuYeMIVd2IvNLOyhmP
 xymLALSPfwYmCRnFiujrdhcfLTwwej3ynaO2mkFgeBBSOmTf3L/vTSHfm+URuvfuCBPjnt8fUlx
 ab6RP4NdrvS3DeeM/fKZtKtIJFdzVxVgo1xcYz6gm627c2eECsmd4Wp9V0hlqyEmhcWvnIM7oOk
 yRpQYNLY1FZT0zWWu8PKqTrSSQes37jt/5hSrVLhgg0D1ngwXF7Or3T6cTqp2j0qQNbasOacHRp
 hCjRFfC7sSjcx9FvmDFGB5xQpYEc6ZaHg5cMnT/f7bse3UCewcP8QZHw88u0IdKkgB6PrekH6tl
 PZVRox1+7yoDnuy7SigIlE3yYqxg+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 09:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225438

From: Yogita Urade <yogita.urade@windriver.com>

This CVE is for the tool which is removed in v4.6.0 via [1] and
re-introduced again in v4.7.0 via [2].

[1] https://gitlab.com/libtiff/libtiff/-/commit/eab89a627f0a65e9a1a47c4b30b4802c80b1ac45
[2] https://gitlab.com/libtiff/libtiff/-/commit/9ab54a858049bef020d578c71d82669531551c00

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 9957699fb2..777783d7cc 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -29,7 +29,7 @@ CVE_STATUS[CVE-2015-7313] = "fixed-version: Tested with check from https://secur
 CVE_STATUS[CVE-2023-3164] = "cpe-incorrect: Issue only affects the tiffcrop tool not compiled by default since 4.6.0"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_REMOVED_TOOLS"
-CVE_STATUS_REMOVED_TOOLS = "CVE-2024-13978 CVE-2025-8176 CVE-2025-8177 CVE-2025-8534 CVE-2025-8851"
+CVE_STATUS_REMOVED_TOOLS = "CVE-2024-13978 CVE-2025-8176 CVE-2025-8177 CVE-2025-8534 CVE-2025-8851 CVE-2025-8961"
 CVE_STATUS_REMOVED_TOOLS[status] = "cpe-incorrect: tools affected by these CVEs are not present in this release"
 
 inherit autotools multilib_header
-- 
2.40.0



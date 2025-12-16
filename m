Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF13D5CCB4
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:57:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18784.1765879061618289195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L2YyWRUH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444550a79e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG70I85270478
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=l3RqRR8Uu3A+/vd9++IbGrN83kohljgTwcDJQkBo8mM=; b=
	L2YyWRUHn6Vf4r1EAWoIIxs7PAB4sGHwjpDRUiFgcv6S483sNPLaXYZZNFXxP+DT
	Qz6X1ol3mljc2GmdngY1lIncGzkwsqiAymCrbWdsHkVvZFuunq+5AlQj42IYUrl5
	2oNN7Em1hs18k7Y9x60WvRhkikeoI1p59LLBz1elz7xzjb+D1AieMNEB7UhnMJ40
	f5IuqtzwBOd5QXcBaEdlD8psyu8DyxaiYTkn6PC83fu8JlXsSpPFzi2tb0xkLiHT
	CdTdGYnW7XVxh03/0VcVp/py3O2bpZZqKFpnMvlvOcCe8B2eGyQRIscjDOxT05yU
	4YU+M7ytrUeMM2ZGefLYtQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0y48axts-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:57:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Dec 2025 01:57:39 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Dec 2025 01:57:39 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [PATCH 1/1] strace: 6.17 -> 6.18
Date: Tue, 16 Dec 2025 01:57:39 -0800
Message-ID: <1fc8161d254e37709e63cf9d07ebd32a2f1023cc.1765878985.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1765878985.git.liezhi.yang@windriver.com>
References: <cover.1765878985.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA4MyBTYWx0ZWRfX6/rDN6rVBBCb
 Wfo2HvzHyJytG1iWpxBuDtmkK9DT1c5P/noJPmlm9WCWZNvz9uw9FUgOjvwSrC9/h5l6+XvNNQX
 depws1sJd1VYNMNaZsNnX+QMvyhRvb3DSYqqTPmD1DAlcVMkhouh0RZtDv+pEvfADKpSQfqQte4
 /NCjynuhh90kTeASc+QHUFet3Jx9rEBtWEydj6k4DkBmfM+JfHM6SZeZZaZO7Nb2nqifMK00Sxv
 TkfAb0z8DK3dxhjv9AKuCg8vFJ3HozsxW4LCitnn68z2zL9r7+wok3xXeo6614iVBEJXx0MwAIl
 VlecwWq9YLk6WElB4tLcJWnLfXsb0JaMcwyciGRErz1se76AkepXisgkDnX/rthhIimdA8Bx1TL
 RKNe/tySaTN0pJM5llcUmg4p0Q8/dg==
X-Proofpoint-GUID: U9cPu_XB0BG5TjeaD2wye0jBCVmeUJoO
X-Proofpoint-ORIG-GUID: U9cPu_XB0BG5TjeaD2wye0jBCVmeUJoO
X-Authority-Analysis: v=2.4 cv=e5ILiKp/ c=1 sm=1 tr=0 ts=69412d14 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=pGQt5fxMxu41UZIokuEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227939

From: Robert Yang <liezhi.yang@windriver.com>

The 6.17 has 27 failed test cases, and 6.18 only has 2 failed ones:
FAIL: bpf.gen.test
FAIL: bpf-v.gen.test

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/strace/{strace_6.17.bb => strace_6.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_6.17.bb => strace_6.18.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace_6.17.bb b/meta/recipes-devtools/strace/strace_6.18.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_6.17.bb
rename to meta/recipes-devtools/strace/strace_6.18.bb
index b6fda2b8ce..dfb07c3a73 100644
--- a/meta/recipes-devtools/strace/strace_6.17.bb
+++ b/meta/recipes-devtools/strace/strace_6.18.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
 SRC_URI:append:libc-musl = "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
-SRC_URI[sha256sum] = "0a7c7bedc7efc076f3242a0310af2ae63c292a36dd4236f079e88a93e98cb9c0"
+SRC_URI[sha256sum] = "0ad5dcba973a69e779650ef1cb335b12ee60716fc7326609895bd33e6d2a7325"
 
 inherit autotools github-releases ptest
 
-- 
2.49.0



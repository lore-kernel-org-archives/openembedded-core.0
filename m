Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FF5E67A7A
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:56:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12732.1772521008991714074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hSPf56kQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235o2sK1630804
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 06:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=TeHBM2Llhl2Oew8mLVjrgNKjya+Mnfo0bdcb+DDXaWc=; b=hSPf56kQ8ndU
	HFJlbyRN8dyTWoKT9J/n6lFG6xYmyIr5IxXlwJPUNYkaJopjQccXZX7SkxrBdJO8
	eIR648lIqXHO1Rt+XJEETMdzdLxUYxbKqMfqnEvdK55V4oHR7+zIfVZ7KSyhEEIV
	Fd0KaXv3M4JTERYCL0TvpsL1OhA2PWhYm17apbz4JzvwWaG4Gu7LnDTV8rxu66jv
	5VfD4aoltwvAsqZ98/yn+XfZTqHHxShGkBgKLhvNKli0MCRPmXb2TeqB1v/mW/I9
	dai85Ez34MunTj3WR+/iTadjTChbDBXpUXxNeXatskqYWWVcMJcFoe1etXKq4WLQ
	bH6H9KBl7Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4kac3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:47 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:47 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 06/19] gn: upgrade to latest revision
Date: Tue, 3 Mar 2026 14:56:27 +0800
Message-ID: <20260303065640.2541884-6-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a6862f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=Oh2cFVv5AAAA:8
 a=L-7R87BqEHHg_HXaZtIA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-GUID: 1AabM5UsSeIYXXl2PJbHzGTVPMEa_ReQ
X-Proofpoint-ORIG-GUID: 1AabM5UsSeIYXXl2PJbHzGTVPMEa_ReQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX/9DHSXHLzMUN
 KjSkrdUglgRrECxkcOrFctYQZEA6SYY3JZVME7Dh2GcKYgBT0JIWS4HJmc/SsHAB2WTQKYtNYEq
 neAlUnP01rip8da7GIrgffzUunbBDGfcoNYcqNgBsmeWSKbwibi2K2V9Fala28n1SIScrsDEb6J
 7tNncfnvcRHlnLu67eNmtpJlHL/CfPF+VAkntG5VlUGTVtC+817o02YtqJTlQSlhdpMLIEuSZbb
 Om2t+AYiNJYs7XFUfIKt7nOqrFUWigmz7fZheFknWrvaeXvtxIZ3Yo/REB7lW39od2NKHiUl6jn
 hWR9Sqn9X1wchqhqjIjdwX2YqXyXbYkbCmv+rFsVT/PaMgkO9BJD0vGxmI+vaD3oDuLLQAjfBJp
 hpI6OjbM+oa/5h8Ay24laaA8ETMA6HdIVa+LshhKnf9Z5VCRUerttGa713D+maVrhscGHa/dS3Q
 SF34mCxRNmSiG1S5E+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232245

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 81d1814191..0b139ac5f0 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "103f8b437f5e791e0aef9d5c372521a5d675fabb"
+SRCREV = "9d19a7870add65151ff91bcc26252bb7521065cf"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.34.1



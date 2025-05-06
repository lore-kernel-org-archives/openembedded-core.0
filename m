Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4230AC3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 10:53:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.73434.1746528821497638038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 03:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7221054752=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546AUilO028981
	for <openembedded-core@lists.openembedded.org>; Tue, 6 May 2025 10:53:40 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46e430j87n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 10:53:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 6 May 2025 03:53:39 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 6 May 2025 03:53:38 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] send-error-report: make output align with original design when debug disabled
Date: Tue, 6 May 2025 18:53:37 +0800
Message-ID: <20250506105337.2875114-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BajY0qt2 c=1 sm=1 tr=0 ts=6819ea34 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=qV09NasGAAAA:8 a=WP5zsaevAAAA:8 a=fLHl133gaewvrLbyFU4A:9 a=ATClE4nxGrkA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=GlicbclHOgpI_Rq0ze_Y:22 a=t8Kx07QrZZTALmIZmm-o:22
X-Proofpoint-GUID: OO-FFTeo6D_n6HE5dMdtxBT0_DOJ4O7Q
X-Proofpoint-ORIG-GUID: OO-FFTeo6D_n6HE5dMdtxBT0_DOJ4O7Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwNCBTYWx0ZWRfXzwEux3SLM5yJ QybsKndm0IntgNUVGzWtftNtVqalhuFwNPI/uvBTvik9o/+6cUsglrQ400ARJ763Bd/wsBtSV0P DeGFusfJLWkJNUkPkYmdOlasrcfjIrc5eSh2RLTl23ZxJs09sazyyv4hvlu8u6OTwzz13X3gY5F
 Y4FZlizknWQRnG9JEc5QGigFla91DnSk/WEUt0JTBjaPfpjC+QzsaPZNoNbor3sP/Ecwy/JXMZx /CDOH/43JW+POcd3x6wXVnVjuUDTXuWu9uSseJPjN7eiaEL0SbEsCQzAHWT0zaWLVVKWtRHojfd N7yLt3dD5ktUl2TZYjvkCZGGra/lLAHxd3k/VKdFEgNgSzXd/2SrMP/w8qcb4NsYmFWhdD5X+JM
 hj5OSe21fR19NQgPkCLCduhqBfYuw/X56c2gFNtMJGFcw8YiYazwso8Ns8eXrRKUoG6Gu5Vw
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=672
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505060104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 10:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216038

From: Changqing Li <changqing.li@windriver.com>

First, it is better to output the error report web link by default when
the report is uploaded successfully like before. This is useful, user
can find the detail the log info from the return link. Yocto Autobuilder
also benifit from this return link.

Second, why don't set level to logging.INFO to make the error report web
link outputed? Because "-j" option want to "Return the result in json
format, silences all other output", So "INFO:" added by logging system
is not wanted, so use print directly.

Example output:
Without "-j":
Preparing to send errors to: http://x.x.x.x:8000
Your entry can be found here: http://x.x.x.x:8000/Errors/Build/25/

With "-j":
{"build_id": 27, "build_url": "http://x.x.x.x:8000/Errors/Build/27/", "failures": [{"id": 26, "url": "http://x.x.x.x:8000/Errors/Details/26/"}], "num_similar_errors": 20, "similar_errors_url": "http://x.x.x.x:8000/Errors/SimilarTo/26/"}

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 scripts/send-error-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 6418dab165..cc1bc7c2b1 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -155,7 +155,7 @@ def send_data(data, args):
 
     log.debug(f"Response Status: {response.status}")
     log.debug(f"Response Headers: {response.getheaders()}")
-    log.info(response.read().decode('utf-8'))
+    print(response.read().decode('utf-8'))
 
 def validate_server_url(args):
     # Get the error report server from an argument
-- 
2.34.1



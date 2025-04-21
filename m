Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3936BC369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 06:12:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9948.1745215921868386852
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 23:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6206ddd6ae=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L5TCrA004550
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 06:12:01 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 464121hj6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 06:12:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 20 Apr 2025 23:11:59 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 20 Apr 2025 23:11:59 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] openssh: Add pam_env support
Date: Mon, 21 Apr 2025 14:11:57 +0800
Message-ID: <20250421061157.3912745-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421061157.3912745-1-mingli.yu@eng.windriver.com>
References: <20250421061157.3912745-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QZNmvtbv c=1 sm=1 tr=0 ts=6805e1b0 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=b3_JOEYBhrCEX9Xg9M0A:9 a=ZXulRonScM0A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 3quihy-P1Ttw5qKYCb2NQpc_7EdpVrt3
X-Proofpoint-ORIG-GUID: 3quihy-P1Ttw5qKYCb2NQpc_7EdpVrt3
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504210047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 06:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215169

From: Mingli Yu <mingli.yu@windriver.com>

Make setting environment variables in /etc/environment or
/etc/security/pam_env.conf take effect for ssh session.

[ YOCTO # 15767]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh/sshd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd b/meta/recipes-connectivity/openssh/openssh/sshd
index 4882e58b48..cf675a4dad 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd
+++ b/meta/recipes-connectivity/openssh/openssh/sshd
@@ -7,4 +7,4 @@ password   include      common-password
 session    optional     pam_keyinit.so force revoke
 session    include      common-session
 session    required     pam_loginuid.so
-
+session    required     pam_env.so
-- 
2.34.1



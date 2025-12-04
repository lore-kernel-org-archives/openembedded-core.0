Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D45D1D89D
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 08:32:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38663.1764837144875009198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 00:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qpSc6sS2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44334587b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4763ug911639;
	Thu, 4 Dec 2025 08:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=x+xR8Oiw7
	OG2N+og405AWvLy6jgxVaNKcyKkzG4Q1lc=; b=qpSc6sS2skEKlaXWHt8Bvmydn
	CFHTRgDX8F82vGNG+534jMIYXs3ZY+5s5bQCcADm54Je7REuBLEJNFa7NsMVMmM9
	3gvBMWblFsMNH1fmLMcDUboBNsQ8BCelE5G2x6NEJlcpq/NvXurt/osDir29qIYL
	II5tmlLloaCwO2uhkRW/tUW2Sb51fmGpvjf+Jy6JLjxs+nR3PPuH2I6FwyUOdkNp
	VoXZYuymn3+U1O+eBDipniWyIhVjNWI7lu/GYkYbofAz+/eXVx+9YkLGRxkikFcu
	A6JEpwcB7zSPWvU75W/oRf6j5rl0YbBY+gXsWPeGBT+1BoLEshYKFQ3R0T49A==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6e4q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 04 Dec 2025 08:32:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 4 Dec 2025 00:32:08 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 4 Dec 2025 00:32:08 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex@linutronix.de>
Subject: [OE-core][PATCH V5 1/2] rootfs-postcommands.bbclass: fix echo + '\n' in 'no password' banner
Date: Thu, 4 Dec 2025 08:32:07 +0000
Message-ID: <20251204083208.1046464-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA2OCBTYWx0ZWRfX7et2PI6oiLeB
 RUcmrUiBHVXvmw2Y9VROZ7bxawSEz7yIqw1dV9UcsVplSeF8at1+BULL2/ZmGK+rq/5EtzIKNJg
 RenRx7x9gUc+UGanZ5rF5zOZlGaWT3fyiiBZb7I5gXMumfVDYXUPOuJwsKrpqIaIzEqeFQjmlx5
 h/4d68bB/B0YoBSnduphUIzmt8G4XLNEcwcfwNBx9ziwdN7ltFk33iKZ6XuAeWbBbUn8DncjPvm
 N/lCsQqKFstZdcVVBoIzc4RPkl3c7FD3qDL9w6sS/nLpggpMVRztxdoMo0KKLK4IxRMS6lX9U1E
 QH6LU4TyRbX/0sHBFCm0LKEI0h7gZoQq0s8+3mgFCnKk0XJcgfTDtryBSi+aIqGuIbMEwAynz1f
 owlAyhpq44CTX5m/9KocafYniI5rGw==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=69314709 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=EapxWfizuyI-jKrd9UwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: bWuz-j2JWr5fk7ox0dbNumqnr1b6icfe
X-Proofpoint-GUID: bWuz-j2JWr5fk7ox0dbNumqnr1b6icfe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 08:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227277

From: Chen Qi <Qi.Chen@windriver.com>

The '\n' means hostname instead of new line in /etc/issues.

bash and dash have different behavior on echo + '\n'.
So we avoid this '\n' and use an extra echo "" instead.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index d3a569ba3e..f4fbc4c57e 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -259,7 +259,8 @@ zap_empty_root_password () {
 # This function adds a note to the login banner that the system is configured for root logins without password
 #
 add_empty_root_password_note () {
-	echo "Type 'root' to login with superuser privileges (no password will be asked).\n" >> ${IMAGE_ROOTFS}/etc/issue
+	echo "Type 'root' to login with superuser privileges (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue
+	echo "" >> ${IMAGE_ROOTFS}/etc/issue
 }
 
 #
-- 
2.43.0



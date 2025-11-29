Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C189D116EA
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 15:41:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16524.1764430907394200198
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 07:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ai1qTt/s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4428fcfaaa=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATEx9hV2483046;
	Sat, 29 Nov 2025 15:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wAKyHR7gxucxg+JqSjg+7d0wTihfLs9jN3GHrw08TVY=; b=
	ai1qTt/s0Zd9jPCnBBSEky/1VWpLGkYBK9t6jdUpHP3SlZecOqCh8iuBvPFmQkJp
	TET/mCp9fxq55/jWYsYBg6D9IqSTgU+ki7btjFBXsliUErHQ6dE59FtqWP6w3f9g
	8jVbIFVpBq8Vqvc4qiiRGV0lVosRsGm2R+xv0VvobRLe3O6/LvgUM169T7wzam1S
	3SzNlTAcdcdXwwtgjp0xPLtD2U1/px5MjZbliGrTbiolFzlJSVmjf4z3bUdE+7aJ
	rLpgc5btsZdvanCLX3ogMNZeynaWRJgA1wEtehPQGjHGDIUTJ/oV03H/IAQ4BLCA
	tIPFhX3HiZnNggJAT6Kmtg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt68bmf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 29 Nov 2025 15:41:32 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sat, 29 Nov 2025 07:41:31 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sat, 29 Nov 2025 07:41:31 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex@linutronix.de>
Subject: [OE-core][PATCH V3 2/2] rootfs-postcommands.bbclass: fix echo + '\n' in 'no password' banner
Date: Sat, 29 Nov 2025 15:41:30 +0000
Message-ID: <20251129154130.505619-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129154130.505619-1-Qi.Chen@windriver.com>
References: <20251129154130.505619-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDEyNyBTYWx0ZWRfXxeRbUApc7HvO
 Es98ZrsujwcIQi1unq2EVl7M71wmwTPCK0KYA2w+hTUCXl7JwQhBW6SMk7irXHDkpoSz1MZMM9j
 MTgd5lfmtohZjrhlqpFgvtWWVZDMFghzj/ROOGhZa+PiPGlHG1iRzzNzGv5YOy8DJ2XQ4/PmBT0
 hVjUX0z8VWiTYYY3joqhJcL2phnXf1c0EHMHVsr+0DeUxlwMEIcFMxAqC8aQUIhkaaBrN8Yf18h
 6y5kZtIBqueGTvszdyHWW57wC0vaH/VwSGZB7grnob/sFxUe1nigTPvhRTvjJyWyT5x4SusCJDq
 kPD4X03+SzWsQ0An9BX2Sa0zTgRixNMDtjfvC2HA9R67tdGScWgsNp40pn2lSowdK8jLm1ZZiQq
 KKQgF9xvghMZIX5XCOrYpwZS8u3NOw==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692b142c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=EapxWfizuyI-jKrd9UwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hjwTL76XpY9vuer1VziHuiB_jsZ5D5f8
X-Proofpoint-GUID: hjwTL76XpY9vuer1VziHuiB_jsZ5D5f8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 15:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226942

From: Chen Qi <Qi.Chen@windriver.com>

The '\n' means hostname instead of new line in /etc/issues.

bash and dash have different behavior on echo + '\n'.
So we avoid this '\n' and use an extra echo "" instead.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index bcc25798b9..a4e8517229 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -262,7 +262,8 @@ add_empty_root_password_note () {
 	rootpw="`grep '^root:' ${IMAGE_ROOTFS}/etc/shadow | cut -d':' -f2`"
 	rootpw_lastchanged="`grep "^root:" ${IMAGE_ROOTFS}/etc/shadow | cut -d: -f3`"
 	if [ -z "$rootpw" -a "$rootpw_lastchanged" != "0" ]; then
-		echo "Type 'root' to login with superuser privileges (no password will be asked).\n" >> ${IMAGE_ROOTFS}/etc/issue
+		echo "Type 'root' to login with superuser privileges (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue
+		echo "" >> ${IMAGE_ROOTFS}/etc/issue
 	fi
 }
 
-- 
2.43.0



Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E94D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:25:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14292.1764566739710733566
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cS6d+XDX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4430bdac1a=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B14mPnQ1161487;
	Sun, 30 Nov 2025 21:25:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=x+xR8Oiw7
	OG2N+og405AWvLy6jgxVaNKcyKkzG4Q1lc=; b=cS6d+XDX0mC5vRG7LBkjFEpmy
	RWCujhhyqo6fyQhWXvC0cfUB/ch5IsjzQjBpSnm/uh81xpg3Ivs3E+LIGnwnoyJT
	ufKUUs77yr9IYSRPukZ+9roFZAIPrPP5l3t/WJxeaN7m/3/5z+kqihcOlFVp6SdM
	IBZEMTWmvaNTlGr66lSmEVQ7HwHVuR9xi85AYx72EZUaEUX9u0EJAo3JvkEVjD3z
	v+X4qsRtCZvJ0RrNoougLqzJIOnJNjagnxchYTWDMPIdv1Jm9hv980qdwVtkSQ3L
	coszytMOzAgwfop9T1kr985Bfk3/pn7tQb2We5pLs5ST0uBKkFKszcbR0xrrQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05h6x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 30 Nov 2025 21:25:24 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 21:25:24 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 21:25:24 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex@linutronix.de>
Subject: [OE-core][PATCH V4 1/2] rootfs-postcommands.bbclass: fix echo + '\n' in 'no password' banner
Date: Mon, 1 Dec 2025 05:25:22 +0000
Message-ID: <20251201052523.1222217-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bwK_INrBSagoQY4tChnp7n0_Iy5Ih1JQ
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692d26c4 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=EapxWfizuyI-jKrd9UwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: bwK_INrBSagoQY4tChnp7n0_Iy5Ih1JQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA0MSBTYWx0ZWRfX86SZWd41fZMG
 2SaSQIiCAdYPwoYXmbawdjj4gUwIv2ff5sIcvgRyA9PBcp0MneIdbHfYIzO2PgU9DpL5fvMw2GE
 3AqFkx7mWpaS5o0ODKUyNM13j5FH+CVJK/5Hb6Qqo9zBCr1XOntwViG/RQFJYntYDum80fD5z0l
 21El67mhrx7tipe3xns5IAJrNYh+Sda01IE3MBRtx3p/1lmBXDSsEGKZ3Wz0flZTECrkdAFv2jY
 2ryQmHOTBCX+JhnzMYMRp6Q84qzSeuzhIeo0263DXJPJ03tJd+4ceOxExbCsUThpCJ3yOrwZhJ/
 VPGIQN8OYkCZUQYWKhmF5yVzJ+9sFWhj7Aqo/lxRKfbZ1dm1afaOeqr5yJoRxyQ4RfniRSSjrFp
 HPeuAOmN5LD8WDf7DExWEGbb9P/9UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227115

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



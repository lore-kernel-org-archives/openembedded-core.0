Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EB9C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 18:52:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4097.1703011933133498672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 10:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MqVMUXYi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0717d84f99=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJBGGSP027231
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:52:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=joUMl
	CEygwy5YU9nRUy/JZBjYLSZ0Wtr4NUC/Hucm9k=; b=MqVMUXYi+1XaUDjPbKH9j
	23CyVcZUfzB8lZk7qcRgXPZrhXEqrshRokUGt8F+3eMezafU/4GJ76QwQnCD8DSu
	bpVopbCOGkb+p2eNXdqCHsDD1IK80UNo+5BHjw/KRHbCogWFZ1iIf8GDdu28fxfQ
	XqKHJfRCu1xMEyel0iIytWyTFuwEgAbfE3DppHTT17c8zQ250Ex+/NWNLffaIDe1
	1lVRbTkMIBuHt4TcOb0PBi97HpxgH7mGCD0a7J3evOnU7xS/c/sd4U0ZNoMsKPiW
	hKao224Re0aK7MifGslRk0xO6tFVBtYeFFCV8AUI/ThpdSazt8IlrvtM24dJa1KN
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1824kden-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:52:12 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 10:52:18 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 10:52:18 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] archiver.bbclass: Drop tarfile module to improve performance
Date: Tue, 19 Dec 2023 10:52:10 -0800
Message-ID: <cover.1703011843.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: K6voCebHam9_ltuskXq08bfujzuBgz-T
X-Proofpoint-GUID: K6voCebHam9_ltuskXq08bfujzuBgz-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=593 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312190141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192755

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 6b729088dce302eb3a967cb6839f00488025be0e:

  build-appliance-image: Update to master head revision (2023-12-18 09:42:59 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/archiver
  https://github.com/robertlinux/yocto/tree/rbt/archiver

Robert Yang (1):
  archiver.bbclass: Drop tarfile module to improve performance

 meta/classes/archiver.bbclass | 28 ++++++++++++++++------------
 meta/conf/bitbake.conf        |  3 +++
 2 files changed, 19 insertions(+), 12 deletions(-)

-- 
2.42.0



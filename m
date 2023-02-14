Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A5FC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 08:28:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2112.1676363302085510962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 00:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sevA6OkG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14097dbe8b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E8Roek020494
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=ksnFQXBC/dGmd1YzOQhomaKoREc4a1Zn0YjDckqJHTk=;
 b=sevA6OkGOTu4RocVGvJdNfgQH0SCQPgBR2l7yR5bER20L8kRQiJ5udjO/yHc6x8i82Kb
 lUiNuTQtxPjLkIFkdTawKJvLZZwEkFelggc8e/7K+Vbb2q4rYPouuWv39Kduu05ElWDO
 boqnssxLE1TLKY84zkSv6pQPOHTY01Uejjn4kFCOoPgeJq8S07ewVAvovVkU2P6bDb0x
 dYy9yWAGi+cwAEqWuA+ZfFw0po9olcYWAVXTgnZDbka0tIIuWVI/Dkwp7uyJGKSzHTJd
 f5YO4TWhPlkcnEC98k7Z3k1qGPIlmalAdja2iBJpoGUh/HQSS5DNBA0O4BHq6pWvRQj1 yQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np20a2ena-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:28:21 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 14 Feb 2023 00:28:20 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 14 Feb 2023 00:28:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] base.bbclass: Fix dangling NATIVELSBSTRING
Date: Tue, 14 Feb 2023 00:28:18 -0800
Message-ID: <cover.1676363155.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mJ0JQEktMbssSLgLYY-XLP_QrR7Mvnl6
X-Proofpoint-GUID: mJ0JQEktMbssSLgLYY-XLP_QrR7Mvnl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_04,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxlogscore=973 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302140069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177124

The following changes since commit 0049f6757f6f956fb4cc77b3df6a672c20b53cf4:

  oeqa qemurunner.py: try to avoid reading one character at a time (2023-02-10 09:25:41 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib rbt/lsb
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/lsb

Robert Yang (1):
  base.bbclass: Fix dangling NATIVELSBSTRING

 meta/classes-global/base.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.39.0



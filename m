Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4CFC5AE59
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 02:37:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7134.1749004641127344804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 19:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250671ff5=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540hxcu024670;
	Tue, 3 Jun 2025 19:37:20 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rsueg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 03 Jun 2025 19:37:20 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 3 Jun 2025 19:37:20 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 3 Jun 2025 19:37:18 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <steve@sakoman.com>
Subject: [scarthgap][PATCH V2 0/1] libsoup: fix CVE-2025-32053
Date: Wed, 4 Jun 2025 10:37:16 +0800
Message-ID: <20250604023717.1856099-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: D5D-ia_VAMFriOezPFL-8SG34T6GAGX2
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=683fb160 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=NIIK6NWDoLjZ8PGnaUEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDAyMCBTYWx0ZWRfX1SAe5dXfzGQA 8Sz9XZsf6y5XIlMhEftX/hctY6Z8X2WN8F4TPMxRSxBSwbqnIGCLkYPQRT5VC/xyMVYw+qgRE5z 7jb4Pi74aMb75THggNLraKMO2FIFx7HH9WrOCFCUMNYEDsCAmWvpPBubrZ+Mot/0sz1wqT24gM/
 hmh/jLi6C5ah5wVdwFVEbW1wzfwRFdmmWqJL7/RQKGkyn8LGO83I0vLElTvRJdb2JKgCI1X1nlx rhn0WIw9y43Zumr+0Ge1MY9wQQ8n618hBVsjbhyuVoePWGodpztriawWz06InUpYKmjz36ENJbj ng5c7DsbSfvmAeu/EUyRTijter37yibQWiv7Bp5uZ3vHnM2/czhDbpziHCBUNMIpMkn8OM6t9cR
 mGh6BsDKF45Bl1/bEGF6qGCQVJ7g2AwCzx4qz2H1fG6Fbdr7GJTueHsdW5poGPXJMndSbhXg
X-Proofpoint-ORIG-GUID: D5D-ia_VAMFriOezPFL-8SG34T6GAGX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=606
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 02:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217832

From: Changqing Li <changqing.li@windriver.com>

Change in V2:
correct patch subject from "libsoup: fix CVE-2025-32053.patch" to
"libsoup: fix CVE-2025-32053"

Changqing Li (1):
  libsoup: fix CVE-2025-32053

 .../libsoup-3.4.4/CVE-2025-32053.patch        | 40 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32053.patch

-- 
2.34.1



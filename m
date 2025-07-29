Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA976C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 07:37:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1947.1753774640433376564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 00:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03055d9187=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56T5fE7Y3828799
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 00:37:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484ta1taqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 00:37:19 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 29 Jul 2025 00:37:18 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 29 Jul 2025 00:37:18 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] e2fsprogs: Fix native build errors on old kernel such as 5.10
Date: Tue, 29 Jul 2025 00:37:21 -0700
Message-ID: <cover.1753773816.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 43bCMUkXxZs3H5LHKX1JrX9gmR6pffqr
X-Proofpoint-GUID: 43bCMUkXxZs3H5LHKX1JrX9gmR6pffqr
X-Authority-Analysis: v=2.4 cv=OYOYDgTY c=1 sm=1 tr=0 ts=68887a2f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=x7IcXfdqPv2k3Uw70U8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA1OCBTYWx0ZWRfX9RAVWcshG1ZO
 kFnty4C0lG8tx0qg8dn8bRRRMxQH5E4Jwr7qYgzJycNtxeqnvZDrbrPJxNGGhVtxGqHp3gAEx54
 oV1sSzvdYYUpxcuSwm63oip1QUXUpTxUtf14KyppMVgPr7npSR58tANN6ZJwqHaaVf38VxndOhj
 D2X1Ax+Q/RkADsJA+oRLtcNgTTrQ/6PLcGd4N3qfn1bf7s/ySTHtB5ACEZr8/vi83TOi4oNDuY8
 nm3c/LOvM6YfsGmOi3f3JWgwFh6cF8h9xbQsRJ4xlnXYOfK3guVnOryowQFYYTqEl5k5EaKN/hW
 C6Z6TKGQVyr46Pjk+y7YCFMTglTEEeDogYWnFgJkmn9RLkm/KL5sWDjVgqOA2VEJffVNYoNW8Dd
 mJa25dOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507260059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 07:37:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221032

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 249e42a02c412454cfed9d58e27a054dfa5d2b06:

  qemu: Remove deprecated asyncio calls in qmp python module (2025-07-28 17:35:16 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/e2fsprogs
  https://github.com/robertlinux/yocto/tree/rbt/e2fsprogs

Robert Yang (1):
  e2fsprogs: Fix native build errors on old kernel such as 5.10

 .../e2fsprogs/{e2fsprogs_1.47.2.bb => e2fsprogs_1.47.3.bb}     | 3 +++
 1 file changed, 3 insertions(+)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.2.bb => e2fsprogs_1.47.3.bb} (97%)

-- 
2.49.0



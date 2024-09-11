Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D8EEE49B8
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 14:36:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.23221.1726065363518656565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 07:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=998409ca54=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BAeOYn011078;
	Wed, 11 Sep 2024 14:36:02 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gc214qg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 Sep 2024 14:36:01 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 07:36:00 -0700
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 07:36:00 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [PATCH v3 0/2] classes: Print bitbake branch and revision
Date: Wed, 11 Sep 2024 07:35:58 -0700
Message-ID: <cover.1726065189.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lZXu66nudJmSNsZzgkZCMxt6pi9lMs86
X-Authority-Analysis: v=2.4 cv=PvDBbBM3 c=1 sm=1 tr=0 ts=66e1aad1 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=7UWewFqK7ow4SjDNwgUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lZXu66nudJmSNsZzgkZCMxt6pi9lMs86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409110110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 14:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204390

From: Robert Yang <liezhi.yang@windriver.com>

* V3:
  - Add is_bitbake_in_separate_repo() as Alexander suggested

* V2:
  - Move the code out of get_layer_revisions() as Alexander suggested 
  - Always print bitbake branch and revision to make the output consistent
    whenever bitbake is in a separate repo or not.

* V1:
  - Initial version

// Robert

The following changes since commit 918e2b266eba6779f19f65349f85caa880ba45e7:

  libedit: Make docs generation deterministic (2024-09-11 11:56:34 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/bbrev
  https://github.com/robertlinux/yocto/tree/rbt/bbrev

Robert Yang (2):
  classes: Print bitbake branch and revision
  lib/buildcfg: Add is_bitbake_in_separate_repo()

 meta/classes-global/base.bbclass     | 10 +++++++---
 meta/classes/buildhistory.bbclass    |  5 +++--
 meta/classes/image-buildinfo.bbclass | 13 +++++++++++--
 meta/lib/oe/buildcfg.py              | 23 +++++++++++++++++++++++
 4 files changed, 44 insertions(+), 7 deletions(-)

-- 
2.44.1



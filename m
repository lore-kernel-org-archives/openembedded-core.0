Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDD4D5CCB3
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:57:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18783.1765879061278522003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PY6k8FaX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444550a79e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG70I84270478
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=3z284KQ3U
	iugajdQpB6VdsDwVcOapW1voOKaotegTXE=; b=PY6k8FaXCEc6+e9b8F25oZcAj
	vtNMGFfi8zqvjknDb7IDQvIXTu/UuLXBSfovkpcLwqkYwj84qHUqo5GoMBeWNd0G
	OewjI0oUSrcs0NmfcexrJFUlG0U5gHbaICJZZs+1FNJXSzLZ6ogeo4VF//aG0Na1
	CsRLyUI5Lf//ZcupNa9dzQPpmShUYHP0kXCCczP2CreLeMCeglL411UJZxX+ZLsT
	8+KU4sOntF2NB0xCwPlBAIRw22qTAyGnZKvcky0xUnhuo+sV+lGCfqcQMJGK3tGa
	mpxD0W1nvc/Q4kBZmNzRBKW2nxbvHW+JVuGscXHlDqOKnoXf/INY67QKVFpJw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0y48axts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:57:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Dec 2025 01:57:39 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Dec 2025 01:57:39 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [PATCH 0/1] strace: 6.17 -> 6.18
Date: Tue, 16 Dec 2025 01:57:38 -0800
Message-ID: <cover.1765878985.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA4MyBTYWx0ZWRfX3g4OSzZM0FYm
 hqB6nz/oPRN6sdj3hbqbP1UjqSKBeZsD0avvre8rlNYXhfhZRBeRfvrCFxab/5isvWW+UIcH3pX
 Gd/8nLIcm/ASgdboeV3VFFZRIZWFv35CQhFu3SL4Oh1thaDy5HTYcXVSTa47dhzs8wkVj608GJH
 e/G46J3u+Y3gTC2fC+aM0tdBYeq/DTg5Y+Ql8JN7Pz8ZWILrA8sMZKCWFD/m0xD7DAnLSsB3hvU
 TT61sM50IsbpUnlrTnJ+PilN+TSqvF7S9uECfw2I4BOCJCHbkVdw9Y11UBf47zyqiOct8V2oVw2
 Gdi8lDse3i07zVTfBnG4/DT9K35pu0dY94e6BPpW7jOKRsqcJMeuNeQtOVbpEXm91Z1A/4qdFQx
 PBu82/AByuBgk+b/3aMF6qGZjI91+w==
X-Proofpoint-GUID: lCDmkF7IykgPJDX6WJXstIYiRf6KjNNZ
X-Proofpoint-ORIG-GUID: lCDmkF7IykgPJDX6WJXstIYiRf6KjNNZ
X-Authority-Analysis: v=2.4 cv=e5ILiKp/ c=1 sm=1 tr=0 ts=69412d14 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=9jKBmOBzStXdA8dPeJEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227938

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 2e10e9a50f12d5de3d22fbed59b65461afa3fa84:

  Change CPAN_MIRROR to the address where it resolves. (2025-12-15 18:00:31 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/strace
  https://github.com/robertlinux/yocto/tree/rbt/strace

Robert Yang (1):
  strace: 6.17 -> 6.18

 meta/recipes-devtools/strace/{strace_6.17.bb => strace_6.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_6.17.bb => strace_6.18.bb} (96%)

-- 
2.49.0



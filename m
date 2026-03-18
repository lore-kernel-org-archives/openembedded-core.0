Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5B0106ACF9
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 10:10:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10706.1773828634565539245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 03:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JEgW+7sC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7537156b97=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I7IpLm4077212;
	Wed, 18 Mar 2026 03:10:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=GW65JZjpKNED6GU42ZnihvS5EmuFgQuiYi+amiU0KQE=; b=
	JEgW+7sCBUxstUGMBjRao2l21gBhIrLF+e1ezbT7c2wkgaM6/TsbTUk2NTODsMRE
	5WAxamAVqwCMbMKxjlOllIuWmr6bwBk0LPm2ISZF7gYybDQ1xMjRffQmFnUnccWg
	CROsO4/7PlkUkAalm8HI1pTgvenV4SXmN9n2oVJXez+Bjy2ALetrTltsAmkkAgIJ
	T5IMwNz4IhL1dGf959qWn1G1fs9GYDQvlw9kbPTgtC+4bN3M5lY56m8nmg1+ZMnq
	xq7d+g9k+llb4nyUJFb/1KoZbCpgHVkondz79oEonwWMBCU1xisUpccJBpBSQY9+
	KEX1UXHR8o69FqJzswYnLQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dvcht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Mar 2026 03:10:30 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 18 Mar 2026 03:10:29 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 18 Mar 2026 03:10:29 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/2] packagegroup-core-tools-profile: add lttng-modules to LTTNGTOOLS
Date: Wed, 18 Mar 2026 18:10:25 +0800
Message-ID: <20260318101025.2718647-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318101025.2718647-1-kai.kang@windriver.com>
References: <20260318101025.2718647-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69ba7a16 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=B_YtbNZOIPB5RpdTEv4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4NSBTYWx0ZWRfX9nnodZNP70cQ
 C7Ee+M1X7Q9cATBfXHx0tTAG/hMOHqriha6RULEDTAZGkX5Dhltf6n4gwoLnbtSbukxiEjSZoTS
 gt6nR8af+nth//xOb4N3sDjq9MZynUcmJJSC2dGDmjXVQ5QFu2ZbIQByNMZfeKYF0Qc7qtWqj6D
 j2HjVtb+No53/iFPQggBk8ZqnFj4M2v6zgO3pwbV/fFupVlqnwy353d4LFR8QfMXMZM/93hXX8m
 cDRSyouL/5S5zQwQ144Yn1EEVmZt+LG7mAde5I7mXJw2ZG1xsFOwm+IU6vNgrlKyWBEN3S4vnsn
 6DKtDvI29Em0+RARJshDU5sjXvZuaA8tOE/ddKa41GGRVxdfXQB8jV430BKVWHzdFKO7S5nLJNa
 bWfVuxGrqMpA6VR8L0vNoxG9gaGAIcZ0NnTcrVR4R3U/MBpjY8HnZVAh9birUjm5rX6eV3GQWsG
 Vg6lHt1EwA5/w2WoIRg==
X-Proofpoint-ORIG-GUID: skqDkJbJtmja2fhD6sbNKyzFMWQw2RwN
X-Proofpoint-GUID: skqDkJbJtmja2fhD6sbNKyzFMWQw2RwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 10:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233376

From: Kai Kang <kai.kang@windriver.com>

It has removed lttng-modules from lttng-tools's RRECOMMENDS, so add
lttng-modules to LTTNGTOOLS in packagegroup-core-tools-profile.bb to
make its dependent packages unchanged.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 9c09f5ab44..42c15772a0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -31,7 +31,7 @@ SYSTEMTAP:libc-musl = ""
 SYSTEMTAP:nios2 = ""
 SYSTEMTAP:riscv32 = ""
 
-LTTNGTOOLS = "lttng-tools"
+LTTNGTOOLS = "lttng-tools lttng-modules"
 LTTNGTOOLS:arc = ""
 LTTNGTOOLS:riscv32 = ""
 
-- 
2.34.1



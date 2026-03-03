Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A370DE67A78
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:56:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12821.1772521007075424396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=g9C5m03L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623655tL4062242
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 22:56:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=BjQpQoY+Dr8KpBgtxvIeXj+wU3cndLqhi95/XEwJxQE=; b=g9C5m03LzXS6
	EyJY7axaFANI71QLCCboU5m0BRJkc93hx3woMKrkD0olWas2lJfaZudOYbAf+C3t
	N0altf9uL8KffVBbOKSs3/lb3mNCBOO8nCYObegPfmOZob3gOa1b2yhYjzNIE+SO
	zvQHPUXYpi4YFjgUn2ZEpRaQTz2zV6dKgNybDxIrl3kFPCcRAEdnbCfvHzYGtUEj
	WV4ZUD7zMnzdHoAK3+rkR26x9kugLEXiB0Y5rvkJF6osMgFLGgrxuWAuy8TbSm+W
	PaOnl0TwgQrzeyfHhHaWPVLl8Zs+NF0qyOjoKvu0plyAxKAd55+qNY0DlSxEQDVW
	PvMtTBZdCg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgju8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 22:56:46 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:46 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:45 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 05/19] font-alias: upgrade 1.0.5 -> 1.0.6
Date: Tue, 3 Mar 2026 14:56:26 +0800
Message-ID: <20260303065640.2541884-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3bEc_H1-zQbkEl99EqEEO0D-ur-vIs3W
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a6862e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=e5mUnYsNAAAA:8 a=yPCof4ZbAAAA:8 a=t7CeM3EgAAAA:8
 a=VUUrmiGzCRwDqNnxMWEA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3bEc_H1-zQbkEl99EqEEO0D-ur-vIs3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX0MkMbnaphTTX
 XTGyZkJ9BfBScv/miC47ENVzUvKRtiZBzNSe80ea+jOBARLnc2QZtzCC0xOSAAO96PYsInUfYs5
 v5moyAJB0EGX/PtG1vuygz7SD+0EWm07F7HrktJQr9Bog+FldNUMQNZ9k6S2hgHbCo9/6Tr6e4c
 TDrkuNwULYXI/XbLgUZ/uA9/3j5z5L7hFOZyeUz42w4yl9lRjR9LnaJ8eO7/lmIFkHyHNQxoe2Z
 aE4rV36kHmalSdU4y7ZpaXwq4VlKbLRiT3tUIwFqmF59wr/OLSNeTqEm/kEnWqpPbHfPPTILgO2
 0kH6U37GdfNrV4ZSPHNC5cdopiD1pXEXdO7neDktgQMrbaqvYZSCshqZAoh/25ZDpL5hEcLoHMx
 rikugApQHIuCudRsPoqJkUIbO8XyXUPsp+77k5bmUqhf6W7jv543Wjj0xN4TIUKA1SH6Ql2h2vI
 Zk2kV5cN8sq2jH/+RDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232243

ChangeLog in 1.0.6

commit ebeee85f070dc12197ad98d1c849786f8e3be124
Author: Alan Coopersmith <alan.coopersmith@oracle.com>
Date:   Sat Feb 7 17:20:58 2026 -0800

    font-alias 1.0.6

    Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>

commit 55ceddb52f9e08a277ba634b2b0a03a9be31fb46
Author: Alan Coopersmith <alan.coopersmith@oracle.com>
Date:   Sun Jan 11 11:20:41 2026 -0800

    gitlab CI: drop the ci-fairy check-mr job

    The only thing this checked was the checkbox for allowing maintainers to
    edit the MR. Changed permissions checks now fail this job but luckily
    the setting it checked has been the default for years anyway so we can
    drop it.

    https://gitlab.freedesktop.org/freedesktop/ci-templates/-/issues/81

    Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>

commit 184c43dd059f785537c8a48a4a7972c488ac1215
Author: Alan Coopersmith <alan.coopersmith@oracle.com>
Date:   Sun Nov 19 09:45:41 2023 -0800

    Add a meson build system

    Includes CI checks comparing installed files based on those from xorgproto

    Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../xorg-font/{font-alias_1.0.5.bb => font-alias_1.0.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-font/{font-alias_1.0.5.bb => font-alias_1.0.6.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-font/font-alias_1.0.5.bb b/meta/recipes-graphics/xorg-font/font-alias_1.0.6.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-font/font-alias_1.0.5.bb
rename to meta/recipes-graphics/xorg-font/font-alias_1.0.6.bb
index 03c39a4334..908df1ebd1 100644
--- a/meta/recipes-graphics/xorg-font/font-alias_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-font/font-alias_1.0.6.bb
@@ -19,4 +19,4 @@ inherit allarch
 
 PE = "1"
 
-SRC_URI[sha256sum] = "9f89e217bb73e0e3636a0a493fbf8b7c995156e0c53d9a0476d201b67c2d6b6e"
+SRC_URI[sha256sum] = "f6a5e968b616e728a981fd1fd9ed5fe2ca0fe18fbe072b1888cb3f71b701e4c0"
-- 
2.34.1



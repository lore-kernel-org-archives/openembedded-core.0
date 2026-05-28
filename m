Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A021ECD5BC9
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 02:28:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2634.1779935296793084884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 19:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O+2Z4qhO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9608e22195=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S0Z2Dv618674
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 19:28:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=htD5gTc5d9UtvZbG9CGK
	LlfDMd4DT8h7iyI2oDrOjWw=; b=O+2Z4qhOPSO81WMFx/NhLBifIisdRie3rPZM
	m6cwmqHzS9CjoGXuz6z/A6RH6TipF4dEHuwtkZMPPSkoF/kfI/MEB7TXK5wchgsK
	e74qHCDWdK4vVGdTks6mlpHBUeUW4DfW+vVXy44xrVIt6U6WWGreAA6hW6nE/0aL
	VKxbMD7BWvumZy9RGLMxhtSZJ0J8ZQGe3y9347GbrwroDgohs611gc+M0nnyVWfH
	W4UiMqM6FHEcwnVql3HQVuV0LUuJ69Y1fscoZmRXiDQmK4oseyqXHiteCA0XXTiP
	lit6PGABRQFQj3i0t1Y6rSdkKwVDhatxO1fv9+v522ESFyO9TA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x6r8a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 19:28:16 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 27 May 2026 19:28:16 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 27 May 2026 19:28:15 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bind: upgrade 9.20.22 -> 9.20.23
Date: Thu, 28 May 2026 10:28:14 +0800
Message-ID: <20260528022814.1711843-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IcxdTEmH0w9vXr07wK3lZcPrfBhNqXUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX136sFTCvek4N
 Q5vw3BaYc4Ub/bPddFwf+fTzyXRExCzZPWPuyoNiGyrqwp7/BgnQ/urKpo7J20AQ+bDG34Hpqsj
 6vRiSwZo4G0gx6stDy+gMuGB67FEbFXArpOIbWLBIF3Dg8N3r5XKiKxNEkDdNjMfbsC3Wz/K14P
 sehbh6GXyGWck98//1zYDwei9PL2kzRczmKKhFmpIRzJJY2WUdIXxDUUtpor8cUo5gICCDzIwrE
 DRwFvS+BWmQIesn3QmVPdBxY9KRqA2EzWqi6KSNVkcc/qEFLStB+LxbV8qsSVNURlDCrholgJN5
 iZtBQ91yIM26uFe8a9PpZrYPtYks81cE5ihgsRbPs+hF/6gGE/kBPnn5+5wVHJ9AO7Hkwr7BzSS
 pS3UwReFpZkf8SqZtz6sWXuC+kI01oksFa1UbTLAowpWgmNSuVZbdsLwU20zxM6/s41LkEl0Scu
 xtsa8t26G+au361sCbQ==
X-Proofpoint-ORIG-GUID: IcxdTEmH0w9vXr07wK3lZcPrfBhNqXUY
X-Authority-Analysis: v=2.4 cv=FcEHAp+6 c=1 sm=1 tr=0 ts=6a17a840 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=UXIAUNObAAAA:8 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8
 a=QgkDFlgNOwP0r1ppsncA:9 a=a1s67YnXd6TbAZZNj1wK:22 a=nwb-CePKZZm3gL-ai9HY:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 02:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237680

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Solves CVE-2026-3592, CVE-2026-3039, CVE-2026-5950, CVE-2026-5947, CVE-2026-3593, CVE-2026-5946.

Release notes 9.20.23: [1]

[1] https://bind9.readthedocs.io/en/stable/changelog.html#bind-9-20-23

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../bind/{bind_9.20.22.bb => bind_9.20.23.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.22.bb => bind_9.20.23.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.22.bb b/meta/recipes-connectivity/bind/bind_9.20.23.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.22.bb
rename to meta/recipes-connectivity/bind/bind_9.20.23.bb
index 318412a62c..ebc4422b67 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.23.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "cba92ff631b949655f475fe4b54290f6860fd0070d399f2279f6437c0d383ec6"
+SRC_URI[sha256sum] = "5d4475aed3f9e500ef554b2b14d972bdb83d33de214a9b3be92918ea46908371"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1



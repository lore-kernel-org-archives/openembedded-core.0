Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC25CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 05:19:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3275.1780542181006823315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 20:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FTaUmfAM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06156ed005=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6541mxp11455237
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jun 2026 03:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+4vTgq+vDUvb/Jf4Y6+Z
	abVqpWBhSVjFp7O168LkoE8=; b=FTaUmfAMtBHvDhvj8Pvcc6Le6gCf7m/8j0ul
	OEtTl/ABmgSlljqwTJJhoMxbK3J+akaZWNSft+Bxm+pV/59u7ylRPzp08zSQ9l7j
	5vxzl89/uCG0fluj6L3sCYOkUUluApCGpPgr5B2r2VErzAVyOyK1u5yGf3oNhMvC
	vB8siV20Q4Ndn6Zh9/jJx5VmfYkAkfZtZnzff7JTmuzWdR68S5MIAmiXTUPQ5wEv
	EcD94mmG0IV+txyuEK2tkvDH62wt1nXIGCQyMmIC5lgxkNCA5f6KrdkSsak5TBXS
	CKErwEItj4lDBEZz3tHWxFIB/k/SB/Ie3B4KIRmHUOetvN0+oA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efn40809f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 03:01:33 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Jun 2026 20:01:32 -0700
Received: from ala-lpd-susbld.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Jun 2026 20:01:32 -0700
From: <haiqing.bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <haiqing.bai@windriver.com>
Subject: [OE-core][PATCH] xev: upgrade 1.2.6 -> 1.2.7
Date: Thu, 4 Jun 2026 03:01:32 +0000
Message-ID: <20260604030132.1891613-1-haiqing.bai@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: yMGSo_8HafkxPVanIKm9h49MBDis7HW8
X-Proofpoint-GUID: yMGSo_8HafkxPVanIKm9h49MBDis7HW8
X-Authority-Analysis: v=2.4 cv=GI441ONK c=1 sm=1 tr=0 ts=6a20ea8d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=g7aOlr6Ix1Mc2x5jNCAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAyNyBTYWx0ZWRfX/y/BRVWRTE+0
 EV5WeAGevnHRI9G9ZvJ7buMJ1wUlq+mqtx8o6DP+7NSPusXJCiE/jyyIZftc62Dz3HzZ6wN/ots
 Fmxxc5pX/7I0hjFxiF8QmlrEGBGNybTxyiz6UDG6vr/u4Vvl4c9LzJ2QNojqEsJmTfCJfUJt3w4
 c9OhBLo682FczRh+X4qewlDba77rwpu8VkNksqG1ej2KoQ4+wvIMt1Lh3Lqr9pnQENMdGI3ZcQk
 rN724/MfSc/0SFm6uiIB2AnHmvQ6s3cxKGoA3eCeD3ePnJxyeAwG3qD2CA8m/my93mPco8wM5Z5
 SVsyRMxT7Sk9AdeYUPpy804a8ajOxqtDeyN8wZK6mP8lNqgep0LcxVa+wETsVrGFT6KZrggsSaz
 Rlial45XZqlUXsyoMEFJZ3JbLflcgGLtrjjvy5yR1b02Yru3GyI4R+81hfAQT16eoI6EAUgCjm+
 F30rDeqolEEX9XQXnwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040027
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 05:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238116

From: Haiqing Bai <haiqing.bai@windriver.com>

ChangeLog:
  fd3a07b9:meson: Add option to build with meson
  79f0cc47:gitlab CI: drop the ci-fairy check-mr job
  61c956d8:Clear -Wunused-parameter warnings
  0513c8e4:Add missing indentation to second line of CreateNotify output
  5d90d0e9:randr: Protect against XErrors getting output info
  e2c157e7:man page: fix warnings from `mandoc -T lint`
  eae9d09e:Improve man page formatting
  8b9e87a3:Accept --help & --version as aliases to -help & -version
  c69f783f:Add -help option

Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
---
 meta/recipes-graphics/xorg-app/{xev_1.2.6.bb => xev_1.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.6.bb => xev_1.2.7.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.6.bb b/meta/recipes-graphics/xorg-app/xev_1.2.7.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-app/xev_1.2.6.bb
rename to meta/recipes-graphics/xorg-app/xev_1.2.7.bb
index 182aeff1b7..6e866b8f8c 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.6.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.7.bb
@@ -12,6 +12,6 @@ PE = "1"
 
 DEPENDS += "libxrandr xorgproto"
 
-SRC_URI[sha256sum] = "61e1c5e008ac9973aca7cdddf36e9df7410e77083b030eb04f4dc737c51807d7"
+SRC_URI[sha256sum] = "95167895924de58e34b1013b2b0c8476e90d0888c6c39e7ae9bc35e3a19dba04"
 
 SRC_URI_EXT = "xz"
-- 
2.53.0



Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8958CD8C8E
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 06:06:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47781.1780898790884987885
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2026 23:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tKs1v3La;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06198d7edd=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6585WxTE3726690
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Jun 2026 06:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=/kgLvsvDcJ/fdXUdvcwW
	PfimtW4+SQeMyz3kuuzlg5A=; b=tKs1v3LafSax2obHoXEQ+GU60Qph2jU3FtdB
	nkpva/1qHnH7tsFMrJ/G04Cl4RovGz5kwXo8rc74K0lj9GuvIwL6jB6pbKp+nrjU
	hWlgfwo48sK5QPoADNA/mxu7zBUT/wnCajuH8Gf8jYA+ICuUa3rvGtrY6GxHncGi
	8f+T7SE5NflHhQoClcxnUk+qsxIl7bVVhxG8q6LphBH5hp+XXR8Z14al1ij7aYZt
	Qg1E3iabivKOSPW4pt4kGeQ8B0ItGTWbVdAyMBbdOnxSNBfx2Ac8tHGpVApSxUyz
	5iuXY1fRhZFR2TKgO5s5hzGJVns92cJHAq3zWdfdEOPoCuOPOQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4em8rxjb00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 06:06:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 7 Jun 2026 23:06:28 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 7 Jun 2026 23:06:28 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [wrynose][PATCH] bind: upgrade 9.20.22 -> 9.20.23
Date: Mon, 8 Jun 2026 14:06:27 +0800
Message-ID: <20260608060627.2721080-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: uReiScTOGgLAJ9ZGyU0eC09QI4ePfLnN
X-Authority-Analysis: v=2.4 cv=FP8rAeos c=1 sm=1 tr=0 ts=6a265be5 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=UXIAUNObAAAA:8 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=QgkDFlgNOwP0r1ppsncA:9 a=a1s67YnXd6TbAZZNj1wK:22
 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: uReiScTOGgLAJ9ZGyU0eC09QI4ePfLnN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1MyBTYWx0ZWRfX2nV2KYu6sUsh
 CGEPNiCA0VqdhUnd5NpAvk+vQZP8185ZAb2rhhdxH1+xGGVZbrZWrWuyPXZR5Z8cqwGY+MklXBv
 ntiuzcK4SIoqKHJ91btxEbIgVYQIJ9GFqpN3dmuL9aStWZfPAjrNgdKpu5uF5sn54nUN3D/skAq
 HulRvPY7gVrv8ClysqzQTGplma/fsjamHManYw9lwUs5Cs+0KjBZN+li5hVKx5MxFXjtWxZq+MT
 Vi59FTHDWemvbmVFov1zwFAXVwh/TJMj+q6ZCn0tXwAcmImYHGfQJWhLuhKXTUhxb835yr4XEec
 CgljMoa89WEp6ipmOTkL9JopR2mu8Txf49xZtsogdu4hkn4mcncs+EVGOCiktVIqkaf92I17UZO
 qLVGU8hRyyXTzgHFHXDpGziAbQxCfiWzg/uW1fcnrvW79xWa62ClZSZ/+ZNI1xZjYrAGT7vQifE
 sfED4u6deKH1wqRO1Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 06:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238226

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Solves CVE-2026-3592, CVE-2026-3039, CVE-2026-5950, CVE-2026-5947, CVE-2026-3593, CVE-2026-5946.

Release notes 9.20.23: [1]

[1] https://bind9.readthedocs.io/en/stable/changelog.html#bind-9-20-23

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(master rev: ef00c353d3c77fcfd70300fa25ed86555d011b34)
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



Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2D5D6CFDC
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:09:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60238.1769139661292941050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 19:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CvEfT1Fk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5483dca446=jianpeng.chang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N2EUw72055261
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 03:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0SJKMvo0N
	syz3QMOYkOQumP/Lz1x+ftfgpDEZtHqPr0=; b=CvEfT1Fk1Ty0S01JnSDV4mc57
	h7UHeW12gZ6PmIT4kMqaJSubQZYCCHax9qtUcfUzt4ZsyPkzgMedMPzFX/ywyqtK
	1fzcIaSWFz7l/F1cvK71BXOML/I9fJBN3+zZmYhOl6DIiEKvF/fI7AMNauzvIapG
	+w4xO4ahrob/u6xXocvkYq7YCwK5qsfi44E/YpzqFkm8GWa7k03aMJjWjDXuoqxH
	wGGABDAwgC0YAWRwXYNXYiw2/VaRPN965HyFVhs8l2ZxbEg4O7PuY9HtSAG+O2nj
	Knzah6XDT/0OR+4uMZf835MQIHlX8wOoSkONJ25Imuv1NZ9G+nyNtEhYguraw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btncwkmn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 03:27:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 22 Jan 2026 19:27:49 -0800
Received: from pek-lpggp9.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 22 Jan 2026 19:27:48 -0800
From: <jianpeng.chang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
Subject: [OE-core][PATCH] alsa-utils: fix dynamic package splitting dependencies
Date: Fri, 23 Jan 2026 11:27:47 +0800
Message-ID: <20260123032747.99010-1-jianpeng.chang.cn@windriver.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Proofpoint-GUID: 7-2u4rnT0DMsxJVJ5AUlDhOhM14UQlv8
X-Authority-Analysis: v=2.4 cv=ecwwvrEH c=1 sm=1 tr=0 ts=6972eab6 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=93zrneob2oEqwdIucN8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAyMiBTYWx0ZWRfXx0dfAtoZCeeW
 4jsEEIglEU/WAA+Xj6Z6X1ufszAK/f+XCvFfOOfXNGpDt5Wu55jMW/oVL22HmH3EFn8FRPE3wLQ
 Cm7eXPEOhBlDfORCRS44HUTnq7B0vxrC65DuVGH148e5icPogRsPyBGhj88QMaTpsSnY21xBroW
 hvWMvP0af0mJqyJyGR3IKBJNGAzYBCRWCD25Zl2WRvYTt3LIP5VNf4PZuByvkxzEcP+/vLVmtD8
 PHCHBxy3ixV3o1Ae3P4+mZj2Z/JDtNxlyhHi6xl8glnfz6pLNayn3IGGKUn7rZzdtfBMnY4zC6Q
 QMdDFNDAWNN20kv8Hmp5MWiyLv9kGDC6Id6vJp8cN837eY0rWaHXd+zqkVhgHjRT0Q/gVYcu3+b
 dsfYZme6yGIdjNDXXJj4f490aouucTTh8mbc+l5OYFDLpNa5qN+zmWnzyA7p1PUThZNmfxuFSxU
 5SzLi3jydExU8WSQm5A==
X-Proofpoint-ORIG-GUID: 7-2u4rnT0DMsxJVJ5AUlDhOhM14UQlv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1011 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230022
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 06:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229869

From: Jianpeng Chang <jianpeng.chang.cn@windriver.com>

The commit 26a28ee7 introduced dynamic package splitting but created
dependency mismatches. The populate_packages function generates
dependencies on individual packages (alsa-utils-aplaymidi, etc.)
while FILES assignments group tools into consolidated packages
(alsa-utils-amidi).

Filter out individual tool packages from dynamic dependencies to
resolve DNF install failures:

nothing provides alsa-utils-aplaymidi needed by
alsa-utils-1.2.15.1-r0.corei7_64 from oe-repo.

Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
index 927f94afb6..86e717e7b8 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
@@ -70,6 +70,13 @@ python populate_packages:prepend() {
     pn = d.getVar("PN")
     packages = do_split_packages(d, d.getVar("bindir"), r"^([^.]+).*$", pn + "-%s", "alsa-utils tool %s", extra_depends="")
     packages += do_split_packages(d, d.getVar("sbindir"), r"^([^.]+).*$", pn + "-%s", "alsa-utils tool %s", extra_depends="")
+
+    # Remove packages that are handled by manual FILES assignments
+    tools_in_manual_packages = [
+        "aplaymidi", "aplaymidi2", "arecordmidi", "arecordmidi2", "axfer", "alsabat-test"
+    ]
+    packages = [pkg for pkg in packages if not any(pkg.endswith("-" + tool) for tool in tools_in_manual_packages)]
+
     d.setVar("RDEPENDS:" + pn, " ".join(packages))
 }
 
-- 
2.52.0



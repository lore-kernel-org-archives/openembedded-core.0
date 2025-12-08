Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19D4D3ABEF
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 09:12:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4310.1765185113256736753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 01:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A8nZIaAu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4437ee5a93=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B85ljr33715582
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Dec 2025 09:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=3pUAngVOmLRPpMvZpHOt2QjdAKjDVSyGQvWw9KDdJhE=; b=A8nZIaAultYe
	AHKdPm3DnZXITINqOGGyXR8NvDCobX5W3eSxlAR0CnvbF+geKNkthB2feCvfA/WI
	Gf0FlEHt1v7D4iGV+ILFwuC2ZgCw68Gk2pz7P6AxtWb06TZaYvMREtrDgvD8DiGY
	v40BWZklZ9lPTSm37JYifYV6QSS9ja3dKTCV/FO6G800TrXpu2ZvQifIvL6cQeNH
	x43XvTJGu5iC6xcOwpewQ9bK1S0XPWqsi6ZygzUdMoljXZP795K/np7LEMLden3x
	Dzek3j0uShboW8g3yGN77u7+Sq3THhJOw5En0BldWljHhx8WO8zDBlaSObTe4GXX
	EUBNZUlakw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avb741es1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 09:11:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 8 Dec 2025 01:11:50 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 8 Dec 2025 01:11:50 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] go.bbclass: set buildid to empty string to improve reproducibility
Date: Mon, 8 Dec 2025 17:11:48 +0800
Message-ID: <20251208091148.368769-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251208091148.368769-1-changqing.li@windriver.com>
References: <20251208091148.368769-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DWyjpUWodnCkFze6OFx_a9Y8GqUiGPEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA3NyBTYWx0ZWRfX1hDpMMHFhqAt
 oYyIjGLdc0qQ/a/rg3jYewgg94NK8hZwYAFe8/OOmbgproVp/QzyAWWgKXxc+IXyUHZEZbuaxFS
 5k+Jr/Uyo1Wxb1eFsJ31BQJLaKjZEf2HW6IQ7UN9VpA8ECTNJaLgOJKBWEaNSI6JkUKbI2bh4HD
 j8tYCC/JX+u/qB8Xox3DL0a8aerfWFnS2rUrcYO9XVU4MdntrH1n5MfGw9Fd2g1pdINXIfL75m7
 1MJrZultaqv6bux43Wpq66k4pb+K4kv7IHpPFuqnRwevBqiQAwtBRuBDpAeISeNWlWAL7O7PMzg
 AYLZPkRb+vcSJlaSBhWtZHQfWyW3/8kDiPLh+4lCoDkLdj2NsWsDXMNi5aSgCPE6VsxmNg6KGnh
 ZhdsdhZkSaxXHKyDMzL2HBTxpGbk1A==
X-Proofpoint-ORIG-GUID: DWyjpUWodnCkFze6OFx_a9Y8GqUiGPEK
X-Authority-Analysis: v=2.4 cv=EpzfbCcA c=1 sm=1 tr=0 ts=69369658 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=-F9jKkAbXiNoVbUZtMcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 09:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227381

From: Changqing Li <changqing.li@windriver.com>

Seems there are other things making Go BuildID not reproducible, set
buildid to empty string to improve reproducibility, open a new issue
[1], and refer an old issue [2].

Refer:
[1] https://github.com/golang/go/issues/76743
[2] https://github.com/golang/go/issues/34186

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-recipe/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index ed986ff5d4..2593368af7 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -50,7 +50,7 @@ GO_RPATH:class-native = "${@'-r ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE
 GO_RPATH_LINK:class-native = "${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
 GO_LINKMODE ?= ""
-GO_EXTRA_LDFLAGS ?= ""
+GO_EXTRA_LDFLAGS ?= "-buildid="
 GO_LINUXLOADER ?= "-I ${@get_linuxloader(d)}"
 # Use system loader. If uninative is used, the uninative loader will be patched automatically
 GO_LINUXLOADER:class-native = ""
-- 
2.34.1



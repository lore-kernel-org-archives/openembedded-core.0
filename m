Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A82BCAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 04:09:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11304.1757995782418780935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 21:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NakE25QZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=135445e4e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G1A2HD1038652;
	Tue, 16 Sep 2025 04:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=qKWKxKUGMvoBxz7WMEkAxq/pL+gqfQR3IBi+lGliPIA=; b=
	NakE25QZCVRj68+GQITdyHXJ68IBsxj6vBbHSb+vmkBbPUJqEDZXo2Q9Do8kPKGp
	aBvTs0Pq9oeBrIJGbe7rhLDISVNonpW0cGlMCGMtsS1nj7HeU/thb2Q7DYPfgOzO
	paQk1zPI6ODT3C8d6hbef4mSqEa5gPuK/epf8fkPLS9bBGY+XdyecYy1hHa32e0o
	p8RQC8xXRsxwTpRW1ZRikYFbEaotKlHn2aW2OoE+0bd1Kq+/1FV6p7HDsbqvZao6
	f7HS5r8c3MgmoD1VJSZ6hmkU2KLbBHhkHwAfn1Dris4igbcSu4mqEm94rDd8hQ0p
	mRKP2ChALGIEJr4Nn4eR3A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 496pekrha6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Sep 2025 04:09:39 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 21:09:38 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 21:09:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH 7/8] debug_build.inc: override MESON_BUILDTYPE for meson.bbclass
Date: Tue, 16 Sep 2025 12:09:26 +0800
Message-ID: <20250916040927.103722-7-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916040927.103722-1-hongxu.jia@windriver.com>
References: <20250916040927.103722-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAzOCBTYWx0ZWRfXxWQKJYiRGC/o
 +TgF/XjC9UvMuRzL5PES8matjlTbdiEOPh5efN/00BWoKOojUZAgSrWaVenxqZBra5zInIfaC08
 gjgobcH20+D9TFwFC8m8zMKZmA42gIhPsxa15db0a7AqEMnB+9xy3ZdJTFkniYKjaUuODi5j1tN
 AUY1TyYwGWZP4WtYYbNYYcUQspA6Bv49U65mYHfB0ek/2rvEekTptFNCs+je9o9XptoTI+cDjEh
 TmjIRodxIF4E8YtLtx7FW1Z4u6fQOuHF+cPHIp3Wen44DKg2MHHI9AyIQjwtbL9wMNri2mKKGb0
 gKrnrAkfilvtvKxb5EbzlVs39qaHT+ggvxvZiYJKKTtVz4oA1T1nlQR0Gt/Zzs=
X-Authority-Analysis: v=2.4 cv=DYAXqutW c=1 sm=1 tr=0 ts=68c8e303 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=NExZSWpPQYzSdC6iAAoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: dzqWG8MZ4SkGWDDYbGFMPP6ZnvR1EgMj
X-Proofpoint-GUID: dzqWG8MZ4SkGWDDYbGFMPP6ZnvR1EgMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 04:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223522

The debug_build.inc is used to collect debug build configuration,
override MESON_BUILDTYPE for meson.bbclass when DEBUG_BUILD is enabled

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/meson.bbclass        | 3 +--
 meta/conf/distro/include/debug_build.inc | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index c8b3e1ec29..0944ea03cc 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -28,8 +28,7 @@ MESON_INSTALL_TAGS ?= ""
 def noprefix(var, d):
     return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
 
-MESON_BUILDTYPE ?= "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain', d)}"
-MESON_BUILDTYPE[vardeps] += "DEBUG_BUILD"
+MESON_BUILDTYPE ??= "plain"
 MESONOPTS = " --prefix ${prefix} \
               --buildtype ${MESON_BUILDTYPE} \
               --bindir ${@noprefix('bindir', d)} \
diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
index 6e28e76b44..33fd92e005 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -46,3 +46,6 @@ CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
 # No strip sysroot for cross and native
 INHIBIT_SYSROOT_STRIP:class-cross ?= "1"
 INHIBIT_SYSROOT_STRIP:class-native ?= "1"
+
+# For meson.bbclass
+MESON_BUILDTYPE ?= "debug"
-- 
2.34.1



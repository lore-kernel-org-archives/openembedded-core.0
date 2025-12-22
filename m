Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB16E674BE
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 14:54:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81397.1766415258283006823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 06:54:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Xnhm4UeI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44517665e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMCoGxJ2808429;
	Mon, 22 Dec 2025 14:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Kv51HrqQvV3UT5LeHkBSPq0Xv8AEVM10N+WsTmavwOA=; b=Xnhm4UeITYrW
	/LiyFkQ6Cdlvb9fkmOYLEsBklLXzXGrDlHtBeGie902PRgrhtyN34XlaN111CloJ
	6NUAILeH3X/6Ade/FZLANXEOnf0WcS11IGkZGGRXPdl8ejhdxxshZ8abW5pQBz2C
	V+jp0p5Ncx6KsNDSV2mAH1KsrOg7rbvpqCCYJow1Pd3iDRu8tjmGik0EKJamdT5m
	ElcSroKZEw9H19F1MFTJmiDtDpOby5A2TGAZjzR1VwkYozDmSpp2f0cZe5aXcIJ5
	wg4+dGcZgqgISFDlBBvuq0dIYy8EJenL/WDSJgCf3o2ZqSzfz2GdEHhWOsi1qnbe
	Dj9g3PW3gw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js71u6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Dec 2025 14:54:13 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 22 Dec 2025 06:54:12 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 22 Dec 2025 06:54:11 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <peter.kjellerstedt@axis.com>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v7 3/6] debug-optimize.inc: override MESON_BUILDTYPE for target
Date: Mon, 22 Dec 2025 22:54:00 +0800
Message-ID: <20251222145403.3688113-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222145403.3688113-1-hongxu.jia@windriver.com>
References: <20251222145403.3688113-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7y8D_wpRuKyVZwAOch4kPOPW66muBuQk
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=69495b95 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=rv3B5ZEdiUnhOF910woA:9 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 7y8D_wpRuKyVZwAOch4kPOPW66muBuQk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEzNSBTYWx0ZWRfX17H+WvDgeOcB
 9C+P0E9t6i+9Lo9yMHB5rMMBjOrI6n5qjATqonK47h8rYtxAXT/iPudtGdLzYT0JePm2cqD/SZ9
 3hKkyigkHdQHa0ei9CPdtz4zFmPz1Koe/DYRw6/nb8HHZBp/U/oJnsXeid3PyrWk7810CDiFBY1
 i4WEA9UycCIv0v2bAGAXTfmHh91aA8y0/LZUgWacyrivu/TY7kbC3+8C9EuHwVc/nu+miay9OEA
 wOQtuD5hqDJ1Eyhl9dQzV1pvRcFwcGyCq5XWFTv3QwVyEMGtaNyfXBZy8RpRn4K7VH8TfeVBIlv
 jeFxyVjPe1PYuDGhXWdzThOluZ9Vl5wWYcdGYKmVVnteVGNOnagpgu566eyz6mbgPpEmooC5gNq
 dyvqBOQ2iL4isVJC+Qx7ZbMOaVuxr253tpuQZtWzSy7bpmWmaViuDaBL+zgcHuxy213Tc1NSoYz
 h1CS7Vq7jw4wYvL5QtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 14:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228306

The debug-optimize.inc is used to collect debug optimization configuration,
override MESON_BUILDTYPE for target when debug optimization is enabled
(fragment core/yocto/debug-optimize)

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/meson.bbclass           | 3 +--
 meta/conf/distro/include/debug-optimize.inc | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 2c098771fe..0b857ef22a 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -25,8 +25,7 @@ MESON_TARGET ?= ""
 # Since 0.60.0 you can specify custom tags to install
 MESON_INSTALL_TAGS ?= ""
 
-MESON_BUILDTYPE ?= "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain', d)}"
-MESON_BUILDTYPE[vardeps] += "DEBUG_BUILD"
+MESON_BUILDTYPE ??= "plain"
 
 MESONOPTS = " --buildtype ${MESON_BUILDTYPE} \
               --prefix ${prefix} \
diff --git a/meta/conf/distro/include/debug-optimize.inc b/meta/conf/distro/include/debug-optimize.inc
index c11d792094..3f22aebbab 100644
--- a/meta/conf/distro/include/debug-optimize.inc
+++ b/meta/conf/distro/include/debug-optimize.inc
@@ -40,3 +40,6 @@ EXTRA_OECONF:append:pn-nativesdk-debugedit = " --disable-inlined-xxhash"
 lcl_maybe_fortify:pn-vim = ""
 
 CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
+
+# For meson.bbclass
+MESON_BUILDTYPE:class-target ?= "debug"
-- 
2.34.1



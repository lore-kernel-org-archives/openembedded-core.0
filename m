Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DB1CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 07:53:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3978.1760082797390946561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 00:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EUlGOxx8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=237871debd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59A6pdQg2827041;
	Fri, 10 Oct 2025 07:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=i9mTn9Ai7JsyxJIvr29bDFGmh/0kloZzKcmNboTP+RM=; b=EUlGOxx8Ugv0
	Tqjff+8EzKA0l1IkPXX0YNRoGaBstLcK07wrTxVQcHzfiJb0PetFCgeWJF59HnzQ
	K9z8L6jqlGKR+n7tTle6O6BYNFwYu6vjq5EUARaqRdKOeyharBalpjjrxEqvTDUf
	ccXfUSj84eKiC0kf4vVe4DHrxKeovnllISrVL/v6KdS08yZ2eJPRkMZR0VcimWqg
	+R+hZzTEV0K5XrHPRfr0XkFMEcg7Jq17ZQWpjPG1rD5MTi8QeZ+EqcpMvcTbkJVc
	zGh9S2Fr+s4JcQW/OuO4Ybq8mffb3K6sGpbba/AVbDeGcwh3oorlFVxSABXaOxMy
	1cH6iWYcSQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx2ystw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 10 Oct 2025 07:53:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 10 Oct 2025 00:53:06 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 10 Oct 2025 00:53:04 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <peter.kjellerstedt@axis.com>, <randy.macleod@windriver.com>,
        <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v5 4/5] debug_build.inc: override MESON_BUILDTYPE for meson.bbclass
Date: Fri, 10 Oct 2025 15:52:57 +0800
Message-ID: <20251010075258.2161972-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010075258.2161972-1-hongxu.jia@windriver.com>
References: <20251010075258.2161972-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wd8BqkhX c=1 sm=1 tr=0 ts=68e8bb63 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=NExZSWpPQYzSdC6iAAoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA0NSBTYWx0ZWRfXwyoL6B/2ur/k
 /80YpIMGQvHYD1v2LvjSe3kWOFprNf2tayepOwpAtoKVn5aII6X2IeRcBJLtpYYwWThiA89BUq2
 K5sKPAulI9PGDgqRqIHrRTStqtZ2x8njxB6aQiSVj8tGQzbkMUHWIe+PjrHPvK/lOqRfUc9MBYE
 /NnJxA/yjuyHPLWGMzIxRnw4M7hx1sHRUaiAYt0uydfCUuSqFxX4FZHSejVz2lrsIuknWt26t6f
 YW0TrrFWlttfgqskgglfJWKTT4oYOWxQ1hX3CvP544sL3NFLOMWlBW3r9qX35VNwK3Ld20eqJ9t
 3lebSuU8HIuuNHssJhOMkxuUeKnylZgGrsisJkTZLhwayw5GLz7IETvZ6Z6ueSc1UBMGuzATjni
 pKRsWYZi2uxV0CCP5L6NlJ57kH7uMw==
X-Proofpoint-GUID: wHLlJgfMD_CuqXKK9UMdZ6Ae-MrMXTC-
X-Proofpoint-ORIG-GUID: wHLlJgfMD_CuqXKK9UMdZ6Ae-MrMXTC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 07:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224671

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
index 1062326417..c8e2cf90cf 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -44,3 +44,6 @@ CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
 # No strip sysroot for cross and native
 INHIBIT_SYSROOT_STRIP:class-cross ?= "1"
 INHIBIT_SYSROOT_STRIP:class-native ?= "1"
+
+# For meson.bbclass
+MESON_BUILDTYPE ?= "debug"
-- 
2.34.1



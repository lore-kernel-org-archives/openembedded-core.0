Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30F0D65C6C
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:24:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17517.1765985069104958713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OOHmILuL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAVSHO2092155;
	Wed, 17 Dec 2025 07:24:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=uUCEBesp0NGEp6OG3LnXRNpb8xxPp1A0qfI0/ao6Ni4=; b=OOHmILuLLUB5
	7wmewQFr0vDYPZQVDym1RE0xIHXytXWhp0ZNlV1NBFVWAC9XG5oQjvDlBDHhMp0p
	lm68ggg9RTd3zNbIaXnyJSaYOCQC96aO9utW85KOW2M0mGrYcVs3WWZgfPVyJYEZ
	50A+iiZXmpfd8ov5dDp+W36AD4AAE0AJZQ0r43bpq8WvolX3Eg4joj4aJD3ilHWy
	y1SVWkPTqtYpjpHIAneb26sxwi5KgVZwm7FM56yGeVcEG4Pkz5PYtqklKPGLLX9F
	6tC29m7POpawH0lngyahBwp2oH08i9Y/uQCDbGwieGJ7mHGxDTbRv0BBa++m1nWG
	g+kwZixAHQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0sgqug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Dec 2025 07:24:26 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 17 Dec 2025 07:24:26 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 17 Dec 2025 07:24:25 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v6 4/8] debug_build.inc: override MESON_BUILDTYPE for target
Date: Wed, 17 Dec 2025 23:24:17 +0800
Message-ID: <20251217152421.1181080-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217152421.1181080-1-hongxu.jia@windriver.com>
References: <20251217152421.1181080-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ybFCJUDNJtAgGVntbuB0s8hNIc6e2lec
X-Proofpoint-ORIG-GUID: ybFCJUDNJtAgGVntbuB0s8hNIc6e2lec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyMCBTYWx0ZWRfX8Yw6T+8eohAA
 q9AgaFKJLGNQL+b5GQKaQnWfppLPOktN4BPeti9ZCZ4Re7pGFxuZncGuqQKFFJQlpSQnnevzPKb
 /eoGbuEBcah+u9jlBQdALyuIpXCnt1n9Hv1d0UPAKXFnINd/AdZ3pcOMTAh43/sEU+lk+0BP7yt
 C1aopXMi3PH+jk9IDzbvUEjYCU9n4BQ+8UFveI9FUnDOeWxtSHoIs7vQAez8LCyssMR8fJaEOL/
 JiD5e/LbkqiEyDCGnoXoPROXQuevQFeI+ne+BjrvHvulxtapk7IVcJo4U/osK6l4vvTgMEwrcrl
 UzA1RKBCVG+GekdeotX/TaTIVvew91yU/TY5GTd0ZV1r6caYtG7ayB+cJ7PTqmndHkR1bBLYRTq
 PA+P99hS5ZmubnCz2/+p1bfh9q3Mnw==
X-Authority-Analysis: v=2.4 cv=PqeergM3 c=1 sm=1 tr=0 ts=6942cb2a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=rv3B5ZEdiUnhOF910woA:9 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228058

The debug_build.inc is used to collect debug build configuration,
override MESON_BUILDTYPE for target when debug build is
enabled (fragment core/yocto/debug-build)

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/meson.bbclass        | 3 +--
 meta/conf/distro/include/debug_build.inc | 3 +++
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
diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
index 5562cdee89..2fa0d513de 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -40,3 +40,6 @@ EXTRA_OECONF:append:pn-nativesdk-debugedit = " --disable-inlined-xxhash"
 lcl_maybe_fortify:pn-vim = ""
 
 CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
+
+# For meson.bbclass
+MESON_BUILDTYPE:class-target ?= "debug"
-- 
2.34.1



Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B23ACAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 06:54:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45734.1758524085165905783
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 23:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aCvFzcX4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13607bc8d8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58M3o2HK3322630;
	Sun, 21 Sep 2025 23:54:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jcrGfuM8jC54F7Osc2NaBDhEVDrQ0j14Ooip7oEtvLU=; b=
	aCvFzcX49dCv+qrmdI4rYeGPid2Uj0qUzCStyKvVx8UtGgR1cA86XHkNbQ1xzlUd
	kJ6bgx2yi3M4rHA4pWFXLSPdxXWjvIwg1R4Pu3bdj3VNt10qwvxVKE6iZpV6C6Fc
	O3HCra6Yv4yXOiwKZtUoq+BvlJlSkaTGhVMK5X2urm4OJheT6maf7ppRNjgRcZvl
	K2xgdn6wXFVw7yl1F+0Zq19uzPEUjTCgXiRiVw/qsA70IwukAh2E8qqEMYe/mc7W
	JeZQdLc3CtWunn0OBNvGBZEk4QXkYJ0cSNPgAcItFaaBhMLdUBkOh/47IFsE8n7v
	ZJOXltHN4c0VZa7jRf0CBg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499usfh6cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 21 Sep 2025 23:54:33 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Sun, 21 Sep 2025 23:54:33 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Sun, 21 Sep 2025 23:54:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <peter.kjellerstedt@axis.com>
CC: <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2 9/9] debug_build: defer inherit bblcass debug_build when DEBUG_BUILD is true
Date: Mon, 22 Sep 2025 14:54:31 +0800
Message-ID: <20250922065431.3782711-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <18669FECD58FB457.22280@lists.openembedded.org>
References: <18669FECD58FB457.22280@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA2NiBTYWx0ZWRfXyPRiwuy4iUsn
 BUAmb8TXL1tvqkpqik7r+jLdS/sSImJBl3oFAS1DNdQNdh8xNZ0TG8PQw18P4zo5PBs/iTn7ra7
 57wJdGqNe2r5ntPh8Re/g5KlbolX5dmxdHluG8jg0Fdf748/1TaVXForJIHhO/Rqa3RNHpyNgrs
 NRgEqXH7Sq9mDFAZ0OVP8i0ABKC4hb7Ms/+630emQbANxNm1Si5sqfip/MxcNduEc8GhwqArVCo
 XtR2VaGSMeCGEYOwoL4/bg0fb8YC0EogLhNmLQ7wEwA/uV4phGJzRlznKlmztK42Z88sk2P/V8i
 YRx/f9kZ7xvf5nCjW/Nzl5NWVZMdm01uC40zu1r6Op/96b07HGRI6s3kNVLdc8=
X-Authority-Analysis: v=2.4 cv=DrxW+H/+ c=1 sm=1 tr=0 ts=68d0f2a9 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8 a=_IcQNydaNw-27LbrwiMA:9
 a=VLVLkjT_5ZicWzSuYqSo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: x1SdoNgz0Q9EOAv4PpH6c6hb_27AeA0r
X-Proofpoint-GUID: x1SdoNgz0Q9EOAv4PpH6c6hb_27AeA0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 06:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223806

While setting DEBUG_BUILD = "1" in local.conf, the debug build is
enabled globally. For the recipe (such as qemu) which doesn't work
without optimization, we have to set DEBUG_BUILD = "0" in the recipe.
In this situation, conf/distro/include/debug_build.inc is included,
although set DEBUG_BUILD = "0" in qemu recipe, the debug build is still
enabled for qemu and break qemu build.

This commit defer inherit bblcass debug_build when DEBUG_BUILD is true,
then include_all so that debug_build.inc is only included if DEBUG_BUILD
is actually set for a given recip

Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-global/base.bbclass        | 3 +++
 meta/classes-recipe/debug_build.bbclass | 8 ++++++++
 meta/conf/bitbake.conf                  | 2 --
 3 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes-recipe/debug_build.bbclass

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 6de17d1bb5..0f4398e26f 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -35,6 +35,9 @@ TOOLCHAIN_NATIVE ??= "${PREFERRED_TOOLCHAIN_NATIVE}"
 inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
 inherit_defer toolchain/${TOOLCHAIN}
 
+DEBUG_BUILD ??= "0"
+inherit_defer ${@oe.utils.vartrue('DEBUG_BUILD', 'debug_build', '', d)}
+
 def lsb_distro_identifier(d):
     adjust = d.getVar('LSB_DISTRO_ADJUST')
     adjust_func = None
diff --git a/meta/classes-recipe/debug_build.bbclass b/meta/classes-recipe/debug_build.bbclass
new file mode 100644
index 0000000000..a917e9cbc9
--- /dev/null
+++ b/meta/classes-recipe/debug_build.bbclass
@@ -0,0 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Allow other layers to add their own debug build configurations
+include_all conf/distro/include/debug_build.inc
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f9818d2a06..93fd57548d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -830,8 +830,6 @@ include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
 
-# Allow other layers to add their own debug build configurations
-include_all ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_build.inc', '', d)}
 
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
-- 
2.34.1



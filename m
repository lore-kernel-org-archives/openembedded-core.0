Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A722BCAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 07:55:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10908.1758268543976553995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 00:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZRx7Jihf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=135712f5a8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J6ZkXQ1805908;
	Fri, 19 Sep 2025 00:55:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Vp9FoF1hUS3KsWrma65y3tr9ActFSaBOYPbWEb8BaW4=; b=ZRx7Jihf86JW
	QwNKfJq7lLMKP/35hJ0tVhL9ds/SgAw5oP1w3cs9sTVsXPUe0c/gLqjHHS1feQmp
	w3aoT+28KoNiPf+wtu8ysHgnvvY70frSc+Oz1AMBvVza2JNgV7A2x7AWNedQtff8
	4VvEuK1+/IqtqWRy+q0Tx8bbpQ6UkOuumb1QzedsOKOgKg61kkea3l/W4g6gkt0F
	lk9L+yP9x9+jsIz9a35F4we01fgwVAegPROy5DgypGX/cgggoAO0np412O7qGUL4
	sIb7RJyKMiqqfSA7DoITaMzpY5KyVdnQQPlJLTKjLp06SV8ispDaMJche3j1THCE
	5XCKftOKcQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vne88uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Sep 2025 00:55:39 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 19 Sep 2025 00:55:38 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 19 Sep 2025 00:55:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <peter.kjellerstedt@axis.com>
Subject: [PATCH 9/9] debug_build.inc: support disable debug build for specific recipe when DEBUG_BUILD is enabled globally
Date: Fri, 19 Sep 2025 15:55:36 +0800
Message-ID: <20250919075536.1744673-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1865A7D84B34509F.11775@lists.openembedded.org>
References: <1865A7D84B34509F.11775@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=FbM3xI+6 c=1 sm=1 tr=0 ts=68cd0c7b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=69wJf7TsAAAA:8 a=t7CeM3EgAAAA:8 a=LcyfQ99H4bsISVGycWMA:9
 a=STXwoKBC1RUA:10 a=Fg1AiH1G6rFz08G2ETeA:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MfrUv42wHl8F6fkad5Z1dsFgVcrCe1vX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA3MSBTYWx0ZWRfX44sIwk8z+4YR
 J8Ssi4McKlhWUloUiwM/+GuVyfUP6QNfhq1NgSBZCiqVgTMWAZjy4rh4mdfUQzpXhwhPix7FmXf
 6aUnSO2zu+kr55Dq27n8S0p+gokfy2uHTKvUF0fchAq9agrxEbgbfUpNGomtE5NPc9wetf5dwpM
 3uZE/Gj3ZA7QbFxN+Uo4Y4r7G9PEbb6DcM3UBnnr8SSCYlLNrA0pIroDDRwP6Ri7KhCm1DiGd/g
 uIXpAYcRSqSQw0vnMKxajjc7JNqhAKuHczlBsjVoVEp+2nInQNSIFyo1rG1SwKQKZSaiELqptsi
 4efck2NMyFA10FDC+VPAMLZDT6pmbmIn0jAEFBc6F1/8cbXD2xriXLnSqkU+tE=
X-Proofpoint-ORIG-GUID: MfrUv42wHl8F6fkad5Z1dsFgVcrCe1vX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 07:55:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223727

While setting DEBUG_BUILD = "1" in local.conf, the debug build is
enabled globally. For the recipe (such as qemu) which doesn't work
without optimization, we have to set DEBUG_BUILD = "0" in the recipe.
In this situation, conf/distro/include/debug_build.inc is included,
although set DEBUG_BUILD = "0" in qemu recipe, the debug build is still
enabled for qemu and break qemu build.

This commit sets SELECTED_OPTIMIZATION, BUILD_OPTLEVE and
BUILD_OPTIMIZATION conditionally according to the value of
DEBUG_BUILD, then disable debug build for specific recipe
could work

Also move DEBUG_BUILD setting from qemu.inc to debug_build.inc

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/debug_build.inc | 18 +++++++++++++++---
 meta/recipes-devtools/qemu/qemu.inc      |  4 ----
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
index 81b6a5f234..c3f19666e6 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -1,10 +1,14 @@
 # Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled.
 DEBUG_OPTLEVEL ?= "-Og"
 DEBUG_OPTIMIZATION = "${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}"
-SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION}"
+SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
+SELECTED_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
+
 # compiler flags for native/nativesdk
-BUILD_OPTLEVEL = "-Og"
-BUILD_OPTIMIZATION = "${BUILD_OPTLEVEL} -g"
+BUILD_OPTLEVEL = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og', '-O2', d)}"
+BUILD_OPTLEVEL[vardeps] += "DEBUG_BUILD"
+BUILD_OPTIMIZATION += "${@oe.utils.vartrue('DEBUG_BUILD', '-g', '', d)}"
+BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
 
 # The modern compilers and code seem to require extra steps to avoid DEBUG errors,
 # this file collects debug tuning configuration to address DEBUG errors.
@@ -53,3 +57,11 @@ MESON_BUILDTYPE ?= "debug"
 # For cargo.bbclass
 BUILD_MODE ?= ""
 BUILD_DIR ?= "debug"
+
+# Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
+# upstream states qemu doesn't work without optimization
+DEBUG_BUILD:pn-qemu = "0"
+DEBUG_BUILD:pn-qemu-native = "0"
+DEBUG_BUILD:pn-qemu-system-native = "0"
+DEBUG_BUILD:pn-nativesdk-qemu = "0"
+
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2ee76e9a7c..7bd28dbbb5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -58,10 +58,6 @@ COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 
-# Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
-# upstream states qemu doesn't work without optimization
-DEBUG_BUILD = "0"
-
 do_install:append() {
     # Prevent QA warnings about installed ${localstatedir}/run
     if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
-- 
2.34.1



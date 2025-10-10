Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE6CCAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 07:53:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3761.1760082793108994605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 00:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cEZy1dy8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=237871debd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59A6pdQf2827041;
	Fri, 10 Oct 2025 07:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=46CU5XzQEZgVQe+hxU34
	RjISlPiP9zpQR9+Z4LwWzP0=; b=cEZy1dy8gUg/lAhOchSQaRnXI/KWlTvi3qE7
	1O/i204AP1gALrWusSwHQlNjnbf7tDNHda85CuCmflQ9vntKSe9yxWIjClrnBzOh
	S6WIiLbs9YCs4AOPeFakTLdGHDrdyhGBXCU8VsGn14KYWdWg02j82raxbhPIpNHq
	EndIcd9R5Cujqfzo2xGt4QDMIo1G70oCy/Q1qU6C2eVb69Nm8bZEpAe+U9mYOINu
	sbiSSXB+0w4tCAGkkIOl4f5x0+dSsRWr7/GDpDhS4FaN+z1kP36TXo7GdUTDAUec
	F/jm1i/sYGDRHSv6KRiy8ZTv44GUWDZ1tEs2tqHwBB9uGraGSg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx2ystw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 10 Oct 2025 07:53:01 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 10 Oct 2025 00:53:00 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 10 Oct 2025 00:52:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <peter.kjellerstedt@axis.com>, <randy.macleod@windriver.com>,
        <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v5 1/5] distro/include: Add debug_build.inc when DEBUG_BUILD is enabled
Date: Fri, 10 Oct 2025 15:52:54 +0800
Message-ID: <20251010075258.2161972-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wd8BqkhX c=1 sm=1 tr=0 ts=68e8bb5e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8 a=-s1zsPrnO91zx4zN6XcA:9
 a=MBHTkq5ozfd5zzl9:21 a=VLVLkjT_5ZicWzSuYqSo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA0NSBTYWx0ZWRfX8tr2WDq4O6c8
 QzlUchpgecjbaOB5oaZlq1jp+IPhg3283yxlk/IvUMwXFL1eJl765+rh4nJMpc1lrUniiJ6j7yV
 Ka+42s/kueywZGPlho3sP4ojV0oI5GDRDPmzNnJghCxOp0BqA9miNKUIpDh6YxhnPDFFMON0LKK
 40ID6uFJwQf/0qXqxCui4mpmFf9g7BaOdBtdy3feWxCFvVB17zGBwP43HDh+S2okUAYVlB9tkCl
 JPEaQpZYcFih1EeaMmu7AkF6KTs5vFw2w1nhf+vRT7jMqEPHKRcv5Xhk47Cq7n7WYj85E+W8SZ9
 KCCxn1zPoUcgHzXoEBsPN+5LrkkP4NkVpgMr+A7/rCr+uU+J+rlFmURmL21rFtz0HCT/zrH0o24
 FF0zGQSWsWvjd/ZO9+UpybAiWWMSyQ==
X-Proofpoint-GUID: XUD-qxAkFMcFxsIxnNli2SFhDZ3mYiN1
X-Proofpoint-ORIG-GUID: XUD-qxAkFMcFxsIxnNli2SFhDZ3mYiN1
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224667

In bitbake.conf, use ??= to set *_OPTIMIZATION, add a new include
file debug_build.inc to use ?= to override *_OPTIMIZATION when
DEBUG_BUILD is enabled

When DEBUG_BUILD is enabled:
- Defer inherit bblcass debug_build, while setting DEBUG_BUILD = "1" in
  local.conf, the debug build is enabled globally. For the recipe (such
  as qemu) which doesn't work without optimization, set DEBUG_BUILD = "0"
  to disable it for a given recipe

- Use include_all to allow other layers to add their own debug build
  configurations

Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-global/base.bbclass         | 3 +++
 meta/classes-recipe/debug_build.bbclass  | 8 ++++++++
 meta/conf/bitbake.conf                   | 9 +++------
 meta/conf/distro/include/debug_build.inc | 5 +++++
 meta/conf/documentation.conf             | 2 +-
 5 files changed, 20 insertions(+), 7 deletions(-)
 create mode 100644 meta/classes-recipe/debug_build.bbclass
 create mode 100644 meta/conf/distro/include/debug_build.inc

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
index 5406e542db..52ceb76bbb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -658,13 +658,10 @@ DEBUG_PREFIX_MAP ?= "\
 "
 DEBUG_LEVELFLAG ?= "-g"
 
-FULL_OPTIMIZATION = "-O2 ${DEBUG_LEVELFLAG}"
-DEBUG_OPTIMIZATION = "-Og ${DEBUG_LEVELFLAG}"
-SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
-SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
+FULL_OPTIMIZATION ??= "-O2 ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION ??= "${FULL_OPTIMIZATION}"
 # compiler flags for native/nativesdk
-BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O2', d)}"
-BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
+BUILD_OPTIMIZATION ??= "-O2"
 
 ##################################################################
 # Reproducibility
diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
new file mode 100644
index 0000000000..95e09e64f5
--- /dev/null
+++ b/meta/conf/distro/include/debug_build.inc
@@ -0,0 +1,5 @@
+# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled.
+DEBUG_OPTIMIZATION ?= "-Og ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION ?= "${DEBUG_OPTIMIZATION}"
+# compiler flags for native/nativesdk
+BUILD_OPTIMIZATION ?= "-Og -g"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 741130a392..2a7418ccb3 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -129,7 +129,7 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] = "Defines which layers to include during cve-c
 D[doc] = "The destination directory."
 DATE[doc] = "The date the build was started using YMD format."
 DATETIME[doc] = "The date and time the build was started."
-DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable."
+DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable and includes file conf/distro/include/debug_build.inc"
 DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_LEVELFLAG}'."
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
-- 
2.34.1



Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACFCCAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 06:17:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26097.1757917043524152165
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 23:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ljnaKNWo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13531ce467=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F5q3rX3730768;
	Mon, 15 Sep 2025 06:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wCmfcJKJpmDMdjM35204qNHx1+/XtmH9Idxe+qDwrOs=; b=
	ljnaKNWogBW86+hhbP3X3W28E1K9cwW2bcNPlA1LLoQ3jzGQR7j22lQmVkIYNFME
	cQ5plBwTZdocrs0b3K8VyR0Y6zkOVgwuaP0AcgnW5HsmvSNBJbh+z1RUOSQOvrzv
	7Cb23ppMtOzdmzjvHVJJYkyK1IvQ90vQESW5mlII7fO/C24SbXWqDL8uFH7Rw177
	LlFMKATs9UEpoZtntiYd/qQwyYvPkaYbXW8xjc0/IlhweEdg33b2Ld+ZUjNx77GD
	yx+wNUmrlkKfUO0zKyifSXbvpSL3H8wvXU5CAoWJkNrsxh1xGUMDu8LRd3z9yqYC
	rttrHFDcyDugL+sxPcHDkQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu11rwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 15 Sep 2025 06:17:21 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 14 Sep 2025 23:17:53 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Sun, 14 Sep 2025 23:17:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH 7/8] debug_build.inc: override MESON_BUILDTYPE for meson.bbclass
Date: Mon, 15 Sep 2025 14:17:42 +0800
Message-ID: <20250915061743.313230-7-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915061743.313230-1-hongxu.jia@windriver.com>
References: <20250915061743.313230-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2ydUlclprLqC1cqhPQbQD1DFakWt4jhH
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c7af71 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=NExZSWpPQYzSdC6iAAoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2ydUlclprLqC1cqhPQbQD1DFakWt4jhH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NSBTYWx0ZWRfX6d5og/2tVher
 sx/tUdD6ipdQgFQC3fqqm/jTYtM7fwxdli+uP3xf3svCmw+QhwE9hN4EccJxQlx4Sj5cgLJJG9l
 94EMiQUw/ExW/SZiHRep27/K8RO2/yWLuZAGW0/oC7iOQnMmENDXBuSdbeePZjCDPRA2J2Vouvo
 RXp0C9I4SrcqmGDZxIhfwxB7wQ38apfSHZI7pyvOPPQ6x7GCCrK9Go+xUKr9rrWX5vcMmc4oTg+
 4MFy6wJ8svNzrz9VF3f+9jKe6bIQaCWZ6DQ1c3SX9edHjPUPyjYutBbnWmp3xFk3P31pMkhjrp8
 RwQqcw5KU6dN9Tgi32YMVZcllr0s8xYx2ICRIUxxfdcigJ007GTjbcsBlpSPxE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 06:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223383

The debug_build.inc is used to collect debug build configuration,
override MESON_BUILDTYPE for meson.bbclass when DEBUG_BUILD is enabled

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/meson.bbclass        | 3 +--
 meta/conf/distro/include/debug_build.inc | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index c8b3e1ec29a..0944ea03cc2 100644
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
index 979dd111fc9..e446a71dd3f 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -48,5 +48,8 @@ CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
 INHIBIT_SYSROOT_STRIP:class-cross ?= "1"
 INHIBIT_SYSROOT_STRIP:class-native ?= "1"
 
+# For meson.bbclass
+MESON_BUILDTYPE ?= "debug"
+
 # Allow other layers to add their own debug build configurations
 include_all conf/include/debug_build.inc
-- 
2.34.1



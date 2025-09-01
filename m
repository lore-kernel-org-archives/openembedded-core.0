Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C00CCA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 07:40:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.45905.1756712400662379374
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 00:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K8Y7X0sx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1339ccf3fc=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5815Tb5D2976154
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Sep 2025 00:40:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=PWZbmK+Lq2VJ4lTdtXzr
	Xx12ka/XcTDPU2EGY3l9I6Q=; b=K8Y7X0sxXQqny1iCFqxhVSrM3d1eaQ9Yn9s1
	+/g4aogE9eR5i1Vm3s5tv7CW8XFUk6hqqsXPZpjBjIm2exdvf1iX29DVBftjW1dD
	lHmGibssgzPrqk16uXiMVeToSZ7lMd5JlIOy+gfxiAd0jEmiB9u3mIqm7CGpkGU0
	BwAQLWEkczV2DDl8RkH8i9y7x16U0EGazX+ThVwmdJQEDPU/eZDKgj17q8qm1HMe
	UBhtgScrWIRYkMvWKhyBVFc5nwOJr9M7g9BAaLhs4m0a7VIjETlMh/ohFPYtb0h5
	SYSrgT8y7/ZitXOpkHzztdRDoRWN7NJzq3Nam2+EWGcfkrDMIg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48v0tfh4t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 00:40:00 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 1 Sep 2025 00:39:59 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 1 Sep 2025 00:39:58 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vulkan-validation-layers: fix compile failure with DEBUG_BUILD = 1
Date: Mon, 1 Sep 2025 15:39:58 +0800
Message-ID: <20250901073958.235716-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ubf7JedB8nLWi2r5LqArmuoYoPrjFMiY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDA4MCBTYWx0ZWRfXxCAGT32eVcE8
 We3sfkfQMB36tGQnjn4hAavbSA6IxdDGJuAueNBpTEDIpqRBrkG5hNXRT0cW72xbKol2vJyl71p
 UmafuKpgSSm4ouAcRpFW5wkF0GhqPwpAXs/cyRf4huB3AOsNd5ndvV7vpG/Cxz9yXhnxluUQyNa
 IIWgKeeOHkEExmP3yP0tkYNW8ppy2UIkYdsdk7M+cQXuSSuRVGN2hCwO2kW2tbeWrgPa/n06/M9
 V9KMOrMc0DdWg4KfvgrTE1MFHZ53HRc+EW6mSSWDqiyES7S977ghkoGkYdqD+Zn/BlNsi1ha8pk
 3JvZEaAOeESCvS6euLCogQuMBRAGCSrCtzBP4bkLPo78rCIDyTmxhxkZjfFhvk=
X-Authority-Analysis: v=2.4 cv=XJ0wSRhE c=1 sm=1 tr=0 ts=68b54dd0 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=NnL268Y0OYzIgYHUNLUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ubf7JedB8nLWi2r5LqArmuoYoPrjFMiY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 07:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222642

When building with GCC 14+ using -Og (DEBUG_BUILD = 1), got
the following errors:

$ echo 'DEBUG_BUILD = "1"' >> conf/local.conf
$ echo 'DISTRO_FEATURES:append = " vulkan opengl"' >> conf/local.conf
$ bitbake vulkan-validation-layers
...
|TOPDIR/tmp/work/core2-32-wrs-linux/vulkan-validation-layers/1.4.309.0/git/layers/./external/
xxhash.h:4822:1: error: inlining failed in call to 'always_inline' 'void XXH3_scrambleAcc_sse2
(void*, const void*)': function not considered for inlining
...

Refer [1], using XXH_NO_INLINE_HINTS when compiling with -Og (DEBUG_BUILD = 1)

[1] https://github.com/Cyan4973/xxHash/issues/943

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../vulkan/vulkan-validation-layers_1.4.321.0.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
index fa7873b62d3..466e757a908 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
@@ -26,6 +26,8 @@ EXTRA_OECMAKE = "\
     -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
     "
 
+CXXFLAGS:append = " ${@oe.utils.vartrue('DEBUG_BUILD', '-DXXH_NO_INLINE_HINTS=1', '', d)}"
+
 PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
 PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
 
-- 
2.34.1



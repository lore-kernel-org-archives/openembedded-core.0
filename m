Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D97FC83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 07:32:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16420.1752651162037187427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 00:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9292ce061b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G503TW1381513
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 07:32:41 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdrxhk6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 07:32:41 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 16 Jul 2025 00:32:40 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 16 Jul 2025 00:32:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vulkan-validation-layers: fix compile failure with DEBUG_BUILD = 1
Date: Wed, 16 Jul 2025 15:32:33 +0800
Message-ID: <20250716073233.3020439-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SJrKzz-4SDvm1sEACAAgc5MjGF7kCUFD
X-Authority-Analysis: v=2.4 cv=L8odQ/T8 c=1 sm=1 tr=0 ts=68775599 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=NnL268Y0OYzIgYHUNLUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SJrKzz-4SDvm1sEACAAgc5MjGF7kCUFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX0+rW8MmpoDt+
 kg203RCmzK2hKV6GBMb+3Wgj9FVK8tJthpffO1MjSYu4dc5eskO64Z8GFVGbJn42Se9Q69LTOCq
 y69jaHuldR5ZFNvLdZ5Nw5ppwGDko4vujWCtc9Il5aaVBzmv1dbUM0Z8eB4yP9b712nTfYJrbWh
 ZYqZdBAAP1RBPds5Aur0NoHje/ZI6Hk0Quw22tM802e3BXMjJWeIOr4ZXyyI3WMSEevuQKeI1uc
 Sj2aDQAKfTyW++CkYSMU5PbP1ebsGqYHt/FlMNIJhkSWmC8FNoZTPXK/2McW5n1TOscOjl1RS0d
 XyKfJN+gFr9EbJftpQnCE7wCBS36x8WvsYBHIv5tkOEjQ3DIL5XQc/t2yu60X051cm4skJpfZ49
 DuI/be+p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 07:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220435

When building with GCC 14+ using -Og (DEBUG_BUILD = 1), got
the following errors:

$ echo 'DEBUG_BUILD = "1"' >> conf/local.conf
$ echo 'DISTRO_FEATURES:append = " vulkan"' >> conf/local.conf
$ bitbake vulkan-validation-layers
...
|tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.4.313.0/sources/
vulkan-validation-layers-1.4.313.0/layers/./external/xxhash.h:4822:1: error:
inlining failed in call to 'always_inline' 'void XXH3_scrambleAcc_sse2(void*,
const void*)': function not considered for inlining
...

Refer [1], using XXH_NO_INLINE_HINTS when compiling with -Og (DEBUG_BUILD = 1)

[1] https://github.com/Cyan4973/xxHash/issues/943

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../vulkan/vulkan-validation-layers_1.4.313.0.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
index 63a3aa4ae64..c05a1d87007 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
@@ -26,6 +26,8 @@ EXTRA_OECMAKE = "\
     -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
     "
 
+CXXFLAGS:append = " ${@oe.utils.vartrue('DEBUG_BUILD', '-DXXH_NO_INLINE_HINTS=1', '', d)}"
+
 PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
 PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
 
-- 
2.34.1



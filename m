Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB22D65C6F
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:24:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17080.1765985070731180575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=d9jIfS54;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHDNgZA3275695;
	Wed, 17 Dec 2025 15:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=qjkzWq3Bxqal+PlwxyR/idFTi9bDKH+QQPNJ0qB8S0c=; b=d9jIfS54bika
	10EvlOOR2aPFVcnaNMtFyb0kYxQLT1Zan8rJK8ByiUtb7mQlqOaDpObus64ipXim
	CHqrwMU1KKZF6w75nnX4y0ejcbFT8ahUjQfPu/DiSI2CYmzwzsylept2bmRzj4dz
	SShWHGTxy1h7HMfVva7+nk+kbNd2HFEyGXZKDXQGz0z3pFdh0IYqNe4EdnY2yN2/
	QX3dTZoqKlS3JLblBVwgSfkEsKyDqoXl+DIvw5+DbS+78M1R8NSrQ2TpUu2CvV6K
	ZzddI0/P2/MzSN1bTJRkLkfwrpZtzhy7G8Bo0L6uWx7sdqtj2arRdpZKFTGu+/vf
	nwFeKy2PEg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0brr82-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Dec 2025 15:24:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 17 Dec 2025 07:24:28 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 17 Dec 2025 07:24:27 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v6 6/8] debug_build.inc: disable debug build for qemu
Date: Wed, 17 Dec 2025 23:24:19 +0800
Message-ID: <20251217152421.1181080-6-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217152421.1181080-1-hongxu.jia@windriver.com>
References: <20251217152421.1181080-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyMCBTYWx0ZWRfX618vms207OhK
 2vQX87jX29YffbiGImKn/1f6zhLCECnDtN2J10V+xaaDh+w77QDycp/XBy9UCkRzyngrG4WjmWz
 9pxOKao8qkTs13tHB/F2oPXVJ2SiivB89cvdei3mgd5BuqJoO2gWyMSswdo5tPzUPhgS9Wo3gOM
 nRqYZL0m3f4LktI2mnGdSdN3MIQbteSrGnbGTDedu7im1q1L6rUTD30nN/D+12lCQ/yx9U3+LVv
 aGQSao9ubrLc9chOlKhBke0RzkGgtZGH8a3v8pU/s+vxJdKty43eS8ECGf4JvbJETRozgjAVJb8
 J5KAQBYCW4U7RhFydeZsERPsrJ/P/Ok1lYs/lyfGiU4qNF7OwkbngUZMYXAglGfFz2MMLpdrvpO
 UnD9sIBzbKgh/uH9Z+0B3uN073a68g==
X-Proofpoint-ORIG-GUID: YPbu71cmhk0OQSYSfpN9VtDluI84V2w_
X-Proofpoint-GUID: YPbu71cmhk0OQSYSfpN9VtDluI84V2w_
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=6942cb2d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=69wJf7TsAAAA:8 a=t7CeM3EgAAAA:8
 a=ZIF5ftZXvtxY9cnOiyQA:9 a=STXwoKBC1RUA:10 a=Fg1AiH1G6rFz08G2ETeA:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228059

Drop DEBUG_BUILD, due to qemu doesn't work without optimization [1], disable
it with -O2 even though debug build is enabled (fragment core/yocto/debug-build)

[1] https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/debug_build.inc | 10 ++++++++++
 meta/recipes-devtools/qemu/qemu.inc      |  4 ----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
index 28f6ac6f6b..aadc87e5f5 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -21,6 +21,11 @@ DEBUG_OPTIMIZATION:mips:pn-python3-lxml = "-O ${DEBUG_LEVELFLAG}"
 DEBUG_OPTIMIZATION:mipsel:pn-python3-lxml = "-O ${DEBUG_LEVELFLAG}"
 # used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
 DEBUG_OPTIMIZATION:append:pn-gcc-sanitizers = " -Wno-error"
+# Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
+# upstream states qemu doesn't work without optimization
+DEBUG_OPTIMIZATION:pn-qemu = "-O2 ${DEBUG_LEVELFLAG}"
+DEBUG_OPTIMIZATION:pn-qemu-native = "-O2 ${DEBUG_LEVELFLAG}"
+DEBUG_OPTIMIZATION:pn-nativesdk-qemu = "-O2 ${DEBUG_LEVELFLAG}"
 
 BUILD_OPTIMIZATION:mips:pn-kea = "-O -g"
 BUILD_OPTIMIZATION:mipsel:pn-kea = "-O -g"
@@ -28,6 +33,11 @@ BUILD_OPTIMIZATION:mipsel:pn-kea = "-O -g"
 # {standard input}:1488805: Error: branch out of range
 BUILD_OPTIMIZATION:mips:pn-python3-lxml = "-O -g"
 BUILD_OPTIMIZATION:mipsel:pn-python3-lxml = "-O -g"
+# Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
+# upstream states qemu doesn't work without optimization
+BUILD_OPTIMIZATION:pn-qemu = "-O2"
+BUILD_OPTIMIZATION:pn-qemu-native = "-O2"
+BUILD_OPTIMIZATION:pn-nativesdk-qemu = "-O2"
 
 CPPFLAGS:append:arm:pn-lttng-ust = " -DUATOMIC_NO_LINK_ERROR"
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 63414196fa..12312e5800 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -59,10 +59,6 @@ COMPATIBLE_HOST:mipsarchn32 = "null"
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



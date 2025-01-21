Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6F1C0218C
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 08:55:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11838.1737449734119958719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 00:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31163e49e6=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L5U2XU019089
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 00:55:34 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4488f72dj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 00:55:33 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 21 Jan 2025 00:55:33 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 21 Jan 2025 00:55:32 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 6/9] meta/conf/bitbake.conf: support multiarch for nativesdk
Date: Tue, 21 Jan 2025 16:55:23 +0800
Message-ID: <20250121085526.1370937-6-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121085526.1370937-1-hongxu.jia@windriver.com>
References: <20250121085526.1370937-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rV2KWd3-5bm8-zNLygLPOvlS9UlZrT5I
X-Authority-Analysis: v=2.4 cv=GqG4+l1C c=1 sm=1 tr=0 ts=678f6105 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=t7CeM3EgAAAA:8 a=17aPSRxe4SqTchkXHpEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: rV2KWd3-5bm8-zNLygLPOvlS9UlZrT5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=867 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501210072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 08:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210078

Otherwise 32bit i686 nativesdk-gcc compiled 64bit executable file
failed

$ cat << ENDOF > main.c
int main() {
  return 0;
}
ENDOF

$  i686-pokysdk-linux-gcc -m64 main.c -o main
cc1: sorry, unimplemented: 64-bit mode not compiled in

[ YOCTO #15722 ]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ba7817b7e5..4668373756 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -922,7 +922,7 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
 DISTRO_FEATURES_NATIVE ?= "acl x11 ipv6 xattr"
-DISTRO_FEATURES_NATIVESDK ?= "acl x11 ipv6 xattr"
+DISTRO_FEATURES_NATIVESDK ?= "acl x11 ipv6 xattr multiarch"
 DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 
 # Normally target distro features will not be applied to native builds:
-- 
2.34.1



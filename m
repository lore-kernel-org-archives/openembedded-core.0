Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244A6E6748D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 09:14:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76933.1766394844497769434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 01:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S49pVRl1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4451a15d49=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM73U2w3827970
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 09:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SpeCjbw2GAYwhc+w6XcE
	83lqNVxL1Rjj2OZsqrRTnLY=; b=S49pVRl1r8LNuz8iN8jwvEB5c5g2ZyineCcr
	2hDeD7Y7x2Sab5t7le8sho5NWW2NMIFq52vWsx5E84pwfElTVZndXobuJ8l7cnXe
	i+EY1OS+Z19A84XP+u2PJoI/eXhH0gWUs0G989Ao1LfYul3TZ468ffk9AK6ItvYD
	ubflBWiqR9llIMAr4/LUW9EJq+2h6YD+7r2Sq7Vz4Et2MMuKhPTwrFnucC5yRTOb
	GbxaP1OZ685KWfPgafb5YAj3Uf4PsAd8mAFYWiJo+nihDYoKJSg6/5dfVSubFHUY
	zO/saQWv2M4If9JUdn4sCe3OrfpiQq45LQfmG6yPnRGCTyAYHA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vhnm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 09:14:03 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 22 Dec 2025 01:14:02 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 22 Dec 2025 01:14:01 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemu-system-native: disable libkeyutils
Date: Mon, 22 Dec 2025 17:13:56 +0800
Message-ID: <20251222091356.1093337-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: njgc2WVVbdBM2dpdUcyG9avw94ewcFzt
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=69490bdb cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=6BdWctLmSbLh-zIFiisA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: njgc2WVVbdBM2dpdUcyG9avw94ewcFzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfX7dFS4Mqh8hQC
 RhHXKziJHEdGCt0X16m0M1fzjWHi2C0zTNECvUHQM4tzCK4uGtapRZ5CnTg+Iql7bQEcgTbyWvG
 lyUN4azzGhuk1VpcBzyovzOJpEh3mFl/bmqeLxww5peNjQzdFvRZuZmRq/2BZMxitCFNmU0nedy
 HUQ5/JTzFi9f1LyS0hF46sxN7gqNgBiny/W1pWZYhK3EXT6lDZtmVsw+bKR2szmLkwFtpErRQie
 cmgBH+1SAZwit2xJpcyyGUx3GM+bwh3yjh/D8DFiZwAadPb3KWGRbfh1COHb5gOXWe9Pw7rk3i7
 WhTPnjmXrVfoqybI+brZWd9BSxAxu75NE4RYbVQBoLYL97skSDj6YrU2TgQ6X6v/ld3qeCBjJLQ
 2NsEvl5hGjz/UrF/TQY3JAsscw6wEmi7HLhCrRSGPQNp8VQBoDMzDwmLXfvwuPmuFiQ1W1+lJtV
 Z6993N0MmQ2+Wvk2WUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 09:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228288

From: Changqing Li <changqing.li@windriver.com>

When package keyutils-devel is installed on host and gcc in extend buildtools
is used, qemu-system-native do_compile failed with error:
../qemu-9.2.0/backends/cryptodev-lkcf.c:36:10: fatal error: keyutils.h: No such file or directory*

 36    #include <keyutils.h>

                ^~~~~~~~~~~~

gcc in extend buildtools can find libkeyutil on the host, but it will not
search the headers on the host cause above issue. disable libkeyutils to
workaround above issue

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/qemu/qemu-system-native_10.0.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.0.7.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.0.7.bb
index 22462e2499..625c4adb42 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_10.0.7.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_10.0.7.bb
@@ -7,7 +7,7 @@ require qemu-native.inc
 # and avoid file clashes
 DEPENDS += "glib-2.0-native zlib-native pixman-native qemu-native"
 
-EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"
+EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)} --disable-libkeyutils"
 
 PACKAGECONFIG ??= "fdt alsa kvm pie slirp png pixman sdl \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
-- 
2.34.1



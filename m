Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFC4E8B39E
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 05:26:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13407.1770182811868021208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 21:26:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F2qiHqlA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64953ee818=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6144e1eF949334;
	Wed, 4 Feb 2026 05:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=31ITVN92x
	v1Y8eTIvE2iDNyGNekvLMZuRBzUdhbNfKY=; b=F2qiHqlAz3WPnoCbHgyUjfEzD
	lQaBWx/HQGx2omW6RB6RUugmy/A0+IquVVJJcb0FZ75i8t6zwyYn1KAtO3nKT/Vs
	Jbh9Ussn5ZKp8Uqbzgu/+2cDEPFLZAFqPs+milNmZ3fBAJNQIJAAwNKwTrf9Bx9E
	zGtWwuuxNwM+s8yoifCPNK/tASVM1DK0zfCq9lzgMnGhQ68ag+dpNTGc8ZT38J/J
	kGi4o24WmRu70ZgFNKTfu1BYg17aE4NOaQfbudDt7fqRjfgrkKelWXmKY2rO5Azt
	HzlVesMVrO8UavP8WwzAOgR50H/viIFPXwLTlnk0dguHfZ0fFzoD2LS+JzuIg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c3vc2r552-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 Feb 2026 05:26:42 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 3 Feb 2026 21:26:41 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 3 Feb 2026 21:26:39 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rs@ti.com>, <ricardo.salveti@oss.qualcomm.com>, <raj.khem@gmail.com>,
        <antonin.godard@bootlin.com>, <richard.purdie@linuxfoundation.org>
Subject: [PATCH] lto.inc: add DEBUG_PREFIX_MAP back to TARGET_LDFLAGS
Date: Wed, 4 Feb 2026 13:26:38 +0800
Message-ID: <20260204052638.284617-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAzNyBTYWx0ZWRfX/WtZ3Hvn8Pv8
 qGzwxxDeD9J999fVOtdJNPnS9Wak192aj5YKLbsU/bvXhVuklRAmGB2+kFixqseh8TvYa98pKhw
 1mPLPHc0Vl1b3gVoym6cRkE9oMBgft1N4vt4VS1zAbFTmDW26NvCswzp6hsbWdX0gyEziVEIju6
 /RAqxFhhA2sG31RVpliY1xP10qQ2hBVlb5pTlWm/xdZj0NPYs04WpSupPb9hf7nv5rHPUmxIS7o
 Xhapw1yY0nnawcpDCqkLBWA5vSxsFudd2zfjAd+bJC7ncH874+7Pd+JbZ7QmkB7K4QphsC/tQto
 L/z6I31L1x7RoMgklAN+t8DxaWfpw7KjIzBOT67tJFwaE82E1Y7AcZ3l+YGmYfaHnlm4fokf71d
 qgWOIXXdT4FIjKLd4kFQA+v6Xcaa9TBojDAAWyp7FUX5ox/7if+7rzPag1NydXl99WlivPQUzGS
 Ni3jaEVm5MT4spb9R8w==
X-Proofpoint-ORIG-GUID: w3aDRK4lNX5PekJREW8QLkSYuYIa05Ai
X-Proofpoint-GUID: w3aDRK4lNX5PekJREW8QLkSYuYIa05Ai
X-Authority-Analysis: v=2.4 cv=F8Zat6hN c=1 sm=1 tr=0 ts=6982d892 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=Xa5wyZDDmWnxZqEXISQA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 05:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230494

From: Changqing Li <changqing.li@windriver.com>

DEBUG_PREFIX_MAP is appended to TARGET_LDFLAGS in commit [1] for fixing
reproducible issue when LTO is enabled. It is removed in comit [2] since
this commit causes cgo binary not reproducible. But actually, we still
need this DEBUG_PREFIX_MAP in LDFLAGS when LTO enabled. So, only appened
it when LTO is enabled. Refer [3] for the history, with this patch,
patch [4] is also needed for cgo + lto enabled.

[1] https://git.openembedded.org/openembedded-core/commit/?id=fddaecc88979967d0e00e2fafdbaaabec030da9f
[2] https://git.openembedded.org/openembedded-core/commit/?id=1797741aad02b8bf429fac4b81e30cdda64b5448
[3] https://lists.openembedded.org/g/openembedded-core/topic/patch_bitbake_conf_remove/117408334
[4] https://lists.openembedded.org/g/openembedded-core/message/230059

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/distro/include/lto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index 227f0c5c2a..cef92901e3 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -49,5 +49,6 @@ LTO:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'thin-lto', '-flt
 
 SELECTED_OPTIMIZATION:append = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
 TARGET_LDFLAGS:append:class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
+TARGET_LDFLAGS:append:class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${DEBUG_PREFIX_MAP}', '', d)}"
 
 SELECTED_OPTIMIZATION[vardeps] += "LTO LTOEXTRA"
-- 
2.34.1



Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AB1C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 08:55:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18174.1739955344249906430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 00:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=414568d945=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J6rk21009216
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:55:43 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kgrv7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:55:43 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 19 Feb 2025 00:55:42 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 19 Feb 2025 00:55:42 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 2/2] qemu: update PACKAGECONFIG ust
Date: Wed, 19 Feb 2025 16:55:02 +0800
Message-ID: <20250219085502.2297068-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219085502.2297068-1-kai.kang@windriver.com>
References: <20250219085502.2297068-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: eybOK3tYYL5x4Lv2kfvREevVc_IfI2cu
X-Proofpoint-ORIG-GUID: eybOK3tYYL5x4Lv2kfvREevVc_IfI2cu
X-Authority-Analysis: v=2.4 cv=BvtnwZX5 c=1 sm=1 tr=0 ts=67b59c8f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=eXDs-x9s8-STe2mI9PUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=758 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211690

From: Kai Kang <kai.kang@windriver.com>

When PACKAGECONFIG ust is not enabled, it sets trace backend with 'nop'
which disables tracing for qemu. It should use the default backend 'log'
rather than disable tracing.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 02afafc2e8..5e9c2f7e07 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -299,7 +299,7 @@ PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
 PACKAGECONFIG[attr] = "--enable-attr,--disable-attr,attr,"
 PACKAGECONFIG[rbd] = "--enable-rbd,--disable-rbd,ceph,ceph"
 PACKAGECONFIG[vhost] = "--enable-vhost-net,--disable-vhost-net,,"
-PACKAGECONFIG[ust] = "--enable-trace-backend=ust,--enable-trace-backend=nop,lttng-ust,"
+PACKAGECONFIG[ust] = "--enable-trace-backend=ust,--enable-trace-backend=log,lttng-ust,"
 PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,,"
 PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 # libnfs is currently provided by meta-kodi
-- 
2.47.0



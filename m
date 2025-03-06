Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6DCC282EC
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 10:56:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10364.1741258610597907195
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 02:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51601af165=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5269v2OV021828;
	Thu, 6 Mar 2025 02:56:50 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cs7sxaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 06 Mar 2025 02:56:49 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 6 Mar 2025 02:56:49 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 6 Mar 2025 02:56:48 -0800
From: <kai.kang@windriver.com>
To: <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] qemu: retain default trace backend if 'ust' is not enabled
Date: Thu, 6 Mar 2025 18:56:43 +0800
Message-ID: <20250306105643.2292192-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=DfbtqutW c=1 sm=1 tr=0 ts=67c97f71 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=9qxNCY_qAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=GvdMlYzUwWSkykOKn7MA:9 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: bDsijeo-QgTn9bG-3ydzlsKuZX17NWUG
X-Proofpoint-ORIG-GUID: bDsijeo-QgTn9bG-3ydzlsKuZX17NWUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503060081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 10:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212384

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The qemu build system enables the 'log' trace backend by default, if no
explicit choice was made with '--enable-trace-backend=CHOICE'.

However, the qemu recipe uses the following PACKAGECONFIG line:
    PACKAGECONFIG[ust] = "--enable-trace-backend=ust,--enable-trace-backend=nop,lttng-ust,"

which means that the 'nop' trace backend will be explicitly selected if the
'ust' feature is not enabled. The 'nop' backend removes almost all trace
points at compile time, and thus basically means 'disable tracing'.

To retain the default trace backend if 'ust' is not enabled, the above
PACKAGECONFIG line should either explicitly fall back to the 'log' backend,
or not provide any value for the 'disabled' case. This commit chooses the
latter to not make any assumption about the upstream default.

(From OE-Core rev: c31396a30dcf17ab23ff4dd5943eef5fba20cba6)

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bee30cd56f..137636ef82 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -298,7 +298,7 @@ PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
 PACKAGECONFIG[attr] = "--enable-attr,--disable-attr,attr,"
 PACKAGECONFIG[rbd] = "--enable-rbd,--disable-rbd,ceph,ceph"
 PACKAGECONFIG[vhost] = "--enable-vhost-net,--disable-vhost-net,,"
-PACKAGECONFIG[ust] = "--enable-trace-backend=ust,--enable-trace-backend=nop,lttng-ust,"
+PACKAGECONFIG[ust] = "--enable-trace-backend=ust,,lttng-ust,"
 PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,,"
 PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 # libnfs is currently provided by meta-kodi
-- 
2.34.1



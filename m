Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1AAC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 03:50:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12274.1744689019280042400
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 20:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6200fe04a1=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F2EpBD002550
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 20:50:19 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yqpkjh5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 20:50:18 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 14 Apr 2025 20:50:18 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 14 Apr 2025 20:50:17 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd: Correct tmpfile.d file for resolv.conf
Date: Tue, 15 Apr 2025 11:50:16 +0800
Message-ID: <20250415035016.1604068-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nIctovf00Aixddp3EEa97uLAnmbdragX
X-Proofpoint-GUID: nIctovf00Aixddp3EEa97uLAnmbdragX
X-Authority-Analysis: v=2.4 cv=UZBRSLSN c=1 sm=1 tr=0 ts=67fdd77a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=2DczrrpJF8kI8D-_JXIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504150022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 03:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214817

From: Mingli Yu <mingli.yu@windriver.com>

The tmpfiles config for systemd-resolve has been split out [1],
so correct tmpfile.d file for resolv.conf in our recipe accordingly.

[ YOCTO # 15768]

[1] https://github.com/systemd/systemd/commit/b15f6eae421ad64773c0be934fd372d1ca230adb

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-core/systemd/systemd_257.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-core/systemd/systemd_257.5.bb
index 71ab36302f..5a9069fd33 100644
--- a/meta/recipes-core/systemd/systemd_257.5.bb
+++ b/meta/recipes-core/systemd/systemd_257.5.bb
@@ -365,7 +365,7 @@ do_install() {
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	else
 		resolv_conf="${@bb.utils.contains('RESOLV_CONF', 'stub-resolv', 'run/systemd/resolve/stub-resolv.conf', 'run/systemd/resolve/resolv.conf', d)}"
-		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../${resolv_conf}%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
+		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../${resolv_conf}%g" ${D}${exec_prefix}/lib/tmpfiles.d/systemd-resolve.conf
 		ln -s ../${resolv_conf} ${D}${sysconfdir}/resolv-conf.systemd
 	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'false', 'true', d)}; then
-- 
2.34.1



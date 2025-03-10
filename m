Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B546EC28B28
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 01:12:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.27753.1741569125058514479
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Mar 2025 18:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5164f51438=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A1BPKu001240
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Mar 2025 18:12:04 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458p9qh56d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 09 Mar 2025 18:12:04 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 9 Mar 2025 18:12:03 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 9 Mar 2025 18:12:03 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 1/2] babeltrace: extend to nativesdk
Date: Mon, 10 Mar 2025 09:12:01 +0800
Message-ID: <20250310011202.2662403-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QNySRhLL c=1 sm=1 tr=0 ts=67ce3c64 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=yuaHD_0bJBaCaxUhG7wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: J7G7c1Jtbwl7pKXU9GCWbMTFW8s2lghB
X-Proofpoint-ORIG-GUID: J7G7c1Jtbwl7pKXU9GCWbMTFW8s2lghB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxlogscore=637 suspectscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503100007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 01:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212483

From: Changqing Li <changqing.li@windriver.com>

This allows anyone using the SDK to be able to analyze the logs
collected on target

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.5.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
index f4d9b5e42a..2585747fb6 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
@@ -96,3 +96,5 @@ do_install_ptest () {
 	sed -i 's:^BTBIN.*:BTBIN=/usr/bin/babeltrace:' ${f}
     done
 }
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.34.1



Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C861DC2BA1B
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 01:12:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.27558.1741569127058225307
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Mar 2025 18:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5164f51438=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A1Bcxl019549
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Mar 2025 18:12:06 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j279ak3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 09 Mar 2025 18:12:05 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 9 Mar 2025 18:12:04 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 9 Mar 2025 18:12:04 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 2/2] babeltrace2: extend to nativesdk
Date: Mon, 10 Mar 2025 09:12:02 +0800
Message-ID: <20250310011202.2662403-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310011202.2662403-1-changqing.li@windriver.com>
References: <20250310011202.2662403-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: c0aetQbnTHq3-iwicYmBx4coAzL8kgkB
X-Authority-Analysis: v=2.4 cv=WNuFXmsR c=1 sm=1 tr=0 ts=67ce3c65 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=Wq06Su85kckTEBHcGVYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: c0aetQbnTHq3-iwicYmBx4coAzL8kgkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=632 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503100007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 01:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212484

From: Changqing Li <changqing.li@windriver.com>

This allows anyone using the SDK to be able to analyze the logs
collected on target

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
index d6c75d7580..bd6eb9ba1c 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
@@ -93,3 +93,15 @@ do_install_ptest () {
     # Remove architechture specific testfiles
     rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debug-info/*
 }
+
+do_install:append:class-nativesdk() {
+    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+    cat <<- EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/babeltrace2.sh
+	export BABELTRACE_PLUGIN_PATH="${libdir}/babeltrace2/plugins"
+	export LIBBABELTRACE2_PLUGIN_PROVIDER_DIR="${libdir}/babeltrace2/plugin-providers"
+	EOF
+}
+
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/babeltrace2.sh"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.34.1



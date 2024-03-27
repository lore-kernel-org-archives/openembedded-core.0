Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248E7C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 15:40:58 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web11.41175.1711554057735751690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 08:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=BTX/AtQe;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=UkrfoDyi;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: colin.mcallister@garmin.com)
Received: from pps.filterd (m0220296.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42RA3qhD012760
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 10:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=pps1;
	 bh=IzMko+nz0CJqy4LQVHxkoul/N0MpsfkrMETULOF/PQ0=; b=BTX/AtQejtg5
	bFAr+L99awdreZ4gDdGVcPcK7FTsTHuZJFobXv4DrtQ5cjk2u1b59V6RVgRBVlCL
	a2VDz27hy4lheItgAlIGyNAwLbKCymwNnHsQ8wuLaz7lSGyGFobB42xdP4rweNHX
	fjAyMBaibXF7PsSBFwYVRi5x+6Mx6tILzRLmJasYpXnhWnKy0YTH2mpJUAXtJIkz
	mxReQqhPbuEEgMILn6mu9y3XNI/VrpEUMME6xTQZAOVXj04Cmy61284xJAb1WKIo
	hcKfEHWeqgEVNhk/EbDupz/pxZHdTMAZGjHb4pDcenDGnFXInXhTcD9sTbNDCV9v
	zvQMvFcVng==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3x4hcb0yhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 10:40:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mx5jyDRse3kvuU/AupkfgpWZrJL52zOxwIBLcT+VjkhGD2i2T37YFigiYFW0kfhMCGjgkysgA82HeEn+fKr3uAQKa94LPXwKc280LLEZwW6iLXGy4PIZQozGddJ4B4OZGG+iP26iS+KUGeVCQA0dQ7R1pwOLNgylwDmUrk47cfsDaehd95IdCWV0ZGAY3Abmb7I1lhTT7tb945wKt3+IWZ6R77ZBH77rdHVOz+NAbySxd55YD3CeVAtE8aUTz5YzJ0G6RQMJnp5CrJ+j+fEJCBe9JGu0vnsoVLC+/kzLE0c1N6pKgpulv+jqU0mEkOLGyroCPNQIJXZwfbJLUoaLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzMko+nz0CJqy4LQVHxkoul/N0MpsfkrMETULOF/PQ0=;
 b=X48j9/S7ni6SjuIo+qMv1GEOyUCIJDqRhWNOXnXBLazfWS/MWr7ZQTAHbJo9dEyWhIxJfsce4w4NrtHlM9nfbsRPDVXSsxAJyhD0hugAeqVxyos5i/H+hiv+Abms1OtktIGReqcirk6uRdmOmXmvc5rWGV1EPXOMf7DYj+uIw9DiMw1VjlvSxPcuUE3ze7oEjNZxvGKyKRLMKTkI6GMEciILA8juxopRVTBdqlh2rbvTjT4YNqkEw9alHRAo0RNHSitSs04PdAZASQ42ZA/m9iJctd1ZsIrLaGTUQ3p8n7WC6DMcl49vSyXL/DAdpfuXVuhIhBgQYg0/y9t/FKXIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzMko+nz0CJqy4LQVHxkoul/N0MpsfkrMETULOF/PQ0=;
 b=UkrfoDyiVbhpieLkSsm3zAHvschh3qyzrPl7bU8Ln/gdjEXF/FREpx4NfoQxuLvDaL08lMFYC0E7EYhNEEdOtgoxYoweskdGEsHTCJIv4l4AE5k4QtD/XmZdnXfObMJ1r28nsfpyIov7h7zwEfpTirm7aqWJf2YkJzwl1eNdpanSgJ05mWAsAJoEwasLp9xrp8EERMI1wNg3fr7pnUvaAn/sMnGb82V3/P9emvxJ5eeaJjNxYgMkyTgaU9WTMt+nZu+O/hKCNcwbpks7wMfkJA+ynUAt82TITo7qnfPipIweIW9jr+Nva1CUmYg00fPjWrthbd00kP/nvCucL9Vpuw==
Received: from DM6PR08CA0062.namprd08.prod.outlook.com (2603:10b6:5:1e0::36)
 by MN2PR04MB6735.namprd04.prod.outlook.com (2603:10b6:208:1ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 15:40:51 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::88) by DM6PR08CA0062.outlook.office365.com
 (2603:10b6:5:1e0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 15:40:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 15:40:49 +0000
Received: from cv1wpa-exmb4.ad.garmin.com (10.5.144.74) by
 olawpa-edge4.garmin.com (10.60.4.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Mar 2024 10:40:41 -0500
Received: from KC3WPA-EXMB5.ad.garmin.com (10.65.32.85) by
 CV1WPA-EXMB4.ad.garmin.com (10.5.144.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 27 Mar 2024 10:40:45 -0500
Received: from cv1wpa-exmb6.ad.garmin.com (10.5.144.76) by
 KC3WPA-EXMB5.ad.garmin.com (10.65.32.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.32; Wed, 27 Mar 2024 10:40:45 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by mail.garmin.com
 (10.5.144.76) with Microsoft SMTP Server id 15.2.1258.32 via Frontend
 Transport; Wed, 27 Mar 2024 10:40:45 -0500
From: Colin McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin McAllister <colin.mcallister@garmin.com>
Subject: [OE-core][dunfell][PATCH 2/2] licenses.conf: Backport missing licenses
Date: Wed, 27 Mar 2024 10:40:03 -0500
Message-ID: <20240327154026.811420-3-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240327154026.811420-1-colin.mcallister@garmin.com>
References: <20240327154026.811420-1-colin.mcallister@garmin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|MN2PR04MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 61110bf5-0f02-4784-c778-08dc4e744757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2fhSQMWsRON/Gmy6FFOz8Jbwz8t6pYf0I+/fh3YwmtRQeb8Qe3gExxt1HQoWj1+SVIbJ14fhM/B4YFCXpl8lC+JcEmEhCBig5fl+VIa6YM+n7lBYjNORNZ6QJBc4yFkZUfjN6w2aPrICA1mBLcUdF8cQvAg36llzSMsx8SF2bDrR/+tCs+dwL0Qs6iEVgXcRV2BSe/l8r0kkpO0yVChnLPgtfPbWdWg9Ros9F4/s0Jb4yp61oifJpfkD3MML8c5J1a//dirCKqeYR4FCVrkwsZAqHbV+WHg4ifrFzbGtJx7hrPw4GgQCNsKApVES+5gL4QJWsKB+dA/rhOrBt+8jcoG/kXSj2lQ4rDABmBC01OC//yjtZDplXkzuv+WtHGXfYUWOTGPL6rsB4XFU8mCryva4FPC9SrKmEAdaUxCtgav7/YyeVRFQ6czqIh9i8hEPUwvWYV1lf9yn5VR1/2kdWSMlZRXlqmJnbQ6JDM7rgTNODIaoDj1am7jVWyVoV40EpP38ixoRXaBLZwtPiNDpV2nR4Tx6OR90IUUfWsehJXqIGZDomoNHyYCeo4mUgoQEC4GsiZoQPi7+PQiIV6F2PMWErMh+uhNJUxW4DIT1N50D9/34X4H0oTQnVnhbbUP7LyvVyWx15FKkCzjqxtEbukJIxukfd+IqZUNTscAq963o9mcPpe/t86/NcZSn4Pn5LvqnWd1fBjJOhizfSVV8QoFa5yGPdWap8NiVI11h1O2Hs2SAkZY9XVp6ynEO44EL
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 15:40:49.8781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61110bf5-0f02-4784-c778-08dc4e744757
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6735
X-Proofpoint-ORIG-GUID: 7wIJ8920vFYTY7akUK_KKvk_5tDNfu3W
X-Proofpoint-GUID: 7wIJ8920vFYTY7akUK_KKvk_5tDNfu3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_12,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403270108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 15:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197560

SPDX generation on Dunfell curently runs into issues because some
recipes contain licenses that are not supported in licenses.conf. This
commit backports licenses added to licenses.conf since Dunfell.

Signed-off-by: Colin McAllister <colin.mcallister@garmin.com>
---
This patch updates licenses.conf to align with both Kirkstone and
Master.

 meta/conf/licenses.conf | 114 ++++++++++++++++++++++++----------------
 1 file changed, 69 insertions(+), 45 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index d14c365977..991fb6cc23 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -10,84 +10,108 @@
 # Any mapping to MPL/LGPL/GPL should be fixed
 
 # AGPL variations
-SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPL-3.0-only] = "AGPL-3.0"
+SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPL-3+] = "AGPL-3.0-or-later"
+SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3+] = "AGPL-3.0-or-later"
+SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3.0+] = "AGPL-3.0-or-later"
+SPDXLICENSEMAP[AGPL-3.0] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPL-3.0+] = "AGPL-3.0-or-later"
+
+# BSD variations
+SPDXLICENSEMAP[BSD-0-Clause] = "0BSD"
 
 # GPL variations
-SPDXLICENSEMAP[GPL-1] = "GPL-1.0"
-SPDXLICENSEMAP[GPLv1] = "GPL-1.0"
-SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0"
-SPDXLICENSEMAP[GPL-1.0-only] = "GPL-1.0"
-SPDXLICENSEMAP[GPL-2] = "GPL-2.0"
-SPDXLICENSEMAP[GPLv2] = "GPL-2.0"
-SPDXLICENSEMAP[GPLv2+] = "GPL-2.0+"
-SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0"
-SPDXLICENSEMAP[GPLv2.0+] = "GPL-2.0+"
-SPDXLICENSEMAP[GPL-2.0-only] = "GPL-2.0"
-SPDXLICENSEMAP[GPL-3] = "GPL-3.0"
-SPDXLICENSEMAP[GPLv3] = "GPL-3.0"
-SPDXLICENSEMAP[GPLv3+] = "GPL-3.0+"
-SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0"
-SPDXLICENSEMAP[GPLv3.0+] = "GPL-3.0+"
-SPDXLICENSEMAP[GPL-3.0-only] = "GPL-3.0"
-
-#LGPL variations
-SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPLv2+] = "LGPL-2.0+"
-SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPL-2.0-only] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv2.1+] = "LGPL-2.1+"
-SPDXLICENSEMAP[LGPL-2.1-only] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
-SPDXLICENSEMAP[LGPLv3+] = "LGPL-3.0+"
-SPDXLICENSEMAP[LGPL-3.0-only] = "LGPL-3.0"
-
-#MPL variations
+SPDXLICENSEMAP[GPL-1] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPL-1+] = "GPL-1.0-or-later"
+SPDXLICENSEMAP[GPLv1] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPLv1+] = "GPL-1.0-or-later"
+SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPLv1.0+] = "GPL-1.0-or-later"
+SPDXLICENSEMAP[GPL-1.0] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPL-1.0+] = "GPL-1.0-or-later"
+SPDXLICENSEMAP[GPL-2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-2+] = "GPL-2.0-or-later"
+SPDXLICENSEMAP[GPLv2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2+] = "GPL-2.0-or-later"
+SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2.0+] = "GPL-2.0-or-later"
+SPDXLICENSEMAP[GPL-2.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-2.0+] = "GPL-2.0-or-later"
+SPDXLICENSEMAP[GPL-3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPL-3+] = "GPL-3.0-or-later"
+SPDXLICENSEMAP[GPLv3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3+] = "GPL-3.0-or-later"
+SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3.0+] = "GPL-3.0-or-later"
+SPDXLICENSEMAP[GPL-3.0] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPL-3.0+] = "GPL-3.0-or-later"
+
+# LGPL variations
+SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPLv2+] = "LGPL-2.0-or-later"
+SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPLv2.0+] = "LGPL-2.0-or-later"
+SPDXLICENSEMAP[LGPL-2.0] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPL-2.0+] = "LGPL-2.0-or-later"
+SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPL2.1+] = "LGPL-2.1-or-later"
+SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPLv2.1+] = "LGPL-2.1-or-later"
+SPDXLICENSEMAP[LGPL-2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPL-2.1+] = "LGPL-2.1-or-later"
+SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0-only"
+SPDXLICENSEMAP[LGPLv3+] = "LGPL-3.0-or-later"
+SPDXLICENSEMAP[LGPL-3.0] = "LGPL-3.0-only"
+SPDXLICENSEMAP[LGPL-3.0+] = "LGPL-3.0-or-later"
+
+# MPL variations
 SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
 SPDXLICENSEMAP[MPLv1] = "MPL-1.0"
 SPDXLICENSEMAP[MPLv1.1] = "MPL-1.1"
 SPDXLICENSEMAP[MPLv2] = "MPL-2.0"
 
-#MIT variations
+# MIT variations
 SPDXLICENSEMAP[MIT-X] = "MIT"
 SPDXLICENSEMAP[MIT-style] = "MIT"
 
-#Openssl variations
+# Openssl variations
 SPDXLICENSEMAP[openssl] = "OpenSSL"
 
-#PSF variations
+# PSF variations
 SPDXLICENSEMAP[PSF] = "PSF-2.0"
 SPDXLICENSEMAP[PSFv2] = "PSF-2.0"
 
-#Python variations
+# Python variations
 SPDXLICENSEMAP[Python-2] = "Python-2.0"
 
-#Apache variations
+# Apache variations
 SPDXLICENSEMAP[Apachev2] = "Apache-2.0"
 SPDXLICENSEMAP[Apache-2] = "Apache-2.0"
 
-#Artistic variations
+# Artistic variations
 SPDXLICENSEMAP[Artisticv1] = "Artistic-1.0"
 SPDXLICENSEMAP[Artistic-1] = "Artistic-1.0"
 
-#Academic variations
+# Academic variations
 SPDXLICENSEMAP[AFL-2] = "AFL-2.0"
 SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
 SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
 SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
 
-#CDDL variations
+# CDDL variations
 SPDXLICENSEMAP[CDDLv1] = "CDDL-1.0"
 SPDXLICENSEMAP[CDDL-1] = "CDDL-1.0"
 
-#Other variations
+# Other variations
 SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
+SPDXLICENSEMAP[FreeType] = "FTL"
+SPDXLICENSEMAP[Nauman] = "Naumen"
+SPDXLICENSEMAP[tcl] = "TCL"
+SPDXLICENSEMAP[vim] = "Vim"
 
-#Silicon Graphics variations
+# Silicon Graphics variations
 SPDXLICENSEMAP[SGIv1] = "SGI-1"
 
 # Additional license directories. Add your custom licenses directories this path.
-- 
2.43.2



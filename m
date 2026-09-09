Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F70C88E40
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 17:36:23 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18532.1788975382785366951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 10:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=WxrpW173;
 spf=pass (domain: axis.com, ip: 40.107.159.48, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTaSjHtXy9Q00fhhNXg6KdeH8hOHaWbiUqm5ZDvfvvnbr/UQqd014SBVPUsVwpAdC5OjfMdJHHvCgAkPXd+D1o1tEMJSQ6VyhPJrpVgm5W8jmYx4n9wh6XhDAAlrVJT3Mk037gvtJac3XeHf5hpoweKPBaGM+mxIwIH/heISQWFxkQTbLDpOR66+YWMnkd8FNP8+AlESHqCxI5cRq7pE1r1LmmDRmla+LuxSPPSxQeYp1hK640hxYgh59BjyTkXdN1+2aVoyCqlnrWV5XC1HALzHWzfN1qPjA68DzQpFSZPOaVaSSQKdETUbSvR3/XeLXkSz7SsNSroteo+r6poK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHlJMv9iuTuK1X0A0DpecPkP1Oq5CFlT+gJWpj9y83k=;
 b=EgKuVOnWLQcf8HqVcSrw4oBfubG0VIqYS0ow5WqwkvdCxDYxd/DrKPPSebppy1UnAQHRwgOs9WW18FqOKbj3mzrgrzGKIV6HwWxCioEW10I7mhHYt5HYLz/7vYblkSxHVnyzcIbyJ7eDqGh5uPRpDe53feWlbP6Wv33HVuKJEYfWPj2TuuZXWE/7pgefBpNUqRO+1EzM0ZnFCTSa7b8otGtAqtmdzyvPQia6d7zES3uUQzXnEW2rfA3jsyc8qwdKf6Er8vwzHv9RVKRBLk4AOdQ5Kt6yx+M0LGStm9q+KBo2bGTARihPsC+Qy2B5ecBIAkBptqdr6KBjfcGT9gzDWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHlJMv9iuTuK1X0A0DpecPkP1Oq5CFlT+gJWpj9y83k=;
 b=WxrpW173/kYluuhuuAlFw9RfgF+0SfHcyLXJ8kMpSBIKJdtxkTy2gSW0916lFYH6QTdmvFaodEjM5zeCJdkkUlgzD5j234u6hZ4T32VU77pu2/5g2QnOIV85RpLAKvFTuAU4RWC/bpIM7MXk0AYC6XY1QAfLs/NdkzC9rcuE4OU=
Received: from AM0PR02CA0163.eurprd02.prod.outlook.com (2603:10a6:20b:28d::30)
 by DB4PR02MB8605.eurprd02.prod.outlook.com (2603:10a6:10:387::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 17:36:12 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::30) by AM0PR02CA0163.outlook.office365.com
 (2603:10a6:20b:28d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Wed, 9
 Sep 2026 17:36:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 17:36:11 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 9 Sep
 2026 19:36:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 9 Sep 2026 19:36:11 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 213A31FB9
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Sep 2026 19:36:11 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 0E45212ABC6; Wed,  9 Sep 2026 19:36:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] mesa-libclc: Correct the license
Date: Wed, 9 Sep 2026 19:36:09 +0200
Message-ID: <20260909173609.1197773-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A797:EE_|DB4PR02MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: dc9051f9-c30f-453c-81ad-08df0e98d705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|13003099007|3023799007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	rRj5kEePIjkOPDVE7fCh0mhf+uMKARml0XKrmrn7J8WluDmb3DMncFVkfD8YDby8I3ZA1Lcb17aE5qwEXBBPQM9AYhhPqTUkBMbGlO4PV/GkCabxkbV21shMXMlLY/s9j2N6HyFxDcVwELwF5iV7CIWtImIdiWcQ1X7othDuxsv2a6rsfcb+Wf4VISJqUG9BetG8iKDQ1Oa8K06bWxshpRzeXwJPWpAgHj4FflRBqjo8XCiSDP9vlikaT2BjUVc3dMdjlshU5PbNBjPNvjtMOREWE+cDMBWfzSE5Oz+R5jUuRYHesY7Mf+1Q9vuMUq5lpEBKPUgJ3ytUbSvIU9XNwoh2J0hGvhTuZTf9XmJE2OyjWM+lNvWYKhndn+EWNySv3rXQePbJwjxoiEhdvVFAlAxtbR47u9cfJCpXPGhydzxjy9Wn884BxTln7EQ8pIJtW+Su0eAqu83PFbnYq11Dqs0WKoRDEsYxPR8wDNSDWuc+AMO6G+WV0/TB+GY7I5sY2P3GD/H42kA1BmUL3fObujzA95sCC/aZTSV5yMZ9logevHW+tfMVeOeZd1nNmhRli4IyvKpEeX6gIOZ+et91stGpprr+V8s0ds0JOjizUNBrzpdafNtqk3aVxeabMALpyUIvISZvI3jz8SLKNIF9jg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(13003099007)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vjRG9HmKbBUUQN/iFhD+iwvvmlXLscXU4CaUZV/KqUxJevxfNgerx7K2nGmNWpkZqD17xGR4ya+apsET4+n/I4FeXIOd8YoDkZNuWva8+Ue3bLdmC9817F7DAHPpNB6q3c3z12E2XJNduIgIHOSFByQuREiNSWF+pojC9zEfNlAxz321ucFSrwaCB6d73gaNRtEDai6Pxl2etqHcVUquIyE2s3NerfXiE7HKsU7MNh73i43Sf49O7lA4/h4ekGoZdNMeH07Gsjc5KwzNvaAhM2dDWoTfLN9qc42uhCtC8IA9n5nCLM8i5S8PuqQT6O4nwy2MyF4WU22FT0ozWjZfW5eRJoyOZDTsnWmqe738YYEUwGHM8n8iTK4xvj6Pc+cCka8txXhvlqcKNp8ERRX4ZpY9FOgaHAZy8BXlWTmJheNEBSz+iGJeyWa960yR5M4h
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 17:36:11.4787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9051f9-c30f-453c-81ad-08df0e98d705
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8605
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 17:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245484

Use "Apache-2.0 WITH LLVM-exception" now that license exceptions are
properly supported.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb b/meta/reci=
pes-graphics/mesa/mesa-libclc_22.1.8.3.bb
index c93b5b9d9d..cad78f67f5 100644
--- a/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb
+++ b/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Mesa fork of libclc: Implementation of the library requiremen=
ts of the OpenCL C programming language."
 HOMEPAGE =3D "https://gitlab.freedesktop.org/karolherbst/mesa-libclc/"
 SECTION =3D "devel"
-LICENSE =3D "Apache-2.0-with-LLVM-exception"
+LICENSE =3D "Apache-2.0 WITH LLVM-exception"
 LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D7cc795f6cbb2d801d84336b83c8=
017db"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/karolherbst/mesa-libclc.git;prot=
ocol=3Dhttps;branch=3Dllvm_22"


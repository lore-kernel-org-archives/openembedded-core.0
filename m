Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E0BC624D5
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 13:52:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8612.1788270720748090056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 06:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=a3PWCgq0;
 spf=pass (domain: axis.com, ip: 52.101.65.50, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbhHMj3sd8V/8wcznBiiaZEA5tQIj1z1FwJCc7mKB67LO25hUuV2SXcfwK4Mre9zBxG33cF9iRKblHN/1ebSNgxc9RpB3zxTjKKRBt36lME7eD4s+ZVo4S+4+LvW61ov5SaY32E7QDT3GSAbTy++gTi3g5bL7uC9xSy9v90xEV+qlr1LwLhYJoQgraLHczUFKRV1E5A5SzpVwYChCGYtDtkc5zilf4XCeSQt95qzDZDob/PduoKOISyQ+fLuL8FEVPHG+soSuJXcvHhLeblszH6PozWvsWMlSVp26xVRzb+XRFZkOZ72EJYghMkLWtlVdqx0z84V5dLkGzmHU2+wCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddVtEN96TXhbTGpwkasUu3HZHGz1GlJ0mhYFThqr7fg=;
 b=WvRVMi12RVUtQN8C6YLpV3SUabuy/2fFtEZ8ISSR9U0DWhLDVwnWkZzB8viV53B4qimXx1LQ42SDIo3pMD+x49GPgQs2lRoE5BWnhlJ9uesuwzDoRGvrTSlwfXCqz+b3MIZhb+TIg/f6C3gKPU0S1/J0gcj3lxurh2WyJVK+UtAZzJrxODzP/EhdRAYeFsha6F8N5dzx4NaLJM1zAfTzQ/mrnThpe8o8Jy67R7xuingDnT2sIFTT73swFFxbOrYpOctWCjEIeJSncbBp8xwKtm/eqvD9WeNpnoLNqlPkH+WvnEfncWIji5LKOx8Ze2K7oj8UVAk80x1UTClJcFesQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddVtEN96TXhbTGpwkasUu3HZHGz1GlJ0mhYFThqr7fg=;
 b=a3PWCgq0Y9FJq/4x0DIBSjvhXnzTDt9yJDGkhsfH5SEaugZLFV+1ntaeLUl8mrZDbl64CMjOv+StrF7aKLcKpLMZwKcHDUAmzHBR0/Kz6wG+7WVFGkrCGuZWvte5Cx6m00wWIfkU+kAvMmtUbAM6DriUG7ZRd2SoNwuhpPJqPYI=
Received: from MI1P293CA0002.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::9) by
 PA4PR02MB6797.eurprd02.prod.outlook.com (2603:10a6:102:f4::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Tue, 1 Sep 2026 13:51:56 +0000
Received: from MI3PEPF00008553.eurprd05.prod.outlook.com
 (2603:10a6:290:2:cafe::78) by MI1P293CA0002.outlook.office365.com
 (2603:10a6:290:2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 13:51:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF00008553.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 13:51:56 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 1 Sep
 2026 15:51:55 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 1 Sep 2026 15:51:55 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 87ADE133A
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 15:51:55 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 824E6125EF1; Tue,  1 Sep 2026 15:51:55 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] lttng-tools: Avoid the CC-BY-SA-4.0 license for code packages
Date: Tue, 1 Sep 2026 15:51:52 +0200
Message-ID: <20260901135152.1182514-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008553:EE_|PA4PR02MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be9a511-8237-47e7-ef68-08df08302fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|11063799006|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	y2bswfQ2uEkPUmok44xz4Mo0dYFFAMZQZHV8ChZTHyxBOzXBwJ1uzMhc+onOWptmK1klkudUaPwLt4v5s8kwFzIb2QhiNAak1Wj/Jk1nstx9zWAPsY10pk1UoHdBpNmB3EiTH1sQ17C2tIQnGB44iHs3sB1qL4kQlWywwVSRjR2G0Jjcz57QcZrEg6Ob7azz1ZvmSYesMq9A9VkIsxNGUbDRXkEoZ4R2wxEsJu1VGET8L8UO9aABRzSTgOQIrjl9tCNrSpQOE/p1MQrXZQbIJX+GbSOgz5E7/TmYFzNdv6EjGA03K9DbRv6Gp3LY6KjAGO7AMB3j62Fa+bi6di0P3IK0u2kP74zBCAAXltV1380q7FkZLyK1Mfj+zVKJbS5rrwDEHz0dB+ADtweEEIuIqRPYunaeOPewAjGSH5O8TZwyvG82kd7C3aR8EFFcJSbawsMQ/ORk7/CEFFTe1d0HMrBKPQZa/b6bk4vcC2Xt7wsyfgjdFhfnspJyAGo2tPktrQwLMWuCvZ+Sks4naC3nmH/RJlwzeu9i01Tx4HCEe9o5eYA9VpTEL5OjZOiA5ZlMC0RRW6+iuy9aMJ271aIgRU6AbONMnWQadZraKviG6WYRqlgcW5KPfYDUldtuBPuOJVUxd/6tpi4YKdrnqDMTDl06BD0UJPuxqbgNxMvtkE/5naEZBcjSW3W/jy+Bl/CRD7gTvbUbLg9sbE3r1amwiQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	N7WDH43d8RzaJt79NiI0q092MiDls408+OqMQXPe7Ar03Y1Orhpte6aZvv2jEUcwRRsJJPTNOMz7072qh6IssKdsFlDJnMd6oUAR0Up1ivF5cuSCtpKuxgyHftyYNRcBJGd/AeRhbReLAbtqL0nO+xHC5+krfHqBPbbfpzERFY4FPgGVVeWMRngs0L3vq88aau143VsIjLdse0cW1gRpX1y5zmO5k1KP4qkANur5fiCO1qb5bphrLpiogzAh2Dz9cyPmK8OqA1Tk+UBe8IXqamnJUfakUT0b/ZTrYmxtT62L4Y0MxeyKKW4dlErVMSKkYhYlVHZ6gBPcQGHojEjKWq14Y0sPn4jrzNNXC0u+7RGHQIhd+w8Wc/4mdcs4disF0Wuih13gn1fcJMxvklJ2ITZhgXkdeDcnRwc/dzBTWKU+2gTqZ5di5TkXPNFbSxXV
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 13:51:56.0414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be9a511-8237-47e7-ef68-08df08302fa9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF00008553.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6797
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 13:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244828

It only affects documentation files, so remove it from all other
packages.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb b/meta/recipes=
-kernel/lttng/lttng-tools_2.16.0.bb
index 8e2f890e55..cfc16ed6c7 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
@@ -5,7 +5,14 @@ to extract program execution details from the Linux operat=
ing system \
 and interpret them."
 HOMEPAGE =3D "https://github.com/lttng/lttng-tools"
=20
-LICENSE =3D "BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND CC0-1.0 AND CC-=
BY-SA-4.0 AND FSFAP AND GPL-2.0-only AND GPL-2.0-or-later AND GPL-2.0-or-la=
ter WITH Autoconf-exception-2.0 AND GPL-2.0-or-later WITH Autoconf-exceptio=
n-macro AND LGPL-2.1-only AND LGPL-2.1-or-later AND MIT"
+CODE_LICENSES =3D "BSD-2-Clause AND BSD-3-Clause AND BSL-1.0 AND CC0-1.0 A=
ND FSFAP AND GPL-2.0-only AND GPL-2.0-or-later AND GPL-2.0-or-later WITH Au=
toconf-exception-2.0 AND GPL-2.0-or-later WITH Autoconf-exception-macro AND=
 LGPL-2.1-only AND LGPL-2.1-or-later AND MIT"
+
+LICENSE =3D "${CODE_LICENSES} AND CC-BY-SA-4.0"
+LICENSE:${PN} =3D "${CODE_LICENSES}"
+LICENSE:${PN}-dev =3D "${CODE_LICENSES}"
+LICENSE:${PN}-dbg =3D "${CODE_LICENSES}"
+LICENSE:${PN}-ptest =3D "${CODE_LICENSES}"
+LICENSE:${PN}-src =3D "${CODE_LICENSES}"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df7adf214dab700ec91b393898b515f1=
3 \
                     file://LICENSES/BSD-2-Clause.txt;md5=3D5d6306d1b08f8df=
623178dfd81880927 \
                     file://LICENSES/BSD-3-Clause.txt;md5=3D4e91b9e6ef320f7=
4590c8c7a64a9188a \


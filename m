Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7255C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 06:48:24 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.116])
 by mx.groups.io with SMTP id smtpd.web11.5653.1743144503583785783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 23:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=AX51TGMV;
 spf=pass (domain: topic.nl, ip: 40.107.104.116, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjnFTARPO++/VrfztSmrkEq85uLNBdMPZHNxMinJz1ZaAJXjfjGK8A3nDOZilaQDv1SXCQZEuq/JCi/ME0UdvLW40fH1kw9EKOtbmNWPHdCXMVnMJSrsDYIZ+kEoiieFyUzRsdurvr6zqX9CLLtAb2E3b65/w3DLb/7/zrOxqS+kk9sEtvPQAmuzXmqdZ6FIrOH4Qyr3cRgiR24k+d4hfsG1CNnvnBrq6buOB6edk/DWbeh4YHCi8H6i7Yzr+kExNeJhwSPf/kB/njDnB9V+r2SiPJY8l49CRWNGncAljP0XcDSNZIygdiX9uGax04ZcWyBYOqMyScxWzya03MCRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDimaBBz03S3bRp0CsmeKYpgBxa9M6hXYY7hKRjJVcc=;
 b=ThYNRne7UgDImdx2NiMUnkW7cw1vVDOD6IGgtEnrF5AI175DNkUgSqEiOrVkdLBkWzH9PiTD7mOPpmyWpV/puilr5LTWizlvPANpWKTeHAqL4G4BzinJ2Xu2toMrOVhS2AcVAj29JRVo85Toi5/9DUtkk7zMo4SgVVJAYKiTNUIHq6NcSXy/9klDPUtX1GdrD1tSpNZ8wY3J5N3TVJqrhebmsy4GxClqIcUR1VAylmg4l0J1K6YsIsLusSZs8rm/5BAdDJFXZ6gbnhcRXG+EQBcZ5EW5duxzrwpM9SPPS3P3Hgtg+9e97j4HTra2s7v1Lc+4RZz6ygCpN9/Gkpj3yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDimaBBz03S3bRp0CsmeKYpgBxa9M6hXYY7hKRjJVcc=;
 b=AX51TGMVr4x35GDk9a5FAqhTrAF0p8BWhl+6D5mcYOnrTJ+3mk+iZoPlYNZ1Kn4Xn/2H+QIsPZRyJmtoP7o7JQcbL/A+lbDvlX/1ggseHqeGEAvrIs4wxFNMoHLBzP8/FO65enoqmehRrGTowWqtKuid7LE1ZfmH9yFVXgvUPwtvfAZlVYvXBVyTaws1WbQtugT2TJ1B66DfpNCZBaBsjB+7b4xgJY09q0GEW+sHM5/iI3iWw9tt10Ywclvx/7ypx3Z0TlYVtzrGk3BBqx6LF3oYe+Vo3FxxLCDNJNHMZom+a9uyIFu1bYNa6HD5RU8HYRcJwtfhX0Cj+qnqmSrW/w==
Received: from DB8PR06CA0033.eurprd06.prod.outlook.com (2603:10a6:10:100::46)
 by VE1PR04MB7406.eurprd04.prod.outlook.com (2603:10a6:800:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 06:48:17 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::33) by DB8PR06CA0033.outlook.office365.com
 (2603:10a6:10:100::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.46 via Frontend Transport; Fri,
 28 Mar 2025 06:48:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 06:48:17 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com (40.93.65.29) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 28 Mar 2025 06:48:16 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by GV1PR04MB11015.eurprd04.prod.outlook.com (2603:10a6:150:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 06:48:12 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 06:48:12 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
CC: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] dropbear/dropbearkey.service: Allow extra arguments for key generation
Date: Fri, 28 Mar 2025 07:47:41 +0100
Message-ID: <20250328064741.3165061-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0064.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::16) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|GV1PR04MB11015:EE_|DU6PEPF0000B61E:EE_|VE1PR04MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb81132-850f-40ac-a38d-08dd6dc4851d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?maYPPjY8KwqcC+e894nNZxnpNp/jD7VQ84g1sD7dWz/SUMYPqVJr+g2ugM7i?=
 =?us-ascii?Q?fMSJVKNajF0HRDIQ8G83G/ecdsY47zRIz4vIFoQvmfmngQXKP/8FWl/LNG8m?=
 =?us-ascii?Q?us+BHF8MYFqZlAth7Mo3O43QoHZ3XWrij2ash2A+aAjlGxYNZOq4EAXQQwj8?=
 =?us-ascii?Q?hLwHz+oyUDYsUeBsyLXS4REhbXFj5GGG9bbBBfVAxh0sYwf0rizyO5ZHJkdE?=
 =?us-ascii?Q?ULHwVbJgURJyeKxetK+iFVdt08TyIX8+nmbWmPEgti6tHed6xF0YwWIW0elc?=
 =?us-ascii?Q?j4O7xfOjgOiRYi7RcoZ0pBIhqDWLqVfBJfNATbt7Xsnp/GNVWBY9/x3atxAE?=
 =?us-ascii?Q?BiQlSrbeT+c+zupH3k7c8x6HtFd/r9WRt2yzw+qgMc5Ne6WGnteI7tEmoDcM?=
 =?us-ascii?Q?L9dL32houmKhS2kn8Oax55SLjAL+ohyaLQT4jBX5+I8vT+nmAkjEewlLCosG?=
 =?us-ascii?Q?O8oTJ8lSF2dJhA/+9dKP2T+G3AXGdRee+c7VGdsqcD300RGpyT/kJLEovENJ?=
 =?us-ascii?Q?i1raCADuAGE0G8WBMqvYNwSyKZqOaeM4HRcxqllY+Eo2rQZjzOHAHj2hIqeq?=
 =?us-ascii?Q?yhNnVC8aTDQX7gai0LEhn2RFAA9iOP27fsGBEq2skiwQVhSnI6Nu2rB7zWPp?=
 =?us-ascii?Q?lbHlv/A5s6y14w5h6mhReSLKLBv6gTdUc8Vnwk8nn1/jDxO2RZm07LFVch/b?=
 =?us-ascii?Q?Gna7vYJT3ILX4L9Dhf/hUQS6oSavwucHGlfhxCbhOFeLYuaASjA4qzCiE92+?=
 =?us-ascii?Q?EgizJBn4IRdlq1QJ6n1a9ePeDbuMfirlPSHSFDPsFHoBGs1LkbvaoY0WGL0I?=
 =?us-ascii?Q?uZx5iToTkgTDNRpA3HlaTsmse3OBKC+CSiFrhTJhu2rpWgamt2+oqgnVZWz9?=
 =?us-ascii?Q?emDqspVKRaAOhVBBXpHkkpFAreprtxgUiM8iS58YFRDEdGwE0da/QuhIeUL/?=
 =?us-ascii?Q?5JwbRCd/PcMETZB3I/CK2c4hGlzTMMa0p2nTNom7ZZQ9nGt927uo7yc723Nx?=
 =?us-ascii?Q?u7Bp8o9deL4mFwuHkRKFiqtFZ/qeTfhVVJ0OmxpubDhNeg9O8dyfg14PRCBt?=
 =?us-ascii?Q?GN6ZSzqF+e8xA3PMtk7uO652qnJwUwEqmesYzUS9pO8nJmALiSfOMOVh+5BD?=
 =?us-ascii?Q?VJckDaHRKmqwmD8VS0nHu/52ZqKGLasMPhIahZnk8+6JstfO0e2ZT0vuwMpp?=
 =?us-ascii?Q?qaz8t7L2DkY6YqaRvnyJvrdLllbE5ZYJl4EKtBzhp6sQtWJ7ax5snznAp/Fm?=
 =?us-ascii?Q?hHaoIGCm7JbK62wByr1ALgy0be27pJQePG+X2NmeBG354g/1FLfvKZM0OHXi?=
 =?us-ascii?Q?yFUNU5M+w1xerIYZx3qZ83mMuVA/psJ+aevbiQxYfsJnz9MQR67+lncRVkvu?=
 =?us-ascii?Q?y5Ey7GApX7ek7f8gNN+0ZvzmoimjfxiunUWOhUAVT3h03mIUuoAFN1uoNhc4?=
 =?us-ascii?Q?2FKMCb83tIVefmFOG/R4xxubr8vt4E7+MWqtVKKWBzQBQtLTy/X24w=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11015
X-CodeTwo-MessageID: c70bb4d4-e002-4db0-8352-b94d8ffb5c1e.20250328064816@westeu12-emailsignatures-cloud.codetwo.com
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.b821430b-453c-4cfa-b91c-4663da029c04@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4e4bcea6-cc64-4e8b-0017-08dd6dc4826e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/aETroxEDFx6esXu/1r+AAzXKsEFc7tiVZ+9eUFv+6gKf6BiXAGlsS5Ryy3Q?=
 =?us-ascii?Q?jcXQgjEC/KO2QLXM4T0N1u150b1n6KEmIWTR0nmPaaAbGJq44UCp9UBc6Dg1?=
 =?us-ascii?Q?xCX4Nl5ERr5rzjNzjibRRVCGfEsMx6IAo9twcI+UYUo6maQkbyBbo2JBJ1QD?=
 =?us-ascii?Q?ZBv2IVFQ+oSL6qgd3kYCp67rZLC/tguXe/046aS7imQ85JSAcUOLpbs+BoaK?=
 =?us-ascii?Q?FDu9Smxex9PX4wR6u0KkDRPh+YaFL3mFhfM28oHoLjfeYw6E34rMReRBxnaN?=
 =?us-ascii?Q?zObwMWS/Cif5t080rBTJX0pMlMW+rnoVAmure/Hw1ekMhCYUd53umiKhLzH1?=
 =?us-ascii?Q?BGYdBnifXVo5Vs5ZfBaRA8TafpvkyH7TBZdv+/ro6uFT6kVaChbW0TpqRhCT?=
 =?us-ascii?Q?J9psAeFj5vq4OHfKwO3L9iCTmkHHHhfudevtrFRowyWxeNaaUD/g9uDlOPI1?=
 =?us-ascii?Q?t9iHlMOIjNT8DKz44YK6o6WJRSq764dUsjYeuvplSpS2tswfw/Lb3GCW1xoM?=
 =?us-ascii?Q?KAcYBo7t/bUrkW37h6NJ6YL/bKFkcJtlE3+ZHGxyDCVXHihc7YXuEYwSe4B1?=
 =?us-ascii?Q?oH2jv+980cgzEeTv2ZGuNvD5xEiQAIvkxll7NDozY+F1/E20lZKlZM+vaPCY?=
 =?us-ascii?Q?wEgoKCNnauXJC5TkeNjPVSfpxlA3NgcaWClxF9FJYXpZgF6VHUZ90gex9JRZ?=
 =?us-ascii?Q?T4mMdHtVzANg8kCMP4WP6X3A/VrcWWDYYmWgUzmLxBCmudawQdwjXNNVBV6d?=
 =?us-ascii?Q?WMwEy7tkE7RqhS6RnunjcBODcFQp8evrepyiB7tVsKHyNZT9k+6gbPgvrnwm?=
 =?us-ascii?Q?c+bMyujYccsVtsklQlk312VxocBsoK15Hvv/ipiAGyjq6V3u7EM8wfUQXjXs?=
 =?us-ascii?Q?FF3bl/SPi2f8nHpO4gTUT7QZWwb+K02krjfGbS5R4tnm2A9VGIo9laXR3K2t?=
 =?us-ascii?Q?StOP0b1BcOTHNoFlCnpei7I7rXogiwomfc1n7BRjHsw/4PBsgJq6weof6HN2?=
 =?us-ascii?Q?g6Kb8mcuBSipvYdDTk89rCS/Axx0h+kzfT2JLpTXIVu2bM8dUu4S4xOEJ+KX?=
 =?us-ascii?Q?uZ6SdhlNCfyCsdKKTA+a5/ZlNfeK8rwM1klFH85cjOTXQc+UUDho+MTGj69M?=
 =?us-ascii?Q?lKe3sdGstK1KrAgJHbLWEz7F6wGbFQNUzxihwEmj5E6jJZDEXbqiheHBM1jN?=
 =?us-ascii?Q?3k4tcASmfaQqcEpeICkuVkeIq8fO4XIDZefJTEMC3w1xnu5VaMPfK+iB656K?=
 =?us-ascii?Q?I46rl7SoEPs9gMUEd3eSq4rzSu1PWwUQ8afiwviOIR3SK9kNFCDY7AzF0Pbh?=
 =?us-ascii?Q?csQEwOMd872ZC95Pbz3hf/jjauWPp5VoErnQ6ipslOSa9goMGyBBiMPm7fLU?=
 =?us-ascii?Q?XW8/92+HCRjydxhnI+BosIDBTSlwYPQ4MeSaLENnlqRjpfRmeL5g++L3nN9D?=
 =?us-ascii?Q?+8mUXyoP534=3D?=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 06:48:17.0495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb81132-850f-40ac-a38d-08dd6dc4851d
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7406
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 06:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213812

Just like the "init" version this script, pass $DROPBEAR_RSAKEY_ARGS to the
'dropbearkey' program when generating a host key.

This allows to speed up SSH connections on read-only root systems by adding
the line DROPBEAR_RSAKEY_ARGS=3D"-s 1024" into /etc/default/dropbear.

See also: c0efbcb47ab3 ("dropbear/init: Allow extra arguments for key gener=
ation")

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-core/dropbear/dropbear/dropbearkey.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear/dropbearkey.service b/meta=
/recipes-core/dropbear/dropbear/dropbearkey.service
index 71a12a6110..501e47124f 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbearkey.service
+++ b/meta/recipes-core/dropbear/dropbear/dropbearkey.service
@@ -9,6 +9,6 @@ Environment=3D"DROPBEAR_RSAKEY_DIR=3D/etc/dropbear"
 EnvironmentFile=3D-/etc/default/dropbear
 Type=3Doneshot
 ExecStart=3D@BASE_BINDIR@/mkdir -p ${DROPBEAR_RSAKEY_DIR}
-ExecStart=3D@SBINDIR@/dropbearkey -t rsa -f ${DROPBEAR_RSAKEY_DIR}/dropbea=
r_rsa_host_key
+ExecStart=3D@SBINDIR@/dropbearkey -t rsa -f ${DROPBEAR_RSAKEY_DIR}/dropbea=
r_rsa_host_key $DROPBEAR_RSAKEY_ARGS
 RemainAfterExit=3Dyes
 Nice=3D10
--=20
2.34.1


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=


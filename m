Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F79C36011
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:02:07 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.81])
 by mx.groups.io with SMTP id smtpd.web11.13335.1743174120694761555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=OREOYWX+;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.67.81, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDM07qCTfoOiJhCIAXpS4ylnYF1DsTS+/EZ+1C+AzeauIwI4bkMvWRazAuALSldqacHTg/ZJw0j1WfYcdimChGkElO15bRb1M09gsMj5oX8AfnR/E8iAZk56jNiQDT8F2O/SO2BOw0mqu6d72LlKCZ+CXd2IE2jn429Eb6cAcuUkUdNju3xfoWPx/iF2DP1TNFHU6L7BBMxrFOz7BpA+AAZFIQ0nFblouATQy1J3Rph1Jo+eDCaK63L+mFWHlMMZwr+wqbm46ROfedVcoqPB5Dec+faUPJf9Ag5mPRMYSHnbZ40E5VRws64sfHClGw0sSk99NJ/FoNNRDXpzdZuPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6veEGoQ3rmFv5MfyGgLbYefphwQq1GVNOhnxvPDpNQ=;
 b=E3jbGu0ZPGEYHLYcK2rt3ZeoAhJr5zC1BTqsBk21GcLYMslpV8F69Rx+SoH/AQTsutDOwN+AcK+WN10+jwRKyZYb2kb6hXPfQndeiv/ISQ5ghKSt0u5e6La2rNMkaH5jSm98PYldeL2g9gAOVI5eCPT2P9g+X3NsIM6dTlJaYCP3kEPC/MyJByF6WzDoYkcs/7ycmXWV3Yt4tQC6PUY9u2oPjZzoQ1l1bK2dwrOJQtmcWwWrIkNik0vJ01oU0xVli+UfTu3o439dVAxWhc7XGEMR/Pe916Qv4g5eZL9x9RgUvuIwV70PflciKwsOodTyfaNggSOeukHPWx8HYERcOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6veEGoQ3rmFv5MfyGgLbYefphwQq1GVNOhnxvPDpNQ=;
 b=OREOYWX+F4lLiqKcz97Fr9NDoWDr0m0ERD4DONOSPYa6gPLV7TZXGlSsY3pURR5QrhL4h076PQT2JhOIdF8hc9xkpeqnG1gU5YNZV4dkWyK/HZKGFyLdzMLZoaX8cBSIHhCfU+8bjHQDEw2WI2su2mTyxobgbVnLXIN/zzY7MZRwZ//kgTeEWFotoeL6rewHINjZuvB9bDDc/MOacYvyQVF983PFJnNdGj6PITYqFerS02gmwak6Og6ybYPpM16PWojokyABSvSwkO9PUw+dOzFw4X69yNprF0mm6X/du6/aO6YbpKTe/4ZvCJYqGX31ruSBEfS09k/qyeUoiKCJkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9285.eurprd06.prod.outlook.com (2603:10a6:102:455::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 15:01:59 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:01:58 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 5/6] glib: Support using alternative runtime D-Bus
Date: Fri, 28 Mar 2025 15:01:35 +0000
Message-ID: <20250328150136.1855862-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328150136.1855862-1-niko.mauno@vaisala.com>
References: <20250328150136.1855862-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000045C6.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::43b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc71050-1f3b-4ba8-386b-08dd6e097d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5HFb3B6PBMF4M0uXg6IVz6cQSwQAJl5AeGRf6xVRMQhycI2yqyy+wXD7BaPT?=
 =?us-ascii?Q?jrPQt9cS9b9Nw1GHqZcDF42FAjz44cbdHwi/opZ/HLnrhLRUfztrEcc+1sB3?=
 =?us-ascii?Q?dklSVsBySM7zJ+5lRRYJ4a/rUVQiUWjRoelVZid1IyC7/+m+Y5qfcli3Ptmx?=
 =?us-ascii?Q?sABpr8Pcu9jKKO3GKV4uOXMxEvyjIf3KTTMlu6ih+Ozrqsiu8scAHCG2Lw06?=
 =?us-ascii?Q?IW7wtlEUEgNiOE/9Ukw57Mj0Nxtc21ocFDFZ2MRPdBDW9BkPyIvt4Og9giqt?=
 =?us-ascii?Q?0zN4eK8wvXKk6cNlv2LbSh7BlS+LCy7mQ0LCAIZKEz+ENISdXzcauEn1Tcjt?=
 =?us-ascii?Q?hhDPd4eJBYoycw/FLVzS/Z6JxmEb+ulovkYjCTPY5bfp14tLq5SBAYmd8NyC?=
 =?us-ascii?Q?nqODvgMRqUtADcmWqQyD5wn9QnACiNk/AImhP2JTgMKQrI2jzn/KS2KXToVi?=
 =?us-ascii?Q?QbzzJrE4S6BTUNlgJh0jkVwT5U6HqrhHcPcQ/eigz2VmAPXfjto7bs0CRtsY?=
 =?us-ascii?Q?HCL7vfX9WAO3N0/vAu1hWjQNoqc4g6sL92hm08vxBlXN7jgxI09Om75NB5oR?=
 =?us-ascii?Q?3amevd4AY56YZEhPt0jS7bCWjsXZgDaLEjezMxOP/NXp5vxY0uoh07asDJy+?=
 =?us-ascii?Q?JMA3Ra5fTc14/J3YWN04Ka8MtbqTkwPFlWr9i7O6mGT6gnI+a7EPN3DZ0v/l?=
 =?us-ascii?Q?aZvuQnPbinildabDfOBQo/16aFwi0Rs8qWnO6q/EgzkM1vpcuVWwo+TzpyQ2?=
 =?us-ascii?Q?neo/Fh2YFCdjxWviAlVvjT+whFO1Z7W2sXoom1kNzd7HeyJjGXZCRDpKV1KE?=
 =?us-ascii?Q?rQmLeNkA/kQly4r1pQbIyHjDc/PhMQHDks9hetUal8Ju1sX/xH3trnemEP1t?=
 =?us-ascii?Q?+S7jgfxWKRs9Ryoxt9OD9JJBIFFhyHUjewN2MEojg9gbbfDBL6uRIfZ1O0a3?=
 =?us-ascii?Q?SHHnlJfnOG2Ai8v3rSS/Bqckz6BbKCnm3PANCj7dM5zA1l+UaLeoGuN+/Kpl?=
 =?us-ascii?Q?yGLivXsQU88N8PVWXKNFmuW8ZZwjk0oytOVGh+dOBEQdlaR0uX77MTLyLuPf?=
 =?us-ascii?Q?aoGUmMY+Q86ehA3nZ7Jos3tyKWrA1XTX5CfUvFszBZvtr65A1LLZzq9F9fVQ?=
 =?us-ascii?Q?iF4CFUDhIWCqWuGhfoPM5haILLGbPMezJRohHXg35z7H8yiL8tB7vtmj70N5?=
 =?us-ascii?Q?13kUa1/oZqA1STkiBG7Aoow+DURYlO8tZBKfy3TxRDUBccovYL81vCnTkmgY?=
 =?us-ascii?Q?9Fmj0haQB9//lSWBjpy7vYY1TMmL9PRhoOXCaTFGN9hIbCeaVyhIXIuw0F8z?=
 =?us-ascii?Q?prLcCUpCn9c3CgJSCe+j4fvRuKICQgA9wgBIs9Mjs+ck3Hu8m3mnH8cuC114?=
 =?us-ascii?Q?O7DYwCiqxa/mWPtfcWbEflp4ntpxZqh6/IOIuHUEPTZIQeVd+p36tjVpyDN3?=
 =?us-ascii?Q?bFvur5SB0vSV7gcUZ8JDfdwu+9RxxbrSB5r+GTXrvS8S0d3tZU1n1Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/pw1s23Up4XWWSEOv4njCfFdaB9CnPnyj5GskcYGKXthOlkrHn9e55P5YZ8J?=
 =?us-ascii?Q?q+g3upZXR2MeqUX/99BlyqvIEPWN1/FDXUE00UlFg7QbKkWKqx7gkNLaAKlz?=
 =?us-ascii?Q?dvdqg5o3+t43ksNOX5I/PVgwABvRiRorbiHgdA37KWkJcZL8vUw5xV+AYfKt?=
 =?us-ascii?Q?XrriTKuxmsEiyb6OvgTbxBBYmtojbWhP6okjRvMB1PaUx8trN0oiPzEhSGmy?=
 =?us-ascii?Q?fd9O2vsD1YJgAiEw534ZQ8qA/Yoam/a7IJvVIb5eSmB0kdT9ndMj3HnkpqGI?=
 =?us-ascii?Q?lURe+Aq+lKG5MkjOvdII/RKIVxraOAeDE14opVguB6H9kkI79k4TyS8o2Tba?=
 =?us-ascii?Q?DC77WZNAJCGFZvrei41a683nyOe9e7NqltYj4GkJMBbSun+/9ARxbpW5gooA?=
 =?us-ascii?Q?VyhTem9o2H4IrNlXP7biV4fBEGbZwzcPsTQyrw7jD6jey6GbseeUJFU657QP?=
 =?us-ascii?Q?KbehLyn6v+0D+BpmtKf5+LNzzpGLEkS6UOgumYqRvdb/dzXJFtuD13w+dwLN?=
 =?us-ascii?Q?ZFRnqYobuip1TuFQaKS4JB+5zX4DhUM8UhmleVS9zZFp1jPTTHzbv5O8TMj3?=
 =?us-ascii?Q?yuXzGvvwFJ6jkXlwUarUoh19DPcmMqJHSnBZLZHmGVAPZmTo5eSQC3hjuIi/?=
 =?us-ascii?Q?utAy5v4BVkgNC4uzD/T2/H/0XtPMe/58ufEqqlnSnfkU2i6LVbtFtJd0BRsa?=
 =?us-ascii?Q?bBHYL5HNQ6TOVnigjXI5h/MuDRXtuls4gI6ikE5GAwW5mL4VT6/uPZuHF56C?=
 =?us-ascii?Q?AiKkh7VppYEubx/x7B6Qy2APBL/DVVnSTj/rH7F6/ynyBiBMrObk9mZg9+Vq?=
 =?us-ascii?Q?JyI4PFAuwvLfg7drQCeKVXTi8qhfxurVzk4NjC/jZVZbOqe51s5mkPB51ABo?=
 =?us-ascii?Q?81uKa45W3S8bSf5eWnuwWkkLdTl1I2O/nGY13hkEGk7avIyy+NpEOcsEWxy7?=
 =?us-ascii?Q?gMJcoslg2Z6lB/yXP/5Re8rAl0brPQSuRwpgvZBd9v43AliYNONl/EFGqggx?=
 =?us-ascii?Q?Ec+jovYNLwP5cgDWN6UG9MrcpZv0UJ+9a3pyWK9GrSR03OxOPj4NW9gRqOcI?=
 =?us-ascii?Q?wVampaE80F/bMXcbyUf5+zz6nww/rODWqNejbLLAvXK1RGAb2KnQGP9qDPMM?=
 =?us-ascii?Q?nwnFJK3206Iq3qlyE5LkDVFy9W0tfmalo2toI8DYdRud4TBLlFpdDwI04871?=
 =?us-ascii?Q?8ddP0Cx4Gj7jZlyzhUwa+IZrV2FmSEFeDSS1a9xlg8/ie3INTLEnYmzl5BxB?=
 =?us-ascii?Q?1nsLfPeZZmzSM3jH72qP3HFoIR7ag/eeHaXTzvVREDr8dyZmGGTbIwdichss?=
 =?us-ascii?Q?n0ao1Ggso185/EQRPzp5oa122cXh5W31jew5tLR4FPqMcbAMcbpY2jdPgNjd?=
 =?us-ascii?Q?vvhWA4YOqJ6v+Ovm310SrzmXEwS+acFnRH1eKXeNZXHm50oT0z9riUpZJ8d2?=
 =?us-ascii?Q?KXt6UmJ7O4NkvotUdL2z0zsJ9hn3Dn9jt5l/hmfVIgCmsCL5USCq4crc9hzs?=
 =?us-ascii?Q?4qLkq99rWGILFFx/BqsF2xMhG3t6S5h/UNtyn68un3dktYr89Zu6xbVKVPBy?=
 =?us-ascii?Q?2HhbML4NUWXbNqz9l466aHVCD9zZ49znCWFT4WLC7jaemEj9wCS7Gf1WOyDU?=
 =?us-ascii?Q?2Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc71050-1f3b-4ba8-386b-08dd6e097d02
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 15:01:58.9123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfAORlQ9qKpRWDjg12fvTcZBj8c9O7zVrvGPlxRGsrnfF+J2UtW7depmJQoz9wIv1Z8IG0GYMyy14Yeh9cdEnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213849

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, change the Freedesktop.org
specific D-Bus runtime dependency to honor the new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index 61e1a3ef17..2cc48f0a06 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -160,7 +160,7 @@ RDEPENDS:${PN}-codegen +=3D "${CODEGEN_PYTHON_RDEPENDS}=
"
 RDEPENDS:${PN}-ptest +=3D "\
             coreutils \
             libgcc \
-            dbus \
+            ${VIRTUAL-RUNTIME_dbus} \
             desktop-file-utils \
             gnome-desktop-testing \
             tzdata \
--=20
2.39.5



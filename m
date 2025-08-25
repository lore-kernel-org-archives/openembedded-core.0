Return-Path: <perxjoh@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB512CA0FE7
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 13:30:28 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.37])
 by mx.groups.io with SMTP id smtpd.web11.39125.1756128625808469175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 06:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=GSYOEmb5;
 spf=pass (domain: axis.com, ip: 52.101.84.37, mailfrom: per.x.johansson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyW4biuiyR4RI7+qvvVlMJ2KGLcHA9X3JVLEwc5BkuqRgIKfL/ZHvrpdxsh56j5WhVIzBYSIbMYFs09tb2wFrWBRP5OpmwcOlIHub6OXE14zWyN8WZkUWnZ8kf91vtXaPBfbajUHBJrNUI4lKvPLj0w1k1UHc18zZvwAo/MiiavoZ/7UOnlzdd23Ma2IzO3cqpvaVUWuT6L7FAXW3JIqC++UGuL8lQIK9nB3GDT6RrGvZcDlLAa1Yoz18nBJqeYp0gpu1x6/1ZWMRZYChnIRBX3THR7wm+pO/uekstDbFvYMYCthEcOkvRHm6KfLttIinQtpaUWas/NNXSwQh9apPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uu6ZxZUZMvHUdZhHUB9hrC21iP3KSURE6+7SaUvh3ow=;
 b=dbEU4QYQ4D2KUpFxor4cnk7HB0YHXRpras7V47eQCR/TIYWyZkWedKovFWn4RPcQYHHp3e7M4yEO8+gGO+1E+5nVqnr5Z5+ks+dspNbl+RGAchqPS3MTYI/osQKACuPuY9x/r20CXybK3oTeZp7LVr7ZmItobOx3fUtZSSnpxugdTxZlhm7jlYAA2Z9Yc7IIVY5PVGW0FfF0MUB+WEQHghbbzXnK+oRKEZJaMngS/6OOMOA2/Eww0xiXH4oOj8gAAnrCewtUvmOebXAYFNuE9vWDgcb0BEoKjCLE+r7K7jwQGpTWCZZjWoLPE/lwAPwgAP5AidR24P2W2W1ps2aF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uu6ZxZUZMvHUdZhHUB9hrC21iP3KSURE6+7SaUvh3ow=;
 b=GSYOEmb5nz8iWsK629W1ljUEoQyXTLHvEsC9EWvPEQcHNFOjSDHasshuMQWoFNb48Grrp87QMcg0/laOPZnTt3MRjcLOo3YpvAdJ5f2/1swqtc281yk/cKZQM+mHm1e7jPU8oaUKOA7RGNzOs/poeldoXjNrA8Bnr/V1VkqxUSE=
Received: from PAZP264CA0040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::22)
 by PA1PR02MB11379.eurprd02.prod.outlook.com (2603:10a6:102:4f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 13:30:23 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:102:1fc:cafe::9f) by PAZP264CA0040.outlook.office365.com
 (2603:10a6:102:1fc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Mon,
 25 Aug 2025 13:30:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Mon, 25 Aug 2025 13:30:21 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 25 Aug
 2025 15:30:20 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 25 Aug 2025 15:30:20 +0200
Received: from pc54064-2316.se.axis.com (pc54064-2316.se.axis.com [10.92.172.173])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id DECB6F05E;
	Mon, 25 Aug 2025 15:30:20 +0200 (CEST)
Received: by pc54064-2316.se.axis.com (Postfix, from userid 21198)
	id D99F558C33C5; Mon, 25 Aug 2025 15:30:20 +0200 (CEST)
From: Per x Johansson <perxjoh@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Per x Johansson <perxjoh@axis.com>
Subject: [PATCH] rust-target-config: Add has-thread-local option
Date: Mon, 25 Aug 2025 15:30:04 +0200
Message-ID: <20250825133004.3154972-1-perxjoh@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B3:EE_|PA1PR02MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eaea51b-75d8-4570-2557-08dde3db8a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0C77LIJlJqEI/gTI6n/G20CCzRC+7cMAk+n+9NA0s7jWUl1KKVSkRwoHdh7j?=
 =?us-ascii?Q?gSMs7xceEt8jjtCdMc3VcUfinPrYmWhk3cSXDF8KBv7kNUP0P8I+MAPb40aE?=
 =?us-ascii?Q?UDWCjHnAAhDjWIhF+MYR+LD+BoI7gi4Q3rI/+lXY0K/EQGWPR9VzZDrLCKPV?=
 =?us-ascii?Q?Rc1OD8bcFWTmVnXUooPtdeH9S35eF0ugCi7Ea4EC1W4ImrgZDj8z7cAYYe66?=
 =?us-ascii?Q?yQ+bkVROBZRY8SkFni/vFkxmupWbmuz8CcMOz0lpS6PsjdZxyZlO3KFZ+/Jn?=
 =?us-ascii?Q?vFNcQh2E9ht60imof3jOgU4h9avzzgGLEQSEINIa2/uzr82Sz8sGQh6Sf0Xa?=
 =?us-ascii?Q?+BwE7x8AU2eKa4zVJEEodrsnNUWpVA3/aLfb5uV2Qy4hv6HLDBEm7iVny9bk?=
 =?us-ascii?Q?csPpvfP95YDPImq3k7aCHQAnrKHDP3oeIFb6b0ipLzd2n7YanQefIVCdnzHK?=
 =?us-ascii?Q?bKPn82AWLAEKCvuBa/6LL8Win08JV/uLQcib2Mu/T2QhiNeeEJk/6lq3194e?=
 =?us-ascii?Q?mu/0S+820dvJP5yfmUzDiX6LuY5Uw1t6/dvqnaAMmEUC4lPXAvFl1MZ+gqqR?=
 =?us-ascii?Q?1X+jhSDKojBqGsP1GtMNCFvPqJs4FaKbg5EewDh0e2o5YJpry0DF8Y9AnKcT?=
 =?us-ascii?Q?/Rz8QEWeNzi6U7XrHuaxdssIIEhmxFsnIKBQgPvzr0mvATfYYmBvZSJwd/vb?=
 =?us-ascii?Q?/pAOfVi3gbzq7qRWau7uUdNQ0crTnMUU2Op4X1nUE1PqtVdJ2rJTnJs+Xr65?=
 =?us-ascii?Q?WaUYG5de2cESI1oHdzdDNEkRR0NCbXMy+tN7HHIUYwcW1eEQw96g3Km3h5Zl?=
 =?us-ascii?Q?g79c6YZvH+wCNENMC0FZSy+9dJ5amgOapTPZUXXzoX7HBVQ6CSncT/8+S21q?=
 =?us-ascii?Q?UmH1Nqc47CAWJa+nH6QjizGH9MgJhJydr9mBa5YDsBMoqufv7r50XgN004Yc?=
 =?us-ascii?Q?wJYG1KXq6Ps4xfZmkYkSJiYT/baJ84U+hLTbKfpAGsh/btaAl9yPdVv7QUaw?=
 =?us-ascii?Q?qhrsf9PuD6gi2PpGAgUZZ9+eJ5L75Vnm3tDoLOsQ09ZTobjfW7gETZvb8j7p?=
 =?us-ascii?Q?2EXoAwEZvWRm1UUzryHx7wvEhCzLvI/Z0yN7yDMTn+F5YewNt3o+0a0m+yUx?=
 =?us-ascii?Q?V3pdqRl2PuukG0c+zcaK6XYrJAOUkYJs/sIm+ozmQSpRYpFzLU4jdBDBKyvm?=
 =?us-ascii?Q?2pSrHsIVFl+pSOSxosj1GLddS9oQFZdxp+TRrutiqL3gPHr4Lmp1Kc4AIqyF?=
 =?us-ascii?Q?uAOGqlk1skW5fL/JQdKLO0/w8u5Ie4l/ZHtsUGc/eYCxRc1VEufchkogM6aD?=
 =?us-ascii?Q?VQW8L4rqdSzNGXLj6MnRCrsUnRXuSyjWIro/jvI1N6nfsSArIwy7+n0kfRU0?=
 =?us-ascii?Q?z5hU+d0pEm5A4s1wNmYkLEEPDLA8iw071BqfyFVYDJSxG0VocSPJRnqQnJCk?=
 =?us-ascii?Q?UiXl3ROtIj5Jh4FQbRg8yCpHNP141v3rPVclCJrleJfF6Z9DmsCeMglNVdtZ?=
 =?us-ascii?Q?L+hVX5tpU32ZoSsmftGMl2VCwBKap/oEb5Nf?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 13:30:21.3118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eaea51b-75d8-4570-2557-08dde3db8a44
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11379
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 13:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222407

The "has-elf-tls" option was removed by the commit
8e1614a906086fb46c5dd7b7f2dffab91194165c. However is should have been
renamed to "has-thread-local", since it was renamed and not removed in
rust by this commit.
https://github.com/rust-lang/rust/commit/391332c5d9d5a5e97a0d36e011a87ad430=
45cfd3

Change-Id: Ia1fdf7698ebeef62a88052713645d5b499164353
Signed-off-by: Per x Johansson <perxjoh@axis.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-=
recipe/rust-target-config.bbclass
index cac6e90a9e..0df6f0904c 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -418,6 +418,7 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['linker-is-gnu'] =3D True
     tspec['linker-flavor'] =3D "gcc"
     tspec['has-rpath'] =3D True
+    tspec['has-thread-local'] =3D True
     tspec['position-independent-executables'] =3D True
     tspec['panic-strategy'] =3D d.getVar("RUST_PANIC_STRATEGY")
=20
--=20
2.39.5



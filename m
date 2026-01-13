Return-Path: <y.moog@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725DCD29DEB
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 08:27:50 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54843.1768292864712781062
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 00:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=sxTpzKk1;
 spf=pass (domain: phytec.de, ip: 52.101.70.83, mailfrom: y.moog@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N48ntMJnLtrNXj9dAQ2G8+1UvDuAPqgTJxiNY/0Tq0PDvB6sWtbTnv3wQETwHUj/4Rm+4ea2/vbhBH/lcNPKBrPetRrmpMs2hxuy25G6YfRoDOFkAdDrz+8vp4BEkDI7OuSY1wHUMwo6amE92i3AQLzEj1QCMHmoX+FI8yiDKZ7QlstogSZKpPVsOFIfWhxG3FgJLKaM0UzMc7M7R90UZLsLbBiY4FQ3Be9LUnL+hByS6EafqankDu/xb8kpoaKrdV40QEuYp1ICIK1CMfivoGlag+ZsPJFb1MunPuGoMoAIsIJIReGwhtD0CEg3EQKo9KlabUgXbzmGUr6BJ1jC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6iamp8AEw5CCANyIjpFdiT/W81k8ir0NJ2QdretKbc=;
 b=aMQpLR3JXadNkRuKDGZ7njhAccraUSLNpJLCrl2D3dZn0EP36omWxnYnT6rKeBVX1fu3uqdniKYQROod7YA3HF+MxItN0lMb2UpowHtVzwRm8TCetrQA4xWZtbz9mRnwohM2K3EM9UOjqXHxZjOACq05kxf++1djPsarDwWcAWcboizrcSotzohoJHyzDcxUYuK6d9wSHgWnEFJKKSCHpSAHEo+QT4a0PJTMO4KoYu9yEccHWLJedsVETR7JHJqxZrC+ZpEAeEfni74ADyPoKuZo87VZHh0qJ6KppxcRkg7AXuzLZtkDuuM8ez+bGNOh6wxV8HNDjtFl/HVoeqq10w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6iamp8AEw5CCANyIjpFdiT/W81k8ir0NJ2QdretKbc=;
 b=sxTpzKk1w+Xvi/CyLurnZmUxnL8zvBkFKX3EDN9xX36H/2i3D62FWN/babwJ7fsE65VQlZx9p7lqiGg81Rd29KiE3exdsvegAGkTtRmbb3cAYhnmjN/tbCs2489Xw/bJP1bVIXarW6/XFDy4vSmqyew4pNXWQopZYEAg6K7BKbq0UC+MveNrpRW7wDDPYm3AL9KjkGIYkwUWKjkWAiij06yg9hVlF06bnHuqebZ4IvcM2tGCrUdU7CVJ/X4n/UwpQv7N+Kh8IgFJj3uv8agKfNNBnPdiYR6lP/UnMFj5DlJa4MlqEFq1MoJ5WpSqCIQuqhzzGOn+J4R4qSYbiSE/yw==
Received: from CWXP123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:73::15)
 by GV1P195MB2530.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:1ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 08:27:38 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:401:73:cafe::bc) by CWXP123CA0003.outlook.office365.com
 (2603:10a6:401:73::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 08:27:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 08:27:37 +0000
Received: from [192.168.2.199] (172.25.39.168) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 13 Jan
 2026 09:27:37 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Tue, 13 Jan 2026 09:27:24 +0100
Subject: [PATCH] icu: split at '.' instead of '-' for major version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260113-icu-major-version-fix-v1-1-50e1e75b4254@phytec.de>
X-B4-Tracking: v=1; b=H4sIAOsBZmkC/x2MSwqAMAwFryJZG2j941XERa1RI/ghxSJI7251O
 Y9584AjYXLQJg8IeXZ87BF0moBdzD4T8hgZMpVVSusc2V64mfUQ9CSfjRPfWA5NoypTFxMpiN9
 TKM5/t+tDeAGn0lWFZwAAAA==
X-Change-ID: 20260113-icu-major-version-fix-5b8806a74fe0
To: <openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>, <upstream@lists.phytec.de>,
	"Yannic Moog" <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768292857; l=1205;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=l5+YfZnGY2H1mFH5ZNoWeAG+W3Gpl9Wp6WaaCkuKy3s=;
 b=A8XJu1NPQAwOWrTqzzm8atTCLs5VxDaUtbsZ0I0zHCVhojUNZWTP3OmkhaK7ByexOA+DSAC5X
 lZuMU7/hswSB7RSezYvlx38zpq0vE4+5bHStMHbeh7piNHeVdm4yx2F
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.39.168]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A8:EE_|GV1P195MB2530:EE_
X-MS-Office365-Filtering-Correlation-Id: 71402a97-9c36-4d57-68fa-08de527d9c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmI1RG9PQlI0b015WExqOG5rNlJKejB2RHdsZ0RsN3IxdGMvazhEVHZCZ1Iy?=
 =?utf-8?B?SE40cmtmWnhWUVArQVptKzdiMFdPZTkxV2JtaHAram9vbkhUbTEveGlCQ0xZ?=
 =?utf-8?B?WUdPZTB5eUVBVXFKSHVQTENwOXRYdWhNRkJoZG5mTk11Ry9abmdPU2RudytG?=
 =?utf-8?B?TG1hZjY3YXV1N09nbTJzT1NlTXhhUmhzUWxQY3RzRGhyaENjOVVTaXk2M2pk?=
 =?utf-8?B?RUUwOWJuam9SSURibmg4ZEJTbXFocE5EOE1FNm9KbU5KclBoOUVmYkNXQ3Aw?=
 =?utf-8?B?dGJsWXVCa2I4bWlTSkV6eUdJWlkxZlVzTjIrNVdaUDhPRGs1UGJRSmZNUW5N?=
 =?utf-8?B?Q0xtQ0pqN2ZDejdNUkZtU0NxbWhqNWlzdGJZVnR0VldvbU10QXBNMkQ2V3di?=
 =?utf-8?B?UEFnN3FqWHcvZmFJRk05LzErUEZpZ1E0REJRRDJOMUFUYlh1OGpXK2R3eVJy?=
 =?utf-8?B?eUlrZnM0U2RuSm9nN3k3ZWlLN1BhY0xRUDY4S2pETE4zQWc3YU1qbWZVZUdr?=
 =?utf-8?B?MzdEMlplQXJ0ZVQyeWoxZkM4Sndyd0ljeEZOczVLYnRKMlQ4bFJvMGNvWTA2?=
 =?utf-8?B?VEpvNEdLNEpTaTNhSTFGdCtoZVp2OWplNnZpSmpNeDAycXF5WUxrcDFOMUVF?=
 =?utf-8?B?ZU14U01lTWdoaFhPdEZpSXB5SVUyMEdVN1pkOVgyelN4V0kzQVVHVy9ia0VC?=
 =?utf-8?B?aWloQ3FRbjZtREFEMGZSUDVYQkpPaHluL3hSOHUrNjBrZTkrVysvclZkSXRr?=
 =?utf-8?B?M3NmZDVUNUlwNlFJdGhWYUV3R1lLS3B0eHE2OUxzNWVwUEJrU2QrQ2dGS1dD?=
 =?utf-8?B?ZUZpTlZwbjZnWG1IU0Y5a3U4eUtBVisvZXE0b0owNUtRNUVsb0RtSDZINjAx?=
 =?utf-8?B?c2tFMGpZbHVuR1NnODRnREFQS21WeXZmcVJpbnYwaDVzM3ZSZlN2NUQ4U0kv?=
 =?utf-8?B?dkg3L2Y3S0lWdWNFZEdadHBOTFZZNzFvK3lQU3owUjNIL0E4akxYZWdSdkNN?=
 =?utf-8?B?NDhrZW5PNk12b3NvaE1NbHEwSUY4ZERybzMvN3R6V0wwN0Z0M3ZYb3ZMMFph?=
 =?utf-8?B?NnVIZXBTR2NhVm9kY1RkNzFya1E1R0tpWGFvWjA2NXhTM2MrRE42bEJKeXh6?=
 =?utf-8?B?SkZwMGFpKy9TVldMMk16WVovSGx6RWtKLzVha2pWNHNVSUthckFieGdST0tT?=
 =?utf-8?B?QW5ESTZWbHNqRmVEc1VuRFZyOVlRcXRHSDRvaE1wSTVtUmlMcm9Ec3lJT01s?=
 =?utf-8?B?aGlZOE9YSWYzTEYwT1BzVytjVlFWNHc4WEJtN3hEdHpFNldCK2tPd29yNEtT?=
 =?utf-8?B?bzE0aHZRTmhCLzZqNU53NGNQRDVKY0pyVCtoVWJNWVdURlBTMHRLd0JUdnpu?=
 =?utf-8?B?bWc2d3Q1c2Z1R3JLZDhwZVphZmVIemhtTzJWK3IyUWZWN1R1U0FjeVNic3Fy?=
 =?utf-8?B?aWZOcVRvaEdNeDZhUEhNa1JtTkZLM2Y1OERmenA5MmJZams1SitPRFI1UG1o?=
 =?utf-8?B?ZXE4YWpSeUx5c3dEY0NYQm1wRGJHUnNQdXo4REtCcCtzaTdoTXNJZWFlRjBZ?=
 =?utf-8?B?d3Zudy9HY3E5N1k1MW5WUFZRRndkcGxOT3dWSHlFRXo5MTkrNHUyYmJJWWJn?=
 =?utf-8?B?M28zRjFGNTZ0ZU1wZkZqZVlsTjZQeUdVaEVlVnYzMllGV1Y1b3ZzYTlHQjdi?=
 =?utf-8?B?MGFPUEc3WkVuOHQ3RDdhMUc0UmQ2Y2ttTElWbnlMbFRsSjJqMFlYa01TYjJu?=
 =?utf-8?B?V2VxZytsdjkwRFlPQW9rUE8vTjFSQWhLZUZwTzJveUZPLzVpVjlCeVdHSnda?=
 =?utf-8?B?OXRnMjdKWmpPWUZYd1lZWHVFNVgyNVhNbE5YeEtjOTg5NW5nZ3AvSFFKbWdm?=
 =?utf-8?B?WVBCc1ZtVTVVTFQ3d2lyR0pxUVNndE90YjF6ZG9JdjhxZzRGS09lQzN5TStl?=
 =?utf-8?B?L1g0NS92MFpyd243L1ZZL0NsYmo1dHNaNnpLRXBIUlFHMll2L3EwN0h4MTUr?=
 =?utf-8?B?c0JCNmFmVm95YVJhSStNM2o0R29rZzhRS1Y5alYzOUtJSUxNZER6Z1duWnBp?=
 =?utf-8?B?QzhTRG02NVQzYmgzbzdxRjlPMkRNaURZVGJmSHlSWnI3VWVKc2FJak83cXZZ?=
 =?utf-8?Q?hJks=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 08:27:37.9050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71402a97-9c36-4d57-68fa-08de527d9c47
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB2530
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 08:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229232

With version 78.1, icu adopted '.' as separator between major and minor
version. With the upgrade commit, ICU_MAJOR_VER wasn't updated and still
tried to split versions with '-' instead of '.'. Fix by using '.' as
separator.

Fixes: 479d48503dd2 ("upgrade 77-1 -> 78.1")
Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 meta/recipes-support/icu/icu_78.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_78.1.bb b/meta/recipes-support/icu/icu_78.1.bb
index 8827f05f5190ddd364fd9f0a139ca6588809e04e..ee7245c27bf101da3623658d044239c45859d6f0 100644
--- a/meta/recipes-support/icu/icu_78.1.bb
+++ b/meta/recipes-support/icu/icu_78.1.bb
@@ -13,7 +13,7 @@ CVE_PRODUCT = "international_components_for_unicode"
 S = "${UNPACKDIR}/icu/source"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
-ICU_MAJOR_VER = "${@d.getVar('PV').split('-')[0]}"
+ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
 
 inherit autotools pkgconfig github-releases
 

---
base-commit: dbb0defb5e345b17211ca54d2b9d6237dede60f8
change-id: 20260113-icu-major-version-fix-5b8806a74fe0

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>



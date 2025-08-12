Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3521BCA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 09:51:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.117])
 by mx.groups.io with SMTP id smtpd.web10.70656.1754992293921667097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 02:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=bwFgpl1F;
 spf=pass (domain: phytec.de, ip: 40.107.21.117, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6Qydnt95Ep1/HOlXs9GpgRIrcDocEjY+XiiZVM2VALpY+hvaIIjZwG4YwpOR+uqKk7uaQ6XKnqHdrOLiK514/xUDugVQZHKolnIr8j+8QLItUJQFn2NedARlXieHaWTlxvExf5y9S0kHJiWgKbiPKE2NweOwhcTNMO7uxIGQNo4dLudJ+sqgOiOB4L4h/Hgwk/Eg9DAXf/cUgZnQjXV/58BGFectcwp0EbN4zd3KSW9nWh19jCpVMJotym86plzTdUs2TwCYh+i0Ak6whCjvxDYhA4SZQ7IJpw+kJ3K7Hq6uzXjHfVq700cFLkYjFGGJeZOl9NMO8R4S6X1n/C9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hnd9mgSfM/Lgb/3HSfGbE7Y0wExzneXug9aiGxQ8LQI=;
 b=EZDUHdCg7I0hfJiWHwz/xA4m8wNdxBeRscrvRZJe0cAIJhjU8d83rvaQ7yOJkypFyBB2+xpjlx8QkEnOM8E+7HbXaXH8vZoGrrodYBKgDSX9mh9v/RqlGVqkc3Mb4fHT3PCtUfuNCPqsf1CNP/bmjR4ijbtj5b4sOIizhyYlTJ0cCWgvx7eNCDeeJGWW54yqYZIrAkLtZK676Co4IRz4tkIUtTFLUQWBafSB9x7TwWLInR9+Rs0uUHHXaEHBNKMfgO/q6sdRJ9PhMdLflj1OhgD0iXOn8jCRWE39kRfNc7uDOGyOYcBwKpA0wXegidCz7xpo3Is90BVcaeXo/tg/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hnd9mgSfM/Lgb/3HSfGbE7Y0wExzneXug9aiGxQ8LQI=;
 b=bwFgpl1FE8vEv4ObKwjustugWqP7szkrM18Pl7Wz8VpUdzRt7Mr4YdmLOmG1deCycp6ZzwQy3mOOVebG92euMG/Z25IkgyN4wa9dBS1GZQHN4n9svGiQKbD7KFEGeJm3D/jUfqkMxEoDMv0SznCIB900pAuroyrC2cMcQk3zSFaVRCP02QjH48ZXjq1oqg2BMQDBhu+OoWCgGVqWbp8iBxzq6JFenRihqbAhxfcsRSWrK/8BTbSFdwa2cj5uYGIs2f1zY2kYTh1/+nCHQuIxYNQuPi0ot9AxDeiBWdRW557TQsWtJ3BGkXVNjp19qVy7sNUpT4Zi2PP5SoyBlvs36g==
Received: from AM6PR0202CA0068.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::45) by AM7PPF14BE2BDB4.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20f:fff1::746) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Tue, 12 Aug
 2025 09:51:29 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:3a:cafe::eb) by AM6PR0202CA0068.outlook.office365.com
 (2603:10a6:20b:3a::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Tue,
 12 Aug 2025 09:51:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 09:51:29 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 12 Aug
 2025 11:51:28 +0200
Received: from augenblix2.phytec.de (172.25.0.51) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 12 Aug
 2025 11:51:28 +0200
From: Martin Schwan <m.schwan@phytec.de>
Date: Tue, 12 Aug 2025 11:51:08 +0200
Subject: [PATCH] arch-arm.inc: Only add -mcpu options if it exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-wip-arm64-crypto-v1-1-5c2cd9d8f1bb@phytec.de>
X-B4-Tracking: v=1; b=H4sIAIwOm2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0Mj3fLMAt3EolwzE93kosqCknzd5EQDAzOLZHOTJONkJaC2gqLUtMw
 KsJHRsbW1APwPHmBiAAAA
X-Change-ID: 20250812-wip-arm64-crypto-ca0068c74b3c
To: <openembedded-core@lists.openembedded.org>
CC: Martin Schwan <m.schwan@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|AM7PPF14BE2BDB4:EE_
X-MS-Office365-Filtering-Correlation-Id: 8651a815-7ffb-4142-c09f-08ddd985cf9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHEwNkRxWisrOEZhMFhkcEhVVWhnMld4L2ZvNXZyRXEyTHZrbWVmMHJLMEo5?=
 =?utf-8?B?dW8wNm1PSDg3YUoxWXpseGJSYkg3WGdlQkVlVk5KZEpGQmh3bGNpclNwamQx?=
 =?utf-8?B?Z2pDSEx4M2NQMDhKKzRRMXhLblN4ejNXQW1GOHhNQ2cyM2EwbkJsUDZSVjlQ?=
 =?utf-8?B?T2NuODR1SjlvUTNpT08yMTRIRVB1UWVVcjNZL2Qyc2FXL0ZZWk03bTIrSUN0?=
 =?utf-8?B?bmR0U0VsNHgwQnFlRnlteEF1RXl3NFRNTzdKenUvVVAyL0JxQndEbFJPT2VW?=
 =?utf-8?B?QU03QTVzZWhLbkYrclI0Ykxsd0NXSllrVWtqV3lST0JES01aUWpQVFBWK0VQ?=
 =?utf-8?B?NjJFSElHN3RvU2s5Q3h0RVppNlRVLzY5ZWpXOE8xSUNFUkZlVEJXdXF2RmZD?=
 =?utf-8?B?Z2lqS1gydnd3U3FoT1FSYk0rZ1JrRm9zWGFUdmMxV2xyZm1mUi9NZjBMczZF?=
 =?utf-8?B?aCtVejBNQS9kbWZhRWNGSy9JdS9zLy9Hc0IrTUM0Qm5Mc0NHQnB2ZlBxUVBu?=
 =?utf-8?B?bDA0SkNaNks5dTJycURlRmhFYkNiRThYYnlWZUlZL1EzNVRoQ2trbFpvRnhq?=
 =?utf-8?B?RUJtZ0FxWDdDZ0J5TlFzUEgrK3lsWTZ6bGEweDAzZi82MWo1RWdBUGZUbTVL?=
 =?utf-8?B?STFiVmpjMWFzWjE3dHFmK3ZJN2RCcU0wUk1FOGdUNW1EdXlaeWk4Wml1NXlW?=
 =?utf-8?B?VWhycmR0TUtaVmMyQlYzMlVSU0dRZ0RINHEwbkRXNm5hU3JZZ2NnSzJDTlF1?=
 =?utf-8?B?V3B5cUErVURqK0xtMzhTbmQ3dVZoZXIwTi9yV0ZldlhYLzdhQ0xvVVdoR3g4?=
 =?utf-8?B?NjRETDBJellVRFNiRXJQUDJqZ0MwYUdNOVl4bGpKMmZMVGJ0My9hYnFSWUlm?=
 =?utf-8?B?MTN4VWE1bk9MTFVnaVBWbVpKMUhQcTVkVWlZRERhd09Wc3gwQUN3UTFIL2g3?=
 =?utf-8?B?NlhDUTBkOVJUUDFUNnJCellYUStEdUhoeTdKMUtnY1Q2QXZVNkx5NzlzSVZW?=
 =?utf-8?B?Z2x6QU45UUM5akZyR20rZkVZblpUNC9YeUtGRm5JQlg0N1hsOHZlSkRCbzFN?=
 =?utf-8?B?SXBNa0g2VWlySXA0UEVqVjBLcjFoRlE5R0wyQ2hwSUIwYjR1R0pNWk9vbUtj?=
 =?utf-8?B?VlNvTzR2czJQUkxQcVF3R0lTTUFTeVNsaXN2bTM3OXUvUkNvQ3g1ZlpNSE1C?=
 =?utf-8?B?QjZmRDRNenkxUEJLTXpuekUwSjhpVjFWU3NUU1pNVU4zNWxXNHR0OUFlU1hL?=
 =?utf-8?B?azh0cEdSSGdpazVqV3NJZy84YkQyc2Vrc1ZIU1R0dW5WNXVzSzArUlNRWjRE?=
 =?utf-8?B?NmdjMGE2dVlBQ3JqazBYcXYyZlc4Z0JidDI0SmV2YTVQN2tlZTlsbXk3b3Rh?=
 =?utf-8?B?bFBpWi92Rm1XN0tOMGhoZXNzdE05YjM4QncwOWhIb0VZa1MyN0xBWktLbk5k?=
 =?utf-8?B?UE9RZ0tRUWVwRVozdXYwWURlSExVN081MFlBZ0ZRY3orenNqNDFuNGc3OCt2?=
 =?utf-8?B?TitCME5SMm1WbjByOC9yRHk4dHp5TEE5L2lBa1ZFL08rZ051d0dOQmwwM1Rv?=
 =?utf-8?B?UjlIeVowT0ZlQW1Ib1dZb1N5cVlMMStUaVdCRFlRZ08raGgraE5qRVB6VFE3?=
 =?utf-8?B?Zi9MUC9YMVZ1Wk90aFU3dFpVck55MWlSWS9aQ29QUmRPaXRRU1QxYVhOMVN3?=
 =?utf-8?B?ZHhhSWliRTl1ZzRzbFN0RUdFSnQvbWRvZVc3cHExY0VGRHExS0tuais3QUk3?=
 =?utf-8?B?MGxtUmVHckNnWW0wcVZoMFk5MkNTUWNHbmZMYS9ZMEl4bEs1K2gwTXhKUUY4?=
 =?utf-8?B?VjZMTzF4OVJweHNLZ0ZvSkxMNVFVRE5zaXRaMXBHa1VXVDhpM3FJM0NnbVAw?=
 =?utf-8?B?Q0dZQUFmekxUc2R3V3hYZ1ZvU3lxNVJSZXI0YUNYZFNicGtON2p0VStLK0ta?=
 =?utf-8?B?MFJqdDF3L0M3RTVjc3hhT0QydWJCME9SMGJObE5uWVUvY2hxOXM4VHRGdVRE?=
 =?utf-8?B?WlV1QlpLakVRand1QXBoY3M2MjNrcE02RkJtYnZENUNCZkhuSVhHYXVwVy9U?=
 =?utf-8?Q?gMjOLN?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 09:51:29.3228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8651a815-7ffb-4142-c09f-08ddd985cf9e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF14BE2BDB4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 09:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221759

Only add feature modifiers to the -mcpu and/or -march option, if
-mcpu/-march is actually specified. For some very basic tunes, like
"aarch64" without any ARM version, the -mcpu option is omitted and thus
no feature modifiers should be added.

Fixes: 754345d6063c ("feature-arm-crypto: Add +nocrypto to -mcpu when crypto not in features")

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 meta/conf/machine/include/arm/arch-arm.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index f1e92e19c6156da171de952fcb74bd05b95c8685..56616772fadd92c0c2dd01a9c4983f1fa573fa95 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -17,4 +17,4 @@ TARGET_FPU = "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
 
 # Some -march settings need a +X option passed in.  Since we cannot guarantee that any specified TUNE_CCARGS option is set in any order, we must hard code the order here to allow for it.
 TUNE_CCARGS_MARCH_OPTS ??= ""
-TUNE_CCARGS .= "${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS}"
+TUNE_CCARGS .= "${TUNE_CCARGS_MARCH}${@d.getVar('TUNE_CCARGS_MARCH_OPTS') if d.getVar('TUNE_CCARGS_MARCH') else ''}"

---
base-commit: 1dec53b350d7d2edcc880f640b1cb2fd31ff7f0b
change-id: 20250812-wip-arm64-crypto-ca0068c74b3c

Best regards,
-- 
Martin Schwan <m.schwan@phytec.de>



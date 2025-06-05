Return-Path: <y.moog@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3690AC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 07:24:18 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.123])
 by mx.groups.io with SMTP id smtpd.web10.1673.1749108250839664447
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 00:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=WvUsXE9u;
 spf=pass (domain: phytec.de, ip: 40.107.20.123, mailfrom: y.moog@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntJVvVdCFd4Co3Fr9ye9pV9yV+DfY40O4Q0mRaWV/TLiJ2l+9XztxbHAKMQmShJiPdgNnqho2AOIdEUS5+58CwPNVmx1rUMUSQCmVBucaqji9H4n+0WAWxU6cfN5Y1Eh9gtcgIfJjclYHxq5OumdqlVucSCzbwhoFIgB+fNQnyUihxpo8q6yvBH7hnz/GqNm7uxIDJFR70TfA4zJK3LHLsx2Y1uhRxF/PR0tD56XCZwRCznszuhi8/q0On39rrI26oNzXCHPF9nBV9WKHO/iLJTb4K2yKz1+xpDzHvr1TRzzide+m8upzv8/kduFMdQ7lnCekZhNR1Du6lrcYRZ6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkJ0OA5t/kF0+/xQK1U+Ej0u0eJWVoiyUokvnN0ISss=;
 b=UJil891dFE1hsPPLQOrFzJk7vw7bY9XJmcdflO3KPgEi2d3lt23GDMvAKmzE40ovuwUv1dN9a9QALrs78baheLYpqXrRlYmWDnaZl1fsH7PR3ud9xOnP1oZxeSWc53cl6atv1k0JhSOHLh6mhM7hU8Xb7vkT4BbtrIdVbe2VxyIc8rkX16hVAP/tcAYm66KXz1qDWOW4izCoxYyuy93O0hP1RsoHmKbW8Pr+mbDqUqonnnBIpX1zITxkWOAwgROUzm84SCueqoywL5zEWyI2P9jkbeKtN01MA9Uaqxt+mMbwQ8o/HflZt665wwZRRJrBjjqEN8iO5Np6f80QKyr2LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkJ0OA5t/kF0+/xQK1U+Ej0u0eJWVoiyUokvnN0ISss=;
 b=WvUsXE9uFpISqJvNva1ORzMyCFakI5aZqqZvqAfMdI8XPqP8f1kSPAYMao5LjpJ044KwjOD0avRWWSEaFbmmlwEy1dGOmRbY4GpOfshLPNKYuU+nTg4okkWNtsrprelgd5UBAfQ3nj9IjsLlv6rz68IgP/Sng4LlZWDZkzy91UZVQjQf+07RCRajsgO9+0Z5fvWvnB5X3VuLaXq2o4UiqlVqlRovX1m8YlKn2PVOXmwu2uHf8CRQDHbsgtigyhL3VCB0fbmRlO7xcvHqGZgHDvkCWgN/Rj7g+sLBOO7sylOvCaQHduzYZP1F0aw6Xaq58reOCsN3608E6PwCHfp1iQ==
Received: from AM6PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::24) by AM9P195MB0872.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 07:24:07 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:e0:cafe::24) by AM6PR01CA0047.outlook.office365.com
 (2603:10a6:20b:e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.22 via Frontend
 Transport; Thu, 5 Jun 2025 07:24:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 07:24:06 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 5 Jun
 2025 09:24:05 +0200
Received: from llp-moog.phytec.de (172.25.32.81) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 5 Jun
 2025 09:24:05 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Thu, 5 Jun 2025 09:23:50 +0200
Subject: [PATCH v2] perf: add arm64 source files for unistd_64.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250605-perf-arm64-unistd-v2-1-c86ff172b167@phytec.de>
X-B4-Tracking: v=1; b=H4sIAAVGQWgC/22NQQ6DIBREr2L+ur9BpFhc9R6NC5RPZVElYEmN4
 e6lJt11+SYzb3aIFBxF6KodAiUX3TIX4KcKxknPD0JnCgNn/MIka9BTsKjDUwp8zS6uBlUjhJZ
 2VFK3UHY+kHXvw3nvC0+ltYTtuEj1N/3ZxB9bqrFG1ZpmGNhV8dbe/LStNJ4NQZ9z/gAEd0m8s
 gAAAA==
X-Change-ID: 20250603-perf-arm64-unistd-9344a6fc96a7
To: <openembedded-core@lists.openembedded.org>
CC: <upstream@lists.phytec.de>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749108245; l=2177;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=8cp8n9grrxuUtv7ValDDCWWowmMHKlSbZ3iDjWjfG8w=;
 b=PPHmz1Nl2ouW3py6Pr6oUnnKM/vAX+59nz+jtS321UNvM9nH2odIbcH71USLhcwi04orX/MD1
 4VOPSEZVVLECoubPhj3bHZR/UQRUbtMKxbDa7uP4YPcKuOoJ29tkwqz
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.32.81]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|AM9P195MB0872:EE_
X-MS-Office365-Filtering-Correlation-Id: 20183650-dbc8-4cf1-8076-08dda401f4a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aWp5TCtVMGlnUGZzbWF3eGxxYk82cVpVRGFOU3hwWGNhZ0NiMUF1N0xZM2l1?=
 =?utf-8?B?Y0hDUkFwZ29ub0o2UFZQNkNodGRKRmVVd3o1VDBHTXJKM3VxaEMxZWRRcjZh?=
 =?utf-8?B?ZDVCaXIrREl6dWRSOXlGaVh4NVQwbU1aMnVmRklLUklSdTlub0NyZzgvbjNW?=
 =?utf-8?B?UWFvMnhUUXIvdXU2TVA0K1dWdS9kT1VUbSs1YU1vRlJXWERVRmhVL01sNTNv?=
 =?utf-8?B?ck5CcG5JWjVnYjMzYU8rMUZkS1YrT1MrV3F0SnJwbUFiWUE1UnZ6WnN3MEtY?=
 =?utf-8?B?a2FzbW9mRHdSVi96bndZOVJvRWxNVVBoOVNkUFdHVGtnR2dyNmNlRVNwelhJ?=
 =?utf-8?B?UllVOXBtb2huVmRIOVN6Wlc2ek5lcDVDMEhDKzd5VC9jWDIyanloQlZsZkNw?=
 =?utf-8?B?elhaMVBUcHM1eUtmOE1uMXN3R0hoNVMxUFIxRzVLTEZxZUg3bEw5UUxad3h2?=
 =?utf-8?B?SUMyNWRlTWljMWxFR3dZREdxOXZZZHBUeG51Q3Rhcm5XV3QvZGZrc3UvU2s3?=
 =?utf-8?B?Umx4aVk4NElZMXJTeWUzZktmNmxvL01qQ2dBNmo4MENpS3RkNzhhUE13QTVx?=
 =?utf-8?B?NWtpYzZ1TWY3Wnp4YzRreExDRWJJTm5vYnE0dHN1RWZwSjhCejFXTVAzWk5Q?=
 =?utf-8?B?VjRDNDI0ZS9xZXYraVBXRW12cFVnT3Z2V0tsL2ZnK1psM3dLOEg1RzAyZzBU?=
 =?utf-8?B?NnkwTEozVWZGU0syUjRkQlBra280d1BzQlFjbDFjWjRGcS9IT21VMlduZWZv?=
 =?utf-8?B?Tk5GNHQ0TW82VVoycFZ4ZDR0ZCtlNFJ4UStEakJBZ3dXTTA1WjNNcTRNRkRV?=
 =?utf-8?B?Q2lQVEVVdDF4SGlmQ1Z0WkIvR1hMOE5WQkpQbkhJUmVqbTFZWnlMdEdvMk1j?=
 =?utf-8?B?MnY1ejVFK01wK3AvMm03WXl3d2dKZ1FkbW1BcXVWSFFSdWpBWW9IbEdkT3ZU?=
 =?utf-8?B?UzR6YzZBMUVybTlnMC9yOG5RWTJjV0ZSdjBQdlpPazZaQTRJSW9CRGdlMWQv?=
 =?utf-8?B?M3RUajhoTkM0K2FYSjR4UUFkbENwa2R3TU9QZFFQd083RGdQNWp5ZTJvdEVh?=
 =?utf-8?B?Vy9CczJmZ1JsNU93TUw3TzFGMTBoUSthdmNvZmJjcVdZWlZsbk8zNzlGeE16?=
 =?utf-8?B?S090UHlSeFJvUmExZ2NMYTdBckJRTjMwUmtML0VRRkxYRk9SRXorUm1GY3Rz?=
 =?utf-8?B?SUtWVGpxWnQ0eWg3TVVJbW5oMUYwcFUxQ0FqZ01BbUs1WXRZSEFQRTJQUTVD?=
 =?utf-8?B?Vm5WMGdBVGNLZlMwMnlMenVOaHRwK21JRTRiMHhSUFNhU2FPZFVESE1kd0sw?=
 =?utf-8?B?ZEpPT2R2T1ZmQng5S3ZZZHkvYzlVeWFNNU85NXBmbk1DVEZDK0V6WHgxS2lO?=
 =?utf-8?B?cUlMME1vVjMyc0NlMk41SEVad2IvZWtvSHd0ZFppNXpkM2dKaURVL3lnRWoz?=
 =?utf-8?B?dU5zOGtlRFZkcjdiMHM4QTdzTndaT1kvY0dCc3N3eDFpUkhmOXJWS2kvYUtP?=
 =?utf-8?B?R0k0WUkzSWdLQlRYWHpyQzdQbnptT0cyTUROd3p5QWZVd0k2STVOVGU4UjNp?=
 =?utf-8?B?V1Fzdlp0T1Z2dU5JL0drdU5KYTRpb2FXOEJIQ0xLd3FOQzNtSC8wWEZ6RDM3?=
 =?utf-8?B?NjFFbXgrUUFMNzhqdTQrVXpwdG9IUS93bEZobVM0THlBQzRocUJOVWxsdTBK?=
 =?utf-8?B?MVBGYlVxeVRMdEhPSlRLdkJXVkN0M1VzMVdLL1plNXNLalRDVUZUQnpLc2w3?=
 =?utf-8?B?alZNVGdobHZhOEwrNFpUN2VuZHhCZGE3bjFyUlZvOG5UVjdZYVNuTDltNVJF?=
 =?utf-8?B?WXV2TXRKTjlHZDc3b3hqSnhTNE52SG9oUjU0ZGJGa1h4UE9GVVdDRDFpNDBj?=
 =?utf-8?B?T3VRZC9hcm0rM3g0cnJ5aDNGQmI5Rm5yZWFGZ0daSGMvazJ5bnRybEV6TEJk?=
 =?utf-8?B?ZnhxWFpyY3duTHJRU0RvM3RjaWhGUDdwN3EwMVNJVmhXSkgwaVhpWVBhYmZz?=
 =?utf-8?B?WXBMRXNCN2lBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 07:24:06.2243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20183650-dbc8-4cf1-8076-08dda401f4a2
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB0872
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 07:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217991

kernel commit bfb713ea53c7 ("perf tools: Fix arm64 build by generating unistd_64.h")
introduces a new dependency on source files for arm64, specifically
include/uapi/asm-generic.

Build fails with:
[..]/perf/1.0/perf-1.0/scripts/Makefile.asm-headers:33: [...]/perf/1.0/perf-1.0/include/uapi/asm-generic/Kbuild: No such file or directory
make[4]: *** No rule to make target '[...]/perf/1.0/perf-1.0/include/uapi/asm-generic/Kbuild'.  Stop.

Add the directory to PERF_SRC.
Fix whitespace error while at it.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
Changes in v2:
- only include KBuild instead of whole directory
- remove ARCH=arm64 condition for inclusion
- Link to v1: https://patchwork.yoctoproject.org/project/oe-core/patch/20250604-perf-arm64-unistd-v1-1-97d3bb08927f@phytec.de/
---
 meta/recipes-kernel/perf/perf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 0d19e1bdc222da26a5ad0a1d4964acca437a6692..6cc5499d8dd8b568a135ad767bd2dd53fc4dce13 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -151,6 +151,7 @@ PERF_SRC ?= "Makefile \
              arch/arm64/tools \
              ${PERF_BPF_EVENT_SRC} \
              arch/${ARCH}/Makefile \
+             include/uapi/asm-generic/Kbuild \
 "
 
 PERF_EXTRA_LDFLAGS = ""
@@ -208,7 +209,7 @@ python copy_perf_source_from_kernel() {
 do_configure:prepend () {
     # If building a multlib based perf, the incorrect library path will be
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
-    # build, with a 64 bit multilib, the arch won't match and the detection of a 
+    # build, with a 64 bit multilib, the arch won't match and the detection of a
     # 64 bit build (and library) are not exected. To ensure that libraries are
     # installed to the correct location, we can use the weak assignment in the
     # config/Makefile.

---
base-commit: ae97991a5c634d2ac0ea3bed29bb7aaa9d9b793f
change-id: 20250603-perf-arm64-unistd-9344a6fc96a7

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>



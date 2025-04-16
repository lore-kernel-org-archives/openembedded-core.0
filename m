Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6080C369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 13:37:34 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.108])
 by mx.groups.io with SMTP id smtpd.web10.19769.1744810643518283532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 06:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=sn+v1MWk;
 spf=pass (domain: phytec.de, ip: 40.107.22.108, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJZeuJ5n+VF28ju59qUzhnRgF67c0la4iXSIzsx+6FKDkTOxq+LCY/KgS45HW1eWT+uQctyftcuM2GseB6Gv00g00iAzny6VgNfxYgEYsjy5OFSWN48+y1riCp8o895nEgcg5SnBEXqxXH9DC6Kf12ozabRvIe66KG/tgh4X+2ANYOC56BV/K0RWl1MphghfzP5JeGh+5wJF6w1wJ1cyqp34zREOzLPHntWQZGKCqvjTi3EmwExGpDMHAtKxeqq8OpxJuoDdeVwLUlAIFgVQgXQHroclxmxjO6EhCwSPyCWaz06lEwKxr9QqcW38F3pWY8mCvVr864x2uvhLOrvJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2g2I2/ewocLW42a9cbc25sSRx8qd+FsNrf2FVprIyc=;
 b=GeyKOK/7N+pxmSpBpB8R6pAi5c0MT+D7u7xMHgEyTe8W4VfOP6gx/1v49y3iZsyUwnvdgGg9C+28FggVNT6IzHj2W1hTIIZuZvDlSaqMpzHFvf/DIzQ1Lx86KVMEQ9oTAUqaEL+rjVtma8UFDqrl/Assw3K5KP80EgL4ZwclIg3VjAAEO/UZX2TJRoh6iY/CLjOL9B2YutRbx6WfywqDAG/pOW3zxDDgLvGqr9lMyi7Cr7ky3H49O/ZfcHTHs7zS1tKRlKIfeHUMyFtFdke/86U4ZupAyKE1PfFOaS0u8j1qxSEsk/t7vXcJKhd/hRvKLZlSuBU3JladNkSayHOB0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2g2I2/ewocLW42a9cbc25sSRx8qd+FsNrf2FVprIyc=;
 b=sn+v1MWkBjGtOZs0tKvIRdT5ByUXS3bNkt6R4N+ot+DuuSBEKCOZc+4i+9mC0hPC75wzVm/z0Pldh7loQFsy9AWe2dIO6kDK0DUnpG7h4CPlFQdLJ6tEWG6h5GbCyK2G4IHpB/70cijKBMUFFO8IwHHMZQ4ejro6hh3081TuDQ+0vpShSt3DO08nkL5yU3bcKgBLmS4k+PahugJyYNmb4HyazJicGaS5bMQIR6nYcuMNFTu159aWdzvweGxLMv+jCqHHZO9NJtmMPVhWWEHgvH9LwN9sAxv2xTRvJJohx+/lfJmzAbk68PtQE/rFYRRuX6fLRtgM+tytmdiAMWse1Q==
Received: from CWLP123CA0013.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::25)
 by DB8P195MB0535.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:158::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 13:37:17 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:401:56:cafe::69) by CWLP123CA0013.outlook.office365.com
 (2603:10a6:401:56::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Wed,
 16 Apr 2025 13:37:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 13:37:03 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 16 Apr
 2025 15:37:00 +0200
Received: from llp-anderweit.phytec.de (172.25.32.131) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 16 Apr
 2025 15:37:00 +0200
From: Leonard Anderweit <l.anderweit@phytec.de>
Date: Wed, 16 Apr 2025 15:36:24 +0200
Subject: [PATCH] meta: classes-recipe: uki: Make initramfs optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250416-master-v1-1-be5e7309c5a8@phytec.de>
X-B4-Tracking: v=1; b=H4sIAFey/2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0Mz3dzE4pLUIl3TlETLVHOTJIu0ZCMloOKCotS0zAqwQdGxtbUA33y
 wHVgAAAA=
To: <openembedded-core@lists.openembedded.org>
CC: <upstream@lists.phytec.de>
X-Mailer: b4 0.13.0
X-Originating-IP: [172.25.32.131]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A792:EE_|DB8P195MB0535:EE_
X-MS-Office365-Filtering-Correlation-Id: d6adc194-17a2-4225-42d6-08dd7cebc5e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmVSTitkNTdKRXkwRk1EM1Q3Qm8yT2JLaTNIa2hQWktaTUc4SnN1V2IzY0pQ?=
 =?utf-8?B?b3ZKK09XSkVML0VNaWhZbDFsNnEzVUNER0JVZk5Rb256cUcvMnRuQlJoVHdt?=
 =?utf-8?B?VG1zV2N0bWxYVWxUMXdVaUF2SVlRM3JaSU5YaHdhcUkvV1RSZDFWNG9nV3hO?=
 =?utf-8?B?LzU2dUlSWHVMbStzZEhSRVpyc2N6ekhENnQ1Uko1TkdDUmdYdWFJNGl1aGJh?=
 =?utf-8?B?VnRWaG01c0RLWDMxcnBydHFGYnZMUTNtUXVvUWFsWEdBeHQ3SEs5ck9ybFgx?=
 =?utf-8?B?cTJrTVkzak84WXVEUmhpbS84TFordFJWRG9HaFBqcmVaRzBheXQ4czJvYU5J?=
 =?utf-8?B?RmFIUUNHWDdYbGVBdjhvMm1NUnA2UVBVcHNWSmtoWk0wcXBnekhiSC80Mndj?=
 =?utf-8?B?YnJxT0Q0VTN3VXRYdy9KOGttK1RWVXF1SmsyNkNZS2E0NGRQR2pqSmhZTGFj?=
 =?utf-8?B?a1F3ZndFS3NzZ0lDdk1pQjY4dm5VNkVuOVkrSjYrV0FPTjJSejZWWWU2d1FC?=
 =?utf-8?B?S0xZTTdwL0ZBdG5iZXQ4UmdKcThHK243ck9BUTVNN3JPelN0WDlhZlhtV3Fv?=
 =?utf-8?B?WFFwZllUQkZiQ1YvSVkxRkRlcXZrazhabVBsVEJyVWF4Q09mTnA4REZnN1Vv?=
 =?utf-8?B?NTVCZ1F5WmdWSXZkbGU2blQ2UTlaMHpYcnNOQXdHemVnQ3Y2aTZ1MFJkSTIy?=
 =?utf-8?B?eE5tbkdUUG5zbU5uYUM2Q1oxMWE3ekM3VzgzUE1IQUM1QzdmUkRCdWI2VWhU?=
 =?utf-8?B?dFp0aVd1alU3a1R0bmQzRmp0blByVTNFNk83R0piTHEwQXRwUGVUSCttdkVs?=
 =?utf-8?B?akNIbmt3S01QbjllZnE0THFzNE5sc21iQTV2cUR2NHRWejk2THRnWk5oTlA1?=
 =?utf-8?B?YWxXZUJrUU9rR1lPelFrZHNjTTBEZDRLWDVWSGZkNVhXT1BLelRIYU8vRDB4?=
 =?utf-8?B?N3ZMMmJWNzNRZkExYkt3REtxYndNb3VEZEZ6R1J3SmIyTCsyZkdaQnp2UE85?=
 =?utf-8?B?UlBEYVBzZHZKaDNmU2x5U3pxczVVOUVVREdTVHhHUTVQRnJ5alZ3VTdabGNs?=
 =?utf-8?B?Q1FOL1hWOSs4Y3c1WHVwN3RpQjNsdFBmVDNYSGtobDRnZkpmRU40cDZXdW0y?=
 =?utf-8?B?TW9sbmVuWE40TVFoZ3VEL1FzLyticmJ0M1ZLeFdnYVc4SHJ6aTFJcG0wYmUr?=
 =?utf-8?B?eFFZOTYvZElpZVpmR0llNGZMaG0zOGk2MFZSNkJ1aU82R2hweUVPMVFKRDZS?=
 =?utf-8?B?S3FobmZieVdhSHFyODFLa2pXcUdzYW9acU5XUGhZZ3J0czA2Ymx6cTRDdndZ?=
 =?utf-8?B?NlNlZ1V5OWVmd1FzTXdsamN2bGRWejdsSzc2bEQ4QUZ6OWk5K0FNQmVEMVAy?=
 =?utf-8?B?bWdIS1UvZjVTMHQveWZMNy8vSkh4S2xGd2IwTTZuTVpsaGdyOS9hdnVnakh1?=
 =?utf-8?B?aTFDNFlIVGtEWFplTzNad0ErdFRtU2sxR2w1VWhoL29wTWw0UHlHandKQm1L?=
 =?utf-8?B?QUE5Zk5zM1IyQXhSUi8vY01ZWGtydDdBUzBBektGYkFaekJRemswZzhIM2lJ?=
 =?utf-8?B?cVZuTGVESHZtRHcycElaL3c0clRxQStwSGlPaVBiMFQyNUpRN0FKbjhQUjhH?=
 =?utf-8?B?amJuWTdOZGM1Z2tCZEhGMlZUdzdySUFwWWlxQmlzc3FmUHNzM2ZxWDZ6N01w?=
 =?utf-8?B?M1R4NTNlTmZyWVR6ajBmaThaNWFBakpxMmxDQWZCTk4wVFF6dWgrRjN2S0pY?=
 =?utf-8?B?c1BCRWVuY3FJMjFiUVZ2Nll1Sjg1RXhzblRBTnloOXhncnYyK2FoK3RMelJu?=
 =?utf-8?B?d095WEN1UXROcjh5VFVDR1AxQU1WejJzWjNQZW45dUpySXhvT1BFVlhLR2lt?=
 =?utf-8?B?Z3dMVm45Q3lrVnRMcDNyU2xSOEJtWGplVm5HYXBCV2piZWt2ajNWeHQ1WTFG?=
 =?utf-8?B?WWcvNUErd1hQcFZTWjlHUnBETjZjSkZNQ3ZxQWduSXNMWkF1L3ppTlg5SXJU?=
 =?utf-8?B?SVZ2YUFFSEZRKytuSTdML0NIUG84b0lTSUhkakxSNnJqYkgzSXlJSzdMTHVD?=
 =?utf-8?Q?pbfb2C?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 13:37:03.4328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6adc194-17a2-4225-42d6-08dd7cebc5e2
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 13:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214990

Make it possible to build an uki without initramfs. The initramfs is now
optional and will only be included if INITRAMFS_IMAGE is set.

Additionally, remove do_image_complete dependency on
INITRAMFS_IMAGE:do_image_complete since do_uki already depends on that
and is executed first.

Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
---
 meta/classes-recipe/uki.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index d9a7fb0e6fe0..4db5f614b96f 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -75,8 +75,6 @@ INITRAMFS_IMAGE ?= "core-image-minimal-initramfs"
 
 INITRD_ARCHIVE ?= "${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}"
 
-do_image_complete[depends] += "${INITRAMFS_IMAGE}:do_image_complete"
-
 UKIFY_CMD ?= "ukify build"
 UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
 UKI_FILENAME ?= "uki.efi"
@@ -127,8 +125,9 @@ python do_uki() {
     ukify_cmd += " --stub %s" % (stub)
 
     # initrd
-    initramfs_image = "%s" % (d.getVar('INITRD_ARCHIVE'))
-    ukify_cmd += " --initrd=%s" % (os.path.join(deploy_dir_image, initramfs_image))
+    if d.getVar('INITRAMFS_IMAGE'):
+        initramfs_image = "%s" % (d.getVar('INITRD_ARCHIVE'))
+        ukify_cmd += " --initrd=%s" % (os.path.join(deploy_dir_image, initramfs_image))
 
     # kernel
     kernel_filename = d.getVar('UKI_KERNEL_FILENAME') or None

---
base-commit: 183e043de423fd3f7833366ca524a6f7d17e6d14
change-id: 20250416-master-5da9e74b8fc2

Best regards,
-- 
Leonard Anderweit <l.anderweit@phytec.de>



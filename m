Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A789C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 14:40:33 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.111])
 by mx.groups.io with SMTP id smtpd.web11.50932.1740062427617897124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 06:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector1 header.b=ZhVYE8u2;
 spf=pass (domain: phytec.de, ip: 40.107.22.111, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jigUfEwUof47k/hYQAZqpDTYxNgGz5uS+SKLpuuJ0KDOFglX+UYNlL9um9ijs/CBda0wSbahEVaR6Ak8T7kejzaI7OXYDmi/Mvptg5YYiKkcW/Nz46TH9+9/d97FJAELDWw2imYbuIfWD7ub+rZNpipiQjQo7wNdWIDOEqt6Cus5SRW50H4m3UKmQLgh/Z9qcqJhyxnshlJJiva9haK86ExSjR9B2CGRc/7xrI4Z5kx4lzynX97dJl9uHxM+sg+VZb/s+e3O6xYgetaxcHCSWN9C7MQeOEoCOC6KMbi2591aDLkASbyCk/bUxlKuPK8qcmNGWa+p4aQRIw197ajdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDdTRPUoWV1SHdTb6p0Vf2c3RolAQwt4Tat5tLSYGRs=;
 b=an4I+WtZl9tgh4qEap+WWDl8mvn+Ps53Y3IHdg8WOlTy9PB9E54ajgjnWgsC5iZrkvAkC80phs6nQt42bD2WA8q4qVUwSix3/wrTmJG5oTc7bkNsJlnCwseShyJc39t33jW/uJiaqRXQisg0ragc7rDHXZ2/lCMWtarIhtOdiqs4kKhS9OaYAk4cupyvOESqZlqwkZqyaJkavo4mskI+9Bad70UiHnj28kMgLoWrdYFCyH9OWkGDx/SpbL0ZAqGbGNwk9aV8tW5NEbEPgzh5urGDExj20zK/LbFgx4hOKKO8vAeo1RbQQSxzh4W6Hv4MwvQ/YGODZXn9b2JsVZdELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDdTRPUoWV1SHdTb6p0Vf2c3RolAQwt4Tat5tLSYGRs=;
 b=ZhVYE8u2UANdPZ+ILniEMu4u2rbpb2BjDFR+hIdcZt016+Y1I3KG3aHxBwuGyfu422hkGnf3gq1zI3aZ7ibxGBF0F9kj8YyRF0cf+xx8paCjpGJZQ/PcMwm7xLOW04bSwAI5D5p8xzPIlpCT1trVt3tKnrKU3UhWBMXcliWOOYxhqZ0YdNUbC5AJa8D63wTnen2KEBXMO07OrSZ/R6LSmb8sHnrvPIOSehyQtCFx3WR8lC1uPISKg+gXpNj3LYRCZ33pNe1aN+4W9/ea/eB3Whw9T4PcyKbWWEH5CRpznQPyOrvFQF1pozVT0AP8F+Mqv5ldlOYGSfsd6T14WKGBPQ==
Received: from AM8P189CA0007.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::12)
 by DB4P195MB1968.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:38e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 14:40:23 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::25) by AM8P189CA0007.outlook.office365.com
 (2603:10a6:20b:218::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.15 via Frontend Transport; Thu,
 20 Feb 2025 14:40:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 14:40:22 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 20 Feb
 2025 15:40:21 +0100
Received: from augenblix2.phytec.de (172.25.0.51) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 20 Feb
 2025 15:40:21 +0100
From: Leonard Anderweit <l.anderweit@phytec.de>
To: <openembedded-core@lists.openembedded.org>
CC: <upstream@lists.phytec.de>
Subject: [RFC] uboot-sign: Fix u-boot dtb signatures
Date: Thu, 20 Feb 2025 15:40:12 +0100
Message-ID: <20250220144012.27057-1-l.anderweit@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|DB4P195MB1968:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab31ae5-6a1c-4e52-a45f-08dd51bc813c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l1j7fVeb9szesYJfbdQ01srTw6c5nPCmnGFqc/gqKaF7XQ9GpMfHOTf5EVHN?=
 =?us-ascii?Q?vyLUht8Jsc5N92H7tzSqTEZKTIMeXYg6pBSMzdB8yhXgjcsPjoJIM0pb1EdU?=
 =?us-ascii?Q?q3t/OEQvGdVZqLoNOv228z5Z0LroJaKrmyRAXxvKWuscZOREzeuMk1CPQ3oe?=
 =?us-ascii?Q?uxek8hsGYVCMbn1nZJTKKXsWzcWnVNq3LgeLbKjrxq2oSq/LLzB/OXlAsaH+?=
 =?us-ascii?Q?qQ5HpRPM6Veen7Y1mqmZalNcRFP2I7F1XQ7sqU60X1bzYTX7OY+SrkWrjjO6?=
 =?us-ascii?Q?SqucJvzTZSBCeENxoHINZMAz+A8OFTW9IvRTki+pOMquW/zWG9a7zACYzFOO?=
 =?us-ascii?Q?Ctx81MT1hLA/5yYZC1sYw0ylAUQmskSfQPitQkhL/FFxanuLIzTv/ihQs+n+?=
 =?us-ascii?Q?pxvpPEDXDMwpoLqT0vbfLZrJ1Zi6zIAquGGrORD1tITJiGaPAN3MHAF1exC8?=
 =?us-ascii?Q?iNqJ+83X6WraNzeHGDFdf+DX8gJQLEm+zlUY/FfEIFVKuVrP5DhwAhrjYoY+?=
 =?us-ascii?Q?Al6xJc25swYzTlryrZBkPCHUN3ZF3cu/6bbljBhs9mAUE+VIYqWx6s4xINKo?=
 =?us-ascii?Q?xJ5d3nRUNInIF8FjEcft8NOKdlbxqbHIoPKzl562DBm/wuQM1bp3a3Bs1CZl?=
 =?us-ascii?Q?fQaafyA6CUmFrYjuQUE2wE2b5vbn6sODeabkx5r+7GwpkiWAeGIIJbIwPBmj?=
 =?us-ascii?Q?RdvUBpG2qcBksMfNQesTiNtEDTouOQwv7hjLRnA42JnaEb5hnR5p5iCu2IEx?=
 =?us-ascii?Q?GuCgvBnHFKZSUUZQm4Uww0V8ttSPZUzfp6VHEbdZwnQeDa8vdBQFJz9iOnNW?=
 =?us-ascii?Q?GqZN1/XHC6uxeUy3vyFpyZtixVdaQQUZ/TwjQ3Il8rwTLLe5AtSfiJlzxyR4?=
 =?us-ascii?Q?PXiY9u3F0Ufu/BhIGWTA3VPSRv9AO4mfeYdptSqAkLLzRTHG4mg4rqfNUkpg?=
 =?us-ascii?Q?H8/jIpshGYREFZWQ5VTjZRfHiTGxmgRO6tsjWKlBNUlL9OXhICssykiZX61Q?=
 =?us-ascii?Q?FR0id2hBur1Q5JDlmjtHWWim0fr6Xy8PS7semRC+taaEEyyiH0boHVRA9m7D?=
 =?us-ascii?Q?neB3OHHAX12XfL1yNydlnDPLa4SM8khkaffIRzXG6OVER+MnwHoFNmWAK+fN?=
 =?us-ascii?Q?qLiozJuGhqE/MzXU0Hwz9YuBuOfWmwA9B2rdNM165iphva16+WTJLAU/HLm/?=
 =?us-ascii?Q?o6HB7b/3WDK48TQ2rFh532QrcLpahHUNeZoUlmow2JgcVWFv4Q1euXi1V/N1?=
 =?us-ascii?Q?YdIuu8Fw880VJ6NqdDDYpsXxAtUa8xoboDVZuCFD8rAOSjNv4ODrTo4vrNOm?=
 =?us-ascii?Q?oNkL4yZ8HBb0g9AUCD3gggfyUHWLL/ReJKc2ofI3fZYfrqFtA8mvGtCWunVF?=
 =?us-ascii?Q?XNWHop0KqEkE1uQQXfloKk4A7Y52NorpLRoyPn5dmtAdhEsKocL55OlqGHPX?=
 =?us-ascii?Q?ouvCcxYjYDkVubqIsyDcb3MoBLuEy90zrtAPP/Cf5QqhWFMydk5DFmBYnH1L?=
 =?us-ascii?Q?8Zrw+pheOff+qT8=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 14:40:22.0102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab31ae5-6a1c-4e52-a45f-08dd51bc813c
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P195MB1968
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 14:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211761

With UBOOT_SIGN_ENABLE enabled commit 3fb215a3af24 (u-boot:
kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV
enabled) always adds the signature of UBOOT_SIGN_IMG_KEYNAME to the
u-boot dtb, independent of FIT_SIGN_INDIVIDUAL. The kernel fitimage
configuration node is signed with UBOOT_SIGN_KEYNAME but the u-boot dtb
contains the signature of UBOOT_SIGN_IMG_KEYNAME. U-boot is therefore
unable to verify the signed kernel fitimage.
Before that commit the signature of all keys used in the kernel fitimage
would be added to the u-boot dtb.

To fix this, always add the signature of UBOOT_SIGN_KEYNAME for
configuration nodes to the u-boot dtb. If FIT_SIGN_INDIVIDUAL is 1 also
add the signature of UBOOT_SIGN_IMG_KEYNAME for individual images.

This has one drawback at the moment: The signing of individual images is
not tested with fit_check_sign during concat_dtb.

Fixes: 3fb215a3af24 (u-boot: kernel-fitimage: Fix dependency loop if
UBOOT_SIGN_ENABLE and UBOOT_ENV enabled)
Reported-by: Rogerio Guerra Borin <rogerio.borin@toradex.com>
Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
---
Link to bug report:
https://lists.openembedded.org/g/openembedded-core/topic/111218371#msg21150=
7
---
 meta/classes-recipe/uboot-sign.bbclass | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index 96c47ab01651..b2fcb5a31546 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -102,26 +102,36 @@ concat_dtb() {
=20
 	if [ -e "${UBOOT_DTB_BINARY}" ]; then
 		# Re-sign the kernel in order to add the keys to our dtb
-		UBOOT_MKIMAGE_MODE=3D"auto-conf"
-		# Signing individual images is not recommended as that
-		# makes fitImage susceptible to mix-and-match attack.
-		if [ "${FIT_SIGN_INDIVIDUAL}" =3D "1" ] ; then
-			UBOOT_MKIMAGE_MODE=3D"auto"
-		fi
 		${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') e=
lse ''} \
-			-f $UBOOT_MKIMAGE_MODE \
+			-f auto-conf \
 			-k "${UBOOT_SIGN_KEYDIR}" \
 			-o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
-			-g "${UBOOT_SIGN_IMG_KEYNAME}" \
+			-g "${UBOOT_SIGN_KEYNAME}" \
 			-K "${UBOOT_DTB_BINARY}" \
 			-d /dev/null \
 			-r ${B}/unused.itb \
 			${UBOOT_MKIMAGE_SIGN_ARGS}
+
 		# Verify the kernel image and u-boot dtb
 		${UBOOT_FIT_CHECK_SIGN} \
 			-k "${UBOOT_DTB_BINARY}" \
 			-f ${B}/unused.itb
+
+		# Signing individual images is not recommended as that
+		# makes fitImage susceptible to mix-and-match attack.
+		if [ "${FIT_SIGN_INDIVIDUAL}" =3D "1" ] ; then
+			${UBOOT_MKIMAGE_SIGN} \
+				${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') =
else ''} \
+				-f auto \
+				-k "${UBOOT_SIGN_KEYDIR}" \
+				-o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
+				-g "${UBOOT_SIGN_IMG_KEYNAME}" \
+				-K "${UBOOT_DTB_BINARY}" \
+				-d /dev/null \
+				-r ${B}/unused.itb \
+				${UBOOT_MKIMAGE_SIGN_ARGS}
+		fi
 		cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
 	fi
=20
--=20
2.25.1



Return-Path: <heiko.thole@entwicklung.eq-3.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AD0C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 05:34:35 +0000 (UTC)
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (DEU01-FR2-obe.outbound.protection.outlook.com [40.107.135.96])
 by mx.groups.io with SMTP id smtpd.web10.14235.1713159271760150567
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Apr 2024 22:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: entwicklung.eq-3.de, ip: 40.107.135.96, mailfrom: heiko.thole@entwicklung.eq-3.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csZjNV+jh63Kxq7ywMj6a6TEZpHdRIGU6qr2M6YzojfIKBQzRohLA8HJ9h0N/D4VCdPb7MbjHZS7azfCaezyxqGbghK4IFVF2cAmIqEMXD0VFKrXnpPVzTnn4AllCiWGva5m6FbAUKwIGyffLv82f3WfB3gr3cqYXDdhRf/EMP/0Skgxj/1EPxxD7OMbyh4ANkii7oocGGwDo1rUhT1HrqrIF1UfycJ5/85Q4bx2vK1QiJwOX3rgsiiENMHzpqeJi3GeqCqG7HAVN4eeDh9k0d9h4Ss6mu6S3qikEElPVQdYFB/520upuUSDuBYWh2qaGQgyAS/6N3F1eRHLaLRMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5g7g9yMs8jNVWhJ7n0CIBalLql21BttUxgLWO+W3P0=;
 b=VuF7i696S0LTfiHZt8oXMuRBkERO3MoKVHMd5F/TY0t9fJFNuI3g4DeRcv1UHOswV2fn8WBcc9EuxYO9seeoxomt5PIj1yOSZRqutscGowFnloZ4jX589PA3jFg6x6RvMeKkNQvUHuhlJFD990lChfKaK0W5EBIWCj2Q6N26fvHQw/rf5/1celsE3fSefW/a5k+NyaociILuvBIJ0VisWgFcQTPuL6TAuhVTaqbGlhD5tipTqvqijANy9gpt8h0AUqvtJQjzMuom1+Z2Dj/M81A/AYK8Ji8Di0exMg217AlAS3RiG+Q2Y/iXq7D2bQZHWPosY5qm0Z3hRWVhRcKPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.7.137.154) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=entwicklung.eq-3.de; dmarc=bestguesspass action=none
 header.from=entwicklung.eq-3.de; dkim=none (message not signed); arc=none (0)
Received: from FR0P281CA0226.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:b2::19)
 by FR5P281MB3796.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.43; Mon, 15 Apr
 2024 05:34:28 +0000
Received: from FR3PEPF00000485.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2:cafe::25) by FR0P281CA0226.outlook.office365.com
 (2603:10a6:d10:b2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.17 via Frontend
 Transport; Mon, 15 Apr 2024 05:34:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.7.137.154)
 smtp.mailfrom=entwicklung.eq-3.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none
 header.from=entwicklung.eq-3.de;
Received-SPF: Pass (protection.outlook.com: domain of entwicklung.eq-3.de
 designates 217.7.137.154 as permitted sender)
 receiver=protection.outlook.com; client-ip=217.7.137.154;
 helo=smtp03.elv.lan; pr=C
Received: from smtp03.elv.lan (217.7.137.154) by
 FR3PEPF00000485.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Mon, 15 Apr 2024 05:34:28 +0000
Received: from terminals.elv.lan ([172.25.239.241] helo=EQ3-52304.elv.lan)
	by smtp03.elv.lan with esmtp (Exim 4.94.2)
	(envelope-from <heiko.thole@entwicklung.eq-3.de>)
	id 1rwEz5-009C10-OC; Mon, 15 Apr 2024 07:34:27 +0200
From: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
To: openembedded-core@lists.openembedded.org
Cc: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
Subject: [PATCH] kernel.bbclass: check, if directory exists before removing empty module directory
Date: Mon, 15 Apr 2024 07:34:22 +0200
Message-ID: <20240415053422.22652-1-heiko.thole@entwicklung.eq-3.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR3PEPF00000485:EE_|FR5P281MB3796:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a2809aad-e0b1-4364-42e3-08dc5d0db81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZWJGYOTmkJm1KnZlLxXNJZT8cnOQmHGZI3R8M64WnhsODJ4bpcdXpNbUmZ/r?=
 =?us-ascii?Q?/lKvCTC22lZfUrHM2H8Wft48CpGpl6KLKZwviqdIA+1HljRfYFHWBnIukW7Z?=
 =?us-ascii?Q?HemqHmZGXIay8gY4lI/IEx1ru0xT42XvoWwU8fR4OnnpL1DZuPOboJNEfbm0?=
 =?us-ascii?Q?9Ru9fBF90vy6ikTIZl2xgynfWv7JV/Ho2M8Dju8S7E7n0JmdOxowMwd7bG1W?=
 =?us-ascii?Q?FNp7eVFK6zLytnW4ThUHt0OQtD4ii8ISAr32q6hqq864V6akirLjuL6SMgWp?=
 =?us-ascii?Q?eXVOTgmXcGmM9e6A5aOPFPFxMX9ewizNBW+ZGxmNfNVsk20jWYxba8WbeWA/?=
 =?us-ascii?Q?6rjGSjzaGnLKY1zgGdq/E+qBTUc8WxWOEqcsQG9HtbqBOIA2l7NPsWUpQqDh?=
 =?us-ascii?Q?kXzZtNcGMKx1y9SKRTsmNboVNCMBm3Bm2soOaALV9gmD2JrwhNNoMh2+aKtQ?=
 =?us-ascii?Q?6oQ4lTIE3HZgJVzW3DLDhoGiyF3sCDWn8B0b95RUnHAPKT2imoUJNDJcuI4o?=
 =?us-ascii?Q?cz82XI83jz7ti/d4u/VBtmePzKxXg9Psdh7rrFR0gb/hXJiW8RoKWOg713FI?=
 =?us-ascii?Q?NdV0urL4pG1oj/CkAr+f56RdsuD+Vu6bmTIs3CnXJiwtLwbzbSra0mgALmgx?=
 =?us-ascii?Q?DENZFrpNmvqjl45UCIWpHZR7Ud9GvQg/K+mNIsa4WBxfopA5CIu1TIUzbY8q?=
 =?us-ascii?Q?J2b2XirFBX0W8uCm3iVOnEfrUHyUAlmQygst+stm1T/3u9wHMIBNuc6fZOIe?=
 =?us-ascii?Q?ZLcAZizoUZZhC0NiY0jGKeNr23hgAzMiETvQHcKAcmMmgIpkinj/XGK3Zp+c?=
 =?us-ascii?Q?ClkbhAwt5C9sizC43k3nUGkBibivIofgVRoUHD60JhamxYEK4aH1q65QSq7s?=
 =?us-ascii?Q?LNeOv48l+TwYohyRbTNQp8cWLDWrF2jc6goEvtvDrVlHXrNv6XNAZwAJwBZK?=
 =?us-ascii?Q?IqlqSXPMa8iUjHtXGDv40ZDK6yXa+comFDIQ41So2X3pVUIXfy65yYt0X8Sx?=
 =?us-ascii?Q?exJrk1t9fhGq2Q6kBKXNWG/mo13/Oj24+JbbpmS+vPm/pFf3aZa8QHIm1E2J?=
 =?us-ascii?Q?K5wkKwgrstyvUS+Wh2IctTGFa8zRQX1EwH2BgyeZrckrhe0U/52Zp/Bpzk/Q?=
 =?us-ascii?Q?1eIZRV/NEGa/Cu6Q0tizmEUc/h0N4VoqWH2cVnjEoTs0oRhazjbZnw91UxCX?=
 =?us-ascii?Q?BewylmeP8iUPXDLWjRaVvStSYybaXX64uZ4PB0cDTi/uqkdf+a2C0r2Vtmmh?=
 =?us-ascii?Q?uPqTUFLOBR+RAtqC8G846l78njH8mQoRX7/fFkENV/AIRPP9gsMyYycCGy+U?=
 =?us-ascii?Q?egb2zlXEsPFDhw+Nf8Gxf+cQCnkkfoHAHr5gHR192xEKi55h5rYxXN0Pcue6?=
 =?us-ascii?Q?Lmgia8hN8ZzgCepPhsmn879kqqpx?=
X-Forefront-Antispam-Report: 
	CIP:217.7.137.154;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp03.elv.lan;PTR:thor.elv.de;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1102;
X-OriginatorOrg: entwicklung.eq-3.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 05:34:28.4520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2809aad-e0b1-4364-42e3-08dc5d0db81b
X-MS-Exchange-CrossTenant-Id: 6bb70bfd-56fb-4f95-99c8-16d0dd9d5592
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6bb70bfd-56fb-4f95-99c8-16d0dd9d5592;Ip=[217.7.137.154];Helo=[smtp03.elv.lan]
X-MS-Exchange-CrossTenant-AuthSource: FR3PEPF00000485.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB3796
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 05:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198216

If the kernel folder does not exist, find will result in an error.
This can occur if the kernel has no modules but, for example, custom module=
s are created.

Add check before deleting.

Signed-off-by: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
index b084d6d..c0a2056 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -463,7 +463,7 @@ kernel_do_install() {
                rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}=
/build"
                rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}=
/source"
                # Remove empty module directories to prevent QA issues
-               find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/=
kernel" -type d -empty -delete
+               [ -d "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/=
kernel" ] && find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/ker=
nel" -type d -empty -delete
        else
                bbnote "no modules to install"
        fi
--
2.41.0

eQ-3 Entwicklung GmbH, Maiburger Str. 36, 26789 Leer
Gesch=E4ftsf=FChrer: Prof. Heinz-G. Redeker
Registergericht: Amtsgericht Aurich, HRB 110388
eQ-3 AG, Maiburger Str. 29, 26789 Leer
Vorstand: Prof. Heinz-G. Redeker (Vorsitzender), Helga Redeker
Vorsitzende des Aufsichtsrats: Irmgard Keplin
Registergericht: Amtsgericht Aurich, HRB 200335


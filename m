Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0512C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 09:37:23 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.90])
 by mx.groups.io with SMTP id smtpd.web10.18044.1709631441224144785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 01:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=oRn7NKyr;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.90, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JupFfP0ATOB4f7wZZpFqHVcTN347tmjKr+FdcnICoNXSWGjmCCRZ3yH45WIJiex0yCyOpq6QPdATiTXb5pMSVrunKUXbjMs+Cg1BaMy+Z5GUJnYxjcqaAh7JoxhzIDRVTEhjTA9mwp2bgf7YPtfsSkHwIGJ+oBN7IbM8eXBqqsYr4Zzbu+8QzYCX4hGsCWYS9OHxVgC08JRmwCJCQp3v/88hOHWL0I5RlXFD3ZgGzwR3aIL9xxqOdtARfd4/ob1KEt3KgXj2zjkQTA04XUeOkhifiHChOXtltaU7KGGmkZON654elhaagUzWLLoMB8UbWlZPU6IxWuMuOa5S0TkDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vu75LLF8PA/+FS/HpVFvSK7JnBNB4HPmIZ7CGcDI98w=;
 b=XO7N/wSQ6yt4SPXjkLPK6xcwuwK4rQvN3mWMBSEss8aIhCfyQ3SjjwQh/3+toYgdorfcV8h+9pC1dSmF0ZC1N09Eh9kw0pf9n8HwZ3CJWqeKOG3Jl10YswFhH4Dt0PBZqptF1IoENMHdjUZQNcoEw7PlCgo6un9o62xBjVmxgvj0qv2OZVwWkr2k+6rUHNEvymgWiM6bBqaKtSJvPYiDVZHJyf4PP/NtJcTymWLd7fWOVfQbUcDdpm/Iyxsxk/qKNqIhZc32W6YuqXRN7lfEHShDhXXRoOLnl8Jb2JbcsUMiged6S68jG34mvEobSBJ30mLlJ9OTRUw35e7vMOiTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vu75LLF8PA/+FS/HpVFvSK7JnBNB4HPmIZ7CGcDI98w=;
 b=oRn7NKyrxk5JyD/QKHv/Rn4vzhIe52HwgJooUYmZyfyfqBFq5YRnH0ULL2AlS8KBlymkVdzPT5V2CE1rstQLdCos8dX+8JvQlWPzEYg+SKf9LPk2scDmCFeoyJaZCK/qDANHVsn7SLou63CBWBkohQrePiLklWbKQ6x5vl2u3mM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com (2603:10a6:20b:578::22)
 by DU0PR08MB8139.eurprd08.prod.outlook.com (2603:10a6:10:3ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 09:37:17 +0000
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f]) by AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 09:37:17 +0000
From: christian.taedcke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: [OE-core] kernel-fitImage: only include valid compatible line
Date: Tue,  5 Mar 2024 10:36:29 +0100
Message-ID: <20240305093628.1094525-1-christian.taedcke-oss@weidmueller.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To AS2PR08MB9199.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB9199:EE_|DU0PR08MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c2131b-4181-4025-add4-08dc3cf7d8d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EgkPCI0IUfvrmHiQLqKwtYoh5QmXKwP2SJDleR7AWVw/HLwTMC91yri9i3P6zY6OI+cxDlIL6CHHt7S83UOsHXUwCtV+0avszsaTzCOTzKI8UmhATw3Pa11ie5p+S5tjJ1IKLsnvCLS9ExTqUGvd8IJ7yNvmPGP5diBXLkZRLZhCaQ8Era8vKAyFVFbrYKHbgBiV0bNd7av5rhDGn35bLJGUwVkNLzniEEpr64T+Ih2OXSoUFTEGNnvn2QuRto+/Q1LBkB/6ueFC6hpsYz1M7sOUjsfneNT2NjnIX93drEJJ3Xv5gBZ/Hlzkn5T1qu9ay8ElM9AVU/2d3P/S5kuYqlkJz94Q3D/iWfd12fsYUw6NchJJeIqypfMPE4FMZYVCVGSLtkzZdK7ZeasBVX815XX3MhrKhBtA4qhGPpLo9a+LUkbWJS9vTwiFxeNV9OeU8JAQTmw5MYxP/igexZO/+zzA2tBH/AINJVjQrQGH91NDbv96jbCibwMVFwEWBQiT09thEvJxXHp7UPflTlgcsUwsg9wDLIKv37D7SVWZ2ImdWJAp0oIBrfU/uJXBgPEkqqQh+ICVr0D276T7PhvUOlEaqnpkphdnebh2d/+vmz5Ot11hYlcWZN7jMsIsuiLhZHPFDBL4KGpKXOdwGfSaLotaIwinFesbX8Awb5Xu9C99d8n5T97P5HQcjLmmp28+RlHh2j/Zzxjxa+bMQYa1jFp+JlplI0ZD6zRWkqZSA+w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9199.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zbcl0lxe1yf1M/gVZRuJ6mzNkHeku6e7nWLVj+W5it+RYQjlKVWfVDPSZhyF?=
 =?us-ascii?Q?WuBFuU93uOtGk3LaUyyzTkipVDGDSz3sfhFAQHIw1xY6XWc8uDZa+h5BIozx?=
 =?us-ascii?Q?scLJZM99gonO+lEkg2HcnKH45EnZCOCLnMYsFpZoTdggR55UkBUm8F4a+Sxd?=
 =?us-ascii?Q?/aIJjZh6JjEmF3x1GSe81es6p6jAAe4Bn/yWJLZFMePR8yrA2lgOZfRiWRd8?=
 =?us-ascii?Q?Y0SMH8aIQ49+QOQucL5I1cWvKQqt5lRixfuEcxDZ0++C6FENH8LLmCtwOZTT?=
 =?us-ascii?Q?2CqTahhwRlMclP++rfsb+7tclojaFYrWHMPZmg0h42YnTINIxdNm5C6T9E4p?=
 =?us-ascii?Q?I5yhcYyk++Xwkev1jr6oTEECjEdJx7l8LDQDG2oWAJtSbv91SsVppj24S2zm?=
 =?us-ascii?Q?X3WYNbamQIygjj11mpnaTCPIlb9gSFgE76QuzK9tLh55zxAInwxtqnk+ebQM?=
 =?us-ascii?Q?+um0fZlVtJPEBJIc5cZPzLp8EgqBc0XYYSdFqH877XP92190/6qb+Qre2De2?=
 =?us-ascii?Q?PBow639aONFBagezCelOWY/vOaVfkTV5dpZBTT91yySOzFJ/L8aGNkdLEdkD?=
 =?us-ascii?Q?Qqw4Op8My0UKKGboorr3u/1VvsKq8i1NC/f7kh7uhR+SVrFFQLcy/vccezAY?=
 =?us-ascii?Q?y9rmJw1RKvFhAIm9P5fGCCtX3vgnzxqheDXw/Ov4aqQ26OrUJSA+nmgjY++f?=
 =?us-ascii?Q?2eele6DC2y+74ONJMh4FTCaRps2mED3LfgbriATTFaHLhqRjhBJimeY3rtMD?=
 =?us-ascii?Q?h5ceRBEMraljB368+JqcZys7DjZNX2XzSYk6ZJmkKcx4wkBYGdppuRrJ370F?=
 =?us-ascii?Q?YwYgd7yzChclRey5Uq5fodDT2di9BtR8I0rkGHPEPiJMjyrF27h1iVZIF40a?=
 =?us-ascii?Q?EH8yAevx2p7Oj/THLFyNr11RDeIFT1jRZ8wCBDoDUi63YhWlYJc/Jm/Ovm9m?=
 =?us-ascii?Q?h7IZL+IwoWlgBPsoX14vFM13jqNcVqELwVjJuuUSKzpyczk7pTSOgPSAa/ID?=
 =?us-ascii?Q?DS7ur7ikvADPXdQAQVmy9So1tYf3nhm0uGAU2rV1G0NNXAYr3ux9C4KT1jYI?=
 =?us-ascii?Q?ra7EJK6YG3kKy4kyWwTBvU9DCgJXkP425XDSl1mV71b9NPXO57yaTkDGxvzT?=
 =?us-ascii?Q?LcYG0bH7pHUvYvjhSL6os3v7RvEKcwIPA0KutzNxQqI1O8CqtZmjH8gdRLxW?=
 =?us-ascii?Q?TG30caPLU435BXNdi/m1UGIUxNgnauGdo8GPQjvygF6AgUjqXZPRXQC7U1az?=
 =?us-ascii?Q?DGCz8xh9mJ5gJYBQ6vlPTM6ONSBgPdJ61wEY6720Fbw7yeQBCun0Y/vTjxkG?=
 =?us-ascii?Q?lMBaNKDCBdlqYIxRKXHqHnpA7o3PzbMap8uK6r/GvL1utIJYSCJqGVW05+L/?=
 =?us-ascii?Q?JIkFUybWWvj5+5ZtxgZ18VtmAFaTpbnQOF1NNaaKN+LueAzdXp/sbazMdb2r?=
 =?us-ascii?Q?J9lVZ3Jc/sKgWQZ7Sf/OUoIyn9aDoPWd5McjHsDwfjFOk9IzH8vK1kZ/HpZA?=
 =?us-ascii?Q?Tpx780JaQPmOfrO3o+aGlyDyaNvlukd0eMxDdpLZSLszxr0KZSQc/5tCFqr/?=
 =?us-ascii?Q?y9lH0cYz2V/1sPYgMGu2pNLkdfFyCpE0YdxYI73JiEM7g6jOFmbpdpvfZznN?=
 =?us-ascii?Q?dqXWha7jeE7rVBWil8jdDjCFojNXdSg6uyame4SbYLf2?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c2131b-4181-4025-add4-08dc3cf7d8d9
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB9199.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 09:37:17.3648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqxLjOSOWMYybwHhwfMyyR32TXml+n1JBrkT8Fr3/07b9fP1ZlB+FiZPcvwJZxKo6SRcaMzCM8x0SjpQYHR9nzxo3Ya2cT6I0HAOyjo/Hx22OyctHKZgI8MJyDAA+Gsu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 09:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196628

From: Christian Taedcke <christian.taedcke@weidmueller.com>

Without this commit the configuration node includes the compatible
line 'compatible =3D [00];' if EXTERNAL_KERNEL_DEVICETREE is not
defined, i.e. if PREFERRED_PROVIDER_virtual/dtb is not used.
This prevents u-boot from using this configuration and it prints the
message "Could not find configuration node".

The functionality to add the compatible line was added in commit
f4c82fb6da89 ("kernel-fitImage: add machine compatible to config
section").

Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 7e30a5d47e..31e34716d5 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -421,6 +421,7 @@ fitimage_emit_section_config() {
 	bootscr_line=3D""
 	setup_line=3D""
 	default_line=3D""
+	compatible_line=3D""
=20
 	dtb_image_sect=3D$(symlink_points_below $dtb_image "${EXTERNAL_KERNEL_DEV=
ICETREE}")
 	if [ -z "$dtb_image_sect" ]; then
@@ -428,7 +429,9 @@ fitimage_emit_section_config() {
 	fi
=20
 	dtb_path=3D"${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
-	compatible_line=3D"compatible =3D \"$(fdtget "$dtb_path" / compatible | s=
ed 's/ /", "/g')\";"
+	if [ -e "$dtb_path" ]; then
+		compatible_line=3D"compatible =3D \"$(fdtget "$dtb_path" / compatible | =
sed 's/ /", "/g')\";"
+	fi
=20
 	dtb_image=3D$(echo $dtb_image | tr '/' '_')
 	dtb_image_sect=3D$(echo "${dtb_image_sect}" | tr '/' '_')
--=20
2.34.1



Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2833C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:43:02 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.121])
 by mx.groups.io with SMTP id smtpd.web10.17093.1709743379309117778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=EXOK788P;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.121, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLPZG6wRPrF3hNjELHk1KVV+kDIJioJR5aBcOapgxBuwKLXb/q/Nv5uWCZzqUPL0JnFDBD+UkUpKV9ss5aE5vbslvcut1KUiZSxTghHRCNs7xuqaHGXsBGeiCrXjMWHTdN1zgHfBGn38k49sdoU08YOam8BEGzUmqvFGyCPFq7qXrX8WJsASOHnFSurZfuC8H8jCcGXzFKRhlZMzVkQlf8Zb2jQuhaUO/XwxzPkgCv1Utt7laLgMkrdEPyqxp8QrhHDX7tpKXtFWuQScBXS5LmkPJBUsID5SwrjHJwntIh5JCXWyvoKSGojlXbRZXfkbpCngKmS2NFFBnCFDEP5GHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2SDf+XpqefEUSez/81/Wuqe7QWHHtN3E1iW6VR7fVY=;
 b=Ai9Ip5iHtjYhIaOJVvya/d3yJwrI3t4pHAGLkdBy8EZWoL890vSJlOoDPzy51gu8//fkeKI+T+zyrbfzaNWi1nBHG+4BbPVBe3BEjkd0SPAtOfX80fwDyuevwcK06edu6T5+TCvHGFR3wpNOa1S+fnuxDsF6KI1A8qM5OpMT+6LIZXGi1nK75dik0JzZ8tuXNQA350U+bbzJcfEfRqzmqNaEvtAUHVxCHA+zF531MsZOzdwJw9kKTbJpN1BSdtZXzrn0+caQt2DnR/4Tmti2QHpSKrWSLuUho2FviVk9/P/2ULdWIus0SNn7ObnqGp+c7PmIjgOcEZZaGdihQ9Yu2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2SDf+XpqefEUSez/81/Wuqe7QWHHtN3E1iW6VR7fVY=;
 b=EXOK788Psv2tAVi7uslr/pF2lPtvqQ5E27fHcrSwAKzKfUOGLfiAQcRYk5Tz3BTYd7J4lXBmIVgvE7ukJHkaHVtxxyVxHIMxLLs203dz5xsnzccG0Lj8P8CdXihOeAMXVIB5j/4yllEJD7933lwnpVu4ILu0dbe9iimCK2dPhrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com (2603:10a6:20b:578::22)
 by GV2PR08MB9158.eurprd08.prod.outlook.com (2603:10a6:150:d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 16:42:56 +0000
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f]) by AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f%7]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 16:42:55 +0000
From: christian.taedcke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: a.fatoum@pengutronix.de,
	denis.osterland@diehl.com,
	Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: [OE-core][PATCH v2] kernel-fitImage: only include valid compatible line
Date: Wed,  6 Mar 2024 17:42:15 +0100
Message-ID: <20240306164214.445656-1-christian.taedcke-oss@weidmueller.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305093628.1094525-1-christian.taedcke-oss@weidmueller.com>
References: <20240305093628.1094525-1-christian.taedcke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::17) To AS2PR08MB9199.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB9199:EE_|GV2PR08MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 03bc2381-7697-4e43-7437-08dc3dfc7970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5qPsc3PsPiwf0OrDqhZrV2MnPWiVwxoCcu3k97Q74XlChgou3RbSAtE2SzXVuyy9nIJPsxX9v7LDAibTeKOnldY4LJh5TbA3cntuInnVl6d/IWA4J6pU7uooPBAbA8tixlK9oCyDBH+7WKya+NyTFKajk/qlIcPU4SFl3ev13/j+Po9cbgxCKma0cQMX3cJDiZSHkaEhYCV0ZbjkKrcvYpLTTRi3B+R3OrPb+Udx0RTurPTTqg7pMPbiJq97jvE+2kQgPb0qAOwIzb1YVrNRsddBL/0U8l1N+pGOGWzJkYZyWN3XuAYulvor4Q5eALKidJPP7pd+j6l6FA6IvhOiRrDrioZe7knuLZ3ptYJjGyhaPA5WFPxHmUQ/9v88j1o4jXPQvrJUuhlrqiZw/vuc/c1mFzrlW1VeoIFIiaBmTuYVdjXMybEkkhr3Cpo77mG0mjNUvOFyPSf7ECn6J1wi5JUqk/kbtn/gJVa3THn2oQRl4YinvzkFuT+9vEktVScsZX+DltBbNcOjJxFRpRP0NMFoi56zggpjgZ46Vw2ZhsQwqeh4SESIf1Nw8ToDojd6jdw6s4KIna5o29GTYtuzQugCK0JyQRav8LSPChoXe6ptemcGPldMFUkkwKngBYsao9zRUIQj0ATRA9kdNl5r9GgcDHxIK8tF1NXttKJQsp7GFaczUUIk2JdDhMJy2+BXltZA1Klnq7OYeMdfTrvqEc35QHlCf0m944ly9SpsIRY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9199.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EHLnn/Bgt3qqNX1e/PL8xnK6DTgLcHJcpLf7MVBpaEA4PMH9CPEZKMdf68SF?=
 =?us-ascii?Q?5NEs/W4tMVALBT30OlHgK4urF+zmC1dqt2EL3ru3vKbmaAQnkGQEUQ9DUe0t?=
 =?us-ascii?Q?6TcahQ0emwYPEGAk5ZeHcmlBtfS1mEedYivQahGEUF0KkRLl/WEI1xAl10e0?=
 =?us-ascii?Q?oNAFTpFparhd6flo/DSpvdCk7y3kdZc08YUxo9fnpWp7J6JLjk6QulG6Hul5?=
 =?us-ascii?Q?AThqe8IxulfOv4xidrhaKQLlgpX7ewYjmIgXri1e5jZ3qZpNB2j2TxfCXhaf?=
 =?us-ascii?Q?4bc6PG0YcMwiu+ch7c6X1tfPtyjSmXzTnatA1MnGh6vgR7cjuiAFvovlzKI+?=
 =?us-ascii?Q?Un9XprJ4R265kl/PsFfG29SD4Wo03QbHQGSPK/ZMFrriW3fHHhOrdpPuydEh?=
 =?us-ascii?Q?Ok5RrWkoG3B+lSe0Qrb+yycv04kbTuv/qR7ERMRXqo350zgcko2cwWYX79PX?=
 =?us-ascii?Q?uZTDKbgIwd8nPNOzGXZcAP8jWfyFNNrLxG3fwLX0Oy8jL9CzOn4M1Rzsj881?=
 =?us-ascii?Q?CI2uEbRZCuqCxWgJ0Zv71qhL588lD8taBSVEN1RFCbeoluf/sMrkj22d5R0x?=
 =?us-ascii?Q?RqUZI2DCLPeLfeGJ/ZVNk78fR9DwufDdOHFHAnMy6/L3PAlN7bg7L/RRDlOf?=
 =?us-ascii?Q?gHt/j3L4FUh6agcMmcA/ZxDFlMqxOTSAfNXGcpigFeSYe/tybnP5NLgjfWj0?=
 =?us-ascii?Q?VPyunBBtT/nfIJsfsOLvPsk/17+2lUss0E56T8UHl7htqOQi1rme1RV15F0F?=
 =?us-ascii?Q?s52zq7rwoPrZ/wF6p9KUzyV1ip1dpRJY8jf+VWM0YdecJ+dw1uLrj7VNVc+E?=
 =?us-ascii?Q?LNUj8mJ0SfcCC/QOYedEJXqcj+WvOh44gppdjBrOktYCNwNcZ8jGo9AeUUqD?=
 =?us-ascii?Q?Hj6f1TvzekL2/aDRg7h9Vv3Aj7OTFgN158SmnWaNiyBJImWDIwpy0FY1f5s5?=
 =?us-ascii?Q?No74z4q8W3lrs1ssaaDdJa8oXX7y1PEo6k2ksqj4/uweSKN+ovkyMdtXdppJ?=
 =?us-ascii?Q?4ds/FAO+bOBL2kZE4N2GUGEHT0vuCseHcuqmPRS8pslmQb8kMSN130tWUxLa?=
 =?us-ascii?Q?yXcDQ1UjdvV6221Rukh+dwf35lF1R2daAvpfOrizkN2Rh7a3N+q40AZ3kfEx?=
 =?us-ascii?Q?4389/2c7NkivmfnLHpKJ3aR8QSDlMVpMBufPdi6jYTLLCfrbAZrGYQgZtGiQ?=
 =?us-ascii?Q?elw8ebl40Uh+a+cIqdPN/oaDtCGhAQWnuXO+zsmCjvoDdRd5ByYR8dgUgfQI?=
 =?us-ascii?Q?+R/mb7JhwmRwBqT9Lt4zq7nd3lApLMl9KAibkiqx6t8vHlzH5WyjW/rIlfdh?=
 =?us-ascii?Q?ZceILouKY3ERl6hIHMFaT//u+56gk9Ei4z3FtGiwWPB70zoq0HUezNLnQ26B?=
 =?us-ascii?Q?Feek3Lwdiyp5lcPMCU5PogtuSJuBtRon11Tpqe4bGkDR7IgSX3I4C026u6vK?=
 =?us-ascii?Q?PJiID5XWBmp8GLng20E9Ch0CRsvx/T8VmBHP/DjSdbqlBTKolU4X+5rTwWIk?=
 =?us-ascii?Q?NVFf1DuTEJyLNZQWlUT44f4ZR2UuzvYZ44T4gjvvSoyElO5LrU1xS6QaFue/?=
 =?us-ascii?Q?zJC4zXIksDpRs+Vj9JzWsi36e3OVUdXDSDPvqOZJrpSZmbU+2zN/0yfbpCDm?=
 =?us-ascii?Q?HnEU5juWGj+c8+QdDryRIh8sqy7GViPu5adCSDs8G7M3?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bc2381-7697-4e43-7437-08dc3dfc7970
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB9199.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 16:42:55.9273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5aaISqIW4PMDg9E5Q6QiDEbFtsIuydsmwmQgTmpCRgr/nVLqeHOR5sQtUaTvQoaDfR9aD3zq7U+c1ezj83k8ekvnSsWzkAhUKHSznXXNCXKQNCJYNaFX6vXPP0LghkK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9158
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 16:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196746

From: Christian Taedcke <christian.taedcke@weidmueller.com>

Without this commit the configuration node includes the compatible
line 'compatible =3D [00];' if EXTERNAL_KERNEL_DEVICETREE is not
defined, i.e. if PREFERRED_PROVIDER_virtual/dtb is not used.
This prevents u-boot from using this configuration and it prints the
message "Could not find configuration node".

An additional check also ensures that the written compatible line
never contains an empty compatible.

The functionality to add the compatible line was added in commit
f4c82fb6da89 ("kernel-fitImage: add machine compatible to config
section").

Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 7e30a5d47e..4b74ddc201 100644
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
@@ -428,7 +429,12 @@ fitimage_emit_section_config() {
 	fi
=20
 	dtb_path=3D"${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
-	compatible_line=3D"compatible =3D \"$(fdtget "$dtb_path" / compatible | s=
ed 's/ /", "/g')\";"
+	if [ -e "$dtb_path" ]; then
+		compat=3D$(fdtget -t s "$dtb_path" / compatible | sed 's/ /", "/g')
+		if [ -n "$compat" ]; then
+			compatible_line=3D"compatible =3D \"$compat\";"
+		fi
+	fi
=20
 	dtb_image=3D$(echo $dtb_image | tr '/' '_')
 	dtb_image_sect=3D$(echo "${dtb_image_sect}" | tr '/' '_')
--=20
2.34.1



Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF9BC982CD
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:00:18 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33648.1789627998563353354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 23:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=zm4D8vA2;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.51, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNPHyHZTo2xyNOAmIVV0yuJxzYCs1KudbR/aI8Cjd64P/QTyDbNzR/jvCgc+ByUh6Qvcfy6JbUopHf5T74yJwt9EBsajNsjV0JIfvhZAca27jxPaoNFP4BwmkGRtoe8m0K5zGZ9QoGUXlJsoPT9aLrblkfH4x5m5dg0juhX1ahqLgkx77CaRe57UoCJHktvDnTuk90qVaP7LBBSThsjWVkVB22YZryK00bbbRhiudLpoqZjrkwjQxC0nkHggyLiZaR28U/jsvnt2rV446K8NCjCd6zV4FwiJgmNUQUOnfUGv7kK3yicDrRghmbGVvVYqkteeI/e7KXCbMCRk7Ek33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffBxrIzQnRYbQ3uedtBKCQHEQqRsF+Yn+c9zJ61gyWQ=;
 b=pOBQ3UHdVfxxWf2nCAeMMTaRvAQPJIz/FwA8d+zTUdg8RxEaVMH7JdKGJGYm0Pon3pHh5PeSyGw20lbz4dlXjDxgKJbeORTUJ3HouwkPvwQqeBQ4xgG8B4tzSPCazOynEMC2pckKqpXR6YHwMf/Z/2fVktiSTu7ap6JWNJN8o0igNXR4rW0FSFq9lOMOw8/4YAkUGzPish5BAncxNkM8yNuXRIwIDQ6lpt81hPrqHhTJ2rnyTkQY/phIFAJ1dcuxp/UN1iPQFohWsoLonQ7C21J9qL8nM/H3/uFLQA3f734UU1IN5xh5jLfYSyhOYuixBC+1TxrVu8A0ge+GLMq31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffBxrIzQnRYbQ3uedtBKCQHEQqRsF+Yn+c9zJ61gyWQ=;
 b=zm4D8vA2IOPDcA2EQNsMdtXPVPvGkUuANY0bxLt2/Gf3i2hqdKkqn6v7mSciSBh1PxGc3AbSLAwxNiS5XuFF/3yfGe357f/2Ca3Zo2c7HFi7rmRwSnMFiO1IStt2cZTV2ilFNxIhZjPCWhm7WwLDV1McaFF+BLmqP0Po2Y4k/X2N5vDOXR+B7fj3idy+YrxTL084yjjB29fN2uyHzeFPh85f5x5QEIufk+3tPaZXd8oz8j7czG9M7+Stdz9k4+E6xeaDcmOGfpEt20bZBD1BHy6tGkEtD4Bk8l3ygh5PHlSfFw6dlJS5UQ73GfcmfLf63u9hieyu3jEsMeFWWycjzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::156)
 by MAUP287MB4908.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 06:38:35 +0000
Received: from PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 ([fe80::a44:7591:bce5:fd12]) by PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 ([fe80::a44:7591:bce5:fd12%4]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 06:38:35 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [oe-core][wrynose][PATCH] libgcrypt: Update license for dbg package
Date: Thu, 17 Sep 2026 12:08:26 +0530
Message-ID: <20260917063826.1037229-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN5P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:262::15) To PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::156)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PPFE40D44641:EE_|MAUP287MB4908:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a15d625-8e6b-47f7-1b9c-08df14864c74
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|52116014|38350700014|11063799006|56012099006|55112099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	NXAxNiMtoaAeQsP5Of788KFta1eaXbxgk8tUcgL/mM7ROnLpuRFG/oRVY4qG1Fiiwx3JZSdhZ8NEgV6e8ZL0sgTc7kp7HL4fMj8yNrNbDAzrwT9aIPh5edlEAOvCNx5ZTYPT9X3Z+tNBVkfthtRyZAdd7L0619lqqmQNl44SLW6gX6m5LgBzkdZRxoQYxzPEKHmA8z5fol5Dvp4YcNl7PPqTu98eWP22iQAVotZmlcqKBOmzWUbs9LARSS5JOgx6T1rqvaMLyld/raiiCcnskCYLs0fcGvD0VVQhEaymtYVbLBJVRdEAlQvxlWNDYO4w04YnIRSSZ93yASFlTxYVYTAojo3ILo26wbwA08QPhEQBnfHAHoM8UyoKfPARaY83YM067PACjEG5ohFJQDw937cBaZiVsWcLckIWsvuniwt83ACMzQFR3tXDagk21usOxQksRUiDdWAU5YUQY22xLfIDUD1Jt5MZiWH6qM1/1I6TQeQZ+1v9CyxumS9HSkrN4DMWWqfq2eZauRVFy6GrDHJP4VQ3M7zjDBX8mgw3QllVMiqi+8zjhJPE3NN3AE3A/ZzyNVqIgHfOJl4rL2eKLToW+vK4sFQb62wZDdl/D6cMs8YLAlOajjEIkB67MJtGhRkLbXwkmVOyB0a/CFZXRNZrrqTr8/eY1HVPh7b56kNfZ1BDDmUai9TFpPbfYEQSts/yPlcfCgVUCPka8IOq+IyLR/nWiFJX4SYuEYLDrlE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(52116014)(38350700014)(11063799006)(56012099006)(55112099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wlYmFZwFW+We8QYFlw/hysDMW2W5BaJzdd9AFDnsjowSmsPleZlUPN0Ythwr?=
 =?us-ascii?Q?CeMhTtnvOqpObd9yQDHG+/dvnoEbwlQ1nwby25F654eJ+rNjzt5zYQLkHNk+?=
 =?us-ascii?Q?ybr5Aw3cMbIZWrNY6IAJ3ti8xFXDmpQvG4Yz0a7efCcNCxPz9YPFZOhEYlvX?=
 =?us-ascii?Q?5QGEtfay+uvhfCeLO1qiw295ALeGNQJxbPmOIXjR8ysjLxrG0nMDDbE+I95n?=
 =?us-ascii?Q?gt0M+h4aVZGk+1GZRniHJkKNrKXHcWL+G9cGfWac1x0AKvUaWzNWtb2dzX+H?=
 =?us-ascii?Q?kv2wTkcPIIUCIIbyvc0EUlBC2p3X0UaaMSBczKNOy8ZjXKuRJyZxWKNWuojn?=
 =?us-ascii?Q?XZ6KsUxS97M5NzqmumXSRD68Goo+cevUsCl/8GunrQ57cDmQSmZn8+ZCDlDP?=
 =?us-ascii?Q?l+ii3AhkDWlms1DSZuBR28akj5J0R3y9pQNEfi7BUFGpgWpvjAfGGtRX5fkQ?=
 =?us-ascii?Q?8eDMHD59srHus9u4nTwYMKAcugCUsujHkdXMInJJRjsmJn0PWg1nsZU+rVpg?=
 =?us-ascii?Q?C8+9VTy9ewe5jqPiZ9mQOvI65MWFjpA2ogZSfSsrJjiI9u4Hnzee7W8RoWdt?=
 =?us-ascii?Q?sgshoCi4grwWRQuIBvcRT72dqveYb4gkJhCE/Uk04NJ/tQ+Y/s/4deqKC6Va?=
 =?us-ascii?Q?kIzjcGAi1FAABVKhu4sKm6dRplpkRi5F2vqpoKEfRHwvt0rELa/s3BOTteP5?=
 =?us-ascii?Q?bFSD7N3IF/p8HSIJJw5GoaOtyn+7NydPQwBJ7ds9sMbYexV9qNvogz7UhtRu?=
 =?us-ascii?Q?iW7L1Q8Mij98/zy9jXHNrccWZM0PhhRFOlSzS2oiV0J3BxP6CBuHxzIu2ZYl?=
 =?us-ascii?Q?KJK2MfmDrH9f+UMW6PZ1IuUn8OCJ4JuVZSPsMCGnaHVZboUyzy1EpavYltRY?=
 =?us-ascii?Q?e+K0d1Tn12mlUC2oMUkQbVQ/DKlgVsP+qGS9Zl6+BYlk7vr0Fsm+IWNzRO0z?=
 =?us-ascii?Q?VnlO5jDQ2HpgBdqt+GjYS8DYUwWu6G8mUZCfDBuNYFPQvz2vUvfatDP03bX5?=
 =?us-ascii?Q?30Mxf2+nDhc4pV5B3YAHZO/1FA3t9ojRo/cfCNoxbEdZlJ4VcywlVzq+MiHg?=
 =?us-ascii?Q?JhPbE4B8qaU+c0Sc4JrBaFjTKg4Pn8Tf8XvZVAGV6o4UgDLn9LFw/SJJe4wR?=
 =?us-ascii?Q?/gYxtJ4h2cQsXzXhxMK8PvnzMsjJI5MmxkRNpXpaDnO+xjVtNavskjhdtTZX?=
 =?us-ascii?Q?R6djiIME+LsseidwK/1N5QO8lTQRDYZ9QMDHWRU3TebekeLciRaE9jmJNo31?=
 =?us-ascii?Q?UYphtzD1KQ8v+lVlfc0v423YQNxahgatIu8dHyPIva9+5rfSL3MNh2hwKl4X?=
 =?us-ascii?Q?7T88ReYjdv5UpIze/xIFW0t5PEQWZTj3kmUIzNmcHbaMN6qjY/GY70C/aNds?=
 =?us-ascii?Q?F7cYrTYdX1T8Um3NhTGnrcd3JHzUGb9gDUPo3qvra2a0OQtJPOIIG0CIkgj9?=
 =?us-ascii?Q?8In8rxetYpAvVxWYXj7Neqklm5QZ/EvGlwDIEeuNTxcag5nbKgPC/eoiwR7i?=
 =?us-ascii?Q?TMXstYwG/qD2qjucjJOhdRfOSWnVDjKbfuPHeum8FWjBlTjz9v9AS0fsB+cb?=
 =?us-ascii?Q?/rCAjuwkiK/agDPzK0FEdPhDEZMu/Uv+FAmksMiA+ureW5h4J0o0k8pJ9qTm?=
 =?us-ascii?Q?J3bS1dD396wmkPZdQcty0Z37XdVHmIaFjJSa5ZN42q3tNCkgjWWwAkq1a7aE?=
 =?us-ascii?Q?xjVWzM14UsrIyNPR0LekUevTlxQ+yGA3KqdgUrhuPGGEa/2ZGBZzotyFwLr5?=
 =?us-ascii?Q?pr41BZBL8+gEcwbYy8pi7ZKzCOVMQJ0=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a15d625-8e6b-47f7-1b9c-08df14864c74
X-MS-Exchange-CrossTenant-AuthSource: PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 06:38:35.1749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5RpzRtPmzPqSdP+2x2RBVpCcZzcHUuIAVXzpq+017jNFw5NZOfr2jwj4HewAbjqmfahOavG+0V2PPr8xagBOEZShu+9PnEqnGzhQrYibw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4908
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246025

From: Sana Kazi <Kazi.S@bmwtechworks.in>

Set LICENSE for libgcrypt-dbg as "LGPL-2.1-or-later"

Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/reci=
pes-support/libgcrypt/libgcrypt_1.12.1.bb
index d7f8563ae6..50c4fda7e9 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
@@ -9,6 +9,7 @@ SECTION =3D "libs"
 LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause"
 LICENSE:${PN} =3D "LGPL-2.1-or-later & BSD-3-Clause"
 LICENSE:${PN}-dev =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN}-dbg =3D "LGPL-2.1-or-later"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D570a9b3749dd0463a1778803b12a6dc=
e \
                     file://COPYING.LIB;md5=3D4bf661c1e3793e55c8d1051bc5e0a=
e21 \
--=20
2.43.0



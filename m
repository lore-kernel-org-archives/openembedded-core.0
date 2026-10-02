Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD414CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:16:14 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5975.1790925367210363324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AXg+rSRB;
 spf=pass (domain: est.tech, ip: 52.101.65.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSNikYTXAgrohV0NYHmj8KhJU90yIDbW2wJEDDMY0tlvHuimdyVLOhjZQjXWGyWU8uybbbLDgRDkyuXbOsAx8YRFZPfa4PcPv+lPPnMo6y+15mVPAXdQYJbWDd7Re4PFu52om0iA0O/VXk7zLa5R5qqDEsLSyfrGkrC6qiq6Uzbw5KqPvaVrfc9dOEzer+hs9Bw8PEVi514f7I0t73OqehtVrCOYFcPAeYhot0hKoinlJbUkiLAGo2tnFnPY/uBp1nXjRG6nXF/vg6IP8902VXI3h6Ys/7OYlL8wTfKUZqYCMZ3ymsSeHEQ5aQWdZ5Amborfo7/PM7HMIKb5MWixmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sUIa+mFjeZfUODhXncvkRcXHRUyCl0cXM0vQU9vlw8=;
 b=WsAO3MtwHZIphXtf5WZFeFtJnPf+vhdDG90YIlMkOtbzZNuur+AVUGl8c+N3eIHIOGVs6KlBiSMgJ5o45mvFZyHQSoWRmXD+FlPotL4zj10KjBzR0oBLVGS/5n9aY7KFsebn0GYizUk+yhr/QkhZI+lES0/X2t+3NimkMy5KN+PIoVBROnuVAH25a9KjfEK3eeM7hHDZOd6PSeurE9BGP8JTRFfWZjmdkBom2vVtzvCGqO/WPbaGBOEA55Tf1a0ZwK4XoqUc+tkKEIfJ+ZXrYk5JcPD32P2i/nDPoYBSLZ756deW73i12686laKHqNPM3QGfVIosd/2LpUel6/pgwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sUIa+mFjeZfUODhXncvkRcXHRUyCl0cXM0vQU9vlw8=;
 b=AXg+rSRBbP/QGGfQkfPTo+wGc9+tbxDhrsC/ve1dgVOYlF9L6Ys6akXNP5E12GH5UxqbeiI/gou3QuzNvdr/VVoDhf9+3nm2IBn3Oaw740/OPjq80NXgEZdnJY3UsexlxqlH/nPojzeEKkn5bo7xSC+SDC6wfsjNGMvjkE2hCYHoT14lVl7J1Ajz6cljwgr7skKVRInM4m+bB7JutyQfUlT3MP/syddnJylP8czDA5IiAUoiIktVY1eclFGFXlnkqXovzRZgvdPZsTEDjS+CpixkT50YIOtoEg8Pksr/JPf0KHNjZAtMF7aVGeloSQdNRFRR+Z76JOo0zyzaXSleVQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU7PPFF852A1B5A.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aee) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 07:16:01 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 07:15:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] Upgrades on 02-10-2026
Date: Fri,  2 Oct 2026 09:15:53 +0200
Message-ID: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0314.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU7PPFF852A1B5A:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e967a5c-d746-4913-dfc3-08df20550240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	oiB+wpPQQMwwZ+csaogv8P2GCN2z7fHz1MyP9bsQatrDjWxXV9ILW7XlD15cUDEfHEL127DuecwF9sXWiOg2tJSzOe8U/QFrEwL0kyaFHWPdrcR5ZUPlchUlN9kAQo//1VwgxX2U+q08ZKb/iciSa6ZrANqOG36/qyltALVnbiT3Pisg2nRLyzVSJSamA6GvZDlomF8lcJVVijmwepLdROyXBhMsoXcBK43ADZ3bQQ79tSKoevYyjIrdbqhVFrVufz05F00XTXWcPqLwqRSbZSwoP978V6+SliphlG+SJR3bhLsZracNTyYQ2opn5kqiJiDb++wsQpPPCuwGFhbRN71XqLK2pTxgERLCDlsPq5kscEsTj+SNhfx22lKGVYVRkIC6dhyJRLhd73BdWGovFkfZg9ETInePFAPxp3NJkOF5ukocsBr6ZKscosE9q41aDxZyc0UzlOXJjlk8TJfSzWR3XtJ8F01qhWxV5OcmY1B/1zqrNQmBzlEeDy+CtYmXLqn3RQiePQfvgw9zPUXXx5XG7vWxe1Told/LQdvHbZ6l35FybO9rZdQGuK/l+Ee1W3bHx7GQXtwQRcXiFJ/phXPC2KbKsUYgA5kiBaEeAYyTGnsQxtOFvVlJV03Gl/CdaXSCvITrz6Yx9f0dLR82czKjVe6MGBiNJc661mtD1rI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q0ugYHzKQLz7ZnA4ikiMy+mRGz0jr31oM7lxW0e0TptJHER/zvd1HwK9mCzC?=
 =?us-ascii?Q?KMXs6BjZNv8J6LUSHkKUaw2bnp8DzPw4uDdoNpA/Xn64nGmN76EU5D08e7O0?=
 =?us-ascii?Q?wdKcMQjwN53L9dcoDMZM2BtEEmz3kQr6tMGeAyCT9EONxFN8OHTAKAfITuiK?=
 =?us-ascii?Q?OqIqiais7MEhM4MWruNwcZJ3HUV0SvsuzSo0wywRhayUGYiOmntwMED8Q6Ds?=
 =?us-ascii?Q?2Mx3tmRcLKVjCka4h4Nv7+ADSEbkZAU4n0JIp+2bzeF/fs3pgokHAQ8c6FQe?=
 =?us-ascii?Q?zbhIDiqhk1TvMfmXIUngh6ivg7y62OYzI1ov9MlfJZgsMvq2tJlfMWmpFG1Z?=
 =?us-ascii?Q?Aqy8TEMLb60OBpe4H+2kmMxKlMxQ7DcD6+LYlkX7dMukslCe/o7/KupWaBb9?=
 =?us-ascii?Q?aEmwF0U5iOR31EEthVbtwnu9kmfH6ZQ/4yehLw2WXLGNvH2BVbMwN26rDt7w?=
 =?us-ascii?Q?9iIHB3HJCdD/co4w32Xd+Ue/wGZSmjdcSbe5FHTdqMBAEdeIZn8PejeMlyBz?=
 =?us-ascii?Q?Dxr+lZpw2iaZmLQxikyRZYOM0bv0ANkwdLxQ+bhUReABdiFZrqb08ZySleEY?=
 =?us-ascii?Q?1aqeRnp9S5Xp7t3N+SFzbFDLandZXe89VTdPfChZW3WhuG2eSOnONkSpZfMv?=
 =?us-ascii?Q?eWz0mIjlwmVWTXRAJFeRAUuEbBDAvkuEblFmCCZfOJdWdhhkMVs8n0n7dVGc?=
 =?us-ascii?Q?8lveWgxPSGmqAhW6KdfwCpdiccWL4EtCf/4dyGb1fwPI9iIWQLeBP0xsDeU7?=
 =?us-ascii?Q?OPMJILrOngcaGYRAFspGfs4uyC/Eja++xFLYY7PqantoL1/jBVnRAcaA8lfQ?=
 =?us-ascii?Q?vK/s65LLova5BP+OV+znBTiaoChbG25hk821fCsg/5cQjpZecxDswUcvCVbI?=
 =?us-ascii?Q?U93bGO0BQXNfY+w5C//0VuFZTvZEomIt26NrDgdmF9ChBDgHKNxjUmL5J0G4?=
 =?us-ascii?Q?NOn5/yi6S+o1SgbMOLBCFbGqtdzqCsYsX+61BuAj9x+wDUrNgNpmRBwEY+cE?=
 =?us-ascii?Q?HFICg1nO5fPovtM9i94381rKfZz4kcC4ERKAy4D+pGptHVXI71gvkc56jInI?=
 =?us-ascii?Q?s5GLRSLELwBaC9aC9gwOcse+D6nylBGU0V8YNjFqoJ7IG1zkblN93LzlN32n?=
 =?us-ascii?Q?yjaZ56W964hEjZzAh2KaHTA1bc/GyKBePEE7jrZ52hN3irbt10DcggTQdsqM?=
 =?us-ascii?Q?35171WSM8iZ+7Yr2vArHuTs+OlLzoP8jwrSBRkL/h6uTzkoLzIt6ZKrF7xyZ?=
 =?us-ascii?Q?Q5iJKfDicHSddNNyMDxk7MaGVHITESYIMcfHaNZl8AcRwcElvNCkT38XHHMp?=
 =?us-ascii?Q?f+49ujyfWS0Z8CKTSZf1IxA2x32UTY9wooFVnDlwE68BPkyfrrdDpzsn+kBd?=
 =?us-ascii?Q?eER6oifR4NAOyU01yv88Dpr4oL53s6sVk7gJ4WIQK1EWFj4+gmuv1w4Tn4g9?=
 =?us-ascii?Q?bxcPSeiPUOry5qDxpXOgERwmlG0O75ZoAvB1IqvtoCvgT1li1IEnoUvlOz/M?=
 =?us-ascii?Q?VQI/BUDUdgYtsCnHOsTyN0CjP9L3ya7+qxKWNFo2SdpEUu7krJifHHH0C5zr?=
 =?us-ascii?Q?bmICW1Wwe3cLdgsZLNhYOwbuOs6XufI8megxm2lRGq9ePSbMkJedseqBeOLN?=
 =?us-ascii?Q?MDRfYlstfCjKr7a6alDeOEkjpDf7fPJL+x4hf13jP742+KPDSBXsR3Tl4c36?=
 =?us-ascii?Q?G/CKwWgjHgEl/36107JetNSt1yVzZqeGbghZMUbMsJICuQ35SQBRaG97Tyo9?=
 =?us-ascii?Q?pj1Y1cRfSg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e967a5c-d746-4913-dfc3-08df20550240
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:15:59.3847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5FfrVHM19C5SZ0hNectwXy2Ja+TUSv0hCNM+XLz0PMs+iMyIjSGsErEB5hzd2Fm3ebncLLGdq9H8K4UEBRJP1HGUjq7ciueGUidHwWB6hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFF852A1B5A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247068

Jaipaul Cheernam (4):
  libjitterentropy: upgrade 3.6.3 -> 3.7.0
  libjitterentropy: Fix HOMEPAGE
  shadow: upgrade 4.20.2 -> 4.20.3
  glib-networking: upgrade 2.80.1 -> 2.90.0

 ...-check-return-value-when-writing-to-.patch |  82 ----------
 ...heck-return-value-of-g_tls_bio_alloc.patch |  42 -----
 ...enssl-check-return-values-of-BIO_new.patch | 146 ------------------
 ...of-bounds-read-in-accepted-cas-prope.patch |  48 ------
 ...ng_2.80.1.bb =3D> glib-networking_2.90.0.bb} |  10 +-
 .../shadow/files/notallylog.patch             |   2 +-
 .../{shadow_4.20.2.bb =3D> shadow_4.20.3.bb}    |   2 +-
 ...opy_3.6.3.bb =3D> libjitterentropy_3.7.0.bb} |   6 +-
 8 files changed, 9 insertions(+), 329 deletions(-)
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking/0001-=
openssl-properly-check-return-value-when-writing-to-.patch
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking/0002-=
openssl-check-return-value-of-g_tls_bio_alloc.patch
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking/0003-=
openssl-check-return-values-of-BIO_new.patch
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking/0004-=
openssl-fix-out-of-bounds-read-in-accepted-cas-prope.patch
 rename meta/recipes-core/glib-networking/{glib-networking_2.80.1.bb =3D> g=
lib-networking_2.90.0.bb} (81%)
 rename meta/recipes-extended/shadow/{shadow_4.20.2.bb =3D> shadow_4.20.3.b=
b} (98%)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.6.3.bb =
=3D> libjitterentropy_3.7.0.bb} (85%)



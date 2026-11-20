Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.135])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5530.1795180325829648956
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=LAWlwf26;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.66.135, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnUISr4WaBV1t/PPuD+uaZcAIMarriM+0D6EW1cEuLn1wagavGvBW7GFSv+GbyYdU82mUD0QZ/Y2MkAZl8y8k8eNdV40b5WZt8jWk3d3pEh+++OcfHcKCE/nOg5gOS5YvC2GuImGj1VpzxWzl2E1aAZS3EGrMFea3jKEXdf9V88jymBfXLVOc8Ia6T6HfVkVvNp3/HzbTn5IpqlFnhCaH2ctYz5wztQQNVUzDrYPxGuPh2oR2RCQBpxo0JWPdCEeXf5V++jQZDACExRp4ZubwygLr0PHXAxL3zMW280lwjT6lfpUkIDMjyrBaCzo12DyZB+YJkXy+DtpTEJ5DmmPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97V/ny9c+rTH7mFIa6Qh2zIDDFK73KHM00lfCgoxq9k=;
 b=QTsUSESWWjh0gehyoF+ebHnOLeC5Kin1v8T/gQgjb7G5aHFlCw9V8gTl9Z3gyrw9GrHze7phru0Yjj8TQGeeQbBmOMTVQt74grvvBWxEaf2YXxIPdvQSCDRtL8LUf7fgq7ArRSMulklTNKaN/TMZ4hMlGQe7BR9tsMAjdyD29/zVBj7IIfO/8u4cX31IawDQOZETrmSoFe+duUojSNy1oYYiniFYc9HwuT+g5qTJoM2PrCESjMCNPRS7LtiSKvipQ666nsxqWFLrEoE+zIiy6bn23ypjMQIJkFi3YA9Q75mit8SS/bDn4mc2xW8HhWum3c41YEfN2TR3Y4A4du0KaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97V/ny9c+rTH7mFIa6Qh2zIDDFK73KHM00lfCgoxq9k=;
 b=LAWlwf262MYqZLE90n6BpqIUVGxRycMhBuzyFsMikkxIe1V44HF5mGFOpScQGuGCMa/M0i2dlxyZXQUJgF16EW0KCrA/5Igr6brecnRdTA9fLVtKw+uXAQYnNOnbOojdl6H7NGcQyxUTPYZihP+8cninnLTrKx/KeUR+AOz6/Yokcu1eNoxqGR4KoE0T1clkhKnzB2X8T5V9hbK05tFIQdd1ujf4P6iSPUuOFAl/38niiRkTFj4h9k8upF33PW3FO6mi8a2IbNozZ87kA2PQXNxjaVpbEH26uAyGHyfJM3WHFAqjIpxDiZPhy4RnPvn6L3jnu7PLQt8hGo96yS5ltw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com (2603:10a6:150:1dc::17)
 by PA4PR06MB7311.eurprd06.prod.outlook.com (2603:10a6:102:ff::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 13:12:01 +0000
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc]) by GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc%6]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 13:11:55 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] image: Fix base-passwd attribution on read-only rootfs
Date: Fri, 20 Nov 2026 15:11:41 +0200
Message-ID: <20261120131141.7791-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: OS6P279CA0098.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3d::7) To GVXPR06MB9766.eurprd06.prod.outlook.com
 (2603:10a6:150:1dc::17)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR06MB9766:EE_|PA4PR06MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c208b59-d450-405a-928b-08df4707d9c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|52116014|1800799024|38350700014|261022075727099003|261021123027099003|10067099003|56012099006|261022115727099003|260925022911599003|260925021311599003|11063799006|260925021911599003|261028144727099003|261021121427099003|261102123227099003|261026140227099003|261022105027099003|261026121527099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: nXR9IbycUg5afh6eEHRpNg0IC9S7N8Q0lbeP3R/mpki1wN1pYIMpEfbUEZxkwuawyKWi9yH9edeMkAWKAbyQhWDXh9OuNXM4fU/S1yM64/jdHjGO6vxHNmdgfGiw0kbZfoPjZkPV7nWPr7W29ralJN2H0GpnnRKtsSX+4e1ioMFdRcbKKEslZOoy7sAa6Z0GgJgCkyi62bMX5ILfgaFT13dpNbX5vZ2bNxeRs0ACdjo1sHZGfchREkJgUpf/9kA+Tz6w6b1m75kDyt0kHOhx16rCj0SVK5vlNby2iV4s/Yy6W1dXR8bwc67mpztXAEEKKZ5PQnvlQ/tRbL9iHFfg63Z+yKFxZvcLA6frgJ006QrUq2IUbHKLQIqCG8/pi07QjsGPJ7lYw//INF1fazWlwmANLjNgzwV/0t69f54fTL4r30P2ZlgzS1OrUM4GCrL1TYA6cbTvovJsybWzjvbTxM3X4FLPNiM3KDJOKjzzsP/GFChOxDHiwBjuJyIPUUEKbVw1ei9iExBcidWPcLyH486gY6yzCzCwtAg++Gam6kLOuyEWUarnJdakaVsTfCpBgAbC0EmPru9tpiotxKx361LA/01mYgWddRqvRSUndpEs7uAFgLfQhHjjAyAsXrpTRbXF6FsVgADmGX4eKjFO1IoChIeFE4ln0Hugo2ZPMD8+1E2GByGSYVRq6fSwFO1YXVaqfaWbQCW73Ich2G/rRtLtSr6SjifHdflrfVl8IuM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR06MB9766.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(52116014)(1800799024)(38350700014)(261022075727099003)(261021123027099003)(10067099003)(56012099006)(261022115727099003)(260925022911599003)(260925021311599003)(11063799006)(260925021911599003)(261028144727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261022105027099003)(261026121527099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+SbC9vaG2xB/1S7GbC3S+YHUb6pesB3ZHdWwVhou72tkhkXOzvGaCzfUCkWp?=
 =?us-ascii?Q?92FYDl2ZxjAT6SBJtEGtcozAv6WhS0GEIyc1iT1XlIcAo8OGI+L58vcJGRsH?=
 =?us-ascii?Q?0nPZuXeH1serNNJzSOErGE2F1TN5lMAvwZQQOCjC0iS3CmT4YnrGYHZKF7Wf?=
 =?us-ascii?Q?h9E9bQ5CZ+cQ2Mo2dFBWHd9jaxoOSKmi7SuHbQL4uDZqU9w9oDfma06WLLMU?=
 =?us-ascii?Q?2F/ozh7sCbLn0jvjlR8xcVhrekWVAA2SpRGnGvriYZ0YFpo+84BfxCujSRpO?=
 =?us-ascii?Q?H9NkLc83Ysv8TmI5SuxrGnF2nQAhHkn3jsTN3Pd9Ot3bBMlEYPVMOb7/d5Np?=
 =?us-ascii?Q?s9d6D0zliFL/vAdSwtTgiqrdaHenw7eeQ7G/lz2vZ+KlB3+yIR/dXBtgipHl?=
 =?us-ascii?Q?nUkcMOhfAIll/IxRnEuP/NoDdGzB3JA2OcBJbsTKHm/z7uRMd83/Jff3QF7H?=
 =?us-ascii?Q?OV7ieKw/y8m913oXG2rIpP73aHJ+kdds1JvaLcUDEXd3JC2CpjjOfGsUsjYt?=
 =?us-ascii?Q?eiKzjR9rXRad74Ng9pnQXY2UMsUpawRelk4dhJAlhZD/8DroIWvR7237gpE9?=
 =?us-ascii?Q?/SLDGkJVI4C48Go7RbWHGg/BN/jDljtFst+UUL58hb6jpC8VMowdc95p4/vv?=
 =?us-ascii?Q?ypg+Y3Vv6UdphVV46fzh02r7WXYMZ8PTvov7TIYfDeP3xZhhqQFnAX9YGDsP?=
 =?us-ascii?Q?iTOnbavVe7MuFJtScGzp8fGcujWU1eK4DVNrUZelZFUAU8AM9Wdo0pFI9HOv?=
 =?us-ascii?Q?eZfpqWwebov1LVQyqfuP82lVon2wcmKL1IawqN5M1+anICrUm9rJSIYZ2rZS?=
 =?us-ascii?Q?VyGvKmuGEKd+pTZ4JLHk99IWhl0SUl4913E3fThdQNI2jfHuSv9FcQGTxGtg?=
 =?us-ascii?Q?DnzkBtOBZuRspSoZ6929TZJIYTY2XDO1fld9uKrGoyhBjHKvoPmO0w3/b73c?=
 =?us-ascii?Q?ZosgzqpuNa8jRDSor61GG+OyXIg7mKPOvC4yxMyJGEsVSLW0Kcvq11P/1Ui7?=
 =?us-ascii?Q?fBMlfwy3g6XACkRu2S37/XlLZHWnDNILkVAb3gpkxNh6O95QuqzqeThxtGIY?=
 =?us-ascii?Q?iudXfZOl5miYAF2X58HDz6c1RshWx0HzkfRY57nkxeIl4B2fTb2gN1HuT9Or?=
 =?us-ascii?Q?+RujpT+Xtil+m48G63qj750aZw9NjQjeJ2yUsAmgwwjkGJEp4debNfqanxXA?=
 =?us-ascii?Q?DoONoaiChyeYDzjnjtNO5yHp+AHyX2rm32ATwhP1YfGhaExrYwo5GSCOZcu1?=
 =?us-ascii?Q?RWXdrMrs42BF6J5QWRNF2OBo31MeQnWUqW74jFcNYDtJ4HZ93AFPeBiz8F8V?=
 =?us-ascii?Q?8Rn/0KBCNXAmeVMBEWdVPxCPuN9Db+SW86XIgjFJl0yCiQrMWRvb8EKyaELP?=
 =?us-ascii?Q?09UnTn8uFmJfhSf2nxRjievqdOGTJVRAW67O+Gaww6kSw8tsdkGCM3UcApGF?=
 =?us-ascii?Q?yBJMWk+dfRkGO7RsLlBiRD617xmhE3EZVFS2kxS8pkIHQgSvVjQSUm6Vdxe0?=
 =?us-ascii?Q?hEAlCjpAg0B0Beo/diLBnWWzLE+LmaG+oEiZPFjNSlwulHiD8/tKFg/sJoZJ?=
 =?us-ascii?Q?GfxANee93+LR+vZojcUZmyYoY73ctFmCbQSvdyegdCsZh+nnsHrBUG0c9IsN?=
 =?us-ascii?Q?mD1etZmVHAed+H3+rboK/mQfG6idP9PheK2b0JyjAOkADMaPormx6yKhngdO?=
 =?us-ascii?Q?PEj5SwrmrfTJCCni2s35kQRsZY5THNNuJw9Q3BD+GDU7s4YRRwIyav31L88v?=
 =?us-ascii?Q?/HMpz5AjYg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c208b59-d450-405a-928b-08df4707d9c0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR06MB9766.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:11:55.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hF4JMAehXWwdte37/zLHp/ERqjzoAbSxTqLXig/oQCgOnoYcFltS7/lhgTZN9GWiwPsnymtfDxDfmAB7QPulgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB7311
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250784
Content-Type: text/plain; charset="utf-8"

Since commit c3097962ac92, license.manifest is written after
_uninstall_unneeded(), so read-only rootfs images no longer attribute
base-passwd, although its preinst creates /etc/passwd and /etc/group
from its GPL-2.0-only passwd.master and group.master. The SPDX rootfs
SBOM has lacked it the same way since it was introduced. Drop
base-passwd from ROOTFS_RO_UNNEEDED: its package is empty, so removing
it never freed anything. The image manifest and buildhistory, always
written after the removal, now list it too.

Tested with core-image-minimal and read-only-rootfs on qemux86-64:
base-passwd is back in license.manifest, package.manifest and the
rootfs SBOM, and the rootfs, without package-management, is identical
to one built with the old default.

Fixes: c3097962ac92 ("rootfs: move tasks using image_list_installed_package=
s to postuninstall")
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-recipe/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index 1e3c784ec9..1240650683 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -50,7 +50,7 @@ IMAGE_INSTALL_DEBUGFS ?=3D ""
=20
 # These packages will be removed from a read-only rootfs after all other
 # packages have been installed
-ROOTFS_RO_UNNEEDED ??=3D "update-rc.d base-passwd shadow ${VIRTUAL-RUNTIME=
_update-alternatives} ${ROOTFS_BOOTSTRAP_INSTALL}"
+ROOTFS_RO_UNNEEDED ??=3D "update-rc.d shadow ${VIRTUAL-RUNTIME_update-alte=
rnatives} ${ROOTFS_BOOTSTRAP_INSTALL}"
=20
 # packages to install from features
 FEATURE_INSTALL =3D "${@' '.join(oe.packagegroup.required_packages(oe.data=
.typed_value('IMAGE_FEATURES', d), d))}"
--=20
2.47.3


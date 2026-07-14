Return-Path: <gustavo.nihei@espressif.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EF5C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:48:27 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com (OS8PR02CU002.outbound.protection.outlook.com [40.107.75.106])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9017.1784130502168155052
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 08:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@espressifsystems.onmicrosoft.com header.s=selector1-espressifsystems-onmicrosoft-com header.b=uOI/PJXz;
 spf=pass (domain: espressif.com, ip: 40.107.75.106, mailfrom: gustavo.nihei@espressif.com)
Received: from PUZPR04MB6844.apcprd04.prod.outlook.com (2603:1096:301:116::13)
 by JH0PR04MB7294.apcprd04.prod.outlook.com (2603:1096:990:3a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.16; Wed, 15 Jul
 2026 15:08:35 +0000
Received: from SEZPR04MB6186.apcprd04.prod.outlook.com (2603:1096:101:9a::8)
 by PUZPR04MB6844.apcprd04.prod.outlook.com (2603:1096:301:116::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.8; Wed, 15 Jul
 2026 04:08:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ut0egmLTepbHVMKly7HLS6KgPkcvsTLspB4/cOlir/ZWGR2qBl/YBRqYew8Y7EWlQZ7V6lqV4Ha08wrcucCBl7KYumxB2r4vfKQqtAjyXjFf5i5vG+Ic/OE/9gs13SnwBG2QaB9QHuyIDLoNtKrh9q5cIheE+WeuonAeaFGJwFLdV7PLtX4kQqAo8csbSsqiSP+4PYCDwNEyfBEeuH6OiFFm87hFKuqHakaUa3Dp4rwUen3hzFID8wQVGJTAlMpbjmtHc0GVZuCzNmwOL8/1yRmObdB5nLwOcWz+03TLE2f9413Q2/xo+Ydqw+5Jxo690OHmgaPpo3vh1MMgQRyZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bu3+wkdPHLfFX+iyRrqNVNIP0ZIkdfeDjMX2tvK0/28=;
 b=zB1hFxDGVQiwJPVwSW8s2xYH2g8KZhTmPHYIlPQcoZUs9hqL6nOe3ogdaycspe02wATHa490Dr4jbqpPxA43Ob4cOwdphKP88eyHjwsGSIebuECVphioG8mCr7TLbVwkpLmrWob9SKm7qhoLHI+u1ehujZn+G4TcdoHRtPkDoU9wEs0DczwQD0FR4gJg6uyA8ZOV+PKMbdLm7d62NF90PyLdyqllX10W/9tQGSTto89bt0jvwnthBdVcIG4npcyyQyHP/CEsxh4htKh7dCHAuIH/W7dFF0ZVxHZjQT3QFiFNliFO8I2q43tLSWLJvKQedaMqfcb4NEa353OLh9aG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=espressif.com; dmarc=pass action=none
 header.from=espressif.com; dkim=pass header.d=espressif.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=espressifsystems.onmicrosoft.com;
 s=selector1-espressifsystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bu3+wkdPHLfFX+iyRrqNVNIP0ZIkdfeDjMX2tvK0/28=;
 b=uOI/PJXzJ7zmq2R0pRpebi19sN9ssu6WsZVJUXLkQN8+p8PQ4YEx7roKbeQGSWP6ToljWRU88CsZxOwtouzNryP2JUEXOVuJoaud4vB50fMnANh5vw5XInU8yvttMiV00/87JqwnOiGRdyaKgRq/NtoJJR5326um5i2Zw3G588Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=espressif.com;
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com (2603:1096:301:bb::12)
 by SEZPR04MB6186.apcprd04.prod.outlook.com (2603:1096:101:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Tue, 14 Jul
 2026 17:01:26 +0000
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e]) by PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e%5]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 17:01:26 +0000
From: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
To: openembedded-core@lists.openembedded.org
CC: Yoann Congal <yoann.congal@smile.fr>,
	Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
Subject: [wrynose][PATCH] u-boot: re-enable RISC-V compressed (c) ISA extension
Date: Tue, 14 Jul 2026 14:01:15 -0300
Message-ID: <20260714170115.734609-1-gustavo.nihei@espressif.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CP5P284CA0230.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:22e::12) To PUZPR04MB5419.apcprd04.prod.outlook.com
 (2603:1096:301:bb::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: 
	PUZPR04MB5419:EE_|SEZPR04MB6186:EE_|PUZPR04MB6844:EE_|JH0PR04MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 563b8e2a-8141-4eb2-3fae-08dee1c98ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|23010399003|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: AAXx5DrnRitA0p+5HVrs1RQozgYsQe9hi3XiU+RODRppM19uq/GoNpoYCdJYMT0VTQ5lQ8FvSBBctwmkG1+qsI2pDvXGL+FLVp3HHVzStLlwgRTjZoq6o/jWvm6zbwkwHW+fxHvCPjugDUbszQGrbtMFihTHSiLA9TkmFebA/b4e/gZxQB4B60Wu66TfiWzzVqFZRv4W3hqGXpv1nO5t8tNRHPv62bIDTeOlga1nkPsC19u8V6+p60DeXnngae1NAR+CuLu9rR2bFL/nzM1/rSaYZBEeTdZChvvBb4pYeFYk4GbLONhmtdcbW9Vu2pTGTLRqUnfKZAS+kCY4AE2UOVJ21SCshJ2kn2U9yQa7zPKep8jwwXo3jEWgUtWEaCVhVzW/BLxSxqOD/3N98A/npmn9kNgDkqrnEfa8ASiFPND/nQg8GeAzKpqBWW3iQLElLuWng02Iw7Zg0PxIIm1kLNGyWfEBoitFYduKM3bJpfqkqhkMk863r26tZclThRa4XfwS6/jx4A4dqlL92A5TUYszxUlzPIpaThWF1IupAVSy+rj6pCCN7NE1DdML0dhCFXBTDO1IGoLohEp5VrmwzJxCmwvgMMzRxBpWnJRy5P8kNel8eoaY1mKgTokbDCAZBoH8jCU/Vy0ynGBMMLgdZEy9xgycBPl5AXWgQWBYKPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB5419.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(23010399003)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jl2o7TzhVgLFXn3RK9GxS1GHUADFq8e3hqYCDJMsY89ocesSetop8RKi5x2O?=
 =?us-ascii?Q?Ns3BqIgMewHkXyurf8GpffCT9ChZ/uz3Vkt91uHtnF1N9x9FubEZzLtvIb3t?=
 =?us-ascii?Q?6H62eGSMpcKXCm1VLWHhpKKKmMwBe+hYGU/Jv/cxq598uu9DOy3tkZNsCLAK?=
 =?us-ascii?Q?jgVULzX+iOuy61r1+dIEXDdg+H+5FzcsVk9KFKeQT2qwGAjlWYbkjIb04XZi?=
 =?us-ascii?Q?JiafwBj6ZLsZuJZE/Y9uHven3dKYBKD89WWlRtxc+ri5Yyc7b2NHSjrJvp6M?=
 =?us-ascii?Q?HxcoDOChvj9W/7nCT7LN4YV9k7OyOtN8umNqUVRTgSiLRJGIRlBjWYlWopbQ?=
 =?us-ascii?Q?wXg8V8nXxmWcbaezGMa9YH6kz2BKgYBeejdqmBpnqkVtZszVtj5F5HOC9XKK?=
 =?us-ascii?Q?gDsaIPlVdN1CEntxnxdYeC9er2PSuIUcPlCdj4wQtoP2k5p4G/31rsCMViFJ?=
 =?us-ascii?Q?A4A2UvnvJeFlravMpGRfDHakjdruOjhaYVpDeBXN5i9v8xYmVjVIaBSFqfZu?=
 =?us-ascii?Q?BR0MnskmASEfi7/Df69wrzw52qEy2krLnjhZ+pL1U3v+vmyb0mojR4z6OdEI?=
 =?us-ascii?Q?uqjCAavcg0V8H0l3cVn+yuNy/o0CV/M+xxVi9147IBgLV6nCHF8Xd1z1ETgI?=
 =?us-ascii?Q?vAPhiNbXDb+WOsl5BIVE+vDGWh+aSImCAPhg8mQ7bdN9ntlZCvxYIjcQmouO?=
 =?us-ascii?Q?M1diHcJ/gdsCDnaXrtk1kFLFA+x8/VbZwPo4+l1Yz7Nix/I6oa5YQVXFrz+u?=
 =?us-ascii?Q?smGFlNRZSK7L5+6mX0NbxZrpo7m3rKVv3Z/yV+N30xAMuRU4wbViF/XrgD98?=
 =?us-ascii?Q?GQ3tm8HyGAca4y0MnmoceYlzKfEoWRIzdTWHtNrd/r9NUEEwomhrP2RhtMY+?=
 =?us-ascii?Q?aBO7pk+yCEJJAnB6s3WV0SnbbmHnaDHWPcDuojjGEaE9gHjHv2uki2U4uDPK?=
 =?us-ascii?Q?t6ux+xOzuvXYXWoYTlVoprY2FpwBWYVIEs+zHkyF3TwpbK7sfNk31PwoqyAA?=
 =?us-ascii?Q?bUZ8ryXs6JGtDPDlZ4IIL1d6XRqHUrppTQZSaR/JiQmvzluZTGo+IxgFB/Zd?=
 =?us-ascii?Q?rxgAFere3kU7kA1cHmRCHmXGMKDHUa5WxRhTOHb51KVL+rvd5dq7He/8Ip7d?=
 =?us-ascii?Q?uQ6QeQZ224KUDbjKksZ41wxtQr+0ZDyBTyyOjKe4vHfN83TFH5zIDQ4d1BGn?=
 =?us-ascii?Q?J+rpRniONyo1nlLvOqTrbz6HUw3ZDD7SYyrggY3R5rwOMaJcIQOM8uxsky8X?=
 =?us-ascii?Q?tY5EnQ/AWdFpv0i99qYwFRloeUQ8uRNqSlJFq6a0qzv8zSn4RJ21tD8GW9EF?=
 =?us-ascii?Q?fC7snM6pBixUVhL+xBfFHvF5lrrjpqkUbTG5iE7TgJLq2bwW8pzgBhqpq6KB?=
 =?us-ascii?Q?zI+uPouh9hUUxYUrX84OR067J/arPJPR1/BzYdJ77Z9xSzkTtc3ScKLQfNN1?=
 =?us-ascii?Q?7R7XSp4r/r44pWNjdMZzLnZSc6/RwLUbMH7U3V8+ZKxg3b9+J7WDvuXPnOwz?=
 =?us-ascii?Q?aLSgpaLRrTtzV5DADc+7YlbRuVyRxOG2XPAM4+ZtFjuO+5b5iXYN+f9FX1Zp?=
 =?us-ascii?Q?JQ2/1Ty19NySsIEaDd8UVgpF87qw/WLy9/dDBjTGSrDhs45UJ9bFdLbKghju?=
 =?us-ascii?Q?a4fF7O2dOy7h4Rd1H4ObtqKswAeIQcjyDrJt6jBB2pPTX7TWrtkcRBA8Q10e?=
 =?us-ascii?Q?tp+BBJZfm6HKYJKqhpROQVOmodv1ZKFcDn8OOkBu8jJ2Qm51JFEaWV6t9yO3?=
 =?us-ascii?Q?RWdvchsK9HMa/aXVYxdte25vItB04eEdueXItugYTqMo3RA3S9pWevz6Sok4?=
X-MS-Exchange-AntiSpam-MessageData-1: Cat1plb3j0pr0cz2R06vVcUTvcyvtpaFCLg=
X-MS-Exchange-CrossTenant-Network-Message-Id: 563b8e2a-8141-4eb2-3fae-08dee1c98ab6
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB5419.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 17:01:26.6468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5faf27fd-3557-4294-9545-8ea74a409f39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qrv8sWwc8zoF1HMNbiIpJRQH08+qRZj+ICWaWODi5mFSLaIfA+/+RMVOdiZCLO6Dm+zmcKnpy5JrbnnkgJHbKvfB1LywrmfZRoy0+blYMQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6186
X-OriginatorOrg: espressif.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240981

SRC_URI_RISCV clears every RISC-V ISA extension via
u-boot-riscv-isa_clear.cfg, then conditionally re-adds a fragment per
TUNE_FEATURES bit: a, f, d, b/zbb, zicbom. There is no line for c, even
though u-boot-riscv-isa_c.cfg (CONFIG_RISCV_ISA_C=3Dy) already ships in
the recipe. So for any tune with c in TUNE_FEATURES (e.g. the default
rv64gc/rv32gc tunes), compressed instructions stay disabled after the
clear fragment runs.

Building without RVC noticeably inflates .text (measured ~17.5% larger
on qemuriscv64) and, on size-constrained RISC-V SPL targets, can make
the SPL .bss VMA overlap the .text VMA and fail the link.

Add the missing "c" mapping line, mirroring the existing per-extension
entries (a, f, d, b/zbb, zicbom) already present in SRC_URI_RISCV.

Same fix as master commit fef027f2350cec0e6b890b636d2529a13f1fab58
("u-boot: re-enable RISC-V compressed (c) ISA extension"), reapplied
here since wrynose ships u-boot_2026.01.bb rather than
u-boot_2026.04.bb.

Fixes: cd9e7304481b ("u-boot: Overhaul UBOOT_CONFIG flow")

AI-Generated: Uses Cursor

Signed-off-by: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
---
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u=
-boot/u-boot_2026.01.bb
index ac1b0b9b2b..6d9bc126a1 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
@@ -14,6 +14,7 @@ SRC_URI_RISCV =3D "\
     ${@bb.utils.contains    ("TUNE_FEATURES", "a",      "file://u-boot-ris=
cv-isa_a.cfg", "", d)} \
     ${@bb.utils.contains    ("TUNE_FEATURES", "f",      "file://u-boot-ris=
cv-isa_f.cfg", "", d)} \
     ${@bb.utils.contains    ("TUNE_FEATURES", "d",      "file://u-boot-ris=
cv-isa_d.cfg", "", d)} \
+    ${@bb.utils.contains    ("TUNE_FEATURES", "c",      "file://u-boot-ris=
cv-isa_c.cfg", "", d)} \
     ${@bb.utils.contains_any("TUNE_FEATURES", "b zbb",  "file://u-boot-ris=
cv-isa_zbb.cfg", "", d)} \
     ${@bb.utils.contains    ("TUNE_FEATURES", "zicbom", "file://u-boot-ris=
cv-isa_zicbom.cfg", "", d)} \
     "


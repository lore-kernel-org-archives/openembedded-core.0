Return-Path: <gustavo.nihei@espressif.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E99C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 18:16:01 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com (TYDPR03CU002.outbound.protection.outlook.com [52.101.127.106])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4588.1783448158567027709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 11:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@espressifsystems.onmicrosoft.com header.s=selector1-espressifsystems-onmicrosoft-com header.b=IJPC4rkU;
 spf=pass (domain: espressif.com, ip: 52.101.127.106, mailfrom: gustavo.nihei@espressif.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+j74V37kbu+6599uEuv6h2x0LHpQ7mAn/mD+h21/wWzPNfmUjEqb5tcplrr+u3V01ZxaxPsBc1+szk7P5/Ww/iVsivANY5YyPXDdVEV1pdlUojkDxGOb9heGDgAP6QeRTPehyiANmCa32L/O8DBOVfesS3HEhV8fr4YHrYMtpjSoSRxg3t8dvVwGDFEs5nZIAedA3YMYQvx7sVQtScqeJUzjq2H4xPkvXp74Lpco3owUtoF1sRx91GtS00o3f+guB3bjmdHxjp3moLxGFrORm36hUJht3pUAAsPr+iIqjOjdEdIP8L5jvDG5tqbfvw6ZM0RLoQwvcQEudoaolELcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jFOKDpZ7cnqE1FKPqiI9mxgIkvOk0eIkTEY9Y8UMDw=;
 b=ZOtTT/B4mGB+v/+TyLR2eOVcbJ1hLLqyl0MXTUNmAfEJVC5F0ZZckSPL93LOhp3l5mH9SKZyhEOzAHnMWX3amea/qS2jr0ifTxmvxAnYSYZhVhMo5Hk83iW5ctuZA94/pLXwRbcQDX2bgVO8oUSXrIEN1X3qATMBiM2P9M6xRPYXvLdLOBNL2b7obfum2Os+jyEtkTTnHWbmmEkMdYRbAjvR136jU1MYnfxKSxBLsNpur6KYozQ3Qxkjx56UG1QlM9Rs8DhcHa2wH4VX78yE+dYQfZ6u6MDQ7Ju5Ghf5osiniIJVHBiufDBFi6WXGjzak1rvv1vQf0M5pQRoXQA1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=espressif.com; dmarc=pass action=none
 header.from=espressif.com; dkim=pass header.d=espressif.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=espressifsystems.onmicrosoft.com;
 s=selector1-espressifsystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jFOKDpZ7cnqE1FKPqiI9mxgIkvOk0eIkTEY9Y8UMDw=;
 b=IJPC4rkUWm/G81mlYd/Nf9UEBXaiUuiQOSxpKTdDW/ugGuNCPuJITwxPdCZuilTw8aSqetJckS8kRKHdoWw3Ij0iVF5KGcKVIMML6RGRM04vHYyQuwA4M+dcWXdaN2OBEWC2rcxLCjHTm1NfMT0MDzcW9RPyPimNtjz7QUJlhsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=espressif.com;
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com (2603:1096:301:bb::12)
 by TYSPR04MB7217.apcprd04.prod.outlook.com (2603:1096:400:478::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 18:15:53 +0000
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e]) by PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e%5]) with mapi id 15.21.0202.007; Tue, 7 Jul 2026
 18:15:53 +0000
From: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
To: openembedded-core@lists.openembedded.org
CC: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
Subject: [PATCH] u-boot: re-enable RISC-V compressed (c) ISA extension
Date: Tue,  7 Jul 2026 15:15:42 -0300
Message-ID: <20260707181542.2356214-1-gustavo.nihei@espressif.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CP4P284CA0047.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:127::14) To PUZPR04MB5419.apcprd04.prod.outlook.com
 (2603:1096:301:bb::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR04MB5419:EE_|TYSPR04MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: 5879e06b-14ab-479c-ef4d-08dedc53c81d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|23010399003|366016|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	qyPRcAv4mltRZ/v2S9gtufefTtNnoAbkqRfwy4/u+BeM5iMX3yRB0SjUBpQvbEgvg6mLRjvGn1pj5IyagfXajk0HlwyAoP3FkSLySs2fSM8gFtUXFKbNYQuniGthL+F5JJ+yxWlOHbri6+qo7CmuRiMtLt4NKY544bc1CBOR/y4rI5U9s2OWR5KP9wBqLv21xybPXx93PDRwjvo0zqjZ9K51lJ/PMFJSmaZ4swEfInzhn8XqVFErkTgRVhBLrT4uHprwKzIqcbox/bfF3D/aaK4XLuAbK8XEk1C5MCEQSdRph042W0uaaEQ62iaOCjkVfOAwDaPWPH9w67sWoZU7Kltugos55Rn9af3GJSNXWenFbO7jYnY8rfs9T4qcdxbrS6HXAzMtf35xPmHbyKeFXhXs3futE7WSLCAzuDhqK5tT7wiMXv+RuWqZaIUKYRBKQBR4UGE/9eWFZ++WgPNGNlML6nx6jWEbjXDqrAv2A1vtYC4pbenHwbwqoFuTMAq8Wq1Y74WszcsZyQJrl8rkC7bMHpoow0NWwmFOtqMKrMlBp51whdQaw2QTOJ3D2I1zKn2UBQVBgk1Eo94FzHYSdPbS5w31YLz80qvVuYGCbO/ae8XoPi1BSM5f/7FkHRK/Ec0lzboga+YGkCQjW5nHVPpDXoh6PDvfQfUhbn95ewU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB5419.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MzeAp5kZGppElGypjr/X5rwo9MUtRvB0nwCY+C7TRth4CzXL24ZwvN7jB6cq?=
 =?us-ascii?Q?eah4wSaWOmxHRXzNDSxMJSEakZHQfOnzuRGBAJaQK6Bm/XO9HIuqZySQxqNE?=
 =?us-ascii?Q?PfYFWh1lrVorGIB77ZZWprK5FoKX8Lhid0KW8ZsgT8w5zOUbjwUZTvw5napq?=
 =?us-ascii?Q?kJYCDixTRGEo/K829vHV0s6Q8TtJxhfdfINR56YMslJq+hpJWL0R6SVrLYi7?=
 =?us-ascii?Q?OpferWUOe21D6NMcwN3GLlXLgG+c58fTbDwOaJ/u5HICjTK0Zl0Tn+bOoB9I?=
 =?us-ascii?Q?G96A/dXsvFaxWMu2aQSBr/74YtjNxv20b+M7jssWHjYjnsY0a+9TXQmYFSr2?=
 =?us-ascii?Q?n0Px57jMpYeXb3hqNEnik9vnPe5XktlWvthAKgtAFw6MFrFiKhWbCME3Gc52?=
 =?us-ascii?Q?g9Iv1WNUT/x/23a//l6tIaUcNizOV7KxcpJDiZgrIXqb3O8VVupv3Ec2HVXv?=
 =?us-ascii?Q?hYH8KBFahjxXMFTcSNGwJRsV6jeh1Qiu/AcxWmbQj7a2LGrw+9xA6fjVynT7?=
 =?us-ascii?Q?hrL2/xtMkFNlzTvZ6nNH43kMzd/xYQeMFKdHsr/4Qm8xuRrouFLsVd8IackG?=
 =?us-ascii?Q?/2bYPrP8Qekud49OAaD13VfAzu/21qB3wH3t5rjeJ0Z3K27fM9WrWizGRM8/?=
 =?us-ascii?Q?UEhHURYdoYwcpCc6auXKTCZjlAjJ0pTZkEtXWgeDuCWBZ8rXf2Ie1Iw31kAr?=
 =?us-ascii?Q?qYC9h3tfXa+VHNfdDr9PhWmkdFcDA/2501le87EyG9O/oHY4iB3DGn5VrDJq?=
 =?us-ascii?Q?E9bGlFbIjNtiT+KLTEHogm5gkaks+/eTjJQivWpDwiVi7ZcBcOP7OX0KWiQK?=
 =?us-ascii?Q?sEHj77J0jrY81a8VCmJq+aHZVKtcLsgQCbUoW9btQhjYHVG9zeyVfbdFhmcX?=
 =?us-ascii?Q?ZIROpAe1J3cc2kUONbT3XjZbcR9gTitSQcOiD7TYfXVgqz+ztUegrn/J6ST/?=
 =?us-ascii?Q?mFHd1Hvf+9ugSJYWXU00BdIl3UnbNBMdcoee8Y74DTAFMUXbFvxtzsezT8Z4?=
 =?us-ascii?Q?U/c2JEkLwxcuFfQyPtLDfUj4mqktZsKFS9StP/4MtnLZP2Q2PRs80uvHAO1o?=
 =?us-ascii?Q?Fav/qUUTdNsxevdDbhA1P/W/m1NVRgung/wjQfHTWm27UGZyQlNU2eu8M6Lz?=
 =?us-ascii?Q?xyhbS3mvmgBiLZePrdq9v+Mw8ET51P9vxfpXt4YhYmxiNKc6NR2ArLmSm2ET?=
 =?us-ascii?Q?BBu8i9u+UiL6ub4NYpZIBBTcFE8I4wIC/OFYBkLrMH9CtH0pn/o8nxDsrsOQ?=
 =?us-ascii?Q?GkZ4wN0eFY//vmUkOUYyhhgy0RRfHCY40z6cMFjffTAb9OiU75btF1mjlk78?=
 =?us-ascii?Q?TK0OOoPKoxGwx/7Uvq84iW88C/2V3j01g1AO7rMeMb0Mxh8246EpLrydzef7?=
 =?us-ascii?Q?wPVwcnVuMjhfqEgzKZJOx4ujtEFoo3a9Iog2S8+cW04etjXBXqqlTlme6lhM?=
 =?us-ascii?Q?G5nfBHSlnjtODz6YHlJozlALCJpBduYdVeTqkN5MChLCvgAmJbeh1H78nW8L?=
 =?us-ascii?Q?FNlze+iSBtZy3DGCLepJbOd7ilDoUUX760MeftfvvqZ+yeQ7jHcYFx2R+SRn?=
 =?us-ascii?Q?WATYJFcJyK/mqvnqI2aD11Jv4CID3SoGUOQLO//ZOpxCICInysMge5ZZOgfo?=
 =?us-ascii?Q?NZL/xbeX1esPmNIM0tB0c+LL+yculsNhRjVNmhN4FRWSnZwd97taRP48FMxz?=
 =?us-ascii?Q?fRgXMVzfFi+qsepDL86EGoCPe1DRirWBJde5ejS1ZdGveSkUpFYXkkKCgqCe?=
 =?us-ascii?Q?JEhK1leqBE/rjjkfVioJBO6ZeytuYr7s/+pMe/swm9LEGdrzCvOkbKD5E7h4?=
X-MS-Exchange-AntiSpam-MessageData-1: qAaNP09CuRz+JYeFr8ymmkkWr8tXadYjOfw=
X-OriginatorOrg: espressif.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5879e06b-14ab-479c-ef4d-08dedc53c81d
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB5419.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 18:15:53.3479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5faf27fd-3557-4294-9545-8ea74a409f39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFuA/nRXymPp8WQIcc4ItXv5ss/zSgUUDZrzGwzqhKdWUjlkDvEnr0LVE6loy9Vebqk7ybew/5lnl6LSARgxhHRNknMgLIpucZnUGosI2bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7217
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 18:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240405

SRC_URI_RISCV clears every RISC-V ISA extension via
u-boot-riscv-isa_clear.cfg, then conditionally re-adds a fragment per
TUNE_FEATURES bit: a, f, d, b/zbb, zicbom. There is no line for c, even
though u-boot-riscv-isa_c.cfg (CONFIG_RISCV_ISA_C=3Dy) already ships in
the recipe. So for any tune with c in TUNE_FEATURES (e.g. the default
rv64gc/rv32gc tunes), compressed instructions stay disabled after the
clear fragment runs, and .config ends up with:

  # CONFIG_RISCV_ISA_C is not set

Building without RVC noticeably inflates .text: on qemuriscv64
(tune-riscv64, rv64gc), the resulting u-boot binary is 1312625 bytes of
.text without the fix vs 1082853 bytes with CONFIG_RISCV_ISA_C=3Dy
correctly set, 229772 bytes (17.5%) smaller. On size-constrained
RISC-V SPL targets this .text growth can make the SPL .bss VMA overlap
the .text VMA and fail the link.

Add the missing "c" mapping line, mirroring the existing per-extension
entries (a, f, d, b/zbb, zicbom) already present in SRC_URI_RISCV.

Tested on oe-core master, MACHINE=3Dqemuriscv64, via the
oe-nodistro-master bitbake-setup config:

  bitbake -c cleansstate u-boot && bitbake u-boot
  grep CONFIG_RISCV_ISA_C .../u-boot/2026.04/build/.config
  # before: "# CONFIG_RISCV_ISA_C is not set"
  # after:  "CONFIG_RISCV_ISA_C=3Dy"

do_package_qa passes both before and after; only the ISA config and
resulting .text size change.

Fixes: cd9e7304481b ("u-boot: Overhaul UBOOT_CONFIG flow")

AI-Generated: Uses Cursor

Signed-off-by: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
---
 meta/recipes-bsp/u-boot/u-boot_2026.04.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.04.bb b/meta/recipes-bsp/u=
-boot/u-boot_2026.04.bb
index 92ced8079d..b6345c8875 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
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


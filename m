Return-Path: <gustavo.nihei@espressif.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD35C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 19:26:32 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com (OS8PR02CU002.outbound.protection.outlook.com [40.107.75.135])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53166.1782933988429653684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 12:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@espressifsystems.onmicrosoft.com header.s=selector1-espressifsystems-onmicrosoft-com header.b=aQOnlA4M;
 spf=pass (domain: espressif.com, ip: 40.107.75.135, mailfrom: gustavo.nihei@espressif.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAbkxoDPumw6n//i+DlBE9GbaZgRjJW1Q09eYIajj0qIZZ0s2wrfO0eTATVp5C0Obz5+ccIkjjorTrCf7YDfaK9jBjQwtLibPtB1/6EQYdz4FKGq0bQmL1Z1qzGOsBPASnTaBpdTdcxCflBW/sFCeAe8cxO5bIJJeoVhMZb1lFItzgT7CSF+A32CEmDa2PT3eGlaW+ZU8WUzvT/FebO5Le9eNBS/52S5ATpnYGo9LgAADc1qmdaOqBRnPuyAhqOCvdcFVfPbh3mLauddJCrT7gQ/cdbTa5L++Q3fvOo0sq5oMYdFA1IHQgos/tHTLNvenkxktI2bSvlxZB/oVEmGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lYMb/DdmLabpI4FeoAnk0WzoVI9sc5rVvSjjxSFs0Y=;
 b=UdWOtThPBsA0B00HxbKeO98dbYdeS/OqSnEHiOZ2MUbAjQth0HIN5aMSaCpxT+AchytQ1NnsDSReA5zE3N2noW6YI0SDoOFfTgbJWzz9z/paxbCDBrhwpmIJ18h9LD0EzEuxtZ2tY4iHUsJRfAfLjwt092U4SoZpoNtGgvFDGtjIkRtFmA/PqzRtzEhurSQbIaGpOOEI84yWjmeuGDVKfzB/V0dyExnz/UvUJo9ZYDvAVTBHGQDGgDzvZhZrTPoLBd8QJVVMX5WgpdY9aj0t2mTws60GAAYQi8245368BAFZM9pnLv+9I+tizUGZpCz/6d7+0fjOYS2PY4uC0oHTFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=espressif.com; dmarc=pass action=none
 header.from=espressif.com; dkim=pass header.d=espressif.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=espressifsystems.onmicrosoft.com;
 s=selector1-espressifsystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lYMb/DdmLabpI4FeoAnk0WzoVI9sc5rVvSjjxSFs0Y=;
 b=aQOnlA4Mbvd0ylPAGTFHFM2uBkaSxUF/eCZlZrkJQlYXdTILvQszkDVcFDZMAqNlyIdMN3kMfmFIh4r9QKQdO7t0IpJBDxIvzeGF9oUDBZKYOqZ6ax8b+/odlr+xTuWr7NEnpTebbJ2SeDllyYS4qKruXP0U4yIyNlB5s/IEfCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=espressif.com;
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com (2603:1096:301:bb::12)
 by KUZPR04MB9515.apcprd04.prod.outlook.com (2603:1096:d10:c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 19:26:23 +0000
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e]) by PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 19:26:23 +0000
From: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
To: openembedded-core@lists.openembedded.org
CC: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
Subject: [PATCH] opensbi: don't override ELFFLAGS, silence ldflags QA for bare-metal ELFs
Date: Wed,  1 Jul 2026 16:26:13 -0300
Message-ID: <20260701192613.3153686-1-gustavo.nihei@espressif.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CP5P284CA0215.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:22b::6) To PUZPR04MB5419.apcprd04.prod.outlook.com
 (2603:1096:301:bb::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR04MB5419:EE_|KUZPR04MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b46162a-17ac-424d-6c10-08ded7a6a2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|18002099003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	OxnGDF5fFvDu6NqXlcznzvIbpDEdjUQvnkdNfI3Om1MX49V23E7ca+QrUeoyo260uNHkbgl0DfuzdYH9t+WVLWb0WaoHeRdv8cBHXHW/jnHFoSOhUHBKT6vVjjA+46tbsPT5sdC5dASt5Z7+VsVB4ntOQ+78GL54Vdl8eAKGsOS8T9axzKbGx6jbzvqKGmFiXv2RxZnihQGYRoDALFaIC/FFbi0OwYpek/dVU9EiS+/OyNqDu+2/0FWZQRkbvzVM9UiXlWj8OVVBhuJzSuG71ATtLPSAl2mIzgm0ZscvG8xmwSqrph0sGP+UXcYsm8htPRiPq6FprZehWwfuolUFdjLaGjwval/bNcrm3bENrI4sKTJK5oz1Lqut+1eccTaiGARo6kvUGFcCZbjh6SX+vt/PUF39PxZkBDZEd85wqMRvLCp4zjyLDMVVwzSVH1i3u06Vf57BPRB+VGa6dutHwAF8FFK2vr/UF1sDqBB5LMJ6D4l55s0ZlPbf+jJspKfNVmonoIMxAX8p2LMdSK2s6IgjCn3R5iquHJTifDY0MltXfLYL0TSlqijM8fiCxYB0v4T9zGNGZl+mCjkug+2vHPF7T5eE3IX9dlSyuPydMka60pzabCdvUsK9LcxNR7Fi9gkxGqgXu0SPJcUe7jq9HQqcI90PCNuOEeeEw7FBx4g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB5419.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(18002099003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UkZ8yxY7sRmhbQPlpINC1FYld791sfEp3POobzfMMxOvCu6R1UIZ4VYUoUt7?=
 =?us-ascii?Q?aioue1VwgA6oBqJMkvC2lUsuYbcPZ0yJMSYImURNJuIonFDnLhuDjMe7C/kH?=
 =?us-ascii?Q?bR099TEP1TitVaJ5fqCPVc5PgqCH9qrUkl0DGK9Kzs5PgPjlRVbf4df6OYkU?=
 =?us-ascii?Q?RKdir3fw/ph6Z8D4juO2BHfRu0/gyd7JvXPnL9OWCKfo1n2PGn2mUqBcbe9N?=
 =?us-ascii?Q?NJnd2Y1ziTGuCkdJf+UaixMtEn5cwLc7JpHjMEGSEg7GRKAk1K6wFeouMcrz?=
 =?us-ascii?Q?K5oOZhec5kqctVRwP1tLTPe4iLoXTrYJJ+vc5ZEZdX6QWspR3u0PWviXfNlM?=
 =?us-ascii?Q?uj3FaANxQI4ju6RLpgEGVrQtYlbmvewjxtoulaE6ZjDg/4nWSwF5NJKa/A4b?=
 =?us-ascii?Q?gWEH9Q/kKwFm7fmysJbTvxCQCeHRrPOBMsK2FF795Y0Htwvbsi7kcyC7whol?=
 =?us-ascii?Q?9P7LGxmRJ0Tl5XPxDYy9zBVlCdoUpuQ4k3McOKyvhekDOKvlyhSlZvbfrjiU?=
 =?us-ascii?Q?w5wzLg77jp2oJhP6Rx1O7OvveE5FwOKr9T09x63wK4YNXNRA5R0WA+bCyfX/?=
 =?us-ascii?Q?DKhkpVhKZ87AR+Jfzapb/gPZkHR5cJeEnGeAtii4HZDJWjJJyQ37afPJJFUL?=
 =?us-ascii?Q?zvgjBy+mFTKMEilQCtzRTBqNX2mgt723SN2fswTokUaT012JJSrmvAkLI6sn?=
 =?us-ascii?Q?fppIMWo+EORlLWM6nINVIuWrYhim/c7ofyRW3ceZjZAHcKYJxdV6kwXOKlLz?=
 =?us-ascii?Q?yKrZwy7UVKoREX4nts9KzUFDVr5tXL0EIs4brrAePJ0Lo7o1DaVIfL3+xLIu?=
 =?us-ascii?Q?6igcveY80rWLmAvkOHajMQOeDXUvEAoixgY3ev+RWPyfPHY+7Qlug/YFBYRY?=
 =?us-ascii?Q?d4X69oz/e1fstsVrBB4DAysD2NhmVIVqpRW6ZihlcC0mtti9D/KBXu+exJ22?=
 =?us-ascii?Q?vP1kZcH0xiddubQkGrJB/E96b8J7N0G3FpAyn8Vvd5TQyeIAg/W1MKWFIOhJ?=
 =?us-ascii?Q?1We+nIWiKajCIaBJATfIo0+vFTGsNNI5o+GsjIrTI00R2r3zeJJQNO2DBHcZ?=
 =?us-ascii?Q?RrStBFjDzL7N5nxOVDEkP6qG3oiPWyWfECVW4RuvgM+iOLo5Yf4hYOnH/kH2?=
 =?us-ascii?Q?6DYYGiUm7+ymnbIuVNau6kRBUkPf0gkpDWY0u7tt2I0MTTjxSVAGk7dV/jTG?=
 =?us-ascii?Q?ybfQRZCHNNkM8NC1Q5zsZz0Q+vVUE1t4Uy3x78bglwfHem2Z1JccFrdHPJUl?=
 =?us-ascii?Q?OhLtQC/5TNFR9aFQldwaFu475bTvQd4yZGjDUh5v5M+m2t/G8AV4+HqJCJFC?=
 =?us-ascii?Q?4dhgB5DubQMCeIO+2y3DyLVWdzDn6UMVsoNfWIB6NbUgnZkYJJ+3UYpb2gH7?=
 =?us-ascii?Q?5R8gCMLtGrzouyQx7dCODlyPHIPsNhcE7jc5gdBVGtaW7XGArJftgf1u0oXj?=
 =?us-ascii?Q?XCo3Hv4EhT+8aNSD8ZRIDZ0VS2pzPp6Pd7BmfLAtbCDDfdH2buWLzVXo8x05?=
 =?us-ascii?Q?NzUINtpFUD0ZyubJNSXu2iIZJiayyFVgGr1nYwVjJf07x2eo35x7exaGclBD?=
 =?us-ascii?Q?hNj0n0LeM6XWLLoUP8niQsEb6+GLKQNhx5kebJf8ietZh3XWZ7QCmSHUiQmO?=
 =?us-ascii?Q?wyMs1FvdzXXGySwlAK3S4d9Lw6CLAK23WHJEvlVseP+35YBd8A1a3j0K63kw?=
 =?us-ascii?Q?T1CnXSSRQ1V2UVeZ9bLCWdyUV/ri2NFlxBNAPvHeWTrHDNfOuEEuVH8dgWqh?=
 =?us-ascii?Q?47WG3aTwhAhQSqBFMN19CDsUC90wy7qK0xgmuPZjSa1T+I41bNxrOBNXiLGN?=
X-MS-Exchange-AntiSpam-MessageData-1: RL6HJT5HE/zCzWwjU+rLfA4w8mBrzXvrLJs=
X-OriginatorOrg: espressif.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b46162a-17ac-424d-6c10-08ded7a6a2d3
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB5419.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 19:26:23.1401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5faf27fd-3557-4294-9545-8ea74a409f39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYVgkLqJrIWtQC+vci+BYjtXMcG+57VhctN43jPLfDHZunMq3Mtqhn+B/SwDOECqvHCX9J9K0VqQCLWmCEZVZAK3KI6gbF01NG0EzczQ8DA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR04MB9515
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 19:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240010

opensbi_1.8.1.bb passes ELFFLAGS=3D"${LDFLAGS}" via EXTRA_OEMAKE. Being a
make command-line assignment, it overrides OpenSBI's in-Makefile
"ELFFLAGS +=3D" and drops the mandatory firmware link flags:

  -Wl,--gc-sections
  -Wl,--exclude-libs,ALL
  -Wl,--build-id=3Dnone
  -Wl,--no-dynamic-linker -Wl,-pie

Losing --gc-sections retains unused fdt_*/atomic_* code and grows .text;
losing -pie/--no-dynamic-linker drops the M-mode firmware hardening.

The distro LDFLAGS were not reaching the link regardless: OpenSBI
rebuilds CC from CROSS_COMPILE (Makefile: CC =3D $(CROSS_COMPILE)gcc), so
oe's CC and its TARGET_CC_ARCH +=3D "${LDFLAGS}" do not apply, and passing
them via ELFFLAGS was the only path in. They are also dynamic-linking
flags with no role in bare-metal firmware, so drop the override;
REPRODUCIBLE=3Dy and CROSS_COMPILE stay.

Removing it re-exposes an ldflags QA warning that the injected
--hash-style=3Dgnu had been satisfying. These firmware ELFs are bare-metal
M-mode binaries (--build-id=3Dnone, no dynamic linker) that legitimately
carry no GNU_HASH, so add INSANE_SKIP +=3D "ldflags", as linux-firmware
does.

Tested on oe-core master (DISTRO=3Dnodistro, MACHINE=3Dqemuriscv64) via the
oe-nodistro-master bitbake-setup config:

  bitbake opensbi
  grep -c gc-sections .../opensbi/*/temp/log.do_compile   # 0 -> 4

Before, the fw_jump.elf link carries only the LDFLAGS content (-Wl,-O1,
--hash-style=3Dgnu, --as-needed, -z relro/now) with OpenSBI's flags absent,
and do_package_qa reports ldflags errors on all three firmware ELFs.
After, the link carries OpenSBI's flags (-Wl,--gc-sections,
--exclude-libs,ALL, --build-id=3Dnone, --no-dynamic-linker, -pie) and QA
passes. On a single-SoC defconfig, restoring --gc-sections roughly
halves fw_jump.bin.

Fixes: 9f95660886db ("opensbi: Pass CROSS_COMPILE and REPRODUCIBLE flags")

AI-Generated: Uses Cursor

Signed-off-by: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
---
 meta/recipes-bsp/opensbi/opensbi_1.8.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recipes-bsp/o=
pensbi/opensbi_1.8.1.bb
index 0a9652c283..255bab2b58 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
@@ -16,7 +16,7 @@ TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmware/=
"
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
 RISCV_SBI_FW_TEXT_START ??=3D "0x80000000"
-EXTRA_OEMAKE +=3D "REPRODUCIBLE=3Dy CROSS_COMPILE=3D${HOST_PREFIX} ELFFLAG=
S=3D"${LDFLAGS}" PLATFORM=3D${RISCV_SBI_PLAT} I=3D${D} FW_TEXT_START=3D${RI=
SCV_SBI_FW_TEXT_START}"
+EXTRA_OEMAKE +=3D "REPRODUCIBLE=3Dy CROSS_COMPILE=3D${HOST_PREFIX} PLATFOR=
M=3D${RISCV_SBI_PLAT} I=3D${D} FW_TEXT_START=3D${RISCV_SBI_FW_TEXT_START}"
 EXTRA_OEMAKE:append:toolchain-clang =3D " LLVM=3Dy"
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE:append =3D " ${@riscv_get_extra_oemake_image(d)}"
@@ -50,4 +50,8 @@ FILES:${PN} +=3D "/share/opensbi/*/${RISCV_SBI_PLAT}/firm=
ware/fw_jump.*"
 FILES:${PN} +=3D "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*=
"
 FILES:${PN} +=3D "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*=
"
=20
+# OpenSBI firmware ELFs are bare-metal M-mode binaries (--build-id=3Dnone,
+# no dynamic linker) and intentionally do not carry GNU_HASH.
+INSANE_SKIP +=3D "ldflags"
+
 COMPATIBLE_HOST =3D "(riscv64|riscv32).*"


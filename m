Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D829C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 20:36:22 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com (TYDPR03CU002.outbound.protection.outlook.com [52.101.127.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52187.1782931092335876288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 11:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@espressifsystems.onmicrosoft.com header.s=selector1-espressifsystems-onmicrosoft-com header.b=UoeNQDX4;
 spf=pass (domain: espressif.com, ip: 52.101.127.90, mailfrom: gustavo.nihei@espressif.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOskzJMeTg6le3otXP/of09i3s/4BQvS4aqGph96ty0Nbmrtxewb/R+Q6JTjf7K6+0CxuriuOO9pvLt7ircH3qX2hQp8Htn5mwCFl/iC8ZZdMNmMXM3U4ktMbzhlYEPk+pSJFPtXkrFsWLhQDZgIb+LBBXgdDOfG/jPq+9hxUP6Xtb3+pitzrm/w8mEOqW9bg+WHBkjaGtMiYfi7nbflokR4gD9/kgR2vqQB4z6PbmhJkkJ5zxTWE//FZNwAB0W5ga+ziO2HuLvb9//NbTWSdxvuZGeQ5SWImX8/6yGzO+naP6xXtmZ6uVLcKpmdar822jAAuM8bUYVizKfwUr/VlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lYMb/DdmLabpI4FeoAnk0WzoVI9sc5rVvSjjxSFs0Y=;
 b=LPAviRSDLd89N+edib3jaZp/KhxiLyQ7PRBcQI9AfVztTlJQGBwTyqoj/HRJ0PvpM6y4wPcQN3YCbPuFu9sTWbWVRq+EOuzgJktwWVYs7gAg5wHxvzxHVK18xo4L8d6cdIWFBSocPaRRQhAzQuWmCQwhxPwQ9UEDU7VQJXF+D+FpUn5G8smjDZIgVIQoPjJoURBma43IYrd5gzjgcm/gab1aXFpB2mzsTy34mSSMf0RnTiYMmjhetnbmHXwZmF5fuhGyHyMpP2ZvP+ztRszp3NW9GxdKmXR3VC+uqFJ01gq8NXAZ9VlHYfqjj99O15ZRXvOpUgaA/jWlZ3aiS8jtUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=espressif.com; dmarc=pass action=none
 header.from=espressif.com; dkim=pass header.d=espressif.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=espressifsystems.onmicrosoft.com;
 s=selector1-espressifsystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lYMb/DdmLabpI4FeoAnk0WzoVI9sc5rVvSjjxSFs0Y=;
 b=UoeNQDX4p+Ui6Sq8IA0v1LMiIcIoPvKf3XwMIqmIHHAyHk49qprs6l7ZBP4GoceoNI+vBWTkT0O9Dsu41Eyg9mLq71uk3GYoT2YJt/67K3QOodKU44m/yL2zIH7m1WvM0WLC2QSP7mWtIkzlvGJDKsOnalsedYa8Gzk9UWj0iLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=espressif.com;
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com (2603:1096:301:bb::12)
 by PUZPR04MB6159.apcprd04.prod.outlook.com (2603:1096:301:e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 1 Jul 2026
 18:38:06 +0000
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e]) by PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 18:38:06 +0000
From: gustavo.nihei@espressif.com
To: openembedded-core@lists.openembedded.org
CC: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
Subject: [PATCH] opensbi: don't override ELFFLAGS, silence ldflags QA for bare-metal ELFs
Date: Wed,  1 Jul 2026 15:37:45 -0300
Message-ID: <20260701183745.3112608-1-gustavo.nihei@espressif.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: CP9P284CA0001.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:371::11) To TYZPR04MB5414.apcprd04.prod.outlook.com
 (2603:1096:400:12e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR04MB5419:EE_|PUZPR04MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: bc786452-4a7f-41c8-7b0b-08ded79fe3f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|10070799003|376014|3023799007|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9mxXjsXl8wNzC4dJzj/EICF0Tyr5NVO34SwF6Z75BeCfhzgFPQ3fNbcbtQE0HRShieKB/1UboztGduvReXcsmA2wTMNbVg+waRJOkDiZDtFGlAPRQOcnoCfngQct0egLdR1+zB0/8f9zslkQmshSgTkwSLoEHWo/LU3nch8aRyKTic31cT/ggVJJet3hKlgQBD/2zOYDGquIFcGkcTYFdSG2Ni7B5QTlWWmPr34jmacwingz2AwC7mdQ7k9JnAoDAIVJa6PjyBPgxFKsb288o8Wu5IKnd5Fs3oDbVrhwZFDz1mnv4IJSchG4ONbaqVP8PJ6d+JZ88HOvuUpNi3K19qCfQICuFOLSCKnLQ+6AY8nywEhbTZtXXc536uIGnm1dMWYvr7juZGFLwqSz2qEs4HJ6LX6IegF0ryiLX8TOUJh/WS7VgECnHD4bVHj9+7UWbo3pTwYUraQ9V0/BKDiajKZzmrFBYXgqdDdaFwK6j0rRw+kXq5JpvQiN8ONiSWCQsm5l8411+2/qWsq2KfSDXnyx8R0dmQLq7FuxRG4xn+6PILgDYRA9F53Jypasws7r7Ygq5LwAZg+OnMr9fa5TY5skz2Jku2tYp4bJmXgKIzt/nYsyQzkmpz1iqcxsiJ690w8a8RwdQPODN5JHkDN//WLrQh6aUrnrb/PsME3+2VI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB5419.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(10070799003)(376014)(3023799007)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/rGpHACD1kS+N93kjscpWXPGkgKCumX/MPzNPRjePFFqF9TD8zmmzuZQzmhC?=
 =?us-ascii?Q?hv2TpGozei19fMzHFcTb2cl2GkFYZ5O4TOMkfE570paPbU6udoyRxA6bNCFc?=
 =?us-ascii?Q?vctSEk2WVpbiAy8TWnmso7fTU+i5vXHC9b3V7DFBLizwqvoX+GoTvsTiLcAq?=
 =?us-ascii?Q?BpRYQxVdksmmVBkiP2rB7fQvbA+mKwNJ/ec008yMYyY2sDjqH402ZuVrKhUs?=
 =?us-ascii?Q?DeK7kuLlLTj2Q6iBVbDLgWcJxptGW8HmiLJUES5V6nZiu8gcybG49mafbapa?=
 =?us-ascii?Q?51l9h4tuUXa3Af9CdnJQKZYEBhgTenCEn0h6q2OgtsIYffwW9r9wPyzIwrTp?=
 =?us-ascii?Q?oZPFM6kUSERxXmJXQ49ZUOskkeBKs6VBlymC5E/U3Ena670iscwt0Sk7Y59G?=
 =?us-ascii?Q?FE1AYic0MptVozSbWj3CPLdxwvMfY6+3wJk0D3JzYjdQbp9pSQgZF/fhXzB5?=
 =?us-ascii?Q?mJsHTI4taZNiqaPjbo+AkkeBm0oXgZXqCfYP0ubmXDEKKQqFzGCY+caEqGrR?=
 =?us-ascii?Q?e51DM9tC0WK5nbLhhht2GAZWZhJUDHlfOn1FgMq2z+H7k1LwQBaSDIa07GH+?=
 =?us-ascii?Q?/B2nlr+176fJ9iBbenw7IaTFJ9tYHzk5vYJ/pqF1/gV8n1Ai3lUqZJiOuyjj?=
 =?us-ascii?Q?nobUC42Kg/sVCteqbNt3OHtNLLGzXggDLjJmOMx9w+rHSb2tvnaVKlLrDhqw?=
 =?us-ascii?Q?T/9if4YSBZc+falOmFC5EakNiGYTjDScDI0OKhc5VOaukfI4LO9u3G7mzoyR?=
 =?us-ascii?Q?DRz9Zauhxy1scrAnvZn21WY/jy8IJOMilBbUF0iNGuPfW75B07zvx+nu1P/l?=
 =?us-ascii?Q?e9Gt/+6XbjmJ/loYbm1PdBmtec70HMIC+pg+x91f0qZwn6IfIqhOq2YZ7wet?=
 =?us-ascii?Q?uwQjg15+FdjeK8EwvH0Pf57mTRiyFGfElfwpBzpB3HVtxr8a9aZt0YZJipa7?=
 =?us-ascii?Q?EAnZeAPUemWarLnxI9eJVCJFE/DN65iKwOCwrJA2X2OCwhH5E9wyM+FETsKx?=
 =?us-ascii?Q?C1Hpfh0EKydj1Y9UUS8BwTfpNiPPYF13PKeDotQFbsbIZM0PPF1UGSaJbrrz?=
 =?us-ascii?Q?8c9Kbs0EAVxDmck9vqpyCk0fdkDGo4UjEATHijXkNqegKi6lv+XhI1RLjSoJ?=
 =?us-ascii?Q?yfmQm/E0ahclN1zvnaianMJjcxWG5mv288CeTj62B+0wsVyMwaPcpbOg6D9n?=
 =?us-ascii?Q?+ebL9H/vkyKMHYoLC50SlxyF9LQutV84lOki3Ebb1oSeYul8vtMFn3d4WuQ6?=
 =?us-ascii?Q?eu2SlrBkGkII6vjRZvWIh8Jp66YwtJ2NU0tphzxhWoi1WhFbij3Wsws401gU?=
 =?us-ascii?Q?Y6+jg8yaLRyznpLCYs7pgG/KFtnY4S3q61n0FGff3AlKyF2zNiGJ29P2k+dn?=
 =?us-ascii?Q?UeK5sTrqLckHN0TPzaSGkmnlmYPgZi8ssxnwS+WjoCjm7fDcsc+9wZcRJbQ2?=
 =?us-ascii?Q?Cmq9fNQ0FVMelPeDkFIX86rJwCdPgMY9Stu5+94JIt3t25041TDiBzBDozGf?=
 =?us-ascii?Q?whyW4jSkMS3YnaKZGpXt9FM0eoVRAMnyuFN446fPr9pCy0OYlknNCpHrijgo?=
 =?us-ascii?Q?g0YuQX7MtFklML25Jh/RGz71CJf28oc0ipcQoz5kZXLTvewa3jY1/Jy4dzhs?=
 =?us-ascii?Q?sKdS8HyVbg+3k5mG7ztSV2Wn55Uwf3rSg9AUteisaskbE6oPxbXiBBaG3Qx9?=
 =?us-ascii?Q?4ZDhIS+8wOhx/cvXq5znQkhUXWSrgUY6lhR2PU0B4jCRv2Kky547AtFw4w0x?=
 =?us-ascii?Q?k6U7hYN17ZW0a6l72CuY4QkbXxbWdXB32XrZ0RM3x1AERsiIOHfvRCWh/G1P?=
X-MS-Exchange-AntiSpam-MessageData-1: Bl6tIjInE565MvQrJdhMm8O5bKKkcW6HeMc=
X-OriginatorOrg: espressif.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc786452-4a7f-41c8-7b0b-08ded79fe3f7
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB5414.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 18:38:06.4751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5faf27fd-3557-4294-9545-8ea74a409f39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QgtIbtMHfH4uupdjofX3JDxFjXvG/d9CQ7w8R+Rm2V6LnU/ovXr5Xdh+vMGa5CVRQKvJivYPbJgzmcSc65CPi0vA5+7+NZ8KDb197dpax8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6159
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 20:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240011

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


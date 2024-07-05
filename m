Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB183C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 09:40:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.123])
 by mx.groups.io with SMTP id smtpd.web10.13486.1720172401857871854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 02:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=zkhKQ5TQ;
 spf=pass (domain: navimatix.de, ip: 40.107.22.123, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWzi4yO0uI07vz383w311iz8lohv+qAFrq5tEndvcXmsOs358WKVuMnbBV9uegKTQR6Tfj90UPrzTzV4+MOHu4+aiQDBRkGd840HT7IaceMJpV/5yspuGaTevE5beP8ntwJ7kvOs/sf/oBeMZC8HT3QIKpX4KHFXMDhqwGtmHhiL7gV5NYalc2sk5D/p8SxsOev60aC7SoKFLUkWjpbaKujfrpTZZxc/2Ve1QHdDMGmkmVvIlixS1riIih1Gfo+V7Ybf8i5W4eFPTPL97rFl3sLWCuu82FqIEOsOHogg2v5iUUp2lhi97hd4tWGgwyLzmYHjxMMvTtTXB78mrUsbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miMhYgvnPjsAtzif6r5DiH2t/tvFDcceel8ootqVeRM=;
 b=M1eq/mjAGhn/cpe/XGO9jO/mQDz6a9sFoXu3LL1oY3XWH4M6y2PqL6e2W2oitR3VjEmcLhbVdF4q8hzXmOKqvIQQPU0Ke/8FzrXtUW+d1N+lWvkLDo/AegLaomiaLSV5dh/jN3e4N5ELPdqPMorrYP+Bi4aRcWvlmugznDdCYWCEN6PlFfE/9abdoVwmASC+mVJtoFe4huSFjBjuC8ZSn0Cy1ewHUUBKzfaDHWPMf/sVkeGbkcP8MOCF4z286YWTH9c1CYfxlMnjM8tc2pT33bfr3YjZlaxeYWGgNKEG8NCeHO3NiaTZ3v5Qdp2MguncwrF7QwIds/ZZESGoyRzNHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miMhYgvnPjsAtzif6r5DiH2t/tvFDcceel8ootqVeRM=;
 b=zkhKQ5TQ9ykPM4rbypO9IczBTXgx/EWoXVzwPnimn8MaUzGDL6kH4+F9xW7EhBBjSUe686Ymy9vU6KmQUtoFuP8BAclsJkvMeTnxx6HPe3XnWhNGJAb//r+E6ZrHC/ew5Z5iJjYrTaIOlNTs5BRMFRbhOUyLb4EvLRC1F2WmhUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DB9PR01MB10428.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:307::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Fri, 5 Jul
 2024 09:39:59 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7741.029; Fri, 5 Jul 2024
 09:39:58 +0000
From: joerg.sommer@navimatix.de
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH v2] u-boot: set B = WORKDIR/build
Date: Fri,  5 Jul 2024 11:39:50 +0200
Message-ID: <4641ec5ba60aa447167bbee07fac87a3f6da3aea.1720172390.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8ebaf41b89622ecc6b27b140cb8264bf50d15f68.camel@linuxfoundation.org>
References: <8ebaf41b89622ecc6b27b140cb8264bf50d15f68.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::9) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DB9PR01MB10428:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed7f61e-0e48-4816-a5f0-08dc9cd66f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lps1egnvmuHNPR7BXH85cjVxUfadBwXgGgGl5jjs+H76Zwf/zSrRU9e6yPHz?=
 =?us-ascii?Q?oEuSruZztlSQvVRpjckMulztfys+Tze4sgBtNv91Ek63MB+Z7JEuW4pQl+yB?=
 =?us-ascii?Q?BK0CGgZGoGLZ9VW9VScVqh1H0oplFD/r2VmB1yYlJ9edqmbxuQsrz40snvOH?=
 =?us-ascii?Q?F8pWJlq9XNVi317GDjQEw0+q1qvJNToX+WmiBEDOWcH0AlWmyxm6Q60d92Ez?=
 =?us-ascii?Q?t4tt/9zBy5yS7Q9EeCMd8x+xJSTIP8xiwr01JMOKr0ifpE/a8jCmQB9ObdMH?=
 =?us-ascii?Q?+J7OctHLDvMaKW/x/v4zu5sJyobeFpj02Fq+n8KiFIVtqHuxeidrs3sfmlZ0?=
 =?us-ascii?Q?qauuFXdqTu6F7W2SObu4sQvjm9p0xEThqmKZ/KZelCEZu+eqKcC/lRjxdSfe?=
 =?us-ascii?Q?LKTpxNkLu1/zN8/vXTfJYI2Zudfe0yOhFk6XBOr8WVp7WxjnHrpmAW1UdmHe?=
 =?us-ascii?Q?klcWehvv6ShCsWh6khxSBVoejYja9hg7pNapqoWIkP4L0VR4i7bBUBhclZxu?=
 =?us-ascii?Q?XAMaihovfnXafdbkk62tJ/3lXAKYy+SY19kzhIhxmaT/JPb6s+HuH1BbZFcK?=
 =?us-ascii?Q?1lG/dLeZQjZeO4BghXzwj1N+76AoP6BWljBip3xtmax/IOSCcGh1+OS6Le6/?=
 =?us-ascii?Q?nke2h5nmCLETd/vrufWqOSs1te+YT2BGbzkBgXyIWjnN2zioMCKPGc6T0sjn?=
 =?us-ascii?Q?WXBzfLkrAeaIql5k2JEF4iTmDjHrtYyJ8ns12TPTG9utA6t16m8zg1K4Pj67?=
 =?us-ascii?Q?6GPJ0KldhfJ0wDxiEqnWWNZkkNnEOuKcoF+xTpRY8ScfWO+6/cLTAn6sohOo?=
 =?us-ascii?Q?S5CQcb/l0M5aFxUOJae94oEHJCrazWDOjs09Q+l7Po+NmEya/Zp9z0g5r/Fn?=
 =?us-ascii?Q?aT0guOA2dOMWZFBsG98b8CZhkP3+E9wa9NoHKEy51Ev3c2KxCJCQKMJq1FOD?=
 =?us-ascii?Q?gD3n2lQs74RspqixOn9YMUkh19CWs6HVvv48adWO7Ua31ggO+wd229riAxEE?=
 =?us-ascii?Q?BB7rMD1nm5LcgOtDfjJoxHN+/UMHwBBxNPVHv3lV5C/yXdrjg2xoTCcWmEoM?=
 =?us-ascii?Q?qMCIM+jmoAi/e3XCK/QZof+ZvtZ120LKCZyuyv4m8oD02DH77XELIpHCguH8?=
 =?us-ascii?Q?ChOjBowCfacULhyfigbc5MHPK7cgk/XFPunZ92sE+xoxis7mCcy6Qz56n1dB?=
 =?us-ascii?Q?qvd6d5QL3YtIxcdHVTpjPpkwsQkY/ELRSp9judfpxBvQuFVbs/bY2oA5vOXB?=
 =?us-ascii?Q?rVDJqVYE6EMWS9CsRxqXBM8wwv5pXoXDbHYl7iyvU6Y0Wg1BcqqXUFzwSZCg?=
 =?us-ascii?Q?LydlOf70EIkfpFf6bJ5D3uHkaA1PdK0Ghtz7ssnQX6YOg27p6IIB9Dkupl0C?=
 =?us-ascii?Q?XNZxcegNnVNxMyiWggLeTtPRIqM99rpEB4XuHS5URi/gV4PNPg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7VmbOzEWkf3iWALYyg64UD6ZHMUP2tHnOKOgfKgyO5YlmqMxWiiqqotMY67F?=
 =?us-ascii?Q?vFMfZr4AKL3wvZtkOvPaZw9ooIgptWEi+4/yEPhdtBTkVOtMF9GupsfCAaff?=
 =?us-ascii?Q?T6UEnixGw6l2Dt3rNHCUu3j+K9RPRBHnzYWjvzJTcnt++XLO4mznJ3M4Mf4r?=
 =?us-ascii?Q?0iH4YsOO/W7Wkc+GXtLrk6LDbrHnFXcF4t1De1J9BdvMSl99HKZDSf0Z4EGa?=
 =?us-ascii?Q?A0nhnWxMEVs+eQ/P3UZPuLfcsi5xSzyFMKICJ3s3O6OYNt9H7m+YOhm2uCTg?=
 =?us-ascii?Q?8tGPRG9Z4IW0vESCoUqFhQEyaDqhWEfhNoQKRMqku8Zm4TjoWxtZOJ+8XcAZ?=
 =?us-ascii?Q?jaSEpPS2dCcDl7VfERkH/JlP932vokpyBJs4DWB/5NPZyaGjPr8HeGlApKm/?=
 =?us-ascii?Q?viyL67aQ5Dqbfb3vF5XARxWeE6jskNQ9VUR2bhGrwWoQtHLXrem2cRSgpf8f?=
 =?us-ascii?Q?mCke6vfZQluB7lD9VF87ryosR+qtvu2HTIAVLY7JcHfjeWj4R/uboIYEGO0v?=
 =?us-ascii?Q?TURPigqxis5sEFaMgEgI3efYR+Q+pSycazNtab5FmP8aSB8+9fzNpbQ/QMy+?=
 =?us-ascii?Q?aZomP7tzhMB6IDPymwNMya0WDmfGmuEzGdRC4amPWXKO6lh7iGN0tH13HRXt?=
 =?us-ascii?Q?Z7B/b1OLlWlgJL5+NGxR4KUBfSC6bTuyrHyTD6rLHMvQgMDIk77g4EySp+9D?=
 =?us-ascii?Q?uUgkHUZxVBpcaQGCvIjKl8jR2M+Roc1LYQ+1M41Wev96ck6RDFtowZG8ZlnT?=
 =?us-ascii?Q?5MLl4P0qOKWHKxbJEGroCHe7jPlKD1Ey2Vt3x+gkYp5KXSMaqnab4G3YVxOq?=
 =?us-ascii?Q?5n+96ArPJUtMqkyjsMabCIybMKVBjRKrsGjP54T/s8jHqugisiT8bscjvPax?=
 =?us-ascii?Q?do33iNNa2X8SH851UasmvnpwGBCGbnFCnzfGMGSexFjEApRDTFltSbxwxEJL?=
 =?us-ascii?Q?jJ7+beqT7S6FQaWLRa0SgX6sgvqFGUngHZ2OMkILD8iFUjxpaz1aBGpikrdK?=
 =?us-ascii?Q?ivKeEcf8BcDvH0k4KJ3VLENuTV2CdAt1JkaaSA/tD2hi3eVAT+mM5avP/h8Z?=
 =?us-ascii?Q?3AZNnSVoQ0kw4GfIEdD3HCTrqp7cA2iFemdlIiNCfMa/sBbPcNxE7hNxCCPb?=
 =?us-ascii?Q?N30aOU4PnaKK5hGo73FEqiItfDDgZSBsOSYCr1mRIk67w6F1pSMN9CUwEozR?=
 =?us-ascii?Q?ij9FjB7AMF91jGS9zBPdJq6NyRq+GuTKsPpqewHtEK7Eh06qRa1dhB6RQSrp?=
 =?us-ascii?Q?JgH6c2nY0xcdsP8V/9eSxXGuxylqsqejjqAyqLAz9qB9DJ1mma7Q8Hqe460b?=
 =?us-ascii?Q?7AXdiFDfFb4nFyWYfEg5DxuqDHW0IXHJ000UP/0xgUnec8YcUrsy0JHqnK7K?=
 =?us-ascii?Q?ja8nnkowx4VAhATNzyUaA75B0nZ0QDrYV2bjZlxIuiLI53ex5iZTk8Uetlea?=
 =?us-ascii?Q?KUxw3ohWVqmDj5EEyfAI/0b5oihU/SOfShCyLHVNBw2LP5fknoFgMEt5MZP8?=
 =?us-ascii?Q?8TQNbFi9G3C1vHodLpCARFuOZvfbXNCue5kPTrtWDGYgbSQFGD51zLThBtOI?=
 =?us-ascii?Q?/EKfbBEvD3AiXZUmd2I0qCkX8qqTZY08gt9iHX6834OjOUJxN9teokrT5ahB?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed7f61e-0e48-4816-a5f0-08dc9cd66f8c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:39:58.9076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Oj5cZzFL0JvbDTQKfGiXzkn3d4iQWuRQaNj7vt+qKOXbNGjzQa0PiBj6CnMPRpuGUUZ784Zq15y3xoqD21PD9kzk631LLQBLwkpQvEY7cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB10428
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 09:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201594

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The build of u-boot fails, if `UBOOT_MACHINE` (instead of `UBOOT_CONFIG`) i=
s
used. U-boot doe not like the setting of `O=3D$S` in the make call, which
happen when `UBOOT_MACHINE` is used. Therefore, use a dedicated build
directory to circumvent the conflict `$B =3D=3D $S`.

Yocto build message:

```
| if [ -f /build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-gnueabi=
/u-boot-variscite/1.0-r0.fwkos.6/git/.config -o -d /build/tmp/work/da850_fu=
nkwerk_rp1_eval_board-fwkos-linux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/g=
it/include/config ]; then \
| 	echo >&2 "  /build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-gn=
ueabi/u-boot-variscite/1.0-r0.fwkos.6/git is not clean, please run 'make mr=
proper'"; \
| 	echo >&2 "  in the '/build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-=
linux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git' directory.";\
| 	/bin/false; \
| fi;
|   /build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-gnueabi/u-boo=
t-variscite/1.0-r0.fwkos.6/git is not clean, please run 'make mrproper'
|   in the '/build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-gnuea=
bi/u-boot-variscite/1.0-r0.fwkos.6/git' directory.
| make[1]: Leaving directory '/build/tmp/work/da850_funkwerk_rp1_eval_board=
-fwkos-linux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git'
| make[1]: *** [/build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-g=
nueabi/u-boot-variscite/1.0-r0.fwkos.6/git/Makefile:1928: prepare3] Error 1
| ERROR: oe_runmake failed
```

U-Boot test:

```
% make O=3D$PWD all
make[1]: Entering directory '/home/joerg/git/u-boot'
  UPD     include/generated/timestamp_autogenerated.h
  Using /home/joerg/git/u-boot as source for U-Boot
  /home/joerg/git/u-boot is not clean, please run 'make mrproper'
  in the '/home/joerg/git/u-boot' directory.
make[1]: *** [/home/joerg/git/u-boot/Makefile:1928: prepare3] Error 1
make[1]: Leaving directory '/home/joerg/git/u-boot'
make: *** [Makefile:177: sub-make] Error 2
```

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index fc36c21ec2..bdc4b60e43 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -9,6 +9,8 @@ inherit uboot-config uboot-extlinux-config uboot-sign deplo=
y python3native kerne
=20
 DEPENDS +=3D "swig-native"
=20
+B =3D "${WORKDIR}/build"
+
 EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_PREFIX}g=
cc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}" V=3D1'
 EXTRA_OEMAKE +=3D 'HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"=
'
 EXTRA_OEMAKE +=3D 'STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} STAGING_LIBDI=
R=3D${STAGING_LIBDIR_NATIVE}'
--=20
2.34.1



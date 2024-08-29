Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA37C83F15
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 12:42:44 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.101])
 by mx.groups.io with SMTP id smtpd.web11.12934.1724935354082155966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 05:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=CUowgbf+;
 spf=pass (domain: witekio.com, ip: 40.107.241.101, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9uFa6FWKaIKK+dhEUmKtwbW2Caa3RmUKN8Nlu1Hpdk4wTKl8PQyxRfqSFcIDd2Wuc2XF6vfaHURNg7K0DQYcdH8GcURYjBu92YUX5JUb4CJAMUYLc+MV7JqT3AwR3qWj9EI0kzzkTiOsL3pWEoryHpWcyG/crcp82R/R5OQZFkn2GocQnIJGw1X7QWhjrR+VnyTa5GS3UeEGd7uUYxMVxt7urQlpx2bQ1W0yDw3fIYbaeR08DJnB+ZG7fesc+8AVFbb6yEE79Z+zD7RJXjzKB+s6DiVJaionytnbBqP13GbLe1cIxgqcSVwCHzT2YY/Ux2cZ5vLmAdcbLO971ucxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fg+MN33t2rLfKx8HltQscQHk0TQDQ81QIzCtZ34e8MM=;
 b=E0f8RZfRqdF1dXNpjpt8yUGrCa0zydqzl4pIoebPrJ2iMMIzyxynNF7FPd/TBfCSdpGOuqF2H9HJJhf8yFA+6W8mFFYCBnLKU29K2UX0bz3OefjZVoPVtRI3rhGKkiZr/D26zlARZNCvY2j/NkbdouaFmcTwAH4wUV7QuAntHAHisKr66Z/5eCr/+YHFSfk0ki3OMimhB2Ih44Jv4wpyJOLiNSw727I/GVVEBZgoji5IiUluuPQWl5oBtZWfKvZRSOTme1ncK0qBNYlnqOgr5+MWEPxCdpGck0o3QjIKHOg7THOrJ1VTACiJPdMlmi96OXIO2R+tVxcy/a76Izl0Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg+MN33t2rLfKx8HltQscQHk0TQDQ81QIzCtZ34e8MM=;
 b=CUowgbf+alMuaxUqgIpwzteVWO/q33z1ycZtLl90Yh6ua64wffal0HCXAaSoNZz21YKRnW8pK9fbJDVoZucsn3X8B63P9B+tpZ9jRgLBqI4ern82UcKlKEb3OLPx3tvGgfnyIAuKEV+22jSVLSLAvJ4db1ry0fBjjyYi99UwSn7sANZWY869UnUNuiKkx3LfRydQdMR7TFRgZi+JA9luse5Rt3Os60fh5hqDfv9LhkpYFqIiX57AAIgOZsArdYQJtmxXx8NVNDpIv7/wKCnhjefR81KPTY3w/Ps5aPf5i0cuacUzZK/dxneLrXA+R/EFQWb2NcUasFWFUBjHXWJttg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by AS2P192MB2120.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 12:42:30 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::345f:a9e9:d884:3091]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::345f:a9e9:d884:3091%5]) with mapi id 15.20.7918.019; Thu, 29 Aug 2024
 12:42:30 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [kirkstone][PATCH] cryptodev-module: Fix build for linux 5.10.220
Date: Thu, 29 Aug 2024 14:42:21 +0200
Message-ID: <20240829124221.7430-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR3P191CA0042.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::17) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|AS2P192MB2120:EE_
X-MS-Office365-Filtering-Correlation-Id: 361f5a52-8905-43e1-8c21-08dcc8280c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ioPjPa9022Oj2xEHHm0uySjDfcnhagjNGsdeIFa+Vvnp+a9JtCBNhS+Rp6Sm?=
 =?us-ascii?Q?w9ENjPWlit0QLKauCFxbUO1VAqa4d1KH9/qr6dyummOXz5STIDuOKJzmMuwM?=
 =?us-ascii?Q?/f1uJHTS7KNPF9s/HAja8wjfj6NG+dz1CF7BMgQiCOBu6tt8FiC79AzMlQal?=
 =?us-ascii?Q?R2ippJ20toXQ+Dp0kq2hVU+orbOPFGNMiWGsn7dq4dFTjtmJ4p82X1T64ypu?=
 =?us-ascii?Q?lW+vOLSeRItbuBxoyIRJTe39dFoad3xJtnXW52WPf0AbaETZGrifneBCkxVt?=
 =?us-ascii?Q?VcuDpvuDRPX0aj+CG12zH30+8TYq4x5XwOAn8AMWiq4oDc2iZ9GAM04H6EJT?=
 =?us-ascii?Q?4EmlsAIHlURrdVvxccZe+N4pu2ZuBxwBaM65y5XF7wd4yQZkTn/kheS5XJ+J?=
 =?us-ascii?Q?eEs324mrhAr0NiAI6pG0RabPs5zrWHDoGgN5fv+3mn0NWSgnKKiYz11+LzLB?=
 =?us-ascii?Q?lrh52WipqbHmUX8uX7eDPul6gl8LfYEE3SDcGa3wNqhHu1lVpkTvnPXbggoP?=
 =?us-ascii?Q?WdNzD3AYrExeTn7hof2mtT021LTyAHab4xxQVXC+xb7qVhM3FpkTDzAwelbR?=
 =?us-ascii?Q?tmrVoKDwNq3+0X7B0V5D7ql+9AYIfaQcRHqC8erU4nX6hrmKVILknP7+DFqO?=
 =?us-ascii?Q?0WPoG7Jc1n1OiudLpnkCyPW7hlR+bMBgRzO4D5Ztfvm818A5UVNf+M9cmYfl?=
 =?us-ascii?Q?7ueTre9GFIbYYc6cZuJKZeKGHwDDFGTWjVJIm5OG99c4elpcdKcAporjwZDs?=
 =?us-ascii?Q?2o7N8gTlzK5BetrXxpZyvGkK10OtJIZwJX2amfL4/9YWAdEjTJSxbn5ekbWY?=
 =?us-ascii?Q?5pEXeMQkEmlwzFrjr5o0tLqa8vbs/jWDrVkdlfPkNMv83M2qm0ScUn6AQsVn?=
 =?us-ascii?Q?JXllS6pRc2nVa1kyGtQ62A3/f2Od4d8fNoIaqyOYHjuKCnKtu4K98gyrDD0n?=
 =?us-ascii?Q?0UB8A09NijbOb73EB5LRH8xnGB6oIbstaWYtSuoEzaU19BlqD5FLLTc7PbsS?=
 =?us-ascii?Q?6QSHyQuYVGlOdtOpPrrozNzafsGT+nq+0hiGuXRkfuR6z/f0GwF9JwanBUpU?=
 =?us-ascii?Q?C3uUP32sMXjvrb7N1lJWf8uTar46JK5OBYBIAJUfSfNXXhGeb+ytlpRk598w?=
 =?us-ascii?Q?8GXu0LHNX2Qtz9UTD6S82i69fxtLRhS2e4s+3kPG+tNM8B9YogJpgVYtSavq?=
 =?us-ascii?Q?cFSVd2j6pjjTL8vm59ttUVB9FlmvewR1RjCCFMVuzjd21k+hotx0JRa+zVyP?=
 =?us-ascii?Q?IaK4F8tKybUevVlvbkC+8DD7dwBbiCTTDP1VNabDPyY3x1jV6RCNRrLv9JvE?=
 =?us-ascii?Q?A4KVzv36YhJXPq2yES1j75oS+eKrfr2G4CwoMgBPKZzD6g1x+4ji5qW7RBgl?=
 =?us-ascii?Q?oOgNMlY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tjmKRsT1XHhv3yi/eQAfvGjNx152pfXUmwfxuToXyPz0md1ocJ13o5jR7Hul?=
 =?us-ascii?Q?8B9Uxi0mgWSATk3LrwfUuI1WPsMCQf/mbYIOqX9Lvmpq04Dj/GxZqrzalA9Q?=
 =?us-ascii?Q?ufJs4odrITpSj4BMGY9FGHt/Yns3WCfSUEBT1jsv9LdPcWuK8bJcPM9u8wjs?=
 =?us-ascii?Q?YOLfbDhg87c3fePl9aGTQnmbMYvqJ2goe/j7CYzjweR8uW9TQVbFqjuEfLFA?=
 =?us-ascii?Q?IEMWPTdFWfjyGXx7EQEZk6uXDan/NCXwgdQkHEd8u/N4ksay3G1dVuAHmqXD?=
 =?us-ascii?Q?WeAF4dtr0H1SjlmjE9oZn9Cqh5jdV9Wgf6ZfYlVSc3myyd+9RmwtlUcZMoea?=
 =?us-ascii?Q?VKYfFVWKdd3CXDFDzDtuC1yakYKOgZmlHoTC6XU3Q+SalHpBecMxmsZ+a9TW?=
 =?us-ascii?Q?3GUsVkh2zVZlLd55+GRRK/WKybpDLrgw9giev8j2D7S5ouV/9sB3n8mX6JIi?=
 =?us-ascii?Q?mSVG7k0uZB/u8WnzdTQ98OqqRSkjOnjCc3Ll81VrOyZsLtjkD060/EPT5EZS?=
 =?us-ascii?Q?XR0UD7zJZHhjbAmV6OK/3iR9tPPIRnNLhq884s8iHJtX6VOwQPs4GMGocSk4?=
 =?us-ascii?Q?T9qzXg7QrU2kwrhMx2sjpFAT2cPT+72YeHqjlVGT9wWtYUD6sH+Pf/jRDzUB?=
 =?us-ascii?Q?LP4fb4eW22JWLz+BXbAVCulQYfHMnLK9hMzd6E3CTtw4IK1qJdBJe6+SCeG9?=
 =?us-ascii?Q?mhjPOBrckfklbnmEnXbL3qX8ovK0IB4eW6mbYkuuJC7BVZd3LgMBSX91yA9S?=
 =?us-ascii?Q?mWzzo/iIdlR6x8gbGJFPnFC3KUze2FGwIsf/iQmVQ6jCYLvYS46sp3qpBfg1?=
 =?us-ascii?Q?s7m8N6oy8No9DsMjsTzUdPSpw9EbtLFyee2UWt1qZGe7l99kL9o0A9IGh0Fb?=
 =?us-ascii?Q?M/9D1rNjMP641yAau31W6mHdRv9gZEPJDW5iIPEM/EzKreZde236HYohtFJL?=
 =?us-ascii?Q?QsDk0iHgHX+f+chneXfZXu5H4BhjTr3YbIKSJoJ6VVGTvdw3DNRn6PnJZ9ZT?=
 =?us-ascii?Q?4EMgXLYwK89BTArQnPsXmUQTjF2+Fn6DZELFxl+sB/zavgZ6CUrxU2sMJ6B3?=
 =?us-ascii?Q?in5HvlX39dLkoExh+nPBifrdB9+wYmXncRhUaHfWqKCVy81Uu6fp0p/2kWQ/?=
 =?us-ascii?Q?uPApa/u9o86stFmE7gqm4WTI+jJXsMihNub5QKCTo4PXF5Ttat3Q82z1+Zmh?=
 =?us-ascii?Q?nl1X8cFe8i11trifBARdhixQIJPkaE2iY3lXZJD2ajg7BY8O2rQeyCuHLypH?=
 =?us-ascii?Q?s70Li2AonkH5O9p/Ode70Xa7zCSj1X/Swbf64J5AaX0iX2zL8BE11ToRzPaJ?=
 =?us-ascii?Q?+kJGCvW11TzW5XpGr9oiNed0OkzFmcRF35FdRozbakn1pFMN6qrz0MZPY2fk?=
 =?us-ascii?Q?8ulUwd1xMhJKwcCTffwQSGFNgD2+mCRjpJKHmpc5MacLxN970EEW12h9c0qd?=
 =?us-ascii?Q?qG8mqhveQ2/6dSoEJjVTY1xfN7icZ2+GoFvZkVqmVQ2elAv1dFpgkA4nWu9R?=
 =?us-ascii?Q?ndmqfglVSOjFs4LBwFHKaJ1BfPdrDaq7bd5N/0hpjx1LYQk+Z7IbC2jpby5x?=
 =?us-ascii?Q?QW8R3lUtNMYQWp89V9hJXP0SRPodhpcuEGCVb5Kihr57uIr1nOJ3bJ0VtmUe?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361f5a52-8905-43e1-8c21-08dcc8280c20
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:42:30.8245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPpKPYwcNS7vIEU4ov7WnbzWvPW6Ka2yR2NqtbEBnCQtPgcUx7KI25k9VSVUyw2JrHKNarb3HU4siUaGZ+uEzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P192MB2120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 12:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203919

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-lin=
ux/commit/157a624d7a892ea5fb2df4bbd4e71c008adbecb7]

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../cryptodev/cryptodev-module_1.12.bb        |  1 +
 .../0001-Fix-build-for-linux-5.10.220.patch   | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-=
linux-5.10.220.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.12.bb b/meta/=
recipes-kernel/cryptodev/cryptodev-module_1.12.bb
index 5192cf03ed..71d7b0ede3 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.12.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.12.bb
@@ -8,6 +8,7 @@ inherit module
 DEPENDS +=3D "cryptodev-linux"
=20
 SRC_URI +=3D "file://0001-Disable-installing-header-file-provided-by-anoth=
er-p.patch \
+            file://0001-Fix-build-for-linux-5.10.220.patch \
            "
=20
 EXTRA_OEMAKE=3D'KERNEL_DIR=3D"${STAGING_KERNEL_DIR}" PREFIX=3D"${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-linux-5=
.10.220.patch b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-linu=
x-5.10.220.patch
new file mode 100644
index 0000000000..ebc4058814
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-linux-5.10.220=
.patch
@@ -0,0 +1,32 @@
+From 47f9d88ca5107d1814ecfc7faf6d02d1140978a8 Mon Sep 17 00:00:00 2001
+From: Alexandre Bard <alexandre.bard@netmodule.com>
+Date: Wed, 3 Jul 2024 15:01:22 +0200
+Subject: [PATCH] Fix build for linux 5.10.220
+
+The commit previously integrated is 5.11 has now been backported to
+5.10.y branch.
+
+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dlinux-5.10.y&id=3D1aecdaa7e2c6619a7d2c0a81c8f5c06e52f870f3
+
+Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-li=
nux/commit/157a624d7a892ea5fb2df4bbd4e71c008adbecb7]
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ ioctl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ioctl.c b/ioctl.c
+index 95481d4..11fa27a 100644
+--- a/ioctl.c
++++ b/ioctl.c
+@@ -871,7 +871,7 @@ cryptodev_ioctl(struct file *filp, unsigned int cmd, u=
nsigned long arg_)
+ 		if (unlikely(ret)) {
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 17, 0))
+ 			sys_close(fd);
+-#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 11, 0))
++#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 10, 220))
+ 			ksys_close(fd);
+ #else
+ 			close_fd(fd);
+--=20
+2.46.0
+
--=20
2.43.0


